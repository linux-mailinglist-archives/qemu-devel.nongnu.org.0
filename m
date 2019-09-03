Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DB4A6A83
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Sep 2019 15:55:31 +0200 (CEST)
Received: from localhost ([::1]:46484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i59HN-0007yR-EW
	for lists+qemu-devel@lfdr.de; Tue, 03 Sep 2019 09:55:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56130)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1i58zB-0002pY-Ix
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 09:36:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1i58zA-0006qq-AO
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 09:36:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54682)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1i58z4-0006ob-Bn; Tue, 03 Sep 2019 09:36:34 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 75B7189810B;
 Tue,  3 Sep 2019 13:36:33 +0000 (UTC)
Received: from localhost (ovpn-204-98.brq.redhat.com [10.40.204.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 472451001947;
 Tue,  3 Sep 2019 13:36:30 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Tue,  3 Sep 2019 15:35:52 +0200
Message-Id: <20190903133553.6500-16-mreitz@redhat.com>
In-Reply-To: <20190903133553.6500-1-mreitz@redhat.com>
References: <20190903133553.6500-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Tue, 03 Sep 2019 13:36:33 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v2 15/16] tests/check-block: Skip iotests when
 sanitizers are enabled
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

From: Thomas Huth <thuth@redhat.com>

The sanitizers (especially the address sanitizer from Clang) are
sometimes printing out warnings or false positives - this spoils
the output of the iotests, causing some of the tests to fail.
Thus let's skip the automatic iotests during "make check" when the
user configured QEMU with --enable-sanitizers.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-id: 20190823084203.29734-1-thuth@redhat.com
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/check-block.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/check-block.sh b/tests/check-block.sh
index c8b6cec3f6..679aedec50 100755
--- a/tests/check-block.sh
+++ b/tests/check-block.sh
@@ -21,6 +21,11 @@ if grep -q "TARGET_GPROF=3Dy" *-softmmu/config-target.=
mak 2>/dev/null ; then
     exit 0
 fi
=20
+if grep -q "CFLAGS.*-fsanitize" config-host.mak 2>/dev/null ; then
+    echo "Sanitizers are enabled =3D=3D> Not running the qemu-iotests."
+    exit 0
+fi
+
 if [ -z "$(find . -name 'qemu-system-*' -print)" ]; then
     echo "No qemu-system binary available =3D=3D> Not running the qemu-i=
otests."
     exit 0
--=20
2.21.0


