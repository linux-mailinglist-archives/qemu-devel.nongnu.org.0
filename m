Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBAD398B08
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:50:42 +0200 (CEST)
Received: from localhost ([::1]:53806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loRGb-0001lp-SU
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:50:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loRBx-0008HX-On
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:45:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loRBv-000701-75
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:45:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622641550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r2vWyn01OGYWoYZoaDJemE1mxbM2rvuc+eJTVRHdwwI=;
 b=OnyUD7tXQfrC1o3un/CeTovWU+Lb6TrW6qAX6eN0Qhbf8Q4WDeGOny1b2wDnpHdSZrAEzG
 bTU6wPbFds5qVLvOm6DchATZn3iNP7X3eklr5l47LhTX0/cHvQJ/dBzbnRCHiwvktJ3OXN
 4Fd1kWkn9avrQ7mlJWG3fmsRhQADJK8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-QI_6VrE7PIyKVzXe_EannA-1; Wed, 02 Jun 2021 09:45:47 -0400
X-MC-Unique: QI_6VrE7PIyKVzXe_EannA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8803880623D;
 Wed,  2 Jun 2021 13:45:38 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-240.ams2.redhat.com [10.36.114.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9112419809;
 Wed,  2 Jun 2021 13:45:37 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 03/20] block/vvfat: child_vvfat_qcow: add
 .get_parent_aio_context, fix crash
Date: Wed,  2 Jun 2021 15:45:12 +0200
Message-Id: <20210602134529.231756-4-kwolf@redhat.com>
In-Reply-To: <20210602134529.231756-1-kwolf@redhat.com>
References: <20210602134529.231756-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Commit 3ca1f3225727419ba573673b744edac10904276f
"block: BdrvChildClass: add .get_parent_aio_context handler" introduced
new handler and commit 228ca37e12f97788e05bd0c92f89b3e5e4019607
"block: drop ctx argument from bdrv_root_attach_child" made a generic
use of it. But 3ca1f3225727419ba573673b744edac10904276f didn't update
child_vvfat_qcow. Fix that.

Before that fix the command

./build/qemu-system-x86_64 -usb -device usb-storage,drive=fat16 \
  -drive file=fat:rw:fat-type=16:"<path of a host folder>",id=fat16,format=raw,if=none

crashes:

1  bdrv_child_get_parent_aio_context (c=0x559d62426d20)
    at ../block.c:1440
2  bdrv_attach_child_common
    (child_bs=0x559d62468190, child_name=0x559d606f9e3d "write-target",
     child_class=0x559d60c58d20 <child_vvfat_qcow>, child_role=3,
     perm=3, shared_perm=4, opaque=0x559d62445690,
     child=0x7ffc74c2acc8, tran=0x559d6246ddd0, errp=0x7ffc74c2ae60)
    at ../block.c:2795
3  bdrv_attach_child_noperm
    (parent_bs=0x559d62445690, child_bs=0x559d62468190,
     child_name=0x559d606f9e3d "write-target",
     child_class=0x559d60c58d20 <child_vvfat_qcow>, child_role=3,
     child=0x7ffc74c2acc8, tran=0x559d6246ddd0, errp=0x7ffc74c2ae60) at
    ../block.c:2855
4  bdrv_attach_child
    (parent_bs=0x559d62445690, child_bs=0x559d62468190,
     child_name=0x559d606f9e3d "write-target",
     child_class=0x559d60c58d20 <child_vvfat_qcow>, child_role=3,
     errp=0x7ffc74c2ae60) at ../block.c:2953
5  bdrv_open_child
    (filename=0x559d62464b80 "/var/tmp/vl.h3TIS4",
     options=0x559d6246ec20, bdref_key=0x559d606f9e3d "write-target",
     parent=0x559d62445690, child_class=0x559d60c58d20
     <child_vvfat_qcow>, child_role=3, allow_none=false,
     errp=0x7ffc74c2ae60) at ../block.c:3351
6  enable_write_target (bs=0x559d62445690, errp=0x7ffc74c2ae60) at
   ../block/vvfat.c:3176
7  vvfat_open (bs=0x559d62445690, options=0x559d6244adb0, flags=155650,
               errp=0x7ffc74c2ae60) at ../block/vvfat.c:1236
8  bdrv_open_driver (bs=0x559d62445690, drv=0x559d60d4f7e0
                     <bdrv_vvfat>, node_name=0x0,
                     options=0x559d6244adb0, open_flags=155650,
                     errp=0x7ffc74c2af70) at ../block.c:1557
9  bdrv_open_common (bs=0x559d62445690, file=0x0,
                     options=0x559d6244adb0, errp=0x7ffc74c2af70) at
...

(gdb) fr 1
 #1  0x0000559d603ea3bf in bdrv_child_get_parent_aio_context
     (c=0x559d62426d20) at ../block.c:1440
1440        return c->klass->get_parent_aio_context(c);
 (gdb) p c->klass
$1 = (const BdrvChildClass *) 0x559d60c58d20 <child_vvfat_qcow>
 (gdb) p c->klass->get_parent_aio_context
$2 = (AioContext *(*)(BdrvChild *)) 0x0

Fixes: 3ca1f3225727419ba573673b744edac10904276f
Fixes: 228ca37e12f97788e05bd0c92f89b3e5e4019607
Reported-by: John Arbuckle <programmingkidx@gmail.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210524101257.119377-2-vsementsov@virtuozzo.com>
Tested-by: John Arbuckle <programmingkidx@gmail.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block.h | 1 +
 block.c               | 4 ++--
 block/vvfat.c         | 1 +
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 82185965ff..8e707a83b7 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -701,6 +701,7 @@ bool bdrv_child_can_set_aio_context(BdrvChild *c, AioContext *ctx,
 bool bdrv_can_set_aio_context(BlockDriverState *bs, AioContext *ctx,
                               GSList **ignore, Error **errp);
 AioContext *bdrv_child_get_parent_aio_context(BdrvChild *c);
+AioContext *child_of_bds_get_parent_aio_context(BdrvChild *c);
 
 int bdrv_probe_blocksizes(BlockDriverState *bs, BlockSizes *bsz);
 int bdrv_probe_geometry(BlockDriverState *bs, HDGeometry *geo);
diff --git a/block.c b/block.c
index 0dc97281dc..ef13076c4c 100644
--- a/block.c
+++ b/block.c
@@ -1412,7 +1412,7 @@ static int bdrv_child_cb_update_filename(BdrvChild *c, BlockDriverState *base,
     return 0;
 }
 
-static AioContext *bdrv_child_cb_get_parent_aio_context(BdrvChild *c)
+AioContext *child_of_bds_get_parent_aio_context(BdrvChild *c)
 {
     BlockDriverState *bs = c->opaque;
 
@@ -1432,7 +1432,7 @@ const BdrvChildClass child_of_bds = {
     .can_set_aio_ctx = bdrv_child_cb_can_set_aio_ctx,
     .set_aio_ctx     = bdrv_child_cb_set_aio_ctx,
     .update_filename = bdrv_child_cb_update_filename,
-    .get_parent_aio_context = bdrv_child_cb_get_parent_aio_context,
+    .get_parent_aio_context = child_of_bds_get_parent_aio_context,
 };
 
 AioContext *bdrv_child_get_parent_aio_context(BdrvChild *c)
diff --git a/block/vvfat.c b/block/vvfat.c
index 54807f82ca..07232a7cfc 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -3130,6 +3130,7 @@ static void vvfat_qcow_options(BdrvChildRole role, bool parent_is_format,
 static const BdrvChildClass child_vvfat_qcow = {
     .parent_is_bds      = true,
     .inherit_options    = vvfat_qcow_options,
+    .get_parent_aio_context = child_of_bds_get_parent_aio_context,
 };
 
 static int enable_write_target(BlockDriverState *bs, Error **errp)
-- 
2.30.2


