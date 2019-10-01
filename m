Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C002C4246
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 23:03:53 +0200 (CEST)
Received: from localhost ([::1]:48130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFPJG-0001pM-L7
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 17:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55567)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iFO9b-0006dC-QV
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:49:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iFO9Z-0000Qd-T2
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:49:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60485)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iFO9O-0000Kp-PW; Tue, 01 Oct 2019 15:49:35 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 15759105786C;
 Tue,  1 Oct 2019 19:49:34 +0000 (UTC)
Received: from localhost (unknown [10.40.205.251])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A22C11001B05;
 Tue,  1 Oct 2019 19:49:33 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 58/67] iotests/246: Honor $IMGOPTS
Date: Tue,  1 Oct 2019 21:47:06 +0200
Message-Id: <20191001194715.2796-59-mreitz@redhat.com>
In-Reply-To: <20191001194715.2796-1-mreitz@redhat.com>
References: <20191001194715.2796-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Tue, 01 Oct 2019 19:49:34 +0000 (UTC)
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
 tests/qemu-iotests/246 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/246 b/tests/qemu-iotests/246
index d1364d5901..2224c61545 100755
--- a/tests/qemu-iotests/246
+++ b/tests/qemu-iotests/246
@@ -20,7 +20,7 @@
 # owner=3Djsnow@redhat.com
=20
 import iotests
-from iotests import log
+from iotests import log, create_test_image
=20
 iotests.script_initialize(supported_fmts=3D['qcow2'],
                           # compat=3D1.1 is needed for dirty bitmaps
@@ -35,11 +35,11 @@ def query_bitmaps(vm):
     return { "bitmaps": { device['device']: device.get('dirty-bitmaps', =
[]) for
                           device in res['return'] } }
=20
-with iotests.FilePath('img') as img_path, \
+with iotests.ImagePath('img') as img_path, \
      iotests.VM() as vm:
=20
     log('--- Preparing image & VM ---\n')
-    iotests.qemu_img_create('-f', iotests.imgfmt, img_path, str(size))
+    create_test_image(img_path, size)
     vm.add_drive(img_path)
=20
=20
--=20
2.21.0


