Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C373BBC7C
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 13:56:09 +0200 (CEST)
Received: from localhost ([::1]:55918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0NCq-0005X0-Bf
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 07:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <1d0fc0d0eef057dc02055f531907188d19a83cb2@lizzy.crudebyte.com>)
 id 1m0NBL-0004on-O9
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 07:54:35 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:38651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <1d0fc0d0eef057dc02055f531907188d19a83cb2@lizzy.crudebyte.com>)
 id 1m0NBJ-0005pj-6Z
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 07:54:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=e4656rS0PFVUGSZuE2ckdD7eWHsp5wNR2O/nh560HaU=; b=ptf/T
 yVyi1oW+AX8JRS8hqVHc8/guIzr5ex/8udJAU6aHBtnUqs0iV8fv/aqohddw/JakYG6H2vjcHmoDe
 4b5YefW0naahD38Fi/dY+jCAu1bSr5JqPXBvk2oplQopIWUHBgNHIUgsGcYaSvA7DEA1KDlWlKNeK
 vdb15FnZsntFkSB02f52j4n/Jk5ajUle7ZtFLsoLGN1CCYDPAn9wJSMoBfiefmiN00upu/NgXVoCF
 673PC/ZunTQxqS53cmbFD6lk4+iwV2gg/cBxbkFxWXNseRxoGBokg9vIJCwY2mXbratNYjqmtX6Uz
 zht7gLW3g3sBV/rnu5FVBTW9jFi3Q==;
Message-Id: <1d0fc0d0eef057dc02055f531907188d19a83cb2.1625483630.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1625483630.git.qemu_oss@crudebyte.com>
References: <cover.1625483630.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 05 Jul 2021 13:13:51 +0200
Subject: [PULL 5/8] 9pfs: drop fid_to_qid()
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=1d0fc0d0eef057dc02055f531907188d19a83cb2@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

There is only one user of fid_to_qid() which is v9fs_walk(). Let's
open-code fid_to_qid() directly within v9fs_walk(), because
fid_to_qid() hides the POSIX stat buffer which we are going to need
in the subsequent patch.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-Id: <e9a4c9c7a0792ed4db6578d105a0823ea05bc324.1622821729.git.qemu_oss@crudebyte.com>
---
 hw/9pfs/9p.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index eb15ec2082..0e3857798d 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -971,23 +971,6 @@ static int stat_to_qid(V9fsPDU *pdu, const struct stat *stbuf, V9fsQID *qidp)
     return 0;
 }
 
-static int coroutine_fn fid_to_qid(V9fsPDU *pdu, V9fsFidState *fidp,
-                                   V9fsQID *qidp)
-{
-    struct stat stbuf;
-    int err;
-
-    err = v9fs_co_lstat(pdu, &fidp->path, &stbuf);
-    if (err < 0) {
-        return err;
-    }
-    err = stat_to_qid(pdu, &stbuf, qidp);
-    if (err < 0) {
-        return err;
-    }
-    return 0;
-}
-
 V9fsPDU *pdu_alloc(V9fsState *s)
 {
     V9fsPDU *pdu = NULL;
@@ -1772,7 +1755,11 @@ static void coroutine_fn v9fs_walk(void *opaque)
     v9fs_path_init(&dpath);
     v9fs_path_init(&path);
 
-    err = fid_to_qid(pdu, fidp, &qid);
+    err = v9fs_co_lstat(pdu, &fidp->path, &stbuf);
+    if (err < 0) {
+        goto out;
+    }
+    err = stat_to_qid(pdu, &stbuf, &qid);
     if (err < 0) {
         goto out;
     }
-- 
2.20.1


