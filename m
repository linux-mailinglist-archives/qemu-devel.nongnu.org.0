Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E2D4DBE7F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:35:51 +0100 (CET)
Received: from localhost ([::1]:58356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUine-0007b2-Qy
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:35:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiL7-0001X0-Al
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:06:22 -0400
Received: from [2607:f8b0:4864:20::52f] (port=37416
 helo=mail-pg1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiL5-0002KK-8M
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:06:21 -0400
Received: by mail-pg1-x52f.google.com with SMTP id bc27so1807560pgb.4
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LTuw5YwD7AAqbGDKsXNMlzx47tIusaHPWNHDAjQuUEg=;
 b=NPqF158vK+0L/hv2+LevvVR3YYj+7OEu3k5hteB8CzgY6ICEz6SU2daAoCy0QmhAb3
 rdw4rXrhAbQVQMDYgX20Srm12BwPpdOIdBvd5z+n14YrOZPKe+P53VF2VixxjRSGsOaM
 L7S1jPn+PWEg7k5v8eLpyTsjGfK6TbJ5CTV3SihNUveTgH+u0Y+tb7w/2ydQeNpnH8h+
 2fombKzE3EUBUSNj4T9oJpzF6IBLRs5h5LAspuvxzZs7HjusveHmjsZRxUJ7XaTJMCm+
 Pixijz45fpl3X/Q7HRc/+9+oOHBuBxs+5oSY981M/if/1llKiJ86AH+ykqGysHaqJ99I
 BEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LTuw5YwD7AAqbGDKsXNMlzx47tIusaHPWNHDAjQuUEg=;
 b=kX9XbB9qrsY3iDlzHy8m6/6MawP3npLxkpMTyxzmmCMY11STNxDiXx3xURcp5RxTOv
 qkS1DGTMtL1t/hWToDO/1eQKDOSqZLG57OfTzJgU7s8acFltF5h5hmgWtY2dLgaEp2ls
 /CYxhQbo1VVcOLOcPjPp6P4LUMaMQjX4svMh/lR7tcYoAsR0dppHI4tFvgM4Is5qrUcw
 DFcaIgyMJhoHitO60IJ8pj4WL/prHfeDdOz8EgJqM1my9Nvm2hkYssvpHaPLyGQjVE95
 S78PsXKBAMIuZ2VsAuTkyuOdG1UwKQs6sFUPwOepcRUF8qI/Ps/GXeQi9I3L/djDxvNl
 AxaQ==
X-Gm-Message-State: AOAM530NrgNbhDbCl9GTtoc2k9J/hWmiAfxbOr2rLLEMxZns0SfpvKzu
 Gl5NfOa2PwD2o/dXQe1KPKQmfoBnXQGbBA==
X-Google-Smtp-Source: ABdhPJy7bkSabokcNJuD9r4uti2Y4acPVfv7OgIP16A+2ow7RgI9EwZ/fewqNEAqaXSw7sYsfUwB3A==
X-Received: by 2002:a63:944:0:b0:374:5324:eea1 with SMTP id
 65-20020a630944000000b003745324eea1mr2308753pgj.366.1647493577345; 
 Wed, 16 Mar 2022 22:06:17 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056a001a5600b004f7c17b291asm5101357pfv.87.2022.03.16.22.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:06:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 39/51] target/nios2: Implement Misaligned
 destination exception
Date: Wed, 16 Mar 2022 22:05:26 -0700
Message-Id: <20220317050538.924111-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Indirect branches, plus eret and bret optionally raise
an exception when branching to a misaligned address.
The exception is required when an mmu is enabled, but
enable it always because the fallback behaviour is not
documented (though presumably it discards low bits).

For the purposes of the linux-user cpu loop, if EXCP_UNALIGN
(misaligned data) were to arrive, it would be treated the
same as EXCP_UNALIGND (misaligned destination).  See the
!defined(CONFIG_NIOS2_ALIGNMENT_TRAP) block in kernel/traps.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/nios2/cpu_loop.c |  6 ++++++
 target/nios2/op_helper.c    |  9 ++++++++-
 target/nios2/translate.c    | 15 ++++++++++++++-
 3 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index ea364b7d1f..67220128aa 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -43,6 +43,12 @@ void cpu_loop(CPUNios2State *env)
             force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTDIV, env->pc);
             break;
 
+        case EXCP_UNALIGN:
+        case EXCP_UNALIGND:
+            force_sig_fault(TARGET_SIGBUS, TARGET_BUS_ADRALN,
+                            env->ctrl[CR_BADADDR]);
+            break;
+
         case EXCP_TRAP:
             switch (env->error_code) {
             case 0:
diff --git a/target/nios2/op_helper.c b/target/nios2/op_helper.c
index c93b66c9aa..849867becd 100644
--- a/target/nios2/op_helper.c
+++ b/target/nios2/op_helper.c
@@ -64,6 +64,13 @@ uint32_t helper_divu(CPUNios2State *env, uint32_t num, uint32_t den)
 void helper_eret(CPUNios2State *env, uint32_t new_status, uint32_t new_pc)
 {
     Nios2CPU *cpu = env_archcpu(env);
+    CPUState *cs = env_cpu(env);
+
+    if (unlikely(new_pc & 3)) {
+        env->ctrl[CR_BADADDR] = new_pc;
+        cs->exception_index = EXCP_UNALIGND;
+        cpu_loop_exit_restore(cs, GETPC());
+    }
 
     /*
      * Both estatus and bstatus have no constraints on write;
@@ -74,6 +81,6 @@ void helper_eret(CPUNios2State *env, uint32_t new_status, uint32_t new_pc)
 
     env->ctrl[CR_STATUS] = new_status;
     env->pc = new_pc;
-    cpu_loop_exit(env_cpu(env));
+    cpu_loop_exit(cs);
 }
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index f7bab0908b..1e784c8a37 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -170,11 +170,24 @@ static void gen_goto_tb(DisasContext *dc, int n, uint32_t dest)
 
 static void gen_jumpr(DisasContext *dc, int regno, bool is_call)
 {
-    tcg_gen_mov_tl(cpu_pc, load_gpr(dc, regno));
+    TCGLabel *l = gen_new_label();
+    TCGv test = tcg_temp_new();
+    TCGv dest = load_gpr(dc, regno);
+
+    tcg_gen_andi_tl(test, dest, 3);
+    tcg_gen_brcondi_tl(TCG_COND_NE, test, 0, l);
+    tcg_temp_free(test);
+
+    tcg_gen_mov_tl(cpu_pc, dest);
     if (is_call) {
         tcg_gen_movi_tl(dest_gpr(dc, R_RA), dc->base.pc_next);
     }
     tcg_gen_lookup_and_goto_ptr();
+
+    gen_set_label(l);
+    tcg_gen_st_tl(dest, cpu_env, offsetof(CPUNios2State, ctrl[CR_BADADDR]));
+    t_gen_helper_raise_exception(dc, EXCP_UNALIGND);
+
     dc->base.is_jmp = DISAS_NORETURN;
 }
 
-- 
2.25.1


