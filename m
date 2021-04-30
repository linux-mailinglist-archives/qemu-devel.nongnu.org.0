Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 196983703AC
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 00:48:08 +0200 (CEST)
Received: from localhost ([::1]:48142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcbvb-0003t2-6O
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 18:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ziqiaokong@gmail.com>)
 id 1lcbtj-00036Z-FD
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 18:46:11 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:34345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ziqiaokong@gmail.com>)
 id 1lcbtf-0001H9-Op
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 18:46:11 -0400
Received: by mail-pf1-x42e.google.com with SMTP id 10so142956pfl.1
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 15:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3nbQ9igeJ9Xw4DbzVAhpy5PPXWE2pQ9RmJD08jjMatg=;
 b=OjpYCXxhRRS9YeZPoor/mQzG75sF8OmDI0a36xRw9KaLu569Nl9PYLfga3U9Nc8Yoj
 sOYS4O4wMb9FuodfxzJ41Ly0Vqv3tRhwrUKftry19/Fg0q84+7SFmXS92jGmiMpD5al2
 xsRx6/rdoVfa2oX23Zi4gBOzV01d1cNfAbDPvERD8wMHR41gxjUL7ohenBI6l3XZMc5B
 3SgbFZVDkOkE59KimMgSxSalBVx/MOHGH9/J2c0g6XvR7ytvR5ni3Zsry8punZuVY99L
 1Q7wozP6h3WK0B5BiIaF3aaBIMGDn7tCFHa6ECAHJDYdgcDTGZfToV4VXLaNMhVcJzjH
 gYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3nbQ9igeJ9Xw4DbzVAhpy5PPXWE2pQ9RmJD08jjMatg=;
 b=H2xbMFkQj4y7XRhxhezqF5516kBrHqt9hjeDJFkRpMyeQFAYnDT4D+c+kRGrDsl3Dh
 95CYmdO13a4Qg5jy8spv/VRnnty0mhumBX15pfNkYFsdbsGGdExdLoiS5hCJRAzfOO+J
 y6dmTA9mmHikwxzffHZH/zFOoltVHgkF4uKD+qhbHXpymdf5ZGqCEZ+4AoTMf9o13P9X
 8xJQlUERFpFaFfKudX8RWHSzu3a/jCzsZBRcMwsdAfWbSHXZnmb6lcE/703xF6ylbFle
 8XBWozAIgvHPoZ+Prf3yb3/oIXO5Epnmti7nTqAeAoJ9d9ZMADwHEP1aNNAFJx3y5k2T
 P56g==
X-Gm-Message-State: AOAM5334sDsP4CFn6vn04HgicenYiv08V75piTDhwLKvkHQqHtvCsYL3
 cTGFXFoZ78VFsPJVD3niXaGiJ2Bsz8rpNo4LuRQ=
X-Google-Smtp-Source: ABdhPJz6aDgHxrMGjioWwuQmdLP64uB/LN2coifu/Myknkwqd7She228lJ7XiySDnqjq7I0h4hsmbg==
X-Received: by 2002:aa7:824e:0:b029:20a:3a1:eeda with SMTP id
 e14-20020aa7824e0000b029020a03a1eedamr6748643pfn.71.1619822765438; 
 Fri, 30 Apr 2021 15:46:05 -0700 (PDT)
Received: from localhost.localdomain ([104.160.18.162])
 by smtp.gmail.com with ESMTPSA id q21sm2910537pfl.152.2021.04.30.15.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 15:46:04 -0700 (PDT)
From: Ziqiao Kong <ziqiaokong@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] Set the correct env->fpip for x86 float instructions
Date: Sat,  1 May 2021 06:37:03 +0800
Message-Id: <20210430223701.176696-1-ziqiaokong@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=ziqiaokong@gmail.com; helo=mail-pf1-x42e.google.com
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

Changes since v2:
 - Change the sequence of fpcs, fpds, fpip and fpdp in CPUX86State.
 - Use stl instead of stw in do_fstenv.
 - Move variables to floats instruction case block.
 - Move last accessed memory operand to a temp variable to avoid another load.
 - Move segment selectors instead of segment base to fpcs and fpds.
 - Fix some code stype problems for the original code in floats case block.

Note:
 To move varaibles to the case block, I have to add a new pair of braces and
 thus the code motion makes the patch seem big.

Thanks again for Richard Henderson's review.

Ziqiao

Signed-off-by: Ziqiao Kong <ziqiaokong@gmail.com>
---
 target/i386/cpu.h            |   4 +
 target/i386/tcg/fpu_helper.c |  48 +-
 target/i386/tcg/translate.c  | 914 ++++++++++++++++++-----------------
 3 files changed, 515 insertions(+), 451 deletions(-)

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
index 880bc45561..d770614d7b 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -5838,504 +5838,554 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         /************************/
         /* floats */
     case 0xd8 ... 0xdf:
