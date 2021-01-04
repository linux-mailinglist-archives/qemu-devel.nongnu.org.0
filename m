Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 583532E9FFB
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 23:26:20 +0100 (CET)
Received: from localhost ([::1]:50228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwYIt-000333-E9
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 17:26:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwY5u-0007YM-0o
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 17:12:54 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:37218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwY5r-00080w-Sf
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 17:12:53 -0500
Received: by mail-wr1-x430.google.com with SMTP id i9so33650761wrc.4
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 14:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b89sinWdwnRaR4NOd/DWOz5P627eErMVEbtVQAm5vR4=;
 b=mFQ66HgUEH1VSy7mQoonZ6iC92jq6SdwfXdQ5Nxf5fDEDXepk+1HxvHqAJteeLSbly
 jBKbwBvdO6zTIY3ZnwZpTB45rnm95qpc8kXk1jJsG8Y2Si6t92rInjLkGp5IbRKMS/Mi
 EQgzp5/nNtMcBwySLyuUL0r/uXLTmhIwQJtpW/dadfupidr9nmDSqagwu2rQT8eSqesX
 UQRpomHH94cTXKc3oVVrH7PcRsuWif4DUFZewadI4t27lkVWLiO6/Zs6iGdzrrPvG3QB
 u9Jgf1J500rvRoCutiteYmKlaUy1bgQ48pxB6hiKcO5A8rbbAA4YrsWRsZtI9xXPuGEP
 nmBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=b89sinWdwnRaR4NOd/DWOz5P627eErMVEbtVQAm5vR4=;
 b=D3LYZ1hgZZcSKw20Byg8wVSKVGSdK1pB2PANECtXZo3ZunCkixqAdiS1/TGfUegHuy
 +xuA8NukHqrK3RML/Pc6+2M54iKwZ3HFe1CIrYyN5MNIaG1JsUMDqMCeHN50MPBshibc
 Mz8lVkQXfifixex6VzICQz8OMdqbB+wzP4NhbpmDbB9O+x4jHgke5K+QFM4DHioeahiH
 m9bw1ML14CkLPVH3yP8iC7APcFFJXYJWbxlMRkNi5q0hevSe3+NYXCXTaZ/grhYJ3xYt
 ZdrWTFJhps8CBYFIm8X3Nb5nYaa24GJKcq+KOuofjLpdmTHJmtuVAxPeMk4wZ0r5Lm92
 BZRw==
X-Gm-Message-State: AOAM533UeCEYT9X6oMp/4XG0U0jNhkFan2AOl2w4VGqXHwdrcCvY/gEH
 ggBOOuCL7ffm4dp4gH8bEx39q2bgcd4=
X-Google-Smtp-Source: ABdhPJyZzr40x+ZZbPMqjzlXIzRjSJz5ZeXla1+uHP/pg2bEXS5guMqjKr/y4nyNnDsdWqqviFXVDQ==
X-Received: by 2002:a5d:40ce:: with SMTP id b14mr80470579wrq.350.1609798370305; 
 Mon, 04 Jan 2021 14:12:50 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id m8sm1021961wmc.27.2021.01.04.14.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 14:12:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/15] target/mips/mips-defs: Use ISA_MIPS32R6 definition
 to check Release 6
Date: Mon,  4 Jan 2021 23:11:49 +0100
Message-Id: <20210104221154.3127610-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210104221154.3127610-1-f4bug@amsat.org>
References: <20210104221154.3127610-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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
 Paul Burton <paulburton@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the single ISA_MIPS32R6 definition to check if the Release 6
ISA is supported, whether the CPU support 32/64-bit.

