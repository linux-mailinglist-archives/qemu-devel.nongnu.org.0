Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BCB31B1C2
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:03:37 +0100 (CET)
Received: from localhost ([::1]:41078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBLk7-00011U-FG
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:03:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLgJ-0006uN-4x
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 12:59:39 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:55100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLgH-0004C9-FZ
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 12:59:38 -0500
Received: by mail-wm1-x32d.google.com with SMTP id w4so4199208wmi.4
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 09:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HIH/Qop6/6k2YrFoaMsBXNf5uQCyB+f+6cDo/DLbLyU=;
 b=L1Djrp3EmgbzHIb9r6F91UvVAePOJ/KUe4GuUJBeAGuwcZyHN5VBxSdq0eXUD/xixr
 pFZZpt6TmYL0dQjyTFwRRUZWIuhjvNRuIGvdFXsAf/rxZyyAaOy5Bm8sP9gSz4vc2U6V
 GCfwNfVSUbKzTxdmwWdNrqHaTtIcJTH5Fe5f6tx2qA01N0rw9ZUrBcCZWPqAxHzrMlek
 LTiHE3yaJe9VNCQPHEtfw5U1S6gA9xGzdd/rolWwG3qZZBul/lkqCiAAraIi1pELOQla
 LiVASQrWvwkcwkTVWXX6slCf7Oa81fUPwgz6+k/WbdSC2CHsAoOrqPyAq1eQ6waJ7u3Z
 tSvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HIH/Qop6/6k2YrFoaMsBXNf5uQCyB+f+6cDo/DLbLyU=;
 b=pNbOv2QAlRpWCVE5NJiK2+Zshbpn/LlMocBUYJcjGfjfIeUILc/PHjhGw4m1XUC4ke
 3BL8i0nTiu65xAhy1n0LmuWmb2QNBS8+VI88SgHtdC40MD9IT40RnLK9ylrO/cl2kDaL
 Af/IkSuDGDxuNN6IiYWQ8bnbPTTAt01vXgDIUY9u9FkJXh/LT/BTamHs5nmoalE1YcyJ
 mnqc+FE7XM/isNqjH1GltIAo0EpzFOb8evr8DRm0npsnW1LQrn4+V6LgegR1AMYv0pc4
 xAKV+o7/5GzZTazc8R7D9k7/R8ZmmdOIdLjs+0ZovmmBftYP/1tiDq1ZfyQkKpfPZoIS
 wMUQ==
X-Gm-Message-State: AOAM532ENwXweYNGCUUb55q6za9hWDdHkeygtpAqcnzufRz5XRhlOd8O
 IGR9A9ghM4WEk9y10aYVMw1p7Ce0G2k=
X-Google-Smtp-Source: ABdhPJxjyYAK7SwPuJeEvhFYA0TmuZjoBKYRb2sGkIQOfU5UnSO9osfJhX8zMVAtRehqs1Oy3tGo+Q==
X-Received: by 2002:a1c:20cf:: with SMTP id
 g198mr10723222wmg.173.1613325575777; 
 Sun, 14 Feb 2021 09:59:35 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o83sm22544318wme.37.2021.02.14.09.59.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 09:59:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 04/42] target/mips: Promote 128-bit multimedia registers
 as global ones
Date: Sun, 14 Feb 2021 18:58:34 +0100
Message-Id: <20210214175912.732946-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
References: <20210214175912.732946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Fredrik Noring <noring@nocrew.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The cpu::mmr[] array contains the upper halves of 128-bit GPR
registers. While they are only used by the R5900 CPU, the
concept is generic and could be used by another MIPS implementation.

Rename 'cpu::mmr' as 'cpu::gpr_hi' and make them global.

