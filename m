Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6A94E94B
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 15:37:04 +0200 (CEST)
Received: from localhost ([::1]:35026 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heJix-0000uq-Bx
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 09:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50525)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1heJWT-0006XN-Bh
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 09:24:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1heJWP-0004gC-8x
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 09:24:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34446)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1heJWB-0004Vt-2d; Fri, 21 Jun 2019 09:23:52 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D648B308339B;
 Fri, 21 Jun 2019 13:23:47 +0000 (UTC)
Received: from localhost (ovpn-204-30.brq.redhat.com [10.40.204.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E44D601A5;
 Fri, 21 Jun 2019 13:23:47 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Fri, 21 Jun 2019 15:23:24 +0200
Message-Id: <20190621132324.2165-9-mreitz@redhat.com>
In-Reply-To: <20190621132324.2165-1-mreitz@redhat.com>
References: <20190621132324.2165-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Fri, 21 Jun 2019 13:23:47 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 8/8] iotests: Fix 205 for concurrent runs
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tests should place their files into the test directory.  This includes
Unix sockets.  205 currently fails to do so, which prevents it from
being run concurrently.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-id: 20190618210238.9524-1-mreitz@redhat.com
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/205 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/205 b/tests/qemu-iotests/205
index 69f2c1d392..b8a86c446e 100755
--- a/tests/qemu-iotests/205
+++ b/tests/qemu-iotests/205
@@ -24,7 +24,7 @@ import iotests
 import time
 from iotests import qemu_img_create, qemu_io, filter_qemu_io, QemuIoInte=
ractive
=20
-nbd_sock =3D 'nbd_sock'
+nbd_sock =3D os.path.join(iotests.test_dir, 'nbd_sock')
 nbd_uri =3D 'nbd+unix:///exp?socket=3D' + nbd_sock
 disk =3D os.path.join(iotests.test_dir, 'disk')
=20
--=20
2.21.0


