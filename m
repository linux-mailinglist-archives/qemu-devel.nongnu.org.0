Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 406E85F4ADC
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 23:25:27 +0200 (CEST)
Received: from localhost ([::1]:38622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofpPq-0004eg-36
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 17:25:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <a6756b30bf2a1b25729c5bbabd1c9534a8f20d6f@lizzy.crudebyte.com>)
 id 1ofpLA-0006Gw-QI
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:20:51 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:60129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <a6756b30bf2a1b25729c5bbabd1c9534a8f20d6f@lizzy.crudebyte.com>)
 id 1ofpL7-0002Is-4F
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:20:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=W/mF2F4tQFVDyngzLVA7v3cT2qQpUTzo3jAH7URYgKo=; b=emUlj
 3ih4unmDN7AWyaWqZ6AG/NjuZV6lbmsfAuerBNZ6paQyZuyzMCUCLSskKkMOHi8LAfec+KkHX8uhP
 k5J3Jg760O4ckUO5e4dD7E3Pni5D0ite65/3Pa35SbR7TfXKYDyzT3Rb3Jb/ZoKYOwJlaUcHY1Tfe
 +MwVXXKRm70iQLjY06wH2tGXRn87S/8frnDoPMOKeS9Iz057V8c+XQUaPkzyJ1PIE48+uKGY+NuyI
 fvONwdaH6+1PdkOG1WvPDScLiRpp7CvTVpji7JENynlykjY1bvlonrV6DjviYke7ZkHtyOA/YGYLY
 uNtjZBcQ+kYGPctuypNZnui80Y1uQ==;
Message-Id: <a6756b30bf2a1b25729c5bbabd1c9534a8f20d6f.1664917004.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1664917004.git.qemu_oss@crudebyte.com>
References: <cover.1664917004.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 4 Oct 2022 22:53:36 +0200
Subject: [PATCH 04/20] tests/9p: merge v9fs_tattach(), do_attach(),
 do_attach_rqid()
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=a6756b30bf2a1b25729c5bbabd1c9534a8f20d6f@lizzy.crudebyte.com;
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

As with previous patches, unify those 3 functions into a single function
v9fs_tattach() by using a declarative function arguments approach.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/libqos/virtio-9p-client.c | 40 ++++++++++++++---
 tests/qtest/libqos/virtio-9p-client.h | 30 ++++++++++++-
 tests/qtest/virtio-9p-test.c          | 62 +++++++++++----------------
 3 files changed, 88 insertions(+), 44 deletions(-)

diff --git a/tests/qtest/libqos/virtio-9p-client.c b/tests/qtest/libqos/virtio-9p-client.c
index e8364f8d64..5e6bd6120c 100644
--- a/tests/qtest/libqos/virtio-9p-client.c
+++ b/tests/qtest/libqos/virtio-9p-client.c
@@ -359,20 +359,48 @@ void v9fs_rversion(P9Req *req, uint16_t *len, char **version)
 }
 
 /* size[4] Tattach tag[2] fid[4] afid[4] uname[s] aname[s] n_uname[4] */
-P9Req *v9fs_tattach(QVirtio9P *v9p, uint32_t fid, uint32_t n_uname,
-                    uint16_t tag)
+TAttachRes v9fs_tattach(TAttachOpt opt)
 {
+    uint32_t err;
     const char *uname = ""; /* ignored by QEMU */
     const char *aname = ""; /* ignored by QEMU */
-    P9Req *req = v9fs_req_init(v9p, 4 + 4 + 2 + 2 + 4, P9_TATTACH, tag);
 
-    v9fs_uint32_write(req, fid);
+    g_assert(opt.client);
+    /* expecting either Rattach or Rlerror, but obviously not both */
+    g_assert(!opt.expectErr || !opt.rattach.qid);
+
+    if (!opt.requestOnly) {
+        v9fs_tversion((TVersionOpt) { .client = opt.client });
+    }
+
+    if (!opt.n_uname) {
+        opt.n_uname = getuid();
+    }
+
+    P9Req *req = v9fs_req_init(opt.client, 4 + 4 + 2 + 2 + 4, P9_TATTACH,
+                               opt.tag);
+
+    v9fs_uint32_write(req, opt.fid);
     v9fs_uint32_write(req, P9_NOFID);
     v9fs_string_write(req, uname);
     v9fs_string_write(req, aname);
-    v9fs_uint32_write(req, n_uname);
+    v9fs_uint32_write(req, opt.n_uname);
     v9fs_req_send(req);
-    return req;
+
+    if (!opt.requestOnly) {
+        v9fs_req_wait_for_reply(req, NULL);
+        if (opt.expectErr) {
+            v9fs_rlerror(req, &err);
+            g_assert_cmpint(err, ==, opt.expectErr);
+        } else {
+            v9fs_rattach(req, opt.rattach.qid);
+        }
+        req = NULL; /* request was freed */
+    }
+
+    return (TAttachRes) {
+        .req = req,
+    };
 }
 
 /* size[4] Rattach tag[2] qid[13] */
