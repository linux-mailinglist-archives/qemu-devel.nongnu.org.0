Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F75465325
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 17:44:44 +0100 (CET)
Received: from localhost ([::1]:34968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msSip-0003aG-EK
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 11:44:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1msSds-00006n-Lp; Wed, 01 Dec 2021 11:39:38 -0500
Received: from [201.28.113.2] (port=20732 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1msSdp-0001L4-Lx; Wed, 01 Dec 2021 11:39:35 -0500
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 1 Dec 2021 13:39:24 -0300
Received: from eldorado.org.br (unknown [10.10.71.29])
 by power9a (Postfix) with ESMTP id 5595C800CFF;
 Wed,  1 Dec 2021 13:39:24 -0300 (-03)
From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 3/3] target/ppc: ppc_store_fpscr doesn't update bits 0 to
 28 and 52
Date: Wed,  1 Dec 2021 13:38:08 -0300
Message-Id: <20211201163808.440385-4-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211201163808.440385-1-lucas.araujo@eldorado.org.br>
References: <20211201163808.440385-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 01 Dec 2021 16:39:24.0469 (UTC)
 FILETIME=[FFC9D650:01D7E6D1]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: richard.henderson@linaro.org, danielhb413@gmail.com,
 mark.cave-ayland@ilande.co.uk,
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 pc@us.ibm.com, david@gibson.dropbear.id.au, matheus.ferst@eldorado.org.br,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This commit fixes the difference reported in the bug in the reserved
bit 52, it does this by adding this bit to the mask of bits to not be
directly altered in the ppc_store_fpscr function (the hardware used to
compare to QEMU was a Power9).

The bits 0 to 27 were also added to the mask, as they are marked as
reserved in the PowerISA and bit 28 is a reserved extension of the DRN
field (bits 29:31) but can't be set using mtfsfi, while the other DRN
bits may be set using mtfsfi instruction, so bit 28 was also added to
the mask.

Although this is a difference reported in the bug, since it's a reserved
bit it may be a "don't care" case, as put in the bug report. Looking at
the ISA it doesn't explicitly mention this bit can't be set, like it
does for FEX and VX, so I'm unsure if this is necessary.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/266
Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
 target/ppc/cpu.c | 2 +-
 target/ppc/cpu.h | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
index f933d9f2bd..d7b42bae52 100644
--- a/target/ppc/cpu.c
+++ b/target/ppc/cpu.c
@@ -112,7 +112,7 @@ static inline void fpscr_set_rounding_mode(CPUPPCState *env)
 
 void ppc_store_fpscr(CPUPPCState *env, target_ulong val)
 {
-    val &= ~(FP_VX | FP_FEX);
+    val &= FPSCR_MTFS_MASK;
     if (val & FPSCR_IX) {
         val |= FP_VX;
     }
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index e946da5f3a..441d3dce19 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -759,6 +759,10 @@ enum {
                           FP_VXZDZ  | FP_VXIMZ  | FP_VXVC   | FP_VXSOFT | \
                           FP_VXSQRT | FP_VXCVI)
 
+/* FPSCR bits that can be set by mtfsf, mtfsfi and mtfsb1 */
+#define FPSCR_MTFS_MASK (~(MAKE_64BIT_MASK(36, 28) | PPC_BIT(28) |        \
+                           FP_FEX | FP_VX | PPC_BIT(52)))
+
 /*****************************************************************************/
 /* Vector status and control register */
 #define VSCR_NJ         16 /* Vector non-java */
-- 
2.31.1


