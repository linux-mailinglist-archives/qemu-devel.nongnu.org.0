Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E45472C27
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 13:19:14 +0100 (CET)
Received: from localhost ([::1]:53950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwkIT-0004ns-9L
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 07:19:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1mwkAP-0006x9-1J; Mon, 13 Dec 2021 07:10:53 -0500
Received: from [201.28.113.2] (port=36754 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1mwkAN-0008FP-Bt; Mon, 13 Dec 2021 07:10:52 -0500
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 13 Dec 2021 09:10:39 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 6ADC9800A5A;
 Mon, 13 Dec 2021 09:10:39 -0300 (-03)
From: Victor Colombo <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 1/4] target/ppc: Fix xs{max, min}[cj]dp to use VSX registers
Date: Mon, 13 Dec 2021 09:09:55 -0300
Message-Id: <20211213120958.24443-2-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211213120958.24443-1-victor.colombo@eldorado.org.br>
References: <20211213120958.24443-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 13 Dec 2021 12:10:39.0833 (UTC)
 FILETIME=[71B6A490:01D7F01A]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 victor.colombo@eldorado.org.br, clg@kaod.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PPC instruction xsmaxcdp, xsmincdp, xsmaxjdp, and xsminjdp are using
vector registers when they should be using VSX ones. This happens
because the instructions are using GEN_VSX_HELPER_R3, which adds 32
to the register numbers, effectively making them vector registers.

This patch fixes it by changing these instructions to use
GEN_VSX_HELPER_X3.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Victor Colombo <victor.colombo@eldorado.org.br>
---
 target/ppc/fpu_helper.c             | 4 ++--
 target/ppc/helper.h                 | 8 ++++----
 target/ppc/translate/vsx-impl.c.inc | 8 ++++----
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index c4896cecc8..ad41ef1606 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2420,7 +2420,7 @@ VSX_MAX_MIN(xvmindp, minnum, 2, float64, VsrD(i))
 VSX_MAX_MIN(xvminsp, minnum, 4, float32, VsrW(i))
 
 #define VSX_MAX_MINC(name, max)                                               \
-void helper_##name(CPUPPCState *env, uint32_t opcode,                         \
+void helper_##name(CPUPPCState *env,                                          \
                    ppc_vsr_t *xt, ppc_vsr_t *xa, ppc_vsr_t *xb)               \
 {                                                                             \
     ppc_vsr_t t = *xt;                                                        \
@@ -2455,7 +2455,7 @@ VSX_MAX_MINC(xsmaxcdp, 1);
 VSX_MAX_MINC(xsmincdp, 0);
 
 #define VSX_MAX_MINJ(name, max)                                               \
-void helper_##name(CPUPPCState *env, uint32_t opcode,                         \
+void helper_##name(CPUPPCState *env,                                          \
                    ppc_vsr_t *xt, ppc_vsr_t *xa, ppc_vsr_t *xb)               \
 {                                                                             \
     ppc_vsr_t t = *xt;                                                        \
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 627811cefc..12a3d5f269 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -392,10 +392,10 @@ DEF_HELPER_4(xscmpoqp, void, env, i32, vsr, vsr)
 DEF_HELPER_4(xscmpuqp, void, env, i32, vsr, vsr)
 DEF_HELPER_4(xsmaxdp, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(xsmindp, void, env, vsr, vsr, vsr)
-DEF_HELPER_5(xsmaxcdp, void, env, i32, vsr, vsr, vsr)
-DEF_HELPER_5(xsmincdp, void, env, i32, vsr, vsr, vsr)
-DEF_HELPER_5(xsmaxjdp, void, env, i32, vsr, vsr, vsr)
-DEF_HELPER_5(xsminjdp, void, env, i32, vsr, vsr, vsr)
+DEF_HELPER_4(xsmaxcdp, void, env, vsr, vsr, vsr)
+DEF_HELPER_4(xsmincdp, void, env, vsr, vsr, vsr)
+DEF_HELPER_4(xsmaxjdp, void, env, vsr, vsr, vsr)
+DEF_HELPER_4(xsminjdp, void, env, vsr, vsr, vsr)
 DEF_HELPER_3(xscvdphp, void, env, vsr, vsr)
 DEF_HELPER_4(xscvdpqp, void, env, i32, vsr, vsr)
 DEF_HELPER_3(xscvdpsp, void, env, vsr, vsr)
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index c0e38060b4..02df75339e 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1098,10 +1098,10 @@ GEN_VSX_HELPER_R2_AB(xscmpoqp, 0x04, 0x04, 0, PPC2_VSX)
 GEN_VSX_HELPER_R2_AB(xscmpuqp, 0x04, 0x14, 0, PPC2_VSX)
 GEN_VSX_HELPER_X3(xsmaxdp, 0x00, 0x14, 0, PPC2_VSX)
 GEN_VSX_HELPER_X3(xsmindp, 0x00, 0x15, 0, PPC2_VSX)
-GEN_VSX_HELPER_R3(xsmaxcdp, 0x00, 0x10, 0, PPC2_ISA300)
-GEN_VSX_HELPER_R3(xsmincdp, 0x00, 0x11, 0, PPC2_ISA300)
-GEN_VSX_HELPER_R3(xsmaxjdp, 0x00, 0x12, 0, PPC2_ISA300)
-GEN_VSX_HELPER_R3(xsminjdp, 0x00, 0x12, 0, PPC2_ISA300)
+GEN_VSX_HELPER_X3(xsmaxcdp, 0x00, 0x10, 0, PPC2_ISA300)
+GEN_VSX_HELPER_X3(xsmincdp, 0x00, 0x11, 0, PPC2_ISA300)
+GEN_VSX_HELPER_X3(xsmaxjdp, 0x00, 0x12, 0, PPC2_ISA300)
+GEN_VSX_HELPER_X3(xsminjdp, 0x00, 0x12, 0, PPC2_ISA300)
 GEN_VSX_HELPER_X2(xscvdphp, 0x16, 0x15, 0x11, PPC2_ISA300)
 GEN_VSX_HELPER_X2(xscvdpsp, 0x12, 0x10, 0, PPC2_VSX)
 GEN_VSX_HELPER_R2(xscvdpqp, 0x04, 0x1A, 0x16, PPC2_ISA300)
-- 
2.25.1


