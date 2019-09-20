Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB3DB947E
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Sep 2019 17:52:50 +0200 (CEST)
Received: from localhost ([::1]:32826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBLDF-0003CD-73
	for lists+qemu-devel@lfdr.de; Fri, 20 Sep 2019 11:52:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43843)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iBKpc-0000eG-Pk
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 11:28:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iBKpa-0004Oy-Mx
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 11:28:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48686)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iBKpW-0004Kx-4T; Fri, 20 Sep 2019 11:28:18 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EE72C18C8919;
 Fri, 20 Sep 2019 15:28:15 +0000 (UTC)
Received: from localhost (unknown [10.40.205.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89BDE60606;
 Fri, 20 Sep 2019 15:28:15 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 04/22] iotests: Let 041 use -blockdev for quorum children
Date: Fri, 20 Sep 2019 17:27:46 +0200
Message-Id: <20190920152804.12875-5-mreitz@redhat.com>
In-Reply-To: <20190920152804.12875-1-mreitz@redhat.com>
References: <20190920152804.12875-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Fri, 20 Sep 2019 15:28:16 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using -drive with default options means that a virtio-blk drive will be
created that has write access to the to-be quorum children.  Quorum
should have exclusive write access to them, so we should use -blockdev
instead.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/041 | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/041 b/tests/qemu-iotests/041
index 84bc6d6581..d91f538276 100755
--- a/tests/qemu-iotests/041
+++ b/tests/qemu-iotests/041
@@ -884,7 +884,10 @@ class TestRepairQuorum(iotests.QMPTestCase):
             # Assign a node name to each quorum image in order to manipu=
late
             # them
             opts =3D "node-name=3Dimg%i" % self.IMAGES.index(i)
-            self.vm =3D self.vm.add_drive(i, opts)
+            opts +=3D ',driver=3D%s' % iotests.imgfmt
+            opts +=3D ',file.driver=3Dfile'
+            opts +=3D ',file.filename=3D%s' % i
+            self.vm =3D self.vm.add_blockdev(opts)
=20
         self.vm.launch()
=20
--=20
2.21.0