-        if (s->flags & (HF_EM_MASK | HF_TS_MASK)) {
-            /* if CR0.EM or CR0.TS are set, generate an FPU exception */
-            /* XXX: what to do if illegal op ? */
-            gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
-            break;
-        }
-        modrm = x86_ldub_code(env, s);
-        mod = (modrm >> 6) & 3;
-        rm = modrm & 7;
-        op = ((b & 7) << 3) | ((modrm >> 3) & 7);
-        if (mod != 3) {
-            /* memory op */
-            gen_lea_modrm(env, s, modrm);
-            switch(op) {
-            case 0x00 ... 0x07: /* fxxxs */
-            case 0x10 ... 0x17: /* fixxxl */
-            case 0x20 ... 0x27: /* fxxxl */
-            case 0x30 ... 0x37: /* fixxx */
-                {
-                    int op1;
-                    op1 = op & 7;
+        {
+            TCGv last_addr = tcg_temp_new();
+            int last_seg;
+            bool update_fdp = false;
+            bool update_fip = true;
+
+            if (s->flags & (HF_EM_MASK | HF_TS_MASK)) {
+                /* if CR0.EM or CR0.TS are set, generate an FPU exception */
+                /* XXX: what to do if illegal op ? */
+                gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
+                break;
+            }
+            modrm = x86_ldub_code(env, s);
+            mod = (modrm >> 6) & 3;
+            rm = modrm & 7;
+            op = ((b & 7) << 3) | ((modrm >> 3) & 7);
+            if (mod != 3) {
+                /* memory op */
+                AddressParts a = gen_lea_modrm_0(env, s, modrm);
+                TCGv ea = gen_lea_modrm_1(s, a);
+
+                update_fdp = true;
+                last_seg = a.def_seg;
+                tcg_gen_mov_tl(last_addr, ea);
+                gen_lea_v_seg(s, s->aflag, ea, a.def_seg, s->override);
+
+                switch (op) {
+                case 0x00 ... 0x07: /* fxxxs */
+                case 0x10 ... 0x17: /* fixxxl */
+                case 0x20 ... 0x27: /* fxxxl */
+                case 0x30 ... 0x37: /* fixxx */
+                    {
+                        int op1;
+                        op1 = op & 7;
+
+                        switch (op >> 4) {
+                        case 0:
+                            tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
+                                                s->mem_index, MO_LEUL);
+                            gen_helper_flds_FT0(cpu_env, s->tmp2_i32);
+                            break;
+                        case 1:
+                            tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
+                                                s->mem_index, MO_LEUL);
+                            gen_helper_fildl_FT0(cpu_env, s->tmp2_i32);
+                            break;
+                        case 2:
+                            tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0,
+                                                s->mem_index, MO_LEQ);
+                            gen_helper_fldl_FT0(cpu_env, s->tmp1_i64);
+                            break;
+                        case 3:
+                        default:
+                            tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
+                                                s->mem_index, MO_LESW);
+                            gen_helper_fildl_FT0(cpu_env, s->tmp2_i32);
+                            break;
+                        }
 
-                    switch(op >> 4) {
+                        gen_helper_fp_arith_ST0_FT0(op1);
+                        if (op1 == 3) {
+                            /* fcomp needs pop */
+                            gen_helper_fpop(cpu_env);
+                        }
+                    }
+                    break;
+                case 0x08: /* flds */
+                case 0x0a: /* fsts */
+                case 0x0b: /* fstps */
+                case 0x18 ... 0x1b: /* fildl, fisttpl, fistl, fistpl */
+                case 0x28 ... 0x2b: /* fldl, fisttpll, fstl, fstpl */
+                case 0x38 ... 0x3b: /* filds, fisttps, fists, fistps */
+                    switch (op & 7) {
                     case 0:
-                        tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
-                                            s->mem_index, MO_LEUL);
-                        gen_helper_flds_FT0(cpu_env, s->tmp2_i32);
+                        switch (op >> 4) {
+                        case 0:
+                            tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
+                                                s->mem_index, MO_LEUL);
+                            gen_helper_flds_ST0(cpu_env, s->tmp2_i32);
+                            break;
+                        case 1:
+                            tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
+                                                s->mem_index, MO_LEUL);
+                            gen_helper_fildl_ST0(cpu_env, s->tmp2_i32);
+                            break;
+                        case 2:
+                            tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0,
+                                                s->mem_index, MO_LEQ);
+                            gen_helper_fldl_ST0(cpu_env, s->tmp1_i64);
+                            break;
+                        case 3:
+                        default:
+                            tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
+                                                s->mem_index, MO_LESW);
+                            gen_helper_fildl_ST0(cpu_env, s->tmp2_i32);
+                            break;
+                        }
                         break;
                     case 1:
-                        tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
-                                            s->mem_index, MO_LEUL);
-                        gen_helper_fildl_FT0(cpu_env, s->tmp2_i32);
-                        break;
-                    case 2:
-                        tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0,
-                                            s->mem_index, MO_LEQ);
-                        gen_helper_fldl_FT0(cpu_env, s->tmp1_i64);
+                        /* XXX: the corresponding CPUID bit must be tested ! */
+                        switch (op >> 4) {
+                        case 1:
+                            gen_helper_fisttl_ST0(s->tmp2_i32, cpu_env);
+                            tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
+                                                s->mem_index, MO_LEUL);
+                            break;
+                        case 2:
+                            gen_helper_fisttll_ST0(s->tmp1_i64, cpu_env);
+                            tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0,
+                                                s->mem_index, MO_LEQ);
+                            break;
+                        case 3:
+                        default:
+                            gen_helper_fistt_ST0(s->tmp2_i32, cpu_env);
+                            tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
+                                                s->mem_index, MO_LEUW);
+                            break;
+                        }
+                        gen_helper_fpop(cpu_env);
                         break;
