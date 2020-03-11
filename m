Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABCC181C95
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 16:44:09 +0100 (CET)
Received: from localhost ([::1]:54480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jC3Wi-0004Uc-4O
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 11:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59667)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jC3VC-0002hk-JZ
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:42:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jC3VB-0002Tj-6e
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:42:34 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:23141
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jC3VB-0002PL-22
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:42:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583941352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dHBO9R+zUZqsajXF82ZWfcPQFIROfvmOtd4KApaM7jg=;
 b=gVLZLAWx0ElwuKpB9yDnaBxPTP8R9csphmx3PDqZDeW1PdjSReZHpyKIqBJAcU9niQTJ1H
 qaJuhBPbB5Gg+CsmX1T8IrBou2GqEg9gFG57Wy8OuASzcdTee11hmKdwGDM0xuN5OS5KbG
 JEtoMbpP8ImYm/4vylcSsaM4FGIHL4I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-XXMMMva_OFakeeVW84iW0g-1; Wed, 11 Mar 2020 11:42:27 -0400
X-MC-Unique: XXMMMva_OFakeeVW84iW0g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6B10107ACC4;
 Wed, 11 Mar 2020 15:42:26 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-234.ams2.redhat.com
 [10.36.117.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C541360BEE;
 Wed, 11 Mar 2020 15:42:25 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 03/13] block: Relax restrictions for blockdev-snapshot
Date: Wed, 11 Mar 2020 16:42:08 +0100
Message-Id: <20200311154218.15532-4-kwolf@redhat.com>
In-Reply-To: <20200311154218.15532-1-kwolf@redhat.com>
References: <20200311154218.15532-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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

blockdev-snapshot returned an error if the overlay was already in use,
which it defined as having any BlockBackend parent. This is in fact both
too strict (some parents can tolerate the change of visible data caused
by attaching a backing file) and too loose (some non-BlockBackend
parents may not be happy with it).

One important use case that is prevented by the too strict check is live
storage migration with blockdev-mirror. Here, the target node is
usually opened without a backing file so that the active layer is
mirrored while its backing chain can be copied in the background.

The backing chain should be attached to the mirror target node when
finalising the job, just before switching the users of the source node
to the new copy (at which point the mirror job still has a reference to
the node). drive-mirror did this automatically, but with blockdev-mirror
this is the job of the QMP client, so it needs a way to do this.

blockdev-snapshot is the obvious way, so this patch makes it work in
this scenario. The new condition is that no parent uses CONSISTENT_READ
permissions. This will ensure that the operation will still be blocked
when the node is attached to the guest device, so blockdev-snapshot
remains safe.

(For the sake of completeness, x-blockdev-reopen can be used to achieve
the same, however it is a big hammer, performs the graph change
completely unchecked and is still experimental. So even with the option
of using x-blockdev-reopen, there are reasons why blockdev-snapshot
should be able to perform this operation.)

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20200310113831.27293-3-kwolf@redhat.com>
Reviewed-by: Peter Krempa <pkrempa@redhat.com>
Tested-by: Peter Krempa <pkrempa@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 blockdev.c                 | 14 ++++++++------
 tests/qemu-iotests/085.out |  4 ++--
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 257cb37682..ea89896f27 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1471,6 +1471,7 @@ static void external_snapshot_prepare(BlkActionState =
*common,
     TransactionAction *action =3D common->action;
     AioContext *aio_context;
     AioContext *old_context;
+    uint64_t perm, shared;
     int ret;
=20
     /* 'blockdev-snapshot' and 'blockdev-snapshot-sync' have similar
@@ -1586,16 +1587,17 @@ static void external_snapshot_prepare(BlkActionStat=
e *common,
         goto out;
     }
=20
-    if (bdrv_has_blk(state->new_bs)) {
+    /*
+     * Allow attaching a backing file to an overlay that's already in use =
only
+     * if the parents don't assume that they are already seeing a valid im=
age.
+     * (Specifically, allow it as a mirror target, which is write-only acc=
ess.)
+     */
+    bdrv_get_cumulative_perm(state->new_bs, &perm, &shared);
+    if (perm & BLK_PERM_CONSISTENT_READ) {
         error_setg(errp, "The overlay is already in use");
         goto out;
     }
=20
-    if (bdrv_op_is_blocked(state->new_bs, BLOCK_OP_TYPE_EXTERNAL_SNAPSHOT,
-                           errp)) {
-        goto out;
-    }
-
     if (state->new_bs->backing !=3D NULL) {
         error_setg(errp, "The overlay already has a backing image");
         goto out;
diff --git a/tests/qemu-iotests/085.out b/tests/qemu-iotests/085.out
index d94ad22f70..fd11aae678 100644
--- a/tests/qemu-iotests/085.out
+++ b/tests/qemu-iotests/085.out
@@ -82,7 +82,7 @@ Formatting 'TEST_DIR/12-snapshot-v0.IMGFMT', fmt=3DIMGFMT=
 size=3D134217728 backing_f
 =3D=3D=3D Invalid command - cannot create a snapshot using a file BDS =3D=
=3D=3D
=20
 { 'execute': 'blockdev-snapshot', 'arguments': { 'node':'virtio0', 'overla=
y':'file_12' } }
-{"error": {"class": "GenericError", "desc": "The overlay does not support =
backing images"}}
+{"error": {"class": "GenericError", "desc": "The overlay is already in use=
"}}
=20
 =3D=3D=3D Invalid command - snapshot node used as active layer =3D=3D=3D
=20
@@ -96,7 +96,7 @@ Formatting 'TEST_DIR/12-snapshot-v0.IMGFMT', fmt=3DIMGFMT=
 size=3D134217728 backing_f
 =3D=3D=3D Invalid command - snapshot node used as backing hd =3D=3D=3D
=20
 { 'execute': 'blockdev-snapshot', 'arguments': { 'node': 'virtio0', 'overl=
ay':'snap_11' } }
-{"error": {"class": "GenericError", "desc": "Node 'snap_11' is busy: node =
is used as backing hd of 'snap_12'"}}
+{"error": {"class": "GenericError", "desc": "The overlay is already in use=
"}}
=20
 =3D=3D=3D Invalid command - snapshot node has a backing image =3D=3D=3D
=20
--=20
2.20.1


