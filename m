Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 796D1432F0
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 08:22:22 +0200 (CEST)
Received: from localhost ([::1]:37168 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbJ7t-0006M5-Mn
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 02:22:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33460)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hbJ08-0000d8-5P
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 02:14:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hbIts-0000lk-VU
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 02:07:54 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:36997 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>) id 1hbItp-0000Wu-C1
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 02:07:52 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45PYDg6TQ5z9sNR; Thu, 13 Jun 2019 16:07:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1560406051;
 bh=c8TVVN8PpKD0KAoUOrBRBIL+3L7boRbCBvsp4k0rguk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cQ8fgstbBPJj2J3CD+WLEdM2VPlivmX4InU3OIUnoDDmaCa9bRDTjdiK8bfm607lj
 R2goyPmxgqitDiNzs0NHoGGo2Ynjxfguv6aJqp/c1YUUURzZuv2Uw21d/4JYC1EHWw
 6Ey+sY2XLpN2k72TR61LuWxceNV1NYi/5U5Jra3A=
From: David Gibson <david@gibson.dropbear.id.au>
To: crosa@redhat.com, qemu-devel@nongnu.org, arikalo@wavecomp.com,
 aurelien@aurel32.net, ehabkost@redhat.com
Date: Thu, 13 Jun 2019 16:07:28 +1000
Message-Id: <20190613060728.26955-4-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190613060728.26955-1-david@gibson.dropbear.id.au>
References: <20190613060728.26955-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PATCH 3/3] tests/acceptance: Increase timeout for
 LinuxSSH test
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
Cc: David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At least on the hosts I use (a POWER8 Tuleta, a POWER9 Boston and an 8 cp=
u
x86 instance in OpenStack) the linux_ssh_mips_malta tests in make
check-acceptance frequently timeout.  Increasing the timeout from 2.5 to
5 minutes makes that much less common.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 tests/acceptance/linux_ssh_mips_malta.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/acceptance/linux_ssh_mips_malta.py b/tests/acceptance/=
linux_ssh_mips_malta.py
index aafb0c39f6..7ed6c6c90f 100644
--- a/tests/acceptance/linux_ssh_mips_malta.py
+++ b/tests/acceptance/linux_ssh_mips_malta.py
@@ -20,7 +20,7 @@ from avocado.utils import archive
=20
 class LinuxSSH(Test):
=20
-    timeout =3D 150 # Not for 'configure --enable-debug --enable-debug-t=
cg'
+    timeout =3D 300 # Not for 'configure --enable-debug --enable-debug-t=
cg'
=20
     KERNEL_COMMON_COMMAND_LINE =3D 'printk.time=3D0 '
     VM_IP =3D '127.0.0.1'
--=20
2.21.0


