Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3EA181A4
	for <lists+qemu-devel@lfdr.de>; Wed,  8 May 2019 23:24:46 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43947 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOU3R-0001PL-FP
	for lists+qemu-devel@lfdr.de; Wed, 08 May 2019 17:24:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56646)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hOTxm-0004tC-Cf
	for qemu-devel@nongnu.org; Wed, 08 May 2019 17:18:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hOTxi-0005uO-KU
	for qemu-devel@nongnu.org; Wed, 08 May 2019 17:18:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33504)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mreitz@redhat.com>)
	id 1hOTxT-0005p3-FI; Wed, 08 May 2019 17:18:36 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C7C8189AC4;
	Wed,  8 May 2019 21:18:34 +0000 (UTC)
Received: from localhost (ovpn-204-96.brq.redhat.com [10.40.204.96])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F3D119729;
	Wed,  8 May 2019 21:18:34 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Wed,  8 May 2019 23:18:20 +0200
Message-Id: <20190508211820.17851-6-mreitz@redhat.com>
In-Reply-To: <20190508211820.17851-1-mreitz@redhat.com>
References: <20190508211820.17851-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 08 May 2019 21:18:34 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 5/5] iotests: Let 233 run concurrently
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
	Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

common.nbd's nbd_server_set_tcp_port() tries to find a free port, and
then uses it for the whole test run.  However, this is racy because even
if the port was free at the beginning, there is no guarantee it will
continue to be available.  Therefore, 233 currently cannot reliably be
run concurrently with other NBD TCP tests.

This patch addresses the problem by dropping nbd_server_set_tcp_port(),
and instead finding a new port every time nbd_server_start_tcp_socket()
is invoked.  For this, we run qemu-nbd with --fork and on error evaluate
the output to see whether it contains "Address already in use".  If so,
we try the next port.

On success, we still want to continually redirect the output from
qemu-nbd to stderr.  To achieve both, we redirect qemu-nbd's stderr to a
FIFO that we then open in bash.  If the parent process exits with status
0 (which means that the server has started successfully), we launch a
background cat process that copies the FIFO to stderr.  On failure, we
read the whole content into a variable and then evaluate it.

While at it, use --fork in nbd_server_start_unix_socket(), too.  Doing
so allows us to drop nbd_server_wait_for_*_socket().

Note that the reason common.nbd did not use --fork before is that
qemu-nbd did not have --pid-file.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/233        |  1 -
 tests/qemu-iotests/common.nbd | 94 ++++++++++++++++-------------------
 2 files changed, 42 insertions(+), 53 deletions(-)

diff --git a/tests/qemu-iotests/233 b/tests/qemu-iotests/233
index b8b6c8cc4c..8682ea277c 100755
--- a/tests/qemu-iotests/233
+++ b/tests/qemu-iotests/233
@@ -50,7 +50,6 @@ _supported_proto file
 _supported_os Linux
 _require_command QEMU_NBD
=20
-nbd_server_set_tcp_port
 tls_x509_init
=20
 echo
diff --git a/tests/qemu-iotests/common.nbd b/tests/qemu-iotests/common.nb=
d
index 25fc9ffaa4..24b01b60aa 100644
--- a/tests/qemu-iotests/common.nbd
+++ b/tests/qemu-iotests/common.nbd
@@ -22,6 +22,11 @@
 nbd_unix_socket=3D"${TEST_DIR}/qemu-nbd.sock"
 nbd_tcp_addr=3D"127.0.0.1"
 nbd_pid_file=3D"${TEST_DIR}/qemu-nbd.pid"
