Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F28460A197
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 13:29:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omvMk-0000hc-2R; Mon, 24 Oct 2022 07:11:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <1125ddf66f47dc4986d97948253890fdb3c0a6d6@lizzy.crudebyte.com>)
 id 1omvM1-0000PZ-1x
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 07:10:50 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <1125ddf66f47dc4986d97948253890fdb3c0a6d6@lizzy.crudebyte.com>)
 id 1omvLz-0006p1-MC
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 07:10:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=bidGNUANNm8clwXP9H0NxxwzaxNI/qeKWRH/eaPplbI=; b=YvZpF
 OO+Lg2sMWd7XGXXoQ6/C3hxXKCxlTS58R2yMU66GzHWhkIGJBptTZ4TzVV76fYjZBgGc+PHkU4ja6
 UjGow13ogYkcrkz9MQpKIsb70M4/UrPFrtz1IAYI24oPJZYLx37mRz92xUMWZq/6j8av4qtPP6giS
 aVCz5pwJMK/bvKOfMMZN4uwH8Ji7INun7pS9WFAXqq33XzSFCJdzj9GWwM00uNbwKn9zoLagWLTrl
 45E3iSa2yw9hREmnbagnzkEXlFDpejmGNZFbbcYUl9ponLeRLXx/Y6AOsnbo97ydgXS/SaMUrw5kN
 iWtx+xRXLptMnpCGs9wpHxcrRhHUg==;
Message-Id: <1125ddf66f47dc4986d97948253890fdb3c0a6d6.1666608862.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1666608862.git.qemu_oss@crudebyte.com>
References: <cover.1666608862.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 24 Oct 2022 12:54:23 +0200
Subject: [PULL 08/23] tests/9p: simplify callers of tattach()
To: qemu-devel@nongnu.org,
    Stefan Hajnoczi <stefanha@redhat.com>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=1125ddf66f47dc4986d97948253890fdb3c0a6d6@lizzy.crudebyte.com;
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

Now as tattach() is using a declarative approach, simplify the
code of callers of this function.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Message-Id: <9b50e5b89a0072e84a9191d18c19a53546a28bba.1664917004.git.qemu_oss@crudebyte.com>
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


