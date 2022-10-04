Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9286A5F4AE5
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 23:28:01 +0200 (CEST)
Received: from localhost ([::1]:40828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofpSK-0001tV-Ik
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 17:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <9b50e5b89a0072e84a9191d18c19a53546a28bba@lizzy.crudebyte.com>)
 id 1ofpLG-0006Ib-CF
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:20:57 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:43139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <9b50e5b89a0072e84a9191d18c19a53546a28bba@lizzy.crudebyte.com>)
 id 1ofpLD-0002Ja-SB
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:20:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=uBPVKXAiglNBxu9yfa09lCFCMWjpdddqcwXn7bHsoPI=; b=IpHha
 o+W39RZ0nvocUadFW/maVCf+j8NdBM3A9HNnexBwNJerhdjvUlAe1l9EmINGrTiD2P6QfjYxT7DzG
 LTGLku+8X0/KMi9mXs5qxZlrxsHnEey6zypBlRPkpE2VYm/Eh2I4qjuE1qdeBmuiRvnJbs83tyCrg
 YqZkB/uOab/YIaLVo2Y0xZEOm0z+9PZGi1aXX+E8EqCDGfn7xcC0wcNiHf7APHLFu0N/o4GQJBTIV
 J9lgHGcHSbmTIcIKGTYFFoOKmFOsgrDMRszyDwruI+TDCDO1ye1qoJJTYKWOSLJ5KpIuLgksrXZ1O
 XwXXtyupCF3wOc2j3AIIWvgsubRbQ==;
Message-Id: <9b50e5b89a0072e84a9191d18c19a53546a28bba.1664917004.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1664917004.git.qemu_oss@crudebyte.com>
References: <cover.1664917004.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 4 Oct 2022 22:53:38 +0200
Subject: [PATCH 05/20] tests/9p: simplify callers of tattach()
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=9b50e5b89a0072e84a9191d18c19a53546a28bba@lizzy.crudebyte.com;
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

Now as tattach() is using a declarative approach, simplify the
code of callers of this function.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/virtio-9p-test.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 271c42f6f9..46bb189b81 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -302,11 +302,10 @@ static void fs_walk_none(void *obj, void *data, QGuestAllocator *t_alloc)
     struct v9fs_attr attr;
 
     tversion({ .client = v9p });
-    req = tattach({
-        .client = v9p, .fid = 0, .n_uname = getuid(), .requestOnly = true
-    }).req;
-    v9fs_req_wait_for_reply(req, NULL);
-    v9fs_rattach(req, &root_qid);
+    tattach({
+        .client = v9p, .fid = 0, .n_uname = getuid(),
+        .rattach.qid = &root_qid
+    });
 
     twalk({
         .client = v9p, .fid = 0, .newfid = 1, .nwname = 0, .wnames = NULL,
@@ -330,14 +329,12 @@ static void fs_walk_dotdot(void *obj, void *data, QGuestAllocator *t_alloc)
     char *wnames[] = { g_strdup("..") };
     v9fs_qid root_qid;
     g_autofree v9fs_qid *wqid = NULL;
-    P9Req *req;
 
     tversion({ .client = v9p });
-    req = tattach((TAttachOpt) {
-        .client = v9p, .fid = 0, .n_uname = getuid(), .requestOnly = true
-    }).req;
-    v9fs_req_wait_for_reply(req, NULL);
-    v9fs_rattach(req, &root_qid);
+    tattach({
+        .client = v9p, .fid = 0, .n_uname = getuid(),
+        .rattach.qid = &root_qid
+    });
 
     twalk({
         .client = v9p, .fid = 0, .newfid = 1, .nwname = 1, .wnames = wnames,
-- 
2.30.2


