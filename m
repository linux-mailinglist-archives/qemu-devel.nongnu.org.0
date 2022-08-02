Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A4658778D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 09:10:48 +0200 (CEST)
Received: from localhost ([::1]:40256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIm3D-0003MM-5X
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 03:10:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oIlZ7-00043V-HC
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 02:39:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oIlZ5-0006CC-RV
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 02:39:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659422379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HECFGisbQQcbT4PmmaGdUPkuChGDj0eKtg2geSd4FNc=;
 b=WVdoSWfXgx/3uwmTnW8JwGSZ+sEBULhJdHffzcws4YD9pPMSG3kg1V+VVTQFPA9vzq6B50
 KQY7U46R86UEFaegkX6KVaGoUOV4tA0GjCGJ69HKX5IuYbnGPDGPW/LZwMQ/D1V1wm1jbu
 /6CX28Q21PJH1yu1A+IQ/b6XLdI8fTI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-TxUv4O5wPWupoZK2IAxxkw-1; Tue, 02 Aug 2022 02:39:36 -0400
X-MC-Unique: TxUv4O5wPWupoZK2IAxxkw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E728C3803903;
 Tue,  2 Aug 2022 06:39:35 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.136])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 14323492CA2;
 Tue,  2 Aug 2022 06:39:33 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Peter Xu <peterx@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v7 12/12] So we use multifd to transmit zero pages.
Date: Tue,  2 Aug 2022 08:39:07 +0200
Message-Id: <20220802063907.18882-13-quintela@redhat.com>
In-Reply-To: <20220802063907.18882-1-quintela@redhat.com>
References: <20220802063907.18882-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>

---

- Check zero_page property before using new code (Dave)
---
 migration/migration.c |  4 +---
 migration/multifd.c   |  6 +++---
 migration/ram.c       | 33 ++++++++++++++++++++++++++++++++-
 3 files changed, 36 insertions(+), 7 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index ce3e5cc0cd..13842f6803 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2599,9 +2599,7 @@ bool migrate_use_main_zero_page(void)
 
     s = migrate_get_current();
 
-    // We will enable this when we add the right code.
-    // return s->enabled_capabilities[MIGRATION_CAPABILITY_MAIN_ZERO_PAGE];
-    return true;
+    return s->enabled_capabilities[MIGRATION_CAPABILITY_MAIN_ZERO_PAGE];
 }
 
 bool migrate_pause_before_switchover(void)
diff --git a/migration/multifd.c b/migration/multifd.c
index 89811619d8..54acdc004c 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -667,8 +667,8 @@ static void *multifd_send_thread(void *opaque)
 {
     MultiFDSendParams *p = opaque;
     Error *local_err = NULL;
-    /* qemu older than 7.0 don't understand zero page on multifd channel */
-    bool use_zero_page = migrate_use_multifd_zero_page();
+    /* older qemu don't understand zero page on multifd channel */
+    bool use_multifd_zero_page = !migrate_use_main_zero_page();
     int ret = 0;
     bool use_zero_copy_send = migrate_use_zero_copy_send();
 
@@ -711,7 +711,7 @@ static void *multifd_send_thread(void *opaque)
 
             for (int i = 0; i < p->pages->num; i++) {
                 uint64_t offset = p->pages->offset[i];
-                if (use_zero_page &&
+                if (use_multifd_zero_page &&
                     buffer_is_zero(rb->host + offset, p->page_size)) {
                     p->zero[p->zero_num] = offset;
                     p->zero_num++;
diff --git a/migration/ram.c b/migration/ram.c
index 2af70f517a..26e60b9cc1 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2428,6 +2428,32 @@ static void postcopy_preempt_reset_channel(RAMState *rs)
     }
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
+    int res;
+
+    if (!migration_in_postcopy()) {
+        return ram_save_multifd_page(rs, block, offset);
+    }
+
+    res = save_zero_page(rs, block, offset);
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
@@ -3225,7 +3251,12 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
     ram_control_before_iterate(f, RAM_CONTROL_SETUP);
     ram_control_after_iterate(f, RAM_CONTROL_SETUP);
 
-    (*rsp)->ram_save_target_page = ram_save_target_page_legacy;
+    if (migrate_use_multifd() && !migrate_use_main_zero_page()) {
+        (*rsp)->ram_save_target_page = ram_save_target_page_multifd;
+    } else {
+        (*rsp)->ram_save_target_page = ram_save_target_page_legacy;
+    }
+
     ret =  multifd_send_sync_main(f);
     if (ret < 0) {
         return ret;
-- 
2.37.1


