Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7A2CB374
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 05:11:44 +0200 (CEST)
Received: from localhost ([::1]:41880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGE0M-0006eo-LD
	for lists+qemu-devel@lfdr.de; Thu, 03 Oct 2019 23:11:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46624)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iGDzA-00068I-Fs
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 23:10:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iGDz9-0008JH-Cd
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 23:10:28 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:56505 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iGDz5-00088f-3Z; Thu, 03 Oct 2019 23:10:24 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46kvy15zhRz9sPq; Fri,  4 Oct 2019 13:10:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1570158617;
 bh=6BzysK04Egnj4VKoHR3IxJqfPZVBBXwQCCXvuB1yqd8=;
 h=From:To:Cc:Subject:Date:From;
 b=hJ+31lckGHqwbdvDTm47x9QoXTsNuvXT6qeVH+0oXb2I0AerZUn0qIHvS9Xo8HCcs
 9pgMe5FK3eeUDyIPQYkfmgKOsi4MW8U+Fr3pt3GP//BWN3dpQh3VqwtaaZv+V+aZN5
 DaT/f1eLiT8pWDIQYAq/9gkP45GiqIQP9rilKUZA=
From: David Gibson <david@gibson.dropbear.id.au>
To: i.mitsyanko@gmail.com,
	peter.maydell@linaro.org
Subject: [PATCH] exynos4210_gic: Suppress gcc9 format-truncation warnings
Date: Fri,  4 Oct 2019 12:55:09 +1000
Message-Id: <20191004025509.3012-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

exynos4210_gic_realize() prints the number of cpus into some temporary
buffers, but it only allows 3 bytes space for it.  That's plenty - I'm
pretty sure that existing machines will only ever set this value to 2
(EXYNOS4210_NCPUS).  But the compiler can't really be expected to figure
that out.

Some[*] gcc9 versions therefore emit -Wformat-truncation warnings.  Fix
that by allowing more space in the temporary buffers - these are on stack
very briefly before being essentially strdup()ed inside the memory region
code, so there's not much cost to doing so.

[*] The bizarre thing here, is that I've long gotten these warnings
compiling in a 32-bit x86 container as host - Fedora 30 with
gcc-9.2.1-1.fc30.i686 - but it compiles just fine on my normal x86_64 hos=
t
- Fedora 30 with and gcc-9.2.1-1.fc30.x86_64.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/exynos4210_gic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
index a1b699b6ba..2e5e47f9ec 100644
--- a/hw/intc/exynos4210_gic.c
+++ b/hw/intc/exynos4210_gic.c
@@ -290,8 +290,8 @@ static void exynos4210_gic_realize(DeviceState *dev, =
Error **errp)
     SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
     const char cpu_prefix[] =3D "exynos4210-gic-alias_cpu";
     const char dist_prefix[] =3D "exynos4210-gic-alias_dist";
-    char cpu_alias_name[sizeof(cpu_prefix) + 3];
-    char dist_alias_name[sizeof(cpu_prefix) + 3];
+    char cpu_alias_name[sizeof(cpu_prefix) + 10];
+    char dist_alias_name[sizeof(cpu_prefix) + 10];
     SysBusDevice *gicbusdev;
     uint32_t i;
=20
--=20
2.21.0