-                    case 3:
                     default:
-                        tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
-                                            s->mem_index, MO_LESW);
-                        gen_helper_fildl_FT0(cpu_env, s->tmp2_i32);
+                        switch (op >> 4) {
+                        case 0:
+                            gen_helper_fsts_ST0(s->tmp2_i32, cpu_env);
+                            tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
+                                                s->mem_index, MO_LEUL);
+                            break;
+                        case 1:
+                            gen_helper_fistl_ST0(s->tmp2_i32, cpu_env);
+                            tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
+                                                s->mem_index, MO_LEUL);
+                            break;
+                        case 2:
+                            gen_helper_fstl_ST0(s->tmp1_i64, cpu_env);
+                            tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0,
+                                                s->mem_index, MO_LEQ);
+                            break;
+                        case 3:
+                        default:
+                            gen_helper_fist_ST0(s->tmp2_i32, cpu_env);
+                            tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
+                                                s->mem_index, MO_LEUW);
+                            break;
+                        }
+                        if ((op & 7) == 3) {
+                            gen_helper_fpop(cpu_env);
+                        }
                         break;
                     }
+                    break;
+                case 0x0c: /* fldenv mem */
+                    gen_helper_fldenv(cpu_env, s->A0, tcg_const_i32(dflag - 1));
+                    update_fip = update_fdp = false;
+                    break;
+                case 0x0d: /* fldcw mem */
+                    tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
+                                        s->mem_index, MO_LEUW);
+                    gen_helper_fldcw(cpu_env, s->tmp2_i32);
+                    update_fip = update_fdp = false;
+                    break;
+                case 0x0e: /* fnstenv mem */
+                    gen_helper_fstenv(cpu_env, s->A0, tcg_const_i32(dflag - 1));
+                    update_fip = update_fdp = false;
+                    break;
+                case 0x0f: /* fnstcw mem */
+                    gen_helper_fnstcw(s->tmp2_i32, cpu_env);
+                    tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
+                                        s->mem_index, MO_LEUW);
+                    update_fip = update_fdp = false;
+                    break;
+                case 0x1d: /* fldt mem */
+                    gen_helper_fldt_ST0(cpu_env, s->A0);
+                    break;
+                case 0x1f: /* fstpt mem */
+                    gen_helper_fstt_ST0(cpu_env, s->A0);
+                    gen_helper_fpop(cpu_env);
+                    break;
+                case 0x2c: /* frstor mem */
+                    gen_helper_frstor(cpu_env, s->A0, tcg_const_i32(dflag - 1));
+                    update_fip = update_fdp = false;
+                    break;
+                case 0x2e: /* fnsave mem */
+                    gen_helper_fsave(cpu_env, s->A0, tcg_const_i32(dflag - 1));
+                    update_fip = update_fdp = false;
+                    break;
+                case 0x2f: /* fnstsw mem */
+                    gen_helper_fnstsw(s->tmp2_i32, cpu_env);
+                    tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
+                                        s->mem_index, MO_LEUW);
+                    update_fip = update_fdp = false;
+                    break;
+                case 0x3c: /* fbld */
+                    gen_helper_fbld_ST0(cpu_env, s->A0);
+                    break;
+                case 0x3e: /* fbstp */
+                    gen_helper_fbst_ST0(cpu_env, s->A0);
+                    gen_helper_fpop(cpu_env);
+                    break;
+                case 0x3d: /* fildll */
+                    tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0,
+                                        s->mem_index, MO_LEQ);
+                    gen_helper_fildll_ST0(cpu_env, s->tmp1_i64);
+                    break;
+                case 0x3f: /* fistpll */
+                    gen_helper_fistll_ST0(s->tmp1_i64, cpu_env);
+                    tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0,
+                                        s->mem_index, MO_LEQ);
+                    gen_helper_fpop(cpu_env);
+                    break;
+                default:
+                    goto unknown_op;
+                }
+            } else {
+                /* register float ops */
+                opreg = rm;
 
-                    gen_helper_fp_arith_ST0_FT0(op1);
-                    if (op1 == 3) {
-                        /* fcomp needs pop */
-                        gen_helper_fpop(cpu_env);
+                switch (op) {
+                case 0x08: /* fld sti */
+                    gen_helper_fpush(cpu_env);
+                    gen_helper_fmov_ST0_STN(cpu_env,
+                                            tcg_const_i32((opreg + 1) & 7));
+                    break;
+                case 0x09: /* fxchg sti */
+                case 0x29: /* fxchg4 sti, undocumented op */
+                case 0x39: /* fxchg7 sti, undocumented op */
+                    gen_helper_fxchg_ST0_STN(cpu_env, tcg_const_i32(opreg));
+                    break;
+                case 0x0a: /* grp d9/2 */
+                    switch (rm) {
+                    case 0: /* fnop */
+                        /* check exceptions (FreeBSD FPU probe) */
+                        gen_helper_fwait(cpu_env);
+                        update_fip = update_fdp = false;
+                        break;
+                    default:
+                        goto unknown_op;
                     }
-                }
-                break;
-            case 0x08: /* flds */
-            case 0x0a: /* fsts */
-            case 0x0b: /* fstps */
-            case 0x18 ... 0x1b: /* fildl, fisttpl, fistl, fistpl */
-            case 0x28 ... 0x2b: /* fldl, fisttpll, fstl, fstpl */
-            case 0x38 ... 0x3b: /* filds, fisttps, fists, fistps */
-                switch(op & 7) {
-                case 0:
-                    switch(op >> 4) {
-                    case 0:
-                        tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
-                                            s->mem_index, MO_LEUL);
-                        gen_helper_flds_ST0(cpu_env, s->tmp2_i32);
+                    break;
+                case 0x0c: /* grp d9/4 */
+                    switch (rm) {
+                    case 0: /* fchs */
+                        gen_helper_fchs_ST0(cpu_env);
                         break;
-                    case 1:
-                        tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
-                                            s->mem_index, MO_LEUL);
-                        gen_helper_fildl_ST0(cpu_env, s->tmp2_i32);
+                    case 1: /* fabs */
+                        gen_helper_fabs_ST0(cpu_env);
                         break;
-                    case 2:
-                        tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0,
-                                            s->mem_index, MO_LEQ);
-                        gen_helper_fldl_ST0(cpu_env, s->tmp1_i64);
+                    case 4: /* ftst */
+                        gen_helper_fldz_FT0(cpu_env);
+                        gen_helper_fcom_ST0_FT0(cpu_env);
                         break;
-                    case 3:
-                    default:
-                        tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
-                                            s->mem_index, MO_LESW);
-                        gen_helper_fildl_ST0(cpu_env, s->tmp2_i32);
+                    case 5: /* fxam */
+                        gen_helper_fxam_ST0(cpu_env);
                         break;
+                    default:
+                        goto unknown_op;
                     }
                     break;
