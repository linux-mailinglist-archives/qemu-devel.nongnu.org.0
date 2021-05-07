Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 228AE37619D
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 10:03:12 +0200 (CEST)
Received: from localhost ([::1]:41712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1levS3-0001nL-83
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 04:03:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ziqiaokong@gmail.com>)
 id 1levQs-0000n5-QS
 for qemu-devel@nongnu.org; Fri, 07 May 2021 04:01:58 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:44012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ziqiaokong@gmail.com>)
 id 1levQq-0001qn-ML
 for qemu-devel@nongnu.org; Fri, 07 May 2021 04:01:58 -0400
Received: by mail-pf1-x432.google.com with SMTP id e15so7030271pfv.10
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 01:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x4Tn1xSq9dKtzkOI7roVCs2R/sm5bx/TxJOzPWdBIDo=;
 b=rVV7mvZWF1+73m9uk6h4/0lbXHkadcBt7XWnPxhJmOMOLtmrf+KvZaqp3nBL22UqG6
 RM+SFVqs4oewJEPRaFaEske8D6HLnj1E+Z/ZZ4L4T5KV5qi3Z0V4QW7DBn7mkoWfVxjk
 Qfi9l08QDGedYPzGhvkzrvitoyAcGrM2inRb7Hzcjftg18gWDz6+aiI7v8rNQ9g7+Hb3
 zuueeTJsYtTQ4ktZkZEXr/QcD9c8wNarezmudM3cwXsf3IRr7dq5JPphVFgW9cZgDz5v
 cmmg39T8bqukBVqxEwOEV+hNnu9FYLXUkbwDGpSiOvVVyCQMg+tGwKdfHkVdi3HR2jlC
 mUkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x4Tn1xSq9dKtzkOI7roVCs2R/sm5bx/TxJOzPWdBIDo=;
 b=My2XQH2DFwQxq8MlCFOn5vhJgRbEUbLQVc6zibdL4V0hnJoWt0lZx1GFFaItX1AUOU
 1tiiFlWf/kY6TOWppZ0UPgc98r1BeUfgJZstkaKuNxUydlv2rL03akSEGOboUNBZy3wp
 NDspp+zCjvy3B/RBbPezrdT6d1DsdwXGG21XQ3TOAheHXNy/++MFMASRK0Q+Q2/xIx1U
 CfqgS40vS9etgbrSYwANedhua6D61I/cYZd2GPC1CNNgWb69VJlDbht2Alx3XYJx5Z4q
 zurC5Zqz85t9t4azdk1wQURVfspUsSPjMI9AoMzgvET80hyDMg41GgYQnerjdfn1TS/8
 lYnQ==
X-Gm-Message-State: AOAM530cE8MyxPRmqmmZaO6cERp0Py/4ZcJnGibsR+JHr+aY45gf04jo
 DccJI04W2n0wBpwB1C5ac8RGXIHyKQIsKITd
X-Google-Smtp-Source: ABdhPJx8ukaY+b6dzmH9S+e5tSQpNgZkWsv8srAvCEByqwTyDNoTJ6/F6eU/NlZbycBfMaM5iXkQXg==
X-Received: by 2002:a62:3787:0:b029:25a:d5da:27a9 with SMTP id
 e129-20020a6237870000b029025ad5da27a9mr9231470pfa.81.1620374514968; 
 Fri, 07 May 2021 01:01:54 -0700 (PDT)
Received: from localhost.localdomain ([104.160.18.162])
 by smtp.gmail.com with ESMTPSA id j9sm3751620pfc.193.2021.05.07.01.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 01:01:54 -0700 (PDT)
From: Ziqiao Kong <ziqiaokong@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/2] target/i386: Correct implementation for FCS, FIP,
 FDS and FDP
Date: Fri,  7 May 2021 16:00:58 +0800
Message-Id: <20210507080055.258563-2-ziqiaokong@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210507080055.258563-1-ziqiaokong@gmail.com>
References: <20210507080055.258563-1-ziqiaokong@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=ziqiaokong@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, ehabkost@redhat.com,
 Ziqiao Kong <ziqiaokong@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes since v3:
 - Split the long patches to series to make review easier.
 - Fix the coding style problems in v3.

Changes since v2:
 - Change the sequence of fpcs, fpds, fpip and fpdp in CPUX86State.
 - Use stl instead of stw in do_fstenv.
 - Move variables to floats instruction case block.
 - Move last accessed memory operand to a temp variable to avoid another load.
 - Move segment selectors instead of segment base to fpcs and fpds.
 - Fix some code stype problems for the original code in floats case block.

Signed-off-by: Ziqiao Kong <ziqiaokong@gmail.com>
---
 target/i386/cpu.h            |  4 +++
 target/i386/tcg/fpu_helper.c | 48 ++++++++++++++++++++++--------------
 target/i386/tcg/translate.c  | 45 ++++++++++++++++++++++++++++++++-
 3 files changed, 77 insertions(+), 20 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 570f916878..241945320b 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -705,6 +705,8 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define CPUID_7_0_EBX_INVPCID           (1U << 10)
 /* Restricted Transactional Memory */
 #define CPUID_7_0_EBX_RTM               (1U << 11)
