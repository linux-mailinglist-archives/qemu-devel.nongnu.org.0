Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B182431D68
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 15:49:25 +0200 (CEST)
Received: from localhost ([::1]:51770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcT12-0001bN-5z
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 09:49:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mcSzL-0008Kq-KT
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 09:47:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mcSzG-0000uP-PX
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 09:47:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634564853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LkCE0RN/Tejxx9qIDh5X1KdyGeBmwJWads1jcDgt2jw=;
 b=iQsHf6EvWr3aegu6kNIZCMwhwL1NJdwDK0rBMzP7U1KWfXtCvPqqWBfAyal41UhcCYVPu4
 SdJVp+aJ2KDzSL1DjsCpUPDj9znV/yoFTwzc2p9aFjNbtpy7vXZvCgULYBEstFg21Ooagq
 n5kRhrVqr9qJ62+tOII5yWM4h6n6OfE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-N7_RJvJ7PwSip0bQJwId8g-1; Mon, 18 Oct 2021 09:47:31 -0400
X-MC-Unique: N7_RJvJ7PwSip0bQJwId8g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7850D100A640;
 Mon, 18 Oct 2021 13:47:30 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E1C490BA;
 Mon, 18 Oct 2021 13:47:23 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] block: Fail gracefully when blockdev-snapshot creates loops
Date: Mon, 18 Oct 2021 15:47:14 +0200
Message-Id: <20211018134714.48438-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, hreitz@redhat.com, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using blockdev-snapshot to append a node as an overlay to itself, or to
any of its parents, causes crashes. Catch the condition and return an
error for these cases instead.

Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1824363
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c                    | 10 ++++++++++
 tests/qemu-iotests/085     | 31 ++++++++++++++++++++++++++++++-
 tests/qemu-iotests/085.out | 33 ++++++++++++++++++++++++++++++---
 3 files changed, 70 insertions(+), 4 deletions(-)

diff --git a/block.c b/block.c
index 45f653a88b..231dddf655 100644
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
+                   parent_bs->node_name, child_name, child_bs->node_name);
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
index 1d4c565b6d..7750b3df5f 100644
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
+{"error": {"class": "GenericError", "desc": "Making 'snap_14' a backing child of 'snap_15' would create a cycle"}}
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