diff --git a/tests/qtest/libqos/virtio-9p-client.h b/tests/qtest/libqos/virtio-9p-client.h
index fcde849b5d..64b97b229b 100644
--- a/tests/qtest/libqos/virtio-9p-client.h
+++ b/tests/qtest/libqos/virtio-9p-client.h
@@ -128,6 +128,33 @@ typedef struct TVersionRes {
     P9Req *req;
 } TVersionRes;
 
+/* options for 'Tattach' 9p request */
+typedef struct TAttachOpt {
+    /* 9P client being used (mandatory) */
+    QVirtio9P *client;
+    /* user supplied tag number being returned with response (optional) */
+    uint16_t tag;
+    /* file ID to be associated with root of file tree (optional) */
+    uint32_t fid;
+    /* numerical uid of user being introduced to server (optional) */
+    uint32_t n_uname;
+    /* data being received from 9p server as 'Rattach' response (optional) */
+    struct {
+        /* server's idea of the root of the file tree */
+        v9fs_qid *qid;
+    } rattach;
+    /* only send Tattach request but not wait for a reply? (optional) */
+    bool requestOnly;
+    /* do we expect an Rlerror response, if yes which error code? (optional) */
+    uint32_t expectErr;
+} TAttachOpt;
+
+/* result of 'Tattach' 9p request */
+typedef struct TAttachRes {
+    /* if requestOnly was set: request object for further processing */
+    P9Req *req;
+} TAttachRes;
+
 void v9fs_set_allocator(QGuestAllocator *t_alloc);
 void v9fs_memwrite(P9Req *req, const void *addr, size_t len);
 void v9fs_memskip(P9Req *req, size_t len);
@@ -151,8 +178,7 @@ void v9fs_req_free(P9Req *req);
 void v9fs_rlerror(P9Req *req, uint32_t *err);
 TVersionRes v9fs_tversion(TVersionOpt);
 void v9fs_rversion(P9Req *req, uint16_t *len, char **version);
-P9Req *v9fs_tattach(QVirtio9P *v9p, uint32_t fid, uint32_t n_uname,
-                    uint16_t tag);
+TAttachRes v9fs_tattach(TAttachOpt);
 void v9fs_rattach(P9Req *req, v9fs_qid *qid);
 TWalkRes v9fs_twalk(TWalkOpt opt);
 void v9fs_rwalk(P9Req *req, uint16_t *nwqid, v9fs_qid **wqid);
diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index f2907c8026..271c42f6f9 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -18,6 +18,7 @@
 
 #define twalk(...) v9fs_twalk((TWalkOpt) __VA_ARGS__)
 #define tversion(...) v9fs_tversion((TVersionOpt) __VA_ARGS__)
+#define tattach(...) v9fs_tattach((TAttachOpt) __VA_ARGS__)
 
 static void pci_config(void *obj, void *data, QGuestAllocator *t_alloc)
 {
@@ -48,25 +49,10 @@ static void fs_version(void *obj, void *data, QGuestAllocator *t_alloc)
     tversion({ .client = obj });
 }
 
-static void do_attach_rqid(QVirtio9P *v9p, v9fs_qid *qid)
-{
-    P9Req *req;
-
-    tversion({ .client = v9p });
-    req = v9fs_tattach(v9p, 0, getuid(), 0);
-    v9fs_req_wait_for_reply(req, NULL);
-    v9fs_rattach(req, qid);
-}
-
-static void do_attach(QVirtio9P *v9p)
-{
-    do_attach_rqid(v9p, NULL);
-}
-
 static void fs_attach(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     v9fs_set_allocator(t_alloc);
-    do_attach(obj);
+    tattach({ .client = obj });
 }
 
 static void fs_walk(void *obj, void *data, QGuestAllocator *t_alloc)
