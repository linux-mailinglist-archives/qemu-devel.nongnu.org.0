Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D49EA3AB30
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jun 2019 20:44:03 +0200 (CEST)
Received: from localhost ([::1]:37464 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ha2nS-0002Uv-S8
	for lists+qemu-devel@lfdr.de; Sun, 09 Jun 2019 14:44:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49282)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1ha2fc-0004Rq-My
 for qemu-devel@nongnu.org; Sun, 09 Jun 2019 14:35:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1ha2fb-00065O-3j
 for qemu-devel@nongnu.org; Sun, 09 Jun 2019 14:35:56 -0400
Received: from relay.sw.ru ([185.231.240.75]:47580)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1ha2fa-00062X-QP; Sun, 09 Jun 2019 14:35:54 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.91)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1ha2fV-00087U-Mn; Sun, 09 Jun 2019 21:35:49 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Sun,  9 Jun 2019 21:35:42 +0300
Message-Id: <1560105348-459129-2-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1560105348-459129-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1560105348-459129-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH 1/7] iotests: allow Valgrind checking all QEMU
 processes
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

With the '-valgrind' option, let all the QEMU processes be run under
the Valgrind tool. The Valgrind own parameters may be set with its
environment variable VALGRIND_OPTS, e.g.
VALGRIND_OPTS="--leak-check=yes" ./check -qcow2 -valgrind <test#>

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 tests/qemu-iotests/common.rc | 65 ++++++++++++++++++++++++++++++++------------
 1 file changed, 48 insertions(+), 17 deletions(-)

diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index 93f8738..3caaca4 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -60,19 +60,52 @@ if ! . ./common.config
     exit 1
 fi
 
+_qemu_proc_wrapper()
+{
+    local VALGRIND_LOGFILE="$1"
+    shift
+    if [ "${VALGRIND_QEMU}" == "y" ]; then
+        exec valgrind --log-file="${VALGRIND_LOGFILE}" --error-exitcode=99 "$@"
+    else
+        exec "$@"
+    fi
+}
+
+_qemu_proc_valgrind_log()
+{
+    local VALGRIND_LOGFILE="$1"
+    local RETVAL="$2"
+    if [ "${VALGRIND_QEMU}" == "y" ]; then
+        if [ $RETVAL == 99 ]; then
+            cat "${VALGRIND_LOGFILE}"
+        fi
+        rm -f "${VALGRIND_LOGFILE}"
+    fi
+}
+
 _qemu_wrapper()
 {
+    local VALGRIND_LOGFILE="${TEST_DIR}"/$$.valgrind
     (
         if [ -n "${QEMU_NEED_PID}" ]; then
             echo $BASHPID > "${QEMU_TEST_DIR}/qemu-${_QEMU_HANDLE}.pid"
         fi
-        exec "$QEMU_PROG" $QEMU_OPTIONS "$@"
+        _qemu_proc_wrapper "${VALGRIND_LOGFILE}" "$QEMU_PROG" $QEMU_OPTIONS "$@"
     )
+    RETVAL=$?
+    _qemu_proc_valgrind_log "${VALGRIND_LOGFILE}" $RETVAL
+    return $RETVAL
 }
 
 _qemu_img_wrapper()
 {
-    (exec "$QEMU_IMG_PROG" $QEMU_IMG_OPTIONS "$@")
+    local VALGRIND_LOGFILE="${TEST_DIR}"/$$.valgrind
+    (
+        _qemu_proc_wrapper "${VALGRIND_LOGFILE}" "$QEMU_IMG_PROG" $QEMU_IMG_OPTIONS "$@"
+    )
+    RETVAL=$?
+    _qemu_proc_valgrind_log "${VALGRIND_LOGFILE}" $RETVAL
+    return $RETVAL
 }
 
 _qemu_io_wrapper()
@@ -85,38 +118,36 @@ _qemu_io_wrapper()
             QEMU_IO_ARGS="--object secret,id=keysec0,data=$IMGKEYSECRET $QEMU_IO_ARGS"
         fi
     fi
-    local RETVAL
     (
-        if [ "${VALGRIND_QEMU}" == "y" ]; then
-            exec valgrind --log-file="${VALGRIND_LOGFILE}" --error-exitcode=99 "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@"
-        else
-            exec "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@"
-        fi
+        _qemu_proc_wrapper "${VALGRIND_LOGFILE}" "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@"
     )
     RETVAL=$?
-    if [ "${VALGRIND_QEMU}" == "y" ]; then
-        if [ $RETVAL == 99 ]; then
-            cat "${VALGRIND_LOGFILE}"
-        fi
-        rm -f "${VALGRIND_LOGFILE}"
-    fi
-    (exit $RETVAL)
+    _qemu_proc_valgrind_log "${VALGRIND_LOGFILE}" $RETVAL
+    return $RETVAL
 }
 
 _qemu_nbd_wrapper()
 {
+    local VALGRIND_LOGFILE="${TEST_DIR}"/$$.valgrind
     (
         echo $BASHPID > "${QEMU_TEST_DIR}/qemu-nbd.pid"
-        exec "$QEMU_NBD_PROG" $QEMU_NBD_OPTIONS "$@"
+        _qemu_proc_wrapper "${VALGRIND_LOGFILE}" "$QEMU_NBD_PROG" $QEMU_NBD_OPTIONS "$@"
     )
+    RETVAL=$?
+    _qemu_proc_valgrind_log "${VALGRIND_LOGFILE}" $RETVAL
+    return $RETVAL
 }
 
 _qemu_vxhs_wrapper()
 {
+    local VALGRIND_LOGFILE="${TEST_DIR}"/$$.valgrind
     (
         echo $BASHPID > "${TEST_DIR}/qemu-vxhs.pid"
-        exec "$QEMU_VXHS_PROG" $QEMU_VXHS_OPTIONS "$@"
+        _qemu_proc_wrapper "${VALGRIND_LOGFILE}" "$QEMU_VXHS_PROG" $QEMU_VXHS_OPTIONS "$@"
     )
+    RETVAL=$?
+    _qemu_proc_valgrind_log "${VALGRIND_LOGFILE}" $RETVAL
+    return $RETVAL
 }
 
 export QEMU=_qemu_wrapper
-- 
1.8.3.1


