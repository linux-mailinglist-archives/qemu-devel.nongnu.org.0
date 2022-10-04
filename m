Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C91E5F4B07
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 23:38:13 +0200 (CEST)
Received: from localhost ([::1]:55460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofpcB-000162-UG
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 17:38:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <be0326e2d9ab66f68c06b1766ddf103849d570b4@lizzy.crudebyte.com>)
 id 1ofpLz-0006Yo-Uq
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:21:30 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:37515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <be0326e2d9ab66f68c06b1766ddf103849d570b4@lizzy.crudebyte.com>)
 id 1ofpLx-0002d3-RQ
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:21:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=SVf+oYt3l3p/LFktrYdUrJA/tAxtu+lowixQuIDBesI=; b=YSN1r
 UgGBMR52LAwSIn9OTzSgO2Wd2B2IHamt8sTBT02q8nmFKpH/9Gbf3tA6CScJYOxmjuKUArFPDHR2c
 137gjJK2ATyPEfjHam0Su1ARPG59g8WcKDqDnFn66lNHumdDym1YUTKkNLjBf1R+8ne2uHyG15wat
 en3f0t4ysRnnP/JT2ZbNfxJlchYZxpkBlGyWs2BEAiwih3sifP5eTDgb8Qd4o4H1bzGJDqK/hLqLe
 IqwG+J7uk8yCk27JQiAMmcmnhQOsaZLzRkPoATXKlWVZP7NbK5mi6sL6Akcxeuy7bBl1UqbnZP4Fw
 +/dZMY1ZzmNH+PTuiWDpNTCwCJ8YA==;
Message-Id: <be0326e2d9ab66f68c06b1766ddf103849d570b4.1664917004.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1664917004.git.qemu_oss@crudebyte.com>
References: <cover.1664917004.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 4 Oct 2022 22:53:58 +0200
Subject: [PATCH 12/20] tests/9p: convert v9fs_twrite() to declarative arguments
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=be0326e2d9ab66f68c06b1766ddf103849d570b4@lizzy.crudebyte.com;
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

Use declarative function arguments for function v9fs_twrite().

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/libqos/virtio-9p-client.c | 38 ++++++++++++++++++++-------
 tests/qtest/libqos/virtio-9p-client.h | 31 ++++++++++++++++++++--
 tests/qtest/virtio-9p-test.c          | 18 ++++++++++---
 3 files changed, 72 insertions(+), 15 deletions(-)

diff --git a/tests/qtest/libqos/virtio-9p-client.c b/tests/qtest/libqos/virtio-9p-client.c
index 15fde54d63..9ae347fad5 100644
--- a/tests/qtest/libqos/virtio-9p-client.c
+++ b/tests/qtest/libqos/virtio-9p-client.c
@@ -687,21 +687,39 @@ void v9fs_rlopen(P9Req *req, v9fs_qid *qid, uint32_t *iounit)
 }
 
 /* size[4] Twrite tag[2] fid[4] offset[8] count[4] data[count] */
-P9Req *v9fs_twrite(QVirtio9P *v9p, uint32_t fid, uint64_t offset,
-                   uint32_t count, const void *data, uint16_t tag)
+TWriteRes v9fs_twrite(TWriteOpt opt)
 {
     P9Req *req;
+    uint32_t err;
     uint32_t body_size = 4 + 8 + 4;
+    uint32_t written = 0;
 
-    g_assert_cmpint(body_size, <=, UINT32_MAX - count);
-    body_size += count;
-    req = v9fs_req_init(v9p,  body_size, P9_TWRITE, tag);
-    v9fs_uint32_write(req, fid);
-    v9fs_uint64_write(req, offset);
-    v9fs_uint32_write(req, count);
-    v9fs_memwrite(req, data, count);
+    g_assert(opt.client);
+
+    g_assert_cmpint(body_size, <=, UINT32_MAX - opt.count);
+    body_size += opt.count;
+    req = v9fs_req_init(opt.client, body_size, P9_TWRITE, opt.tag);
+    v9fs_uint32_write(req, opt.fid);
+    v9fs_uint64_write(req, opt.offset);
+    v9fs_uint32_write(req, opt.count);
+    v9fs_memwrite(req, opt.data, opt.count);
     v9fs_req_send(req);
-    return req;
+
+    if (!opt.requestOnly) {
+        v9fs_req_wait_for_reply(req, NULL);
+        if (opt.expectErr) {
+            v9fs_rlerror(req, &err);
+            g_assert_cmpint(err, ==, opt.expectErr);
+        } else {
+            v9fs_rwrite(req, &written);
+        }
+        req = NULL; /* request was freed */
+    }
+
+    return (TWriteRes) {
+        .req = req,
+        .count = written
+    };
 }
 
 /* size[4] Rwrite tag[2] count[4] */
