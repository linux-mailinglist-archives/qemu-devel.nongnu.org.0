Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1752DB701
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 00:14:54 +0100 (CET)
Received: from localhost ([::1]:49350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpJWv-0001CS-5C
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 18:14:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJIX-0006Lc-IG
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 18:00:01 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:44851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJIV-00048r-N7
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 18:00:01 -0500
Received: by mail-ej1-x642.google.com with SMTP id w1so25386236ejf.11
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 14:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RTK7vnM8yZ9pd7ko0y63TgIf7i/lwwx22Mz5QVVeyms=;
 b=mNDsCxxVkA38BJJ4dFTHZ5i4yiqLD5ltE5zPeBuh79tnEF2Q1mbSTUzlorrcgrk9A/
 pQLL5DSdO2USHXfm+rMPndWmabYivHkzMamGvsqtc2lxhnCxAg2upF65GXnjQTKaptwo
 RX0lyWJiCqzLGi7S8V+Vtz1FT+om9Iqh79ucEfe09h0t5zzYXpbRwhk2jG86ZHkdTW4L
 fD+Ll5pYJfbqARP7Nmfb9rOsAZSnivQbgiNRLpL93fLX4fTGgcnlHho3iRff/MQi9bHn
 wTyE3WDjafOG+OpMy+rdkDylSKjpccPFfsAyW0yrnRk+YlAVMbMDJP1CMVglYteA3TRp
 z53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RTK7vnM8yZ9pd7ko0y63TgIf7i/lwwx22Mz5QVVeyms=;
 b=AS0dSqPlS2EPDO9mkAJY+jkF145Xnh8OhP7PwYQ0Ecm02EeW2eCijka3CYRselE8qx
 Whs55dXJZvGyRzg0nRMRJ/eDHudQmIj8az9qgbPeBXNY7I8ACMONFKQkpu8BRru6QEMN
 5KJNTDxidT1VZSqSMv++09FnI/l28a+RiJ/t722hSlW0EVati2NEwqBrKuSIfC1UAxAu
 QAFZd0WUgML/3PW3YwCHtWD1Sn4bi+xa84SkJSO8pLM/HROZ3LplbklUr+VyebO4MxlQ
 FKJld+FKISWzb1bwLVVJ7pm1OPQhQZp+rtvFtc1uArvWPq9x6wsgdaxlWoJpf0SOlRjK
 R/kQ==
X-Gm-Message-State: AOAM5310LmyexS/oy13UOG79BwWx2v7y3z0K5SrCElifHbiWt58Pevwn
 eayl7QCWMmk3ZtGsIU2Ymrl5LkklCq4gWw==
X-Google-Smtp-Source: ABdhPJx6VLQ5b5Wq+eHCClr3sqEYcaE/VngDekbuTBbX2Bi6JiMo+wLolfnX46abCl0XDrkibiOSdQ==
X-Received: by 2002:a17:907:3e85:: with SMTP id
 hs5mr7927654ejc.548.1608073198420; 
 Tue, 15 Dec 2020 14:59:58 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id g18sm19140308edt.2.2020.12.15.14.59.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 14:59:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 21/24] target/mips: Extract LSA/DLSA translation generators
Date: Tue, 15 Dec 2020 23:57:54 +0100
Message-Id: <20201215225757.764263-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201215225757.764263-1-f4bug@amsat.org>
References: <20201215225757.764263-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x642.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract gen_lsa() from translate.c and explode it as
gen_LSA() and gen_DLSA().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.h            |  6 ++++
 target/mips/translate.c            | 35 +++-----------------
 target/mips/translate_addr_const.c | 52 ++++++++++++++++++++++++++++++
 target/mips/meson.build            |  1 +
 4 files changed, 63 insertions(+), 31 deletions(-)
 create mode 100644 target/mips/translate_addr_const.c

diff --git a/target/mips/translate.h b/target/mips/translate.h
index 8d84e0c254d..47129de81d9 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -128,6 +128,12 @@ void gen_load_fpr64(DisasContext *ctx, TCGv_i64 t, int reg);
 void gen_store_fpr64(DisasContext *ctx, TCGv_i64 t, int reg);
 int get_fp_bit(int cc);
 
+/*
+ * Address Computation and Large Constant Instructions
+ */
+bool gen_LSA(DisasContext *ctx, int rd, int rt, int rs, int sa);
+bool gen_DLSA(DisasContext *ctx, int rd, int rt, int rs, int sa);
+
 extern TCGv cpu_gpr[32], cpu_PC;
 extern TCGv_i32 fpu_fcr0, fpu_fcr31;
 extern TCGv_i64 fpu_f64[32];
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 2ce3dc10dfb..e0439ba92d8 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -6616,31 +6616,6 @@ static void gen_bshfl(DisasContext *ctx, uint32_t op2, int rt, int rd)
     tcg_temp_free(t0);
 }
 
