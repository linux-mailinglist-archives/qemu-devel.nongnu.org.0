Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9E05A9880
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 15:24:12 +0200 (CEST)
Received: from localhost ([::1]:33588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTkB1-0003Tp-Uy
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 09:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oTk5Y-0005Yc-EN; Thu, 01 Sep 2022 09:18:34 -0400
Received: from [200.168.210.66] (port=23956 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oTk5W-0002Uu-Dc; Thu, 01 Sep 2022 09:18:32 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 1 Sep 2022 10:18:15 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 72E88800476;
 Thu,  1 Sep 2022 10:18:15 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br, matheus.ferst@eldorado.org.br,
 lucas.araujo@eldorado.org.br, leandro.lupori@eldorado.org.br,
 lucas.coutinho@eldorado.org.br
Subject: [PATCH 04/19] target/ppc: Set result to QNaN for DENBCD when VXCVI
 occurs
Date: Thu,  1 Sep 2022 10:17:41 -0300
Message-Id: <20220901131756.26060-5-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220901131756.26060-1-victor.colombo@eldorado.org.br>
References: <20220901131756.26060-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 01 Sep 2022 13:18:15.0916 (UTC)
 FILETIME=[4B8E4AC0:01D8BE05]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to the ISA, for instruction DENBCD:
"If an invalid BCD digit or sign code is detected in the source
operand, an invalid-operation exception (VXCVI) occurs."

In the Invalid Operation Exception section, there is the situation:
"When Invalid Operation Exception is disabled (VE=0) and Invalid
Operation occurs (...) If the operation is an (...) or format the
target FPR is set to a Quiet NaN". This was not being done in
QEMU.

This patch sets the result to QNaN when the instruction DENBCD causes
an Invalid Operation Exception.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 target/ppc/dfp_helper.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
index be7aa5357a..cc024316d5 100644
--- a/target/ppc/dfp_helper.c
+++ b/target/ppc/dfp_helper.c
@@ -1147,6 +1147,26 @@ static inline uint8_t dfp_get_bcd_digit_128(ppc_vsr_t *t, unsigned n)
     return t->VsrD((n & 0x10) ? 0 : 1) >> ((n << 2) & 63) & 15;
 }
 
+static inline void dfp_invalid_op_vxcvi_64(struct PPC_DFP *dfp)
+{
+    /* TODO: fpscr is incorrectly not being saved to env */
+    dfp_set_FPSCR_flag(dfp, FP_VX | FP_VXCVI, FPSCR_VE);
+    if ((dfp->env->fpscr & FP_VE) == 0) {
+        dfp->vt.VsrD(1) = 0x7c00000000000000; /* QNaN */
+    }
+}
+
+
+static inline void dfp_invalid_op_vxcvi_128(struct PPC_DFP *dfp)
+{
+    /* TODO: fpscr is incorrectly not being saved to env */
+    dfp_set_FPSCR_flag(dfp, FP_VX | FP_VXCVI, FPSCR_VE);
+    if ((dfp->env->fpscr & FP_VE) == 0) {
+        dfp->vt.VsrD(0) = 0x7c00000000000000; /* QNaN */
+        dfp->vt.VsrD(1) = 0x0;
+    }
+}
+
 #define DFP_HELPER_ENBCD(op, size)                                           \
 void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b,             \
                  uint32_t s)                                                 \
@@ -1173,7 +1193,8 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b,             \
             sgn = 0;                                                         \
             break;                                                           \
         default:                                                             \
-            dfp_set_FPSCR_flag(&dfp, FP_VX | FP_VXCVI, FPSCR_VE);            \
+            dfp_invalid_op_vxcvi_##size(&dfp);                               \
+            set_dfp##size(t, &dfp.vt);                                       \
             return;                                                          \
         }                                                                    \
         }                                                                    \
@@ -1183,7 +1204,8 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b,             \
         digits[(size) / 4 - n] = dfp_get_bcd_digit_##size(&dfp.vb,           \
                                                           offset++);         \
         if (digits[(size) / 4 - n] > 10) {                                   \
-            dfp_set_FPSCR_flag(&dfp, FP_VX | FP_VXCVI, FPSCR_VE);            \
+            dfp_invalid_op_vxcvi_##size(&dfp);                               \
+            set_dfp##size(t, &dfp.vt);                                       \
             return;                                                          \
         } else {                                                             \
             nonzero |= (digits[(size) / 4 - n] > 0);                         \
-- 
2.25.1


