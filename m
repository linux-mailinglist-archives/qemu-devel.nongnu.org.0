Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEFD370DE3
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 18:24:03 +0200 (CEST)
Received: from localhost ([::1]:33344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldEt0-0003dg-6A
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 12:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEm3-0005he-6u
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:16:51 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldElx-0007XV-9J
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:16:50 -0400
Received: by mail-wr1-x42f.google.com with SMTP id t18so3110058wry.1
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 09:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q9wnhp0A3R7EoBRYlMJ/eiPyIrdG3fRM7mBr849A7fc=;
 b=omJ3CBORaWBn6d3tt88wKL+2rQFnMIxlPfLl29nVxXeFDnwBYf0u28D6dGbeK4XcNJ
 pus0QC+u6ZDQMQqqlF9xrzQ1S16Skq+cFwlxwMnjbJTOx59ZyPD/5kEMYeGur2H4QqUu
 C5s1X7K1LBLqWuZyj01RhFLiCIeLk/wsLKje/YKKF0m28kfg9OgXB4fWmDVLFgzshX3V
 WFuGDgy7PxJGCYQDmjoi70bbHH8GHrshjHx7QRCT+dZadR1JETlcleFcVtvprjMtFEXu
 YwdxcHmTAslV1qwjPQ9PG5j4PXZmGrY5vuYdB6dlSpJR/Ioj45tEMPXrcO4SS1LT16oC
 n2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=q9wnhp0A3R7EoBRYlMJ/eiPyIrdG3fRM7mBr849A7fc=;
 b=c7kA2vLT8PKloPRkvumjCdvNpxHE/gIcUf9zS31UBJpFgTEwuO+yfnAH9p1nReL8zm
 Q6t/Mlc1aZDc1RrdcnUOSYeQBX9pYWUcLQPVFRNndiPIa+Hty2uhxw5DZDagHJl1fcA9
 N0QOn0EjxuXxUimGNs3NFPOUnoKbLuWm/zWZW0jDVhh399DzT4ZqTBE+xR1GsfPbZyAZ
 WpVI/vT+JfTSXlITm8PdAGh/FVAgXgzcjsskS6SlviQl4EcXuRs34p3hM+CrQSF4Yhbo
 qnxbFjCHna/2aYY8CF0Hl3z3fQwF6mc5fA6iGNAgx8DqMnctRoeuQhe7FEZ7NvZHKpJa
 6ETg==
X-Gm-Message-State: AOAM532AScn7VMnd/pZ/eG4e0ujAqgo+7aW+LBJUUY6k9zMH9agq9CYl
 O27+00Ci+uqKmeJU2glm/t6MuT6GWAo55/T/
X-Google-Smtp-Source: ABdhPJzwzGTnFhBj2ZWjJ+fqTjw6mtVkdq52MJub06zDrNFLOI1eCL/X0bqAUm6V6bFGzznBvAScKg==
X-Received: by 2002:a5d:4386:: with SMTP id i6mr14558919wrq.207.1619972202297; 
 Sun, 02 May 2021 09:16:42 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id m67sm22132157wme.27.2021.05.02.09.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 09:16:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/36] target/mips: Restrict mips_cpu_dump_state() to cpu.c
Date: Sun,  2 May 2021 18:15:14 +0200
Message-Id: <20210502161538.534038-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210502161538.534038-1-f4bug@amsat.org>
References: <20210502161538.534038-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As mips_cpu_dump_state() is only used once to initialize the
CPUClass::dump_state handler, we can move it to cpu.c to keep
it symbol local.
Beside, this handler is used by all accelerators, while the
translate.c file targets TCG.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210428170410.479308-7-f4bug@amsat.org>
---
 target/mips/internal.h  |  1 -
 target/mips/cpu.c       | 77 +++++++++++++++++++++++++++++++++++++++++
 target/mips/translate.c | 77 -----------------------------------------
 3 files changed, 77 insertions(+), 78 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 37f54a8b3fc..57072a941e7 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -79,7 +79,6 @@ extern const int mips_defs_number;
 
 void mips_cpu_do_interrupt(CPUState *cpu);
 bool mips_cpu_exec_interrupt(CPUState *cpu, int int_req);
-void mips_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr mips_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int mips_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int mips_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index ed9552ebeb7..232f701b836 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -145,6 +145,83 @@ void cpu_mips_store_cause(CPUMIPSState *env, target_ulong val)
 
 #endif /* !CONFIG_USER_ONLY */
 
