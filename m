Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C055F4B37
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 23:57:39 +0200 (CEST)
Received: from localhost ([::1]:54912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofpv0-0008KO-33
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 17:57:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <1dea593edd464908d92501933c068388c01f1744@lizzy.crudebyte.com>)
 id 1ofpMj-0007bZ-K0
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:22:14 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:42613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <1dea593edd464908d92501933c068388c01f1744@lizzy.crudebyte.com>)
 id 1ofpMh-0002oI-Fd
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:22:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=mX9oEwfmleHCGs8KbSzwK1pL5FOddn35HCSGO+dBVOg=; b=EcYdd
 Kl7fKPcjVHBb967Z/Wro9UM0wskeT5/plZXmOe75ar5s0Xjoum0FuhyQFcegagKJJ5Ik+IOAD2vRt
 IKCKwylwlczVIDv07UNP9iCTEf+gvxnpockBIxAwiMznYauc2rNPM4/X5IO/UYbgMceyPdRW6D/yR
 6q/LftOiCGUtkVrNvpkcAolcQJZdW+AHoBtWG1/RA+et/utt9OJWXeIlh6UDZubaJ17AolX3KwRXe
 qHSYlYN/LvJTVcMdVZ/K4XHXaL+WUSi36KaZrxP/u+OYpxj5+Z/gwY2i8DKyzmGu0u49OPjjr+Hum
 nusDh+AWo2WhioGuyLRT6f1dbKbDw==;
Message-Id: <1dea593edd464908d92501933c068388c01f1744.1664917004.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1664917004.git.qemu_oss@crudebyte.com>
References: <cover.1664917004.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 4 Oct 2022 22:54:16 +0200
Subject: [PATCH 19/20] tests/9p: merge v9fs_tunlinkat() and do_unlinkat()
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=1dea593edd464908d92501933c068388c01f1744@lizzy.crudebyte.com;
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
v9fs_tunlinkat() by using a declarative function arguments approach.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/libqos/virtio-9p-client.c | 37 +++++++++++++++++++++------
 tests/qtest/libqos/virtio-9p-client.h | 29 +++++++++++++++++++--
 tests/qtest/virtio-9p-test.c          | 26 ++++++-------------
 3 files changed, 64 insertions(+), 28 deletions(-)

diff --git a/tests/qtest/libqos/virtio-9p-client.c b/tests/qtest/libqos/virtio-9p-client.c
index a2770719b9..e017e030ec 100644
--- a/tests/qtest/libqos/virtio-9p-client.c
+++ b/tests/qtest/libqos/virtio-9p-client.c
@@ -1004,23 +1004,44 @@ void v9fs_rlink(P9Req *req)
 }
 
 /* size[4] Tunlinkat tag[2] dirfd[4] name[s] flags[4] */
-P9Req *v9fs_tunlinkat(QVirtio9P *v9p, uint32_t dirfd, const char *name,
-                      uint32_t flags, uint16_t tag)
+TunlinkatRes v9fs_tunlinkat(TunlinkatOpt opt)
 {
     P9Req *req;
+    uint32_t err;
+
+    g_assert(opt.client);
+    /* expecting either hi-level atPath or low-level dirfd, but not both */
+    g_assert(!opt.atPath || !opt.dirfd);
+
+    if (opt.atPath) {
+        opt.dirfd = v9fs_twalk((TWalkOpt) { .client = opt.client,
+                                            .path = opt.atPath }).newfid;
+    }
 
     uint32_t body_size = 4 + 4;
-    uint16_t string_size = v9fs_string_size(name);
+    uint16_t string_size = v9fs_string_size(opt.name);
 
     g_assert_cmpint(body_size, <=, UINT32_MAX - string_size);
     body_size += string_size;
 
-    req = v9fs_req_init(v9p, body_size, P9_TUNLINKAT, tag);
-    v9fs_uint32_write(req, dirfd);
-    v9fs_string_write(req, name);
-    v9fs_uint32_write(req, flags);
+    req = v9fs_req_init(opt.client, body_size, P9_TUNLINKAT, opt.tag);
+    v9fs_uint32_write(req, opt.dirfd);
+    v9fs_string_write(req, opt.name);
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
+            v9fs_runlinkat(req);
+        }
+        req = NULL; /* request was freed */
+    }
+
+    return (TunlinkatRes) { .req = req };
 }
 
 /* size[4] Runlinkat tag[2] */
diff --git a/tests/qtest/libqos/virtio-9p-client.h b/tests/qtest/libqos/virtio-9p-client.h
index 49ffd0fc51..78228eb97d 100644
--- a/tests/qtest/libqos/virtio-9p-client.h
+++ b/tests/qtest/libqos/virtio-9p-client.h
@@ -415,6 +415,32 @@ typedef struct TlinkRes {
     P9Req *req;
 } TlinkRes;
 