-                case 1:
-                    /* XXX: the corresponding CPUID bit must be tested ! */
-                    switch(op >> 4) {
-                    case 1:
-                        gen_helper_fisttl_ST0(s->tmp2_i32, cpu_env);
-                        tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
-                                            s->mem_index, MO_LEUL);
+                case 0x0d: /* grp d9/5 */
+                    {
+                        switch (rm) {
+                        case 0:
+                            gen_helper_fpush(cpu_env);
+                            gen_helper_fld1_ST0(cpu_env);
+                            break;
+                        case 1:
+                            gen_helper_fpush(cpu_env);
+                            gen_helper_fldl2t_ST0(cpu_env);
+                            break;
+                        case 2:
+                            gen_helper_fpush(cpu_env);
+                            gen_helper_fldl2e_ST0(cpu_env);
+                            break;
+                        case 3:
+                            gen_helper_fpush(cpu_env);
+                            gen_helper_fldpi_ST0(cpu_env);
+                            break;
+                        case 4:
+                            gen_helper_fpush(cpu_env);
+                            gen_helper_fldlg2_ST0(cpu_env);
+                            break;
+                        case 5:
+                            gen_helper_fpush(cpu_env);
+                            gen_helper_fldln2_ST0(cpu_env);
+                            break;
+                        case 6:
+                            gen_helper_fpush(cpu_env);
+                            gen_helper_fldz_ST0(cpu_env);
+                            break;
+                        default:
+                            goto unknown_op;
+                        }
+                    }
+                    break;
+                case 0x0e: /* grp d9/6 */
+                    switch (rm) {
+                    case 0: /* f2xm1 */
+                        gen_helper_f2xm1(cpu_env);
                         break;
-                    case 2:
-                        gen_helper_fisttll_ST0(s->tmp1_i64, cpu_env);
-                        tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0,
-                                            s->mem_index, MO_LEQ);
+                    case 1: /* fyl2x */
+                        gen_helper_fyl2x(cpu_env);
+                        break;
+                    case 2: /* fptan */
+                        gen_helper_fptan(cpu_env);
+                        break;
+                    case 3: /* fpatan */
+                        gen_helper_fpatan(cpu_env);
+                        break;
+                    case 4: /* fxtract */
+                        gen_helper_fxtract(cpu_env);
+                        break;
+                    case 5: /* fprem1 */
+                        gen_helper_fprem1(cpu_env);
+                        break;
+                    case 6: /* fdecstp */
+                        gen_helper_fdecstp(cpu_env);
                         break;
-                    case 3:
                     default:
-                        gen_helper_fistt_ST0(s->tmp2_i32, cpu_env);
-                        tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
-                                            s->mem_index, MO_LEUW);
+                    case 7: /* fincstp */
+                        gen_helper_fincstp(cpu_env);
                         break;
                     }
-                    gen_helper_fpop(cpu_env);
                     break;
-                default:
-                    switch(op >> 4) {
-                    case 0:
-                        gen_helper_fsts_ST0(s->tmp2_i32, cpu_env);
-                        tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
-                                            s->mem_index, MO_LEUL);
+                case 0x0f: /* grp d9/7 */
+                    switch (rm) {
+                    case 0: /* fprem */
+                        gen_helper_fprem(cpu_env);
                         break;
-                    case 1:
-                        gen_helper_fistl_ST0(s->tmp2_i32, cpu_env);
-                        tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
-                                            s->mem_index, MO_LEUL);
+                    case 1: /* fyl2xp1 */
+                        gen_helper_fyl2xp1(cpu_env);
                         break;
