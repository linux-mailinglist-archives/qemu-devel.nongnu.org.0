Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A77C42AB
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 23:26:56 +0200 (CEST)
Received: from localhost ([::1]:48346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFPfZ-0004Xk-TN
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 17:26:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55305)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iFO99-000681-2M
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:49:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iFO97-0000Bg-1B
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:49:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60366)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iFO91-00006h-5e; Tue, 01 Oct 2019 15:49:13 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1AC4910DCC94;
 Tue,  1 Oct 2019 19:49:09 +0000 (UTC)
Received: from localhost (unknown [10.40.205.251])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AAA3D60619;
 Tue,  1 Oct 2019 19:49:08 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 48/67] iotests/219: Honor $IMGOPTS
Date: Tue,  1 Oct 2019 21:46:56 +0200
Message-Id: <20191001194715.2796-49-mreitz@redhat.com>
In-Reply-To: <20191001194715.2796-1-mreitz@redhat.com>
References: <20191001194715.2796-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Tue, 01 Oct 2019 19:49:09 +0000 (UTC)
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
 tests/qemu-iotests/219 | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/219 b/tests/qemu-iotests/219
index 9ae27cb04e..37e3c70aef 100755
--- a/tests/qemu-iotests/219
+++ b/tests/qemu-iotests/219
@@ -20,6 +20,7 @@
 # Check using the job-* QMP commands with block jobs
=20
 import iotests
+from iotests import create_test_image
=20
 iotests.script_initialize(supported_fmts=3D['qcow2'])
=20
@@ -177,11 +178,11 @@ def test_job_lifecycle(vm, job, job_args, has_ready=
=3DFalse):
     iotests.log(vm.qmp('query-jobs'))
=20
=20
-with iotests.FilePath('disk.img') as disk_path, \
+with iotests.ImagePath('disk.img') as disk_path, \
      iotests.FilePath('copy.img') as copy_path, \
      iotests.VM() as vm:
=20
-    iotests.qemu_img_create('-f', iotests.imgfmt, disk_path, str(img_siz=
e))
+    create_test_image(disk_path, img_size)
     iotests.qemu_io('-c', 'write 0 %i' % (img_size),
                     '-f', iotests.imgfmt, disk_path)
=20
--=20
2.21.0


