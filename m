Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D290D101214
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Nov 2019 04:16:56 +0100 (CET)
Received: from localhost ([::1]:41338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWu0d-0003j9-Q9
	for lists+qemu-devel@lfdr.de; Mon, 18 Nov 2019 22:16:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42856)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iWtsL-0001zX-4m
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 22:08:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iWtsI-0004oc-LQ
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 22:08:20 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:38657
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iWtsI-0004nr-Ge
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 22:08:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574132898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I8iFHdU+8aTHXXAXwkazlFi28rTQEOwc/N1dN5I/DPo=;
 b=VOtyCziyHDA2fV/+qHyZpMetcxlRmEC41vpdfOByzP3k2675xhYjc5JGJzIXUSwkKjbqja
 Vlnqz8cN7vVKYjvX4QnwNnqLu6tLN/ixPrNSXfrFhBOfwQN7kT404aNnv+yo08sHCsm7XQ
 d8Al34bwPi7b668bnd8DqneQawCOKXY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-Z4Nb_6H9PumhF2uTvPR1Tw-1; Mon, 18 Nov 2019 22:08:14 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98D2C477;
 Tue, 19 Nov 2019 03:08:13 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-221.phx2.redhat.com [10.3.116.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3731F60565;
 Tue, 19 Nov 2019 03:08:13 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/10] iotests: Switch nbd tests to use Unix rather than TCP
Date: Mon, 18 Nov 2019 21:07:57 -0600
Message-Id: <20191119030759.24907-9-eblake@redhat.com>
In-Reply-To: <20191119030759.24907-1-eblake@redhat.com>
References: <20191119030759.24907-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: Z4Nb_6H9PumhF2uTvPR1Tw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Up to now, all it took to cause a lot of iotest failures was to have a
background process such as 'nbdkit -p 10810 null' running, because we
hard-coded the TCP port.  Switching to a Unix socket eliminates this
contention.  We still have TCP coverage in test 233, and that test is
more careful to not pick a hard-coded port.

Add a comment explaining where the format layer applies when using
NBD as protocol (until NBD gains support for a resize extension, we
only pipe raw bytes over the wire).

