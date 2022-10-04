Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFC75F4B12
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 23:44:27 +0200 (CEST)
Received: from localhost ([::1]:53212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofpiE-0001rB-GC
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 17:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <b87b2c972921df980440ff5b2d3e6bb8163d6551@lizzy.crudebyte.com>)
 id 1ofpML-000756-8Q
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:21:49 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:54553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <b87b2c972921df980440ff5b2d3e6bb8163d6551@lizzy.crudebyte.com>)
 id 1ofpMJ-0002hv-9w
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:21:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=usMRXxHFD0luGUFQyQD5ySllsBY+goQhU1DsI2tKr/s=; b=SoYzh
 aiq+kTtWAVa1Enuh2a2PPxuyv4XO7vhqG09bWPaWgDFzBo5hwStvCZxak39zs1rnmwP0Guq2d3Nlo
 FJNfFJVKrH1WTjsmT+i21N8EcCXVUvZ5Bm4LsLNxJpxwbqIecAhtO1gqvz309TMIa9WHTJYYBdVur
 4rYaIPsOef7KiMsQ6JVOwha93EeRR9ZNyBDaCNCUU5C+TR/CM5h4EMGCMaG21CSR8bbGK5MXM7I1b
 qbL11hiG2SZw97QS17Cs+A7284VD8LAZY26KtcwUddgul01adJc2WbVEIi2P8aJFOEtmOL6hMO+Tr
 KizutYq1n2pycUkTumJgxo3+VaVmg==;
Message-Id: <b87b2c972921df980440ff5b2d3e6bb8163d6551.1664917004.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1664917004.git.qemu_oss@crudebyte.com>
References: <cover.1664917004.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 4 Oct 2022 22:54:06 +0200
Subject: [PATCH 15/20] tests/9p: merge v9fs_tmkdir() and do_mkdir()
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=b87b2c972921df980440ff5b2d3e6bb8163d6551@lizzy.crudebyte.com;
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

As with previous patches, unify those 2 functions into a single function
v9fs_tmkdir() by using a declarative function arguments approach.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/libqos/virtio-9p-client.c | 42 ++++++++++++++++++++++-----
 tests/qtest/libqos/virtio-9p-client.h | 36 +++++++++++++++++++++--
 tests/qtest/virtio-9p-test.c          | 30 ++++++-------------
 3 files changed, 78 insertions(+), 30 deletions(-)

diff --git a/tests/qtest/libqos/virtio-9p-client.c b/tests/qtest/libqos/virtio-9p-client.c
index 3be0ffc7da..c374ba2048 100644
--- a/tests/qtest/libqos/virtio-9p-client.c
+++ b/tests/qtest/libqos/virtio-9p-client.c
@@ -766,10 +766,26 @@ void v9fs_rflush(P9Req *req)
 }
 
 /* size[4] Tmkdir tag[2] dfid[4] name[s] mode[4] gid[4] */
