Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D80F444A710
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 07:53:51 +0100 (CET)
Received: from localhost ([::1]:45408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkL0w-0000Gu-WF
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 01:53:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK4Z-0005Rx-IA; Tue, 09 Nov 2021 00:53:31 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=36815
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK4X-0006sa-Nr; Tue, 09 Nov 2021 00:53:31 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HpHDp3xBCz4xf8; Tue,  9 Nov 2021 16:52:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636437130;
 bh=EfE+ei4Z7oU43hQzTMVP9obgdnBb2SjhmRbf0XazYis=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QOPA9eM37JsDIC+DNG7qQM3T8godpRyr4m7xxJfLJXF92hLXd9pmNG/h62S6hyKez
 3atvulcngy0NmTX9tCiup04nzu+WNhaoqw1ZbjexOGKUc3Vw3TJNIdj27W0i2kUj0f
 QAQ+OS4kSHdVoytXXkzs6r5OFTlmluJu6fVo8xnE=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 groug@kaod.org
Subject: [PULL 33/54] target/ppc: Implement Vector Insert Word from GPR using
 Immediate insns
Date: Tue,  9 Nov 2021 16:51:43 +1100
Message-Id: <20211109055204.230765-34-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211109055204.230765-1-david@gibson.dropbear.id.au>
References: <20211109055204.230765-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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
Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Implements the following PowerISA v3.1 instructions:
vinsw: Vector Insert Word from GPR using immediate-specified index
vinsd: Vector Insert Doubleword from GPR using immediate-specified
       index

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20211104123719.323713-7-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/insn32.decode            |  6 +++++
 target/ppc/translate/vmx-impl.c.inc | 37 +++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index b794424496..e1f76aac34 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -44,6 +44,9 @@
 &VX             vrt vra vrb
 @VX             ...... vrt:5 vra:5 vrb:5 .......... .   &VX
 
+&VX_uim4        vrt uim vrb
+@VX_uim4        ...... vrt:5 . uim:4 vrb:5 ...........  &VX_uim4
+
 &X              rt ra rb
 @X              ...... rt:5 ra:5 rb:5 .......... .      &X
 
@@ -353,5 +356,8 @@ VINSWRX         000100 ..... ..... ..... 01110001111    @VX
 VINSDLX         000100 ..... ..... ..... 01011001111    @VX
 VINSDRX         000100 ..... ..... ..... 01111001111    @VX
 
+VINSW           000100 ..... - .... ..... 00011001111   @VX_uim4
+VINSD           000100 ..... - .... ..... 00111001111   @VX_uim4
+
 VSLDBI          000100 ..... ..... ..... 00 ... 010110  @VN
 VSRDBI          000100 ..... ..... ..... 01 ... 010110  @VN
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 21af60c616..9642cfa037 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1278,6 +1278,40 @@ static bool do_vinsx_VX(DisasContext *ctx, arg_VX *a, int size, bool right,
     return ok;
 }
 
+static bool do_vins_VX_uim4(DisasContext *ctx, arg_VX_uim4 *a, int size,
+                        void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_i64, TCGv))
+{
+    bool ok;
+    TCGv_i64 val;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    if (a->uim > (16 - size)) {
+        /*
+         * PowerISA v3.1 says that the resulting value is undefined in this
+         * case, so just log a guest error and leave VRT unchanged. The
+         * real hardware would do a partial insert, e.g. if VRT is zeroed and
+         * RB is 0x12345678, executing "vinsw VRT,RB,14" results in
+         * VRT = 0x0000...00001234, but we don't bother to reproduce this
+         * behavior as software shouldn't rely on it.
+         */
+        qemu_log_mask(LOG_GUEST_ERROR, "Invalid index for VINS* at"
+            " 0x" TARGET_FMT_lx ", UIM = %d > %d\n", ctx->cia, a->uim,
+            16 - size);
+        return true;
+    }
+
+    val = tcg_temp_new_i64();
+    tcg_gen_extu_tl_i64(val, cpu_gpr[a->vrb]);
+
+    ok = do_vinsx(ctx, a->vrt, size, false, tcg_constant_tl(a->uim), val,
+                  gen_helper);
+
+    tcg_temp_free_i64(val);
+    return ok;
+}
+
 TRANS(VINSBLX, do_vinsx_VX, 1, false, gen_helper_VINSBLX)
 TRANS(VINSHLX, do_vinsx_VX, 2, false, gen_helper_VINSHLX)
 TRANS(VINSWLX, do_vinsx_VX, 4, false, gen_helper_VINSWLX)
@@ -1288,6 +1322,9 @@ TRANS(VINSHRX, do_vinsx_VX, 2, true, gen_helper_VINSHLX)
 TRANS(VINSWRX, do_vinsx_VX, 4, true, gen_helper_VINSWLX)
 TRANS(VINSDRX, do_vinsx_VX, 8, true, gen_helper_VINSDLX)
 
+TRANS(VINSW, do_vins_VX_uim4, 4, gen_helper_VINSWLX)
+TRANS(VINSD, do_vins_VX_uim4, 8, gen_helper_VINSDLX)
+
 static void gen_vsldoi(DisasContext *ctx)
 {
     TCGv_ptr ra, rb, rd;
-- 
2.33.1