-static void gen_lsa(DisasContext *ctx, int opc, int rd, int rs, int rt,
-                    int imm2)
-{
-    TCGv t0;
-    TCGv t1;
-    if (rd == 0) {
-        /* Treat as NOP. */
-        return;
-    }
-    t0 = tcg_temp_new();
-    t1 = tcg_temp_new();
-    gen_load_gpr(t0, rs);
-    gen_load_gpr(t1, rt);
-    tcg_gen_shli_tl(t0, t0, imm2 + 1);
-    tcg_gen_add_tl(cpu_gpr[rd], t0, t1);
-    if (opc == OPC_LSA) {
-        tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
-    }
-
-    tcg_temp_free(t1);
-    tcg_temp_free(t0);
-
-    return;
-}
-
 static void gen_align_bits(DisasContext *ctx, int wordsz, int rd, int rs,
                            int rt, int bits)
 {
@@ -16496,8 +16471,7 @@ static void decode_micromips32_opc(CPUMIPSState *env, DisasContext *ctx)
             return;
         case LSA:
             check_insn(ctx, ISA_MIPS32R6);
-            gen_lsa(ctx, OPC_LSA, rd, rs, rt,
-                    extract32(ctx->opcode, 9, 2));
+            gen_LSA(ctx, rd, rs, rt, extract32(ctx->opcode, 9, 2));
             break;
         case ALIGN:
             check_insn(ctx, ISA_MIPS32R6);
@@ -21460,8 +21434,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                  * amount, meaning that the supported shift values are in
                  * the range 0 to 3 (instead of 1 to 4 in MIPSR6).
                  */
-                gen_lsa(ctx, OPC_LSA, rd, rs, rt,
-                        extract32(ctx->opcode, 9, 2) - 1);
+                gen_LSA(ctx, rd, rs, rt, extract32(ctx->opcode, 9, 2) - 1);
                 break;
             case NM_EXTW:
                 gen_ext(ctx, 32, rd, rs, rt, extract32(ctx->opcode, 6, 5));
@@ -24347,7 +24320,7 @@ static void decode_opc_special_r6(CPUMIPSState *env, DisasContext *ctx)
     op1 = MASK_SPECIAL(ctx->opcode);
     switch (op1) {
     case OPC_LSA:
-        gen_lsa(ctx, op1, rd, rs, rt, extract32(ctx->opcode, 6, 2));
+        gen_LSA(ctx, rd, rs, rt, extract32(ctx->opcode, 6, 2));
         break;
     case OPC_MULT:
     case OPC_MULTU:
@@ -24401,7 +24374,7 @@ static void decode_opc_special_r6(CPUMIPSState *env, DisasContext *ctx)
 #if defined(TARGET_MIPS64)
     case OPC_DLSA:
         check_mips_64(ctx);
-        gen_lsa(ctx, op1, rd, rs, rt, extract32(ctx->opcode, 6, 2));
+        gen_DLSA(ctx, rd, rs, rt, extract32(ctx->opcode, 6, 2));
         break;
     case R6_OPC_DCLO:
     case R6_OPC_DCLZ:
diff --git a/target/mips/translate_addr_const.c b/target/mips/translate_addr_const.c
new file mode 100644
index 00000000000..84662933d49
--- /dev/null
+++ b/target/mips/translate_addr_const.c
@@ -0,0 +1,52 @@
+/*
+ * Address Computation and Large Constant Instructions
+ */
+#include "qemu/osdep.h"
+#include "tcg/tcg-op.h"
+#include "translate.h"
+
+bool gen_LSA(DisasContext *ctx, int rd, int rt, int rs, int sa)
+{
+    TCGv t0;
+    TCGv t1;
+
+    if (rd == 0) {
+        /* Treat as NOP. */
+        return true;
+    }
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+    gen_load_gpr(t0, rs);
+    gen_load_gpr(t1, rt);
+    tcg_gen_shli_tl(t0, t0, sa + 1);
+    tcg_gen_add_tl(cpu_gpr[rd], t0, t1);
+    tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
+
+    tcg_temp_free(t1);
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+bool gen_DLSA(DisasContext *ctx, int rd, int rt, int rs, int sa)
+{
+    TCGv t0;
+    TCGv t1;
+
+    check_mips_64(ctx);
+
+    if (rd == 0) {
+        /* Treat as NOP. */
+        return true;
+    }
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+    gen_load_gpr(t0, rs);
+    gen_load_gpr(t1, rt);
+    tcg_gen_shli_tl(t0, t0, sa + 1);
+    tcg_gen_add_tl(cpu_gpr[rd], t0, t1);
+    tcg_temp_free(t1);
+    tcg_temp_free(t0);
+
+    return true;
+}
diff --git a/target/mips/meson.build b/target/mips/meson.build
index 5ccc9ddc6b8..dce0ca96527 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -16,6 +16,7 @@
   'mod-msa_helper.c',
   'tlb_helper.c',
   'translate.c',
+  'translate_addr_const.c',
   'mod-msa_translate.c',
 ))
 mips_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
-- 
2.26.2


