Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C271F5F4B20
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 23:48:30 +0200 (CEST)
Received: from localhost ([::1]:41008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofpm9-00065c-Qo
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 17:48:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <563f3ad04fe596ce0ae1e2654d1d08237f18c830@lizzy.crudebyte.com>)
 id 1ofpMX-0007Ea-Uv
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:22:03 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:38643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <563f3ad04fe596ce0ae1e2654d1d08237f18c830@lizzy.crudebyte.com>)
 id 1ofpMU-0002jf-If
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:22:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=xbqTX5xjcGmXUiHQayT1vdGoAFLg8EWMPkkJfY5m+Wk=; b=e8M1r
 E1U4eTnRKuXhOIshQbPkdXIkDVmZD1VMMiw0XRW6+HH9g+yWgBmUZqpiii/oOkrV/VhVLpYmIMhZV
 dbXCfzRaCaQ/K8MnLDciWS2RyBkvzWpxJeW/9e/wWym1DvmehWd7o4ZFguDF6rzIQMah/nM8ikRmO
 r4WiMNb5ITF2U6ucvkJ6vrgiyx61qhKpatYM2+zOPfDwnZyCWlMXfKLKMJGsRu91cf3r25d7suyjV
 AgVTd+efUxlHFJf/aUKp0ZqVUBf/uKVf5SR8Dnw0SIE05kwQ0eR668jW8+tM6b39DNUNv4SY4OhXv
 igIfy49YHU53teVkBqIPy9EWnVqBQ==;
Message-Id: <563f3ad04fe596ce0ae1e2654d1d08237f18c830.1664917004.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1664917004.git.qemu_oss@crudebyte.com>
References: <cover.1664917004.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 4 Oct 2022 22:54:11 +0200
Subject: [PATCH 17/20] tests/9p: merge v9fs_tsymlink() and do_symlink()
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=563f3ad04fe596ce0ae1e2654d1d08237f18c830@lizzy.crudebyte.com;
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
v9fs_tsymlink() by using a declarative function arguments approach.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/libqos/virtio-9p-client.c | 37 ++++++++++++++++++++++-----
 tests/qtest/libqos/virtio-9p-client.h | 35 +++++++++++++++++++++++--
 tests/qtest/virtio-9p-test.c          | 27 +++++++------------
 3 files changed, 73 insertions(+), 26 deletions(-)

diff --git a/tests/qtest/libqos/virtio-9p-client.c b/tests/qtest/libqos/virtio-9p-client.c
index 5c805a133c..89eaf50355 100644
--- a/tests/qtest/libqos/virtio-9p-client.c
+++ b/tests/qtest/libqos/virtio-9p-client.c
@@ -892,10 +892,23 @@ void v9fs_rlcreate(P9Req *req, v9fs_qid *qid, uint32_t *iounit)
 }
 
 /* size[4] Tsymlink tag[2] fid[4] name[s] symtgt[s] gid[4] */
-P9Req *v9fs_tsymlink(QVirtio9P *v9p, uint32_t fid, const char *name,
-                     const char *symtgt, uint32_t gid, uint16_t tag)
+TsymlinkRes v9fs_tsymlink(TsymlinkOpt opt)
 {
     P9Req *req;
+    uint32_t err;
+    g_autofree char *name = g_strdup(opt.name);
+    g_autofree char *symtgt = g_strdup(opt.symtgt);
+
+    g_assert(opt.client);
+    /* expecting either hi-level atPath or low-level fid, but not both */
+    g_assert(!opt.atPath || !opt.fid);
+    /* expecting either Rsymlink or Rlerror, but obviously not both */
+    g_assert(!opt.expectErr || !opt.rsymlink.qid);
+
+    if (opt.atPath) {
+        opt.fid = v9fs_twalk((TWalkOpt) { .client = opt.client,
+                                          .path = opt.atPath }).newfid;
+    }
 
     uint32_t body_size = 4 + 4;
     uint16_t string_size = v9fs_string_size(name) + v9fs_string_size(symtgt);
@@ -903,13 +916,25 @@ P9Req *v9fs_tsymlink(QVirtio9P *v9p, uint32_t fid, const char *name,
     g_assert_cmpint(body_size, <=, UINT32_MAX - string_size);
     body_size += string_size;
 
-    req = v9fs_req_init(v9p, body_size, P9_TSYMLINK, tag);
-    v9fs_uint32_write(req, fid);
+    req = v9fs_req_init(opt.client, body_size, P9_TSYMLINK, opt.tag);
+    v9fs_uint32_write(req, opt.fid);
     v9fs_string_write(req, name);
     v9fs_string_write(req, symtgt);
-    v9fs_uint32_write(req, gid);
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
+            v9fs_rsymlink(req, opt.rsymlink.qid);
+        }
+        req = NULL; /* request was freed */
+    }
+
+    return (TsymlinkRes) { .req = req };
 }
 
 /* size[4] Rsymlink tag[2] qid[13] */
diff --git a/tests/qtest/libqos/virtio-9p-client.h b/tests/qtest/libqos/virtio-9p-client.h
index 8916b1c7aa..b905a54966 100644
--- a/tests/qtest/libqos/virtio-9p-client.h
+++ b/tests/qtest/libqos/virtio-9p-client.h
@@ -355,6 +355,38 @@ typedef struct TlcreateRes {
     P9Req *req;
 } TlcreateRes;
 
