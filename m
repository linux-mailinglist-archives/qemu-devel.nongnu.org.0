Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFC560A2E2
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 13:48:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omvNn-0001EV-ER; Mon, 24 Oct 2022 07:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <d41a9462ea15f0e3ef789d496032536c33098275@lizzy.crudebyte.com>)
 id 1omvNi-0001Ct-Er
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 07:12:37 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <d41a9462ea15f0e3ef789d496032536c33098275@lizzy.crudebyte.com>)
 id 1omvNT-0007ir-8W
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 07:12:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=vChMvOV4Fs5nN+flMr1JIltDZPXWUAIVq6xErmq0yGg=; b=MNt75
 ZLIn1CLhuFVKOzl7em7QCJeAEOUbPfUZEwzl0JMSzZlQPZ2cyl/myvR5dLMU9Zyp+Z2sS6WgWv1tT
 HaX905FgGM6C7zw0DdbWGE9iI47jEStQEXLRa+boQRM346evHRr39eosObHaM8l7zw9/8I1/Qf6f4
 L4rWXGBgmdKuEH1NNh6I0HWPseQtafJVM6M5BPu+WWtY1Pe7NRtBCROfDddB1yp7nnOmHPZlxLGxb
 Nd1OOkcBx00Px2aruITIozmrFb9V29Ro9y4n2875FhcEbAM56FlsknqMwZAjGd6e0+hpqp4vePFyb
 566X2dVNTt74lODlxDKJ0U/3DKi3Q==;
Message-Id: <d41a9462ea15f0e3ef789d496032536c33098275.1666608862.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1666608862.git.qemu_oss@crudebyte.com>
References: <cover.1666608862.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 24 Oct 2022 12:54:23 +0200
Subject: [PULL 21/23] tests/9p: merge v9fs_tlink() and do_hardlink()
To: qemu-devel@nongnu.org,
    Stefan Hajnoczi <stefanha@redhat.com>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=d41a9462ea15f0e3ef789d496032536c33098275@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

As with previous patches, unify those 2 functions into a single function
v9fs_tlink() by using a declarative function arguments approach.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Message-Id: <cb4d42203e1e4e6027df4924bbe4bdbc002f668b.1664917004.git.qemu_oss@crudebyte.com>
---
 tests/qtest/libqos/virtio-9p-client.c | 43 ++++++++++++++++++++++-----
 tests/qtest/libqos/virtio-9p-client.h | 31 +++++++++++++++++--
 tests/qtest/virtio-9p-test.c          | 26 ++++++----------
 3 files changed, 73 insertions(+), 27 deletions(-)

diff --git a/tests/qtest/libqos/virtio-9p-client.c b/tests/qtest/libqos/virtio-9p-client.c
index 89eaf50355..a2770719b9 100644
--- a/tests/qtest/libqos/virtio-9p-client.c
+++ b/tests/qtest/libqos/virtio-9p-client.c
@@ -950,23 +950,50 @@ void v9fs_rsymlink(P9Req *req, v9fs_qid *qid)
 }
 
 /* size[4] Tlink tag[2] dfid[4] fid[4] name[s] */
-P9Req *v9fs_tlink(QVirtio9P *v9p, uint32_t dfid, uint32_t fid,
-                  const char *name, uint16_t tag)
+TlinkRes v9fs_tlink(TlinkOpt opt)
 {
     P9Req *req;
+    uint32_t err;
+
+    g_assert(opt.client);
+    /* expecting either hi-level atPath or low-level dfid, but not both */
+    g_assert(!opt.atPath || !opt.dfid);
+    /* expecting either hi-level toPath or low-level fid, but not both */
+    g_assert(!opt.toPath || !opt.fid);
+
+    if (opt.atPath) {
+        opt.dfid = v9fs_twalk((TWalkOpt) { .client = opt.client,
+                                           .path = opt.atPath }).newfid;
+    }
+    if (opt.toPath) {
+        opt.fid = v9fs_twalk((TWalkOpt) { .client = opt.client,
+                                          .path = opt.toPath }).newfid;
+    }
 
     uint32_t body_size = 4 + 4;
-    uint16_t string_size = v9fs_string_size(name);
+    uint16_t string_size = v9fs_string_size(opt.name);
 
     g_assert_cmpint(body_size, <=, UINT32_MAX - string_size);
     body_size += string_size;
 
-    req = v9fs_req_init(v9p, body_size, P9_TLINK, tag);
-    v9fs_uint32_write(req, dfid);
-    v9fs_uint32_write(req, fid);
-    v9fs_string_write(req, name);
+    req = v9fs_req_init(opt.client, body_size, P9_TLINK, opt.tag);
+    v9fs_uint32_write(req, opt.dfid);
+    v9fs_uint32_write(req, opt.fid);
+    v9fs_string_write(req, opt.name);
     v9fs_req_send(req);
-    return req;
+
+    if (!opt.requestOnly) {
+        v9fs_req_wait_for_reply(req, NULL);
+        if (opt.expectErr) {
+            v9fs_rlerror(req, &err);
+            g_assert_cmpint(err, ==, opt.expectErr);
+        } else {
+            v9fs_rlink(req);
+        }
+        req = NULL; /* request was freed */
+    }
+
+    return (TlinkRes) { .req = req };
 }
 
 /* size[4] Rlink tag[2] */
