Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBCB5355D7
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 23:52:21 +0200 (CEST)
Received: from localhost ([::1]:35120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuLP2-0003GD-R9
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 17:52:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCR-0001uD-VY; Thu, 26 May 2022 17:39:20 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:41716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCQ-0008AZ-5K; Thu, 26 May 2022 17:39:19 -0400
Received: by mail-oi1-x22a.google.com with SMTP id e189so3640184oia.8;
 Thu, 26 May 2022 14:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GbAOFTEzfGwyyOg6VT6HcjeZQdbcVx0fCwVonLKzZgc=;
 b=XFyQ6G/ORmsQWvYIWi8tt23azQ23XM7Z53YL4H3PGThGWFXfXbxIK2CnsJC8KKqqYq
 i3xxRa9KUGmsSu0gq6tZBBBrnlgLweONC/c9Tdjccqzg2DXhoiduyYKNSDLwgn5PeY1B
 9PRUR4LSqPRlou6jco8vqy0CY8VjNnYrka4q4kYRsyiF0r4TGmxXnZWNzU8vXFvoIiII
 5ZJYMeMvjsh7Dzgs60yrPWZFfU/LWabCCPOzpGoBes+tWAynoOTekFP/RjoI/RV32QRs
 oJ/Ozczlsl8xWDd3ZDCMzAaG+Vc2cYBcGb19QwiRDqONqTqChxVqKcX5oBHN6xJ5JZt8
 GsTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GbAOFTEzfGwyyOg6VT6HcjeZQdbcVx0fCwVonLKzZgc=;
 b=LZ2qTWSjXuNk3twskqt6aokzzsmjpEeJ8ofgWvIEoBctxW6I6hG9qnoHthQ66AARJH
 ba5UpMpfTblezPSdcMXwO9MsB2qbP8grclsz8dgawH3kTmFOOrxdnoCmVE+QLpCfpJN2
 P3At7VqVHLlx/kFdwVAMY7Lja5aQAQAx8H+NMmZdk4v4WkZesQX/CCWSiqkFpdZHXENZ
 /n4Ha7VCeLmrDh+UkUgnkTbwPZdJLiqCr344A6fYTo+eKL0lPx63zljtEnVGjyYqaHZ1
 t08iq/GdM20aVoc4sSGH2Tnt8cbknSCXnA6NnoKA0O0u4H3IQtXoK9a8OMM2qIGVIQzX
 2oRg==
X-Gm-Message-State: AOAM530CPGHJwR2/tQf/dnQONtKyUNKPORofP/Ety2XJUUPw4/IbMLrA
 CYJxp6g53YR95eserE9T7shZzNVde88=
X-Google-Smtp-Source: ABdhPJyul5zkTTjPN3ZrySkKW1ii0cYGamL1Gtph7KKrXS8Z6s7ApXfaYdUFkVXVjbeHaze5OUOJZQ==
X-Received: by 2002:a05:6808:17a8:b0:327:9efa:cf1a with SMTP id
 bg40-20020a05680817a800b003279efacf1amr2202389oib.81.1653601156512; 
 Thu, 26 May 2022 14:39:16 -0700 (PDT)
Received: from balboa.COMFAST (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 l43-20020a0568302b2b00b00606ad72bdcbsm1066999otv.38.2022.05.26.14.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 14:39:16 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PULL 15/34] target/ppc: Use TCG_CALL_NO_RWG_SE in fsel helper
Date: Thu, 26 May 2022 18:37:56 -0300
Message-Id: <20220526213815.92701-16-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220526213815.92701-1-danielhb413@gmail.com>
References: <20220526213815.92701-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

fsel doesn't change FPSCR and CR1 is handled by gen_set_cr1_from_fpscr,
so helper_fsel doesn't need the env argument and can be declared with
TCG_CALL_NO_RWG_SE. We also take this opportunity to move the insn to
decodetree.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220517123929.284511-6-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/fpu_helper.c            | 15 +++++++--------
 target/ppc/helper.h                |  2 +-
 target/ppc/insn32.decode           |  7 +++++++
 target/ppc/translate/fp-impl.c.inc | 30 ++++++++++++++++++++++++++++--
 target/ppc/translate/fp-ops.c.inc  |  1 -
 5 files changed, 43 insertions(+), 12 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 8592727792..588448702f 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -919,18 +919,17 @@ float64 helper_frsqrtes(CPUPPCState *env, float64 arg)
 }
 
 /* fsel - fsel. */
