Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BDC39BE9F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:25:25 +0200 (CEST)
Received: from localhost ([::1]:38386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDZT-00045z-7z
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:25:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <e9a4c9c7a0792ed4db6578d105a0823ea05bc324@lizzy.crudebyte.com>)
 id 1lpCoj-0001Pv-0B
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:37:06 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:46441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <e9a4c9c7a0792ed4db6578d105a0823ea05bc324@lizzy.crudebyte.com>)
 id 1lpCoc-0003ci-Sj
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:37:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=PazLJKZiQEVaGIIPZt1TFDxdCexiLb9bZg3fN3Mxfng=; b=Qhg0c
 9kvDbb+PQ7ANf42FN1CNIFpriwXxqrd55k5OvF5I9BCyQRbdt5o72zxY5cBCY5FoPTjr0KNBvph5s
 GR2GCNcCyby4uRvwqlkLzK+pV4Gp1/erXuKuJdX0RnMzCs4v086nrSMtyXQoSZScUX9jqucZCBtqd
 R85a0L0Udj6Guh+7d9oJ0n0eBf4dsQ9I63/CWc639AK3uXpb4NmnI267R6qfGWM9NKG4qINes5GiQ
 jz+kfwVydeRlUe79wp52mWAmsfMTl+V3T1+xUUjO/Qcxv7agZfctyUQAsHIBGfXRjad3UeFkD+8bc
 0pIRrRB1f8qpPHrBFP+aH0QpaJ/dg==;
Message-Id: <e9a4c9c7a0792ed4db6578d105a0823ea05bc324.1622821729.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1622821729.git.qemu_oss@crudebyte.com>
References: <cover.1622821729.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 4 Jun 2021 17:13:17 +0200
Subject: [PATCH v2 4/7] 9pfs: drop fid_to_qid()
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=e9a4c9c7a0792ed4db6578d105a0823ea05bc324@lizzy.crudebyte.com;
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