+/* options for 'Tunlinkat' 9p request */
+typedef struct TunlinkatOpt {
+    /* 9P client being used (mandatory) */
+    QVirtio9P *client;
+    /* user supplied tag number being returned with response (optional) */
+    uint16_t tag;
+    /* low-level variant of directory where name shall be unlinked */
+    uint32_t dirfd;
+    /* high-level variant of directory where name shall be unlinked */
+    const char *atPath;
+    /* name of directory entry to be unlinked (required) */
+    const char *name;
+    /* Linux unlinkat(2) flags */
+    uint32_t flags;
+    /* only send Tunlinkat request but not wait for a reply? (optional) */
+    bool requestOnly;
+    /* do we expect an Rlerror response, if yes which error code? (optional) */
+    uint32_t expectErr;
+} TunlinkatOpt;
+
+/* result of 'Tunlinkat' 9p request */
+typedef struct TunlinkatRes {
+    /* if requestOnly was set: request object for further processing */
+    P9Req *req;
+} TunlinkatRes;
+
 void v9fs_set_allocator(QGuestAllocator *t_alloc);
 void v9fs_memwrite(P9Req *req, const void *addr, size_t len);
 void v9fs_memskip(P9Req *req, size_t len);
@@ -462,8 +488,7 @@ TsymlinkRes v9fs_tsymlink(TsymlinkOpt);
 void v9fs_rsymlink(P9Req *req, v9fs_qid *qid);
 TlinkRes v9fs_tlink(TlinkOpt);
 void v9fs_rlink(P9Req *req);
-P9Req *v9fs_tunlinkat(QVirtio9P *v9p, uint32_t dirfd, const char *name,
-                      uint32_t flags, uint16_t tag);
+TunlinkatRes v9fs_tunlinkat(TunlinkatOpt);
 void v9fs_runlinkat(P9Req *req);
 
 #endif
diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 185eaf8b1e..65e69491e5 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -28,6 +28,7 @@
 #define tlcreate(...) v9fs_tlcreate((TlcreateOpt) __VA_ARGS__)
 #define tsymlink(...) v9fs_tsymlink((TsymlinkOpt) __VA_ARGS__)
 #define tlink(...) v9fs_tlink((TlinkOpt) __VA_ARGS__)
+#define tunlinkat(...) v9fs_tunlinkat((TunlinkatOpt) __VA_ARGS__)
 
 static void pci_config(void *obj, void *data, QGuestAllocator *t_alloc)
 {
@@ -481,20 +482,6 @@ static void fs_flush_ignored(void *obj, void *data, QGuestAllocator *t_alloc)
     g_free(wnames[0]);
 }
 
-static void do_unlinkat(QVirtio9P *v9p, const char *atpath, const char *rpath,
-                        uint32_t flags)
-{
-    g_autofree char *name = g_strdup(rpath);
-    uint32_t fid;
-    P9Req *req;
-
-    fid = twalk({ .client = v9p, .path = atpath }).newfid;
-
-    req = v9fs_tunlinkat(v9p, fid, name, flags, 0);
-    v9fs_req_wait_for_reply(req, NULL);
-    v9fs_runlinkat(req);
-}
-
 static void fs_readdir_split_128(void *obj, void *data,
                                  QGuestAllocator *t_alloc)
 {
@@ -556,7 +543,10 @@ static void fs_unlinkat_dir(void *obj, void *data, QGuestAllocator *t_alloc)
     /* ... and is actually a directory */
     g_assert((st.st_mode & S_IFMT) == S_IFDIR);
 
-    do_unlinkat(v9p, "/", "02", P9_DOTL_AT_REMOVEDIR);
+    tunlinkat({
+        .client = v9p, .atPath = "/", .name = "02",
+        .flags = P9_DOTL_AT_REMOVEDIR
+    });
     /* directory should be gone now */
     g_assert(stat(new_dir, &st) != 0);
 }
@@ -594,7 +584,7 @@ static void fs_unlinkat_file(void *obj, void *data, QGuestAllocator *t_alloc)
     /* ... and is a regular file */
     g_assert((st.st_mode & S_IFMT) == S_IFREG);
 
-    do_unlinkat(v9p, "04", "doa_file", 0);
+    tunlinkat({ .client = v9p, .atPath = "04", .name = "doa_file" });
     /* file should be gone now */
     g_assert(stat(new_file, &st) != 0);
 }
@@ -643,7 +633,7 @@ static void fs_unlinkat_symlink(void *obj, void *data,
     });
     g_assert(stat(symlink_file, &st) == 0);
 
-    do_unlinkat(v9p, "06", "symlink_file", 0);
+    tunlinkat({ .client = v9p, .atPath = "06", .name = "symlink_file" });
     /* symlink should be gone now */
     g_assert(stat(symlink_file, &st) != 0);
 }
@@ -696,7 +686,7 @@ static void fs_unlinkat_hardlink(void *obj, void *data,
     });
     g_assert(stat(hardlink_file, &st_link) == 0);
 
-    do_unlinkat(v9p, "08", "hardlink_file", 0);
+    tunlinkat({ .client = v9p, .atPath = "08", .name = "hardlink_file" });
     /* symlink should be gone now */
     g_assert(stat(hardlink_file, &st_link) != 0);
     /* and old file should still exist */
-- 
2.30.2


