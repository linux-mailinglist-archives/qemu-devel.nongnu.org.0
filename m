Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C16DD24D62
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 12:59:39 +0200 (CEST)
Received: from localhost ([127.0.0.1]:51360 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hT2Uc-00041h-Tw
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 06:59:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56925)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hT2PU-0000F5-2h
	for qemu-devel@nongnu.org; Tue, 21 May 2019 06:54:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hT2PR-0004s0-8Q
	for qemu-devel@nongnu.org; Tue, 21 May 2019 06:54:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57434)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>) id 1hT2PR-0004qx-3O
	for qemu-devel@nongnu.org; Tue, 21 May 2019 06:54:17 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F40EE7FDEE;
	Tue, 21 May 2019 10:54:11 +0000 (UTC)
Received: from thuth.com (ovpn-116-22.ams2.redhat.com [10.36.116.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C298D6085B;
	Tue, 21 May 2019 10:54:10 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Tue, 21 May 2019 12:53:40 +0200
Message-Id: <20190521105344.11637-10-thuth@redhat.com>
In-Reply-To: <20190521105344.11637-1-thuth@redhat.com>
References: <20190521105344.11637-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 21 May 2019 10:54:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 09/13] tests/qemu-iotests/005: Add a sanity
 check for large sparse file support
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
Cc: kwolf@redhat.com, lvivier@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"check -raw 005" fails when running on certain filesystems - these do not
support such large sparse files. Use the same check as in test 220 to
skip the test in this case.

Suggested-by: Eric Blake <eblake@redhat.com>
Message-Id: <20190502084506.8009-2-thuth@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qemu-iotests/005 | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/qemu-iotests/005 b/tests/qemu-iotests/005
index 2fef63af88..9c7681c19b 100755
--- a/tests/qemu-iotests/005
+++ b/tests/qemu-iotests/005
@@ -55,6 +55,15 @@ if [ "$IMGPROTO" =3D "sheepdog" ]; then
     _notrun "image protocol $IMGPROTO does not support large image sizes=
"
 fi
=20
+# Sanity check: For raw, we require a file system that permits the creat=
ion
+# of a HUGE (but very sparse) file. Check we can create it before contin=
uing.
+if [ "$IMGFMT" =3D "raw" ]; then
+    if ! truncate --size=3D5T "$TEST_IMG"; then
+        _notrun "file system on $TEST_DIR does not support large enough =
files"
+    fi
+    rm "$TEST_IMG"
+fi
+
 echo
 echo "creating large image"
 _make_test_img 5000G
--=20
2.21.0


