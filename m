Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C074510CA4E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Nov 2019 15:22:18 +0100 (CET)
Received: from localhost ([::1]:49530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iaKgS-00053j-6V
	for lists+qemu-devel@lfdr.de; Thu, 28 Nov 2019 09:22:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47891)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iaK9Q-0004MC-LA
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 08:48:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iaK9M-0008AS-W9
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 08:48:06 -0500
Received: from 7.mo179.mail-out.ovh.net ([46.105.61.94]:56803)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iaK9M-0007oT-Ok
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 08:48:04 -0500
Received: from player688.ha.ovh.net (unknown [10.108.57.188])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 1755414C826
 for <qemu-devel@nongnu.org>; Thu, 28 Nov 2019 14:48:00 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player688.ha.ovh.net (Postfix) with ESMTPSA id 12D28C94B6CE;
 Thu, 28 Nov 2019 13:47:53 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 7/7] target/ppc: Enforce that the root page directory size
 must be at least 5
Date: Thu, 28 Nov 2019 14:47:00 +0100
Message-Id: <20191128134700.16091-8-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191128134700.16091-1-clg@kaod.org>
References: <20191128134700.16091-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 14992201686115978214
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudeijedgheegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheikeekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedu
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.61.94
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

According to the ISA the root page directory size of a radix tree for
either process or partition scoped translation must be >=3D 5.

Thus add this to the list of conditions checked when validating the
partition table entry in validate_pate();

Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
[clg: - checkpatch fixes ]
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/mmu-radix64.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 066e324464db..b8ecb8fa1d51 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -212,6 +212,9 @@ static bool validate_pate(PowerPCCPU *cpu, uint64_t l=
pid, ppc_v3_pate_t *pate)
     if (lpid =3D=3D 0 && !msr_hv) {
         return false;
     }
+    if ((pate->dw0 & PATE1_R_PRTS) < 5) {
+        return false;
+    }
     /* More checks ... */
     return true;
 }
--=20
2.21.0


