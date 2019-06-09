Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A23B03AB38
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jun 2019 20:48:19 +0200 (CEST)
Received: from localhost ([::1]:37492 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ha2ra-0004qx-NQ
	for lists+qemu-devel@lfdr.de; Sun, 09 Jun 2019 14:48:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49283)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1ha2fc-0004Rr-No
 for qemu-devel@nongnu.org; Sun, 09 Jun 2019 14:35:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1ha2fa-00064L-MY
 for qemu-devel@nongnu.org; Sun, 09 Jun 2019 14:35:56 -0400
Received: from relay.sw.ru ([185.231.240.75]:47568)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1ha2fa-00062V-D2; Sun, 09 Jun 2019 14:35:54 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.91)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1ha2fW-00087U-BY; Sun, 09 Jun 2019 21:35:50 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Sun,  9 Jun 2019 21:35:44 +0300
Message-Id: <1560105348-459129-4-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1560105348-459129-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1560105348-459129-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH 3/7] iotests: exclude killed processes from
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
 rkagan@virtuozzo.com, andrey.shinkevich@virtuozzo.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Valgrind tool fails to manage its termination when QEMU raises the
signal SIGKILL. Lets exclude such test cases from running under the
Valgrind because there is no sense to check memory issues that way.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 tests/qemu-iotests/039 | 5 +++++
 tests/qemu-iotests/061 | 2 ++
 tests/qemu-iotests/137 | 1 +
 3 files changed, 8 insertions(+)

diff --git a/tests/qemu-iotests/039 b/tests/qemu-iotests/039
index 0d4e963..95115e2 100755
--- a/tests/qemu-iotests/039
+++ b/tests/qemu-iotests/039
@@ -65,6 +65,7 @@ echo "== Creating a dirty image file =="
 IMGOPTS="compat=1.1,lazy_refcounts=on"
 _make_test_img $size
 
+VALGRIND_QEMU="" \
 $QEMU_IO -c "write -P 0x5a 0 512" \
          -c "sigraise $(kill -l KILL)" "$TEST_IMG" 2>&1 \
     | _filter_qemu_io
@@ -100,6 +101,7 @@ echo "== Opening a dirty image read/write should repair it =="
 IMGOPTS="compat=1.1,lazy_refcounts=on"
 _make_test_img $size
 
+VALGRIND_QEMU="" \
 $QEMU_IO -c "write -P 0x5a 0 512" \
          -c "sigraise $(kill -l KILL)" "$TEST_IMG" 2>&1 \
     | _filter_qemu_io
@@ -118,6 +120,7 @@ echo "== Creating an image file with lazy_refcounts=off =="
 IMGOPTS="compat=1.1,lazy_refcounts=off"
 _make_test_img $size
 
+VALGRIND_QEMU="" \
 $QEMU_IO -c "write -P 0x5a 0 512" \
          -c "sigraise $(kill -l KILL)" "$TEST_IMG" 2>&1 \
     | _filter_qemu_io
@@ -151,6 +154,7 @@ echo "== Changing lazy_refcounts setting at runtime =="
 IMGOPTS="compat=1.1,lazy_refcounts=off"
 _make_test_img $size
 
+VALGRIND_QEMU="" \
 $QEMU_IO -c "reopen -o lazy-refcounts=on" \
          -c "write -P 0x5a 0 512" \
          -c "sigraise $(kill -l KILL)" "$TEST_IMG" 2>&1 \
@@ -163,6 +167,7 @@ _check_test_img
 IMGOPTS="compat=1.1,lazy_refcounts=on"
 _make_test_img $size
 
+VALGRIND_QEMU="" \
 $QEMU_IO -c "reopen -o lazy-refcounts=off" \
          -c "write -P 0x5a 0 512" \
          -c "sigraise $(kill -l KILL)" "$TEST_IMG" 2>&1 \
diff --git a/tests/qemu-iotests/061 b/tests/qemu-iotests/061
index d7dbd7e..5d0724c 100755
--- a/tests/qemu-iotests/061
+++ b/tests/qemu-iotests/061
@@ -73,6 +73,7 @@ echo
 echo "=== Testing dirty version downgrade ==="
 echo
 IMGOPTS="compat=1.1,lazy_refcounts=on" _make_test_img 64M
+VALGRIND_QEMU="" \
 $QEMU_IO -c "write -P 0x2a 0 128k" -c flush \
          -c "sigraise $(kill -l KILL)" "$TEST_IMG" 2>&1 | _filter_qemu_io
 $PYTHON qcow2.py "$TEST_IMG" dump-header
@@ -107,6 +108,7 @@ echo
 echo "=== Testing dirty lazy_refcounts=off ==="
 echo
 IMGOPTS="compat=1.1,lazy_refcounts=on" _make_test_img 64M
+VALGRIND_QEMU="" \
 $QEMU_IO -c "write -P 0x2a 0 128k" -c flush \
          -c "sigraise $(kill -l KILL)" "$TEST_IMG" 2>&1 | _filter_qemu_io
 $PYTHON qcow2.py "$TEST_IMG" dump-header
diff --git a/tests/qemu-iotests/137 b/tests/qemu-iotests/137
index 0c3d2a1..a442fc8 100755
--- a/tests/qemu-iotests/137
+++ b/tests/qemu-iotests/137
@@ -130,6 +130,7 @@ echo
 
 # Whether lazy-refcounts was actually enabled can easily be tested: Check if
 # the dirty bit is set after a crash
+VALGRIND_QEMU="" \
 $QEMU_IO \
     -c "reopen -o lazy-refcounts=on,overlap-check=blubb" \
     -c "write -P 0x5a 0 512" \
-- 
1.8.3.1


