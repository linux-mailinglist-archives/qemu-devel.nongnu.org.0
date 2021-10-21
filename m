Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F50436BCF
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 22:11:26 +0200 (CEST)
Received: from localhost ([::1]:48036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdePN-00085c-NH
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 16:11:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mde3o-00060T-HP; Thu, 21 Oct 2021 15:49:08 -0400
Received: from [201.28.113.2] (port=47716 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mde3m-0001rY-5n; Thu, 21 Oct 2021 15:49:08 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 21 Oct 2021 16:47:01 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id CB98280012A;
 Thu, 21 Oct 2021 16:47:00 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 17/33] target/ppc: Implement Vector Insert from VSR using GPR
 index insns
Date: Thu, 21 Oct 2021 16:45:31 -0300
Message-Id: <20211021194547.672988-18-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 21 Oct 2021 19:47:01.0342 (UTC)
 FILETIME=[6A7897E0:01D7C6B4]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: lucas.castro@eldorado.org.br, richard.henderson@linaro.org, groug@kaod.org,
 luis.pires@eldorado.org.br, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Implements the following PowerISA v3.1 instructions:
vinsbvlx: Vector Insert Byte from VSR using GPR-specified Left-Index
vinshvlx: Vector Insert Halfword from VSR using GPR-specified
          Left-Index
vinswvlx: Vector Insert Word from VSR using GPR-specified Left-Index
vinsbvrx: Vector Insert Byte from VSR using GPR-specified Right-Index
vinshvrx: Vector Insert Halfword from VSR using GPR-specified
          Right-Index
vinswvrx: Vector Insert Word from VSR using GPR-specified Right-Index

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn32.decode            |  7 +++++++
 target/ppc/int_helper.c             |  6 +++---
 target/ppc/translate/vmx-impl.c.inc | 32 +++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index e1f76aac34..de410abf7d 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -359,5 +359,12 @@ VINSDRX         000100 ..... ..... ..... 01111001111    @VX
 VINSW           000100 ..... - .... ..... 00011001111   @VX_uim4
 VINSD           000100 ..... - .... ..... 00111001111   @VX_uim4
 
+VINSBVLX        000100 ..... ..... ..... 00000001111    @VX
+VINSBVRX        000100 ..... ..... ..... 00100001111    @VX
+VINSHVLX        000100 ..... ..... ..... 00001001111    @VX
+VINSHVRX        000100 ..... ..... ..... 00101001111    @VX
+VINSWVLX        000100 ..... ..... ..... 00010001111    @VX
+VINSWVRX        000100 ..... ..... ..... 00110001111    @VX
+
 VSLDBI          000100 ..... ..... ..... 00 ... 010110  @VN
 VSRDBI          000100 ..... ..... ..... 01 ... 010110  @VN
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 63263dd912..0506358ad8 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1683,9 +1683,9 @@ void glue(glue(helper_VINS, SUFFIX), LX)(CPUPPCState *env, ppc_avr_t *t,       \
     if (idx < 0 || idx > maxidx) {                                             \
         char c = idx < 0 ? 'R' : 'L';                                          \
         idx =  idx < 0 ? sizeof(TYPE) - idx : idx;                             \
-        qemu_log_mask(LOG_GUEST_ERROR, "Invalid index for VINS" #SUFFIX "%cX"  \
-                      " at 0x" TARGET_FMT_lx ", RA = " TARGET_FMT_ld " > %d\n",\
-                      c, env->nip, idx, maxidx);                               \
+        qemu_log_mask(LOG_GUEST_ERROR, "Invalid index for VINS" #SUFFIX "%cX/" \
+                      "VINS" #SUFFIX "V%cX at 0x" TARGET_FMT_lx ", RA = "      \
+                      TARGET_FMT_ld " > %d\n", c, c, env->nip, idx, maxidx);   \
     } else {                                                                   \
         *(TYPE *)ELEM_ADDR(t, idx, sizeof(TYPE)) = (TYPE)val;                  \
     }                                                                          \
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 3b526977e4..03327d3fe4 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1260,6 +1260,20 @@ static bool do_vinsx(DisasContext *ctx, int vrt, int size, bool right, TCGv ra,
     return true;
 }
 
+static bool do_vinsvx(DisasContext *ctx, int vrt, int size, bool right, TCGv ra,
+                int vrb, void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_i64, TCGv))
+{
+    bool ok;
+    TCGv_i64 val;
+
+    val = tcg_temp_new_i64();
+    get_avr64(val, vrb, true);
+    ok = do_vinsx(ctx, vrt, size, right, ra, val, gen_helper);
+
+    tcg_temp_free_i64(val);
+    return ok;
+}
+
 static bool do_vinsx_VX(DisasContext *ctx, arg_VX *a, int size, bool right,
                         void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_i64, TCGv))
 {
@@ -1283,6 +1297,16 @@ static bool do_vinsx_VX(DisasContext *ctx, arg_VX *a, int size, bool right,
 #endif
 }
 
+static bool do_vinsvx_VX(DisasContext *ctx, arg_VX *a, int size, bool right,
+                        void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_i64, TCGv))
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    return do_vinsvx(ctx, a->vrt, size, right, cpu_gpr[a->vra], a->vrb,
+                     gen_helper);
+}
+
 static bool do_vins_VX_uim4(DisasContext *ctx, arg_VX_uim4 *a, int size,
                         void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_i64, TCGv))
 {
@@ -1327,6 +1351,14 @@ TRANS(VINSDRX, do_vinsx_VX, 8, true, gen_helper_VINSDLX)
 TRANS(VINSW, do_vins_VX_uim4, 4, gen_helper_VINSWLX)
 TRANS(VINSD, do_vins_VX_uim4, 8, gen_helper_VINSDLX)
 
+TRANS(VINSBVLX, do_vinsvx_VX, 1, false, gen_helper_VINSBLX)
+TRANS(VINSHVLX, do_vinsvx_VX, 2, false, gen_helper_VINSHLX)
+TRANS(VINSWVLX, do_vinsvx_VX, 4, false, gen_helper_VINSWLX)
+
+TRANS(VINSBVRX, do_vinsvx_VX, 1, true, gen_helper_VINSBLX)
+TRANS(VINSHVRX, do_vinsvx_VX, 2, true, gen_helper_VINSHLX)
+TRANS(VINSWVRX, do_vinsvx_VX, 4, true, gen_helper_VINSWLX)
+
 static void gen_vsldoi(DisasContext *ctx)
 {
     TCGv_ptr ra, rb, rd;
-- 
2.25.1


