Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8940D104825
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Nov 2019 02:40:29 +0100 (CET)
Received: from localhost ([::1]:35650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXbSO-0000ve-Hf
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 20:40:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38324)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iXbRA-0008OP-JC
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 20:39:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iXbR8-0006SU-J2
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 20:39:12 -0500
Received: from ozlabs.org ([203.11.71.1]:59921)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iXbR4-0006OQ-KA; Wed, 20 Nov 2019 20:39:07 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47JMfZ4dplz9sPn; Thu, 21 Nov 2019 12:39:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1574300342;
 bh=JIfsApD1YfZ/bDz9LeRPQyITPIdEKbfk9wNA+Pc165I=;
 h=From:To:Cc:Subject:Date:From;
 b=CpJFW+/eB542mN3g2/u4O3uCRcVAL1kE2T1R+tpGV0g+Mg0YlWGRJPurUI8SS/FFw
 3x7r92N81sNWW7657+k56qtdx1I081EkiqrlJXgvKni3AYsFeFx2v5Uw4OPCgGH1Wv
 /Dzkb7owmxAbBEjDPlhJB08xhjjvP35UCwJF8+aA=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] exynos4210_gic: Suppress gcc9 format-truncation warnings
Date: Thu, 21 Nov 2019 12:38:59 +1100
Message-Id: <20191121013859.287372-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

exynos4210_gic_realize() prints the number of cpus into some temporary
buffers, but it only allows 3 bytes space for it.  That's plenty:
existing machines will only ever set this value to EXYNOS4210_NCPUS
(2).  But the compiler can't always figure that out, so some[*] gcc9
versions emit -Wformat-truncation warnings.

We can fix that by hinting the constraint to the compiler with a
suitably placed assert().

[*] The bizarre thing here, is that I've long gotten these warnings
    compiling in a 32-bit x86 container as host - Fedora 30 with
    gcc-9.2.1-1.fc30.i686 - but it compiles just fine on my normal
    x86_64 host - Fedora 30 with and gcc-9.2.1-1.fc30.x86_64.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>

Changes since v1:
 * Used an assert to hint the compiler, instead of increasing the
   buffer size.

---
 hw/intc/exynos4210_gic.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
index a1b699b6ba..ed4d8482e3 100644
--- a/hw/intc/exynos4210_gic.c
+++ b/hw/intc/exynos4210_gic.c
@@ -314,6 +314,14 @@ static void exynos4210_gic_realize(DeviceState *dev,=
 Error **errp)
             EXYNOS4210_EXT_GIC_DIST_REGION_SIZE);
=20
     for (i =3D 0; i < s->num_cpu; i++) {
+        /*
+         * This clues in gcc that our on-stack buffers do, in fact
+         * have enough room for the cpu numbers.  gcc 9.2.1 on 32-bit
+         * x86 doesn't figure this out, otherwise and gives spurious
+         * warnings.
+         */
+        assert(i <=3D EXYNOS4210_NCPUS);
+
         /* Map CPU interface per SMP Core */
         sprintf(cpu_alias_name, "%s%x", cpu_prefix, i);
         memory_region_init_alias(&s->cpu_alias[i], obj,
--=20
2.23.0


