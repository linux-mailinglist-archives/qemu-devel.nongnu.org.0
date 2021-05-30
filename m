Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EFD395054
	for <lists+qemu-devel@lfdr.de>; Sun, 30 May 2021 11:52:15 +0200 (CEST)
Received: from localhost ([::1]:42076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnI7C-0001qC-Gi
	for lists+qemu-devel@lfdr.de; Sun, 30 May 2021 05:52:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ziqiaokong@gmail.com>)
 id 1lnI5f-00013U-UV
 for qemu-devel@nongnu.org; Sun, 30 May 2021 05:50:40 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:45737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ziqiaokong@gmail.com>)
 id 1lnI5d-00054l-SD
 for qemu-devel@nongnu.org; Sun, 30 May 2021 05:50:39 -0400
Received: by mail-pg1-x52a.google.com with SMTP id q15so6079529pgg.12
 for <qemu-devel@nongnu.org>; Sun, 30 May 2021 02:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fCqDSITgivLFeGU9E/EaOHBytfVYIZz6bKKCiVhNBjk=;
 b=GsCsPsr3O26c/UR3gEv4xS8PJ2kY5zyWR21fM9shz1aV7C6/H3N9k/JhMgrxD2i6J5
 ZSCt97SpnGZTtw0mZ5iowU2VJ8HHrmZGicZ80mJ8l8P07qDpHXC2iDLUDVMj2CgudSY+
 iI9EvS4q1vlT35tFCF+gClMCVTSdbI2gm9ROv9nhDp780MfxDkolgKcuPxdv2pRE5IHt
 PciDunV2lv4si8uWo1I72IzU1wL5aa8QQJJZM6KtzBLYo9cbbWrTxN4wmJBja+HfVFY1
 Kp8z3VWWAdV0ysHq9z1JrM57Ml9HclXPqZD+AlHyT4R3px1H59msvvsUHYtvPimzBisu
 lp+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fCqDSITgivLFeGU9E/EaOHBytfVYIZz6bKKCiVhNBjk=;
 b=b1sewdBfdOXVSn8LgU69y6bALiI2aecif9MW/9rrhcxIxuJGSStwPc5f5E6Gj7YWEQ
 NISF+tQYvWT6ysrP48yaAUhTHW3giV8lEBIm8RWiULmYcy4a+KHbThXs5jV2qIrTPZGY
 T2XZr9hmTYgiMieHc3RHIiOHkIwNxtSYh3Yy6F6bxP0Awkx2SUKoaWSiybSR8+QYVCW0
 2d2zRVvOmnXvnLmIDTi51nBK+iBUgaloQWCcSHXyO3lj5HlmlsetaHFalc8NYI7nSTTC
 g99Aj67N110dJUGAaJoOjHzJGQ/8lMX0/fPq1a0AFUillojW/kkBp+ohMaJzRdDP42iZ
 zCyg==
X-Gm-Message-State: AOAM530yWc2arGlfC4STSjBJvWDpUMXFaezRe4m7zfoh8Bn1I8sC8BIu
 RGQkLAI8+ztkKppDqBs+QXu8DRbF/Ek=
X-Google-Smtp-Source: ABdhPJyzo5rgrU6A5+TLJGc77wxlwWdHo5jkc+zxmMMfJe02E8mNWWu00tnKYVzVLJlDB+evWajWBQ==
X-Received: by 2002:aa7:9001:0:b029:2d4:9408:9998 with SMTP id
 m1-20020aa790010000b02902d494089998mr11951668pfo.9.1622368236142; 
 Sun, 30 May 2021 02:50:36 -0700 (PDT)
Received: from crdev.local ([104.160.18.162])
 by smtp.gmail.com with ESMTPSA id p36sm8801384pgm.74.2021.05.30.02.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 May 2021 02:50:35 -0700 (PDT)
From: Ziqiao Kong <ziqiaokong@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/2] target/i386: Correct implementation for FCS, FIP,
 FDS and FDP
Date: Sun, 30 May 2021 17:48:39 +0800
Message-Id: <20210530094838.66849-2-ziqiaokong@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=ziqiaokong@gmail.com; helo=mail-pg1-x52a.google.com
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

Update FCS:FIP and FDS:FDP according to the Intel Manual Vol.1 8.1.8. Note that
CPUID.(EAX=07H,ECX=0H):EBX[bit 13] is not implemented by design in this patch
and would be added along with TCG features flag in a separate patch later.

