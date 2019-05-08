Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6E41790A
	for <lists+qemu-devel@lfdr.de>; Wed,  8 May 2019 14:05:58 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36008 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOLKf-0005Hg-VC
	for lists+qemu-devel@lfdr.de; Wed, 08 May 2019 08:05:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45864)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hOLJX-0004rv-Rc
	for qemu-devel@nongnu.org; Wed, 08 May 2019 08:04:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hOLJW-0007H8-Uh
	for qemu-devel@nongnu.org; Wed, 08 May 2019 08:04:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51698)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hOLJU-0007A8-QJ; Wed, 08 May 2019 08:04:44 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4D6E3306C9F1;
	Wed,  8 May 2019 12:04:39 +0000 (UTC)
Received: from dhcp-200-226.str.redhat.com (dhcp-200-226.str.redhat.com
	[10.33.200.226])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4822862699;
	Wed,  8 May 2019 12:04:38 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Wed,  8 May 2019 14:04:35 +0200
Message-Id: <20190508120435.29832-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Wed, 08 May 2019 12:04:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] qemu-iotests: Fix cleanup for 192
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
Cc: kwolf@redhat.com, thuth@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Test case 192 calls _launch_qemu, so it also needs to _cleanup_qemu when
it's done, otherwise the QMP FIFOs stay around in scratch/. It also
creates a temporary NBD socket that needs to be removed as well at the
end of the test case.

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/192 | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/192 b/tests/qemu-iotests/192
index 158086f9d2..61a88ac88d 100755
--- a/tests/qemu-iotests/192
+++ b/tests/qemu-iotests/192
@@ -29,7 +29,9 @@ status=3D1	# failure is the default!
=20
 _cleanup()
 {
-	_cleanup_test_img
+    _cleanup_qemu
+    _cleanup_test_img
+    rm -f "$TEST_DIR/nbd"
 }
 trap "_cleanup; exit \$status" 0 1 2 3 15
=20
--=20
2.20.1


