Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F7749B6B8
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 15:47:57 +0100 (CET)
Received: from localhost ([::1]:42382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCN6x-0003Lm-WE
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 09:47:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCLIO-0004UR-NY; Tue, 25 Jan 2022 07:51:39 -0500
Received: from [187.72.171.209] (port=39682 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCLII-0000Wd-Km; Tue, 25 Jan 2022 07:51:32 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 25 Jan 2022 09:20:45 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 497148009AB;
 Tue, 25 Jan 2022 09:20:45 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 32/38] target/ppc: Implement xscmp{eq,ge,gt}qp
Date: Tue, 25 Jan 2022 09:19:37 -0300
Message-Id: <20220125121943.3269077-33-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
References: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Jan 2022 12:20:45.0671 (UTC)
 FILETIME=[FA956F70:01D811E5]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 clg@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Víctor Colombo <victor.colombo@eldorado.org.br>

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/fpu_helper.c             |  4 ++++
 target/ppc/helper.h                 |  3 +++
 target/ppc/insn32.decode            |  3 +++
 target/ppc/translate/vsx-impl.c.inc | 31 +++++++++++++++++++++++++++++
 4 files changed, 41 insertions(+)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 4a73186155..6d6c6cfa08 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2311,6 +2311,10 @@ VSX_SCALAR_CMP(xscmpeqdp, float64, eq, VsrD(0), 1, 0)
 VSX_SCALAR_CMP(xscmpgedp, float64, le, VsrD(0), 1, 1)
 VSX_SCALAR_CMP(xscmpgtdp, float64, lt, VsrD(0), 1, 1)
 
+VSX_SCALAR_CMP(XSCMPEQQP, float128, eq, f128, 1, 0)
+VSX_SCALAR_CMP(XSCMPGEQP, float128, le, f128, 1, 1)
+VSX_SCALAR_CMP(XSCMPGTQP, float128, lt, f128, 1, 1)
+
 void helper_xscmpexpdp(CPUPPCState *env, uint32_t opcode,
                        ppc_vsr_t *xa, ppc_vsr_t *xb)
 {
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index ca13d9b3d9..9e2740f46d 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -369,6 +369,9 @@ DEF_HELPER_5(XSNMSUBDP, void, env, vsr, vsr, vsr, vsr)
 DEF_HELPER_4(xscmpeqdp, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(xscmpgtdp, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(xscmpgedp, void, env, vsr, vsr, vsr)
+DEF_HELPER_4(XSCMPEQQP, void, env, vsr, vsr, vsr)
+DEF_HELPER_4(XSCMPGTQP, void, env, vsr, vsr, vsr)
+DEF_HELPER_4(XSCMPGEQP, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(xscmpexpdp, void, env, i32, vsr, vsr)
 DEF_HELPER_4(xscmpexpqp, void, env, i32, vsr, vsr)
 DEF_HELPER_4(xscmpodp, void, env, i32, vsr, vsr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index c9cf865fdf..6d986dba68 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -602,6 +602,9 @@ XSMAXCDP        111100 ..... ..... ..... 10000000 ...   @XX3
 XSMINCDP        111100 ..... ..... ..... 10001000 ...   @XX3
 XSMAXJDP        111100 ..... ..... ..... 10010000 ...   @XX3
 XSMINJDP        111100 ..... ..... ..... 10011000 ...   @XX3
+XSCMPEQQP       111111 ..... ..... ..... 0001000100 -   @X
+XSCMPGEQP       111111 ..... ..... ..... 0011000100 -   @X
+XSCMPGTQP       111111 ..... ..... ..... 0011100100 -   @X
 
 ## VSX Binary Floating-Point Convert Instructions
 
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 9be7bf0ffd..e1fea01a3a 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2497,6 +2497,37 @@ TRANS(XSMINCDP, do_xsmaxmincjdp, gen_helper_xsmincdp)
 TRANS(XSMAXJDP, do_xsmaxmincjdp, gen_helper_xsmaxjdp)
 TRANS(XSMINJDP, do_xsmaxmincjdp, gen_helper_xsminjdp)
 
+static bool do_helper_X(arg_X *a,
+    void (*helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr))
+{
+    TCGv_ptr rt, ra, rb;
+
+    rt = gen_avr_ptr(a->rt);
+    ra = gen_avr_ptr(a->ra);
+    rb = gen_avr_ptr(a->rb);
+
+    helper(cpu_env, rt, ra, rb);
+
+    tcg_temp_free_ptr(rt);
+    tcg_temp_free_ptr(ra);
+    tcg_temp_free_ptr(rb);
+
+    return true;
+}
+
+static bool do_xscmpqp(DisasContext *ctx, arg_X *a,
+    void (*helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr))
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VSX(ctx);
+
+    return do_helper_X(a, helper);
+}
+
+TRANS(XSCMPEQQP, do_xscmpqp, gen_helper_XSCMPEQQP)
+TRANS(XSCMPGEQP, do_xscmpqp, gen_helper_XSCMPGEQP)
+TRANS(XSCMPGTQP, do_xscmpqp, gen_helper_XSCMPGTQP)
+
 #undef GEN_XX2FORM
 #undef GEN_XX3FORM
 #undef GEN_XX2IFORM
-- 
2.25.1