When the code is similar to the GPR lower halves, move it
close by.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu.h       | 10 ++++++---
 target/mips/translate.h |  3 +++
 target/mips/translate.c | 48 ++++++++++++++++++++---------------------
 3 files changed, 34 insertions(+), 27 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index b9e227a30e9..7011d0dc707 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -460,6 +460,13 @@ typedef struct mips_def_t mips_def_t;
 typedef struct TCState TCState;
 struct TCState {
     target_ulong gpr[32];
+#if defined(TARGET_MIPS64)
+    /*
+     * For CPUs using 128-bit GPR registers, we put the lower halves in gpr[])
+     * and the upper halves in gpr_hi[].
+     */
+    uint64_t gpr_hi[32];
+#endif /* TARGET_MIPS64 */
     target_ulong PC;
     target_ulong HI[MIPS_DSP_ACC];
     target_ulong LO[MIPS_DSP_ACC];
@@ -505,9 +512,6 @@ struct TCState {
 
     float_status msa_fp_status;
 
-    /* Upper 64-bit MMRs (multimedia registers); the lower 64-bit are GPRs */
-    uint64_t mmr[32];
-
 #define NUMBER_OF_MXU_REGISTERS 16
     target_ulong mxu_gpr[NUMBER_OF_MXU_REGISTERS - 1];
     target_ulong mxu_cr;
diff --git a/target/mips/translate.h b/target/mips/translate.h
index 2a1d8f570bb..3014c20cadb 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -145,6 +145,9 @@ bool gen_lsa(DisasContext *ctx, int rd, int rt, int rs, int sa);
 bool gen_dlsa(DisasContext *ctx, int rd, int rt, int rs, int sa);
 
 extern TCGv cpu_gpr[32], cpu_PC;
+#if defined(TARGET_MIPS64)
+extern TCGv_i64 cpu_gpr_hi[32];
+#endif
 extern TCGv cpu_HI[MIPS_DSP_ACC], cpu_LO[MIPS_DSP_ACC];
 extern TCGv_i32 fpu_fcr0, fpu_fcr31;
 extern TCGv_i64 fpu_f64[32];
diff --git a/target/mips/translate.c b/target/mips/translate.c
index be40f79229f..ab9b0999c93 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -2179,6 +2179,11 @@ enum {
 
 /* global register indices */
 TCGv cpu_gpr[32], cpu_PC;
+/*
+ * For CPUs using 128-bit GPR registers, we put the lower halves in cpu_gpr[])
+ * and the upper halves in cpu_gpr_hi[].
+ */
+TCGv_i64 cpu_gpr_hi[32];
 TCGv cpu_HI[MIPS_DSP_ACC], cpu_LO[MIPS_DSP_ACC];
 static TCGv cpu_dspctrl, btarget;
 TCGv bcond;
@@ -2187,11 +2192,6 @@ static TCGv_i32 hflags;
 TCGv_i32 fpu_fcr0, fpu_fcr31;
 TCGv_i64 fpu_f64[32];
 
-#if defined(TARGET_MIPS64)
-/* Upper halves of R5900's 128-bit registers: MMRs (multimedia registers) */
-static TCGv_i64 cpu_mmr[32];
-#endif
-
 #if !defined(TARGET_MIPS64)
 /* MXU registers */
 static TCGv mxu_gpr[NUMBER_OF_MXU_REGISTERS - 1];
@@ -24784,7 +24784,7 @@ static void gen_mmi_pcpyh(DisasContext *ctx)
         /* nop */
     } else if (rt == 0) {
         tcg_gen_movi_i64(cpu_gpr[rd], 0);
-        tcg_gen_movi_i64(cpu_mmr[rd], 0);
+        tcg_gen_movi_i64(cpu_gpr_hi[rd], 0);
     } else {
         TCGv_i64 t0 = tcg_temp_new();
         TCGv_i64 t1 = tcg_temp_new();
@@ -24802,7 +24802,7 @@ static void gen_mmi_pcpyh(DisasContext *ctx)
 
         tcg_gen_mov_i64(cpu_gpr[rd], t1);
 
-        tcg_gen_andi_i64(t0, cpu_mmr[rt], mask);
+        tcg_gen_andi_i64(t0, cpu_gpr_hi[rt], mask);
         tcg_gen_movi_i64(t1, 0);
         tcg_gen_or_i64(t1, t0, t1);
         tcg_gen_shli_i64(t0, t0, 16);
@@ -24812,7 +24812,7 @@ static void gen_mmi_pcpyh(DisasContext *ctx)
         tcg_gen_shli_i64(t0, t0, 16);
         tcg_gen_or_i64(t1, t0, t1);
 
-        tcg_gen_mov_i64(cpu_mmr[rd], t1);
+        tcg_gen_mov_i64(cpu_gpr_hi[rd], t1);
 
         tcg_temp_free(t0);
         tcg_temp_free(t1);
@@ -24844,9 +24844,9 @@ static void gen_mmi_pcpyld(DisasContext *ctx)
         /* nop */
     } else {
         if (rs == 0) {
-            tcg_gen_movi_i64(cpu_mmr[rd], 0);
+            tcg_gen_movi_i64(cpu_gpr_hi[rd], 0);
         } else {
-            tcg_gen_mov_i64(cpu_mmr[rd], cpu_gpr[rs]);
+            tcg_gen_mov_i64(cpu_gpr_hi[rd], cpu_gpr[rs]);
         }
         if (rt == 0) {
             tcg_gen_movi_i64(cpu_gpr[rd], 0);
@@ -24885,13 +24885,13 @@ static void gen_mmi_pcpyud(DisasContext *ctx)
         if (rs == 0) {
             tcg_gen_movi_i64(cpu_gpr[rd], 0);
         } else {
-            tcg_gen_mov_i64(cpu_gpr[rd], cpu_mmr[rs]);
+            tcg_gen_mov_i64(cpu_gpr[rd], cpu_gpr_hi[rs]);
         }
         if (rt == 0) {
-            tcg_gen_movi_i64(cpu_mmr[rd], 0);
+            tcg_gen_movi_i64(cpu_gpr_hi[rd], 0);
         } else {
             if (rd != rt) {
-                tcg_gen_mov_i64(cpu_mmr[rd], cpu_mmr[rt]);
+                tcg_gen_mov_i64(cpu_gpr_hi[rd], cpu_gpr_hi[rt]);
             }
         }
     }
@@ -29285,6 +29285,16 @@ void mips_tcg_init(void)
                                         offsetof(CPUMIPSState,
                                                  active_tc.gpr[i]),
                                         regnames[i]);
+#if defined(TARGET_MIPS64)
+    cpu_gpr_hi[0] = NULL;
+
+    for (unsigned i = 1; i < 32; i++) {
+        cpu_gpr_hi[i] = tcg_global_mem_new_i64(cpu_env,
+                                               offsetof(CPUMIPSState,
+                                                        active_tc.gpr_hi[i]),
+                                               regnames[i]);
+    }
+#endif /* !TARGET_MIPS64 */
     for (i = 0; i < 32; i++) {
         int off = offsetof(CPUMIPSState, active_fpu.fpr[i].wr.d[0]);
 
@@ -29323,16 +29333,6 @@ void mips_tcg_init(void)
     cpu_llval = tcg_global_mem_new(cpu_env, offsetof(CPUMIPSState, llval),
                                    "llval");
 
-#if defined(TARGET_MIPS64)
-    cpu_mmr[0] = NULL;
-    for (i = 1; i < 32; i++) {
-        cpu_mmr[i] = tcg_global_mem_new_i64(cpu_env,
-                                            offsetof(CPUMIPSState,
-                                                     active_tc.mmr[i]),
-                                            regnames[i]);
-    }
-#endif
-
 #if !defined(TARGET_MIPS64)
     for (i = 0; i < NUMBER_OF_MXU_REGISTERS - 1; i++) {
         mxu_gpr[i] = tcg_global_mem_new(cpu_env,
@@ -29344,7 +29344,7 @@ void mips_tcg_init(void)
     mxu_CR = tcg_global_mem_new(cpu_env,
                                 offsetof(CPUMIPSState, active_tc.mxu_cr),
                                 mxuregnames[NUMBER_OF_MXU_REGISTERS - 1]);
-#endif
+#endif /* !TARGET_MIPS64 */
 }
 
 void restore_state_to_opc(CPUMIPSState *env, TranslationBlock *tb,
-- 
2.26.2


