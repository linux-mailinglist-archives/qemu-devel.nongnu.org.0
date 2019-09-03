Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C878A6A51
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Sep 2019 15:46:43 +0200 (CEST)
Received: from localhost ([::1]:46380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i598s-0006If-1e
	for lists+qemu-devel@lfdr.de; Tue, 03 Sep 2019 09:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56044)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1i58z0-0002ff-8c
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 09:36:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1i58yz-0006jP-8K
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 09:36:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60722)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1i58yw-0006bl-RO; Tue, 03 Sep 2019 09:36:26 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 27D1F190C103;
 Tue,  3 Sep 2019 13:36:26 +0000 (UTC)
Received: from localhost (ovpn-204-98.brq.redhat.com [10.40.204.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B3B3B1017E30;
 Tue,  3 Sep 2019 13:36:25 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Tue,  3 Sep 2019 15:35:50 +0200
Message-Id: <20190903133553.6500-14-mreitz@redhat.com>
In-Reply-To: <20190903133553.6500-1-mreitz@redhat.com>
References: <20190903133553.6500-1-mreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Tue, 03 Sep 2019 13:36:26 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v2 13/16] iotests: Add -display none to the qemu
 options
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Without this argument, qemu will print an angry message about not being
able to connect to a display server if $DISPLAY is not set.  For me,
that breaks iotests.supported_formats() because it thus only sees
["Could", "not", "connect"] as the supported formats.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-id: 20190819201851.24418-2-mreitz@redhat.com
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/check | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index c24874ff4a..a58232eefb 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -581,13 +581,13 @@ export QEMU_PROG=3D"$(type -p "$QEMU_PROG")"
=20
 case "$QEMU_PROG" in
     *qemu-system-arm|*qemu-system-aarch64)
-        export QEMU_OPTIONS=3D"-nodefaults -machine virt,accel=3Dqtest"
+        export QEMU_OPTIONS=3D"-nodefaults -display none -machine virt,a=
ccel=3Dqtest"
         ;;
     *qemu-system-tricore)
-        export QEMU_OPTIONS=3D"-nodefaults -machine tricore_testboard,ac=
cel=3Dqtest"
+        export QEMU_OPTIONS=3D"-nodefaults -display none -machine tricor=
e_testboard,accel=3Dqtest"
         ;;
     *)
-        export QEMU_OPTIONS=3D"-nodefaults -machine accel=3Dqtest"
+        export QEMU_OPTIONS=3D"-nodefaults -display none -machine accel=3D=
qtest"
         ;;
 esac
=20
--=20
2.21.0


