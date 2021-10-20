Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 683DA434CC8
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 15:55:19 +0200 (CEST)
Received: from localhost ([::1]:32854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdC3q-00057G-E3
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 09:55:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1mdBtc-0000pK-Ey; Wed, 20 Oct 2021 09:44:44 -0400
Received: from [201.28.113.2] (port=17190 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1mdBta-0004Hp-Fj; Wed, 20 Oct 2021 09:44:43 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 20 Oct 2021 09:57:33 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 24FAB80045D;
 Wed, 20 Oct 2021 09:57:33 -0300 (-03)
From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 2/2] target/ppc: ppc_store_fpscr doesn't update bit 52
Date: Wed, 20 Oct 2021 09:57:24 -0300
Message-Id: <20211020125724.78028-3-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211020125724.78028-1-lucas.araujo@eldorado.org.br>
References: <20211020125724.78028-1-lucas.araujo@eldorado.org.br>
X-OriginalArrivalTime: 20 Oct 2021 12:57:33.0384 (UTC)
 FILETIME=[0C69F480:01D7C5B2]
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
Cc: "Lucas Mateus Castro \(alqotel\)" <lucas.castro@eldorado.org.br>,
 richard.henderson@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.castro@eldorado.org.br>

This commit fixes the difference reported in the bug in the reserved
bit 52, it does this by adding this bit to the mask of bits to not be
directly altered in the ppc_store_fpscr function (the hardware used to
compare to QEMU was a Power9).

Although this is a difference reported in the bug, since it's a reserved
bit it may be a "don't care" case, as put in the bug report. Looking at
the ISA it doesn't explicitly mentions this bit can't be set, like it
does for FEX and VX, so I'm unsure if this is necessary.

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.castro@eldorado.org.br>
---
 target/ppc/cpu.c | 2 +-
 target/ppc/cpu.h | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
index 7ad9bd6044..5c411b32ff 100644
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
index baa4e7c34d..4b42b281ed 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -736,6 +736,9 @@ enum {
                           FP_VXZDZ  | FP_VXIMZ  | FP_VXVC   | FP_VXSOFT | \
                           FP_VXSQRT | FP_VXCVI)
 
+/* FPSCR bits that can be set by mtfsf, mtfsfi and mtfsb1 */
+#define FPSCR_MTFS_MASK ~((1ull << 11) | FP_VX | FP_FEX)
+
 /*****************************************************************************/
 /* Vector status and control register */
 #define VSCR_NJ         16 /* Vector non-java */
-- 
2.31.1