+/* options for 'Tsymlink' 9p request */
+typedef struct TsymlinkOpt {
+    /* 9P client being used (mandatory) */
+    QVirtio9P *client;
+    /* user supplied tag number being returned with response (optional) */
+    uint16_t tag;
+    /* low-level variant of directory where symlink shall be created */
+    uint32_t fid;
+    /* high-level variant of directory where symlink shall be created */
+    const char *atPath;
+    /* name of symlink (required) */
+    const char *name;
+    /* where symlink will point to (required) */
+    const char *symtgt;
+    /* effective group ID of caller */
+    uint32_t gid;
+    /* data being received from 9p server as 'Rsymlink' response (optional) */
+    struct {
+        v9fs_qid *qid;
+    } rsymlink;
+    /* only send Tsymlink request but not wait for a reply? (optional) */
+    bool requestOnly;
+    /* do we expect an Rlerror response, if yes which error code? (optional) */
+    uint32_t expectErr;
+} TsymlinkOpt;
+
+/* result of 'Tsymlink' 9p request */
+typedef struct TsymlinkRes {
+    /* if requestOnly was set: request object for further processing */
+    P9Req *req;
+} TsymlinkRes;
+
 void v9fs_set_allocator(QGuestAllocator *t_alloc);
 void v9fs_memwrite(P9Req *req, const void *addr, size_t len);
 void v9fs_memskip(P9Req *req, size_t len);
@@ -398,8 +430,7 @@ TMkdirRes v9fs_tmkdir(TMkdirOpt);
 void v9fs_rmkdir(P9Req *req, v9fs_qid *qid);
 TlcreateRes v9fs_tlcreate(TlcreateOpt);
 void v9fs_rlcreate(P9Req *req, v9fs_qid *qid, uint32_t *iounit);
-P9Req *v9fs_tsymlink(QVirtio9P *v9p, uint32_t fid, const char *name,
-                     const char *symtgt, uint32_t gid, uint16_t tag);
+TsymlinkRes v9fs_tsymlink(TsymlinkOpt);
 void v9fs_rsymlink(P9Req *req, v9fs_qid *qid);
 P9Req *v9fs_tlink(QVirtio9P *v9p, uint32_t dfid, uint32_t fid,
                   const char *name, uint16_t tag);
diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index d13b27bd2e..c7213d6caf 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -26,6 +26,7 @@
 #define tflush(...) v9fs_tflush((TFlushOpt) __VA_ARGS__)
 #define tmkdir(...) v9fs_tmkdir((TMkdirOpt) __VA_ARGS__)
 #define tlcreate(...) v9fs_tlcreate((TlcreateOpt) __VA_ARGS__)
+#define tsymlink(...) v9fs_tsymlink((TsymlinkOpt) __VA_ARGS__)
 
 static void pci_config(void *obj, void *data, QGuestAllocator *t_alloc)
 {
@@ -479,22 +480,6 @@ static void fs_flush_ignored(void *obj, void *data, QGuestAllocator *t_alloc)
     g_free(wnames[0]);
 }
 
-/* create symlink named @a clink in directory @a path pointing to @a to */
-static void do_symlink(QVirtio9P *v9p, const char *path, const char *clink,
-                       const char *to)
-{
-    g_autofree char *name = g_strdup(clink);
-    g_autofree char *dst = g_strdup(to);
-    uint32_t fid;
-    P9Req *req;
-
-    fid = twalk({ .client = v9p, .path = path }).newfid;
-
-    req = v9fs_tsymlink(v9p, fid, name, dst, 0, 0);
-    v9fs_req_wait_for_reply(req, NULL);
-    v9fs_rsymlink(req, NULL);
-}
-
 /* create a hard link named @a clink in directory @a path pointing to @a to */
 static void do_hardlink(QVirtio9P *v9p, const char *path, const char *clink,
                         const char *to)
@@ -642,7 +627,10 @@ static void fs_symlink_file(void *obj, void *data, QGuestAllocator *t_alloc)
     g_assert(stat(real_file, &st) == 0);
     g_assert((st.st_mode & S_IFMT) == S_IFREG);
 
-    do_symlink(v9p, "05", "symlink_file", "real_file");
+    tsymlink({
+        .client = v9p, .atPath = "05", .name = "symlink_file",
+        .symtgt = "real_file"
+    });
 
     /* check if created link exists now */
     g_assert(stat(symlink_file, &st) == 0);
@@ -663,7 +651,10 @@ static void fs_unlinkat_symlink(void *obj, void *data,
     g_assert(stat(real_file, &st) == 0);
     g_assert((st.st_mode & S_IFMT) == S_IFREG);
 
-    do_symlink(v9p, "06", "symlink_file", "real_file");
+    tsymlink({
+        .client = v9p, .atPath = "06", .name = "symlink_file",
+        .symtgt = "real_file"
+    });
     g_assert(stat(symlink_file, &st) == 0);
 
     do_unlinkat(v9p, "06", "symlink_file", 0);
-- 
2.30.2