-                    case 2:
-                        gen_helper_fstl_ST0(s->tmp1_i64, cpu_env);
-                        tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0,
-                                            s->mem_index, MO_LEQ);
+                    case 2: /* fsqrt */
+                        gen_helper_fsqrt(cpu_env);
+                        break;
+                    case 3: /* fsincos */
+                        gen_helper_fsincos(cpu_env);
+                        break;
+                    case 5: /* fscale */
+                        gen_helper_fscale(cpu_env);
+                        break;
+                    case 4: /* frndint */
+                        gen_helper_frndint(cpu_env);
+                        break;
+                    case 6: /* fsin */
+                        gen_helper_fsin(cpu_env);
                         break;
-                    case 3:
                     default:
-                        gen_helper_fist_ST0(s->tmp2_i32, cpu_env);
-                        tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
-                                            s->mem_index, MO_LEUW);
+                    case 7: /* fcos */
+                        gen_helper_fcos(cpu_env);
                         break;
                     }
-                    if ((op & 7) == 3)
-                        gen_helper_fpop(cpu_env);
-                    break;
-                }
-                break;
-            case 0x0c: /* fldenv mem */
-                gen_helper_fldenv(cpu_env, s->A0, tcg_const_i32(dflag - 1));
-                break;
-            case 0x0d: /* fldcw mem */
-                tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
-                                    s->mem_index, MO_LEUW);
-                gen_helper_fldcw(cpu_env, s->tmp2_i32);
-                break;
-            case 0x0e: /* fnstenv mem */
-                gen_helper_fstenv(cpu_env, s->A0, tcg_const_i32(dflag - 1));
-                break;
-            case 0x0f: /* fnstcw mem */
-                gen_helper_fnstcw(s->tmp2_i32, cpu_env);
-                tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
-                                    s->mem_index, MO_LEUW);
-                break;
-            case 0x1d: /* fldt mem */
-                gen_helper_fldt_ST0(cpu_env, s->A0);
-                break;
-            case 0x1f: /* fstpt mem */
-                gen_helper_fstt_ST0(cpu_env, s->A0);
-                gen_helper_fpop(cpu_env);
-                break;
-            case 0x2c: /* frstor mem */
-                gen_helper_frstor(cpu_env, s->A0, tcg_const_i32(dflag - 1));
-                break;
-            case 0x2e: /* fnsave mem */
-                gen_helper_fsave(cpu_env, s->A0, tcg_const_i32(dflag - 1));
-                break;
-            case 0x2f: /* fnstsw mem */
-                gen_helper_fnstsw(s->tmp2_i32, cpu_env);
-                tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
-                                    s->mem_index, MO_LEUW);
-                break;
-            case 0x3c: /* fbld */
-                gen_helper_fbld_ST0(cpu_env, s->A0);
-                break;
-            case 0x3e: /* fbstp */
-                gen_helper_fbst_ST0(cpu_env, s->A0);
-                gen_helper_fpop(cpu_env);
-                break;
-            case 0x3d: /* fildll */
-                tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0, s->mem_index, MO_LEQ);
-                gen_helper_fildll_ST0(cpu_env, s->tmp1_i64);
-                break;
-            case 0x3f: /* fistpll */
-                gen_helper_fistll_ST0(s->tmp1_i64, cpu_env);
-                tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0, s->mem_index, MO_LEQ);
-                gen_helper_fpop(cpu_env);
-                break;
-            default:
-                goto unknown_op;
-            }
-        } else {
-            /* register float ops */
-            opreg = rm;
-
-            switch(op) {
-            case 0x08: /* fld sti */
-                gen_helper_fpush(cpu_env);
-                gen_helper_fmov_ST0_STN(cpu_env,
-                                        tcg_const_i32((opreg + 1) & 7));
-                break;
-            case 0x09: /* fxchg sti */
-            case 0x29: /* fxchg4 sti, undocumented op */
-            case 0x39: /* fxchg7 sti, undocumented op */
-                gen_helper_fxchg_ST0_STN(cpu_env, tcg_const_i32(opreg));
-                break;
-            case 0x0a: /* grp d9/2 */
-                switch(rm) {
-                case 0: /* fnop */
-                    /* check exceptions (FreeBSD FPU probe) */
-                    gen_helper_fwait(cpu_env);
                     break;
-                default:
-                    goto unknown_op;
-                }
-                break;
-            case 0x0c: /* grp d9/4 */
-                switch(rm) {
-                case 0: /* fchs */
-                    gen_helper_fchs_ST0(cpu_env);
-                    break;
-                case 1: /* fabs */
-                    gen_helper_fabs_ST0(cpu_env);
+                case 0x00: case 0x01: case 0x04 ... 0x07: /* fxxx st, sti */
+                case 0x20: case 0x21: case 0x24 ... 0x27: /* fxxx sti, st */
+                case 0x30: case 0x31: case 0x34 ... 0x37: /* fxxxp sti, st */
+                    {
+                        int op1;
+
+                        op1 = op & 7;
+                        if (op >= 0x20) {
+                            gen_helper_fp_arith_STN_ST0(op1, opreg);
+                            if (op >= 0x30) {
+                                gen_helper_fpop(cpu_env);
+                            }
+                        } else {
+                            gen_helper_fmov_FT0_STN(cpu_env,
+                                                    tcg_const_i32(opreg));
+                            gen_helper_fp_arith_ST0_FT0(op1);
+                        }
+                    }
                     break;
-                case 4: /* ftst */
-                    gen_helper_fldz_FT0(cpu_env);
+                case 0x02: /* fcom */
+                case 0x22: /* fcom2, undocumented op */
+                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
                     gen_helper_fcom_ST0_FT0(cpu_env);
                     break;
-                case 5: /* fxam */
-                    gen_helper_fxam_ST0(cpu_env);
+                case 0x03: /* fcomp */
+                case 0x23: /* fcomp3, undocumented op */
+                case 0x32: /* fcomp5, undocumented op */
+                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fcom_ST0_FT0(cpu_env);
+                    gen_helper_fpop(cpu_env);
                     break;
-                default:
-                    goto unknown_op;
-                }
-                break;
-            case 0x0d: /* grp d9/5 */
-                {
+                case 0x15: /* da/5 */
                     switch(rm) {
-                    case 0:
-                        gen_helper_fpush(cpu_env);
-                        gen_helper_fld1_ST0(cpu_env);
-                        break;
-                    case 1:
-                        gen_helper_fpush(cpu_env);
-                        gen_helper_fldl2t_ST0(cpu_env);
+                    case 1: /* fucompp */
+                        gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(1));
+                        gen_helper_fucom_ST0_FT0(cpu_env);
+                        gen_helper_fpop(cpu_env);
+                        gen_helper_fpop(cpu_env);
                         break;
-                    case 2:
-                        gen_helper_fpush(cpu_env);
-                        gen_helper_fldl2e_ST0(cpu_env);
+                    default:
+                        goto unknown_op;
+                    }
+                    break;
+                case 0x1c:
+                    switch (rm) {
+                    case 0: /* feni (287 only, just do nop here) */
                         break;
-                    case 3:
-                        gen_helper_fpush(cpu_env);
-                        gen_helper_fldpi_ST0(cpu_env);
+                    case 1: /* fdisi (287 only, just do nop here) */
                         break;
-                    case 4:
-                        gen_helper_fpush(cpu_env);
-                        gen_helper_fldlg2_ST0(cpu_env);
+                    case 2: /* fclex */
+                        gen_helper_fclex(cpu_env);
+                        update_fip = update_fdp = false;
                         break;
-                    case 5:
-                        gen_helper_fpush(cpu_env);
-                        gen_helper_fldln2_ST0(cpu_env);
+                    case 3: /* fninit */
+                        gen_helper_fninit(cpu_env);
+                        update_fip = update_fdp = false;
                         break;
-                    case 6:
-                        gen_helper_fpush(cpu_env);
-                        gen_helper_fldz_ST0(cpu_env);
+                    case 4: /* fsetpm (287 only, just do nop here) */
                         break;
                     default:
                         goto unknown_op;
                     }
-                }
-                break;
-            case 0x0e: /* grp d9/6 */
-                switch(rm) {
-                case 0: /* f2xm1 */
-                    gen_helper_f2xm1(cpu_env);
-                    break;
-                case 1: /* fyl2x */
-                    gen_helper_fyl2x(cpu_env);
-                    break;
-                case 2: /* fptan */
-                    gen_helper_fptan(cpu_env);
-                    break;
-                case 3: /* fpatan */
-                    gen_helper_fpatan(cpu_env);
-                    break;
-                case 4: /* fxtract */
-                    gen_helper_fxtract(cpu_env);
-                    break;
-                case 5: /* fprem1 */
-                    gen_helper_fprem1(cpu_env);
                     break;
-                case 6: /* fdecstp */
-                    gen_helper_fdecstp(cpu_env);
-                    break;
-                default:
-                case 7: /* fincstp */
-                    gen_helper_fincstp(cpu_env);
-                    break;
-                }
-                break;
-            case 0x0f: /* grp d9/7 */
-                switch(rm) {
-                case 0: /* fprem */
-                    gen_helper_fprem(cpu_env);
-                    break;
-                case 1: /* fyl2xp1 */
-                    gen_helper_fyl2xp1(cpu_env);
-                    break;
-                case 2: /* fsqrt */
-                    gen_helper_fsqrt(cpu_env);
+                case 0x1d: /* fucomi */
+                    if (!(s->cpuid_features & CPUID_CMOV)) {
+                        goto illegal_op;
+                    }
+                    gen_update_cc_op(s);
+                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fucomi_ST0_FT0(cpu_env);
+                    set_cc_op(s, CC_OP_EFLAGS);
                     break;
-                case 3: /* fsincos */
-                    gen_helper_fsincos(cpu_env);
+                case 0x1e: /* fcomi */
+                    if (!(s->cpuid_features & CPUID_CMOV)) {
+                        goto illegal_op;
+                    }
+                    gen_update_cc_op(s);
+                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fcomi_ST0_FT0(cpu_env);
+                    set_cc_op(s, CC_OP_EFLAGS);
                     break;
-                case 5: /* fscale */
-                    gen_helper_fscale(cpu_env);
+                case 0x28: /* ffree sti */
+                    gen_helper_ffree_STN(cpu_env, tcg_const_i32(opreg));
                     break;
-                case 4: /* frndint */
-                    gen_helper_frndint(cpu_env);
+                case 0x2a: /* fst sti */
+                    gen_helper_fmov_STN_ST0(cpu_env, tcg_const_i32(opreg));
                     break;
-                case 6: /* fsin */
-                    gen_helper_fsin(cpu_env);
+                case 0x2b: /* fstp sti */
+                case 0x0b: /* fstp1 sti, undocumented op */
+                case 0x3a: /* fstp8 sti, undocumented op */
+                case 0x3b: /* fstp9 sti, undocumented op */
+                    gen_helper_fmov_STN_ST0(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fpop(cpu_env);
                     break;
-                default:
-                case 7: /* fcos */
-                    gen_helper_fcos(cpu_env);
+                case 0x2c: /* fucom st(i) */
+                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fucom_ST0_FT0(cpu_env);
                     break;
-                }
-                break;
-            case 0x00: case 0x01: case 0x04 ... 0x07: /* fxxx st, sti */
-            case 0x20: case 0x21: case 0x24 ... 0x27: /* fxxx sti, st */
-            case 0x30: case 0x31: case 0x34 ... 0x37: /* fxxxp sti, st */
-                {
-                    int op1;
-
-                    op1 = op & 7;
-                    if (op >= 0x20) {
-                        gen_helper_fp_arith_STN_ST0(op1, opreg);
-                        if (op >= 0x30)
-                            gen_helper_fpop(cpu_env);
-                    } else {
-                        gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
-                        gen_helper_fp_arith_ST0_FT0(op1);
-                    }
-                }
-                break;
-            case 0x02: /* fcom */
-            case 0x22: /* fcom2, undocumented op */
-                gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
-                gen_helper_fcom_ST0_FT0(cpu_env);
-                break;
-            case 0x03: /* fcomp */
-            case 0x23: /* fcomp3, undocumented op */
-            case 0x32: /* fcomp5, undocumented op */
-                gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
-                gen_helper_fcom_ST0_FT0(cpu_env);
-                gen_helper_fpop(cpu_env);
-                break;
-            case 0x15: /* da/5 */
-                switch(rm) {
-                case 1: /* fucompp */
-                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(1));
+                case 0x2d: /* fucomp st(i) */
+                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
                     gen_helper_fucom_ST0_FT0(cpu_env);
                     gen_helper_fpop(cpu_env);
-                    gen_helper_fpop(cpu_env);
                     break;
-                default:
-                    goto unknown_op;
-                }
-                break;
-            case 0x1c:
-                switch(rm) {
-                case 0: /* feni (287 only, just do nop here) */
-                    break;
-                case 1: /* fdisi (287 only, just do nop here) */
-                    break;
-                case 2: /* fclex */
-                    gen_helper_fclex(cpu_env);
+                case 0x33: /* de/3 */
+                    switch (rm) {
+                    case 1: /* fcompp */
+                        gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(1));
+                        gen_helper_fcom_ST0_FT0(cpu_env);
+                        gen_helper_fpop(cpu_env);
+                        gen_helper_fpop(cpu_env);
+                        break;
+                    default:
+                        goto unknown_op;
+                    }
                     break;
-                case 3: /* fninit */
-                    gen_helper_fninit(cpu_env);
+                case 0x38: /* ffreep sti, undocumented op */
+                    gen_helper_ffree_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fpop(cpu_env);
                     break;
-                case 4: /* fsetpm (287 only, just do nop here) */
+                case 0x3c: /* df/4 */
+                    switch (rm) {
+                    case 0:
+                        gen_helper_fnstsw(s->tmp2_i32, cpu_env);
+                        tcg_gen_extu_i32_tl(s->T0, s->tmp2_i32);
+                        gen_op_mov_reg_v(s, MO_16, R_EAX, s->T0);
+                        break;
+                    default:
+                        goto unknown_op;
+                    }
                     break;
-                default:
-                    goto unknown_op;
-                }
-                break;
-            case 0x1d: /* fucomi */
-                if (!(s->cpuid_features & CPUID_CMOV)) {
-                    goto illegal_op;
-                }
-                gen_update_cc_op(s);
-                gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
-                gen_helper_fucomi_ST0_FT0(cpu_env);
-                set_cc_op(s, CC_OP_EFLAGS);
-                break;
-            case 0x1e: /* fcomi */
-                if (!(s->cpuid_features & CPUID_CMOV)) {
-                    goto illegal_op;
-                }
-                gen_update_cc_op(s);
-                gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
-                gen_helper_fcomi_ST0_FT0(cpu_env);
-                set_cc_op(s, CC_OP_EFLAGS);
-                break;
-            case 0x28: /* ffree sti */
-                gen_helper_ffree_STN(cpu_env, tcg_const_i32(opreg));
-                break;
-            case 0x2a: /* fst sti */
-                gen_helper_fmov_STN_ST0(cpu_env, tcg_const_i32(opreg));
-                break;
-            case 0x2b: /* fstp sti */
-            case 0x0b: /* fstp1 sti, undocumented op */
-            case 0x3a: /* fstp8 sti, undocumented op */
-            case 0x3b: /* fstp9 sti, undocumented op */
-                gen_helper_fmov_STN_ST0(cpu_env, tcg_const_i32(opreg));
-                gen_helper_fpop(cpu_env);
-                break;
-            case 0x2c: /* fucom st(i) */
-                gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
-                gen_helper_fucom_ST0_FT0(cpu_env);
-                break;
-            case 0x2d: /* fucomp st(i) */
-                gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
-                gen_helper_fucom_ST0_FT0(cpu_env);
-                gen_helper_fpop(cpu_env);
-                break;
-            case 0x33: /* de/3 */
-                switch(rm) {
-                case 1: /* fcompp */
-                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(1));
-                    gen_helper_fcom_ST0_FT0(cpu_env);
+                case 0x3d: /* fucomip */
+                    if (!(s->cpuid_features & CPUID_CMOV)) {
+                        goto illegal_op;
+                    }
+                    gen_update_cc_op(s);
+                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fucomi_ST0_FT0(cpu_env);
                     gen_helper_fpop(cpu_env);
