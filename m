Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 637D850BEFE
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:46:53 +0200 (CEST)
Received: from localhost ([::1]:49450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhxMq-0001Up-HM
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:46:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhway-0000Hf-NU
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:25 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:43825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwax-00082x-28
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:24 -0400
Received: by mail-il1-x12a.google.com with SMTP id d3so5401038ilr.10
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EjEvoq47mgxbhwOkPjY+lzICTw8tSYJC5nzrZvKsO9E=;
 b=FalRuS1Y6G1SjwvS1cPRF/QIC4KyHeeeVlsyg21EGL6tr+XQLuM49LDTRwu/5fklvK
 HoBGlSTKQM3wipHZ6L/VwSbFgcvm9m6VgLVqAQza/BPgtnHfZccgR+JlQMUJiLbKzGe7
 qaQ5s4qmkrt1njsCD3c/IFI4sVenLKxI3bPR1xhLcNkVB/23h0MUALaJjx0jQR/tZEqq
 q49usOgp18s7LP10h4eOuYtHR/eZ+SIpLBWXv4IgZhAEqiKa/OCKKE4IwOfbLyR+8LzD
 fw0AbMPBEB+O/s8Al/1/zlWBCgMoTMmvRshNEbnlljXnrQIUWBBt9GQuV3KKMI0tpli7
 MOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EjEvoq47mgxbhwOkPjY+lzICTw8tSYJC5nzrZvKsO9E=;
 b=W2OgeHn3DBqJQELEl8/VRbM+QJA+PQFOwb3A+KbSHbVrnkVPvMCshSuZrUYvfsyr9i
 0YKovdgV/rQJdsERcxrdXUM0ztYcINujXVCGw8uetNrhtIQailsjQ7JMKsB8mThkyCls
 rewoKHFsVsLqQdW7ECAOV321PVzkvc0SM9uzWkpJ2A162DVqiZ3OMHlqYKywWRTZ0nNZ
 VTm8BM9cr7Vdwy+yTm+LhydUxojxajxHazqjXOwSOAyGxbLvoFwrENRLkVCRLTU+4HU2
 /ldfUszWCSMOw3du1Tvs615G9CbzV1wz0qtVVg42CCF7QOt1RhKarVrFUJm0zG9L691n
 1u0Q==
X-Gm-Message-State: AOAM532SroLeudslcyfDunLUsE4VhQTMCqWCF586AUC433dbPibEjqrU
 NsJjUhzfayRT3j2x+NIxeZlvJiwb1r1qFk/y
X-Google-Smtp-Source: ABdhPJwC3ecVGo3wsidrkiYJ/bLnwjlPXjTUhJp1UvaZn5PiY6Ue5N64P6RF/IgKFdnDs7b9vLxnrw==
X-Received: by 2002:a05:6e02:1202:b0:2cb:b25e:3a8b with SMTP id
 a2-20020a056e02120200b002cbb25e3a8bmr2283838ilq.88.1650646641944; 
 Fri, 22 Apr 2022 09:57:21 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a6b8b17000000b00649a2634725sm816380iod.17.2022.04.22.09.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:57:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 56/68] target/nios2: Implement Misaligned destination
 exception
Date: Fri, 22 Apr 2022 09:52:26 -0700
Message-Id: <20220422165238.1971496-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-53-richard.henderson@linaro.org>
---
 linux-user/nios2/cpu_loop.c |  6 ++++++
 target/nios2/op_helper.c    |  9 ++++++++-
 target/nios2/translate.c    | 15 ++++++++++++++-
 3 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index 11ecb71843..30a27f252b 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -42,6 +42,12 @@ void cpu_loop(CPUNios2State *env)
             force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTDIV, env->pc);
             break;
 
+        case EXCP_UNALIGN:
+        case EXCP_UNALIGND:
+            force_sig_fault(TARGET_SIGBUS, TARGET_BUS_ADRALN,
+                            env->ctrl[CR_BADADDR]);
+            break;
+
         case EXCP_TRAP:
             /*
              * TODO: This advance should be done in the translator, as
diff --git a/target/nios2/op_helper.c b/target/nios2/op_helper.c
index a19b504b0e..38a71a1f2d 100644
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
index a3e87beba4..794b763d8a 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -197,11 +197,24 @@ static void gen_goto_tb(DisasContext *dc, int n, uint32_t dest)
 
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
2.34.1