For now we keep '32' in the definition name, we will rename it
as ISA_MIPS_R6 in few commits.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h     | 2 +-
 target/mips/mips-defs.h    | 3 +--
 linux-user/mips/cpu_loop.c | 3 +--
 target/mips/helper.c       | 6 +++---
 target/mips/translate.c    | 2 +-
 5 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index e4d2d9f44f9..3466725b761 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -354,7 +354,7 @@ static inline void compute_hflags(CPUMIPSState *env)
     } else if (((env->hflags & MIPS_HFLAG_KSU) == MIPS_HFLAG_UM) &&
                !(env->CP0_Status & (1 << CP0St_UX))) {
         env->hflags |= MIPS_HFLAG_AWRAP;
-    } else if (env->insn_flags & ISA_MIPS64R6) {
+    } else if (env->insn_flags & ISA_MIPS32R6) {
         /* Address wrapping for Supervisor and Kernel is specified in R6 */
         if ((((env->hflags & MIPS_HFLAG_KSU) == MIPS_HFLAG_SM) &&
              !(env->CP0_Status & (1 << CP0St_SX))) ||
diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index b71127ddd7c..fea547508f0 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -21,7 +21,6 @@
 #define ISA_MIPS32R3      0x0000000000000200ULL
 #define ISA_MIPS32R5      0x0000000000000800ULL
 #define ISA_MIPS32R6      0x0000000000002000ULL
-#define ISA_MIPS64R6      0x0000000000004000ULL
 #define ISA_NANOMIPS32    0x0000000000008000ULL
 /*
  *   bits 24-39: MIPS ASEs
@@ -87,7 +86,7 @@
 
 /* MIPS Technologies "Release 6" */
 #define CPU_MIPS32R6    (CPU_MIPS32R5 | ISA_MIPS32R6)
-#define CPU_MIPS64R6    (CPU_MIPS64R5 | CPU_MIPS32R6 | ISA_MIPS64R6)
+#define CPU_MIPS64R6    (CPU_MIPS64R5 | CPU_MIPS32R6)
 
 /* Wave Computing: "nanoMIPS" */
 #define CPU_NANOMIPS32  (CPU_MIPS32R6 | ISA_NANOMIPS32)
diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index f0831379cc4..e400166c583 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -385,8 +385,7 @@ void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
     prog_req.fre &= interp_req.fre;
 
     bool cpu_has_mips_r2_r6 = env->insn_flags & ISA_MIPS32R2 ||
-                              env->insn_flags & ISA_MIPS32R6 ||
-                              env->insn_flags & ISA_MIPS64R6;
+                              env->insn_flags & ISA_MIPS32R6;
 
     if (prog_req.fre && !prog_req.frdefault && !prog_req.fr1) {
         env->CP0_Config5 |= (1 << CP0C5_FRE);
diff --git a/target/mips/helper.c b/target/mips/helper.c
index 87296fbad69..5b74815beb0 100644
--- a/target/mips/helper.c
+++ b/target/mips/helper.c
@@ -1145,7 +1145,7 @@ void mips_cpu_do_interrupt(CPUState *cs)
  enter_debug_mode:
         if (env->insn_flags & ISA_MIPS3) {
             env->hflags |= MIPS_HFLAG_64;
-            if (!(env->insn_flags & ISA_MIPS64R6) ||
+            if (!(env->insn_flags & ISA_MIPS32R6) ||
                 env->CP0_Status & (1 << CP0St_KX)) {
                 env->hflags &= ~MIPS_HFLAG_AWRAP;
             }
@@ -1174,7 +1174,7 @@ void mips_cpu_do_interrupt(CPUState *cs)
         env->CP0_Status |= (1 << CP0St_ERL) | (1 << CP0St_BEV);
         if (env->insn_flags & ISA_MIPS3) {
             env->hflags |= MIPS_HFLAG_64;
-            if (!(env->insn_flags & ISA_MIPS64R6) ||
+            if (!(env->insn_flags & ISA_MIPS32R6) ||
                 env->CP0_Status & (1 << CP0St_KX)) {
                 env->hflags &= ~MIPS_HFLAG_AWRAP;
             }
@@ -1360,7 +1360,7 @@ void mips_cpu_do_interrupt(CPUState *cs)
             env->CP0_Status |= (1 << CP0St_EXL);
             if (env->insn_flags & ISA_MIPS3) {
                 env->hflags |= MIPS_HFLAG_64;
-                if (!(env->insn_flags & ISA_MIPS64R6) ||
+                if (!(env->insn_flags & ISA_MIPS32R6) ||
                     env->CP0_Status & (1 << CP0St_KX)) {
                     env->hflags &= ~MIPS_HFLAG_AWRAP;
                 }
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 9fc9dedf30d..fc93b9da8eb 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -31438,7 +31438,7 @@ static void mips_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 #else
         ctx->mem_idx = hflags_mmu_index(ctx->hflags);
 #endif
-    ctx->default_tcg_memop_mask = (ctx->insn_flags & (ISA_MIPS32R6 | ISA_MIPS64R6 |
+    ctx->default_tcg_memop_mask = (ctx->insn_flags & (ISA_MIPS32R6 |
                                   INSN_LOONGSON3A)) ? MO_UNALN : MO_ALIGN;
 
     LOG_DISAS("\ntb %p idx %d hflags %04x\n", ctx->base.tb, ctx->mem_idx,
-- 
2.26.2


