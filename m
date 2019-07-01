Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4442A3AB31
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jun 2019 20:44:05 +0200 (CEST)
Received: from localhost ([::1]:37466 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ha2nU-0002Wn-Fq
	for lists+qemu-devel@lfdr.de; Sun, 09 Jun 2019 14:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49276)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1ha2fc-0004Rp-EF
 for qemu-devel@nongnu.org; Sun, 09 Jun 2019 14:35:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1ha2fa-00064H-Lx
 for qemu-devel@nongnu.org; Sun, 09 Jun 2019 14:35:56 -0400
Received: from relay.sw.ru ([185.231.240.75]:47590)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1ha2fa-00062W-Cu; Sun, 09 Jun 2019 14:35:54 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.91)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1ha2fX-00087U-AD; Sun, 09 Jun 2019 21:35:51 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Sun,  9 Jun 2019 21:35:46 +0300
Message-Id: <1560105348-459129-6-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1560105348-459129-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1560105348-459129-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH 5/7] iotests: extended timeout under Valgrind
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, mreitz@redhat.com,
 rkagan@virtuozzo.com, andrey.shinkevich@virtuozzo.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As the iotests run longer under the Valgrind, the QEMU_COMM_TIMEOUT is
to be increased in the test cases 028, 183 and 192 when running under
the Valgrind.

Suggested-by: Roman Kagan <rkagan@virtuozzo.com>
Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 tests/qemu-iotests/028 | 6 +++++-
 tests/qemu-iotests/183 | 9 ++++++++-
 tests/qemu-iotests/192 | 6 +++++-
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/028 b/tests/qemu-iotests/028
index 01f4959..2fd4405 100755
--- a/tests/qemu-iotests/028
+++ b/tests/qemu-iotests/028
@@ -110,7 +110,11 @@ echo
 qemu_comm_method="monitor"
 _launch_qemu -drive file="${TEST_IMG}",cache=${CACHEMODE},id=disk
 h=$QEMU_HANDLE
-QEMU_COMM_TIMEOUT=1
+if [ "${VALGRIND_QEMU}" == "y" ]; then
+    QEMU_COMM_TIMEOUT=4
+else
+    QEMU_COMM_TIMEOUT=1
+fi
 
 # Silence output since it contains the disk image path and QEMU's readline
 # character echoing makes it very hard to filter the output. Plus, there
diff --git a/tests/qemu-iotests/183 b/tests/qemu-iotests/183
index fbe5a99..71feab8 100755
--- a/tests/qemu-iotests/183
+++ b/tests/qemu-iotests/183
@@ -94,8 +94,15 @@ if echo "$reply" | grep "compiled without old-style" > /dev/null; then
     _notrun "migrate -b support not compiled in"
 fi
 
-QEMU_COMM_TIMEOUT=0.1 qemu_cmd_repeat=50 silent=yes \
+timeout_comm=$QEMU_COMM_TIMEOUT
+if [ "${VALGRIND_QEMU}" == "y" ]; then
+    QEMU_COMM_TIMEOUT=1
+else
+    QEMU_COMM_TIMEOUT=0.1
+fi
+qemu_cmd_repeat=50 silent=yes \
     _send_qemu_cmd $src "{ 'execute': 'query-migrate' }" '"status": "completed"'
+QEMU_COMM_TIMEOUT=$timeout_comm
 _send_qemu_cmd $src "{ 'execute': 'query-status' }" "return"
 
 echo
diff --git a/tests/qemu-iotests/192 b/tests/qemu-iotests/192
index 6193257..11ea037 100755
--- a/tests/qemu-iotests/192
+++ b/tests/qemu-iotests/192
@@ -60,7 +60,11 @@ fi
 qemu_comm_method="monitor"
 _launch_qemu -drive $DRIVE_ARG -incoming defer
 h=$QEMU_HANDLE
-QEMU_COMM_TIMEOUT=1
+if [ "${VALGRIND_QEMU}" == "y" ]; then
+    QEMU_COMM_TIMEOUT=4
+else
+    QEMU_COMM_TIMEOUT=1
+fi
 
 _send_qemu_cmd $h "nbd_server_start unix:$TEST_DIR/nbd" "(qemu)"
 _send_qemu_cmd $h "nbd_server_add -w drive0" "(qemu)"
-- 
1.8.3.1


