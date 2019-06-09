Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B59B73AB28
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jun 2019 20:38:50 +0200 (CEST)
Received: from localhost ([::1]:37424 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ha2iP-0005uz-Mm
	for lists+qemu-devel@lfdr.de; Sun, 09 Jun 2019 14:38:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49295)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1ha2fd-0004Ru-2v
 for qemu-devel@nongnu.org; Sun, 09 Jun 2019 14:35:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1ha2fa-00064R-MO
 for qemu-devel@nongnu.org; Sun, 09 Jun 2019 14:35:56 -0400
Received: from relay.sw.ru ([185.231.240.75]:47584)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1ha2fa-00062Y-D3; Sun, 09 Jun 2019 14:35:54 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.91)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1ha2fW-00087U-1J; Sun, 09 Jun 2019 21:35:50 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Sun,  9 Jun 2019 21:35:43 +0300
Message-Id: <1560105348-459129-3-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1560105348-459129-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1560105348-459129-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH 2/7] iotests: amendment for benchmark output of
 039 061 137
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

After including the Valgrind into the QEMU processes wrappers in the
common.rc script, the output for the tests 039 061 137 has been
changed and is to be amended.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 tests/qemu-iotests/039.out | 30 +++++-------------------------
 tests/qemu-iotests/061.out | 12 ++----------
 tests/qemu-iotests/137.out |  6 +-----
 3 files changed, 8 insertions(+), 40 deletions(-)

diff --git a/tests/qemu-iotests/039.out b/tests/qemu-iotests/039.out
index 724d7b2..972c6c0 100644
--- a/tests/qemu-iotests/039.out
+++ b/tests/qemu-iotests/039.out
@@ -11,11 +11,7 @@ No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728
 wrote 512/512 bytes at offset 0
 512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-./common.rc: Killed                  ( if [ "${VALGRIND_QEMU}" == "y" ]; then
-    exec valgrind --log-file="${VALGRIND_LOGFILE}" --error-exitcode=99 "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@";
-else
-    exec "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@";
-fi )
+./common.rc: Killed                  ( _qemu_proc_wrapper "${VALGRIND_LOGFILE}" "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@" )
 incompatible_features     0x1
 ERROR cluster 5 refcount=0 reference=1
 ERROR OFLAG_COPIED data cluster: l2_entry=8000000000050000 refcount=0
@@ -50,11 +46,7 @@ read 512/512 bytes at offset 0
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728
 wrote 512/512 bytes at offset 0
 512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-./common.rc: Killed                  ( if [ "${VALGRIND_QEMU}" == "y" ]; then
-    exec valgrind --log-file="${VALGRIND_LOGFILE}" --error-exitcode=99 "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@";
-else
-    exec "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@";
-fi )
+./common.rc: Killed                  ( _qemu_proc_wrapper "${VALGRIND_LOGFILE}" "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@" )
 incompatible_features     0x1
 ERROR cluster 5 refcount=0 reference=1
 Rebuilding refcount structure
@@ -68,11 +60,7 @@ incompatible_features     0x0
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728
 wrote 512/512 bytes at offset 0
 512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-./common.rc: Killed                  ( if [ "${VALGRIND_QEMU}" == "y" ]; then
-    exec valgrind --log-file="${VALGRIND_LOGFILE}" --error-exitcode=99 "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@";
-else
-    exec "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@";
-fi )
+./common.rc: Killed                  ( _qemu_proc_wrapper "${VALGRIND_LOGFILE}" "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@" )
 incompatible_features     0x0
 No errors were found on the image.
 
@@ -91,11 +79,7 @@ No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728
 wrote 512/512 bytes at offset 0
 512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-./common.rc: Killed                  ( if [ "${VALGRIND_QEMU}" == "y" ]; then
-    exec valgrind --log-file="${VALGRIND_LOGFILE}" --error-exitcode=99 "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@";
-else
-    exec "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@";
-fi )
+./common.rc: Killed                  ( _qemu_proc_wrapper "${VALGRIND_LOGFILE}" "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@" )
 incompatible_features     0x1
 ERROR cluster 5 refcount=0 reference=1
 ERROR OFLAG_COPIED data cluster: l2_entry=8000000000050000 refcount=0
@@ -105,11 +89,7 @@ Data may be corrupted, or further writes to the image may corrupt it.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728
 wrote 512/512 bytes at offset 0
 512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-./common.rc: Killed                  ( if [ "${VALGRIND_QEMU}" == "y" ]; then
-    exec valgrind --log-file="${VALGRIND_LOGFILE}" --error-exitcode=99 "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@";
-else
-    exec "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@";
-fi )
+./common.rc: Killed                  ( _qemu_proc_wrapper "${VALGRIND_LOGFILE}" "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@" )
 incompatible_features     0x0
 No errors were found on the image.
 *** done
diff --git a/tests/qemu-iotests/061.out b/tests/qemu-iotests/061.out
index 1aa7d37..8cb57eb 100644
--- a/tests/qemu-iotests/061.out
+++ b/tests/qemu-iotests/061.out
@@ -118,11 +118,7 @@ No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
 wrote 131072/131072 bytes at offset 0
 128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-./common.rc: Killed                  ( if [ "${VALGRIND_QEMU}" == "y" ]; then
-    exec valgrind --log-file="${VALGRIND_LOGFILE}" --error-exitcode=99 "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@";
-else
-    exec "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@";
-fi )
+./common.rc: Killed                  ( _qemu_proc_wrapper "${VALGRIND_LOGFILE}" "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@" )
 magic                     0x514649fb
 version                   3
 backing_file_offset       0x0
@@ -280,11 +276,7 @@ No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
 wrote 131072/131072 bytes at offset 0
 128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-./common.rc: Killed                  ( if [ "${VALGRIND_QEMU}" == "y" ]; then
-    exec valgrind --log-file="${VALGRIND_LOGFILE}" --error-exitcode=99 "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@";
-else
-    exec "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@";
-fi )
+./common.rc: Killed                  ( _qemu_proc_wrapper "${VALGRIND_LOGFILE}" "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@" )
 magic                     0x514649fb
 version                   3
 backing_file_offset       0x0
diff --git a/tests/qemu-iotests/137.out b/tests/qemu-iotests/137.out
index 22d59df..7fed5e6 100644
--- a/tests/qemu-iotests/137.out
+++ b/tests/qemu-iotests/137.out
@@ -35,11 +35,7 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
 qemu-io: Unsupported value 'blubb' for qcow2 option 'overlap-check'. Allowed are any of the following: none, constant, cached, all
 wrote 512/512 bytes at offset 0
 512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-./common.rc: Killed                  ( if [ "${VALGRIND_QEMU}" == "y" ]; then
-    exec valgrind --log-file="${VALGRIND_LOGFILE}" --error-exitcode=99 "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@";
-else
-    exec "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@";
-fi )
+./common.rc: Killed                  ( _qemu_proc_wrapper "${VALGRIND_LOGFILE}" "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@" )
 incompatible_features     0x0
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
 wrote 65536/65536 bytes at offset 0
-- 
1.8.3.1


