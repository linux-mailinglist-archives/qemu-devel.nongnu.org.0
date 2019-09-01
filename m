Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 333EFA48FF
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Sep 2019 13:57:35 +0200 (CEST)
Received: from localhost ([::1]:56722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i4OUA-00071E-0b
	for lists+qemu-devel@lfdr.de; Sun, 01 Sep 2019 07:57:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50242)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1i4OQ7-0003MF-GA
 for qemu-devel@nongnu.org; Sun, 01 Sep 2019 07:53:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1i4OQ5-0004Rr-Ro
 for qemu-devel@nongnu.org; Sun, 01 Sep 2019 07:53:23 -0400
Received: from relay.sw.ru ([185.231.240.75]:52456)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1i4OQ5-0004Mq-IT; Sun, 01 Sep 2019 07:53:21 -0400
Received: from [172.16.25.136] (helo=dhcp-172-16-25-136.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1i4OQ2-0000CW-1D; Sun, 01 Sep 2019 14:53:18 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Sun,  1 Sep 2019 14:53:02 +0300
Message-Id: <1567338786-586124-3-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1567338786-586124-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1567338786-586124-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v7 2/6] iotests: exclude killed processes from
 running under Valgrind
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
 andrey.shinkevich@virtuozzo.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 The Valgrind tool fails to manage its termination in multi-threaded
 processes when they raise the signal SIGKILL. The bug has been reported
 to the Valgrind maintainers and was registered as the bug #409141:
 https://bugs.kde.org/show_bug.cgi?id=409141
 Let's exclude such test cases from running under the Valgrind until a
 new version with the bug fix is released because checking for the
 memory issues is covered by  other test cases.

Suggested-by: John Snow <jsnow@redhat.com>
Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/039       | 5 +++++
 tests/qemu-iotests/061       | 2 ++
 tests/qemu-iotests/137       | 1 +
 tests/qemu-iotests/common.rc | 8 ++++++++
 4 files changed, 16 insertions(+)

diff --git a/tests/qemu-iotests/039 b/tests/qemu-iotests/039
index 0d4e963..99f39a2 100755
--- a/tests/qemu-iotests/039
+++ b/tests/qemu-iotests/039
@@ -65,6 +65,7 @@ echo "== Creating a dirty image file =="
 IMGOPTS="compat=1.1,lazy_refcounts=on"
 _make_test_img $size
 
+_NO_VALGRIND \
 $QEMU_IO -c "write -P 0x5a 0 512" \
          -c "sigraise $(kill -l KILL)" "$TEST_IMG" 2>&1 \
     | _filter_qemu_io
@@ -100,6 +101,7 @@ echo "== Opening a dirty image read/write should repair it =="
 IMGOPTS="compat=1.1,lazy_refcounts=on"
 _make_test_img $size
 
+_NO_VALGRIND \
 $QEMU_IO -c "write -P 0x5a 0 512" \
          -c "sigraise $(kill -l KILL)" "$TEST_IMG" 2>&1 \
     | _filter_qemu_io
@@ -118,6 +120,7 @@ echo "== Creating an image file with lazy_refcounts=off =="
 IMGOPTS="compat=1.1,lazy_refcounts=off"
 _make_test_img $size
 
+_NO_VALGRIND \
 $QEMU_IO -c "write -P 0x5a 0 512" \
          -c "sigraise $(kill -l KILL)" "$TEST_IMG" 2>&1 \
     | _filter_qemu_io
@@ -151,6 +154,7 @@ echo "== Changing lazy_refcounts setting at runtime =="
 IMGOPTS="compat=1.1,lazy_refcounts=off"
 _make_test_img $size
 
+_NO_VALGRIND \
 $QEMU_IO -c "reopen -o lazy-refcounts=on" \
          -c "write -P 0x5a 0 512" \
          -c "sigraise $(kill -l KILL)" "$TEST_IMG" 2>&1 \
@@ -163,6 +167,7 @@ _check_test_img
 IMGOPTS="compat=1.1,lazy_refcounts=on"
 _make_test_img $size
 
+_NO_VALGRIND \
 $QEMU_IO -c "reopen -o lazy-refcounts=off" \
          -c "write -P 0x5a 0 512" \
          -c "sigraise $(kill -l KILL)" "$TEST_IMG" 2>&1 \
diff --git a/tests/qemu-iotests/061 b/tests/qemu-iotests/061
index d7dbd7e..4eac5b8 100755
--- a/tests/qemu-iotests/061
+++ b/tests/qemu-iotests/061
@@ -73,6 +73,7 @@ echo
 echo "=== Testing dirty version downgrade ==="
 echo
 IMGOPTS="compat=1.1,lazy_refcounts=on" _make_test_img 64M
+_NO_VALGRIND \
 $QEMU_IO -c "write -P 0x2a 0 128k" -c flush \
          -c "sigraise $(kill -l KILL)" "$TEST_IMG" 2>&1 | _filter_qemu_io
 $PYTHON qcow2.py "$TEST_IMG" dump-header
@@ -107,6 +108,7 @@ echo
 echo "=== Testing dirty lazy_refcounts=off ==="
 echo
 IMGOPTS="compat=1.1,lazy_refcounts=on" _make_test_img 64M
+_NO_VALGRIND \
 $QEMU_IO -c "write -P 0x2a 0 128k" -c flush \
          -c "sigraise $(kill -l KILL)" "$TEST_IMG" 2>&1 | _filter_qemu_io
 $PYTHON qcow2.py "$TEST_IMG" dump-header
diff --git a/tests/qemu-iotests/137 b/tests/qemu-iotests/137
index 0c3d2a1..089821d 100755
--- a/tests/qemu-iotests/137
+++ b/tests/qemu-iotests/137
@@ -130,6 +130,7 @@ echo
 
 # Whether lazy-refcounts was actually enabled can easily be tested: Check if
 # the dirty bit is set after a crash
+_NO_VALGRIND \
 $QEMU_IO \
     -c "reopen -o lazy-refcounts=on,overlap-check=blubb" \
     -c "write -P 0x5a 0 512" \
diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index 48f4bc0..be2e84b 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -169,6 +169,14 @@ _qemu_vxhs_wrapper()
     return $RETVAL
 }
 
+# Valgrind bug #409141 https://bugs.kde.org/show_bug.cgi?id=409141
+# Until valgrind 3.16+ is ubiquitous, we must work around a hang in
+# valgrind when issuing sigkill. Disable valgrind for this invocation.
+_NO_VALGRIND()
+{
+    VALGRIND_QEMU="" "$@"
+}
+
 export QEMU=_qemu_wrapper
 export QEMU_IMG=_qemu_img_wrapper
 export QEMU_IO=_qemu_io_wrapper
-- 
1.8.3.1


