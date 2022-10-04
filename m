Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FD05F4AE9
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 23:28:20 +0200 (CEST)
Received: from localhost ([::1]:45856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofpSd-0002S4-Bg
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 17:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <2d253491aaffd267ec295f056dda47456692cd0c@lizzy.crudebyte.com>)
 id 1ofpL2-0006Fw-G3
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:20:51 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:40435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <2d253491aaffd267ec295f056dda47456692cd0c@lizzy.crudebyte.com>)
 id 1ofpL0-0002Ia-QN
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:20:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=000tjLepe1NC+XqaptNYAlx52LjBqyTjjAoYn7jobVY=; b=SjSJW
 VtTAqPPjuzm7whMwKCOxb4M5i0quTZ9jeJhgWos9xhsX4XN204KmwCAZAW2WoRtUyAEIR00NEB0LG
 yk1Ttuhx+TTi91VeFZQCgRVn8zfCFtxjort6Z7G0kz1j2QrCRRpdIEllWvHnV7OC5g+T2T5eztevs
 oLcMIcWlth+XTsu/D5CoUBasdw/fHOpV2dZHRo48CrWNhwn/7ZWJmeVa65Sy37ako3FXQCAgE2xXd
 V8bAOtCtqcOEZ25a6swfzZNIaG7cXpOxhvZlvV1vYD1bGKfK5ogkhSnGJzH9Fw6nV9nTJs8uXhW6Z
 SM5vvhn9BgkII8zyXi4or3TS1FcBA==;
Message-Id: <2d253491aaffd267ec295f056dda47456692cd0c.1664917004.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1664917004.git.qemu_oss@crudebyte.com>
References: <cover.1664917004.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 4 Oct 2022 22:53:33 +0200
Subject: [PATCH 03/20] tests/9p: merge v9fs_tversion() and do_version()
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=2d253491aaffd267ec295f056dda47456692cd0c@lizzy.crudebyte.com;
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

As with previous patches, unify functions v9fs_tversion() and do_version()
into a single function v9fs_tversion() by using a declarative function
arguments approach.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/libqos/virtio-9p-client.c | 47 +++++++++++++++++++++++----
 tests/qtest/libqos/virtio-9p-client.h | 25 ++++++++++++--
 tests/qtest/virtio-9p-test.c          | 23 +++----------
 3 files changed, 68 insertions(+), 27 deletions(-)

diff --git a/tests/qtest/libqos/virtio-9p-client.c b/tests/qtest/libqos/virtio-9p-client.c
index a95bbad9c8..e8364f8d64 100644
--- a/tests/qtest/libqos/virtio-9p-client.c
+++ b/tests/qtest/libqos/virtio-9p-client.c
@@ -291,21 +291,54 @@ void v9fs_rlerror(P9Req *req, uint32_t *err)
 }
 
 /* size[4] Tversion tag[2] msize[4] version[s] */
-P9Req *v9fs_tversion(QVirtio9P *v9p, uint32_t msize, const char *version,
-                     uint16_t tag)
+TVersionRes v9fs_tversion(TVersionOpt opt)
 {
     P9Req *req;
+    uint32_t err;
     uint32_t body_size = 4;
-    uint16_t string_size = v9fs_string_size(version);
+    uint16_t string_size;
+    uint16_t server_len;
+    g_autofree char *server_version = NULL;
 
+    g_assert(opt.client);
+
+    if (!opt.msize) {
+        opt.msize = P9_MAX_SIZE;
+    }
+
+    if (!opt.tag) {
+        opt.tag = P9_NOTAG;
+    }
+
+    if (!opt.version) {
+        opt.version = "9P2000.L";
+    }
+
+    string_size = v9fs_string_size(opt.version);
     g_assert_cmpint(body_size, <=, UINT32_MAX - string_size);
     body_size += string_size;
-    req = v9fs_req_init(v9p, body_size, P9_TVERSION, tag);
+    req = v9fs_req_init(opt.client, body_size, P9_TVERSION, opt.tag);
 
-    v9fs_uint32_write(req, msize);
-    v9fs_string_write(req, version);
+    v9fs_uint32_write(req, opt.msize);
+    v9fs_string_write(req, opt.version);
     v9fs_req_send(req);
-    return req;
+
+    if (!opt.requestOnly) {
+        v9fs_req_wait_for_reply(req, NULL);
+        if (opt.expectErr) {
+            v9fs_rlerror(req, &err);
+            g_assert_cmpint(err, ==, opt.expectErr);
+        } else {
+            v9fs_rversion(req, &server_len, &server_version);
+            g_assert_cmpmem(server_version, server_len,
+                            opt.version, strlen(opt.version));
+        }
+        req = NULL; /* request was freed */
+    }
+
+    return (TVersionRes) {
+        .req = req,
+    };
 }
 
 /* size[4] Rversion tag[2] msize[4] version[s] */
