Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0B236F411
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 04:26:55 +0200 (CEST)
Received: from localhost ([::1]:36198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcIrm-0007nb-5i
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 22:26:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ziqiaokong@gmail.com>)
 id 1lcIqt-0007Ne-Vm
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 22:26:00 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:40906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ziqiaokong@gmail.com>)
 id 1lcIqq-0005Fy-3V
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 22:25:59 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 l10-20020a17090a850ab0290155b06f6267so899319pjn.5
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 19:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lRrLxbfTfeGr022mzJrh8huyPKdcdytFed5yrQK2BkE=;
 b=nStr6kuUjkaReE2LZOEILzpGKks2hYXjPjsxu4Wgw8zcbcuyREP0UhAGC6bGNqOiXQ
 sUXBh0Ayw9fuvU+wFxL3TNzO00BUPaIpc5kpVz5wtHUo2UlEmm7wRTPbox2GzH7zLlpu
 UHkb7SZLIoGZhJQo6wEHabdXkzMdMsMXQtf1dlB9OMlWaKnptwbmFCOfPUQuR//WpjAi
 yXnZsLkz8q1DQccNJmHl8OG18RPo6CzN5v4xgqTbHNxxID+Z+G6TA7/L3+2xNxYARYHN
 cWjlYnlNxWBwcKbxaqdfiI7TbV+Ke9i7yIWE60c+szOO+X4azt22cN/3a3nWblktzlzq
 OYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lRrLxbfTfeGr022mzJrh8huyPKdcdytFed5yrQK2BkE=;
 b=PiGQ1x5n3d7DNo4s65CE0WquPRnMQSiUrn4clcgr7wBDmJ/6UPRenQPNNZPzTPW+t6
 3zTMutM1uw8Qg/TQdQxzLEhD7qwZoZiH0jFvY0mTWYFWAYY/hvaemtPKPJtanfZtxrtK
 P7a/stEF6Mxy3h2cCOE1dZgQXmEGM4Slv7XF9JqxH6nHdRSSN/0prxz7sPnrq7f/wEBr
 atlK0TdZ/7+CRhZZFBv1pFGK/eMBRUdJSLy0Aikn4/qrmqWaN4WD5S2mKaCEnMugpQsP
 9KnHBd7Ka7VDJhxFkP88s/6jDwXBayJ5c6o68Bk20n5f8hKtT99ASOqA5mxNtXYu+pIL
 GbCQ==
X-Gm-Message-State: AOAM532BQNI43e8x4cgA/y+zYcxiQTR47O8i3CENd2kfksPqwnT7Afls
 dWoQEF5v2qWkcClK1E9ZMaq5LBOB10aWPQ==
X-Google-Smtp-Source: ABdhPJxkT05uwUt7NUK+5QQfpo7YrU0nIDDtsfXU4hzff+y4TyTsT1nBZNSMlXS4BSuy7O5EC57F0A==
X-Received: by 2002:a17:902:104:b029:ec:9fa6:c08 with SMTP id
 4-20020a1709020104b02900ec9fa60c08mr2950651plb.10.1619749552452; 
 Thu, 29 Apr 2021 19:25:52 -0700 (PDT)
Received: from localhost.localdomain ([104.160.18.162])
 by smtp.gmail.com with ESMTPSA id q5sm362417pfu.5.2021.04.29.19.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 19:25:52 -0700 (PDT)
From: Ziqiao Kong <ziqiaokong@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] Set the correct env->fpip for x86 float instructions
Date: Fri, 30 Apr 2021 10:19:45 +0800
Message-Id: <20210430021943.152586-1-ziqiaokong@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=ziqiaokong@gmail.com; helo=mail-pj1-x1030.google.com
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

Thanks the review for v1 from Richard Henderson!

Changes since v1:
  - Don't update FCS, FIP, FDS and FDP for x87 control instruction.
  - Also write FCS, FDS and FDP for FSTENV.
  - Clear FCS, FIP, FDS and FDP for FXSAVE as intel manual says.

Note:
  During my test, I find that the implementation between some intel cpus
  differs on updating FDS and FDP while the AMD Ryzen always update the 
  two registers correctly. Not sure wthether it's a bug or not.

Ziqiao

