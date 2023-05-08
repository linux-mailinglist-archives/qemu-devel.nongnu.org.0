Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5E66FB67B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 20:54:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw5yc-0004MC-8I; Mon, 08 May 2023 14:52:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pw5yS-0004Iz-Uf
 for qemu-devel@nongnu.org; Mon, 08 May 2023 14:52:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pw5yR-000638-BC
 for qemu-devel@nongnu.org; Mon, 08 May 2023 14:52:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683571958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cqRiOcVsnq1dkPr7YEiysrQqEMeOB41ddSA57KdHrJY=;
 b=VvnlJjh+dtbsX79MBDM8u3UGkdXwwOfj2uufUHgEyEkOo6Pvb2iNRd+HPreGjiVkP9/ybj
 pgQ825CNiifOzWsotGdPqS657zBIOTQDoFn3zfAFhoZta8/G4BjYKkMM88xXenQIH07c9z
 A7cUHPOb3v87ObeagqynZMGZ3mFZsQI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-35MERcOMMzG73romOL-zBQ-1; Mon, 08 May 2023 14:52:34 -0400
X-MC-Unique: 35MERcOMMzG73romOL-zBQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5198488D022;
 Mon,  8 May 2023 18:52:31 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D91FB14171BC;
 Mon,  8 May 2023 18:52:29 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Lukas Straub <lukasstraub2@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 12/13] ram-compress.c: Make target independent
Date: Mon,  8 May 2023 20:52:08 +0200
Message-Id: <20230508185209.68604-13-quintela@redhat.com>
In-Reply-To: <20230508185209.68604-1-quintela@redhat.com>
References: <20230508185209.68604-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Lukas Straub <lukasstraub2@web.de>

Make ram-compress.c target independent.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/meson.build    |  3 ++-
 migration/ram-compress.c | 17 ++++++++++-------
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/migration/meson.build b/migration/meson.build
index 2090af8e85..75de868bb7 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -23,6 +23,8 @@ softmmu_ss.add(files(
   'migration.c',
   'multifd.c',
   'multifd-zlib.c',
+  'multifd-zlib.c',
+  'ram-compress.c',
   'options.c',
   'postcopy-ram.c',
   'savevm.c',
@@ -40,5 +42,4 @@ softmmu_ss.add(when: zstd, if_true: files('multifd-zstd.c'))
 specific_ss.add(when: 'CONFIG_SOFTMMU',
                 if_true: files('dirtyrate.c',
                                'ram.c',
-                               'ram-compress.c',
                                'target.c'))
diff --git a/migration/ram-compress.c b/migration/ram-compress.c
index 3d2a4a6329..06254d8c69 100644
--- a/migration/ram-compress.c
+++ b/migration/ram-compress.c
@@ -35,7 +35,8 @@
 #include "migration.h"
 #include "options.h"
 #include "io/channel-null.h"
-#include "exec/ram_addr.h"
+#include "exec/target_page.h"
+#include "exec/ramblock.h"
 
 CompressionStats compression_counters;
 
@@ -156,7 +157,7 @@ int compress_threads_save_setup(void)
     qemu_cond_init(&comp_done_cond);
     qemu_mutex_init(&comp_done_lock);
     for (i = 0; i < thread_count; i++) {
-        comp_param[i].originbuf = g_try_malloc(TARGET_PAGE_SIZE);
+        comp_param[i].originbuf = g_try_malloc(qemu_target_page_size());
         if (!comp_param[i].originbuf) {
             goto exit;
         }
@@ -192,11 +193,12 @@ static CompressResult do_compress_ram_page(QEMUFile *f, z_stream *stream,
                                            uint8_t *source_buf)
 {
     uint8_t *p = block->host + offset;
+    size_t page_size = qemu_target_page_size();
     int ret;
 
     assert(qemu_file_buffer_empty(f));
 
-    if (buffer_is_zero(p, TARGET_PAGE_SIZE)) {
+    if (buffer_is_zero(p, page_size)) {
         return RES_ZEROPAGE;
     }
 
@@ -205,8 +207,8 @@ static CompressResult do_compress_ram_page(QEMUFile *f, z_stream *stream,
      * so that we can catch up the error during compression and
      * decompression
      */
-    memcpy(source_buf, p, TARGET_PAGE_SIZE);
-    ret = qemu_put_compression_data(f, stream, source_buf, TARGET_PAGE_SIZE);
+    memcpy(source_buf, p, page_size);
+    ret = qemu_put_compression_data(f, stream, source_buf, page_size);
     if (ret < 0) {
         qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
         error_report("compressed data failed!");
@@ -336,7 +338,7 @@ static void *do_data_decompress(void *opaque)
             param->des = 0;
             qemu_mutex_unlock(&param->mutex);
 
-            pagesize = TARGET_PAGE_SIZE;
+            pagesize = qemu_target_page_size();
 
             ret = qemu_uncompress_data(&param->stream, des, pagesize,
                                        param->compbuf, len);
@@ -439,7 +441,8 @@ int compress_threads_load_setup(QEMUFile *f)
             goto exit;
         }
 
-        decomp_param[i].compbuf = g_malloc0(compressBound(TARGET_PAGE_SIZE));
+        size_t compbuf_size = compressBound(qemu_target_page_size());
+        decomp_param[i].compbuf = g_malloc0(compbuf_size);
         qemu_mutex_init(&decomp_param[i].mutex);
         qemu_cond_init(&decomp_param[i].cond);
         decomp_param[i].done = true;
-- 
2.40.0