-uint64_t helper_fsel(CPUPPCState *env, uint64_t arg1, uint64_t arg2,
-                     uint64_t arg3)
+uint64_t helper_FSEL(uint64_t a, uint64_t b, uint64_t c)
 {
-    CPU_DoubleU farg1;
+    CPU_DoubleU fa;
 
-    farg1.ll = arg1;
+    fa.ll = a;
 
-    if ((!float64_is_neg(farg1.d) || float64_is_zero(farg1.d)) &&
-        !float64_is_any_nan(farg1.d)) {
-        return arg2;
+    if ((!float64_is_neg(fa.d) || float64_is_zero(fa.d)) &&
+        !float64_is_any_nan(fa.d)) {
+        return c;
     } else {
-        return arg3;
+        return b;
     }
 }
 
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index f82c5bd0db..ddfa0308bc 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -120,7 +120,7 @@ DEF_HELPER_2(fre, i64, env, i64)
 DEF_HELPER_2(fres, i64, env, i64)
 DEF_HELPER_2(frsqrte, i64, env, i64)
 DEF_HELPER_2(frsqrtes, i64, env, i64)
-DEF_HELPER_4(fsel, i64, env, i64, i64, i64)
+DEF_HELPER_FLAGS_3(FSEL, TCG_CALL_NO_RWG_SE, i64, i64, i64, i64)
 
 DEF_HELPER_FLAGS_2(ftdiv, TCG_CALL_NO_RWG_SE, i32, i64, i64)
 DEF_HELPER_FLAGS_1(ftsqrt, TCG_CALL_NO_RWG_SE, i32, i64)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 39372fe673..1d0b55bde3 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -17,6 +17,9 @@
 # License along with this library; if not, see <http://www.gnu.org/licenses/>.
 #
 
+&A              frt fra frb frc rc:bool
+@A              ...... frt:5 fra:5 frb:5 frc:5 ..... rc:1       &A
+
 &D              rt ra si:int64_t
 @D              ...... rt:5 ra:5 si:s16                 &D
 
@@ -308,6 +311,10 @@ STFDU           110111 ..... ...... ...............     @D
 STFDX           011111 ..... ...... .... 1011010111 -   @X
 STFDUX          011111 ..... ...... .... 1011110111 -   @X
 
+### Floating-Point Select Instruction
+
+FSEL            111111 ..... ..... ..... ..... 10111 .  @A
+
 ### Move To/From System Register Instructions
 
 SETBC           011111 ..... ..... ----- 0110000000 -   @X_bi
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index cfb27bd020..f9b58b844e 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -222,8 +222,34 @@ static void gen_frsqrtes(DisasContext *ctx)
     tcg_temp_free_i64(t1);
 }
 
-/* fsel */
-_GEN_FLOAT_ACB(sel, 0x3F, 0x17, 0, PPC_FLOAT_FSEL);
+static bool trans_FSEL(DisasContext *ctx, arg_A *a)
+{
+    TCGv_i64 t0, t1, t2;
+
+    REQUIRE_INSNS_FLAGS(ctx, FLOAT_FSEL);
+    REQUIRE_FPU(ctx);
+
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
+    t2 = tcg_temp_new_i64();
+
+    get_fpr(t0, a->fra);
+    get_fpr(t1, a->frb);
+    get_fpr(t2, a->frc);
+
+    gen_helper_FSEL(t0, t0, t1, t2);
+    set_fpr(a->frt, t0);
+    if (a->rc) {
+        gen_set_cr1_from_fpscr(ctx);
+    }
+
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+    tcg_temp_free_i64(t2);
+
+    return true;
+}
+
 /* fsub - fsubs */
 GEN_FLOAT_AB(sub, 0x14, 0x000007C0, 1, PPC_FLOAT);
 /* Optional: */
diff --git a/target/ppc/translate/fp-ops.c.inc b/target/ppc/translate/fp-ops.c.inc
index 4260635a12..0538ab2d2d 100644
--- a/target/ppc/translate/fp-ops.c.inc
+++ b/target/ppc/translate/fp-ops.c.inc
@@ -24,7 +24,6 @@ GEN_FLOAT_AC(mul, 0x19, 0x0000F800, 1, PPC_FLOAT),
 GEN_FLOAT_BS(re, 0x3F, 0x18, 1, PPC_FLOAT_EXT),
 GEN_FLOAT_BS(res, 0x3B, 0x18, 1, PPC_FLOAT_FRES),
 GEN_FLOAT_BS(rsqrte, 0x3F, 0x1A, 1, PPC_FLOAT_FRSQRTE),
-_GEN_FLOAT_ACB(sel, sel, 0x3F, 0x17, 0, 0, PPC_FLOAT_FSEL),
 GEN_FLOAT_AB(sub, 0x14, 0x000007C0, 1, PPC_FLOAT),
 GEN_FLOAT_ACB(madd, 0x1D, 1, PPC_FLOAT),
 GEN_FLOAT_ACB(msub, 0x1C, 1, PPC_FLOAT),
-- 
2.36.1