-P9Req *v9fs_tmkdir(QVirtio9P *v9p, uint32_t dfid, const char *name,
-                   uint32_t mode, uint32_t gid, uint16_t tag)
+TMkdirRes v9fs_tmkdir(TMkdirOpt opt)
 {
     P9Req *req;
+    uint32_t err;
+    g_autofree char *name = g_strdup(opt.name);
+
+    g_assert(opt.client);
+    /* expecting either hi-level atPath or low-level dfid, but not both */
+    g_assert(!opt.atPath || !opt.dfid);
+    /* expecting either Rmkdir or Rlerror, but obviously not both */
+    g_assert(!opt.expectErr || !opt.rmkdir.qid);
+
+    if (opt.atPath) {
+        opt.dfid = v9fs_twalk((TWalkOpt) { .client = opt.client,
+                                           .path = opt.atPath }).newfid;
+    }
+
+    if (!opt.mode) {
+        opt.mode = 0750;
+    }
 
     uint32_t body_size = 4 + 4 + 4;
     uint16_t string_size = v9fs_string_size(name);
@@ -777,13 +793,25 @@ P9Req *v9fs_tmkdir(QVirtio9P *v9p, uint32_t dfid, const char *name,
     g_assert_cmpint(body_size, <=, UINT32_MAX - string_size);
     body_size += string_size;
 
-    req = v9fs_req_init(v9p, body_size, P9_TMKDIR, tag);
-    v9fs_uint32_write(req, dfid);
+    req = v9fs_req_init(opt.client, body_size, P9_TMKDIR, opt.tag);
+    v9fs_uint32_write(req, opt.dfid);
     v9fs_string_write(req, name);
-    v9fs_uint32_write(req, mode);
-    v9fs_uint32_write(req, gid);
+    v9fs_uint32_write(req, opt.mode);
+    v9fs_uint32_write(req, opt.gid);
     v9fs_req_send(req);
-    return req;
+
+    if (!opt.requestOnly) {
+        v9fs_req_wait_for_reply(req, NULL);
+        if (opt.expectErr) {
+            v9fs_rlerror(req, &err);
+            g_assert_cmpint(err, ==, opt.expectErr);
+        } else {
+            v9fs_rmkdir(req, opt.rmkdir.qid);
+        }
+        req = NULL; /* request was freed */
+    }
+
+    return (TMkdirRes) { .req = req };
 }
 
 /* size[4] Rmkdir tag[2] qid[13] */
diff --git a/tests/qtest/libqos/virtio-9p-client.h b/tests/qtest/libqos/virtio-9p-client.h
index b22b54c720..ae44f95a4d 100644
--- a/tests/qtest/libqos/virtio-9p-client.h
+++ b/tests/qtest/libqos/virtio-9p-client.h
@@ -287,6 +287,39 @@ typedef struct TFlushRes {
     P9Req *req;
 } TFlushRes;
 
+/* options for 'Tmkdir' 9p request */
+typedef struct TMkdirOpt {
+    /* 9P client being used (mandatory) */
+    QVirtio9P *client;
+    /* user supplied tag number being returned with response (optional) */
+    uint16_t tag;
+    /* low level variant of directory where new one shall be created */
+    uint32_t dfid;
+    /* high-level variant of directory where new one shall be created */
+    const char *atPath;
+    /* New directory's name (required) */
+    const char *name;
+    /* Linux mkdir(2) mode bits (optional) */
+    uint32_t mode;
+    /* effective group ID of caller */
+    uint32_t gid;
+    /* data being received from 9p server as 'Rmkdir' response (optional) */
+    struct {
+        /* QID of newly created directory */
+        v9fs_qid *qid;
+    } rmkdir;
+    /* only send Tmkdir request but not wait for a reply? (optional) */
+    bool requestOnly;
+    /* do we expect an Rlerror response, if yes which error code? (optional) */
+    uint32_t expectErr;
+} TMkdirOpt;
+
+/* result of 'TMkdir' 9p request */
+typedef struct TMkdirRes {
+    /* if requestOnly was set: request object for further processing */
+    P9Req *req;
+} TMkdirRes;
+
 void v9fs_set_allocator(QGuestAllocator *t_alloc);
 void v9fs_memwrite(P9Req *req, const void *addr, size_t len);
 void v9fs_memskip(P9Req *req, size_t len);
@@ -326,8 +359,7 @@ TWriteRes v9fs_twrite(TWriteOpt);
 void v9fs_rwrite(P9Req *req, uint32_t *count);
 TFlushRes v9fs_tflush(TFlushOpt);
 void v9fs_rflush(P9Req *req);
-P9Req *v9fs_tmkdir(QVirtio9P *v9p, uint32_t dfid, const char *name,
-                   uint32_t mode, uint32_t gid, uint16_t tag);
+TMkdirRes v9fs_tmkdir(TMkdirOpt);
 void v9fs_rmkdir(P9Req *req, v9fs_qid *qid);
 P9Req *v9fs_tlcreate(QVirtio9P *v9p, uint32_t fid, const char *name,
                      uint32_t flags, uint32_t mode, uint32_t gid,
diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 5544998bac..6d75afee87 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -24,6 +24,7 @@
 #define tlopen(...) v9fs_tlopen((TLOpenOpt) __VA_ARGS__)
 #define twrite(...) v9fs_twrite((TWriteOpt) __VA_ARGS__)
 #define tflush(...) v9fs_tflush((TFlushOpt) __VA_ARGS__)
+#define tmkdir(...) v9fs_tmkdir((TMkdirOpt) __VA_ARGS__)
 
 static void pci_config(void *obj, void *data, QGuestAllocator *t_alloc)
 {
@@ -477,19 +478,6 @@ static void fs_flush_ignored(void *obj, void *data, QGuestAllocator *t_alloc)
     g_free(wnames[0]);
 }
 
-static void do_mkdir(QVirtio9P *v9p, const char *path, const char *cname)
-{
-    g_autofree char *name = g_strdup(cname);
-    uint32_t fid;
-    P9Req *req;
-
-    fid = twalk({ .client = v9p, .path = path }).newfid;
-
-    req = v9fs_tmkdir(v9p, fid, name, 0750, 0, 0);
-    v9fs_req_wait_for_reply(req, NULL);
-    v9fs_rmkdir(req, NULL);
-}
-
 /* create a regular file with Tlcreate and return file's fid */
 static uint32_t do_lcreate(QVirtio9P *v9p, const char *path,
                            const char *cname)
@@ -587,7 +575,7 @@ static void fs_create_dir(void *obj, void *data, QGuestAllocator *t_alloc)
     g_assert(root_path != NULL);
 
     tattach({ .client = v9p });
-    do_mkdir(v9p, "/", "01");
+    tmkdir({ .client = v9p, .atPath = "/", .name = "01" });
 
     /* check if created directory really exists now ... */
     g_assert(stat(new_dir, &st) == 0);
@@ -606,7 +594,7 @@ static void fs_unlinkat_dir(void *obj, void *data, QGuestAllocator *t_alloc)
     g_assert(root_path != NULL);
 
     tattach({ .client = v9p });
-    do_mkdir(v9p, "/", "02");
+    tmkdir({ .client = v9p, .atPath = "/", .name = "02" });
 
     /* check if created directory really exists now ... */
     g_assert(stat(new_dir, &st) == 0);
@@ -626,7 +614,7 @@ static void fs_create_file(void *obj, void *data, QGuestAllocator *t_alloc)
     g_autofree char *new_file = virtio_9p_test_path("03/1st_file");
 
     tattach({ .client = v9p });
-    do_mkdir(v9p, "/", "03");
+    tmkdir({ .client = v9p, .atPath = "/", .name = "03" });
     do_lcreate(v9p, "03", "1st_file");
 
     /* check if created file exists now ... */
@@ -643,7 +631,7 @@ static void fs_unlinkat_file(void *obj, void *data, QGuestAllocator *t_alloc)
     g_autofree char *new_file = virtio_9p_test_path("04/doa_file");
 
     tattach({ .client = v9p });
-    do_mkdir(v9p, "/", "04");
+    tmkdir({ .client = v9p, .atPath = "/", .name = "04" });
     do_lcreate(v9p, "04", "doa_file");
 
     /* check if created file exists now ... */
@@ -665,7 +653,7 @@ static void fs_symlink_file(void *obj, void *data, QGuestAllocator *t_alloc)
     g_autofree char *symlink_file = virtio_9p_test_path("05/symlink_file");
 
     tattach({ .client = v9p });
-    do_mkdir(v9p, "/", "05");
+    tmkdir({ .client = v9p, .atPath = "/", .name = "05" });
     do_lcreate(v9p, "05", "real_file");
     g_assert(stat(real_file, &st) == 0);
     g_assert((st.st_mode & S_IFMT) == S_IFREG);
@@ -686,7 +674,7 @@ static void fs_unlinkat_symlink(void *obj, void *data,
     g_autofree char *symlink_file = virtio_9p_test_path("06/symlink_file");
 
     tattach({ .client = v9p });
-    do_mkdir(v9p, "/", "06");
+    tmkdir({ .client = v9p, .atPath = "/", .name = "06" });
     do_lcreate(v9p, "06", "real_file");
     g_assert(stat(real_file, &st) == 0);
     g_assert((st.st_mode & S_IFMT) == S_IFREG);
@@ -708,7 +696,7 @@ static void fs_hardlink_file(void *obj, void *data, QGuestAllocator *t_alloc)
     g_autofree char *hardlink_file = virtio_9p_test_path("07/hardlink_file");
 
     tattach({ .client = v9p });
-    do_mkdir(v9p, "/", "07");
+    tmkdir({ .client = v9p, .atPath = "/", .name = "07" });
     do_lcreate(v9p, "07", "real_file");
     g_assert(stat(real_file, &st_real) == 0);
     g_assert((st_real.st_mode & S_IFMT) == S_IFREG);
@@ -733,7 +721,7 @@ static void fs_unlinkat_hardlink(void *obj, void *data,
     g_autofree char *hardlink_file = virtio_9p_test_path("08/hardlink_file");
 
     tattach({ .client = v9p });
-    do_mkdir(v9p, "/", "08");
+    tmkdir({ .client = v9p, .atPath = "/", .name = "08" });
     do_lcreate(v9p, "08", "real_file");
     g_assert(stat(real_file, &st_real) == 0);
     g_assert((st_real.st_mode & S_IFMT) == S_IFREG);
-- 
2.30.2


