Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA9314A671
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jan 2020 15:44:20 +0100 (CET)
Received: from localhost ([::1]:46287 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iw5ch-0004yx-P7
	for lists+qemu-devel@lfdr.de; Mon, 27 Jan 2020 09:44:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37551)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iw5ah-0002uo-BE
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 09:42:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iw5ag-0002tC-CN
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 09:42:15 -0500
Received: from 17.mo4.mail-out.ovh.net ([46.105.41.16]:36619)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iw5ag-0002sZ-62
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 09:42:14 -0500
Received: from player159.ha.ovh.net (unknown [10.108.35.27])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id C00A422233B
 for <qemu-devel@nongnu.org>; Mon, 27 Jan 2020 15:42:12 +0100 (CET)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
 (Authenticated sender: clg@kaod.org)
 by player159.ha.ovh.net (Postfix) with ESMTPSA id 400BAEA8C54D;
 Mon, 27 Jan 2020 14:42:04 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 1/3] ppc/pnv: Add support for HRMOR on Radix host
Date: Mon, 27 Jan 2020 15:41:52 +0100
Message-Id: <20200127144154.10170-2-clg@kaod.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200127144154.10170-1-clg@kaod.org>
References: <20200127144154.10170-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 17781337232201714662
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrfedvgdeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdduleehrddvuddvrddvledrudeiieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhduheelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.41.16
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
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When in HV mode, if EA[0] is 0, the Hypervisor Offset Real Mode
Register controls the access.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/mmu-radix64.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 066e324464db..224e646c5094 100644
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
2.21.1


