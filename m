Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF583BBC8A
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 14:00:08 +0200 (CEST)
Received: from localhost ([::1]:37730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0NGh-00040T-M3
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 08:00:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <f22cad42281621f86a0756a7cff382f90a33ec8c@lizzy.crudebyte.com>)
 id 1m0NEP-0001QG-Nc
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 07:57:45 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:49279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <f22cad42281621f86a0756a7cff382f90a33ec8c@lizzy.crudebyte.com>)
 id 1m0NEO-0007O1-5o
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 07:57:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=2PeUQRFF1okpWE4jlq0lT7l7JXEpBQ/kI+ArKDSq7+E=; b=R/C9f
 M60+vm+uF6T0sfCfw0Fs9pfRgTI78BFeBU8lr5nIjCpC5FD6fNhF9jUE+ka0BenrO5GVsIDCwpRWL
 g7+55LUaxDG+tDmnhLhMG5+KfCBD8BM5wiF/GBID3LE8jSPbfqam3BaELFVT7s7MS8Bwnpv8vVw63
 RliSjoJ7GusucdivU2x5KmCGfJ/+Y8jfq/bfroYx/gLTUXX/voNTmpysd7s85y3InyQOkTnCoDfaf
 sij+be/81P2+svh+pOuUaW/NTU5f3N2dAu97ZBlRemIoUPIyZ5wLk81lEq96nr/dRU12g7O4ydW67
 IDlzz0rrHiCDmz/XrqvHHWPl9P6FA==;
Message-Id: <f22cad42281621f86a0756a7cff382f90a33ec8c.1625483630.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1625483630.git.qemu_oss@crudebyte.com>
References: <cover.1625483630.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 05 Jul 2021 13:13:51 +0200
Subject: [PULL 6/8] 9pfs: replace not_same_qid() by same_stat_id()
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=f22cad42281621f86a0756a7cff382f90a33ec8c@lizzy.crudebyte.com;
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

As we are actually only comparing the filesystem ID (i.e. device number
and inode number pair) let's use the POSIX stat buffer instead of QIDs,
because resolving QIDs requires to be done on 9p server's main thread
only as it might mutate the server state if inode remapping is enabled.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-Id: <26aa465ff9cc9c07e053331554a02fdae3994417.1622821729.git.qemu_oss@crudebyte.com>
---
 hw/9pfs/9p.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 0e3857798d..47b000d3a9 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -1696,9 +1696,9 @@ static bool name_is_illegal(const char *name)
     return !*name || strchr(name, '/') != NULL;
 }
 
-static bool not_same_qid(const V9fsQID *qid1, const V9fsQID *qid2)
+static bool same_stat_id(const struct stat *a, const struct stat *b)
 {
-    return qid1->path != qid2->path;
+    return a->st_dev == b->st_dev && a->st_ino == b->st_ino;
 }
 
 static void coroutine_fn v9fs_walk(void *opaque)
@@ -1771,7 +1771,7 @@ static void coroutine_fn v9fs_walk(void *opaque)
     v9fs_path_copy(&dpath, &fidp->path);
     v9fs_path_copy(&path, &fidp->path);
     for (name_idx = 0; name_idx < nwnames; name_idx++) {
-        if (not_same_qid(&pdu->s->root_qid, &qid) ||
+        if (!same_stat_id(&pdu->s->root_st, &stbuf) ||
             strcmp("..", wnames[name_idx].data)) {
             err = v9fs_co_name_to_path(pdu, &dpath, wnames[name_idx].data,
                                        &path);
-- 
2.20.1


