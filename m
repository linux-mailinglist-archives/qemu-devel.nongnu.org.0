Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 375B614E8A5
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 07:12:45 +0100 (CET)
Received: from localhost ([::1]:48722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixPXo-0003Yu-8o
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 01:12:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59119)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ixPUr-0006b7-3a
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 01:09:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ixPUp-0000P6-VU
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 01:09:41 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:43735 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ixPUp-0000LI-KT; Fri, 31 Jan 2020 01:09:39 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4886Hs3nJ7z9sSF; Fri, 31 Jan 2020 17:09:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1580450969;
 bh=xwNu4FGfWX/egNgtR4ivugsA4AmzcHorSgS/59pdGpI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QvBNHJq7AoHbJaDV2uaEggp8kZVJyem2mcevqewxDVEpoQ0R5KoF/aie1y6qnXvbi
 uLE9oRKKpis4vmFp6nunfF3nfd2KEEonFzRr2QYSFkNCCVMVSo3PULlqFEpEpFpgdw
 s5qYx1j+iLc1WdXevRyTKN/3Eu0N7GYABg2y1feY=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 10/34] ppc/pnv: Add support for HRMOR on Radix host
Date: Fri, 31 Jan 2020 17:09:00 +1100
Message-Id: <20200131060924.147449-11-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200131060924.147449-1-david@gibson.dropbear.id.au>
References: <20200131060924.147449-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: lvivier@redhat.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: C=C3=A9dric Le Goater <clg@kaod.org>

When in HV mode, if EA[0] is 0, the Hypervisor Offset Real Mode
Register controls the access.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20200127144154.10170-2-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/mmu-radix64.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 066e324464..224e646c50 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -235,6 +235,12 @@ int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, va=
ddr eaddr, int rwx,
         /* In real mode top 4 effective addr bits (mostly) ignored */
         raddr =3D eaddr & 0x0FFFFFFFFFFFFFFFULL;
=20
+        /* In HV mode, add HRMOR if top EA bit is clear */
+        if (msr_hv || !env->has_hv_mode) {
+            if (!(eaddr >> 63)) {
+                raddr |=3D env->spr[SPR_HRMOR];
+           }
+        }
         tlb_set_page(cs, eaddr & TARGET_PAGE_MASK, raddr & TARGET_PAGE_M=
ASK,
                      PAGE_READ | PAGE_WRITE | PAGE_EXEC, mmu_idx,
                      TARGET_PAGE_SIZE);
--=20
2.24.1