Signed-off-by: Ziqiao Kong <ziqiaokong@gmail.com>
---
 target/i386/cpu.h            |  4 +++
 target/i386/tcg/fpu_helper.c | 50 ++++++++++++++++++++++--------------
 target/i386/tcg/translate.c  | 45 +++++++++++++++++++++++++++++++-
 3 files changed, 79 insertions(+), 20 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 570f916878..ba43ceb4ad 100644
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
@@ -1440,7 +1442,9 @@ typedef struct CPUX86State {
     FPReg fpregs[8];
     /* KVM-only so far */
     uint16_t fpop;
+    uint16_t fpcs;
     uint64_t fpip;
+    uint16_t fpds;
     uint64_t fpdp;
 
     /* emulator internal variables */
diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 60ed93520a..97cf68542b 100644
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
@@ -2390,24 +2395,41 @@ static void do_fstenv(CPUX86State *env, target_ulong ptr, int data32,
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
+        cpu_stw_data_ra(env, ptr + 16, fpcs, retaddr); /* fpcs */
+        cpu_stw_data_ra(env, ptr + 18, 0, retaddr);
+        cpu_stl_data_ra(env, ptr + 20, env->fpdp, retaddr); /* fpdp */
+        cpu_stw_data_ra(env, ptr + 24, fpds, retaddr); /* fpds */
+        cpu_stw_data_ra(env, ptr + 26, 0, retaddr);
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
 
@@ -2473,17 +2495,7 @@ void helper_fsave(CPUX86State *env, target_ulong ptr, int data32)
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
index 880bc45561..c26d343ab8 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -4486,6 +4486,11 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     target_ulong next_eip, tval;
     int rex_w, rex_r;
     target_ulong pc_start = s->base.pc_next;
+    /* For FCS, FIP, FDS and FDP. */
+    AddressParts last_addr;
+    TCGv ea;
+    bool update_fdp;
+    bool update_fip;
 
     s->pc_start = s->pc = pc_start;
     s->override = -1;
@@ -4506,6 +4511,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     rex_w = -1;
     rex_r = 0;
 
+    update_fip = true;
+    update_fdp = false;
+
  next_byte:
     b = x86_ldub_code(env, s);
     /* Collect prefixes.  */
@@ -5850,7 +5858,11 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         op = ((b & 7) << 3) | ((modrm >> 3) & 7);
         if (mod != 3) {
             /* memory op */
-            gen_lea_modrm(env, s, modrm);
+            update_fdp = true;
+            last_addr = gen_lea_modrm_0(env, s, modrm);
+            ea = gen_lea_modrm_1(s, last_addr);
+            gen_lea_v_seg(s, s->aflag, ea, last_addr.def_seg, s->override);
+
             switch(op) {
             case 0x00 ... 0x07: /* fxxxs */
             case 0x10 ... 0x17: /* fixxxl */
@@ -5976,19 +5988,23 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 break;
             case 0x0c: /* fldenv mem */
                 gen_helper_fldenv(cpu_env, s->A0, tcg_const_i32(dflag - 1));
+                update_fip = update_fdp = false;
                 break;
             case 0x0d: /* fldcw mem */
                 tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
                                     s->mem_index, MO_LEUW);
                 gen_helper_fldcw(cpu_env, s->tmp2_i32);
+                update_fip = update_fdp = false;
                 break;
             case 0x0e: /* fnstenv mem */
                 gen_helper_fstenv(cpu_env, s->A0, tcg_const_i32(dflag - 1));
+                update_fip = update_fdp = false;
                 break;
             case 0x0f: /* fnstcw mem */
                 gen_helper_fnstcw(s->tmp2_i32, cpu_env);
                 tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
                                     s->mem_index, MO_LEUW);
+                update_fip = update_fdp = false;
                 break;
             case 0x1d: /* fldt mem */
                 gen_helper_fldt_ST0(cpu_env, s->A0);
@@ -5999,14 +6015,17 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 break;
             case 0x2c: /* frstor mem */
                 gen_helper_frstor(cpu_env, s->A0, tcg_const_i32(dflag - 1));
+                update_fip = update_fdp = false;
                 break;
             case 0x2e: /* fnsave mem */
                 gen_helper_fsave(cpu_env, s->A0, tcg_const_i32(dflag - 1));
+                update_fip = update_fdp = false;
                 break;
             case 0x2f: /* fnstsw mem */
                 gen_helper_fnstsw(s->tmp2_i32, cpu_env);
                 tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
                                     s->mem_index, MO_LEUW);
+                update_fip = update_fdp = false;
                 break;
             case 0x3c: /* fbld */
                 gen_helper_fbld_ST0(cpu_env, s->A0);
@@ -6047,6 +6066,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 case 0: /* fnop */
                     /* check exceptions (FreeBSD FPU probe) */
                     gen_helper_fwait(cpu_env);
+                    update_fip = update_fdp = false;
                     break;
                 default:
                     goto unknown_op;
@@ -6214,9 +6234,11 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                     break;
                 case 2: /* fclex */
                     gen_helper_fclex(cpu_env);
+                    update_fip = update_fdp = false;
                     break;
                 case 3: /* fninit */
                     gen_helper_fninit(cpu_env);
+                    update_fip = update_fdp = false;
                     break;
                 case 4: /* fsetpm (287 only, just do nop here) */
                     break;
@@ -6337,6 +6359,27 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto unknown_op;
             }
         }
+
+
+        if (update_fip) {
+            tcg_gen_movi_tl(s->T0, pc_start - s->cs_base);
+            tcg_gen_st_tl(s->T0, cpu_env, offsetof(CPUX86State, fpip));
+
+            tcg_gen_mov_tl(s->T0, cpu_seg_base[R_CS]);
+            tcg_gen_st16_tl(s->T0, cpu_env, offsetof(CPUX86State, fpcs));
+        }
+
+        if (update_fdp) {
+            if (s->override < 0) {
+                tcg_gen_mov_tl(s->A0, cpu_seg_base[last_addr.def_seg]);
+            } else {
+                tcg_gen_mov_tl(s->A0, cpu_seg_base[s->override]);
+            }
+            tcg_gen_st16_tl(s->A0, cpu_env, offsetof(CPUX86State, fpds));
+
+            ea = gen_lea_modrm_1(s, last_addr);
+            tcg_gen_st_tl(ea, cpu_env, offsetof(CPUX86State, fpdp));
+        }
         break;
         /************************/
         /* string ops */
-- 
2.25.1


