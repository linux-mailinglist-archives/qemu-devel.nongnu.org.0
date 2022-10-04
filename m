Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 718405F4B30
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 23:52:38 +0200 (CEST)
Received: from localhost ([::1]:37302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofpq9-0003kM-7l
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 17:52:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <4c01b2caa5f5b54a2020fc92701deadd2abf0571@lizzy.crudebyte.com>)
 id 1ofpMX-0007EZ-Um
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:22:03 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:33993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <4c01b2caa5f5b54a2020fc92701deadd2abf0571@lizzy.crudebyte.com>)
 id 1ofpMS-0002ip-VJ
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:22:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=WhbbawzGxg06KAOTAn2Dp9eQQ655jR2otNYjhZi9xMM=; b=Wenth
 gfrWl8eZf9EX9NGTEwrtq4VsqfLMu3j9AaP2pS8I85p3srAKxh25CwhTUalU/fgtggWBLmrvFSWZb
 k1Uw+VWOrZe1MVZtFZJOgqdjSi8w5kpRXpTDEaiWQMLZQeQMAXUZevRzjrsvDTJKob0iJHSN5aeLR
 dpjybQl4GnknhoM3e71nHY4bhZFgRPkeN+51Ox9TN+9UlyID4UB72g/t5mVYPHRhdJysD4QcM9veY
 H8pxkdnvZbF0MCiOsXYaxT6AZfiFamxSilDRxMs9xkPTknSqLLiU26d7QN0n17u5A+THlto+Xr9LR
 SvuElIU0uECLA8Y4YKi90slaqvZRw==;
Message-Id: <4c01b2caa5f5b54a2020fc92701deadd2abf0571.1664917004.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1664917004.git.qemu_oss@crudebyte.com>
References: <cover.1664917004.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 4 Oct 2022 22:54:09 +0200
Subject: [PATCH 16/20] tests/9p: merge v9fs_tlcreate() and do_lcreate()
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=4c01b2caa5f5b54a2020fc92701deadd2abf0571@lizzy.crudebyte.com;
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
v9fs_tlcreate() by using a declarative function arguments approach.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/libqos/virtio-9p-client.c | 45 +++++++++++++++++++++------
 tests/qtest/libqos/virtio-9p-client.h | 39 +++++++++++++++++++++--
 tests/qtest/virtio-9p-test.c          | 30 +++++-------------
 3 files changed, 79 insertions(+), 35 deletions(-)

diff --git a/tests/qtest/libqos/virtio-9p-client.c b/tests/qtest/libqos/virtio-9p-client.c
index c374ba2048..5c805a133c 100644
--- a/tests/qtest/libqos/virtio-9p-client.c
+++ b/tests/qtest/libqos/virtio-9p-client.c
@@ -827,11 +827,26 @@ void v9fs_rmkdir(P9Req *req, v9fs_qid *qid)
 }
 
 /* size[4] Tlcreate tag[2] fid[4] name[s] flags[4] mode[4] gid[4] */
-P9Req *v9fs_tlcreate(QVirtio9P *v9p, uint32_t fid, const char *name,
-                     uint32_t flags, uint32_t mode, uint32_t gid,
-                     uint16_t tag)
+TlcreateRes v9fs_tlcreate(TlcreateOpt opt)
 {
     P9Req *req;
+    uint32_t err;
+    g_autofree char *name = g_strdup(opt.name);
+
+    g_assert(opt.client);
+    /* expecting either hi-level atPath or low-level fid, but not both */
+    g_assert(!opt.atPath || !opt.fid);
+    /* expecting either Rlcreate or Rlerror, but obviously not both */
+    g_assert(!opt.expectErr || !(opt.rlcreate.qid || opt.rlcreate.iounit));
+
+    if (opt.atPath) {
+        opt.fid = v9fs_twalk((TWalkOpt) { .client = opt.client,
+                                          .path = opt.atPath }).newfid;
+    }
+
+    if (!opt.mode) {
+        opt.mode = 0750;
+    }
 
     uint32_t body_size = 4 + 4 + 4 + 4;
     uint16_t string_size = v9fs_string_size(name);
@@ -839,14 +854,26 @@ P9Req *v9fs_tlcreate(QVirtio9P *v9p, uint32_t fid, const char *name,
     g_assert_cmpint(body_size, <=, UINT32_MAX - string_size);
     body_size += string_size;
 
-    req = v9fs_req_init(v9p, body_size, P9_TLCREATE, tag);
-    v9fs_uint32_write(req, fid);
+    req = v9fs_req_init(opt.client, body_size, P9_TLCREATE, opt.tag);
+    v9fs_uint32_write(req, opt.fid);
     v9fs_string_write(req, name);
-    v9fs_uint32_write(req, flags);
-    v9fs_uint32_write(req, mode);
-    v9fs_uint32_write(req, gid);
+    v9fs_uint32_write(req, opt.flags);
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
+            v9fs_rlcreate(req, opt.rlcreate.qid, opt.rlcreate.iounit);
+        }
+        req = NULL; /* request was freed */
+    }
+
+    return (TlcreateRes) { .req = req };
 }
 
 /* size[4] Rlcreate tag[2] qid[13] iounit[4] */
