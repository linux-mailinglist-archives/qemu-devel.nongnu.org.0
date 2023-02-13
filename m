Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9668C6942E0
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 11:32:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRW7j-0002pW-6F; Mon, 13 Feb 2023 05:31:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1pRW7b-0002mi-Nh; Mon, 13 Feb 2023 05:31:47 -0500
Received: from relay.virtuozzo.com ([130.117.225.111])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1pRW7Y-0003Lx-RY; Mon, 13 Feb 2023 05:31:42 -0500
Received: from [192.168.16.24] (helo=iris.sw.ru)
 by relay.virtuozzo.com with esmtp (Exim 4.95)
 (envelope-from <den@openvz.org>) id 1pRW7T-007XSn-05;
 Mon, 13 Feb 2023 11:31:35 +0100
From: "Denis V. Lunev" <den@openvz.org>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Cc: "Denis V. Lunev" <den@openvz.org>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH 1/1] block: improve error logging in bdrv_reopen_prepare()
Date: Mon, 13 Feb 2023 11:31:34 +0100
Message-Id: <20230213103134.1703111-1-den@openvz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=130.117.225.111; envelope-from=den@openvz.org;
 helo=relay.virtuozzo.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The error generated when the option could not be changed inside
bdrv_reopen_prepare() does not give a clue about problematic
BlockDriverState as we could get very long tree of devices.

The patch adds node name to the error report in the same way as done
above.

Signed-off-by: Denis V. Lunev <den@openvz.org>
CC: Kevin Wolf <kwolf@redhat.com>
CC: Hanna Reitz <hreitz@redhat.com>
CC: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 block.c                    |  4 +++-
 tests/qemu-iotests/133     | 12 ++++++------
 tests/qemu-iotests/133.out | 12 ++++++------
 3 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/block.c b/block.c
index b4a89207ad..0da38652c3 100644
--- a/block.c
+++ b/block.c
@@ -4828,7 +4828,9 @@ static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
              * so they will stay unchanged.
              */
             if (!qobject_is_equal(new, old)) {
-                error_setg(errp, "Cannot change the option '%s'", entry->key);
+                error_setg(errp, "Cannot change the option '%s' on '%s'",
+                           entry->key,
+                           bdrv_get_device_or_node_name(reopen_state->bs));
                 ret = -EINVAL;
                 goto error;
             }
diff --git a/tests/qemu-iotests/133 b/tests/qemu-iotests/133
index d997db1685..63fd9886ad 100755
--- a/tests/qemu-iotests/133
+++ b/tests/qemu-iotests/133
@@ -47,9 +47,9 @@ echo
 echo "=== Check that node-name can't be changed ==="
 echo
 
-$QEMU_IO -c 'reopen -o node-name=foo' $TEST_IMG
-$QEMU_IO -c 'reopen -o file.node-name=foo' $TEST_IMG
-$QEMU_IO -c 'reopen -o backing.node-name=foo' $TEST_IMG
+$QEMU_IO -c 'reopen -o node-name=foo' $TEST_IMG 2>&1 | _filter_generated_node_ids
+$QEMU_IO -c 'reopen -o file.node-name=foo' $TEST_IMG 2>&1 | _filter_generated_node_ids
+$QEMU_IO -c 'reopen -o backing.node-name=foo' $TEST_IMG 2>&1 | _filter_generated_node_ids
 
 echo
 echo "=== Check that unchanged node-name is okay ==="
@@ -69,9 +69,9 @@ echo
 echo "=== Check that driver can't be changed ==="
 echo
 
-$QEMU_IO -c 'reopen -o driver=raw' $TEST_IMG
-$QEMU_IO -c 'reopen -o file.driver=qcow2' $TEST_IMG
-$QEMU_IO -c 'reopen -o backing.driver=file' $TEST_IMG
+$QEMU_IO -c 'reopen -o driver=raw' $TEST_IMG 2>&1 | _filter_generated_node_ids
+$QEMU_IO -c 'reopen -o file.driver=qcow2' $TEST_IMG 2>&1 | _filter_generated_node_ids
+$QEMU_IO -c 'reopen -o backing.driver=file' $TEST_IMG 2>&1 | _filter_generated_node_ids
 
 echo
 echo "=== Check that unchanged driver is okay ==="
diff --git a/tests/qemu-iotests/133.out b/tests/qemu-iotests/133.out
index d70c2e8041..26aad4a0fd 100644
--- a/tests/qemu-iotests/133.out
+++ b/tests/qemu-iotests/133.out
@@ -4,18 +4,18 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file=TEST_DIR/t
 
 === Check that node-name can't be changed ===
 
-qemu-io: Cannot change the option 'node-name'
-qemu-io: Cannot change the option 'node-name'
-qemu-io: Cannot change the option 'node-name'
+qemu-io: Cannot change the option 'node-name' on 'NODE_NAME'
+qemu-io: Cannot change the option 'node-name' on 'NODE_NAME'
+qemu-io: Cannot change the option 'node-name' on 'NODE_NAME'
 
 === Check that unchanged node-name is okay ===
 
 
 === Check that driver can't be changed ===
 
-qemu-io: Cannot change the option 'driver'
-qemu-io: Cannot change the option 'driver'
-qemu-io: Cannot change the option 'driver'
+qemu-io: Cannot change the option 'driver' on 'NODE_NAME'
+qemu-io: Cannot change the option 'driver' on 'NODE_NAME'
+qemu-io: Cannot change the option 'driver' on 'NODE_NAME'
 
 === Check that unchanged driver is okay ===
 
-- 
2.34.1


