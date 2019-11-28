Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B2810CA0C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Nov 2019 15:02:49 +0100 (CET)
Received: from localhost ([::1]:49318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iaKNc-0002id-2K
	for lists+qemu-devel@lfdr.de; Thu, 28 Nov 2019 09:02:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44965)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iaK8v-0003zj-5j
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 08:47:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iaK8s-0005m5-V6
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 08:47:36 -0500
Received: from 2.mo68.mail-out.ovh.net ([46.105.52.162]:51584)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iaK8s-0005fE-MN
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 08:47:34 -0500
Received: from player688.ha.ovh.net (unknown [10.108.54.52])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 01EB4145AF2
 for <qemu-devel@nongnu.org>; Thu, 28 Nov 2019 14:47:31 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player688.ha.ovh.net (Postfix) with ESMTPSA id 0BD76C94B37B;
 Thu, 28 Nov 2019 13:47:25 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 3/7] target/ppc: Add SPR ASDR
Date: Thu, 28 Nov 2019 14:46:56 +0100
Message-Id: <20191128134700.16091-4-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191128134700.16091-1-clg@kaod.org>
References: <20191128134700.16091-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 14984320386766703590
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudeijedgheegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheikeekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.52.162
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Suraj Jitindar Singh <sjitindarsingh@gmail.com>

The Access Segment Descriptor Register (ASDR) provides information about
the storage element when taking a hypervisor storage interrupt. When
performing nested radix address translation, this is normally the guest
real address. This register is present on POWER9 processors and later.

Implement the ADSR, note read and write access is limited to the
hypervisor.

Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/cpu.h                | 1 +
 target/ppc/translate_init.inc.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 9128dbefbdb0..646a94370dba 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1780,6 +1780,7 @@ typedef PowerPCCPU ArchCPU;
 #define SPR_MPC_MD_DBRAM1     (0x32A)
 #define SPR_RCPU_L2U_RA3      (0x32B)
 #define SPR_TAR               (0x32F)
+#define SPR_ASDR              (0x330)
 #define SPR_IC                (0x350)
 #define SPR_VTB               (0x351)
 #define SPR_MMCRC             (0x353)
diff --git a/target/ppc/translate_init.inc.c b/target/ppc/translate_init.=
inc.c
index 6105e74e9dc6..a3cf1d8a450c 100644
--- a/target/ppc/translate_init.inc.c
+++ b/target/ppc/translate_init.inc.c
@@ -8290,6 +8290,12 @@ static void gen_spr_power9_mmu(CPUPPCState *env)
                         SPR_NOACCESS, SPR_NOACCESS,
                         &spr_read_generic, &spr_write_ptcr,
                         KVM_REG_PPC_PTCR, 0x00000000);
+    /* Address Segment Descriptor Register */
+    spr_register_hv(env, SPR_ASDR, "ASDR",
+                    SPR_NOACCESS, SPR_NOACCESS,
+                    SPR_NOACCESS, SPR_NOACCESS,
+                    &spr_read_generic, &spr_write_generic,
+                    0x0000000000000000);
 #endif
 }
=20
--=20
2.21.0