+                    set_cc_op(s, CC_OP_EFLAGS);
+                    break;
+                case 0x3e: /* fcomip */
+                    if (!(s->cpuid_features & CPUID_CMOV)) {
+                        goto illegal_op;
+                    }
+                    gen_update_cc_op(s);
+                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fcomi_ST0_FT0(cpu_env);
                     gen_helper_fpop(cpu_env);
+                    set_cc_op(s, CC_OP_EFLAGS);
                     break;
-                default:
-                    goto unknown_op;
-                }
-                break;
-            case 0x38: /* ffreep sti, undocumented op */
-                gen_helper_ffree_STN(cpu_env, tcg_const_i32(opreg));
-                gen_helper_fpop(cpu_env);
-                break;
-            case 0x3c: /* df/4 */
-                switch(rm) {
-                case 0:
-                    gen_helper_fnstsw(s->tmp2_i32, cpu_env);
-                    tcg_gen_extu_i32_tl(s->T0, s->tmp2_i32);
-                    gen_op_mov_reg_v(s, MO_16, R_EAX, s->T0);
+                case 0x10 ... 0x13: /* fcmovxx */
+                case 0x18 ... 0x1b:
+                    {
+                        int op1;
+                        TCGLabel *l1;
+                        static const uint8_t fcmov_cc[8] = {
+                            (JCC_B << 1),
+                            (JCC_Z << 1),
+                            (JCC_BE << 1),
+                            (JCC_P << 1),
+                        };
+
+                        if (!(s->cpuid_features & CPUID_CMOV)) {
+                            goto illegal_op;
+                        }
+                        op1 = fcmov_cc[op & 3] | (((op >> 3) & 1) ^ 1);
+                        l1 = gen_new_label();
+                        gen_jcc1_noeob(s, op1, l1);
+                        gen_helper_fmov_ST0_STN(cpu_env, tcg_const_i32(opreg));
+                        gen_set_label(l1);
+                    }
                     break;
                 default:
                     goto unknown_op;
                 }
