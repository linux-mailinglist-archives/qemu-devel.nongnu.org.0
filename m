Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98079142DBB
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 15:37:49 +0100 (CET)
Received: from localhost ([::1]:37696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itYBY-0003Cy-6y
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 09:37:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40247)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1itXvb-0000B1-Fg
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 09:21:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1itXva-00070T-1O
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 09:21:19 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:24387
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1itXvZ-0006yz-TD
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 09:21:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579530077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WcH3RXRGRKFiCBMnnixiIb++0iWQnkZHIkxeSouGeeo=;
 b=gBQsc60DVRMeO7IqFmdmlDZo5rhMWDn25OZNPmHTEvg8WoZmxBZTLP/FE5DkBKN09ezgeC
 anuZO63QVsnbk2vYoEYamC4xJYCSz9/xH/HU7V4jGJYmZYbLSVkqLZJoDyeTyEhEx4OTEJ
 65UbMzHdiO/wxV6Ykq2nRJygFm7JNMQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-QjB18R1iNlqbcTp0e_2cpQ-1; Mon, 20 Jan 2020 09:21:16 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDF261854331;
 Mon, 20 Jan 2020 14:21:14 +0000 (UTC)
Received: from localhost (ovpn-117-223.ams2.redhat.com [10.36.117.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21A3110840F5;
 Mon, 20 Jan 2020 14:21:05 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 14/15] tests/qemu-iotests: enable testing with aio options
Date: Mon, 20 Jan 2020 14:18:57 +0000
Message-Id: <20200120141858.587874-15-stefanha@redhat.com>
In-Reply-To: <20200120141858.587874-1-stefanha@redhat.com>
References: <20200120141858.587874-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: QjB18R1iNlqbcTp0e_2cpQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: oleksandr@redhat.com, Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Julia Suvorova <jusual@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aarushi Mehta <mehta.aaru20@gmail.com>

Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
Acked-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/qemu-iotests/check      | 15 ++++++++++++++-
 tests/qemu-iotests/common.rc  | 14 ++++++++++++++
 tests/qemu-iotests/iotests.py | 12 ++++++++++--
 3 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index 2890785a10..39ed5bc1be 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -137,6 +137,7 @@ sortme=3Dfalse
 expunge=3Dtrue
 have_test_arg=3Dfalse
 cachemode=3Dfalse
+aiomode=3Dfalse
=20
 tmp=3D"${TEST_DIR}"/$$
 rm -f $tmp.list $tmp.tmp $tmp.sed
@@ -146,6 +147,7 @@ export IMGFMT_GENERIC=3Dtrue
 export IMGPROTO=3Dfile
 export IMGOPTS=3D""
 export CACHEMODE=3D"writeback"
+export AIOMODE=3D"threads"
 export QEMU_IO_OPTIONS=3D""
 export QEMU_IO_OPTIONS_NO_FMT=3D""
 export CACHEMODE_IS_DEFAULT=3Dtrue
@@ -230,6 +232,11 @@ s/ .*//p
         CACHEMODE_IS_DEFAULT=3Dfalse
         cachemode=3Dfalse
         continue
+    elif $aiomode
+    then
+        AIOMODE=3D"$r"
+        aiomode=3Dfalse
+        continue
     fi
=20
     xpand=3Dtrue
@@ -274,6 +281,7 @@ other options
     -n                  show me, do not run tests
     -o options          -o options to pass to qemu-img create/convert
     -c mode             cache mode
+    -i mode             AIO mode
     -makecheck          pretty print output for make check
=20
 testlist options
@@ -438,10 +446,13 @@ testlist options
             cachemode=3Dtrue
             xpand=3Dfalse
             ;;
+        -i)
+            aiomode=3Dtrue
+            xpand=3Dfalse
+            ;;
         -T)        # deprecated timestamp option
             xpand=3Dfalse
             ;;
-
         -v)
             verbose=3Dtrue
             xpand=3Dfalse
@@ -520,6 +531,8 @@ done
=20
 # Set qemu-io cache mode with $CACHEMODE we have
 QEMU_IO_OPTIONS=3D"$QEMU_IO_OPTIONS --cache $CACHEMODE"
+# Set qemu-io aio mode with $AIOMODE we have
+QEMU_IO_OPTIONS=3D"$QEMU_IO_OPTIONS --aio $AIOMODE"
=20
 QEMU_IO_OPTIONS_NO_FMT=3D"$QEMU_IO_OPTIONS"
 if [ "$IMGOPTSSYNTAX" !=3D "true" ]; then
diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index d088392ab6..9ccde32634 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -645,6 +645,20 @@ _default_cache_mode()
         return
     fi
 }
+_supported_aio_modes()
+{
+    for mode; do
+        if [ "$mode" =3D "$AIOMODE" ]; then
+            return
+        fi
+    done
+    _notrun "not suitable for aio mode: $AIOMODE"
+}
+_default_aio_mode()
+{
+    AIOMODE=3D"$1"
+    QEMU_IO=3D"$QEMU_IO --aio $1"
+}
=20
 _unsupported_imgopts()
 {
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 13fd8b5cd2..60e9eefe94 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -65,6 +65,7 @@ test_dir =3D os.environ.get('TEST_DIR')
 sock_dir =3D os.environ.get('SOCK_DIR')
 output_dir =3D os.environ.get('OUTPUT_DIR', '.')
 cachemode =3D os.environ.get('CACHEMODE')
+aiomode =3D os.environ.get('AIOMODE')
 qemu_default_machine =3D os.environ.get('QEMU_DEFAULT_MACHINE')
=20
 socket_scm_helper =3D os.environ.get('SOCKET_SCM_HELPER', 'socket_scm_help=
er')
@@ -495,6 +496,7 @@ class VM(qtest.QEMUQtestMachine):
             options.append('file=3D%s' % path)
             options.append('format=3D%s' % format)
             options.append('cache=3D%s' % cachemode)
+            options.append('aio=3D%s' % aiomode)
=20
         if opts:
             options.append(opts)
@@ -933,6 +935,10 @@ def verify_cache_mode(supported_cache_modes=3D[]):
     if supported_cache_modes and (cachemode not in supported_cache_modes):
         notrun('not suitable for this cache mode: %s' % cachemode)
=20
+def verify_aio_mode(supported_aio_modes=3D[]):
+    if supported_aio_modes and (aiomode not in supported_aio_modes):
+        notrun('not suitable for this aio mode: %s' % aiomode)
+
 def supports_quorum():
     return 'quorum' in qemu_img_pipe('--help')
=20
@@ -1019,8 +1025,9 @@ def execute_unittest(output, verbosity, debug):
=20
 def execute_test(test_function=3DNone,
                  supported_fmts=3D[], supported_oses=3D['linux'],
-                 supported_cache_modes=3D[], unsupported_fmts=3D[],
-                 supported_protocols=3D[], unsupported_protocols=3D[]):
+                 supported_cache_modes=3D[], supported_aio_modes=3D{},
+                 unsupported_fmts=3D[], supported_protocols=3D[],
+                 unsupported_protocols=3D[]):
     """Run either unittest or script-style tests."""
=20
     # We are using TEST_DIR and QEMU_DEFAULT_MACHINE as proxies to
@@ -1037,6 +1044,7 @@ def execute_test(test_function=3DNone,
     verify_protocol(supported_protocols, unsupported_protocols)
     verify_platform(supported_oses)
     verify_cache_mode(supported_cache_modes)
+    verify_aio_mode(supported_aio_modes)
=20
     if debug:
         output =3D sys.stdout
--=20
2.24.1


