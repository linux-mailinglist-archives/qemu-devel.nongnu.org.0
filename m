Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD47891E5B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 09:54:51 +0200 (CEST)
Received: from localhost ([::1]:45792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzcV8-000083-FE
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 03:54:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35547)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1hzcUK-00084V-IB
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 03:54:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1hzcUJ-0007ja-Fg
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 03:54:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48842)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1hzcUG-0007ek-Gh; Mon, 19 Aug 2019 03:53:56 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2CA3810C051B;
 Mon, 19 Aug 2019 07:53:55 +0000 (UTC)
Received: from thuth.com (ovpn-116-127.ams2.redhat.com [10.36.116.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D90BC11C9A8;
 Mon, 19 Aug 2019 07:53:53 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-block@nongnu.org
Date: Mon, 19 Aug 2019 09:53:48 +0200
Message-Id: <20190819075348.4078-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Mon, 19 Aug 2019 07:53:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] iotests: Check for enabled drivers before
 testing them
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is possible to enable only a subset of the block drivers with the
"--block-drv-rw-whitelist" option of the "configure" script. All other
drivers are marked as unusable (or only included as read-only with the
"--block-drv-ro-whitelist" option). If an iotest is now using such a
disabled block driver, it is failing - which is bad, since at least the
tests in the "auto" group should be able to deal with this situation.
Thus let's introduce a "_require_drivers" function that can be used by
the shell tests to check for the availability of certain drivers first,
and marks the test as "not run" if one of the drivers is missing.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qemu-iotests/071       |  1 +
 tests/qemu-iotests/081       |  1 +
 tests/qemu-iotests/099       |  1 +
 tests/qemu-iotests/184       |  1 +
 tests/qemu-iotests/common.rc | 13 +++++++++++++
 5 files changed, 17 insertions(+)

diff --git a/tests/qemu-iotests/071 b/tests/qemu-iotests/071
index 1cca9233d0..fab526666b 100755
--- a/tests/qemu-iotests/071
+++ b/tests/qemu-iotests/071
@@ -38,6 +38,7 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 
 _supported_fmt qcow2
 _supported_proto file
+_require_drivers blkdebug blkverify
 
 do_run_qemu()
 {
diff --git a/tests/qemu-iotests/081 b/tests/qemu-iotests/081
index c418bab093..1695781bc0 100755
--- a/tests/qemu-iotests/081
+++ b/tests/qemu-iotests/081
@@ -41,6 +41,7 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt raw
 _supported_proto file
 _supported_os Linux
+_require_drivers quorum
 
 do_run_qemu()
 {
diff --git a/tests/qemu-iotests/099 b/tests/qemu-iotests/099
index ae02f27afe..c3cf66798a 100755
--- a/tests/qemu-iotests/099
+++ b/tests/qemu-iotests/099
@@ -42,6 +42,7 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow qcow2 qed vdi vhdx vmdk vpc
 _supported_proto file
 _supported_os Linux
+_require_drivers blkdebug blkverify
 _unsupported_imgopts "subformat=monolithicFlat" "subformat=twoGbMaxExtentFlat" \
     "subformat=twoGbMaxExtentSparse"
 
diff --git a/tests/qemu-iotests/184 b/tests/qemu-iotests/184
index cb0c181228..33dd8d2a4f 100755
--- a/tests/qemu-iotests/184
+++ b/tests/qemu-iotests/184
@@ -33,6 +33,7 @@ trap "exit \$status" 0 1 2 3 15
 . ./common.filter
 
 _supported_os Linux
+_require_drivers throttle
 
 do_run_qemu()
 {
diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index 5502c3da2f..7d4e68846f 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -520,5 +520,18 @@ _require_command()
     [ -x "$c" ] || _notrun "$1 utility required, skipped this test"
 }
 
+# Check that a set of drivers has been whitelisted in the QEMU binary
+#
+_require_drivers()
+{
+    available=$($QEMU -drive format=help | grep 'Supported formats:')
+    for driver
+    do
+        if ! echo "$available" | grep -q "$driver"; then
+            _notrun "$driver not available"
+        fi
+    done
+}
+
 # make sure this script returns success
 true
-- 
2.18.1


