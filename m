Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2D4294D70
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 15:24:52 +0200 (CEST)
Received: from localhost ([::1]:33106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVE6j-0004Rq-VM
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 09:24:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <3c7c65b476ba44bea6afd0b378b5287e1c671a32@lizzy.crudebyte.com>)
 id 1kVE55-0002qq-S8
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 09:23:08 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:51943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <3c7c65b476ba44bea6afd0b378b5287e1c671a32@lizzy.crudebyte.com>)
 id 1kVE53-0003Ut-Hr
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 09:23:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=+sqFbrtyOtaobi6Og+lZZDKAY/uMSaJyf2gBFTvGVcE=; b=n9DsV
 WH9tRBxfIbMZfTZnuE7XT0VbYzxmBZ/RCUf8Vozd3ILg/oMfigQvocmTmWYO8zX7FmWxcTrtBlBRh
 yp4KYqprdvK6xVLBI9lr5gjc9Jdp8JD8oaZombN55APA0U6QwTihZUBpKQn6BjIKHYlFXdhKULglD
 7dhhVGph7PkyiUs60TzOuzU1OjyAauGcUpmlDsDUKGRe2TJzCyFg7ASdwR0sW7GofOdxsfHMJWO+H
 xOlymX9AbRAZ2PjVytrkNn2Q9zEEwbgUik9RqNUR+j+kSO2u4EGEEkBcigSKifPa4mE+FF06TU7Yy
 H6OUZ2cKtTCsg7c7J526V4o4WqYaQ==;
Message-Id: <3c7c65b476ba44bea6afd0b378b5287e1c671a32.1603285620.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1603285620.git.qemu_oss@crudebyte.com>
References: <cover.1603285620.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Wed, 21 Oct 2020 14:17:01 +0200
Subject: [PATCH v2 2/8] tests/9pfs: add local Tunlinkat directory test
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=3c7c65b476ba44bea6afd0b378b5287e1c671a32@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/21 09:21:52
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

This test case uses a Tunlinkat 9p request with flag AT_REMOVEDIR
(see 'man 2 unlink') to remove a directory from host's test directory.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/virtio-9p-test.c | 71 ++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 21807037df..abd7e44648 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -258,6 +258,7 @@ static const char *rmessage_name(uint8_t id)
         id == P9_RLOPEN ? "RLOPEN" :
         id == P9_RWRITE ? "RWRITE" :
         id == P9_RMKDIR ? "RMKDIR" :
+        id == P9_RUNLINKAT ? "RUNLINKAT" :
         id == P9_RFLUSH ? "RFLUSH" :
         id == P9_RREADDIR ? "READDIR" :
         "<unknown>";
@@ -693,6 +694,33 @@ static void v9fs_rmkdir(P9Req *req, v9fs_qid *qid)
     v9fs_req_free(req);
 }
 
+/* size[4] Tunlinkat tag[2] dirfd[4] name[s] flags[4] */
+static P9Req *v9fs_tunlinkat(QVirtio9P *v9p, uint32_t dirfd, const char *name,
+                             uint32_t flags, uint16_t tag)
+{
+    P9Req *req;
+
+    uint32_t body_size = 4 + 4;
+    uint16_t string_size = v9fs_string_size(name);
+
+    g_assert_cmpint(body_size, <=, UINT32_MAX - string_size);
+    body_size += string_size;
+
+    req = v9fs_req_init(v9p, body_size, P9_TUNLINKAT, tag);
+    v9fs_uint32_write(req, dirfd);
+    v9fs_string_write(req, name);
+    v9fs_uint32_write(req, flags);
+    v9fs_req_send(req);
+    return req;
+}
+
+/* size[4] Runlinkat tag[2] */
+static void v9fs_runlinkat(P9Req *req)
+{
+    v9fs_req_recv(req, P9_RUNLINKAT);
+    v9fs_req_free(req);
+}
+
 /* basic readdir test where reply fits into a single response message */
 static void fs_readdir(void *obj, void *data, QGuestAllocator *t_alloc)
 {
@@ -1004,6 +1032,22 @@ static void do_mkdir(QVirtio9P *v9p, const char *path, const char *cname)
     g_free(name);
 }
 
+static void do_unlinkat(QVirtio9P *v9p, const char *atpath, const char *rpath,
+                        uint32_t flags)
+{
+    char *const name = g_strdup(rpath);
+    uint32_t fid;
+    P9Req *req;
+
+    fid = do_walk(v9p, atpath);
+
+    req = v9fs_tunlinkat(v9p, fid, name, flags, 0);
+    v9fs_req_wait_for_reply(req, NULL);
+    v9fs_runlinkat(req);
+
+    g_free(name);
+}
+
 static void fs_readdir_split_128(void *obj, void *data,
                                  QGuestAllocator *t_alloc)
 {
@@ -1050,6 +1094,32 @@ static void fs_create_dir(void *obj, void *data, QGuestAllocator *t_alloc)
     g_free(root_path);
 }
 
+static void fs_unlinkat_dir(void *obj, void *data, QGuestAllocator *t_alloc)
+{
+    QVirtio9P *v9p = obj;
+    alloc = t_alloc;
+    struct stat st;
+    char *root_path = virtio_9p_test_path("");
+    char *new_dir = virtio_9p_test_path("02");
+
+    g_assert(root_path != NULL);
+
+    do_attach(v9p);
+    do_mkdir(v9p, "/", "02");
+
+    /* check if created directory really exists now ... */
+    g_assert(stat(new_dir, &st) == 0);
+    /* ... and is actually a directory */
+    g_assert((st.st_mode & S_IFMT) == S_IFDIR);
+
+    do_unlinkat(v9p, "/", "02", AT_REMOVEDIR);
+    /* directory should be gone now */
+    g_assert(stat(new_dir, &st) != 0);
+
+    g_free(new_dir);
+    g_free(root_path);
+}
+
 static void *assign_9p_local_driver(GString *cmd_line, void *arg)
 {
     virtio_9p_assign_local_driver(cmd_line, "security_model=mapped-xattr");
@@ -1090,6 +1160,7 @@ static void register_virtio_9p_test(void)
     opts.before = assign_9p_local_driver;
     qos_add_test("local/config", "virtio-9p", pci_config,  &opts);
     qos_add_test("local/create_dir", "virtio-9p", fs_create_dir, &opts);
+    qos_add_test("local/unlinkat_dir", "virtio-9p", fs_unlinkat_dir, &opts);
 }
 
 libqos_init(register_virtio_9p_test);
-- 
2.20.1