Signed-off-by: Eric Blake <eblake@redhat.com>
Message-Id: <20191114213415.23499-3-eblake@redhat.com>
[eblake: Tweak socket name per Max Reitz' review]
---
 tests/qemu-iotests/common.filter |  6 ++++--
 tests/qemu-iotests/common.rc     | 13 ++++++++-----
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/tests/qemu-iotests/common.filter b/tests/qemu-iotests/common.f=
ilter
index f870e00e4421..5367deea398e 100644
--- a/tests/qemu-iotests/common.filter
+++ b/tests/qemu-iotests/common.filter
@@ -127,7 +127,8 @@ _filter_img_create()
         -e "s#$TEST_DIR#TEST_DIR#g" \
         -e "s#$SOCK_DIR#SOCK_DIR#g" \
         -e "s#$IMGFMT#IMGFMT#g" \
-        -e 's#nbd:127.0.0.1:10810#TEST_DIR/t.IMGFMT#g' \
+        -e 's#nbd:127.0.0.1:[0-9]\\+#TEST_DIR/t.IMGFMT#g' \
+        -e 's#nbd+unix:///\??socket=3DSOCK_DIR/nbd#TEST_DIR/t.IMGFMT#g' \
         -e "s# encryption=3Doff##g" \
         -e "s# cluster_size=3D[0-9]\\+##g" \
         -e "s# table_size=3D[0-9]\\+##g" \
@@ -164,7 +165,8 @@ _filter_img_info()
         -e "s#$TEST_DIR#TEST_DIR#g" \
         -e "s#$SOCK_DIR#SOCK_DIR#g" \
         -e "s#$IMGFMT#IMGFMT#g" \
-        -e 's#nbd://127.0.0.1:10810$#TEST_DIR/t.IMGFMT#g' \
+        -e 's#nbd://127.0.0.1:[0-9]\\+$#TEST_DIR/t.IMGFMT#g' \
+        -e 's#nbd+unix:///\??socket=3DSOCK_DIR/nbd#TEST_DIR/t.IMGFMT#g' \
         -e 's#json.*vdisk-id.*vxhs"}}#TEST_DIR/t.IMGFMT#' \
         -e "/encrypted: yes/d" \
         -e "/cluster_size: [0-9]\\+/d" \
diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index fa7bae24226a..0cc8acc9edd2 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -217,7 +217,7 @@ if [ "$IMGOPTSSYNTAX" =3D "true" ]; then
         TEST_IMG=3D"$DRIVER,file.filename=3D$TEST_DIR/t.$IMGFMT"
     elif [ "$IMGPROTO" =3D "nbd" ]; then
         TEST_IMG_FILE=3D$TEST_DIR/t.$IMGFMT
-        TEST_IMG=3D"$DRIVER,file.driver=3Dnbd,file.host=3D127.0.0.1,file.p=
ort=3D10810"
+        TEST_IMG=3D"$DRIVER,file.driver=3Dnbd,file.type=3Dunix,file.path=
=3D$SOCKDIR/nbd"
     elif [ "$IMGPROTO" =3D "ssh" ]; then
         TEST_IMG_FILE=3D$TEST_DIR/t.$IMGFMT
         TEST_IMG=3D"$DRIVER,file.driver=3Dssh,file.host=3D127.0.0.1,file.p=
ath=3D$TEST_IMG_FILE"
@@ -233,7 +233,7 @@ else
         TEST_IMG=3D$TEST_DIR/t.$IMGFMT
     elif [ "$IMGPROTO" =3D "nbd" ]; then
         TEST_IMG_FILE=3D$TEST_DIR/t.$IMGFMT
-        TEST_IMG=3D"nbd:127.0.0.1:10810"
+        TEST_IMG=3D"nbd+unix:///?socket=3D$SOCK_DIR/nbd"
     elif [ "$IMGPROTO" =3D "ssh" ]; then
         TEST_IMG_FILE=3D$TEST_DIR/t.$IMGFMT
         REMOTE_TEST_DIR=3D"ssh://\\($USER@\\)\\?127.0.0.1\\(:[0-9]\\+\\)\\=
?$TEST_DIR"
@@ -293,7 +293,7 @@ _stop_nbd_server()
         local QEMU_NBD_PID
         read QEMU_NBD_PID < "${QEMU_TEST_DIR}/qemu-nbd.pid"
         kill ${QEMU_NBD_PID}
-        rm -f "${QEMU_TEST_DIR}/qemu-nbd.pid"
+        rm -f "${QEMU_TEST_DIR}/qemu-nbd.pid" "$SOCK_DIR/nbd"
     fi
 }

@@ -349,11 +349,14 @@ _make_test_img()
      fi
     ) | _filter_img_create

-    # Start an NBD server on the image file, which is what we'll be talkin=
g to
+    # Start an NBD server on the image file, which is what we'll be talkin=
g to.
+    # Once NBD gains resize support, we may also want to use -f raw at the
+    # server and interpret format over NBD, but for now, the format is
+    # interpreted at the server and raw data sent over NBD.
     if [ $IMGPROTO =3D "nbd" ]; then
         # Pass a sufficiently high number to -e that should be enough for =
all
         # tests
-        eval "$QEMU_NBD -v -t -b 127.0.0.1 -p 10810 -f $IMGFMT -e 42 -x ''=
 $TEST_IMG_FILE >/dev/null &"
+        eval "$QEMU_NBD -v -t -k '$SOCK_DIR/nbd' -f $IMGFMT -e 42 -x '' $T=
EST_IMG_FILE >/dev/null &"
         sleep 1 # FIXME: qemu-nbd needs to be listening before we continue
     fi

--=20
2.21.0