+static void fpu_dump_state(CPUMIPSState *env, FILE *f, int flags)
+{
+    int i;
+    int is_fpu64 = !!(env->hflags & MIPS_HFLAG_F64);
+
+#define printfpr(fp)                                                    \
+    do {                                                                \
+        if (is_fpu64)                                                   \
+            qemu_fprintf(f, "w:%08x d:%016" PRIx64                      \
+                         " fd:%13g fs:%13g psu: %13g\n",                \
+                         (fp)->w[FP_ENDIAN_IDX], (fp)->d,               \
+                         (double)(fp)->fd,                              \
+                         (double)(fp)->fs[FP_ENDIAN_IDX],               \
+                         (double)(fp)->fs[!FP_ENDIAN_IDX]);             \
+        else {                                                          \
+            fpr_t tmp;                                                  \
+            tmp.w[FP_ENDIAN_IDX] = (fp)->w[FP_ENDIAN_IDX];              \
+            tmp.w[!FP_ENDIAN_IDX] = ((fp) + 1)->w[FP_ENDIAN_IDX];       \
+            qemu_fprintf(f, "w:%08x d:%016" PRIx64                      \
+                         " fd:%13g fs:%13g psu:%13g\n",                 \
+                         tmp.w[FP_ENDIAN_IDX], tmp.d,                   \
+                         (double)tmp.fd,                                \
+                         (double)tmp.fs[FP_ENDIAN_IDX],                 \
+                         (double)tmp.fs[!FP_ENDIAN_IDX]);               \
+        }                                                               \
+    } while (0)
+
+
+    qemu_fprintf(f,
+                 "CP1 FCR0 0x%08x  FCR31 0x%08x  SR.FR %d  fp_status 0x%02x\n",
+                 env->active_fpu.fcr0, env->active_fpu.fcr31, is_fpu64,
+                 get_float_exception_flags(&env->active_fpu.fp_status));
+    for (i = 0; i < 32; (is_fpu64) ? i++ : (i += 2)) {
+        qemu_fprintf(f, "%3s: ", fregnames[i]);
+        printfpr(&env->active_fpu.fpr[i]);
+    }
+
+#undef printfpr
+}
+
+static void mips_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+{
+    MIPSCPU *cpu = MIPS_CPU(cs);
+    CPUMIPSState *env = &cpu->env;
+    int i;
+
+    qemu_fprintf(f, "pc=0x" TARGET_FMT_lx " HI=0x" TARGET_FMT_lx
+                 " LO=0x" TARGET_FMT_lx " ds %04x "
+                 TARGET_FMT_lx " " TARGET_FMT_ld "\n",
+                 env->active_tc.PC, env->active_tc.HI[0], env->active_tc.LO[0],
+                 env->hflags, env->btarget, env->bcond);
+    for (i = 0; i < 32; i++) {
+        if ((i & 3) == 0) {
+            qemu_fprintf(f, "GPR%02d:", i);
+        }
+        qemu_fprintf(f, " %s " TARGET_FMT_lx,
+                     regnames[i], env->active_tc.gpr[i]);
+        if ((i & 3) == 3) {
+            qemu_fprintf(f, "\n");
+        }
+    }
+
+    qemu_fprintf(f, "CP0 Status  0x%08x Cause   0x%08x EPC    0x"
+                 TARGET_FMT_lx "\n",
+                 env->CP0_Status, env->CP0_Cause, env->CP0_EPC);
+    qemu_fprintf(f, "    Config0 0x%08x Config1 0x%08x LLAddr 0x%016"
+                 PRIx64 "\n",
+                 env->CP0_Config0, env->CP0_Config1, env->CP0_LLAddr);
+    qemu_fprintf(f, "    Config2 0x%08x Config3 0x%08x\n",
+                 env->CP0_Config2, env->CP0_Config3);
+    qemu_fprintf(f, "    Config4 0x%08x Config5 0x%08x\n",
+                 env->CP0_Config4, env->CP0_Config5);
+    if ((flags & CPU_DUMP_FPU) && (env->hflags & MIPS_HFLAG_FPU)) {
+        fpu_dump_state(env, f, flags);
+    }
+}
+
 static const char * const excp_names[EXCP_LAST + 1] = {
     [EXCP_RESET] = "reset",
     [EXCP_SRESET] = "soft reset",
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 8d686e90954..f0ae3716022 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -25586,83 +25586,6 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
     translator_loop(&mips_tr_ops, &ctx.base, cs, tb, max_insns);
 }
 
