Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F263F2EE936
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:52:35 +0100 (CET)
Received: from localhost ([::1]:57342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxe8x-0006hi-07
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:52:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdkq-0004l1-JD
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:27:40 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:45335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdkm-0006SO-F3
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:27:37 -0500
Received: by mail-wr1-x432.google.com with SMTP id d26so7090894wrb.12
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ccUqeFnMhpxujrGGkccrptJlKtmDtdTT+pOY6u5+VKc=;
 b=N4aGvCIOqt6CVFIXHJSDbWRRmNKXYi5aAKh0HCKgGogOmTgieiFSpq+BWLMvbxACeN
 vZbQWVf0588aGrJ2dpI7cqUslHllqItH25MgxkIaFbgItkDAprY/tJr1V/fc7Ld5bTNz
 saZHeQtYCOIY0J8ifGDHNOad9iw4oZkF0T5A5M2n3BbBuTywnnyFcEmz5s/5JZlHbQ0t
 C80xezTdCuxN9F7qHZKxXmVA2PbPLsu+O51yRelc4KmxqDEMvyz0HcbQw3Wt21rHB76U
 h35YaXzjHVvcGcVd4UPHwVfhTCL2aiNAMzkkZEd+R8l1TBo6iNK4l4DYj1osfQkLybPu
 jTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ccUqeFnMhpxujrGGkccrptJlKtmDtdTT+pOY6u5+VKc=;
 b=BIAevgeANJqWRWPqModTSuNrBIgZuCmI7XiIYtT/Uu/hPC5bPKsfE7VMUtuAV8iw7K
 NQxz1rGMYOpUF01mO4JxYNrrSvRDAdOfBxsMm76Y/8fhapGZKRGbYMv62ZYxewlgBcQe
 LUrO1FsjBNniid5J9bQach+A3dEEpyeOVaggH4aU/mE7J5nmnRooIj1hcEllgsSVyBwI
 Uxd0dc2MmHGxmtoXAqiOM1UJVg2IpwINcatlRoKXdYe5N3n3WBfTNcuImn1PZz0UN701
 oqFWZc00OcthsDGB0H9NAKHIWXB2x5dyUrEN0yrVjEtSP3FRRYN4zJXBahuMxwIpYk5W
 8elw==
X-Gm-Message-State: AOAM533hDMwWocH6seQfehmQU3y70GpZ0kGBPC3wzmx8afEINnKM/a8A
 0WWQuGcrH2atD1qSi9h3uy41sNivMZk=
X-Google-Smtp-Source: ABdhPJxQWmRIx7MeLpcmbSI97z96a23zdfgCxvCqjxgZWoVHageDGrXX0id/exUl0a/Cule2yoD4TA==
X-Received: by 2002:a5d:6cad:: with SMTP id a13mr639387wra.275.1610058454893; 
 Thu, 07 Jan 2021 14:27:34 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id h16sm9920371wrq.29.2021.01.07.14.27.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:27:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 54/66] target/mips: Extract LSA/DLSA translation generators
Date: Thu,  7 Jan 2021 23:22:41 +0100
Message-Id: <20210107222253.20382-55-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract gen_lsa() from translate.c and explode it as
gen_LSA() and gen_DLSA().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201215225757.764263-22-f4bug@amsat.org>
---
 target/mips/translate.h            |  6 +++
 target/mips/translate.c            | 35 ++---------------
 target/mips/translate_addr_const.c | 61 ++++++++++++++++++++++++++++++
 target/mips/meson.build            |  1 +
 4 files changed, 72 insertions(+), 31 deletions(-)
 create mode 100644 target/mips/translate_addr_const.c

diff --git a/target/mips/translate.h b/target/mips/translate.h
index 35e9c4cd135..50281c93369 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -129,6 +129,12 @@ void gen_load_fpr64(DisasContext *ctx, TCGv_i64 t, int reg);
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
index 3da12e31351..e9730d95131 100644
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
             check_insn(ctx, ISA_MIPS_R6);
-            gen_lsa(ctx, OPC_LSA, rd, rs, rt,
-                    extract32(ctx->opcode, 9, 2));
+            gen_LSA(ctx, rd, rt, rs, extract32(ctx->opcode, 9, 2));
             break;
         case ALIGN:
             check_insn(ctx, ISA_MIPS_R6);
@@ -21460,8 +21434,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                  * amount, meaning that the supported shift values are in
                  * the range 0 to 3 (instead of 1 to 4 in MIPSR6).
                  */
-                gen_lsa(ctx, OPC_LSA, rd, rs, rt,
-                        extract32(ctx->opcode, 9, 2) - 1);
+                gen_LSA(ctx, rd, rt, rs, extract32(ctx->opcode, 9, 2) - 1);
                 break;
             case NM_EXTW:
                 gen_ext(ctx, 32, rd, rs, rt, extract32(ctx->opcode, 6, 5));
@@ -24347,7 +24320,7 @@ static void decode_opc_special_r6(CPUMIPSState *env, DisasContext *ctx)
     op1 = MASK_SPECIAL(ctx->opcode);
     switch (op1) {
     case OPC_LSA:
-        gen_lsa(ctx, op1, rd, rs, rt, extract32(ctx->opcode, 6, 2));
+        gen_LSA(ctx, rd, rt, rs, extract32(ctx->opcode, 6, 2));
         break;
     case OPC_MULT:
     case OPC_MULTU:
@@ -24401,7 +24374,7 @@ static void decode_opc_special_r6(CPUMIPSState *env, DisasContext *ctx)
 #if defined(TARGET_MIPS64)
     case OPC_DLSA:
         check_mips_64(ctx);
-        gen_lsa(ctx, op1, rd, rs, rt, extract32(ctx->opcode, 6, 2));
+        gen_DLSA(ctx, rd, rt, rs, extract32(ctx->opcode, 6, 2));
         break;
     case R6_OPC_DCLO:
     case R6_OPC_DCLZ:
diff --git a/target/mips/translate_addr_const.c b/target/mips/translate_addr_const.c
new file mode 100644
index 00000000000..1c6f61c3dd2
--- /dev/null
+++ b/target/mips/translate_addr_const.c
@@ -0,0 +1,61 @@
+/*
+ * Address Computation and Large Constant Instructions
+ *
+ *  Copyright (c) 2004-2005 Jocelyn Mayer
+ *  Copyright (c) 2006 Marius Groeger (FPU operations)
+ *  Copyright (c) 2006 Thiemo Seufer (MIPS32R2 support)
+ *  Copyright (c) 2009 CodeSourcery (MIPS16 and microMIPS support)
+ *  Copyright (c) 2012 Jia Liu & Dongxue Zhang (MIPS ASE DSP support)
+ *  Copyright (c) 2020 Philippe Mathieu-Daudé
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
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
index e6285abd044..9afee0ca955 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -17,6 +17,7 @@
   'op_helper.c',
   'tlb_helper.c',
   'translate.c',
+  'translate_addr_const.c',
 ))
 mips_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
 
-- 
2.26.2


