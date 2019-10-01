Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE80C4242
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 23:02:41 +0200 (CEST)
Received: from localhost ([::1]:48126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFPI8-0000nE-5r
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 17:02:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55242)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iFO93-0005ux-3x
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:49:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iFO91-00007G-5M
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:49:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58824)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iFO8x-00005n-Hp; Tue, 01 Oct 2019 15:49:07 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CA03430860D5;
 Tue,  1 Oct 2019 19:49:06 +0000 (UTC)
Received: from localhost (unknown [10.40.205.251])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 64E261001B08;
 Tue,  1 Oct 2019 19:49:06 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 47/67] iotests/218: Honor $IMGOPTS
Date: Tue,  1 Oct 2019 21:46:55 +0200
Message-Id: <20191001194715.2796-48-mreitz@redhat.com>
In-Reply-To: <20191001194715.2796-1-mreitz@redhat.com>
References: <20191001194715.2796-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Tue, 01 Oct 2019 19:49:06 +0000 (UTC)
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/218 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/218 b/tests/qemu-iotests/218
index e18e31076b..6f6fe6588e 100755
--- a/tests/qemu-iotests/218
+++ b/tests/qemu-iotests/218
@@ -27,7 +27,7 @@
 # Creator/Owner: Max Reitz <mreitz@redhat.com>
=20
 import iotests
-from iotests import log, qemu_img, qemu_io_silent
+from iotests import log, create_test_image, qemu_io_silent
=20
 iotests.script_initialize(supported_fmts=3D['qcow2', 'raw'])
=20
@@ -142,9 +142,9 @@ log('=3D=3D=3D Cancel mirror job from throttled node =
by quitting =3D=3D=3D')
 log('')
=20
 with iotests.VM() as vm, \
-     iotests.FilePath('src.img') as src_img_path:
+     iotests.ImagePath('src.img') as src_img_path:
=20
-    assert qemu_img('create', '-f', iotests.imgfmt, src_img_path, '64M')=
 =3D=3D 0
+    assert create_test_image(src_img_path, '64M') =3D=3D 0
     assert qemu_io_silent('-f', iotests.imgfmt, src_img_path,
                           '-c', 'write -P 42 0M 64M') =3D=3D 0
=20
--=20
2.21.0