diff --git a/tests/qtest/libqos/virtio-9p-client.h b/tests/qtest/libqos/virtio-9p-client.h
index ae44f95a4d..8916b1c7aa 100644
--- a/tests/qtest/libqos/virtio-9p-client.h
+++ b/tests/qtest/libqos/virtio-9p-client.h
@@ -320,6 +320,41 @@ typedef struct TMkdirRes {
     P9Req *req;
 } TMkdirRes;
 
+/* options for 'Tlcreate' 9p request */
+typedef struct TlcreateOpt {
+    /* 9P client being used (mandatory) */
+    QVirtio9P *client;
+    /* user supplied tag number being returned with response (optional) */
+    uint16_t tag;
+    /* low-level variant of directory where new file shall be created */
+    uint32_t fid;
+    /* high-level variant of directory where new file shall be created */
+    const char *atPath;
+    /* name of new file (required) */
+    const char *name;
+    /* Linux kernel intent bits */
+    uint32_t flags;
+    /* Linux create(2) mode bits */
+    uint32_t mode;
+    /* effective group ID of caller */
+    uint32_t gid;
+    /* data being received from 9p server as 'Rlcreate' response (optional) */
+    struct {
+        v9fs_qid *qid;
+        uint32_t *iounit;
+    } rlcreate;
+    /* only send Tlcreate request but not wait for a reply? (optional) */
+    bool requestOnly;
+    /* do we expect an Rlerror response, if yes which error code? (optional) */
+    uint32_t expectErr;
+} TlcreateOpt;
+
+/* result of 'Tlcreate' 9p request */
+typedef struct TlcreateRes {
+    /* if requestOnly was set: request object for further processing */
+    P9Req *req;
+} TlcreateRes;
+
 void v9fs_set_allocator(QGuestAllocator *t_alloc);
 void v9fs_memwrite(P9Req *req, const void *addr, size_t len);
 void v9fs_memskip(P9Req *req, size_t len);
@@ -361,9 +396,7 @@ TFlushRes v9fs_tflush(TFlushOpt);
 void v9fs_rflush(P9Req *req);
 TMkdirRes v9fs_tmkdir(TMkdirOpt);
 void v9fs_rmkdir(P9Req *req, v9fs_qid *qid);
-P9Req *v9fs_tlcreate(QVirtio9P *v9p, uint32_t fid, const char *name,
-                     uint32_t flags, uint32_t mode, uint32_t gid,
-                     uint16_t tag);
+TlcreateRes v9fs_tlcreate(TlcreateOpt);
 void v9fs_rlcreate(P9Req *req, v9fs_qid *qid, uint32_t *iounit);
 P9Req *v9fs_tsymlink(QVirtio9P *v9p, uint32_t fid, const char *name,
                      const char *symtgt, uint32_t gid, uint16_t tag);
diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 6d75afee87..d13b27bd2e 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -25,6 +25,7 @@
 #define twrite(...) v9fs_twrite((TWriteOpt) __VA_ARGS__)
 #define tflush(...) v9fs_tflush((TFlushOpt) __VA_ARGS__)
 #define tmkdir(...) v9fs_tmkdir((TMkdirOpt) __VA_ARGS__)
