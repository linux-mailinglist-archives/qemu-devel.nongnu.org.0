Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CA65F4AE7
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 23:28:12 +0200 (CEST)
Received: from localhost ([::1]:40832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofpSV-0001z6-QD
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 17:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <d340a91be96fbfecfb8dacdd7558223b3c0d0e2c@lizzy.crudebyte.com>)
 id 1ofpLQ-0006L0-1x
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:20:57 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:39017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <d340a91be96fbfecfb8dacdd7558223b3c0d0e2c@lizzy.crudebyte.com>)
 id 1ofpLK-0002LM-0c
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:20:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=zw4F6xRuxZ4bjW8gLP8nqhQKbn86gHoWOQCmvMX6DQI=; b=FJS0j
 Mni4I+vUJCScvD/wLszO6VhlEvi/404rHq7PKsnqzsgD9zjekweSkVL45dcghz9Y30w4tesi3qFZL
 Z3FmTtVrgzAzCa513ZY2JZ9OC6o4RIRXj5x1m1z8tTRQMCN3uwY/oJ5IVCx6r8nYP7KCIs3of5btG
 CcPoR90ffcaj6YL5pQfd34EsPbCHZjA8+6Kg0r1sE9+tkwIBqsxATQPSaWxSYp6515yh3ppYB6CZ8
 sdh8AZUUuJjdyuJowrKw0R+VnwPlcsaxZOe/bkNV5aq1c5+oMOWuZK9zhLzdZj0mwMI93pamckDbL
 UrKoAgdk4T6OsiYGtN6LAcD8gRN5A==;
Message-Id: <d340a91be96fbfecfb8dacdd7558223b3c0d0e2c.1664917004.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1664917004.git.qemu_oss@crudebyte.com>
References: <cover.1664917004.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 4 Oct 2022 22:53:41 +0200
Subject: [PATCH 06/20] tests/9p: convert v9fs_tgetattr() to declarative
 arguments
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=d340a91be96fbfecfb8dacdd7558223b3c0d0e2c@lizzy.crudebyte.com;
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

Use declarative function arguments for function v9fs_tgetattr().

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/libqos/virtio-9p-client.c | 32 ++++++++++++++++++++++-----
 tests/qtest/libqos/virtio-9p-client.h | 30 +++++++++++++++++++++++--
 tests/qtest/virtio-9p-test.c          | 11 +++++++--
 3 files changed, 63 insertions(+), 10 deletions(-)

diff --git a/tests/qtest/libqos/virtio-9p-client.c b/tests/qtest/libqos/virtio-9p-client.c
index 5e6bd6120c..29916a23b5 100644
--- a/tests/qtest/libqos/virtio-9p-client.c
+++ b/tests/qtest/libqos/virtio-9p-client.c
@@ -489,16 +489,36 @@ void v9fs_rwalk(P9Req *req, uint16_t *nwqid, v9fs_qid **wqid)
 }
 
 /* size[4] Tgetattr tag[2] fid[4] request_mask[8] */
-P9Req *v9fs_tgetattr(QVirtio9P *v9p, uint32_t fid, uint64_t request_mask,
-                     uint16_t tag)
+TGetAttrRes v9fs_tgetattr(TGetAttrOpt opt)
 {
     P9Req *req;
+    uint32_t err;
 
-    req = v9fs_req_init(v9p, 4 + 8, P9_TGETATTR, tag);
-    v9fs_uint32_write(req, fid);
-    v9fs_uint64_write(req, request_mask);
+    g_assert(opt.client);
+    /* expecting either Rgetattr or Rlerror, but obviously not both */
+    g_assert(!opt.expectErr || !opt.rgetattr.attr);
+
+    if (!opt.request_mask) {
+        opt.request_mask = P9_GETATTR_ALL;
+    }
+
+    req = v9fs_req_init(opt.client, 4 + 8, P9_TGETATTR, opt.tag);
+    v9fs_uint32_write(req, opt.fid);
+    v9fs_uint64_write(req, opt.request_mask);
     v9fs_req_send(req);
-    return req;
+
+    if (!opt.requestOnly) {
+        v9fs_req_wait_for_reply(req, NULL);
+        if (opt.expectErr) {
+            v9fs_rlerror(req, &err);
+            g_assert_cmpint(err, ==, opt.expectErr);
+        } else {
+            v9fs_rgetattr(req, opt.rgetattr.attr);
+        }
+        req = NULL; /* request was freed */
+    }
+
+    return (TGetAttrRes) { .req = req };
 }
 
 /*
diff --git a/tests/qtest/libqos/virtio-9p-client.h b/tests/qtest/libqos/virtio-9p-client.h
index 64b97b229b..f7b1bfc79a 100644
--- a/tests/qtest/libqos/virtio-9p-client.h
+++ b/tests/qtest/libqos/virtio-9p-client.h
@@ -63,6 +63,7 @@ typedef struct v9fs_attr {
 } v9fs_attr;
 
 #define P9_GETATTR_BASIC    0x000007ffULL /* Mask for fields up to BLOCKS */
