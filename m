Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B625152A3C2
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 15:44:55 +0200 (CEST)
Received: from localhost ([::1]:50834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqxVO-0008Pi-PQ
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 09:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nqwVc-000429-33; Tue, 17 May 2022 08:41:04 -0400
Received: from [187.72.171.209] (port=53711 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nqwVa-0004gP-8t; Tue, 17 May 2022 08:41:03 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 17 May 2022 09:39:31 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 8AADF800603;
 Tue, 17 May 2022 09:39:31 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH 06/12] target/ppc: declare xscvspdpn helper with call flags
Date: Tue, 17 May 2022 09:39:23 -0300
Message-Id: <20220517123929.284511-7-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220517123929.284511-1-matheus.ferst@eldorado.org.br>
References: <20220517123929.284511-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 17 May 2022 12:39:31.0797 (UTC)
 FILETIME=[2812A050:01D869EB]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Move xscvspdpn to decodetree, declare helper_xscvspdpn with
TCG_CALL_NO_RWG_SE and drop the unused env argument.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/fpu_helper.c             |  2 +-
 target/ppc/helper.h                 |  2 +-
 target/ppc/insn32.decode            |  1 +
 target/ppc/translate/vsx-impl.c.inc | 22 +++++++++++++++++++++-
 target/ppc/translate/vsx-ops.c.inc  |  1 -
 5 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index b4d6f6ed4c..dd90031d8a 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2875,7 +2875,7 @@ uint64_t helper_xscvdpspn(CPUPPCState *env, uint64_t xb)
     return (result << 32) | result;
 }
 
-uint64_t helper_xscvspdpn(CPUPPCState *env, uint64_t xb)
+uint64_t helper_XSCVSPDPN(uint64_t xb)
 {
     return helper_todouble(xb >> 32);
 }
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index ddfa0308bc..9be69fa91e 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -395,7 +395,7 @@ DEF_HELPER_3(XSCVSQQP, void, env, vsr, vsr)
 DEF_HELPER_3(xscvhpdp, void, env, vsr, vsr)
 DEF_HELPER_4(xscvsdqp, void, env, i32, vsr, vsr)
 DEF_HELPER_3(xscvspdp, void, env, vsr, vsr)
-DEF_HELPER_2(xscvspdpn, i64, env, i64)
+DEF_HELPER_FLAGS_1(XSCVSPDPN, TCG_CALL_NO_RWG_SE, i64, i64)
 DEF_HELPER_3(xscvdpsxds, void, env, vsr, vsr)
 DEF_HELPER_3(xscvdpsxws, void, env, vsr, vsr)
 DEF_HELPER_3(xscvdpuxds, void, env, vsr, vsr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 1d0b55bde3..d4c2615b1a 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -708,6 +708,7 @@ XSCVUQQP        111111 ..... 00011 ..... 1101000100 -   @X_tb
 XSCVSQQP        111111 ..... 01011 ..... 1101000100 -   @X_tb
 XVCVBF16SPN     111100 ..... 10000 ..... 111011011 ..   @XX2
 XVCVSPBF16      111100 ..... 10001 ..... 111011011 ..   @XX2
+XSCVSPDPN       111100 ..... ----- ..... 101001011 ..   @XX2
 
 ## VSX Vector Test Least-Significant Bit by Byte Instruction
 
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 3692740736..9b4f309d9d 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1045,7 +1045,27 @@ GEN_VSX_HELPER_R2(xscvqpuwz, 0x04, 0x1A, 0x01, PPC2_ISA300)
 GEN_VSX_HELPER_X2(xscvhpdp, 0x16, 0x15, 0x10, PPC2_ISA300)
 GEN_VSX_HELPER_R2(xscvsdqp, 0x04, 0x1A, 0x0A, PPC2_ISA300)
 GEN_VSX_HELPER_X2(xscvspdp, 0x12, 0x14, 0, PPC2_VSX)
-GEN_VSX_HELPER_XT_XB_ENV(xscvspdpn, 0x16, 0x14, 0, PPC2_VSX207)
+
+bool trans_XSCVSPDPN(DisasContext *ctx, arg_XX2 *a)
+{
+    TCGv_i64 tmp;
+
+    REQUIRE_INSNS_FLAGS2(ctx, VSX207);
+    REQUIRE_VSX(ctx);
+
+    tmp = tcg_temp_new_i64();
+    get_cpu_vsr(tmp, a->xb, true);
+
+    gen_helper_XSCVSPDPN(tmp, tmp);
+
+    set_cpu_vsr(a->xt, tmp, true);
+    set_cpu_vsr(a->xt, tcg_constant_i64(0), false);
+
+    tcg_temp_free_i64(tmp);
+
+    return true;
+}
+
 GEN_VSX_HELPER_X2(xscvdpsxds, 0x10, 0x15, 0, PPC2_VSX)
 GEN_VSX_HELPER_X2(xscvdpsxws, 0x10, 0x05, 0, PPC2_VSX)
 GEN_VSX_HELPER_X2(xscvdpuxds, 0x10, 0x14, 0, PPC2_VSX)
diff --git a/target/ppc/translate/vsx-ops.c.inc b/target/ppc/translate/vsx-ops.c.inc
index b8fd116728..52d7ab30cd 100644
--- a/target/ppc/translate/vsx-ops.c.inc
+++ b/target/ppc/translate/vsx-ops.c.inc
@@ -200,7 +200,6 @@ GEN_XX2FORM(xscvdpspn, 0x16, 0x10, PPC2_VSX207),
 GEN_XX2FORM_EO(xscvhpdp, 0x16, 0x15, 0x10, PPC2_ISA300),
 GEN_VSX_XFORM_300_EO(xscvsdqp, 0x04, 0x1A, 0x0A, 0x00000001),
 GEN_XX2FORM(xscvspdp, 0x12, 0x14, PPC2_VSX),
-GEN_XX2FORM(xscvspdpn, 0x16, 0x14, PPC2_VSX207),
 GEN_XX2FORM(xscvdpsxds, 0x10, 0x15, PPC2_VSX),
 GEN_XX2FORM(xscvdpsxws, 0x10, 0x05, PPC2_VSX),
 GEN_XX2FORM(xscvdpuxds, 0x10, 0x14, PPC2_VSX),
-- 
2.25.1