+/* Deprecates FPU CS and FPU DS values */
+#define CPUID_7_0_EBX_FCS_FDS           (1U << 13)
 /* Memory Protection Extension */
 #define CPUID_7_0_EBX_MPX               (1U << 14)
 /* AVX-512 Foundation */
@@ -1440,6 +1442,8 @@ typedef struct CPUX86State {
     FPReg fpregs[8];
     /* KVM-only so far */
     uint16_t fpop;
+    uint16_t fpcs;
+    uint16_t fpds;
     uint64_t fpip;
     uint64_t fpdp;
 
diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 60ed93520a..f1a8717ed8 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -766,6 +766,10 @@ void helper_fninit(CPUX86State *env)
 {
     env->fpus = 0;
     env->fpstt = 0;
+    env->fpcs = 0;
+    env->fpip = 0;
+    env->fpds = 0;
+    env->fpdp = 0;
     cpu_set_fpuc(env, 0x37f);
     env->fptags[0] = 1;
     env->fptags[1] = 1;
@@ -2368,6 +2372,7 @@ static void do_fstenv(CPUX86State *env, target_ulong ptr, int data32,
 {
     int fpus, fptag, exp, i;
     uint64_t mant;
+    uint16_t fpcs, fpds;
     CPU_LDoubleU tmp;
 
     fpus = (env->fpus & ~0x3800) | (env->fpstt & 0x7) << 11;
@@ -2390,24 +2395,39 @@ static void do_fstenv(CPUX86State *env, target_ulong ptr, int data32,
             }
         }
     }
+
+    /*
+     * If CR0.PE = 1, each instruction saves FCS and FDS into memory. If
+     * CPUID.(EAX=07H,ECX=0H):EBX[bit 13] = 1, the processor deprecates
+     * FCS and FDS; it saves each as 0000H.
+     */
+    if (!(env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_FCS_FDS)
+        && (env->cr[0] & CR0_PE_MASK)) {
+        fpcs = env->fpcs;
+        fpds = env->fpds;
+    } else {
+        fpcs = 0;
+        fpds = 0;
+    }
+
     if (data32) {
         /* 32 bit */
         cpu_stl_data_ra(env, ptr, env->fpuc, retaddr);
         cpu_stl_data_ra(env, ptr + 4, fpus, retaddr);
         cpu_stl_data_ra(env, ptr + 8, fptag, retaddr);
-        cpu_stl_data_ra(env, ptr + 12, 0, retaddr); /* fpip */
-        cpu_stl_data_ra(env, ptr + 16, 0, retaddr); /* fpcs */
-        cpu_stl_data_ra(env, ptr + 20, 0, retaddr); /* fpoo */
-        cpu_stl_data_ra(env, ptr + 24, 0, retaddr); /* fpos */
+        cpu_stl_data_ra(env, ptr + 12, env->fpip, retaddr); /* fpip */
+        cpu_stl_data_ra(env, ptr + 16, fpcs, retaddr); /* fpcs */
+        cpu_stl_data_ra(env, ptr + 20, env->fpdp, retaddr); /* fpdp */
+        cpu_stl_data_ra(env, ptr + 24, fpds, retaddr); /* fpds */
     } else {
         /* 16 bit */
         cpu_stw_data_ra(env, ptr, env->fpuc, retaddr);
         cpu_stw_data_ra(env, ptr + 2, fpus, retaddr);
         cpu_stw_data_ra(env, ptr + 4, fptag, retaddr);
-        cpu_stw_data_ra(env, ptr + 6, 0, retaddr);
-        cpu_stw_data_ra(env, ptr + 8, 0, retaddr);
-        cpu_stw_data_ra(env, ptr + 10, 0, retaddr);
-        cpu_stw_data_ra(env, ptr + 12, 0, retaddr);
+        cpu_stw_data_ra(env, ptr + 6, env->fpip, retaddr);
+        cpu_stw_data_ra(env, ptr + 8, fpcs, retaddr);
+        cpu_stw_data_ra(env, ptr + 10, env->fpdp, retaddr);
+        cpu_stw_data_ra(env, ptr + 12, fpds, retaddr);
     }
 }
 
@@ -2473,17 +2493,7 @@ void helper_fsave(CPUX86State *env, target_ulong ptr, int data32)
     }
 
     /* fninit */
