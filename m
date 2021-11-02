Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 663EB443289
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 17:16:52 +0100 (CET)
Received: from localhost ([::1]:51644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhwSx-0000AW-HY
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:16:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mhwIQ-0007KH-Fu
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:05:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mhwIK-0004Fm-P9
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:05:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635869152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R5m412bVvicqzaN/Mu2HLj/DtTYHb9+gJLKY3laMJ00=;
 b=hW954t1ZVUGPHoTF5ey0CDJVq2XqZygWRXaecwO2dCnR/4p6zz28kuvxvpZegeGpnPT2x8
 ujJZEK41p294eIUS/LaHnbkZhkIFAgiiQt34WJyh+CwvH4fkhh9WwYHfT5YWCneqokNf7Z
 iBJSp7wWgLpWSbZxoi4tCethyl3fo54=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-ICBEO5NkN_SWefQ_xTy_9Q-1; Tue, 02 Nov 2021 12:05:48 -0400
X-MC-Unique: ICBEO5NkN_SWefQ_xTy_9Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D29008066F0;
 Tue,  2 Nov 2021 16:05:47 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DBF4F5D9D3;
 Tue,  2 Nov 2021 16:05:46 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 02/12] block: Fail gracefully when blockdev-snapshot creates
 loops
Date: Tue,  2 Nov 2021 17:05:18 +0100
Message-Id: <20211102160528.206766-3-kwolf@redhat.com>
In-Reply-To: <20211102160528.206766-1-kwolf@redhat.com>
References: <20211102160528.206766-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using blockdev-snapshot to append a node as an overlay to itself, or to
any of its parents, causes crashes. Catch the condition and return an
error for these cases instead.

Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1824363
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20211018134714.48438-1-kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c                    | 10 ++++++++++
 tests/qemu-iotests/085     | 31 ++++++++++++++++++++++++++++++-
 tests/qemu-iotests/085.out | 33 ++++++++++++++++++++++++++++++---
 3 files changed, 70 insertions(+), 4 deletions(-)

diff --git a/block.c b/block.c
index 45f653a88b..580cb77a70 100644
--- a/block.c
+++ b/block.c
@@ -84,6 +84,9 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
                                            BdrvChildRole child_role,
                                            Error **errp);
 
+static bool bdrv_recurse_has_child(BlockDriverState *bs,
+                                   BlockDriverState *child);
+
 static void bdrv_replace_child_noperm(BdrvChild *child,
                                       BlockDriverState *new_bs);
 static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
@@ -2673,6 +2676,7 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
     int drain_saldo;
 
     assert(!child->frozen);
+    assert(old_bs != new_bs);
 
     if (old_bs && new_bs) {
         assert(bdrv_get_aio_context(old_bs) == bdrv_get_aio_context(new_bs));
@@ -2892,6 +2896,12 @@ static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
 
     assert(parent_bs->drv);
 
+    if (bdrv_recurse_has_child(child_bs, parent_bs)) {
+        error_setg(errp, "Making '%s' a %s child of '%s' would create a cycle",
+                   child_bs->node_name, child_name, parent_bs->node_name);
+        return -EINVAL;
+    }
+
     bdrv_get_cumulative_perm(parent_bs, &perm, &shared_perm);
     bdrv_child_perm(parent_bs, child_bs, NULL, child_role, NULL,
                     perm, shared_perm, &perm, &shared_perm);
diff --git a/tests/qemu-iotests/085 b/tests/qemu-iotests/085
index d557522943..de74262a26 100755
--- a/tests/qemu-iotests/085
+++ b/tests/qemu-iotests/085
@@ -103,11 +103,18 @@ do_blockdev_add()
 }
 
 # ${1}: unique identifier for the snapshot filename
-add_snapshot_image()
+create_snapshot_image()
 {
     base_image="${TEST_DIR}/$((${1}-1))-${snapshot_virt0}"
     snapshot_file="${TEST_DIR}/${1}-${snapshot_virt0}"
     TEST_IMG=$snapshot_file _make_test_img -u -b "${base_image}" -F $IMGFMT "$size"
+}
+
+# ${1}: unique identifier for the snapshot filename
+add_snapshot_image()
+{
+    snapshot_file="${TEST_DIR}/${1}-${snapshot_virt0}"
+    create_snapshot_image "$1"
     do_blockdev_add "$1" "'backing': null, " "${snapshot_file}"
 }
 
