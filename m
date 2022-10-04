Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F805F4ADB
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 23:25:17 +0200 (CEST)
Received: from localhost ([::1]:58078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofpPg-00045O-09
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 17:25:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <607969dbfbc63c1be008df9131133711b046e979@lizzy.crudebyte.com>)
 id 1ofpKu-0006DM-4i
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:20:27 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:45645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <607969dbfbc63c1be008df9131133711b046e979@lizzy.crudebyte.com>)
 id 1ofpKp-0002Ht-I7
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:20:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=Xx9ZFaI+MNa/ItK1XPYsLLiLRI8ZeKZVEa6K05U9msM=; b=RWHca
 cjK3p51MZ8MNccogFQebolli85M2KT5YNCs402X0y8/jL5z84XwKWWlm+cAMzN5l5uFwfrflWT7Sj
 0rXC7ozXe9yfm73+6EfTfVSYStknd8MTXPIoKFJmhEc0vSzKSOWMisWsw0x+vtYeyeR8AX7sRnCFd
 tE4ZUnf37EyuVuSxMHnntrf5D9p/avZcWps3VPMf1ZR6zrOHoyP+dIqb3+/Ur2G17ox4ZYHvrej6D
 M2bUGhEqDQItb2X6SWHx/DLZ95vXu/0/HCVulgxixC5lca1IlC/6VDHaZ5S2Z46KFtKYU2n4BnQRx
 /0Umiz35+SI4bZaoWE3Qi4dxV5Z1Q==;
Message-Id: <607969dbfbc63c1be008df9131133711b046e979.1664917004.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1664917004.git.qemu_oss@crudebyte.com>
References: <cover.1664917004.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 4 Oct 2022 22:53:23 +0200
Subject: [PATCH 01/20] tests/9p: merge *walk*() functions
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=607969dbfbc63c1be008df9131133711b046e979@lizzy.crudebyte.com;
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

Introduce declarative function calls.

There are currently 4 different functions for sending a 9p 'Twalk'
request: v9fs_twalk(), do_walk(), do_walk_rqids() and
do_walk_expect_error(). They are all doing the same thing, just in a
slightly different way and with slightly different function arguments.

Merge those 4 functions into a single function by using a struct for
function call arguments and use designated initializers when calling
this function to turn usage into a declarative approach, which is
better readable and easier to maintain.

Also move private functions genfid(), split() and split_free() from
virtio-9p-test.c to virtio-9p-client.c.

Based-on: <E1odrya-0004Fv-97@lizzy.crudebyte.com>
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/libqos/virtio-9p-client.c | 114 ++++++++++++++--
 tests/qtest/libqos/virtio-9p-client.h |  37 ++++-
 tests/qtest/virtio-9p-test.c          | 187 +++++++++-----------------
 3 files changed, 198 insertions(+), 140 deletions(-)

diff --git a/tests/qtest/libqos/virtio-9p-client.c b/tests/qtest/libqos/virtio-9p-client.c
index f5c35fd722..a95bbad9c8 100644
--- a/tests/qtest/libqos/virtio-9p-client.c
+++ b/tests/qtest/libqos/virtio-9p-client.c
@@ -23,6 +23,65 @@ void v9fs_set_allocator(QGuestAllocator *t_alloc)
     alloc = t_alloc;
 }
 
+/*
+ * Used to auto generate new fids. Start with arbitrary high value to avoid
+ * collision with hard coded fids in basic test code.
+ */
+static uint32_t fid_generator = 1000;
+
+static uint32_t genfid(void)
+{
+    return fid_generator++;
+}
+
+/**
+ * Splits the @a in string by @a delim into individual (non empty) strings
+ * and outputs them to @a out. The output array @a out is NULL terminated.
+ *
+ * Output array @a out must be freed by calling split_free().
+ *
+ * @returns number of individual elements in output array @a out (without the
+ *          final NULL terminating element)
+ */
+static int split(const char *in, const char *delim, char ***out)
+{
+    int n = 0, i = 0;
+    char *tmp, *p;
+
+    tmp = g_strdup(in);
+    for (p = strtok(tmp, delim); p != NULL; p = strtok(NULL, delim)) {
+        if (strlen(p) > 0) {
+            ++n;
+        }
+    }
+    g_free(tmp);
+
+    *out = g_new0(char *, n + 1); /* last element NULL delimiter */
+
+    tmp = g_strdup(in);
+    for (p = strtok(tmp, delim); p != NULL; p = strtok(NULL, delim)) {
+        if (strlen(p) > 0) {
+            (*out)[i++] = g_strdup(p);
+        }
+    }
+    g_free(tmp);
+
+    return n;
+}
+
+static void split_free(char ***out)
+{
+    int i;
+    if (!*out) {
+        return;
+    }
+    for (i = 0; (*out)[i]; ++i) {
+        g_free((*out)[i]);
+    }
+    g_free(*out);
+    *out = NULL;
+}
+
 void v9fs_memwrite(P9Req *req, const void *addr, size_t len)
 {
     qtest_memwrite(req->qts, req->t_msg + req->t_off, addr, len);
@@ -294,28 +353,61 @@ void v9fs_rattach(P9Req *req, v9fs_qid *qid)
 }
 
 /* size[4] Twalk tag[2] fid[4] newfid[4] nwname[2] nwname*(wname[s]) */
