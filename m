Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD523D548
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jun 2019 20:12:53 +0200 (CEST)
Received: from localhost ([::1]:33606 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1halGO-0006Pb-Ua
	for lists+qemu-devel@lfdr.de; Tue, 11 Jun 2019 14:12:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42284)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1hal6K-00067w-N9
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 14:02:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1hal6I-0005Sg-PU
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 14:02:28 -0400
Received: from relay.sw.ru ([185.231.240.75]:34320)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1hal6C-0005Ix-HY; Tue, 11 Jun 2019 14:02:22 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1hal67-0002AB-6k; Tue, 11 Jun 2019 21:02:15 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Tue, 11 Jun 2019 21:02:11 +0300
Message-Id: <1560276131-683243-8-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1560276131-683243-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1560276131-683243-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v2 7/7] iotests: new file to suppress Valgrind
 errors
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berrange@redhat.com,
 mreitz@redhat.com, rkagan@virtuozzo.com, andrey.shinkevich@virtuozzo.com,
 den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Valgrind tool reports about an uninitialised memory usage when the
initialization is actually not needed. For example, the buffer 'buf'
instantiated on a stack of the function guess_disk_lchs().
Let's use the Valgrind technology to suppress the unwanted reports by
adding the Valgrind specific format file valgrind.supp to the QEMU
project. The file content is extendable for future needs.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 tests/qemu-iotests/common.rc     |  5 ++++-
 tests/qemu-iotests/valgrind.supp | 31 +++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 tests/qemu-iotests/valgrind.supp

diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index 3caaca4..9b74890 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -17,6 +17,8 @@
 # along with this program.  If not, see <http://www.gnu.org/licenses/>.
 #
 
+readonly VALGRIND_SUPPRESS_ERRORS=./valgrind.supp
+
 SED=
 for sed in sed gsed; do
     ($sed --version | grep 'GNU sed') > /dev/null 2>&1
@@ -65,7 +67,8 @@ _qemu_proc_wrapper()
     local VALGRIND_LOGFILE="$1"
     shift
     if [ "${VALGRIND_QEMU}" == "y" ]; then
-        exec valgrind --log-file="${VALGRIND_LOGFILE}" --error-exitcode=99 "$@"
+        exec valgrind --log-file="${VALGRIND_LOGFILE}" --error-exitcode=99 \
+            --suppressions="${VALGRIND_SUPPRESS_ERRORS}" "$@"
     else
         exec "$@"
     fi
diff --git a/tests/qemu-iotests/valgrind.supp b/tests/qemu-iotests/valgrind.supp
new file mode 100644
index 0000000..78215b6
--- /dev/null
+++ b/tests/qemu-iotests/valgrind.supp
@@ -0,0 +1,31 @@
+#
+# Valgrind errors suppression file for QEMU iotests
+#
+# Copyright (c) 2019 Virtuozzo International GmbH
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+#
+{
+   hw/block/hd-geometry.c
+   Memcheck:Cond
+   fun:guess_disk_lchs
+   fun:hd_geometry_guess
+   fun:blkconf_geometry
+   ...
+   fun:device_set_realized
+   fun:property_set_bool
+   fun:object_property_set
+   fun:object_property_set_qobject
+   fun:object_property_set_bool
+}
-- 
1.8.3.1