+#define P9_GETATTR_ALL      0x00003fffULL /* Mask for ALL fields */
 
 struct V9fsDirent {
     v9fs_qid qid;
@@ -155,6 +156,32 @@ typedef struct TAttachRes {
     P9Req *req;
 } TAttachRes;
 
+/* options for 'Tgetattr' 9p request */
+typedef struct TGetAttrOpt {
+    /* 9P client being used (mandatory) */
+    QVirtio9P *client;
+    /* user supplied tag number being returned with response (optional) */
+    uint16_t tag;
+    /* file ID of file/dir whose attributes shall be retrieved (required) */
+    uint32_t fid;
+    /* bitmask indicating attribute fields to be retrieved (optional) */
+    uint64_t request_mask;
+    /* data being received from 9p server as 'Rgetattr' response (optional) */
+    struct {
+        v9fs_attr *attr;
+    } rgetattr;
+    /* only send Tgetattr request but not wait for a reply? (optional) */
+    bool requestOnly;
+    /* do we expect an Rlerror response, if yes which error code? (optional) */
+    uint32_t expectErr;
+} TGetAttrOpt;
+
+/* result of 'Tgetattr' 9p request */
+typedef struct TGetAttrRes {
+    /* if requestOnly was set: request object for further processing */
+    P9Req *req;
+} TGetAttrRes;
+
 void v9fs_set_allocator(QGuestAllocator *t_alloc);
 void v9fs_memwrite(P9Req *req, const void *addr, size_t len);
 void v9fs_memskip(P9Req *req, size_t len);
@@ -182,8 +209,7 @@ TAttachRes v9fs_tattach(TAttachOpt);
 void v9fs_rattach(P9Req *req, v9fs_qid *qid);
 TWalkRes v9fs_twalk(TWalkOpt opt);
 void v9fs_rwalk(P9Req *req, uint16_t *nwqid, v9fs_qid **wqid);
-P9Req *v9fs_tgetattr(QVirtio9P *v9p, uint32_t fid, uint64_t request_mask,
-                     uint16_t tag);
+TGetAttrRes v9fs_tgetattr(TGetAttrOpt);
 void v9fs_rgetattr(P9Req *req, v9fs_attr *attr);
 P9Req *v9fs_treaddir(QVirtio9P *v9p, uint32_t fid, uint64_t offset,
                      uint32_t count, uint16_t tag);
diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 46bb189b81..9c1219db33 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -19,6 +19,7 @@
 #define twalk(...) v9fs_twalk((TWalkOpt) __VA_ARGS__)
 #define tversion(...) v9fs_tversion((TVersionOpt) __VA_ARGS__)
 #define tattach(...) v9fs_tattach((TAttachOpt) __VA_ARGS__)
+#define tgetattr(...) v9fs_tgetattr((TGetAttrOpt) __VA_ARGS__)
 
 static void pci_config(void *obj, void *data, QGuestAllocator *t_alloc)
 {
@@ -285,7 +286,10 @@ static void fs_walk_2nd_nonexistent(void *obj, void *data,
     g_assert(wqid && wqid[0] && !is_same_qid(root_qid, wqid[0]));
 
     /* expect fid being unaffected by walk above */
-    req = v9fs_tgetattr(v9p, fid, P9_GETATTR_BASIC, 0);
+    req = tgetattr({
+        .client = v9p, .fid = fid, .request_mask = P9_GETATTR_BASIC,
+        .requestOnly = true
+    }).req;
     v9fs_req_wait_for_reply(req, NULL);
     v9fs_rlerror(req, &err);
 
@@ -315,7 +319,10 @@ static void fs_walk_none(void *obj, void *data, QGuestAllocator *t_alloc)
     /* special case: no QID is returned if nwname=0 was sent */
     g_assert(wqid == NULL);
 
-    req = v9fs_tgetattr(v9p, 1, P9_GETATTR_BASIC, 0);
+    req = tgetattr({
+        .client = v9p, .fid = 1, .request_mask = P9_GETATTR_BASIC,
+        .requestOnly = true
+    }).req;
     v9fs_req_wait_for_reply(req, NULL);
     v9fs_rgetattr(req, &attr);
 
-- 
2.30.2