@@ -230,6 +237,28 @@ _make_test_img -b "${TEST_IMG}.base" -F $IMGFMT "$size"
 do_blockdev_add ${SNAPSHOTS} "" "${TEST_IMG}"
 blockdev_snapshot ${SNAPSHOTS} error
 
+echo
+echo === Invalid command - creating loops ===
+echo
+
+SNAPSHOTS=$((${SNAPSHOTS}+1))
+add_snapshot_image ${SNAPSHOTS}
+
+_send_qemu_cmd $h "{ 'execute': 'blockdev-snapshot',
+                     'arguments': { 'node':'snap_${SNAPSHOTS}',
+                                    'overlay':'snap_${SNAPSHOTS}' }
+                   }" "error"
+
+SNAPSHOTS=$((${SNAPSHOTS}+1))
+create_snapshot_image ${SNAPSHOTS}
+do_blockdev_add ${SNAPSHOTS} "'backing': 'snap_$((${SNAPSHOTS}-1))', " \
+    "${TEST_DIR}/${SNAPSHOTS}-${snapshot_virt0}"
+
+_send_qemu_cmd $h "{ 'execute': 'blockdev-snapshot',
+                     'arguments': { 'node':'snap_${SNAPSHOTS}',
+                                    'overlay':'snap_$((${SNAPSHOTS}-1))' }
+                   }" "error"
+
 echo
 echo === Invalid command - The node does not exist ===
 echo
diff --git a/tests/qemu-iotests/085.out b/tests/qemu-iotests/085.out
index 1d4c565b6d..b543b992ff 100644
--- a/tests/qemu-iotests/085.out
+++ b/tests/qemu-iotests/085.out
@@ -217,15 +217,42 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 backing_file=TEST_DIR/
                                      'overlay':'snap_13' } }
 {"error": {"class": "GenericError", "desc": "The overlay already has a backing image"}}
 
+=== Invalid command - creating loops ===
+
+Formatting 'TEST_DIR/14-snapshot-v0.IMGFMT', fmt=IMGFMT size=134217728 backing_file=TEST_DIR/13-snapshot-v0.IMGFMT backing_fmt=IMGFMT
+{ 'execute': 'blockdev-add', 'arguments':
+           { 'driver': 'IMGFMT', 'node-name': 'snap_14', 'backing': null,
+             'file':
+             { 'driver': 'file', 'filename': 'TEST_DIR/14-snapshot-v0.IMGFMT',
+               'node-name': 'file_14' } } }
+{"return": {}}
+{ 'execute': 'blockdev-snapshot',
+                     'arguments': { 'node':'snap_14',
+                                    'overlay':'snap_14' }
+                   }
+{"error": {"class": "GenericError", "desc": "Making 'snap_14' a backing child of 'snap_14' would create a cycle"}}
+Formatting 'TEST_DIR/15-snapshot-v0.IMGFMT', fmt=IMGFMT size=134217728 backing_file=TEST_DIR/14-snapshot-v0.IMGFMT backing_fmt=IMGFMT
+{ 'execute': 'blockdev-add', 'arguments':
+           { 'driver': 'IMGFMT', 'node-name': 'snap_15', 'backing': 'snap_14',
+             'file':
+             { 'driver': 'file', 'filename': 'TEST_DIR/15-snapshot-v0.IMGFMT',
+               'node-name': 'file_15' } } }
+{"return": {}}
+{ 'execute': 'blockdev-snapshot',
+                     'arguments': { 'node':'snap_15',
+                                    'overlay':'snap_14' }
+                   }
+{"error": {"class": "GenericError", "desc": "Making 'snap_15' a backing child of 'snap_14' would create a cycle"}}
+
 === Invalid command - The node does not exist ===
 
 { 'execute': 'blockdev-snapshot',
                       'arguments': { 'node': 'virtio0',
-                                     'overlay':'snap_14' } }
-{"error": {"class": "GenericError", "desc": "Cannot find device='snap_14' nor node-name='snap_14'"}}
+                                     'overlay':'snap_16' } }
+{"error": {"class": "GenericError", "desc": "Cannot find device='snap_16' nor node-name='snap_16'"}}
 { 'execute': 'blockdev-snapshot',
                      'arguments': { 'node':'nodevice',
-                                    'overlay':'snap_13' }
+                                    'overlay':'snap_15' }
                    }
 {"error": {"class": "GenericError", "desc": "Cannot find device='nodevice' nor node-name='nodevice'"}}
 *** done
-- 
2.31.1


