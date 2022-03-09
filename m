Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7664D39DC
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 20:18:56 +0100 (CET)
Received: from localhost ([::1]:58382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nS1pm-0005XY-QE
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 14:18:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <f19d6f5fd2b569ebac797f18849710eb22c40984@lizzy.crudebyte.com>)
 id 1nS1ky-00023p-TY
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 14:13:56 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:37337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <f19d6f5fd2b569ebac797f18849710eb22c40984@lizzy.crudebyte.com>)
 id 1nS1kx-0004oT-CS
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 14:13:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=YqbY9vNfa/EmSihxfkUi13kl4TtM5o1x5zqFLwyXJpk=; b=GF+Sn
 3PCHQjqbbMUJGJgtj6mpia5DXiT/48iB9s6Tg53bpUVcc/HPQ02jAYMUOzMdwJBeYOMXwokHVUKk+
 55+KnkDAqSl0LSzjRBceWKtemYMyr9YMrL/MTrq8A229DP22QLQNbJwbPEF/VUZt2+zw07bfqxh35
 +IfNZOix1kL+dGLGRkYExAAEGzfTMeUh22cXxiBNKX6As980cD9jUgOuDLXE69hZiqrWiECRXuH7R
 stJybOisSy+uhhy2v1D1audZb2DDYwGuL+nmZ4KicxnGMGlZ3320nRTQDpiaRwub+KwrDYCh+zz2Q
 Pb1UKbQ2zsrp1EgpP59h/VSY9W77g==;
Message-Id: <f19d6f5fd2b569ebac797f18849710eb22c40984.1646850707.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1646850707.git.qemu_oss@crudebyte.com>
References: <cover.1646850707.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Wed, 9 Mar 2022 14:24:24 +0100
Subject: [PATCH 2/6] tests/9pfs: Twalk with nwname=0
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=f19d6f5fd2b569ebac797f18849710eb22c40984@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Send Twalk request with nwname=0. In this case no QIDs should
be returned by 9p server; this is equivalent to walking to dot.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/virtio-9p-test.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 22bdd74bc1..6c00da03f4 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -1002,6 +1002,27 @@ static void fs_walk_nonexistent(void *obj, void *data, QGuestAllocator *t_alloc)
     do_walk_expect_error(v9p, "non-existent", ENOENT);
 }
 
+static void fs_walk_none(void *obj, void *data, QGuestAllocator *t_alloc)
+{
+    QVirtio9P *v9p = obj;
+    alloc = t_alloc;
+    v9fs_qid root_qid;
+    g_autofree v9fs_qid *wqid = NULL;
+    P9Req *req;
+
+    do_version(v9p);
+    req = v9fs_tattach(v9p, 0, getuid(), 0);
+    v9fs_req_wait_for_reply(req, NULL);
+    v9fs_rattach(req, &root_qid);
+
+    req = v9fs_twalk(v9p, 0, 1, 0, NULL, 0);
+    v9fs_req_wait_for_reply(req, NULL);
+    v9fs_rwalk(req, NULL, &wqid);
+
+    /* special case: no QID is returned if nwname=0 was sent */
+    g_assert(wqid == NULL);
+}
+
 static void fs_walk_dotdot(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtio9P *v9p = obj;
@@ -1435,6 +1456,7 @@ static void register_virtio_9p_test(void)
     qos_add_test("synth/walk/basic", "virtio-9p", fs_walk,  &opts);
     qos_add_test("synth/walk/no_slash", "virtio-9p", fs_walk_no_slash,
                   &opts);
+    qos_add_test("synth/walk/none", "virtio-9p", fs_walk_none, &opts);
     qos_add_test("synth/walk/dotdot_from_root", "virtio-9p",
                  fs_walk_dotdot,  &opts);
     qos_add_test("synth/walk/non_existent", "virtio-9p", fs_walk_nonexistent,
-- 
2.30.2


