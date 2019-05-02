Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8ED115BA
	for <lists+qemu-devel@lfdr.de>; Thu,  2 May 2019 10:50:12 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47713 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hM7Pw-0006yg-3m
	for lists+qemu-devel@lfdr.de; Thu, 02 May 2019 04:50:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50520)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hM7M7-0004TX-Va
	for qemu-devel@nongnu.org; Thu, 02 May 2019 04:46:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hM7M6-0003iz-6d
	for qemu-devel@nongnu.org; Thu, 02 May 2019 04:46:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39724)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hM7Lz-0002ws-H2; Thu, 02 May 2019 04:46:09 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EEDB23D37;
	Thu,  2 May 2019 08:45:22 +0000 (UTC)
Received: from thuth.com (ovpn-116-131.ams2.redhat.com [10.36.116.131])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6043F54FE5;
	Thu,  2 May 2019 08:45:20 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  2 May 2019 10:45:01 +0200
Message-Id: <20190502084506.8009-3-thuth@redhat.com>
In-Reply-To: <20190502084506.8009-1-thuth@redhat.com>
References: <20190502084506.8009-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 02 May 2019 08:45:23 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 2/7] tests/qemu-iotests/check: Pick a
 default machine if necessary
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
	Ed Maste <emaste@freebsd.org>, qemu-block@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Christophe Fergeau <cfergeau@redhat.com>, Max Reitz <mreitz@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu-system-arm, qemu-system-aarch64 and qemu-system-tricore do not have
a default machine, so when running the qemu-iotests with such a binary,
lots of tests are failing. Fix it by picking a default machine in the
"check" script instead.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qemu-iotests/check | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index f9c24b6753..922c5d1d3d 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -130,7 +130,6 @@ export CACHEMODE=3D"writeback"
 export QEMU_IO_OPTIONS=3D""
 export QEMU_IO_OPTIONS_NO_FMT=3D""
 export CACHEMODE_IS_DEFAULT=3Dtrue
-export QEMU_OPTIONS=3D"-nodefaults -machine accel=3Dqtest"
 export VALGRIND_QEMU=3D
 export IMGKEYSECRET=3D
 export IMGOPTSSYNTAX=3Dfalse
@@ -564,6 +563,18 @@ then
 fi
 export QEMU_PROG=3D"$(type -p "$QEMU_PROG")"
=20
+case "$QEMU_PROG" in
+    *qemu-system-arm|*qemu-system-aarch64)
+        export QEMU_OPTIONS=3D"-nodefaults -machine virt,accel=3Dqtest"
+        ;;
+    *qemu-system-tricore)
+        export QEMU_OPTIONS=3D"-nodefaults -machine tricore_testboard,ac=
cel=3Dqtest"
+        ;;
+    *)
+        export QEMU_OPTIONS=3D"-nodefaults -machine accel=3Dqtest"
+        ;;
+esac
+
 if [ -z "$QEMU_IMG_PROG" ]; then
     if [ -x "$build_iotests/qemu-img" ]; then
         export QEMU_IMG_PROG=3D"$build_iotests/qemu-img"
--=20
2.21.0


