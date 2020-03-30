Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5CC19780F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Mar 2020 11:53:34 +0200 (CEST)
Received: from localhost ([::1]:47212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jIr6r-0005h7-HZ
	for lists+qemu-devel@lfdr.de; Mon, 30 Mar 2020 05:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42821)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1jIr3t-00010u-Ad
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 05:50:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1jIr3s-0005iC-Cj
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 05:50:29 -0400
Received: from 9.mo173.mail-out.ovh.net ([46.105.72.44]:47441)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1jIr3s-0005hR-6s
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 05:50:28 -0400
Received: from player729.ha.ovh.net (unknown [10.108.42.167])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 0F08A13439E
 for <qemu-devel@nongnu.org>; Mon, 30 Mar 2020 11:50:25 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player729.ha.ovh.net (Postfix) with ESMTPSA id 6830B110F51FD;
 Mon, 30 Mar 2020 09:50:18 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 3/7] target/ppc: Assert if HV mode is set when running under a
 pseries machine
Date: Mon, 30 Mar 2020 11:49:42 +0200
Message-Id: <20200330094946.24678-4-clg@kaod.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200330094946.24678-1-clg@kaod.org>
References: <20200330094946.24678-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 13898389928626523110
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudeihedgvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejvdelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.72.44
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
Cc: Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/mmu-radix64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index f6007e956569..d2422d1c54c9 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -231,6 +231,7 @@ int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vad=
dr eaddr, int rwx,
     ppc_v3_pate_t pate;
     bool relocation;
=20
+    assert(!(msr_hv && cpu->vhyp));
     assert((rwx =3D=3D 0) || (rwx =3D=3D 1) || (rwx =3D=3D 2));
=20
     relocation =3D ((rwx =3D=3D 2) && (msr_ir =3D=3D 1)) || ((rwx !=3D 2=
) && (msr_dr =3D=3D 1));
--=20
2.21.1


