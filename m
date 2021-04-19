Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6BA364A96
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 21:30:02 +0200 (CEST)
Received: from localhost ([::1]:52256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYZar-0001YW-92
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 15:30:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYZQ9-0006hS-Us
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:18:57 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:43994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYZQ7-0001AN-Vt
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:18:57 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 u5-20020a7bcb050000b029010e9316b9d5so18657307wmj.2
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 12:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HEDVE1BH0ASPFbPC+pm0317mb0q/DhypvkeSRH/j5kw=;
 b=l/rJB4kC+GQ0hplUwDmreH0u5fXwYF8uxn7F+7CvbRTo7ULAbIofpQwm2680rldK3W
 6GON0K8WR+g9Cze4lR6tbgmTpjFqy7N//w5EovPDN3cUwl8qVT2oadvzQCpDkzyLhjim
 K5fqpfdstjXwL/tVFWfywXQOFz+srSPu+6VkfIVB4UZyJm7IhXL3xFbu3Gxrq/JUTu2w
 ys4orrleJmQLFfwq29VWNAriYp/1WZQAx8s55G97m6E/hhsSBcPm8CkM7e5OovI/ujrt
 vKYOowKsURHvfKRFXtfk5YoBzckbJznibncKrYiEnI4gayOIRqbN5CCQteyxVcbw5vVS
 KUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HEDVE1BH0ASPFbPC+pm0317mb0q/DhypvkeSRH/j5kw=;
 b=ma7zYRLAq0OH0QNaBmNygqaf+x6XSqHuNqhnZwOzuZntbhricLWdRh7Y44MKFjBWky
 F/VoLlc3Pkeg8o2pRKw57F2DKLGKz4p0FAcurRaHoBWD/tSNE8J5A4SgoUXVfe/pXkHn
 70ph8NyT6qbTf/fqnqJQG/n5PgRgwAhUD4BAfoE/w2iX85ePqnYtEXBfJs9oq20jbajW
 HrBpcFmXN5qIF+4Oj1SS+gyRLU4pPM0us0leTLgi9v5x3oDwT/19UZW6Gl+3UnG7+3H8
 0khuKzrrz1N8SIYIErjFi4WFw9Ih7nPWgWBcP06mLSa2mTf1eLsoY2IE79nikvbWNEGe
 3omw==
X-Gm-Message-State: AOAM53148GhT9lu7rMwPLKTu7Td+enAvxQb5DB8hrhdImd3jR3HTjFxP
 X1+NH0wkP2Ui0nMxIIcLdgHhzjJQu+B7bQ==
X-Google-Smtp-Source: ABdhPJyxlBsL0bkvwa1jdZFcWjast6omKSyWlkrWrcgaYYM5x1twxsdtJzospcTs+bDozcGkbH+8Cg==
X-Received: by 2002:a1c:4186:: with SMTP id o128mr546632wma.141.1618859934276; 
 Mon, 19 Apr 2021 12:18:54 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id n9sm488089wmo.27.2021.04.19.12.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 12:18:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/30] target/mips: Restrict mips_cpu_dump_state() to cpu.c
Date: Mon, 19 Apr 2021 21:17:59 +0200
Message-Id: <20210419191823.1555482-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210419191823.1555482-1-f4bug@amsat.org>
References: <20210419191823.1555482-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
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
index f99d4d4016d..8702f9220be 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -25579,83 +25579,6 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
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