diff --git a/tests/qtest/libqos/virtio-9p-client.h b/tests/qtest/libqos/virtio-9p-client.h
index 8c6abbb173..fcde849b5d 100644
--- a/tests/qtest/libqos/virtio-9p-client.h
+++ b/tests/qtest/libqos/virtio-9p-client.h
@@ -106,6 +106,28 @@ typedef struct TWalkRes {
     P9Req *req;
 } TWalkRes;
 
+/* options for 'Tversion' 9p request */
+typedef struct TVersionOpt {
+    /* 9P client being used (mandatory) */
+    QVirtio9P *client;
+    /* user supplied tag number being returned with response (optional) */
+    uint16_t tag;
+    /* maximum message size that can be handled by client (optional) */
+    uint32_t msize;
+    /* protocol version (optional) */
+    const char *version;
+    /* only send Tversion request but not wait for a reply? (optional) */
+    bool requestOnly;
+    /* do we expect an Rlerror response, if yes which error code? (optional) */
+    uint32_t expectErr;
+} TVersionOpt;
+
+/* result of 'Tversion' 9p request */
+typedef struct TVersionRes {
+    /* if requestOnly was set: request object for further processing */
+    P9Req *req;
+} TVersionRes;
+
 void v9fs_set_allocator(QGuestAllocator *t_alloc);
 void v9fs_memwrite(P9Req *req, const void *addr, size_t len);
 void v9fs_memskip(P9Req *req, size_t len);
@@ -127,8 +149,7 @@ void v9fs_req_wait_for_reply(P9Req *req, uint32_t *len);
 void v9fs_req_recv(P9Req *req, uint8_t id);
 void v9fs_req_free(P9Req *req);
 void v9fs_rlerror(P9Req *req, uint32_t *err);
-P9Req *v9fs_tversion(QVirtio9P *v9p, uint32_t msize, const char *version,
-                     uint16_t tag);
+TVersionRes v9fs_tversion(TVersionOpt);
 void v9fs_rversion(P9Req *req, uint16_t *len, char **version);
 P9Req *v9fs_tattach(QVirtio9P *v9p, uint32_t fid, uint32_t n_uname,
                     uint16_t tag);
diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 3c326451b1..f2907c8026 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -17,6 +17,7 @@
 #include "libqos/virtio-9p-client.h"
 
 #define twalk(...) v9fs_twalk((TWalkOpt) __VA_ARGS__)
+#define tversion(...) v9fs_tversion((TVersionOpt) __VA_ARGS__)
 
 static void pci_config(void *obj, void *data, QGuestAllocator *t_alloc)
 {
@@ -41,31 +42,17 @@ static inline bool is_same_qid(v9fs_qid a, v9fs_qid b)
     return a[0] == b[0] && memcmp(&a[5], &b[5], 8) == 0;
 }
 
-static void do_version(QVirtio9P *v9p)
-{
-    const char *version = "9P2000.L";
-    uint16_t server_len;
-    g_autofree char *server_version = NULL;
-    P9Req *req;
-
-    req = v9fs_tversion(v9p, P9_MAX_SIZE, version, P9_NOTAG);
-    v9fs_req_wait_for_reply(req, NULL);
-    v9fs_rversion(req, &server_len, &server_version);
-
-    g_assert_cmpmem(server_version, server_len, version, strlen(version));
-}
-
 static void fs_version(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     v9fs_set_allocator(t_alloc);
-    do_version(obj);
+    tversion({ .client = obj });
 }
 
 static void do_attach_rqid(QVirtio9P *v9p, v9fs_qid *qid)
 {
     P9Req *req;
 
-    do_version(v9p);
+    tversion({ .client = v9p });
     req = v9fs_tattach(v9p, 0, getuid(), 0);
     v9fs_req_wait_for_reply(req, NULL);
     v9fs_rattach(req, qid);
@@ -328,7 +315,7 @@ static void fs_walk_none(void *obj, void *data, QGuestAllocator *t_alloc)
     P9Req *req;
     struct v9fs_attr attr;
 
-    do_version(v9p);
+    tversion({ .client = v9p });
     req = v9fs_tattach(v9p, 0, getuid(), 0);
     v9fs_req_wait_for_reply(req, NULL);
     v9fs_rattach(req, &root_qid);
@@ -357,7 +344,7 @@ static void fs_walk_dotdot(void *obj, void *data, QGuestAllocator *t_alloc)
     g_autofree v9fs_qid *wqid = NULL;
     P9Req *req;
 
-    do_version(v9p);
+    tversion({ .client = v9p });
     req = v9fs_tattach(v9p, 0, getuid(), 0);
     v9fs_req_wait_for_reply(req, NULL);
     v9fs_rattach(req, &root_qid);
-- 
2.30.2


