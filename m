Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 682255F4B0D
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 23:43:37 +0200 (CEST)
Received: from localhost ([::1]:33640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofphQ-0008GJ-ED
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 17:43:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <a66aae4ceb19ec12d245b8c7f33a639584c8e272@lizzy.crudebyte.com>)
 id 1ofpLa-0006Nm-2I
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:21:03 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:39905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <a66aae4ceb19ec12d245b8c7f33a639584c8e272@lizzy.crudebyte.com>)
 id 1ofpLX-0002MJ-Ln
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:21:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=bMICiGG7wF5iXUD/YeEMUkQ/u7aJGJgiXOwD+6cImWA=; b=kySWV
 HYgrNC5KtCmE+imrrwnmT3Bxu6gRkxlhl7JOtZ5OHEA6GXmy/vit3KZyuHftuxrWhGlFeBprteyyh
 XPfZMXyq4nln4jZpGJsHfCFcsgOGIB/4ZPgtfeL8dPvNiCXMI6mqSl3ji47Z0nqO8HxZ/0xsKM8hq
 D5mWmdoG2OMOvwM291VFqS/u7REcWUm3hTW815dYkpCHV+Ik1InNc7WObwk8Lz3R22NQehWZELWyX
 evzFa/r8s9IlGXVzuzOGiG2I97BFhjniOQtUUSVNlaBFMaXtKMkaPt3iQLzDFWvkT7+8JV6F0sY5Y
 cXJ6vITBuXii/Avt6n/rWd5vadnzw==;
Message-Id: <a66aae4ceb19ec12d245b8c7f33a639584c8e272.1664917004.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1664917004.git.qemu_oss@crudebyte.com>
References: <cover.1664917004.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 4 Oct 2022 22:53:47 +0200
Subject: [PATCH 08/20] tests/9p: convert v9fs_treaddir() to declarative
 arguments
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=a66aae4ceb19ec12d245b8c7f33a639584c8e272@lizzy.crudebyte.com;
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

Use declarative function arguments for function v9fs_treaddir().

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/libqos/virtio-9p-client.c | 32 ++++++++++++++++++++------
 tests/qtest/libqos/virtio-9p-client.h | 33 +++++++++++++++++++++++++--
 tests/qtest/virtio-9p-test.c          | 11 +++++++--
 3 files changed, 65 insertions(+), 11 deletions(-)

diff --git a/tests/qtest/libqos/virtio-9p-client.c b/tests/qtest/libqos/virtio-9p-client.c
index 29916a23b5..047c8993b6 100644
--- a/tests/qtest/libqos/virtio-9p-client.c
+++ b/tests/qtest/libqos/virtio-9p-client.c
@@ -557,17 +557,35 @@ void v9fs_rgetattr(P9Req *req, v9fs_attr *attr)
 }
 
 /* size[4] Treaddir tag[2] fid[4] offset[8] count[4] */
-P9Req *v9fs_treaddir(QVirtio9P *v9p, uint32_t fid, uint64_t offset,
-                     uint32_t count, uint16_t tag)
+TReadDirRes v9fs_treaddir(TReadDirOpt opt)
 {
     P9Req *req;
+    uint32_t err;
 
-    req = v9fs_req_init(v9p, 4 + 8 + 4, P9_TREADDIR, tag);
-    v9fs_uint32_write(req, fid);
-    v9fs_uint64_write(req, offset);
-    v9fs_uint32_write(req, count);
+    g_assert(opt.client);
+    /* expecting either Rreaddir or Rlerror, but obviously not both */
+    g_assert(!opt.expectErr || !(opt.rreaddir.count ||
+             opt.rreaddir.nentries || opt.rreaddir.entries));
+
+    req = v9fs_req_init(opt.client, 4 + 8 + 4, P9_TREADDIR, opt.tag);
+    v9fs_uint32_write(req, opt.fid);
+    v9fs_uint64_write(req, opt.offset);
+    v9fs_uint32_write(req, opt.count);
     v9fs_req_send(req);
-    return req;
+
+    if (!opt.requestOnly) {
+        v9fs_req_wait_for_reply(req, NULL);
+        if (opt.expectErr) {
+            v9fs_rlerror(req, &err);
+            g_assert_cmpint(err, ==, opt.expectErr);
+        } else {
+            v9fs_rreaddir(req, opt.rreaddir.count, opt.rreaddir.nentries,
+                          opt.rreaddir.entries);
+        }
+        req = NULL; /* request was freed */
+    }
+
+    return (TReadDirRes) { .req = req };
 }
 
 /* size[4] Rreaddir tag[2] count[4] data[count] */
