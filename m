Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE3560A354
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 13:54:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omvMm-0000ix-8W; Mon, 24 Oct 2022 07:11:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <28c736709b82c8f47edf3cb18b9fb601fdab9151@lizzy.crudebyte.com>)
 id 1omvMF-0000SR-OW
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 07:11:13 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <28c736709b82c8f47edf3cb18b9fb601fdab9151@lizzy.crudebyte.com>)
 id 1omvMC-0006qa-9d
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 07:11:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=vesG7fpTJO7/Ux70A/tOkL9a3DqIlneVwqfLChoP7NI=; b=DU6FF
 t3Y0JmjqHZAVsTdnoDG5GBXhmsR0yFxM8n5bBGBiPbVqAOsO23WS5s9HYfUoTFBcc+cVJChR8tYgi
 D52XWiIlpmyoPqWeL2ruA45+Rmv7wdLfjuq9+LsP89BO3/Fset6ZNNmPozv153S9d5PNW495GZs/q
 uW4bWBGScB5J+i+beba53o7BtnpBWLuGD69aIr8LeIcGujCt8J2N9ypU2OPXRQcRI4HZlrF6iYEir
 9oysao2XKdaBYwHoopQiBMda9ad4U3D71HqvVyoTkgFEvulD3XX8mZ+pF+mYR/Ncq2UpkuHLnEixc
 q1grb+5fo/YhHRuW3Cu63bg8BhD4A==;
Message-Id: <28c736709b82c8f47edf3cb18b9fb601fdab9151.1666608862.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1666608862.git.qemu_oss@crudebyte.com>
References: <cover.1666608862.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 24 Oct 2022 12:54:23 +0200
Subject: [PULL 10/23] tests/9p: simplify callers of tgetattr()
To: qemu-devel@nongnu.org,
    Stefan Hajnoczi <stefanha@redhat.com>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=28c736709b82c8f47edf3cb18b9fb601fdab9151@lizzy.crudebyte.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Now as tgetattr() is using a declarative approach, simplify the
code of callers of this function.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Message-Id: <60c6a083f320b86f3172951445df7bbc895932e2.1664917004.git.qemu_oss@crudebyte.com>
---
 tests/qtest/virtio-9p-test.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 9c1219db33..ae1220d0cb 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -264,8 +264,7 @@ static void fs_walk_2nd_nonexistent(void *obj, void *data,
     v9fs_set_allocator(t_alloc);
     v9fs_qid root_qid;
     uint16_t nwqid;
-    uint32_t fid, err;
-    P9Req *req;
+    uint32_t fid;
     g_autofree v9fs_qid *wqid = NULL;
     g_autofree char *path = g_strdup_printf(
         QTEST_V9FS_SYNTH_WALK_FILE "/non-existent", 0
@@ -286,14 +285,10 @@ static void fs_walk_2nd_nonexistent(void *obj, void *data,
     g_assert(wqid && wqid[0] && !is_same_qid(root_qid, wqid[0]));
 
     /* expect fid being unaffected by walk above */
-    req = tgetattr({
+    tgetattr({
         .client = v9p, .fid = fid, .request_mask = P9_GETATTR_BASIC,
-        .requestOnly = true
-    }).req;
-    v9fs_req_wait_for_reply(req, NULL);
-    v9fs_rlerror(req, &err);
-
-    g_assert_cmpint(err, ==, ENOENT);
+        .expectErr = ENOENT
+    });
 }
 
 static void fs_walk_none(void *obj, void *data, QGuestAllocator *t_alloc)
@@ -302,7 +297,6 @@ static void fs_walk_none(void *obj, void *data, QGuestAllocator *t_alloc)
     v9fs_set_allocator(t_alloc);
     v9fs_qid root_qid;
     g_autofree v9fs_qid *wqid = NULL;
-    P9Req *req;
     struct v9fs_attr attr;
 
     tversion({ .client = v9p });
@@ -319,12 +313,10 @@ static void fs_walk_none(void *obj, void *data, QGuestAllocator *t_alloc)
     /* special case: no QID is returned if nwname=0 was sent */
     g_assert(wqid == NULL);
 
-    req = tgetattr({
+    tgetattr({
         .client = v9p, .fid = 1, .request_mask = P9_GETATTR_BASIC,
-        .requestOnly = true
-    }).req;
-    v9fs_req_wait_for_reply(req, NULL);
-    v9fs_rgetattr(req, &attr);
+        .rgetattr.attr = &attr
+    });
 
     g_assert(is_same_qid(root_qid, attr.qid));
 }
-- 
2.30.2


