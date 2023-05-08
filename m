Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 241FC6FB676
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 20:53:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw5yB-0004AL-JH; Mon, 08 May 2023 14:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pw5y9-0004A6-GE
 for qemu-devel@nongnu.org; Mon, 08 May 2023 14:52:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pw5y6-0005xe-Tj
 for qemu-devel@nongnu.org; Mon, 08 May 2023 14:52:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683571938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SNQZqH/V5/yjuWgzsCvXimxX0HrZV6tqFOd/0HJYxGs=;
 b=U9WyXPd7l+mMzRK6AKencsSLLbfRYMckjpeuibkSXMri6xSUL7nfdxIas1XdATxDo0uc3S
 6cNYk5gEe50bKlsEaBvbTKlLaRLiXoPWjacCS3sanaE/ZdmBfz/JFydnoIRnm5e1s0OAjO
 l5nVyY+F8N88WFmCVgWJVzhWjtVxaTA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-NyS4odxJMyKlZha5AdvsnA-1; Mon, 08 May 2023 14:52:16 -0400
X-MC-Unique: NyS4odxJMyKlZha5AdvsnA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 943851C27D86;
 Mon,  8 May 2023 18:52:16 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 46D2214171BC;
 Mon,  8 May 2023 18:52:15 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Lukas Straub <lukasstraub2@web.de>
Subject: [PULL 03/13] ram.c: Let the compress threads return a CompressResult
 enum
Date: Mon,  8 May 2023 20:51:59 +0200
Message-Id: <20230508185209.68604-4-quintela@redhat.com>
In-Reply-To: <20230508185209.68604-1-quintela@redhat.com>
References: <20230508185209.68604-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Lukas Straub <lukasstraub2@web.de>

This will be used in the next commits to move save_page_header()
out of compress code.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 5e7bf20ca5..7bc05fc034 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -482,10 +482,17 @@ MigrationOps *migration_ops;
 
 CompressionStats compression_counters;
 
+enum CompressResult {
+    RES_NONE = 0,
+    RES_ZEROPAGE = 1,
+    RES_COMPRESS = 2
+};
+typedef enum CompressResult CompressResult;
+
 struct CompressParam {
     bool done;
     bool quit;
-    bool zero_page;
+    CompressResult result;
     QEMUFile *file;
     QemuMutex mutex;
     QemuCond cond;
@@ -527,8 +534,9 @@ static QemuCond decomp_done_cond;
 
 static int ram_save_host_page_urgent(PageSearchStatus *pss);
 
-static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
-                                 ram_addr_t offset, uint8_t *source_buf);
+static CompressResult do_compress_ram_page(QEMUFile *f, z_stream *stream,
+                                           RAMBlock *block, ram_addr_t offset,
+                                           uint8_t *source_buf);
 
 /* NOTE: page is the PFN not real ram_addr_t. */
 static void pss_init(PageSearchStatus *pss, RAMBlock *rb, ram_addr_t page)
@@ -553,7 +561,7 @@ static void *do_data_compress(void *opaque)
     CompressParam *param = opaque;
     RAMBlock *block;
     ram_addr_t offset;
-    bool zero_page;
+    CompressResult result;
 
     qemu_mutex_lock(&param->mutex);
     while (!param->quit) {
@@ -563,12 +571,12 @@ static void *do_data_compress(void *opaque)
             param->block = NULL;
             qemu_mutex_unlock(&param->mutex);
 
-            zero_page = do_compress_ram_page(param->file, &param->stream,
-                                             block, offset, param->originbuf);
+            result = do_compress_ram_page(param->file, &param->stream,
+                                          block, offset, param->originbuf);
 
             qemu_mutex_lock(&comp_done_lock);
             param->done = true;
-            param->zero_page = zero_page;
+            param->result = result;
             qemu_cond_signal(&comp_done_cond);
             qemu_mutex_unlock(&comp_done_lock);
 
@@ -1452,8 +1460,9 @@ static int ram_save_multifd_page(QEMUFile *file, RAMBlock *block,
     return 1;
 }
 
-static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
-                                 ram_addr_t offset, uint8_t *source_buf)
+static CompressResult do_compress_ram_page(QEMUFile *f, z_stream *stream,
+                                           RAMBlock *block, ram_addr_t offset,
+                                           uint8_t *source_buf)
 {
     RAMState *rs = ram_state;
     PageSearchStatus *pss = &rs->pss[RAM_CHANNEL_PRECOPY];
@@ -1461,7 +1470,7 @@ static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
     int ret;
 
     if (save_zero_page_to_file(pss, f, block, offset)) {
-        return true;
+        return RES_ZEROPAGE;
     }
 
     save_page_header(pss, f, block, offset | RAM_SAVE_FLAG_COMPRESS_PAGE);
@@ -1476,8 +1485,9 @@ static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
     if (ret < 0) {
         qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
         error_report("compressed data failed!");
+        return RES_NONE;
     }
-    return false;
+    return RES_COMPRESS;
 }
 
 static void
@@ -1485,7 +1495,7 @@ update_compress_thread_counts(const CompressParam *param, int bytes_xmit)
 {
     ram_transferred_add(bytes_xmit);
 
-    if (param->zero_page) {
+    if (param->result == RES_ZEROPAGE) {
         stat64_add(&mig_stats.zero_pages, 1);
         return;
     }
-- 
2.40.0