diff --git a/tests/qtest/libqos/virtio-9p-client.h b/tests/qtest/libqos/virtio-9p-client.h
index b905a54966..49ffd0fc51 100644
--- a/tests/qtest/libqos/virtio-9p-client.h
+++ b/tests/qtest/libqos/virtio-9p-client.h
@@ -387,6 +387,34 @@ typedef struct TsymlinkRes {
     P9Req *req;
 } TsymlinkRes;
 
+/* options for 'Tlink' 9p request */
+typedef struct TlinkOpt {
+    /* 9P client being used (mandatory) */
+    QVirtio9P *client;
+    /* user supplied tag number being returned with response (optional) */
+    uint16_t tag;
+    /* low-level variant of directory where hard link shall be created */
+    uint32_t dfid;
+    /* high-level variant of directory where hard link shall be created */
+    const char *atPath;
+    /* low-level variant of target referenced by new hard link */
+    uint32_t fid;
+    /* high-level variant of target referenced by new hard link */
+    const char *toPath;
+    /* name of hard link (required) */
+    const char *name;
+    /* only send Tlink request but not wait for a reply? (optional) */
+    bool requestOnly;
+    /* do we expect an Rlerror response, if yes which error code? (optional) */
+    uint32_t expectErr;
+} TlinkOpt;
+
+/* result of 'Tlink' 9p request */
+typedef struct TlinkRes {
+    /* if requestOnly was set: request object for further processing */
+    P9Req *req;
+} TlinkRes;
+
 void v9fs_set_allocator(QGuestAllocator *t_alloc);
 void v9fs_memwrite(P9Req *req, const void *addr, size_t len);
 void v9fs_memskip(P9Req *req, size_t len);
@@ -432,8 +460,7 @@ TlcreateRes v9fs_tlcreate(TlcreateOpt);
 void v9fs_rlcreate(P9Req *req, v9fs_qid *qid, uint32_t *iounit);
 TsymlinkRes v9fs_tsymlink(TsymlinkOpt);
 void v9fs_rsymlink(P9Req *req, v9fs_qid *qid);
-P9Req *v9fs_tlink(QVirtio9P *v9p, uint32_t dfid, uint32_t fid,
-                  const char *name, uint16_t tag);
+TlinkRes v9fs_tlink(TlinkOpt);
 void v9fs_rlink(P9Req *req);
 P9Req *v9fs_tunlinkat(QVirtio9P *v9p, uint32_t dirfd, const char *name,
                       uint32_t flags, uint16_t tag);
diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index c7213d6caf..185eaf8b1e 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -27,6 +27,7 @@
 #define tmkdir(...) v9fs_tmkdir((TMkdirOpt) __VA_ARGS__)
 #define tlcreate(...) v9fs_tlcreate((TlcreateOpt) __VA_ARGS__)
 #define tsymlink(...) v9fs_tsymlink((TsymlinkOpt) __VA_ARGS__)
+#define tlink(...) v9fs_tlink((TlinkOpt) __VA_ARGS__)
 
 static void pci_config(void *obj, void *data, QGuestAllocator *t_alloc)
 {
@@ -480,21 +481,6 @@ static void fs_flush_ignored(void *obj, void *data, QGuestAllocator *t_alloc)
     g_free(wnames[0]);
 }
 
-/* create a hard link named @a clink in directory @a path pointing to @a to */
-static void do_hardlink(QVirtio9P *v9p, const char *path, const char *clink,
-                        const char *to)
-{
-    uint32_t dfid, fid;
-    P9Req *req;
-
-    dfid = twalk({ .client = v9p, .path = path }).newfid;
-    fid = twalk({ .client = v9p, .path = to }).newfid;
-
-    req = v9fs_tlink(v9p, dfid, fid, clink, 0);
-    v9fs_req_wait_for_reply(req, NULL);
-    v9fs_rlink(req);
-}
-
 static void do_unlinkat(QVirtio9P *v9p, const char *atpath, const char *rpath,
                         uint32_t flags)
 {
@@ -676,7 +662,10 @@ static void fs_hardlink_file(void *obj, void *data, QGuestAllocator *t_alloc)
     g_assert(stat(real_file, &st_real) == 0);
     g_assert((st_real.st_mode & S_IFMT) == S_IFREG);
 
-    do_hardlink(v9p, "07", "hardlink_file", "07/real_file");
+    tlink({
+        .client = v9p, .atPath = "07", .name = "hardlink_file",
+        .toPath = "07/real_file"
+    });
 
     /* check if link exists now ... */
     g_assert(stat(hardlink_file, &st_link) == 0);
@@ -701,7 +690,10 @@ static void fs_unlinkat_hardlink(void *obj, void *data,
     g_assert(stat(real_file, &st_real) == 0);
     g_assert((st_real.st_mode & S_IFMT) == S_IFREG);
 
-    do_hardlink(v9p, "08", "hardlink_file", "08/real_file");
+    tlink({
+        .client = v9p, .atPath = "08", .name = "hardlink_file",
+        .toPath = "08/real_file"
+    });
     g_assert(stat(hardlink_file, &st_link) == 0);
 
     do_unlinkat(v9p, "08", "hardlink_file", 0);
-- 
2.30.2


