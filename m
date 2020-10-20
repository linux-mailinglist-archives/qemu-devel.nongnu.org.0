Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A31293214
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 01:41:40 +0200 (CEST)
Received: from localhost ([::1]:40092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUemZ-0008Th-FQ
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 19:41:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <a55f25360474fa2ad5a45803bc8952e4d9eef49b@lizzy.crudebyte.com>)
 id 1kUek0-0006xQ-5j
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 19:39:00 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:50695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <a55f25360474fa2ad5a45803bc8952e4d9eef49b@lizzy.crudebyte.com>)
 id 1kUejx-0002Qh-4Z
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 19:38:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=lWdkIddxkv3MEeZPJP/gDDmRIzmN1mXi+uEoCPz9hCU=; b=er6Ua
 b8fd9yw2ui0XwgOJydXg3FeWKQw70j6yH3q9iYMMr2ytd+7R1NN4G+lRF3fxOEExYsOFdZqZsfwUs
 HxyTf1JK2tRUqmO0tIKnuyHguENPVKAMeEJPQlwub1ccvLTC5u/KyBKaF7aHNe5IU9NFhkvu3hDGf
 nvsd1/MLyHfTE1HhgO4CKMu1CHXtHI8ypEi+OipUK5/Yz4UGJgi3PoY2chys8loOySHW6rLIz0oGk
 axfTqXTZ7ouZVyBVL4mYZYUxXs+p3qHacpylu6r7aG90nOUVKP9+G2F3I3eo2DxJvTHLBpn+xdLtm
 ofLP5ONoQpx8erjX3qmEp6IsDNMyg==;
Message-Id: <a55f25360474fa2ad5a45803bc8952e4d9eef49b.1603149434.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1603149434.git.qemu_oss@crudebyte.com>
References: <cover.1603149434.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 20 Oct 2020 01:13:24 +0200
Subject: [PATCH 5/8] tests/9pfs: add local Tsymlink test
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=a55f25360474fa2ad5a45803bc8952e4d9eef49b@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 19:37:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

This test case uses a Tsymlink 9p request to create a symbolic link using
the 9pfs 'local' fs driver.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/virtio-9p-test.c | 78 ++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 06a9f10d34..78f4ed7e5f 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -259,6 +259,7 @@ static const char *rmessage_name(uint8_t id)
         id == P9_RWRITE ? "RWRITE" :
         id == P9_RMKDIR ? "RMKDIR" :
         id == P9_RLCREATE ? "RLCREATE" :
+        id == P9_RSYMLINK ? "RSYMLINK" :
         id == P9_RUNLINKAT ? "RUNLINKAT" :
         id == P9_RFLUSH ? "RFLUSH" :
         id == P9_RREADDIR ? "READDIR" :
@@ -708,6 +709,39 @@ static void v9fs_rlcreate(P9Req *req, v9fs_qid *qid, uint32_t *iounit)
     v9fs_req_free(req);
 }
 
+/* size[4] Tsymlink tag[2] fid[4] name[s] symtgt[s] gid[4] */
+static P9Req *v9fs_tsymlink(QVirtio9P *v9p, uint32_t fid, const char *name,
+                            const char *symtgt, uint32_t gid, uint16_t tag)
+{
+    P9Req *req;
+
+    uint32_t body_size = 4 + 4;
+    uint16_t string_size = v9fs_string_size(name) + v9fs_string_size(symtgt);
+
+    g_assert_cmpint(body_size, <=, UINT32_MAX - string_size);
+    body_size += string_size;
+
+    req = v9fs_req_init(v9p, body_size, P9_TSYMLINK, tag);
+    v9fs_uint32_write(req, fid);
+    v9fs_string_write(req, name);
+    v9fs_string_write(req, symtgt);
+    v9fs_uint32_write(req, gid);
+    v9fs_req_send(req);
+    return req;
+}
+
+/* size[4] Rsymlink tag[2] qid[13] */
+static void v9fs_rsymlink(P9Req *req, v9fs_qid *qid)
+{
+    v9fs_req_recv(req, P9_RSYMLINK);
+    if (qid) {
+        v9fs_memread(req, qid, 13);
+    } else {
+        v9fs_memskip(req, 13);
+    }
+    v9fs_req_free(req);
+}
+
 /* size[4] Tunlinkat tag[2] dirfd[4] name[s] flags[4] */
 static P9Req *v9fs_tunlinkat(QVirtio9P *v9p, uint32_t dirfd, const char *name,
                              uint32_t flags, uint16_t tag)
@@ -1091,6 +1125,27 @@ static uint32_t fs_lcreate(void *obj, void *data, QGuestAllocator *t_alloc,
     return fid;
 }
 
+/* create symlink named @a clink in directory @a path pointing to @a to */
+static void fs_symlink(void *obj, void *data, QGuestAllocator *t_alloc,
+                       const char *path, const char *clink, const char *to)
+{
+    QVirtio9P *v9p = obj;
+    alloc = t_alloc;
+    char *const name = g_strdup(clink);
+    char *const dst = g_strdup(to);
+    uint32_t fid;
+    P9Req *req;
+
+    fid = fs_walk_fid(v9p, data, t_alloc, path);
+
+    req = v9fs_tsymlink(v9p, fid, name, dst, 0, 0);
+    v9fs_req_wait_for_reply(req, NULL);
+    v9fs_rsymlink(req, NULL);
+
+    g_free(dst);
+    g_free(name);
+}
+
 static void fs_unlinkat(void *obj, void *data, QGuestAllocator *t_alloc,
                         const char *atpath, const char *rpath, uint32_t flags)
 {
@@ -1216,6 +1271,28 @@ static void fs_unlinkat_file(void *obj, void *data, QGuestAllocator *t_alloc)
     g_free(new_file);
 }
 
+static void fs_symlink_file(void *obj, void *data, QGuestAllocator *t_alloc)
+{
+    QVirtio9P *v9p = obj;
+    struct stat st;
+    char *real_file = virtio_9p_test_path("05/real_file");
+    char *symlink_file = virtio_9p_test_path("05/symlink_file");
+
+    fs_attach(v9p, NULL, t_alloc);
+    fs_mkdir(v9p, data, t_alloc, "/", "05");
+    fs_lcreate(v9p, data, t_alloc, "05", "real_file");
+    g_assert(stat(real_file, &st) == 0);
+    g_assert((st.st_mode & S_IFMT) == S_IFREG);
+
+    fs_symlink(v9p, data, t_alloc, "05", "symlink_file", "real_file");
+
+    /* check if created link exists now */
+    g_assert(stat(symlink_file, &st) == 0);
+
+    g_free(symlink_file);
+    g_free(real_file);
+}
+
 static void *assign_9p_local_driver(GString *cmd_line, void *arg)
 {
     virtio_9p_assign_local_driver(cmd_line, "security_model=mapped-xattr");
@@ -1259,6 +1336,7 @@ static void register_virtio_9p_test(void)
     qos_add_test("local/unlinkat_dir", "virtio-9p", fs_unlinkat_dir, &opts);
     qos_add_test("local/create_file", "virtio-9p", fs_create_file, &opts);
     qos_add_test("local/unlinkat_file", "virtio-9p", fs_unlinkat_file, &opts);
+    qos_add_test("local/symlink_file", "virtio-9p", fs_symlink_file, &opts);
 }
 
 libqos_init(register_virtio_9p_test);
-- 
2.20.1


