Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3F8B632
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Apr 2019 17:57:48 +0200 (CEST)
Received: from localhost ([127.0.0.1]:45708 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hKmBX-0000lP-CF
	for lists+qemu-devel@lfdr.de; Sun, 28 Apr 2019 11:57:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52398)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hKm94-0007h5-N4
	for qemu-devel@nongnu.org; Sun, 28 Apr 2019 11:55:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hKm93-0004rj-MF
	for qemu-devel@nongnu.org; Sun, 28 Apr 2019 11:55:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52146)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hKm91-0004qC-JU; Sun, 28 Apr 2019 11:55:11 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BE6DA81DE6;
	Sun, 28 Apr 2019 15:55:10 +0000 (UTC)
Received: from thuth.com (ovpn-116-50.ams2.redhat.com [10.36.116.50])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 38BDA28577;
	Sun, 28 Apr 2019 15:55:08 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Date: Sun, 28 Apr 2019 17:54:45 +0200
Message-Id: <20190428155451.15653-3-thuth@redhat.com>
In-Reply-To: <20190428155451.15653-1-thuth@redhat.com>
References: <20190428155451.15653-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Sun, 28 Apr 2019 15:55:10 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 2/8] tests/qemu-iotests/005: Add a sanity
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
	Ed Maste <emaste@freebsd.org>, qemu-block@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Christophe Fergeau <cfergeau@redhat.com>, Max Reitz <mreitz@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"check -raw 005" fails when running on ext4 filesystems - these do not
support such large sparse files. Use the same check as in test 220 to
skip the test in this case.

Suggested-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qemu-iotests/005 | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/qemu-iotests/005 b/tests/qemu-iotests/005
index 2fef63af88..6136ced5c8 100755
--- a/tests/qemu-iotests/005
+++ b/tests/qemu-iotests/005
@@ -55,6 +55,15 @@ if [ "$IMGPROTO" =3D "sheepdog" ]; then
     _notrun "image protocol $IMGPROTO does not support large image sizes=
"
 fi
=20
+# Sanity check: For raw, we require a file system that permits the creat=
ion
+# of a HUGE (but very sparse) file.  tmpfs works, ext4 does not.
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


