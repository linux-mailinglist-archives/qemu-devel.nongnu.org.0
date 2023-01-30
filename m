Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D5568071F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 09:11:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMPFQ-00017x-N0; Mon, 30 Jan 2023 03:10:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMPFO-00014D-Ny
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 03:10:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMPFN-0002Nx-1I
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 03:10:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675066236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WDr0yZWgH492HQiQBW1pbdsWGAijKkarILqKzc5p6lI=;
 b=an3VGeeMIXuPCjYhsp5fhwoNn36gBEL6NblNh/6GE3Y032ZwjQWpY+HGqoWAqslSGdalob
 2kvJrdWDAuR3lUrzHasM7346EPv4Wfo8IQpZWOGhaTu8ccHBNWc7+wXaOInItkzF1RSidi
 cdL1uctbm6/ga4YMM6u4Ijg4aMve9hc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-146-d865x8o0OqC7-ub9PZlnsQ-1; Mon, 30 Jan 2023 03:10:30 -0500
X-MC-Unique: d865x8o0OqC7-ub9PZlnsQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF1871871D94;
 Mon, 30 Jan 2023 08:10:29 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7001440C2064;
 Mon, 30 Jan 2023 08:10:28 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v2 11/11] So we use multifd to transmit zero pages.
Date: Mon, 30 Jan 2023 09:09:56 +0100
Message-Id: <20230130080956.3047-12-quintela@redhat.com>
In-Reply-To: <20230130080956.3047-1-quintela@redhat.com>
References: <20230130080956.3047-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Juan Quintela <quintela@redhat.com>

---

- Check zero_page property before using new code (Dave)
---
 migration/migration.c |  3 +--
 migration/ram.c       | 32 +++++++++++++++++++++++++++++++-
 2 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index ab86c6601d..6293dee983 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2608,8 +2608,7 @@ bool migrate_use_main_zero_page(void)
 {
     MigrationState *s = migrate_get_current();
 
-    /* We will enable this when we add the right code. */
-    return true || s->enabled_capabilities[MIGRATION_CAPABILITY_MAIN_ZERO_PAGE];
+    return s->enabled_capabilities[MIGRATION_CAPABILITY_MAIN_ZERO_PAGE];
 }
 
 bool migrate_pause_before_switchover(void)
diff --git a/migration/ram.c b/migration/ram.c
index c70cc25169..d375f2ccde 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2421,6 +2421,31 @@ out:
     return ret;
 }
 
+/**
+ * ram_save_target_page_multifd: save one target page
+ *
+ * Returns the number of pages written
+ *
+ * @rs: current RAM state
+ * @pss: data about the page we want to send
+ */
+static int ram_save_target_page_multifd(RAMState *rs, PageSearchStatus *pss)
+{
+    RAMBlock *block = pss->block;
+    ram_addr_t offset = ((ram_addr_t)pss->page) << TARGET_PAGE_BITS;
+
+    if (!migration_in_postcopy()) {
+        return ram_save_multifd_page(pss->pss_channel, block, offset);
+    }
+
+    int res = save_zero_page(pss, block, offset);
+    if (res > 0) {
+        return res;
+    }
+
+    return ram_save_page(rs, pss);
+}
+
 /**
  * ram_save_host_page: save a whole host page
  *
@@ -3223,7 +3248,12 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
     ram_control_after_iterate(f, RAM_CONTROL_SETUP);
 
     migration_ops = g_malloc0(sizeof(MigrationOps));
-    migration_ops->ram_save_target_page = ram_save_target_page_legacy;
+    if (migrate_use_multifd() && !migrate_use_main_zero_page()) {
+        migration_ops->ram_save_target_page = ram_save_target_page_multifd;
+    } else {
+        migration_ops->ram_save_target_page = ram_save_target_page_legacy;
+    }
+
     ret =  multifd_send_sync_main(f);
     if (ret < 0) {
         return ret;
-- 
2.39.1


