Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9AD4D741C
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Mar 2022 10:52:19 +0100 (CET)
Received: from localhost ([::1]:57728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTKte-0006Pz-LY
	for lists+qemu-devel@lfdr.de; Sun, 13 Mar 2022 05:52:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <c553fe1cfcfef7560240a40638b5ebc40a992863@lizzy.crudebyte.com>)
 id 1nTKnQ-00085U-Ad
 for qemu-devel@nongnu.org; Sun, 13 Mar 2022 05:45:52 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:51663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <c553fe1cfcfef7560240a40638b5ebc40a992863@lizzy.crudebyte.com>)
 id 1nTKnO-0004hd-PJ
 for qemu-devel@nongnu.org; Sun, 13 Mar 2022 05:45:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=x3Nu1Z3JuP7T0P/LxDLf02GMaWDKq4stT/+XUKicrug=; b=YvmOJ
 njhvAE2Ip5E3O3ytHgoUroo1ThB7L/8LQ7z/WNJ77B13KTk3uYtBxN8IEHvJwq/QzQR/W6/w0e+g/
 n8TCNQxFtb+aoS0QZeFVeaBA+Ty8gOk0nqjg/kIYGMltdbvxG42SMQUw7XSKhYj8w65K7X2hNrJsc
 yljaFG0+Y91sy1qZF5dOhPZ0xKDBaTfm680Ekh5hWFp1rhqSN/Voh6aDXZbOwXhQyEUuUgI9OMXm8
 Cb34qEaLJfPISq635nNgfAooj5IaOVK+nd0MmlTMJkOSP12rg/bCcL/uzi+9fMYTgwgzKz31FayuG
 H0IOx8i+3L+LU5FVUPr5uyeRQ/4Lw==;
Message-Id: <c553fe1cfcfef7560240a40638b5ebc40a992863.1647163863.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1647163863.git.qemu_oss@crudebyte.com>
References: <cover.1647163863.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Sun, 13 Mar 2022 10:28:32 +0100
Subject: [PATCH v3 7/7] tests/9pfs: check fid being unaffected in
 fs_walk_2nd_nonexistent
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=c553fe1cfcfef7560240a40638b5ebc40a992863@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Extend previously added test case by checking that fid is unaffected
by 'Twalk' request (i.e. when 2nd path component of request being
invalid). Do that by comparing the QID of root fid with QID of walked
fid; they should be identical.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/virtio-9p-test.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index f6e78d388e..b9c6819d01 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -721,14 +721,19 @@ static void fs_version(void *obj, void *data, QGuestAllocator *t_alloc)
     do_version(obj);
 }
 
-static void do_attach(QVirtio9P *v9p)
+static void do_attach_rqid(QVirtio9P *v9p, v9fs_qid *qid)
 {
     P9Req *req;
 
     do_version(v9p);
     req = v9fs_tattach(v9p, 0, getuid(), 0);
     v9fs_req_wait_for_reply(req, NULL);
-    v9fs_rattach(req, NULL);
+    v9fs_rattach(req, qid);
+}
+
+static void do_attach(QVirtio9P *v9p)
+{
+    do_attach_rqid(v9p, NULL);
 }
 
 static void fs_attach(void *obj, void *data, QGuestAllocator *t_alloc)
@@ -1101,19 +1106,22 @@ static void fs_walk_2nd_nonexistent(void *obj, void *data,
 {
     QVirtio9P *v9p = obj;
     alloc = t_alloc;
+    v9fs_qid root_qid;
     uint16_t nwqid;
     g_autofree v9fs_qid *wqid = NULL;
     g_autofree char *path = g_strdup_printf(
         QTEST_V9FS_SYNTH_WALK_FILE "/non-existent", 0
     );
 
-    do_attach(v9p);
+    do_attach_rqid(v9p, &root_qid);
     do_walk_rqids(v9p, path, &nwqid, &wqid);
     /*
      * The 9p2000 protocol spec says: "nwqid is therefore either nwname or the
      * index of the first elementwise walk that failed."
      */
     assert(nwqid == 1);
+    /* expect fid being unaffected by walk */
+    g_assert(wqid && wqid[0] && is_same_qid(root_qid, wqid[0]));
 }
 
 static void fs_walk_none(void *obj, void *data, QGuestAllocator *t_alloc)
-- 
2.30.2


