Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA8EC421B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 22:55:02 +0200 (CEST)
Received: from localhost ([::1]:48040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFPAi-0001HG-QF
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 16:55:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55414)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iFO9G-0006FT-7q
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:49:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iFO9F-0000GQ-Av
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:49:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44004)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iFO9C-0000Dk-U3; Tue, 01 Oct 2019 15:49:23 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AB2333090FC7;
 Tue,  1 Oct 2019 19:49:20 +0000 (UTC)
Received: from localhost (unknown [10.40.205.251])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 44F0E60C5D;
 Tue,  1 Oct 2019 19:49:20 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 53/67] iotests/235: Honor $IMGOPTS
Date: Tue,  1 Oct 2019 21:47:01 +0200
Message-Id: <20191001194715.2796-54-mreitz@redhat.com>
In-Reply-To: <20191001194715.2796-1-mreitz@redhat.com>
References: <20191001194715.2796-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Tue, 01 Oct 2019 19:49:20 +0000 (UTC)
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
 tests/qemu-iotests/235 | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/235 b/tests/qemu-iotests/235
index 9e88c65b93..3326d205b7 100755
--- a/tests/qemu-iotests/235
+++ b/tests/qemu-iotests/235
@@ -21,7 +21,7 @@
 import sys
 import os
 import iotests
-from iotests import qemu_img_create, qemu_io, file_path, log
+from iotests import create_test_image, qemu_io, image_path, log
=20
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'pyt=
hon'))
=20
@@ -42,11 +42,10 @@ iotests.script_initialize(supported_fmts=3D['qcow2'])
=20
 size =3D 1 * 1024 * 1024 * 1024
=20
-disk =3D file_path('disk')
+disk =3D image_path('disk')
=20
 # prepare source image
-qemu_img_create('-f', iotests.imgfmt, '-o', 'preallocation=3Dmetadata', =
disk,
-                str(size))
+create_test_image(disk, size, opts=3D['preallocation=3Dmetadata'])
=20
 vm =3D QEMUMachine(iotests.qemu_prog)
 vm.add_args('-machine', 'accel=3Dkvm:tcg')
--=20
2.21.0