Signed-off-by: Ziqiao Kong <ziqiaokong@gmail.com>
---
Changes since v4:
- Remove the dead code about CPUID_7_0_EBX_FCS_FDS.
- Rewrite the commit message.
---
 target/i386/cpu.h            |  2 ++
 target/i386/tcg/fpu_helper.c | 32 +++++++++++--------------
 target/i386/tcg/translate.c  | 45 +++++++++++++++++++++++++++++++++++-
 3 files changed, 59 insertions(+), 20 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index da72aa5228..147dadcce0 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1455,6 +1455,8 @@ typedef struct CPUX86State {
     FPReg fpregs[8];
     /* KVM-only so far */
     uint16_t fpop;
+    uint16_t fpcs;
+    uint16_t fpds;
     uint64_t fpip;
     uint64_t fpdp;
 
diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 1b30f1bb73..d953f04bb5 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -728,6 +728,10 @@ void helper_fninit(CPUX86State *env)
 {
     env->fpus = 0;
     env->fpstt = 0;
+    env->fpcs = 0;
+    env->fpds = 0;
+    env->fpip = 0;
+    env->fpdp = 0;
     cpu_set_fpuc(env, 0x37f);
     env->fptags[0] = 1;
     env->fptags[1] = 1;
@@ -2357,19 +2361,19 @@ static void do_fstenv(CPUX86State *env, target_ulong ptr, int data32,
         cpu_stl_data_ra(env, ptr, env->fpuc, retaddr);
         cpu_stl_data_ra(env, ptr + 4, fpus, retaddr);
         cpu_stl_data_ra(env, ptr + 8, fptag, retaddr);
-        cpu_stl_data_ra(env, ptr + 12, 0, retaddr); /* fpip */
-        cpu_stl_data_ra(env, ptr + 16, 0, retaddr); /* fpcs */
-        cpu_stl_data_ra(env, ptr + 20, 0, retaddr); /* fpoo */
-        cpu_stl_data_ra(env, ptr + 24, 0, retaddr); /* fpos */
+        cpu_stl_data_ra(env, ptr + 12, env->fpip, retaddr); /* fpip */
+        cpu_stl_data_ra(env, ptr + 16, env->fpcs, retaddr); /* fpcs */
+        cpu_stl_data_ra(env, ptr + 20, env->fpdp, retaddr); /* fpoo */
+        cpu_stl_data_ra(env, ptr + 24, env->fpds, retaddr); /* fpos */
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
+        cpu_stw_data_ra(env, ptr + 8, env->fpcs, retaddr);
+        cpu_stw_data_ra(env, ptr + 10, env->fpdp, retaddr);
+        cpu_stw_data_ra(env, ptr + 12, env->fpds, retaddr);
     }
 }
 
@@ -2436,17 +2440,7 @@ static void do_fsave(CPUX86State *env, target_ulong ptr, int data32,
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
 
 void helper_fsave(CPUX86State *env, target_ulong ptr, int data32)
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 5c1b7b87c5..b53af9acbe 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -5930,6 +5930,11 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -5942,7 +5947,14 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -6070,20 +6082,24 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 case 0x0c: /* fldenv mem */
                     gen_helper_fldenv(cpu_env, s->A0,
                                       tcg_const_i32(dflag - 1));
+                    update_fip = update_fdp = false;
                     break;
                 case 0x0d: /* fldcw mem */
                     tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
                                         s->mem_index, MO_LEUW);
                     gen_helper_fldcw(cpu_env, s->tmp2_i32);
+                    update_fip = update_fdp = false;
                     break;
                 case 0x0e: /* fnstenv mem */
                     gen_helper_fstenv(cpu_env, s->A0,
                                       tcg_const_i32(dflag - 1));
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
@@ -6095,15 +6111,18 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 case 0x2c: /* frstor mem */
                     gen_helper_frstor(cpu_env, s->A0,
                                       tcg_const_i32(dflag - 1));
+                    update_fip = update_fdp = false;
                     break;
                 case 0x2e: /* fnsave mem */
                     gen_helper_fsave(cpu_env, s->A0,
                                      tcg_const_i32(dflag - 1));
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
@@ -6146,6 +6165,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                     case 0: /* fnop */
                         /* check exceptions (FreeBSD FPU probe) */
                         gen_helper_fwait(cpu_env);
+                        update_fip = update_fdp = false;
                         break;
                     default:
                         goto unknown_op;
@@ -6315,9 +6335,11 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -6438,6 +6460,27 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                     goto unknown_op;
                 }
             }
+
+            if (update_fip) {
+                tcg_gen_ld32u_tl(s->T0, cpu_env,
+                                    offsetof(CPUX86State, segs[R_CS].selector));
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
+                                    offsetof(CPUX86State,
+                                    segs[last_seg].selector));
+                tcg_gen_st16_tl(s->T0, cpu_env, offsetof(CPUX86State, fpds));
+
+                tcg_gen_st_tl(last_addr, cpu_env, offsetof(CPUX86State, fpdp));
+            }
         }
         break;
         /************************/
-- 
2.25.1