-    env->fpus = 0;
-    env->fpstt = 0;
-    cpu_set_fpuc(env, 0x37f);
-    env->fptags[0] = 1;
-    env->fptags[1] = 1;
-    env->fptags[2] = 1;
-    env->fptags[3] = 1;
-    env->fptags[4] = 1;
-    env->fptags[5] = 1;
-    env->fptags[6] = 1;
-    env->fptags[7] = 1;
+    helper_fninit(env);
 }
 
 void helper_frstor(CPUX86State *env, target_ulong ptr, int data32)
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 52e94fe106..59647ea5b7 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -5839,6 +5839,11 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         /* floats */
     case 0xd8 ... 0xdf:
         {
+            TCGv last_addr = tcg_temp_new();
+            int last_seg;
+            bool update_fdp = false;
+            bool update_fip = true;
+
             if (s->flags & (HF_EM_MASK | HF_TS_MASK)) {
                 /* if CR0.EM or CR0.TS are set, generate an FPU exception */
                 /* XXX: what to do if illegal op ? */
@@ -5851,7 +5856,14 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             op = ((b & 7) << 3) | ((modrm >> 3) & 7);
             if (mod != 3) {
                 /* memory op */
-                gen_lea_modrm(env, s, modrm);
+                AddressParts a = gen_lea_modrm_0(env, s, modrm);
+                TCGv ea = gen_lea_modrm_1(s, a);
+
+                update_fdp = true;
+                last_seg = a.def_seg;
+                tcg_gen_mov_tl(last_addr, ea);
+                gen_lea_v_seg(s, s->aflag, ea, a.def_seg, s->override);
+
                 switch (op) {
                 case 0x00 ... 0x07: /* fxxxs */
                 case 0x10 ... 0x17: /* fixxxl */
@@ -5978,19 +5990,23 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                     break;
                 case 0x0c: /* fldenv mem */
                     gen_helper_fldenv(cpu_env, s->A0, tcg_const_i32(dflag - 1));
+                    update_fip = update_fdp = false;
                     break;
                 case 0x0d: /* fldcw mem */
                     tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
                                         s->mem_index, MO_LEUW);
                     gen_helper_fldcw(cpu_env, s->tmp2_i32);
+                    update_fip = update_fdp = false;
                     break;
                 case 0x0e: /* fnstenv mem */
                     gen_helper_fstenv(cpu_env, s->A0, tcg_const_i32(dflag - 1));
+                    update_fip = update_fdp = false;
                     break;
                 case 0x0f: /* fnstcw mem */
                     gen_helper_fnstcw(s->tmp2_i32, cpu_env);
                     tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
                                         s->mem_index, MO_LEUW);
+                    update_fip = update_fdp = false;
                     break;
                 case 0x1d: /* fldt mem */
                     gen_helper_fldt_ST0(cpu_env, s->A0);
@@ -6001,14 +6017,17 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                     break;
                 case 0x2c: /* frstor mem */
                     gen_helper_frstor(cpu_env, s->A0, tcg_const_i32(dflag - 1));
+                    update_fip = update_fdp = false;
                     break;
                 case 0x2e: /* fnsave mem */
                     gen_helper_fsave(cpu_env, s->A0, tcg_const_i32(dflag - 1));
+                    update_fip = update_fdp = false;
                     break;
                 case 0x2f: /* fnstsw mem */
                     gen_helper_fnstsw(s->tmp2_i32, cpu_env);
                     tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
                                         s->mem_index, MO_LEUW);
+                    update_fip = update_fdp = false;
                     break;
                 case 0x3c: /* fbld */
                     gen_helper_fbld_ST0(cpu_env, s->A0);
@@ -6051,6 +6070,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                     case 0: /* fnop */
                         /* check exceptions (FreeBSD FPU probe) */
                         gen_helper_fwait(cpu_env);
+                        update_fip = update_fdp = false;
                         break;
                     default:
                         goto unknown_op;
@@ -6220,9 +6240,11 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                         break;
                     case 2: /* fclex */
                         gen_helper_fclex(cpu_env);
+                        update_fip = update_fdp = false;
                         break;
                     case 3: /* fninit */
                         gen_helper_fninit(cpu_env);
+                        update_fip = update_fdp = false;
                         break;
                     case 4: /* fsetpm (287 only, just do nop here) */
                         break;
@@ -6343,6 +6365,27 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                     goto unknown_op;
                 }
             }
+
+            if (update_fip) {
+                tcg_gen_ld32u_tl(s->T0, cpu_env,
+                                offsetof(CPUX86State, segs[R_CS].selector));
+                tcg_gen_st16_tl(s->T0, cpu_env, offsetof(CPUX86State, fpcs));
+
+                tcg_gen_movi_tl(s->T0, pc_start - s->cs_base);
+                tcg_gen_st_tl(s->T0, cpu_env, offsetof(CPUX86State, fpip));
+            }
+
+            if (update_fdp) {
+                if (s->override >= 0) {
+                    last_seg = s->override;
+                }
+                tcg_gen_ld32u_tl(s->T0, cpu_env,
+                                 offsetof(CPUX86State,
+                                 segs[last_seg].selector));
+                tcg_gen_st16_tl(s->T0, cpu_env, offsetof(CPUX86State, fpds));
+
+                tcg_gen_st_tl(last_addr, cpu_env, offsetof(CPUX86State, fpdp));
+            }
         }
         break;
         /************************/
-- 
2.25.1