diff --git a/tests/qtest/libqos/virtio-9p-client.h b/tests/qtest/libqos/virtio-9p-client.h
index 3b70aef51e..dda371c054 100644
--- a/tests/qtest/libqos/virtio-9p-client.h
+++ b/tests/qtest/libqos/virtio-9p-client.h
@@ -239,6 +239,34 @@ typedef struct TLOpenRes {
     P9Req *req;
 } TLOpenRes;
 
+/* options for 'Twrite' 9p request */
+typedef struct TWriteOpt {
+    /* 9P client being used (mandatory) */
+    QVirtio9P *client;
+    /* user supplied tag number being returned with response (optional) */
+    uint16_t tag;
+    /* file ID of file to write to (required) */
+    uint32_t fid;
+    /* start position of write from beginning of file (optional) */
+    uint64_t offset;
+    /* how many bytes to write */
+    uint32_t count;
+    /* data to be written */
+    const void *data;
+    /* only send Twrite request but not wait for a reply? (optional) */
+    bool requestOnly;
+    /* do we expect an Rlerror response, if yes which error code? (optional) */
+    uint32_t expectErr;
+} TWriteOpt;
+
+/* result of 'Twrite' 9p request */
+typedef struct TWriteRes {
+    /* if requestOnly was set: request object for further processing */
+    P9Req *req;
+    /* amount of bytes written */
+    uint32_t count;
+} TWriteRes;
+
 void v9fs_set_allocator(QGuestAllocator *t_alloc);
 void v9fs_memwrite(P9Req *req, const void *addr, size_t len);
 void v9fs_memskip(P9Req *req, size_t len);
@@ -274,8 +302,7 @@ void v9fs_rreaddir(P9Req *req, uint32_t *count, uint32_t *nentries,
 void v9fs_free_dirents(struct V9fsDirent *e);
 TLOpenRes v9fs_tlopen(TLOpenOpt);
 void v9fs_rlopen(P9Req *req, v9fs_qid *qid, uint32_t *iounit);
-P9Req *v9fs_twrite(QVirtio9P *v9p, uint32_t fid, uint64_t offset,
-                   uint32_t count, const void *data, uint16_t tag);
+TWriteRes v9fs_twrite(TWriteOpt);
 void v9fs_rwrite(P9Req *req, uint32_t *count);
 P9Req *v9fs_tflush(QVirtio9P *v9p, uint16_t oldtag, uint16_t tag);
 void v9fs_rflush(P9Req *req);
diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 60a030b877..a5b9284acb 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -22,6 +22,7 @@
 #define tgetattr(...) v9fs_tgetattr((TGetAttrOpt) __VA_ARGS__)
 #define treaddir(...) v9fs_treaddir((TReadDirOpt) __VA_ARGS__)
 #define tlopen(...) v9fs_tlopen((TLOpenOpt) __VA_ARGS__)
+#define twrite(...) v9fs_twrite((TWriteOpt) __VA_ARGS__)
 
 static void pci_config(void *obj, void *data, QGuestAllocator *t_alloc)
 {
@@ -385,7 +386,10 @@ static void fs_write(void *obj, void *data, QGuestAllocator *t_alloc)
 
     tlopen({ .client = v9p, .fid = 1, .flags = O_WRONLY });
 
-    req = v9fs_twrite(v9p, 1, 0, write_count, buf, 0);
+    req = twrite({
+        .client = v9p, .fid = 1, .offset = 0, .count = write_count,
+        .data = buf, .requestOnly = true
+    }).req;
     v9fs_req_wait_for_reply(req, NULL);
     v9fs_rwrite(req, &count);
     g_assert_cmpint(count, ==, write_count);
@@ -413,7 +417,11 @@ static void fs_flush_success(void *obj, void *data, QGuestAllocator *t_alloc)
      * until the write request gets cancelled.
      */
     should_block = 1;
-    req = v9fs_twrite(v9p, 1, 0, sizeof(should_block), &should_block, 0);
+    req = twrite({
+        .client = v9p, .fid = 1, .offset = 0,
+        .count = sizeof(should_block), .data = &should_block,
+        .requestOnly = true
+    }).req;
 
     flush_req = v9fs_tflush(v9p, req->tag, 1);
 
@@ -448,7 +456,11 @@ static void fs_flush_ignored(void *obj, void *data, QGuestAllocator *t_alloc)
      * could be actually cancelled.
      */
     should_block = 0;
-    req = v9fs_twrite(v9p, 1, 0, sizeof(should_block), &should_block, 0);
+    req = twrite({
+        .client = v9p, .fid = 1, .offset = 0,
+        .count = sizeof(should_block), .data = &should_block,
+        .requestOnly = true
+    }).req;
 
     flush_req = v9fs_tflush(v9p, req->tag, 1);
 
-- 
2.30.2


