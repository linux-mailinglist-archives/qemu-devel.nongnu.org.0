Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA8B39BEE5
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:33:58 +0200 (CEST)
Received: from localhost ([::1]:35810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDhl-0004oU-KW
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <26aa465ff9cc9c07e053331554a02fdae3994417@lizzy.crudebyte.com>)
 id 1lpCty-0002qi-V9
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:42:30 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:58385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <26aa465ff9cc9c07e053331554a02fdae3994417@lizzy.crudebyte.com>)
 id 1lpCtx-00060r-CA
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:42:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=buL4vtQqomvNC9pu6gOlE7wmMrN3KK9Mem6DNoh4RjU=; b=SGl4W
 mdotLcbMvM8MdU5j6N5bxNrXd1KY8oU/hzrkgs9yInOmlGiZrWoz1/5LPIajjdROmEERF0o+80mqB
 XoQnnZu2JipYgUDbuskMSPKnvLOFaEwRLmw6mrkuMm3EjuluymoGwvpxphEDxf4KQLWFZxxd90GKJ
 U2s/mcjCvYdox9narDIAqAzIePNJUnxiU0XwI6/HdjSyYzXN4XT5Ku/sZCyc9/I0PIh9WkENjo/cb
 QIYqFVoE02MH+g9r1i7pZZQnGju1XclERZvEfJG1cmz2gol4w/KcAOxa1PnrRtgEVr0SR2MVcbASG
 00xOgyR8946pbissMl/+LgclSI7DA==;
Message-Id: <26aa465ff9cc9c07e053331554a02fdae3994417.1622821729.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1622821729.git.qemu_oss@crudebyte.com>
References: <cover.1622821729.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 4 Jun 2021 17:21:43 +0200
Subject: [PATCH v2 5/7] 9pfs: replace not_same_qid() by same_stat_id()
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=26aa465ff9cc9c07e053331554a02fdae3994417@lizzy.crudebyte.com;
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