diff --git a/tests/qtest/libqos/virtio-9p-client.h b/tests/qtest/libqos/virtio-9p-client.h
index f7b1bfc79a..2bf649085f 100644
--- a/tests/qtest/libqos/virtio-9p-client.h
+++ b/tests/qtest/libqos/virtio-9p-client.h
@@ -182,6 +182,36 @@ typedef struct TGetAttrRes {
     P9Req *req;
 } TGetAttrRes;
 
+/* options for 'Treaddir' 9p request */
+typedef struct TReadDirOpt {
+    /* 9P client being used (mandatory) */
+    QVirtio9P *client;
+    /* user supplied tag number being returned with response (optional) */
+    uint16_t tag;
+    /* file ID of directory whose entries shall be retrieved (required) */
+    uint32_t fid;
+    /* offset in entries stream, i.e. for multiple requests (optional) */
+    uint64_t offset;
+    /* maximum bytes to be returned by server (required) */
+    uint32_t count;
+    /* data being received from 9p server as 'Rreaddir' response (optional) */
+    struct {
+        uint32_t *count;
+        uint32_t *nentries;
+        struct V9fsDirent **entries;
+    } rreaddir;
+    /* only send Treaddir request but not wait for a reply? (optional) */
+    bool requestOnly;
+    /* do we expect an Rlerror response, if yes which error code? (optional) */
+    uint32_t expectErr;
+} TReadDirOpt;
+
+/* result of 'Treaddir' 9p request */
+typedef struct TReadDirRes {
+    /* if requestOnly was set: request object for further processing */
+    P9Req *req;
+} TReadDirRes;
+
 void v9fs_set_allocator(QGuestAllocator *t_alloc);
 void v9fs_memwrite(P9Req *req, const void *addr, size_t len);
 void v9fs_memskip(P9Req *req, size_t len);
@@ -211,8 +241,7 @@ TWalkRes v9fs_twalk(TWalkOpt opt);
 void v9fs_rwalk(P9Req *req, uint16_t *nwqid, v9fs_qid **wqid);
 TGetAttrRes v9fs_tgetattr(TGetAttrOpt);
 void v9fs_rgetattr(P9Req *req, v9fs_attr *attr);
-P9Req *v9fs_treaddir(QVirtio9P *v9p, uint32_t fid, uint64_t offset,
-                     uint32_t count, uint16_t tag);
+TReadDirRes v9fs_treaddir(TReadDirOpt);
 void v9fs_rreaddir(P9Req *req, uint32_t *count, uint32_t *nentries,
                    struct V9fsDirent **entries);
 void v9fs_free_dirents(struct V9fsDirent *e);
diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index ae1220d0cb..e5c174c218 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -20,6 +20,7 @@
 #define tversion(...) v9fs_tversion((TVersionOpt) __VA_ARGS__)
 #define tattach(...) v9fs_tattach((TAttachOpt) __VA_ARGS__)
 #define tgetattr(...) v9fs_tgetattr((TGetAttrOpt) __VA_ARGS__)
+#define treaddir(...) v9fs_treaddir((TReadDirOpt) __VA_ARGS__)
 
 static void pci_config(void *obj, void *data, QGuestAllocator *t_alloc)
 {
@@ -119,7 +120,10 @@ static void fs_readdir(void *obj, void *data, QGuestAllocator *t_alloc)
     /*
      * submit count = msize - 11, because 11 is the header size of Rreaddir
      */
-    req = v9fs_treaddir(v9p, 1, 0, P9_MAX_SIZE - 11, 0);
+    req = treaddir({
+        .client = v9p, .fid = 1, .offset = 0, .count = P9_MAX_SIZE - 11,
+        .requestOnly = true
+    }).req;
     v9fs_req_wait_for_reply(req, NULL);
     v9fs_rreaddir(req, &count, &nentries, &entries);
 
@@ -186,7 +190,10 @@ static void do_readdir_split(QVirtio9P *v9p, uint32_t count)
         npartialentries = 0;
         partialentries = NULL;
 
-        req = v9fs_treaddir(v9p, fid, offset, count, 0);
+        req = treaddir({
+            .client = v9p, .fid = fid, .offset = offset, .count = count,
+            .requestOnly = true
+        }).req;
         v9fs_req_wait_for_reply(req, NULL);
         v9fs_rreaddir(req, &count, &npartialentries, &partialentries);
         if (npartialentries > 0 && partialentries) {
-- 
2.30.2


