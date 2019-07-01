Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F1F44955
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 19:17:07 +0200 (CEST)
Received: from localhost ([::1]:42214 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbTLW-0004UX-FU
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 13:17:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35648)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eblake@redhat.com>) id 1hbRy7-0002o8-SU
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 11:48:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1hbRy6-0006Vv-Oq
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 11:48:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44376)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1hbRy3-0006SZ-SO; Thu, 13 Jun 2019 11:48:47 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2D2DA307D989;
 Thu, 13 Jun 2019 15:48:47 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-85.phx2.redhat.com [10.3.116.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 922885C6D6;
 Thu, 13 Jun 2019 15:48:46 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 13 Jun 2019 10:48:32 -0500
Message-Id: <20190613154837.21734-5-eblake@redhat.com>
In-Reply-To: <20190613154837.21734-1-eblake@redhat.com>
References: <20190613154837.21734-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Thu, 13 Jun 2019 15:48:47 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 4/9] iotests: Use qemu-nbd's --pid-file
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20190508211820.17851-5-mreitz@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/common.rc | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index 93f87389b60e..5502c3da2f87 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -105,10 +105,8 @@ _qemu_io_wrapper()

 _qemu_nbd_wrapper()
 {
-    (
-        echo $BASHPID > "${QEMU_TEST_DIR}/qemu-nbd.pid"
-        exec "$QEMU_NBD_PROG" $QEMU_NBD_OPTIONS "$@"
-    )
+    "$QEMU_NBD_PROG" --pid-file=3D"${QEMU_TEST_DIR}/qemu-nbd.pid" \
+                     $QEMU_NBD_OPTIONS "$@"
 }

 _qemu_vxhs_wrapper()
--=20
2.20.1