+nbd_stderr_fifo=3D"${TEST_DIR}/qemu-nbd.fifo"
+
+# If bash version is >=3D 4.1, this will be overwritten by a dynamically
+# assigned file descriptor value.
+nbd_fifo_fd=3D10
=20
 nbd_server_stop()
 {
@@ -33,77 +38,62 @@ nbd_server_stop()
             kill "$NBD_PID"
         fi
     fi
-    rm -f "$nbd_unix_socket"
-}
-
-nbd_server_wait_for_unix_socket()
-{
-    pid=3D$1
-
-    for ((i =3D 0; i < 300; i++))
-    do
-        if [ -r "$nbd_unix_socket" ]; then
-            return
-        fi
-        kill -s 0 $pid 2>/dev/null
-        if test $? !=3D 0
-        then
-            echo "qemu-nbd unexpectedly quit"
-            exit 1
-        fi
-        sleep 0.1
-    done
-    echo "Failed in check of unix socket created by qemu-nbd"
-    exit 1
+    rm -f "$nbd_unix_socket" "$nbd_stderr_fifo"
 }
=20
 nbd_server_start_unix_socket()
 {
     nbd_server_stop
-    $QEMU_NBD -v -t -k "$nbd_unix_socket" "$@" &
-    nbd_server_wait_for_unix_socket $!
+    $QEMU_NBD -v -t -k "$nbd_unix_socket" --fork "$@"
 }
=20
-nbd_server_set_tcp_port()
+nbd_server_start_tcp_socket()
 {
-    (ss --help) >/dev/null 2>&1 || _notrun "ss utility not found, skippi=
ng test"
+    nbd_server_stop
=20
+    mkfifo "$nbd_stderr_fifo"
     for ((port =3D 10809; port <=3D 10909; port++))
     do
-        if ! ss -tln | grep -sqE ":$port\b"; then
+        # Redirect stderr to FIFO, so we can later decide whether we
+        # want to read it or to redirect it to our stderr, depending
+        # on whether the command fails or not
+        $QEMU_NBD -v -t -b $nbd_tcp_addr -p $port --fork "$@" \
+            2> "$nbd_stderr_fifo" &
+
+        # Taken from common.qemu
+        if [[ "${BASH_VERSINFO[0]}" -ge "5" ||
+            ("${BASH_VERSINFO[0]}" -ge "4" && "${BASH_VERSINFO[1]}" -ge =
"1") ]]
+        then
+            exec {nbd_fifo_fd}<"$nbd_stderr_fifo"
+        else
+            let _nbd_fifo_fd++
+            eval "exec ${_nbd_fifo_fd}<'$nbd_stderr_fifo'"
+        fi
+        wait $!
+
+        if test $? =3D=3D 0
+        then
+            # Success, redirect qemu-nbd's stderr to our stderr
             nbd_tcp_port=3D$port
+            (cat <&$nbd_fifo_fd >&2) &
+            eval "exec $nbd_fifo_fd>&-"
             return
         fi
-    done
=20
-    echo "Cannot find free TCP port for nbd in range 10809-10909"
-    exit 1
-}
-
-nbd_server_wait_for_tcp_socket()
-{
-    pid=3D$1
+        # Failure, read the output
+        output=3D$(cat <&$nbd_fifo_fd)
+        eval "exec $nbd_fifo_fd>&-"
=20
-    for ((i =3D 0; i < 300; i++))
-    do
-        if ss -tln | grep -sqE ":$nbd_tcp_port\b"; then
-            return
-        fi
-        kill -s 0 $pid 2>/dev/null
-        if test $? !=3D 0
+        if ! echo "$output" | grep -q "Address already in use"
         then
-            echo "qemu-nbd unexpectedly quit"
+            # Unknown error, print it
+            echo "$output" >&2
+            rm -f "$nbd_stderr_fifo"
             exit 1
         fi
-        sleep 0.1
     done
-    echo "Failed in check of TCP socket created by qemu-nbd"
-    exit 1
-}
=20
-nbd_server_start_tcp_socket()
-{
-    nbd_server_stop
-    $QEMU_NBD -v -t -b $nbd_tcp_addr -p $nbd_tcp_port "$@" &
-    nbd_server_wait_for_tcp_socket $!
+    echo "Cannot find free TCP port for nbd in range 10809-10909"
+    rm -f "$nbd_stderr_fifo"
+    exit 1
 }
--=20
2.21.0


