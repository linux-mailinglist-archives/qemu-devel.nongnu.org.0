Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 817C76F1E9C
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 21:13:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psTWQ-0004wI-UE; Fri, 28 Apr 2023 15:12:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psTWP-0004w4-Cf
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 15:12:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psTWN-00032B-PT
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 15:12:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682709162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BZNrAx/yY1mGvZnXcB5fz0XHo3uEWqvLNFcOkMtbtbg=;
 b=Mxn5akFM5SsvRDi6JQ/I6/Id0ACEu0P7oWdMeBaLykHT/X3qLHkt9D4fAAb2lJ0bI2T17s
 ErOykNbVST9IOykdR2NP57GcPy6CvY9Yn41OTn3BlsmQoeEqZyNpF36QqgYDUKkmyqnXw2
 wxFLxMUwcU/6aMMuHvsAZN6X7/sfOhQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-TE7FmrVZPRmHRkV3Vh9jYQ-1; Fri, 28 Apr 2023 15:12:38 -0400
X-MC-Unique: TE7FmrVZPRmHRkV3Vh9jYQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E4098314E9;
 Fri, 28 Apr 2023 19:12:38 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3CCDB2166B4F;
 Fri, 28 Apr 2023 19:12:37 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras <leobras@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 Lukas Straub <lukasstraub2@web.de>
Subject: [PULL 19/21] ram compress: Assert that the file buffer matches the
 result
Date: Fri, 28 Apr 2023 21:12:01 +0200
Message-Id: <20230428191203.39520-20-quintela@redhat.com>
In-Reply-To: <20230428191203.39520-1-quintela@redhat.com>
References: <20230428191203.39520-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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

Before this series, "nothing to send" was handled by the file buffer
being empty. Now it is tracked via param->result.

Assert that the file buffer state matches the result.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/qemu-file.c    | 11 +++++++++++
 migration/qemu-file.h    |  1 +
 migration/ram-compress.c |  5 +++++
 migration/ram.c          |  2 ++
 4 files changed, 19 insertions(+)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index ee04240a21..9c1ef8e3f9 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -887,6 +887,17 @@ int qemu_put_qemu_file(QEMUFile *f_des, QEMUFile *f_src)
     return len;
 }
 
+/*
+ * Check if the writable buffer is empty
+ */
+
+bool qemu_file_buffer_empty(QEMUFile *file)
+{
+    assert(qemu_file_is_writable(file));
+
+    return !file->iovcnt;
+}
+
 /*
  * Get a string whose length is determined by a single preceding byte
  * A preallocated 256 byte buffer must be passed in.
diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index d16cd50448..c2d6086a6e 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -113,6 +113,7 @@ size_t coroutine_mixed_fn qemu_get_buffer_in_place(QEMUFile *f, uint8_t **buf, s
 ssize_t qemu_put_compression_data(QEMUFile *f, z_stream *stream,
                                   const uint8_t *p, size_t size);
 int qemu_put_qemu_file(QEMUFile *f_des, QEMUFile *f_src);
+bool qemu_file_buffer_empty(QEMUFile *file);
 
 /*
  * Note that you can only peek continuous bytes from where the current pointer
diff --git a/migration/ram-compress.c b/migration/ram-compress.c
index c25562f12d..3d2a4a6329 100644
--- a/migration/ram-compress.c
+++ b/migration/ram-compress.c
@@ -194,6 +194,8 @@ static CompressResult do_compress_ram_page(QEMUFile *f, z_stream *stream,
     uint8_t *p = block->host + offset;
     int ret;
 
+    assert(qemu_file_buffer_empty(f));
+
     if (buffer_is_zero(p, TARGET_PAGE_SIZE)) {
         return RES_ZEROPAGE;
     }
@@ -208,6 +210,7 @@ static CompressResult do_compress_ram_page(QEMUFile *f, z_stream *stream,
     if (ret < 0) {
         qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
         error_report("compressed data failed!");
+        qemu_fflush(f);
         return RES_NONE;
     }
     return RES_COMPRESS;
@@ -239,6 +242,7 @@ void flush_compressed_data(int (send_queued_data(CompressParam *)))
         if (!comp_param[idx].quit) {
             CompressParam *param = &comp_param[idx];
             send_queued_data(param);
+            assert(qemu_file_buffer_empty(param->file));
             compress_reset_result(param);
         }
         qemu_mutex_unlock(&comp_param[idx].mutex);
@@ -268,6 +272,7 @@ retry:
             qemu_mutex_lock(&param->mutex);
             param->done = false;
             send_queued_data(param);
+            assert(qemu_file_buffer_empty(param->file));
             compress_reset_result(param);
             set_compress_params(param, block, offset);
 
diff --git a/migration/ram.c b/migration/ram.c
index 250cb01099..a5bd943cc6 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1321,11 +1321,13 @@ static int send_queued_data(CompressParam *param)
     assert(block == pss->last_sent_block);
 
     if (param->result == RES_ZEROPAGE) {
+        assert(qemu_file_buffer_empty(param->file));
         len += save_page_header(pss, file, block, offset | RAM_SAVE_FLAG_ZERO);
         qemu_put_byte(file, 0);
         len += 1;
         ram_release_page(block->idstr, offset);
     } else if (param->result == RES_COMPRESS) {
+        assert(!qemu_file_buffer_empty(param->file));
         len += save_page_header(pss, file, block,
                                 offset | RAM_SAVE_FLAG_COMPRESS_PAGE);
         len += qemu_put_qemu_file(file, param->file);
-- 
2.40.0


