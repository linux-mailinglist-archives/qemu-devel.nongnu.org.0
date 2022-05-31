Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6E0538F7E
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 13:14:14 +0200 (CEST)
Received: from localhost ([::1]:51496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvzpF-0007s5-99
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 07:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nvzM3-0004DT-W8
 for qemu-devel@nongnu.org; Tue, 31 May 2022 06:44:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nvzM2-0004hs-Cw
 for qemu-devel@nongnu.org; Tue, 31 May 2022 06:44:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653993841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IzwhjLoqScc49CkenZZj/4FIwnFGKi7Ccd80ETn04LQ=;
 b=fRYrLgli8f7iakozXgLoEDvorQQp7f5L6n3bq7XtepTD0xnf3k7UC7I8f1+2Qp02zMmNWi
 UbYpbDzrIEKjVAg1hLSsoK8lWeWTS8WIVBCTrCLzW9n1cSrDPbEcsJP+YS899VkmMrtGV3
 X1ig72qmM376E1SsH7uxxvJj1I4E3ZU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-213-fuj6YzJFNFmeFjPwNHGQAQ-1; Tue, 31 May 2022 06:43:51 -0400
X-MC-Unique: fuj6YzJFNFmeFjPwNHGQAQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9506185A5BC;
 Tue, 31 May 2022 10:43:50 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA10C1131A;
 Tue, 31 May 2022 10:43:48 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Peter Xu <peterx@redhat.com>, Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v7 13/13] migration: Use multifd before we check for the zero
 page
Date: Tue, 31 May 2022 12:43:18 +0200
Message-Id: <20220531104318.7494-14-quintela@redhat.com>
In-Reply-To: <20220531104318.7494-1-quintela@redhat.com>
References: <20220531104318.7494-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

So we use multifd to transmit zero pages.

Signed-off-by: Juan Quintela <quintela@redhat.com>

---

- Check zero_page property before using new code (Dave)
---
 migration/ram.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index 7ceef7976b..f9959262fa 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2181,6 +2181,32 @@ static int ram_save_target_page_legacy(RAMState *rs, PageSearchStatus *pss)
     return ram_save_page(rs, pss);
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
@@ -2945,7 +2971,12 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
     ram_control_before_iterate(f, RAM_CONTROL_SETUP);
     ram_control_after_iterate(f, RAM_CONTROL_SETUP);
 
-    (*rsp)->ram_save_target_page = ram_save_target_page_legacy;
+    if (migrate_use_multifd() && migrate_use_multifd_zero_page()) {
+        (*rsp)->ram_save_target_page = ram_save_target_page_multifd;
+    } else {
+        (*rsp)->ram_save_target_page = ram_save_target_page_legacy;
+    }
+
     ret =  multifd_send_sync_main(f);
     if (ret < 0) {
         return ret;
-- 
2.35.3


