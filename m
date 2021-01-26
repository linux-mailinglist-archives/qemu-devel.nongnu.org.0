Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D100303BE2
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 12:43:04 +0100 (CET)
Received: from localhost ([::1]:42298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4MkR-0001n8-IG
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 06:43:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1l4MU8-00041l-AI
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:26:12 -0500
Received: from kerio.kamp.de ([195.62.97.192]:33579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1l4MU6-0002yk-7y
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:26:11 -0500
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 12:25:44 +0100
Received: (qmail 32738 invoked from network); 26 Jan 2021 11:25:47 -0000
Received: from lieven-pc.kamp-intra.net (HELO lieven-pc)
 (relay@kamp.de@::ffff:172.21.12.60)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPA;
 26 Jan 2021 11:25:47 -0000
Received: by lieven-pc (Postfix, from userid 1060)
 id CEA4213DC88; Tue, 26 Jan 2021 12:25:47 +0100 (CET)
From: Peter Lieven <pl@kamp.de>
To: qemu-block@nongnu.org
Subject: [PATCH V2 2/7] block/rbd: store object_size in BDRVRBDState
Date: Tue, 26 Jan 2021 12:25:35 +0100
Message-Id: <20210126112540.11880-3-pl@kamp.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210126112540.11880-1-pl@kamp.de>
References: <20210126112540.11880-1-pl@kamp.de>
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org,
 ct@flyingcircus.io, pbonzini@redhat.com, mreitz@redhat.com,
 dillaman@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Peter Lieven <pl@kamp.de>
---
 block/rbd.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index a191c74619..1028596c68 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -90,6 +90,7 @@ typedef struct BDRVRBDState {
     char *snap;
     char *namespace;
     uint64_t image_size;
+    uint64_t object_size;
 } BDRVRBDState;
 
 static int qemu_rbd_connect(rados_t *cluster, rados_ioctx_t *io_ctx,
@@ -663,6 +664,7 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
     const QDictEntry *e;
     Error *local_err = NULL;
     char *keypairs, *secretid;
+    rbd_image_info_t info;
     int r;
 
     keypairs = g_strdup(qdict_get_try_str(options, "=keyvalue-pairs"));
@@ -727,13 +729,15 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
         goto failed_open;
     }
 
-    r = rbd_get_size(s->image, &s->image_size);
+    r = rbd_stat(s->image, &info, sizeof(info));
     if (r < 0) {
-        error_setg_errno(errp, -r, "error getting image size from %s",
+        error_setg_errno(errp, -r, "error getting image info from %s",
                          s->image_name);
         rbd_close(s->image);
         goto failed_open;
     }
+    s->image_size = info.size;
+    s->object_size = info.obj_size;
 
     /* If we are using an rbd snapshot, we must be r/o, otherwise
      * leave as-is */
@@ -945,15 +949,7 @@ static BlockAIOCB *qemu_rbd_aio_flush(BlockDriverState *bs,
 static int qemu_rbd_getinfo(BlockDriverState *bs, BlockDriverInfo *bdi)
 {
     BDRVRBDState *s = bs->opaque;
-    rbd_image_info_t info;
-    int r;
-
-    r = rbd_stat(s->image, &info, sizeof(info));
-    if (r < 0) {
-        return r;
-    }
-
-    bdi->cluster_size = info.obj_size;
+    bdi->cluster_size = s->object_size;
     return 0;
 }
 
-- 
2.17.1