-P9Req *v9fs_twalk(QVirtio9P *v9p, uint32_t fid, uint32_t newfid,
-                  uint16_t nwname, char *const wnames[], uint16_t tag)
+TWalkRes v9fs_twalk(TWalkOpt opt)
 {
     P9Req *req;
     int i;
     uint32_t body_size = 4 + 4 + 2;
+    uint32_t err;
+    char **wnames = NULL;
 
-    for (i = 0; i < nwname; i++) {
-        uint16_t wname_size = v9fs_string_size(wnames[i]);
+    g_assert(opt.client);
+    /* expecting either high- or low-level path, both not both */
+    g_assert(!opt.path || !(opt.nwname || opt.wnames));
+    /* expecting either Rwalk or Rlerror, but obviously not both */
+    g_assert(!opt.expectErr || !(opt.rwalk.nwqid || opt.rwalk.wqid));
+
+    if (!opt.newfid) {
+        opt.newfid = genfid();
+    }
+
+    if (opt.path) {
+        opt.nwname = split(opt.path, "/", &wnames);
+        opt.wnames = wnames;
+    }
+
+    for (i = 0; i < opt.nwname; i++) {
+        uint16_t wname_size = v9fs_string_size(opt.wnames[i]);
 
         g_assert_cmpint(body_size, <=, UINT32_MAX - wname_size);
         body_size += wname_size;
     }
-    req = v9fs_req_init(v9p,  body_size, P9_TWALK, tag);
-    v9fs_uint32_write(req, fid);
-    v9fs_uint32_write(req, newfid);
-    v9fs_uint16_write(req, nwname);
-    for (i = 0; i < nwname; i++) {
-        v9fs_string_write(req, wnames[i]);
+    req = v9fs_req_init(opt.client, body_size, P9_TWALK, opt.tag);
+    v9fs_uint32_write(req, opt.fid);
+    v9fs_uint32_write(req, opt.newfid);
+    v9fs_uint16_write(req, opt.nwname);
+    for (i = 0; i < opt.nwname; i++) {
+        v9fs_string_write(req, opt.wnames[i]);
     }
     v9fs_req_send(req);
-    return req;
+
+    if (!opt.requestOnly) {
+        v9fs_req_wait_for_reply(req, NULL);
+        if (opt.expectErr) {
+            v9fs_rlerror(req, &err);
+            g_assert_cmpint(err, ==, opt.expectErr);
+        } else {
+            v9fs_rwalk(req, opt.rwalk.nwqid, opt.rwalk.wqid);
+        }
+        req = NULL; /* request was freed */
+    }
+
+    split_free(&wnames);
+
+    return (TWalkRes) {
+        .newfid = opt.newfid,
+        .req = req,
+    };
 }
 
 /* size[4] Rwalk tag[2] nwqid[2] nwqid*(wqid[13]) */
diff --git a/tests/qtest/libqos/virtio-9p-client.h b/tests/qtest/libqos/virtio-9p-client.h
index c502d12a66..8c6abbb173 100644
--- a/tests/qtest/libqos/virtio-9p-client.h
+++ b/tests/qtest/libqos/virtio-9p-client.h
@@ -72,6 +72,40 @@ struct V9fsDirent {
     struct V9fsDirent *next;
 };
 
+/* options for 'Twalk' 9p request */
+typedef struct TWalkOpt {
+    /* 9P client being used (mandatory) */
+    QVirtio9P *client;
+    /* user supplied tag number being returned with response (optional) */
+    uint16_t tag;
+    /* file ID of directory from where walk should start (optional) */
+    uint32_t fid;
+    /* file ID for target directory being walked to (optional) */
+    uint32_t newfid;
+    /* low level variant of path to walk to (optional) */
+    uint16_t nwname;
+    char **wnames;
+    /* high level variant of path to walk to (optional) */
+    const char *path;
+    /* data being received from 9p server as 'Rwalk' response (optional) */
+    struct {
+        uint16_t *nwqid;
+        v9fs_qid **wqid;
+    } rwalk;
+    /* only send Twalk request but not wait for a reply? (optional) */
+    bool requestOnly;
+    /* do we expect an Rlerror response, if yes which error code? (optional) */
+    uint32_t expectErr;
+} TWalkOpt;
+
+/* result of 'Twalk' 9p request */
+typedef struct TWalkRes {
+    /* file ID of target directory been walked to */
+    uint32_t newfid;
+    /* if requestOnly was set: request object for further processing */
+    P9Req *req;
+} TWalkRes;
+
 void v9fs_set_allocator(QGuestAllocator *t_alloc);
 void v9fs_memwrite(P9Req *req, const void *addr, size_t len);
 void v9fs_memskip(P9Req *req, size_t len);
@@ -99,8 +133,7 @@ void v9fs_rversion(P9Req *req, uint16_t *len, char **version);
 P9Req *v9fs_tattach(QVirtio9P *v9p, uint32_t fid, uint32_t n_uname,
                     uint16_t tag);
 void v9fs_rattach(P9Req *req, v9fs_qid *qid);
-P9Req *v9fs_twalk(QVirtio9P *v9p, uint32_t fid, uint32_t newfid,
-                  uint16_t nwname, char *const wnames[], uint16_t tag);
+TWalkRes v9fs_twalk(TWalkOpt opt);
 void v9fs_rwalk(P9Req *req, uint16_t *nwqid, v9fs_qid **wqid);
 P9Req *v9fs_tgetattr(QVirtio9P *v9p, uint32_t fid, uint64_t request_mask,
                      uint16_t tag);
diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 498c32e21b..cf5d6146ad 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -16,61 +16,7 @@
 #include "qemu/module.h"
 #include "libqos/virtio-9p-client.h"
 
-/*
- * Used to auto generate new fids. Start with arbitrary high value to avoid
- * collision with hard coded fids in basic test code.
- */
-static uint32_t fid_generator = 1000;
-
-static uint32_t genfid(void)
-{
-    return fid_generator++;
-}
-
-/**
- * Splits the @a in string by @a delim into individual (non empty) strings
- * and outputs them to @a out. The output array @a out is NULL terminated.
- *
- * Output array @a out must be freed by calling split_free().
- *
- * @returns number of individual elements in output array @a out (without the
- *          final NULL terminating element)
- */
-static int split(const char *in, const char *delim, char ***out)
-{
-    int n = 0, i = 0;
-    char *tmp, *p;
-
-    tmp = g_strdup(in);
-    for (p = strtok(tmp, delim); p != NULL; p = strtok(NULL, delim)) {
-        if (strlen(p) > 0) {
-            ++n;
-        }
-    }
-    g_free(tmp);
-
-    *out = g_new0(char *, n + 1); /* last element NULL delimiter */
-
-    tmp = g_strdup(in);
-    for (p = strtok(tmp, delim); p != NULL; p = strtok(NULL, delim)) {
-        if (strlen(p) > 0) {
-            (*out)[i++] = g_strdup(p);
-        }
-    }
-    g_free(tmp);
-
-    return n;
-}
-
-static void split_free(char ***out)
-{
-    int i;
-    for (i = 0; (*out)[i]; ++i) {
-        g_free((*out)[i]);
-    }
-    g_free(*out);
-    *out = NULL;
-}
+#define twalk(...) v9fs_twalk((TWalkOpt) __VA_ARGS__)
 
 static void pci_config(void *obj, void *data, QGuestAllocator *t_alloc)
 {
@@ -109,52 +55,6 @@ static void do_version(QVirtio9P *v9p)
     g_assert_cmpmem(server_version, server_len, version, strlen(version));
 }
 
-/*
- * utility function: walk to requested dir and return fid for that dir and
- * the QIDs of server response
- */
-static uint32_t do_walk_rqids(QVirtio9P *v9p, const char *path, uint16_t *nwqid,
-                              v9fs_qid **wqid)
-{
-    char **wnames;
-    P9Req *req;
-    const uint32_t fid = genfid();
-
-    int nwnames = split(path, "/", &wnames);
-
-    req = v9fs_twalk(v9p, 0, fid, nwnames, wnames, 0);
-    v9fs_req_wait_for_reply(req, NULL);
-    v9fs_rwalk(req, nwqid, wqid);
-
-    split_free(&wnames);
-    return fid;
-}
-
-/* utility function: walk to requested dir and return fid for that dir */
-static uint32_t do_walk(QVirtio9P *v9p, const char *path)
-{
-    return do_walk_rqids(v9p, path, NULL, NULL);
-}
-
-/* utility function: walk to requested dir and expect passed error response */
-static void do_walk_expect_error(QVirtio9P *v9p, const char *path, uint32_t err)
-{
-    char **wnames;
-    P9Req *req;
-    uint32_t _err;
-    const uint32_t fid = genfid();
-
-    int nwnames = split(path, "/", &wnames);
-
-    req = v9fs_twalk(v9p, 0, fid, nwnames, wnames, 0);
-    v9fs_req_wait_for_reply(req, NULL);
-    v9fs_rlerror(req, &_err);
-
-    g_assert_cmpint(_err, ==, err);
-
-    split_free(&wnames);
-}
-
 static void fs_version(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     v9fs_set_allocator(t_alloc);
@@ -197,7 +97,10 @@ static void fs_walk(void *obj, void *data, QGuestAllocator *t_alloc)
     }
 
     do_attach(v9p);
-    req = v9fs_twalk(v9p, 0, 1, P9_MAXWELEM, wnames, 0);
+    req = twalk({
+        .client = v9p, .fid = 0, .newfid = 1,
+        .nwname = P9_MAXWELEM, .wnames = wnames, .requestOnly = true
+    }).req;
     v9fs_req_wait_for_reply(req, NULL);
     v9fs_rwalk(req, &nwqid, &wqid);
 
@@ -223,7 +126,7 @@ static void fs_readdir(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtio9P *v9p = obj;
     v9fs_set_allocator(t_alloc);
-    char *const wnames[] = { g_strdup(QTEST_V9FS_SYNTH_READDIR_DIR) };
+    char *wnames[] = { g_strdup(QTEST_V9FS_SYNTH_READDIR_DIR) };
     uint16_t nqid;
     v9fs_qid qid;
     uint32_t count, nentries;
@@ -231,7 +134,10 @@ static void fs_readdir(void *obj, void *data, QGuestAllocator *t_alloc)
     P9Req *req;
 
     do_attach(v9p);
-    req = v9fs_twalk(v9p, 0, 1, 1, wnames, 0);
+    req = twalk({
+        .client = v9p, .fid = 0, .newfid = 1,
+        .nwname = 1, .wnames = wnames, .requestOnly = true
+    }).req;
     v9fs_req_wait_for_reply(req, NULL);
     v9fs_rwalk(req, &nqid, NULL);
     g_assert_cmpint(nqid, ==, 1);
@@ -275,7 +181,7 @@ static void fs_readdir(void *obj, void *data, QGuestAllocator *t_alloc)
 /* readdir test where overall request is split over several messages */
 static void do_readdir_split(QVirtio9P *v9p, uint32_t count)
 {
-    char *const wnames[] = { g_strdup(QTEST_V9FS_SYNTH_READDIR_DIR) };
+    char *wnames[] = { g_strdup(QTEST_V9FS_SYNTH_READDIR_DIR) };
     uint16_t nqid;
     v9fs_qid qid;
     uint32_t nentries, npartialentries;
@@ -292,7 +198,10 @@ static void do_readdir_split(QVirtio9P *v9p, uint32_t count)
     nentries = 0;
     tail = NULL;
 
-    req = v9fs_twalk(v9p, 0, fid, 1, wnames, 0);
+    req = twalk({
+        .client = v9p, .fid = 0, .newfid = fid,
+        .nwname = 1, .wnames = wnames, .requestOnly = true
+    }).req;
     v9fs_req_wait_for_reply(req, NULL);
     v9fs_rwalk(req, &nqid, NULL);
     g_assert_cmpint(nqid, ==, 1);
@@ -356,12 +265,15 @@ static void fs_walk_no_slash(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtio9P *v9p = obj;
     v9fs_set_allocator(t_alloc);
-    char *const wnames[] = { g_strdup(" /") };
+    char *wnames[] = { g_strdup(" /") };
     P9Req *req;
     uint32_t err;
 
     do_attach(v9p);
-    req = v9fs_twalk(v9p, 0, 1, 1, wnames, 0);
+    req = twalk({
+        .client = v9p, .fid = 0, .newfid = 1, .nwname = 1, .wnames = wnames,
+        .requestOnly = true
+    }).req;
     v9fs_req_wait_for_reply(req, NULL);
     v9fs_rlerror(req, &err);
 
@@ -380,7 +292,7 @@ static void fs_walk_nonexistent(void *obj, void *data, QGuestAllocator *t_alloc)
      * The 9p2000 protocol spec says: "If the first element cannot be walked
      * for any reason, Rerror is returned."
      */
-    do_walk_expect_error(v9p, "non-existent", ENOENT);
+    twalk({ .client = v9p, .path = "non-existent", .expectErr = ENOENT });
 }
 
 static void fs_walk_2nd_nonexistent(void *obj, void *data,
@@ -398,7 +310,10 @@ static void fs_walk_2nd_nonexistent(void *obj, void *data,
     );
 
     do_attach_rqid(v9p, &root_qid);
-    fid = do_walk_rqids(v9p, path, &nwqid, &wqid);
+    fid = twalk({
+        .client = v9p, .path = path,
+        .rwalk.nwqid = &nwqid, .rwalk.wqid = &wqid
+    }).newfid;
     /*
      * The 9p2000 protocol spec says: "nwqid is therefore either nwname or the
      * index of the first elementwise walk that failed."
@@ -430,7 +345,10 @@ static void fs_walk_none(void *obj, void *data, QGuestAllocator *t_alloc)
     v9fs_req_wait_for_reply(req, NULL);
     v9fs_rattach(req, &root_qid);
 
-    req = v9fs_twalk(v9p, 0, 1, 0, NULL, 0);
+    req = twalk({
+        .client = v9p, .fid = 0, .newfid = 1, .nwname = 0, .wnames = NULL,
+        .requestOnly = true
+    }).req;
     v9fs_req_wait_for_reply(req, NULL);
     v9fs_rwalk(req, NULL, &wqid);
 
@@ -448,7 +366,7 @@ static void fs_walk_dotdot(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtio9P *v9p = obj;
     v9fs_set_allocator(t_alloc);
-    char *const wnames[] = { g_strdup("..") };
+    char *wnames[] = { g_strdup("..") };
     v9fs_qid root_qid;
     g_autofree v9fs_qid *wqid = NULL;
     P9Req *req;
@@ -458,7 +376,10 @@ static void fs_walk_dotdot(void *obj, void *data, QGuestAllocator *t_alloc)
     v9fs_req_wait_for_reply(req, NULL);
     v9fs_rattach(req, &root_qid);
 
-    req = v9fs_twalk(v9p, 0, 1, 1, wnames, 0);
+    req = twalk({
+        .client = v9p, .fid = 0, .newfid = 1, .nwname = 1, .wnames = wnames,
+        .requestOnly = true
+    }).req;
     v9fs_req_wait_for_reply(req, NULL);
     v9fs_rwalk(req, NULL, &wqid); /* We now we'll get one qid */
 
@@ -471,11 +392,14 @@ static void fs_lopen(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtio9P *v9p = obj;
     v9fs_set_allocator(t_alloc);
-    char *const wnames[] = { g_strdup(QTEST_V9FS_SYNTH_LOPEN_FILE) };
+    char *wnames[] = { g_strdup(QTEST_V9FS_SYNTH_LOPEN_FILE) };
     P9Req *req;
 
     do_attach(v9p);
-    req = v9fs_twalk(v9p, 0, 1, 1, wnames, 0);
+    req = twalk({
+        .client = v9p, .fid = 0, .newfid = 1, .nwname = 1, .wnames = wnames,
+        .requestOnly = true
+    }).req;
     v9fs_req_wait_for_reply(req, NULL);
     v9fs_rwalk(req, NULL, NULL);
 
@@ -491,13 +415,16 @@ static void fs_write(void *obj, void *data, QGuestAllocator *t_alloc)
     QVirtio9P *v9p = obj;
     v9fs_set_allocator(t_alloc);
     static const uint32_t write_count = P9_MAX_SIZE / 2;
-    char *const wnames[] = { g_strdup(QTEST_V9FS_SYNTH_WRITE_FILE) };
+    char *wnames[] = { g_strdup(QTEST_V9FS_SYNTH_WRITE_FILE) };
     g_autofree char *buf = g_malloc0(write_count);
     uint32_t count;
     P9Req *req;
 
     do_attach(v9p);
-    req = v9fs_twalk(v9p, 0, 1, 1, wnames, 0);
+    req = twalk({
+        .client = v9p, .fid = 0, .newfid = 1, .nwname = 1, .wnames = wnames,
+        .requestOnly = true
+    }).req;
     v9fs_req_wait_for_reply(req, NULL);
     v9fs_rwalk(req, NULL, NULL);
 
@@ -517,13 +444,16 @@ static void fs_flush_success(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtio9P *v9p = obj;
     v9fs_set_allocator(t_alloc);
-    char *const wnames[] = { g_strdup(QTEST_V9FS_SYNTH_FLUSH_FILE) };
+    char *wnames[] = { g_strdup(QTEST_V9FS_SYNTH_FLUSH_FILE) };
     P9Req *req, *flush_req;
     uint32_t reply_len;
     uint8_t should_block;
 
     do_attach(v9p);
-    req = v9fs_twalk(v9p, 0, 1, 1, wnames, 0);
+    req = twalk({
+        .client = v9p, .fid = 0, .newfid = 1, .nwname = 1, .wnames = wnames,
+        .requestOnly = true
+    }).req;
     v9fs_req_wait_for_reply(req, NULL);
     v9fs_rwalk(req, NULL, NULL);
 
@@ -554,13 +484,16 @@ static void fs_flush_ignored(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtio9P *v9p = obj;
     v9fs_set_allocator(t_alloc);
-    char *const wnames[] = { g_strdup(QTEST_V9FS_SYNTH_FLUSH_FILE) };
+    char *wnames[] = { g_strdup(QTEST_V9FS_SYNTH_FLUSH_FILE) };
     P9Req *req, *flush_req;
     uint32_t count;
     uint8_t should_block;
 
     do_attach(v9p);
-    req = v9fs_twalk(v9p, 0, 1, 1, wnames, 0);
+    req = twalk({
+        .client = v9p, .fid = 0, .newfid = 1, .nwname = 1, .wnames = wnames,
+        .requestOnly = true
+    }).req;
     v9fs_req_wait_for_reply(req, NULL);
     v9fs_rwalk(req, NULL, NULL);
 
@@ -593,7 +526,7 @@ static void do_mkdir(QVirtio9P *v9p, const char *path, const char *cname)
     uint32_t fid;
     P9Req *req;
 
-    fid = do_walk(v9p, path);
+    fid = twalk({ .client = v9p, .path = path }).newfid;
 
     req = v9fs_tmkdir(v9p, fid, name, 0750, 0, 0);
     v9fs_req_wait_for_reply(req, NULL);
@@ -608,7 +541,7 @@ static uint32_t do_lcreate(QVirtio9P *v9p, const char *path,
     uint32_t fid;
     P9Req *req;
 
-    fid = do_walk(v9p, path);
+    fid = twalk({ .client = v9p, .path = path }).newfid;
 
     req = v9fs_tlcreate(v9p, fid, name, 0, 0750, 0, 0);
     v9fs_req_wait_for_reply(req, NULL);
@@ -626,7 +559,7 @@ static void do_symlink(QVirtio9P *v9p, const char *path, const char *clink,
     uint32_t fid;
     P9Req *req;
 
-    fid = do_walk(v9p, path);
+    fid = twalk({ .client = v9p, .path = path }).newfid;
 
     req = v9fs_tsymlink(v9p, fid, name, dst, 0, 0);
     v9fs_req_wait_for_reply(req, NULL);
@@ -640,8 +573,8 @@ static void do_hardlink(QVirtio9P *v9p, const char *path, const char *clink,
     uint32_t dfid, fid;
     P9Req *req;
 
-    dfid = do_walk(v9p, path);
-    fid = do_walk(v9p, to);
+    dfid = twalk({ .client = v9p, .path = path }).newfid;
+    fid = twalk({ .client = v9p, .path = to }).newfid;
 
     req = v9fs_tlink(v9p, dfid, fid, clink, 0);
     v9fs_req_wait_for_reply(req, NULL);
@@ -655,7 +588,7 @@ static void do_unlinkat(QVirtio9P *v9p, const char *atpath, const char *rpath,
     uint32_t fid;
     P9Req *req;
 
-    fid = do_walk(v9p, atpath);
+    fid = twalk({ .client = v9p, .path = atpath }).newfid;
 
     req = v9fs_tunlinkat(v9p, fid, name, flags, 0);
     v9fs_req_wait_for_reply(req, NULL);
-- 
2.30.2