@@ -82,7 +68,7 @@ static void fs_walk(void *obj, void *data, QGuestAllocator *t_alloc)
         wnames[i] = g_strdup_printf(QTEST_V9FS_SYNTH_WALK_FILE, i);
     }
 
-    do_attach(v9p);
+    tattach({ .client = v9p });
     twalk({
         .client = v9p, .fid = 0, .newfid = 1,
         .nwname = P9_MAXWELEM, .wnames = wnames,
@@ -118,7 +104,7 @@ static void fs_readdir(void *obj, void *data, QGuestAllocator *t_alloc)
     struct V9fsDirent *entries = NULL;
     P9Req *req;
 
-    do_attach(v9p);
+    tattach({ .client = v9p });
     twalk({
         .client = v9p, .fid = 0, .newfid = 1,
         .nwname = 1, .wnames = wnames, .rwalk.nwqid = &nqid
@@ -173,7 +159,7 @@ static void do_readdir_split(QVirtio9P *v9p, uint32_t count)
     int fid;
     uint64_t offset;
 
-    do_attach(v9p);
+    tattach({ .client = v9p });
 
     fid = 1;
     offset = 0;
@@ -248,7 +234,7 @@ static void fs_walk_no_slash(void *obj, void *data, QGuestAllocator *t_alloc)
     v9fs_set_allocator(t_alloc);
     char *wnames[] = { g_strdup(" /") };
 
-    do_attach(v9p);
+    tattach({ .client = v9p });
     twalk({
         .client = v9p, .fid = 0, .newfid = 1, .nwname = 1, .wnames = wnames,
         .expectErr = ENOENT
@@ -262,7 +248,7 @@ static void fs_walk_nonexistent(void *obj, void *data, QGuestAllocator *t_alloc)
     QVirtio9P *v9p = obj;
     v9fs_set_allocator(t_alloc);
 
-    do_attach(v9p);
+    tattach({ .client = v9p });
     /*
      * The 9p2000 protocol spec says: "If the first element cannot be walked
      * for any reason, Rerror is returned."
@@ -284,7 +270,7 @@ static void fs_walk_2nd_nonexistent(void *obj, void *data,
         QTEST_V9FS_SYNTH_WALK_FILE "/non-existent", 0
     );
 
-    do_attach_rqid(v9p, &root_qid);
+    tattach({ .client = v9p, .rattach.qid = &root_qid });
     fid = twalk({
         .client = v9p, .path = path,
         .rwalk = { .nwqid = &nwqid, .wqid = &wqid }
@@ -316,7 +302,9 @@ static void fs_walk_none(void *obj, void *data, QGuestAllocator *t_alloc)
     struct v9fs_attr attr;
 
     tversion({ .client = v9p });
-    req = v9fs_tattach(v9p, 0, getuid(), 0);
+    req = tattach({
+        .client = v9p, .fid = 0, .n_uname = getuid(), .requestOnly = true
+    }).req;
     v9fs_req_wait_for_reply(req, NULL);
     v9fs_rattach(req, &root_qid);
 
@@ -345,7 +333,9 @@ static void fs_walk_dotdot(void *obj, void *data, QGuestAllocator *t_alloc)
     P9Req *req;
 
     tversion({ .client = v9p });
-    req = v9fs_tattach(v9p, 0, getuid(), 0);
+    req = tattach((TAttachOpt) {
+        .client = v9p, .fid = 0, .n_uname = getuid(), .requestOnly = true
+    }).req;
     v9fs_req_wait_for_reply(req, NULL);
     v9fs_rattach(req, &root_qid);
 
@@ -366,7 +356,7 @@ static void fs_lopen(void *obj, void *data, QGuestAllocator *t_alloc)
     char *wnames[] = { g_strdup(QTEST_V9FS_SYNTH_LOPEN_FILE) };
     P9Req *req;
 
-    do_attach(v9p);
+    tattach({ .client = v9p });
     twalk({
         .client = v9p, .fid = 0, .newfid = 1, .nwname = 1, .wnames = wnames
     });
@@ -388,7 +378,7 @@ static void fs_write(void *obj, void *data, QGuestAllocator *t_alloc)
     uint32_t count;
     P9Req *req;
 
-    do_attach(v9p);
+    tattach({ .client = v9p });
     twalk({
         .client = v9p, .fid = 0, .newfid = 1, .nwname = 1, .wnames = wnames
     });
@@ -414,7 +404,7 @@ static void fs_flush_success(void *obj, void *data, QGuestAllocator *t_alloc)
     uint32_t reply_len;
     uint8_t should_block;
 
-    do_attach(v9p);
+    tattach({ .client = v9p });
     twalk({
         .client = v9p, .fid = 0, .newfid = 1, .nwname = 1, .wnames = wnames
     });
@@ -451,7 +441,7 @@ static void fs_flush_ignored(void *obj, void *data, QGuestAllocator *t_alloc)
     uint32_t count;
     uint8_t should_block;
 
-    do_attach(v9p);
+    tattach({ .client = v9p });
     twalk({
         .client = v9p, .fid = 0, .newfid = 1, .nwname = 1, .wnames = wnames
     });
@@ -588,7 +578,7 @@ static void fs_create_dir(void *obj, void *data, QGuestAllocator *t_alloc)
 
     g_assert(root_path != NULL);
 
-    do_attach(v9p);
+    tattach({ .client = v9p });
     do_mkdir(v9p, "/", "01");
 
     /* check if created directory really exists now ... */
@@ -607,7 +597,7 @@ static void fs_unlinkat_dir(void *obj, void *data, QGuestAllocator *t_alloc)
 
     g_assert(root_path != NULL);
 
-    do_attach(v9p);
+    tattach({ .client = v9p });
     do_mkdir(v9p, "/", "02");
 
     /* check if created directory really exists now ... */
@@ -627,7 +617,7 @@ static void fs_create_file(void *obj, void *data, QGuestAllocator *t_alloc)
     struct stat st;
     g_autofree char *new_file = virtio_9p_test_path("03/1st_file");
 
-    do_attach(v9p);
+    tattach({ .client = v9p });
     do_mkdir(v9p, "/", "03");
     do_lcreate(v9p, "03", "1st_file");
 
@@ -644,7 +634,7 @@ static void fs_unlinkat_file(void *obj, void *data, QGuestAllocator *t_alloc)
     struct stat st;
     g_autofree char *new_file = virtio_9p_test_path("04/doa_file");
 
-    do_attach(v9p);
+    tattach({ .client = v9p });
     do_mkdir(v9p, "/", "04");
     do_lcreate(v9p, "04", "doa_file");
 
@@ -666,7 +656,7 @@ static void fs_symlink_file(void *obj, void *data, QGuestAllocator *t_alloc)
     g_autofree char *real_file = virtio_9p_test_path("05/real_file");
     g_autofree char *symlink_file = virtio_9p_test_path("05/symlink_file");
 
-    do_attach(v9p);
+    tattach({ .client = v9p });
     do_mkdir(v9p, "/", "05");
     do_lcreate(v9p, "05", "real_file");
     g_assert(stat(real_file, &st) == 0);
@@ -687,7 +677,7 @@ static void fs_unlinkat_symlink(void *obj, void *data,
     g_autofree char *real_file = virtio_9p_test_path("06/real_file");
     g_autofree char *symlink_file = virtio_9p_test_path("06/symlink_file");
 
-    do_attach(v9p);
+    tattach({ .client = v9p });
     do_mkdir(v9p, "/", "06");
     do_lcreate(v9p, "06", "real_file");
     g_assert(stat(real_file, &st) == 0);
@@ -709,7 +699,7 @@ static void fs_hardlink_file(void *obj, void *data, QGuestAllocator *t_alloc)
     g_autofree char *real_file = virtio_9p_test_path("07/real_file");
     g_autofree char *hardlink_file = virtio_9p_test_path("07/hardlink_file");
 
-    do_attach(v9p);
+    tattach({ .client = v9p });
     do_mkdir(v9p, "/", "07");
     do_lcreate(v9p, "07", "real_file");
     g_assert(stat(real_file, &st_real) == 0);
@@ -734,7 +724,7 @@ static void fs_unlinkat_hardlink(void *obj, void *data,
     g_autofree char *real_file = virtio_9p_test_path("08/real_file");
     g_autofree char *hardlink_file = virtio_9p_test_path("08/hardlink_file");
 
-    do_attach(v9p);
+    tattach({ .client = v9p });
     do_mkdir(v9p, "/", "08");
     do_lcreate(v9p, "08", "real_file");
     g_assert(stat(real_file, &st_real) == 0);
-- 
2.30.2


