Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A622D3594
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 22:53:21 +0100 (CET)
Received: from localhost ([::1]:54046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmkv0-0005Dw-0g
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 16:53:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmjjd-0004D7-DF
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 15:37:21 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:40186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmjjb-0008EE-Am
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 15:37:21 -0500
Received: by mail-ej1-x644.google.com with SMTP id x16so26522806ejj.7
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 12:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WW5ygfjHXiaQo8ZvKmUiJ8hTGBDDSiw6zv7qR9vmlSo=;
 b=pNkWTgSMldp5Qb8ezh4NixCSrsSrkspKmpwta3vP0nDSN093pg2sRCGIPHWWFPSIC6
 nCYz2NK4be4Tx66FsWIWWGVrXUwj8jFWt0W1qroIU9jhBC5M+7bdrtprjUpMy0+WZpk+
 tgd509bk05mdNzX5zIQuv7Zgjx3QvilrQAP9Xr/zD/tf8hlUaGPprTWmqTXpVRKA0RXR
 yM0+6oTMmzR+h7pkx4YAFfNMP1dOWVc8wAHLPZ/OnfVy7y9cogQvFZZSLKynEly27Qqq
 5APPt0H9d4jk9LVVWfXH7NDXt1MPEi077E8VUM0BP17KmLJXzk6qb92NduNs2Q/P02DF
 L2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WW5ygfjHXiaQo8ZvKmUiJ8hTGBDDSiw6zv7qR9vmlSo=;
 b=fySgzILavOJNZkf/3v1PB5cASzu6JpoUPb3A/NCjT17uXJ/mNSBwLkgSxcGrzY83xH
 I9DzbCDRyKL0zSv0Rk62IBBhSblg2YisJZZJS9YRMZkF6SatgKp0a2gVKNwBdJ90VlRK
 1/APMQ/848PIDd5C7hnyuznTgrWP7M8A2xrSsT08XoD+jVDtwJK1epylwARscxFv/aNf
 A1C25hYc8uMkB6Ca4wPPYtB50r7tsBgsz8ESMMBvWpOIoy/x6KIu2hnv2GrPOf1EFx8x
 uVvczceYjGSjtIlaDUVZuvleyxbMenhbggVvedwA2gvKzLsb5Qo5jGRCB7eoXr0FNw52
 McWQ==
X-Gm-Message-State: AOAM531uuu8D/7dB/M1kLlVQ5JjreUlOCOChSIy9pp7LoyR/aEStGPZ1
 Lc49OVkgzAAbY8oM3ldM0ZX+G7Q3DtY=
X-Google-Smtp-Source: ABdhPJyBxO9N4qJSOweMgPJXqE+mE59RqDCAsJHyJ1O+BEOe4HFlXIvyh175Io12acH7Z+M0RmiK5g==
X-Received: by 2002:a17:906:9441:: with SMTP id
 z1mr25743773ejx.288.1607459837570; 
 Tue, 08 Dec 2020 12:37:17 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id u15sm19240436edt.24.2020.12.08.12.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 12:37:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/13] target/mips: Extract LSA/DLSA translation generators
Date: Tue,  8 Dec 2020 21:36:53 +0100
Message-Id: <20201208203704.243704-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201208203704.243704-1-f4bug@amsat.org>
References: <20201208203704.243704-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x644.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract gen_lsa() from translate.c and explode it as
gen_LSA() and gen_DLSA().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.h            |  8 +++++
 target/mips/translate.c            | 35 +++----------------
 target/mips/translate_addr_const.c | 54 ++++++++++++++++++++++++++++++
 target/mips/meson.build            |  1 +
 4 files changed, 67 insertions(+), 31 deletions(-)
 create mode 100644 target/mips/translate_addr_const.c

diff --git a/target/mips/translate.h b/target/mips/translate.h
index da88387418c..4eb218e2c9f 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -63,6 +63,14 @@ void gen_base_offset_addr(DisasContext *ctx, TCGv addr, int base, int offset);
 void gen_load_gpr(TCGv t, int reg);
 void gen_store_gpr(TCGv t, int reg);
 
+/*
+ * Address Computation and Large Constant Instructions
+ */
+bool gen_LSA(DisasContext *ctx, int rd, int rt, int rs, int sa);
+#if defined(TARGET_MIPS64)
+bool gen_DLSA(DisasContext *ctx, int rd, int rt, int rs, int sa);
+#endif
+
 extern TCGv cpu_gpr[32], cpu_PC;
 extern TCGv bcond;
 
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 3c7307233c9..752a06afa21 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -6624,31 +6624,6 @@ static void gen_bshfl(DisasContext *ctx, uint32_t op2, int rt, int rd)
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
@@ -16504,8 +16479,7 @@ static void decode_micromips32_opc(CPUMIPSState *env, DisasContext *ctx)
             return;
         case LSA:
             check_insn(ctx, ISA_MIPS32R6);
-            gen_lsa(ctx, OPC_LSA, rd, rs, rt,
-                    extract32(ctx->opcode, 9, 2));
+            gen_LSA(ctx, rd, rs, rt, extract32(ctx->opcode, 9, 2));
             break;
         case ALIGN:
             check_insn(ctx, ISA_MIPS32R6);
@@ -21468,8 +21442,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                  * amount, meaning that the supported shift values are in
                  * the range 0 to 3 (instead of 1 to 4 in MIPSR6).
                  */
-                gen_lsa(ctx, OPC_LSA, rd, rs, rt,
-                        extract32(ctx->opcode, 9, 2) - 1);
+                gen_LSA(ctx, rd, rs, rt, extract32(ctx->opcode, 9, 2) - 1);
                 break;
             case NM_EXTW:
                 gen_ext(ctx, 32, rd, rs, rt, extract32(ctx->opcode, 6, 5));
@@ -24355,7 +24328,7 @@ static void decode_opc_special_r6(CPUMIPSState *env, DisasContext *ctx)
     op1 = MASK_SPECIAL(ctx->opcode);
     switch (op1) {
     case OPC_LSA:
-        gen_lsa(ctx, op1, rd, rs, rt, extract32(ctx->opcode, 6, 2));
+        gen_LSA(ctx, rd, rs, rt, extract32(ctx->opcode, 6, 2));
         break;
     case OPC_MULT:
     case OPC_MULTU:
@@ -24409,7 +24382,7 @@ static void decode_opc_special_r6(CPUMIPSState *env, DisasContext *ctx)
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
index 00000000000..e6da5c66544
--- /dev/null
+++ b/target/mips/translate_addr_const.c
@@ -0,0 +1,54 @@
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
+#if defined(TARGET_MIPS64)
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
+#endif /* TARGET_MIPS64 */
diff --git a/target/mips/meson.build b/target/mips/meson.build
index 7d0414bbe23..9e42c341a90 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -15,6 +15,7 @@
   'mod-msa_helper.c',
 
   'translate.c',
+  'translate_addr_const.c',
   'mod-msa_translate.c',
 ))
 mips_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
-- 
2.26.2


