Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A987F5F4B04
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 23:37:25 +0200 (CEST)
Received: from localhost ([::1]:42486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofpbQ-0000CY-4R
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 17:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <765ab515353c56f88f0a163631f626a44e9565d6@lizzy.crudebyte.com>)
 id 1ofpLr-0006Qf-4R
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:21:19 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:43379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <765ab515353c56f88f0a163631f626a44e9565d6@lizzy.crudebyte.com>)
 id 1ofpLm-0002Xy-3e
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:21:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=i0w2g9Byfz1BsGSKTqMfbBLzWPKISsiW9dpP14uYURA=; b=WwmOb
 JTk7yyPKZtiALnnc/IQmBOfIH9wLnXX6JPvWRrhlzoID+20rigWj8cYKnwPOxa4ZOH3PQpfBf+TOl
 MS8/nqAUqLtubIjvP+qz2XQJgjc2fCMXuABrC02kWNDEiahFcN7L/+W3rrh6YaMpWlZvId1aAWikN
 eRXyRNeooU2C7R/gtBS76jQi9gvx/mDrwumcvxI6TDYpssKhMrpYfgaLknCmiq+zNcFdDZr4uvrpG
 F8ZwZfyX4NoeBj1H9aP8ipYqyThPFMY/ZgLAmlqMudR2uWXVbzV2rNRrxBnEM6KbM4hDkJ6QJsMzo
 xj3diylRMga7VeqJEIC2EpbbszI+g==;
Message-Id: <765ab515353c56f88f0a163631f626a44e9565d6.1664917004.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1664917004.git.qemu_oss@crudebyte.com>
References: <cover.1664917004.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 4 Oct 2022 22:53:52 +0200
Subject: [PATCH 10/20] tests/9p: convert v9fs_tlopen() to declarative arguments
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=765ab515353c56f88f0a163631f626a44e9565d6@lizzy.crudebyte.com;
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

Use declarative function arguments for function v9fs_tlopen().

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/libqos/virtio-9p-client.c | 28 +++++++++++++++++++------
 tests/qtest/libqos/virtio-9p-client.h | 30 +++++++++++++++++++++++++--
 tests/qtest/virtio-9p-test.c          | 25 ++++++++++++++++------
 3 files changed, 69 insertions(+), 14 deletions(-)

diff --git a/tests/qtest/libqos/virtio-9p-client.c b/tests/qtest/libqos/virtio-9p-client.c
index 047c8993b6..15fde54d63 100644
--- a/tests/qtest/libqos/virtio-9p-client.c
+++ b/tests/qtest/libqos/virtio-9p-client.c
@@ -643,16 +643,32 @@ void v9fs_free_dirents(struct V9fsDirent *e)
 }
 
 /* size[4] Tlopen tag[2] fid[4] flags[4] */
-P9Req *v9fs_tlopen(QVirtio9P *v9p, uint32_t fid, uint32_t flags,
-                   uint16_t tag)
+TLOpenRes v9fs_tlopen(TLOpenOpt opt)
 {
     P9Req *req;
+    uint32_t err;
 
-    req = v9fs_req_init(v9p,  4 + 4, P9_TLOPEN, tag);
-    v9fs_uint32_write(req, fid);
-    v9fs_uint32_write(req, flags);
+    g_assert(opt.client);
+    /* expecting either Rlopen or Rlerror, but obviously not both */
+    g_assert(!opt.expectErr || !(opt.rlopen.qid || opt.rlopen.iounit));
+
+    req = v9fs_req_init(opt.client,  4 + 4, P9_TLOPEN, opt.tag);
+    v9fs_uint32_write(req, opt.fid);
+    v9fs_uint32_write(req, opt.flags);
     v9fs_req_send(req);
-    return req;
+
+    if (!opt.requestOnly) {
+        v9fs_req_wait_for_reply(req, NULL);
+        if (opt.expectErr) {
+            v9fs_rlerror(req, &err);
+            g_assert_cmpint(err, ==, opt.expectErr);
+        } else {
+            v9fs_rlopen(req, opt.rlopen.qid, opt.rlopen.iounit);
+        }
+        req = NULL; /* request was freed */
+    }
+
+    return (TLOpenRes) { .req = req };
 }
 
 /* size[4] Rlopen tag[2] qid[13] iounit[4] */
diff --git a/tests/qtest/libqos/virtio-9p-client.h b/tests/qtest/libqos/virtio-9p-client.h
index 2bf649085f..3b70aef51e 100644
--- a/tests/qtest/libqos/virtio-9p-client.h
+++ b/tests/qtest/libqos/virtio-9p-client.h
@@ -212,6 +212,33 @@ typedef struct TReadDirRes {
     P9Req *req;
 } TReadDirRes;
 
+/* options for 'Tlopen' 9p request */
+typedef struct TLOpenOpt {
+    /* 9P client being used (mandatory) */
+    QVirtio9P *client;
+    /* user supplied tag number being returned with response (optional) */
+    uint16_t tag;
+    /* file ID of file / directory to be opened (required) */
+    uint32_t fid;
+    /* Linux open(2) flags such as O_RDONLY, O_RDWR, O_WRONLY (optional) */
+    uint32_t flags;
+    /* data being received from 9p server as 'Rlopen' response (optional) */
+    struct {
+        v9fs_qid *qid;
+        uint32_t *iounit;
+    } rlopen;
+    /* only send Tlopen request but not wait for a reply? (optional) */
+    bool requestOnly;
+    /* do we expect an Rlerror response, if yes which error code? (optional) */
+    uint32_t expectErr;
+} TLOpenOpt;
+
+/* result of 'Tlopen' 9p request */
+typedef struct TLOpenRes {
+    /* if requestOnly was set: request object for further processing */
+    P9Req *req;
+} TLOpenRes;
+
 void v9fs_set_allocator(QGuestAllocator *t_alloc);
 void v9fs_memwrite(P9Req *req, const void *addr, size_t len);
 void v9fs_memskip(P9Req *req, size_t len);
