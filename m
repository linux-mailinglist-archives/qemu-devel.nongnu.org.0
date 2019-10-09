Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40873D1C26
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 00:47:10 +0200 (CEST)
Received: from localhost ([::1]:60654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIKjd-0000BC-Al
	for lists+qemu-devel@lfdr.de; Wed, 09 Oct 2019 18:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59176)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1iIKfq-00062C-7i
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 18:43:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1iIKfp-0002GR-1k
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 18:43:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41076)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1iIKfm-0002Dg-DQ; Wed, 09 Oct 2019 18:43:10 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9627018021AD;
 Wed,  9 Oct 2019 22:43:09 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-165.bos.redhat.com [10.18.17.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF40D600C4;
 Wed,  9 Oct 2019 22:43:08 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/1] IDE: deprecate ide-drive
Date: Wed,  9 Oct 2019 18:43:03 -0400
Message-Id: <20191009224303.10232-2-jsnow@redhat.com>
In-Reply-To: <20191009224303.10232-1-jsnow@redhat.com>
References: <20191009224303.10232-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Wed, 09 Oct 2019 22:43:09 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 qemu-block@nongnu.org, libvir-list@redhat.com, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's an old compatibility shim that just delegates to ide-cd or ide-hd.
I'd like to refactor these some day, and getting rid of the super-object
will make that easier.

Either way, we don't need this.

Libvirt-checked-by: Peter Krempa <pkrempa@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
---
 qemu-deprecated.texi          | 5 +++++
 hw/ide/qdev.c                 | 3 +++
 tests/qemu-iotests/051.pc.out | 6 ++++--
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
index 01245e0b1c4..7cd4648df3c 100644
--- a/qemu-deprecated.texi
+++ b/qemu-deprecated.texi
@@ -247,6 +247,11 @@ quite a bit. It will be removed without replacement =
unless some users speaks
 up at the @email{qemu-devel@@nongnu.org} mailing list with information a=
bout
 their usecases.
=20
+@subsection ide-drive (since 4.2)
+
+The 'ide-drive' device is deprecated. Users should use 'ide-hd' or
+'ide-cd' as appropriate to get an IDE hard disk or CD-ROM as needed.
+
 @section System emulator machines
=20
 @subsection pc-0.12, pc-0.13, pc-0.14 and pc-0.15 (since 4.0)
diff --git a/hw/ide/qdev.c b/hw/ide/qdev.c
index 6fba6b62b87..3666e597211 100644
--- a/hw/ide/qdev.c
+++ b/hw/ide/qdev.c
@@ -279,6 +279,9 @@ static void ide_drive_realize(IDEDevice *dev, Error *=
*errp)
 {
     DriveInfo *dinfo =3D NULL;
=20
+    warn_report("'ide-drive' is deprecated, "
+                "please use 'ide-hd' or 'ide-cd' instead");
+
     if (dev->conf.blk) {
         dinfo =3D blk_legacy_dinfo(dev->conf.blk);
     }
diff --git a/tests/qemu-iotests/051.pc.out b/tests/qemu-iotests/051.pc.ou=
t
index 000557c7c83..34849dd1720 100644
--- a/tests/qemu-iotests/051.pc.out
+++ b/tests/qemu-iotests/051.pc.out
@@ -158,7 +158,8 @@ QEMU X.Y.Z monitor - type 'help' for more information
=20
 Testing: -drive if=3Dnone,id=3Ddisk -device ide-drive,drive=3Ddisk
 QEMU X.Y.Z monitor - type 'help' for more information
-(qemu) QEMU_PROG: -device ide-drive,drive=3Ddisk: Device needs media, bu=
t drive is empty
+(qemu) QEMU_PROG: -device ide-drive,drive=3Ddisk: warning: 'ide-drive' i=
s deprecated, please use 'ide-hd' or 'ide-cd' instead
+QEMU_PROG: -device ide-drive,drive=3Ddisk: Device needs media, but drive=
 is empty
=20
 Testing: -drive if=3Dnone,id=3Ddisk -device ide-hd,drive=3Ddisk
 QEMU X.Y.Z monitor - type 'help' for more information
@@ -228,7 +229,8 @@ QEMU X.Y.Z monitor - type 'help' for more information
=20
 Testing: -drive file=3DTEST_DIR/t.qcow2,if=3Dnone,id=3Ddisk,readonly=3Do=
n -device ide-drive,drive=3Ddisk
 QEMU X.Y.Z monitor - type 'help' for more information
-(qemu) QEMU_PROG: -device ide-drive,drive=3Ddisk: Block node is read-onl=
y
+(qemu) QEMU_PROG: -device ide-drive,drive=3Ddisk: warning: 'ide-drive' i=
s deprecated, please use 'ide-hd' or 'ide-cd' instead
+QEMU_PROG: -device ide-drive,drive=3Ddisk: Block node is read-only
=20
 Testing: -drive file=3DTEST_DIR/t.qcow2,if=3Dnone,id=3Ddisk,readonly=3Do=
n -device ide-hd,drive=3Ddisk
 QEMU X.Y.Z monitor - type 'help' for more information
--=20
2.21.0