-static void fpu_dump_state(CPUMIPSState *env, FILE * f, int flags)
-{
-    int i;
-    int is_fpu64 = !!(env->hflags & MIPS_HFLAG_F64);
-
-#define printfpr(fp)                                                    \
-    do {                                                                \
-        if (is_fpu64)                                                   \
-            qemu_fprintf(f, "w:%08x d:%016" PRIx64                      \
-                         " fd:%13g fs:%13g psu: %13g\n",                \
-                         (fp)->w[FP_ENDIAN_IDX], (fp)->d,               \
-                         (double)(fp)->fd,                              \
-                         (double)(fp)->fs[FP_ENDIAN_IDX],               \
-                         (double)(fp)->fs[!FP_ENDIAN_IDX]);             \
-        else {                                                          \
-            fpr_t tmp;                                                  \
-            tmp.w[FP_ENDIAN_IDX] = (fp)->w[FP_ENDIAN_IDX];              \
-            tmp.w[!FP_ENDIAN_IDX] = ((fp) + 1)->w[FP_ENDIAN_IDX];       \
-            qemu_fprintf(f, "w:%08x d:%016" PRIx64                      \
-                         " fd:%13g fs:%13g psu:%13g\n",                 \
-                         tmp.w[FP_ENDIAN_IDX], tmp.d,                   \
-                         (double)tmp.fd,                                \
-                         (double)tmp.fs[FP_ENDIAN_IDX],                 \
-                         (double)tmp.fs[!FP_ENDIAN_IDX]);               \
-        }                                                               \
-    } while (0)
-
-
-    qemu_fprintf(f,
-                 "CP1 FCR0 0x%08x  FCR31 0x%08x  SR.FR %d  fp_status 0x%02x\n",
-                 env->active_fpu.fcr0, env->active_fpu.fcr31, is_fpu64,
-                 get_float_exception_flags(&env->active_fpu.fp_status));
-    for (i = 0; i < 32; (is_fpu64) ? i++ : (i += 2)) {
-        qemu_fprintf(f, "%3s: ", fregnames[i]);
-        printfpr(&env->active_fpu.fpr[i]);
-    }
-
-#undef printfpr
-}
-
-void mips_cpu_dump_state(CPUState *cs, FILE *f, int flags)
-{
-    MIPSCPU *cpu = MIPS_CPU(cs);
-    CPUMIPSState *env = &cpu->env;
-    int i;
-
-    qemu_fprintf(f, "pc=0x" TARGET_FMT_lx " HI=0x" TARGET_FMT_lx
-                 " LO=0x" TARGET_FMT_lx " ds %04x "
-                 TARGET_FMT_lx " " TARGET_FMT_ld "\n",
-                 env->active_tc.PC, env->active_tc.HI[0], env->active_tc.LO[0],
-                 env->hflags, env->btarget, env->bcond);
-    for (i = 0; i < 32; i++) {
-        if ((i & 3) == 0) {
-            qemu_fprintf(f, "GPR%02d:", i);
-        }
-        qemu_fprintf(f, " %s " TARGET_FMT_lx,
-                     regnames[i], env->active_tc.gpr[i]);
-        if ((i & 3) == 3) {
-            qemu_fprintf(f, "\n");
-        }
-    }
-
-    qemu_fprintf(f, "CP0 Status  0x%08x Cause   0x%08x EPC    0x"
-                 TARGET_FMT_lx "\n",
-                 env->CP0_Status, env->CP0_Cause, env->CP0_EPC);
-    qemu_fprintf(f, "    Config0 0x%08x Config1 0x%08x LLAddr 0x%016"
-                 PRIx64 "\n",
-                 env->CP0_Config0, env->CP0_Config1, env->CP0_LLAddr);
-    qemu_fprintf(f, "    Config2 0x%08x Config3 0x%08x\n",
-                 env->CP0_Config2, env->CP0_Config3);
-    qemu_fprintf(f, "    Config4 0x%08x Config5 0x%08x\n",
-                 env->CP0_Config4, env->CP0_Config5);
-    if ((flags & CPU_DUMP_FPU) && (env->hflags & MIPS_HFLAG_FPU)) {
-        fpu_dump_state(env, f, flags);
-    }
-}
-
 void mips_tcg_init(void)
 {
     int i;
-- 
2.26.3