@@ -245,8 +272,7 @@ TReadDirRes v9fs_treaddir(TReadDirOpt);
 void v9fs_rreaddir(P9Req *req, uint32_t *count, uint32_t *nentries,
                    struct V9fsDirent **entries);
 void v9fs_free_dirents(struct V9fsDirent *e);
-P9Req *v9fs_tlopen(QVirtio9P *v9p, uint32_t fid, uint32_t flags,
-                   uint16_t tag);
+TLOpenRes v9fs_tlopen(TLOpenOpt);
 void v9fs_rlopen(P9Req *req, v9fs_qid *qid, uint32_t *iounit);
 P9Req *v9fs_twrite(QVirtio9P *v9p, uint32_t fid, uint64_t offset,
                    uint32_t count, const void *data, uint16_t tag);
diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 99e24fce0b..0455c3a094 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -21,6 +21,7 @@
 #define tattach(...) v9fs_tattach((TAttachOpt) __VA_ARGS__)
 #define tgetattr(...) v9fs_tgetattr((TGetAttrOpt) __VA_ARGS__)
 #define treaddir(...) v9fs_treaddir((TReadDirOpt) __VA_ARGS__)
+#define tlopen(...) v9fs_tlopen((TLOpenOpt) __VA_ARGS__)
 
 static void pci_config(void *obj, void *data, QGuestAllocator *t_alloc)
 {
@@ -113,7 +114,9 @@ static void fs_readdir(void *obj, void *data, QGuestAllocator *t_alloc)
     });
     g_assert_cmpint(nqid, ==, 1);
 
-    req = v9fs_tlopen(v9p, 1, O_DIRECTORY, 0);
+    req = tlopen({
+        .client = v9p, .fid = 1, .flags = O_DIRECTORY, .requestOnly = true
+    }).req;
     v9fs_req_wait_for_reply(req, NULL);
     v9fs_rlopen(req, &qid, NULL);
 
@@ -178,7 +181,9 @@ static void do_readdir_split(QVirtio9P *v9p, uint32_t count)
     });
     g_assert_cmpint(nqid, ==, 1);
 
-    req = v9fs_tlopen(v9p, fid, O_DIRECTORY, 0);
+    req = tlopen({
+        .client = v9p, .fid = fid, .flags = O_DIRECTORY, .requestOnly = true
+    }).req;
     v9fs_req_wait_for_reply(req, NULL);
     v9fs_rlopen(req, &qid, NULL);
 
@@ -365,7 +370,9 @@ static void fs_lopen(void *obj, void *data, QGuestAllocator *t_alloc)
         .client = v9p, .fid = 0, .newfid = 1, .nwname = 1, .wnames = wnames
     });
 
-    req = v9fs_tlopen(v9p, 1, O_WRONLY, 0);
+    req = tlopen({
+        .client = v9p, .fid = 1, .flags = O_WRONLY, .requestOnly = true
+    }).req;
     v9fs_req_wait_for_reply(req, NULL);
     v9fs_rlopen(req, NULL, NULL);
 
@@ -387,7 +394,9 @@ static void fs_write(void *obj, void *data, QGuestAllocator *t_alloc)
         .client = v9p, .fid = 0, .newfid = 1, .nwname = 1, .wnames = wnames
     });
 
-    req = v9fs_tlopen(v9p, 1, O_WRONLY, 0);
+    req = tlopen({
+        .client = v9p, .fid = 1, .flags = O_WRONLY, .requestOnly = true
+    }).req;
     v9fs_req_wait_for_reply(req, NULL);
     v9fs_rlopen(req, NULL, NULL);
 
@@ -413,7 +422,9 @@ static void fs_flush_success(void *obj, void *data, QGuestAllocator *t_alloc)
         .client = v9p, .fid = 0, .newfid = 1, .nwname = 1, .wnames = wnames
     });
 
-    req = v9fs_tlopen(v9p, 1, O_WRONLY, 0);
+    req = tlopen({
+        .client = v9p, .fid = 1, .flags = O_WRONLY, .requestOnly = true
+    }).req;
     v9fs_req_wait_for_reply(req, NULL);
     v9fs_rlopen(req, NULL, NULL);
 
@@ -450,7 +461,9 @@ static void fs_flush_ignored(void *obj, void *data, QGuestAllocator *t_alloc)
         .client = v9p, .fid = 0, .newfid = 1, .nwname = 1, .wnames = wnames
     });
 
-    req = v9fs_tlopen(v9p, 1, O_WRONLY, 0);
+    req = tlopen({
+        .client = v9p, .fid = 1, .flags = O_WRONLY, .requestOnly = true
+    }).req;
     v9fs_req_wait_for_reply(req, NULL);
     v9fs_rlopen(req, NULL, NULL);
 
-- 
2.30.2


