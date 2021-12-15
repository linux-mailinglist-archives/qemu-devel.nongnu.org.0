Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE1A475EFE
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 18:29:43 +0100 (CET)
Received: from localhost ([::1]:60406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxY62-0002U2-9N
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 12:29:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mxXcK-0004zf-SJ
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:59:00 -0500
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253]:55941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mxXcH-0003UG-5E
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:59:00 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.239])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 69375211E3;
 Wed, 15 Dec 2021 16:58:55 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 15 Dec
 2021 17:58:54 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0015c4cbd78-423d-4d37-82ca-627bf45ba4a7,
 DB2000250E14A505ED1736C7348301D5E40ED0AA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.76.172.47
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PULL 005/102] target/ppc: ppc_store_fpscr doesn't update bits 0 to
 28 and 52
Date: Wed, 15 Dec 2021 17:57:10 +0100
Message-ID: <20211215165847.321042-6-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215165847.321042-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b1e4d705-8717-4fc4-a216-c786ceb54505
X-Ovh-Tracer-Id: 2219993145268144934
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgdeljecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeduudfgheetffeguefftefffeeuudeikedtueeihffhjedvueetfefgkedvteehffenucffohhmrghinhepghhithhlrggsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

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
Message-Id: <20211201163808.440385-4-lucas.araujo@eldorado.org.br>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 target/ppc/cpu.h | 4 ++++
 target/ppc/cpu.c | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index e946da5f3a8c..441d3dce194c 100644
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
diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
index f933d9f2bd84..d7b42bae52d6 100644
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
-- 
2.31.1


