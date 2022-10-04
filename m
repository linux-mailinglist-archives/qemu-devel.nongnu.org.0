Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7265F4B0E
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 23:43:39 +0200 (CEST)
Received: from localhost ([::1]:37220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofphS-0008OR-R2
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 17:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <91b7b154298c500d100b05137146c2905c3acdec@lizzy.crudebyte.com>)
 id 1ofpME-00072N-7I
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:21:43 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:42677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <91b7b154298c500d100b05137146c2905c3acdec@lizzy.crudebyte.com>)
 id 1ofpMB-0002gL-GI
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:21:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=mCn9OQoiGj19Bem+bv9rFYl0EMPaS3hg2xQl8kC6GbU=; b=SQoHi
 XzhEjRWJsgBI1oJADPWH9W/Uit/UCH5aISUXoiwI8G/DQYakAmOpGcM1F8VdpVvVrUSmc+ruUHVnH
 2OsUgDrcuQSZlahLpSrkqKNH4v4dnq3v8euSuXiPPpqbpfw65AcT5EcpaYkfbIFkPEjuUbzp1zyX3
 VvLKg+ClMbCGsFow5Im7e8iamcMPHhuCs1TbqHreIFvVmqcpso3wKgocIv6U51wWMjOwdxwZkv1Wk
 9onBR6azAe8Hg57s0vyCnjaesL6NhojjqndgGA7N9fsn7zY6ZnaXJQq0l98NWrLOqhaSWeSM61mZm
 0uoRBxOw0bgo/WeoxfS+Qd79ALjJg==;
Message-Id: <91b7b154298c500d100b05137146c2905c3acdec.1664917004.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1664917004.git.qemu_oss@crudebyte.com>
References: <cover.1664917004.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 4 Oct 2022 22:54:03 +0200
Subject: [PATCH 14/20] tests/9p: convert v9fs_tflush() to declarative arguments
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=91b7b154298c500d100b05137146c2905c3acdec@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Use declarative function arguments for function v9fs_tflush().

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/libqos/virtio-9p-client.c | 23 +++++++++++++++++++----
 tests/qtest/libqos/virtio-9p-client.h | 22 +++++++++++++++++++++-
 tests/qtest/virtio-9p-test.c          |  9 +++++++--
 3 files changed, 47 insertions(+), 7 deletions(-)

diff --git a/tests/qtest/libqos/virtio-9p-client.c b/tests/qtest/libqos/virtio-9p-client.c
index 9ae347fad5..3be0ffc7da 100644
--- a/tests/qtest/libqos/virtio-9p-client.c
+++ b/tests/qtest/libqos/virtio-9p-client.c
@@ -733,14 +733,29 @@ void v9fs_rwrite(P9Req *req, uint32_t *count)
 }
 
 /* size[4] Tflush tag[2] oldtag[2] */
-P9Req *v9fs_tflush(QVirtio9P *v9p, uint16_t oldtag, uint16_t tag)
+TFlushRes v9fs_tflush(TFlushOpt opt)
 {
     P9Req *req;
+    uint32_t err;
 
-    req = v9fs_req_init(v9p,  2, P9_TFLUSH, tag);
-    v9fs_uint32_write(req, oldtag);
+    g_assert(opt.client);
+
+    req = v9fs_req_init(opt.client, 2, P9_TFLUSH, opt.tag);
+    v9fs_uint32_write(req, opt.oldtag);
     v9fs_req_send(req);
-    return req;
+
+    if (!opt.requestOnly) {
+        v9fs_req_wait_for_reply(req, NULL);
+        if (opt.expectErr) {
+            v9fs_rlerror(req, &err);
+            g_assert_cmpint(err, ==, opt.expectErr);
+        } else {
+            v9fs_rflush(req);
+        }
+        req = NULL; /* request was freed */
+    }
+
+    return (TFlushRes) { .req = req };
 }
 
 /* size[4] Rflush tag[2] */
diff --git a/tests/qtest/libqos/virtio-9p-client.h b/tests/qtest/libqos/virtio-9p-client.h
index dda371c054..b22b54c720 100644
--- a/tests/qtest/libqos/virtio-9p-client.h
+++ b/tests/qtest/libqos/virtio-9p-client.h
@@ -267,6 +267,26 @@ typedef struct TWriteRes {
     uint32_t count;
 } TWriteRes;
 
+/* options for 'Tflush' 9p request */
+typedef struct TFlushOpt {
+    /* 9P client being used (mandatory) */
+    QVirtio9P *client;
+    /* user supplied tag number being returned with response (optional) */
+    uint16_t tag;
+    /* message to flush (required) */
+    uint16_t oldtag;
+    /* only send Tflush request but not wait for a reply? (optional) */
+    bool requestOnly;
+    /* do we expect an Rlerror response, if yes which error code? (optional) */
+    uint32_t expectErr;
+} TFlushOpt;
+
+/* result of 'Tflush' 9p request */
+typedef struct TFlushRes {
+    /* if requestOnly was set: request object for further processing */
+    P9Req *req;
+} TFlushRes;
+
 void v9fs_set_allocator(QGuestAllocator *t_alloc);
 void v9fs_memwrite(P9Req *req, const void *addr, size_t len);
 void v9fs_memskip(P9Req *req, size_t len);
@@ -304,7 +324,7 @@ TLOpenRes v9fs_tlopen(TLOpenOpt);
 void v9fs_rlopen(P9Req *req, v9fs_qid *qid, uint32_t *iounit);
 TWriteRes v9fs_twrite(TWriteOpt);
 void v9fs_rwrite(P9Req *req, uint32_t *count);
-P9Req *v9fs_tflush(QVirtio9P *v9p, uint16_t oldtag, uint16_t tag);
+TFlushRes v9fs_tflush(TFlushOpt);
 void v9fs_rflush(P9Req *req);
 P9Req *v9fs_tmkdir(QVirtio9P *v9p, uint32_t dfid, const char *name,
                    uint32_t mode, uint32_t gid, uint16_t tag);
diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 5ad7bebec7..5544998bac 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -23,6 +23,7 @@
 #define treaddir(...) v9fs_treaddir((TReadDirOpt) __VA_ARGS__)
 #define tlopen(...) v9fs_tlopen((TLOpenOpt) __VA_ARGS__)
 #define twrite(...) v9fs_twrite((TWriteOpt) __VA_ARGS__)
+#define tflush(...) v9fs_tflush((TFlushOpt) __VA_ARGS__)
 
 static void pci_config(void *obj, void *data, QGuestAllocator *t_alloc)
 {
@@ -420,7 +421,9 @@ static void fs_flush_success(void *obj, void *data, QGuestAllocator *t_alloc)
         .requestOnly = true
     }).req;
 
-    flush_req = v9fs_tflush(v9p, req->tag, 1);
+    flush_req = tflush({
+        .client = v9p, .oldtag = req->tag, .tag = 1, .requestOnly = true
+    }).req;
 
     /* The write request is supposed to be flushed: the server should just
      * mark the write request as used and reply to the flush request.
@@ -459,7 +462,9 @@ static void fs_flush_ignored(void *obj, void *data, QGuestAllocator *t_alloc)
         .requestOnly = true
     }).req;
 
-    flush_req = v9fs_tflush(v9p, req->tag, 1);
+    flush_req = tflush({
+        .client = v9p, .oldtag = req->tag, .tag = 1, .requestOnly = true
+    }).req;
 
     /* The write request is supposed to complete. The server should
      * reply to the write request and the flush request.
-- 
2.30.2