-                break;
-            case 0x3d: /* fucomip */
-                if (!(s->cpuid_features & CPUID_CMOV)) {
-                    goto illegal_op;
-                }
-                gen_update_cc_op(s);
-                gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
-                gen_helper_fucomi_ST0_FT0(cpu_env);
-                gen_helper_fpop(cpu_env);
-                set_cc_op(s, CC_OP_EFLAGS);
-                break;
-            case 0x3e: /* fcomip */
-                if (!(s->cpuid_features & CPUID_CMOV)) {
-                    goto illegal_op;
-                }
-                gen_update_cc_op(s);
-                gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
-                gen_helper_fcomi_ST0_FT0(cpu_env);
-                gen_helper_fpop(cpu_env);
-                set_cc_op(s, CC_OP_EFLAGS);
-                break;
-            case 0x10 ... 0x13: /* fcmovxx */
-            case 0x18 ... 0x1b:
-                {
-                    int op1;
-                    TCGLabel *l1;
-                    static const uint8_t fcmov_cc[8] = {
-                        (JCC_B << 1),
-                        (JCC_Z << 1),
-                        (JCC_BE << 1),
-                        (JCC_P << 1),
-                    };
+            }
 
-                    if (!(s->cpuid_features & CPUID_CMOV)) {
-                        goto illegal_op;
-                    }
-                    op1 = fcmov_cc[op & 3] | (((op >> 3) & 1) ^ 1);
-                    l1 = gen_new_label();
-                    gen_jcc1_noeob(s, op1, l1);
-                    gen_helper_fmov_ST0_STN(cpu_env, tcg_const_i32(opreg));
-                    gen_set_label(l1);
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
                 }
-                break;
-            default:
-                goto unknown_op;
+                tcg_gen_ld32u_tl(s->T0, cpu_env,
+                                 offsetof(CPUX86State, segs[last_seg].selector));
+                tcg_gen_st16_tl(s->T0, cpu_env, offsetof(CPUX86State, fpds));
+
+                tcg_gen_st_tl(last_addr, cpu_env, offsetof(CPUX86State, fpdp));
             }
+
         }
         break;
         /************************/
-- 
2.25.1


