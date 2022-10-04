Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B17365F4B05
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 23:37:25 +0200 (CEST)
Received: from localhost ([::1]:42488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofpbQ-0000Cx-88
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 17:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <60c6a083f320b86f3172951445df7bbc895932e2@lizzy.crudebyte.com>)
 id 1ofpLW-0006Mo-Ez
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:20:58 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:59903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <60c6a083f320b86f3172951445df7bbc895932e2@lizzy.crudebyte.com>)
 id 1ofpLR-0002M6-47
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:20:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=/MMjlmGcZsUSLLetGbdWwUYm5XcRnFhhIZO0YhKsmwU=; b=lcxEA
 tVNYhWqNucO7WxnhUIRwE6N2R9qbXuSDCLnjFvihuqXZm2fma9Z6W994IDJQB9mn58SrYb8u4hk2W
 GKgDY3dC0ZrqECKEcQyGNPPj/w0XgXZCCcoAsYsK9f8MLsim3yitptU6kymDRRzcIi3v6t6lCzL3c
 7b1OfPrjfwj4rtwqTVb3PIwvi82TNT8ElBFZF+M2ejPBYwZWuXkrp1GbxEbsiZ1R2TSR9ZC1obbW0
 gIRMZhYm5LK+H8tWtP6Re1fKX1dIQZIjLIZ8JFSRLCm0H8mI4r98kAOQywsTbhRZU6JaTJBtCR2VP
 aFArqDGhSkgOkQBMrSRZFFQ3bOVug==;
Message-Id: <60c6a083f320b86f3172951445df7bbc895932e2.1664917004.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1664917004.git.qemu_oss@crudebyte.com>
References: <cover.1664917004.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 4 Oct 2022 22:53:44 +0200
Subject: [PATCH 07/20] tests/9p: simplify callers of tgetattr()
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=60c6a083f320b86f3172951445df7bbc895932e2@lizzy.crudebyte.com;
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

Now as tgetattr() is using a declarative approach, simplify the
code of callers of this function.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
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


