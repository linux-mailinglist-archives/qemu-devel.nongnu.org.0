Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC5FB5FAA
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Sep 2019 10:56:37 +0200 (CEST)
Received: from localhost ([::1]:56036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAVlM-0005XY-OO
	for lists+qemu-devel@lfdr.de; Wed, 18 Sep 2019 04:56:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51293)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iAVkJ-00052M-S8
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 04:55:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iAVkI-0001IN-Qy
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 04:55:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54898)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1iAVkG-0001C3-01; Wed, 18 Sep 2019 04:55:28 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5399B3086268;
 Wed, 18 Sep 2019 08:55:26 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-230.ams2.redhat.com
 [10.36.116.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86D0D60167;
 Wed, 18 Sep 2019 08:55:22 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Wed, 18 Sep 2019 10:55:19 +0200
Message-Id: <20190918085519.17290-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Wed, 18 Sep 2019 08:55:26 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] iotests: Require Python 3.5 or later
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, jsnow@redhat.com,
 ehabkost@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Running iotests is not required to build QEMU, so we can have stricter
version requirements for Python here and can make use of new features
and drop compatibility code earlier.

This makes qemu-iotests skip all Python tests if a Python version before
3.5 is used for the build.

Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/check | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index 875399d79f..a68f414d6c 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -633,6 +633,13 @@ then
     export SOCKET_SCM_HELPER=3D"$build_iotests/socket_scm_helper"
 fi
=20
+# Note that if the Python conditional here evaluates True we will exit
+# with status 1 which is a shell 'false' value.
+python_usable=3Dfalse
+if ! $PYTHON -c 'import sys; sys.exit(sys.version_info >=3D (3,5))'; the=
n
+    python_usable=3Dtrue
+fi
+
 default_machine=3D$($QEMU_PROG -machine help | sed -n '/(default)/ s/ .*=
//p')
 default_alias_machine=3D$($QEMU_PROG -machine help | \
    sed -n "/(alias of $default_machine)/ { s/ .*//p; q; }")
@@ -809,7 +816,12 @@ do
         start=3D$(_wallclock)
=20
         if [ "$(head -n 1 "$source_iotests/$seq")" =3D=3D "#!/usr/bin/en=
v python" ]; then
-            run_command=3D"$PYTHON $seq"
+            if $python_usable; then
+                run_command=3D"$PYTHON $seq"
+            else
+                run_command=3D"false"
+                echo "Unsupported Python version" > $seq.notrun
+            fi
         else
             run_command=3D"./$seq"
         fi
--=20
2.20.1