+#define tlcreate(...) v9fs_tlcreate((TlcreateOpt) __VA_ARGS__)
 
 static void pci_config(void *obj, void *data, QGuestAllocator *t_alloc)
 {
@@ -478,23 +479,6 @@ static void fs_flush_ignored(void *obj, void *data, QGuestAllocator *t_alloc)
     g_free(wnames[0]);
 }
 
-/* create a regular file with Tlcreate and return file's fid */
-static uint32_t do_lcreate(QVirtio9P *v9p, const char *path,
-                           const char *cname)
-{
-    g_autofree char *name = g_strdup(cname);
-    uint32_t fid;
-    P9Req *req;
-
-    fid = twalk({ .client = v9p, .path = path }).newfid;
-
-    req = v9fs_tlcreate(v9p, fid, name, 0, 0750, 0, 0);
-    v9fs_req_wait_for_reply(req, NULL);
-    v9fs_rlcreate(req, NULL, NULL);
-
-    return fid;
-}
-
 /* create symlink named @a clink in directory @a path pointing to @a to */
 static void do_symlink(QVirtio9P *v9p, const char *path, const char *clink,
                        const char *to)
@@ -615,7 +599,7 @@ static void fs_create_file(void *obj, void *data, QGuestAllocator *t_alloc)
 
     tattach({ .client = v9p });
     tmkdir({ .client = v9p, .atPath = "/", .name = "03" });
-    do_lcreate(v9p, "03", "1st_file");
+    tlcreate({ .client = v9p, .atPath = "03", .name = "1st_file" });
 
     /* check if created file exists now ... */
     g_assert(stat(new_file, &st) == 0);
@@ -632,7 +616,7 @@ static void fs_unlinkat_file(void *obj, void *data, QGuestAllocator *t_alloc)
 
     tattach({ .client = v9p });
     tmkdir({ .client = v9p, .atPath = "/", .name = "04" });
-    do_lcreate(v9p, "04", "doa_file");
+    tlcreate({ .client = v9p, .atPath = "04", .name = "doa_file" });
 
     /* check if created file exists now ... */
     g_assert(stat(new_file, &st) == 0);
@@ -654,7 +638,7 @@ static void fs_symlink_file(void *obj, void *data, QGuestAllocator *t_alloc)
 
     tattach({ .client = v9p });
     tmkdir({ .client = v9p, .atPath = "/", .name = "05" });
-    do_lcreate(v9p, "05", "real_file");
+    tlcreate({ .client = v9p, .atPath = "05", .name = "real_file" });
     g_assert(stat(real_file, &st) == 0);
     g_assert((st.st_mode & S_IFMT) == S_IFREG);
 
@@ -675,7 +659,7 @@ static void fs_unlinkat_symlink(void *obj, void *data,
 
     tattach({ .client = v9p });
     tmkdir({ .client = v9p, .atPath = "/", .name = "06" });
-    do_lcreate(v9p, "06", "real_file");
+    tlcreate({ .client = v9p, .atPath = "06", .name = "real_file" });
     g_assert(stat(real_file, &st) == 0);
     g_assert((st.st_mode & S_IFMT) == S_IFREG);
 
@@ -697,7 +681,7 @@ static void fs_hardlink_file(void *obj, void *data, QGuestAllocator *t_alloc)
 
     tattach({ .client = v9p });
     tmkdir({ .client = v9p, .atPath = "/", .name = "07" });
-    do_lcreate(v9p, "07", "real_file");
+    tlcreate({ .client = v9p, .atPath = "07", .name = "real_file" });
     g_assert(stat(real_file, &st_real) == 0);
     g_assert((st_real.st_mode & S_IFMT) == S_IFREG);
 
@@ -722,7 +706,7 @@ static void fs_unlinkat_hardlink(void *obj, void *data,
 
     tattach({ .client = v9p });
     tmkdir({ .client = v9p, .atPath = "/", .name = "08" });
-    do_lcreate(v9p, "08", "real_file");
+    tlcreate({ .client = v9p, .atPath = "08", .name = "real_file" });
     g_assert(stat(real_file, &st_real) == 0);
     g_assert((st_real.st_mode & S_IFMT) == S_IFREG);
 
-- 
2.30.2


