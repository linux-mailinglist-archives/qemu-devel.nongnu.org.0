Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AE33C7538
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:46:44 +0200 (CEST)
Received: from localhost ([::1]:36996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3LYR-00076b-MX
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:46:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3LUC-0006sj-GF
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:42:21 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:39799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3LU8-0005dy-6Q
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:42:20 -0400
Received: by mail-pf1-x436.google.com with SMTP id b12so20158184pfv.6
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 09:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9Vn3OZCvKq6jSOiidVy5UivM/a7wIKe+2cpNk3bOhtM=;
 b=kK9Un3gciO8zsk1qIulRH828nLWrtn7Tzye9QMDw85jBTR6LPibvcaCzeP6q0mVtDc
 aFjkr3yAUW+TmwcieqNoNjHyhHD4ozaAsrvc9m/Pwo6X+JI5VP9uWHOhcP1YQW6Ur7Bz
 QxLIPJ4JUVvNZNW0hmjiZmzxLm5iNP3ObJSO4PTjAUcG/sPIqqlWsd8qNyatuPvfWK0o
 K/dfViFouyFngXjJ16rSE7T08JYN7upEMtLizDwfc2oXJRJT/6H33yLeg/7X3GkRNEvt
 HA/o1+hUcwpMXJBaIzXKjmLhnDd2eNBPoZaOALK8FxCQOr3ZXIOuVOJ5rhqXglWvTc7t
 hyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9Vn3OZCvKq6jSOiidVy5UivM/a7wIKe+2cpNk3bOhtM=;
 b=KB7nTJwUEGYrzohgxGi8YIFQarq7BuLo7rf0D/RgCIFiai6qfzIAuHsYyTa/HgqtJ9
 x4bIpMuZwZ4BsxBl/zNR013rojIqK4eaad3ihmJUAze50hNfIeT2FobChmvC/B4zNMwX
 MDbh6Pv95pXLsrIre4A0knU6paNRgb8QgNYGWy4z1ja3xpbRSuGhVAsWZv2LSxl5iTvj
 gg+GVmf38e2rgp1SChzR/NCgW+sFubvEzmzCh0eFFfWiuJ66Gh4rGfFSYcemeebkwpiv
 2GWIUPA5ok5UTcXqRYSwYt1cjBZv7NPDqEwY25mV7TG2vQzEHGsJbkEziqar1HZkMBsI
 MBfA==
X-Gm-Message-State: AOAM531tAOnQupl4qUYStGAMU1Xlve38++E5fV9Ppm6PIXrvpzf0LZyV
 /WjzuXQKlntXrF3wNnYD/K4qN1HmxMU9yg==
X-Google-Smtp-Source: ABdhPJyawCuFHZIFA000nJRkcHXQGK+uiA6dpObHz90pHrJW0K4KTirDcRQBhj9RhShXwpkH+Kbi1Q==
X-Received: by 2002:a62:8209:0:b029:32e:54d4:7e27 with SMTP id
 w9-20020a6282090000b029032e54d47e27mr2507125pfd.10.1626194534880; 
 Tue, 13 Jul 2021 09:42:14 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z13sm4947865pfn.94.2021.07.13.09.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 09:42:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/14] target/i386: Correct implementation for FCS, FIP,
 FDS and FDP
Date: Tue, 13 Jul 2021 09:42:01 -0700
Message-Id: <20210713164211.1520109-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210713164211.1520109-1-richard.henderson@linaro.org>
References: <20210713164211.1520109-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Ziqiao Kong <ziqiaokong@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ziqiao Kong <ziqiaokong@gmail.com>

Update FCS:FIP and FDS:FDP according to the Intel Manual Vol.1 8.1.8.
Note that CPUID.(EAX=07H,ECX=0H):EBX[bit 13] is not implemented by
design in this patch and will be added along with TCG features flag
in a separate patch later.

Signed-off-by: Ziqiao Kong <ziqiaokong@gmail.com>
Message-Id: <20210530150112.74411-2-ziqiaokong@gmail.com>
[rth: Push FDS/FDP handling down into mod != 3 case; free last_addr.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/cpu.h            |  2 ++
 target/i386/tcg/fpu_helper.c | 20 ++++++++++-------
 target/i386/tcg/translate.c  | 43 +++++++++++++++++++++++++++++++++++-
 3 files changed, 56 insertions(+), 9 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 8f3747dd28..3dc52deaef 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1437,6 +1437,8 @@ typedef struct CPUX86State {
     FPReg fpregs[8];
     /* KVM-only so far */
     uint16_t fpop;
+    uint16_t fpcs;
+    uint16_t fpds;
     uint64_t fpip;
     uint64_t fpdp;
 
diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index beb63be432..cdd8e9f947 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -731,6 +731,10 @@ static void do_fninit(CPUX86State *env)
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
@@ -2378,19 +2382,19 @@ static void do_fstenv(CPUX86State *env, target_ulong ptr, int data32,
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
 
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index a43e577019..8520d5a1e2 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -5920,6 +5920,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         /* floats */
     case 0xd8 ... 0xdf:
         {
+            bool update_fip = true;
+
             if (s->flags & (HF_EM_MASK | HF_TS_MASK)) {
                 /* if CR0.EM or CR0.TS are set, generate an FPU exception */
                 /* XXX: what to do if illegal op ? */
@@ -5932,7 +5934,14 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             op = ((b & 7) << 3) | ((modrm >> 3) & 7);
             if (mod != 3) {
                 /* memory op */
-                gen_lea_modrm(env, s, modrm);
+                AddressParts a = gen_lea_modrm_0(env, s, modrm);
+                TCGv ea = gen_lea_modrm_1(s, a);
+                TCGv last_addr = tcg_temp_new();
+                bool update_fdp = true;
+
+                tcg_gen_mov_tl(last_addr, ea);
+                gen_lea_v_seg(s, s->aflag, ea, a.def_seg, s->override);
+
                 switch (op) {
                 case 0x00 ... 0x07: /* fxxxs */
                 case 0x10 ... 0x17: /* fixxxl */
@@ -6060,20 +6069,24 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -6085,15 +6098,18 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -6116,6 +6132,19 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 default:
                     goto unknown_op;
                 }
+
+                if (update_fdp) {
+                    int last_seg = s->override >= 0 ? s->override : a.def_seg;
+
+                    tcg_gen_ld_i32(s->tmp2_i32, cpu_env,
+                                   offsetof(CPUX86State,
+                                            segs[last_seg].selector));
+                    tcg_gen_st16_i32(s->tmp2_i32, cpu_env,
+                                     offsetof(CPUX86State, fpds));
+                    tcg_gen_st_tl(last_addr, cpu_env,
+                                  offsetof(CPUX86State, fpdp));
+                }
+                tcg_temp_free(last_addr);
             } else {
                 /* register float ops */
                 opreg = rm;
@@ -6136,6 +6165,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                     case 0: /* fnop */
                         /* check exceptions (FreeBSD FPU probe) */
                         gen_helper_fwait(cpu_env);
+                        update_fip = false;
                         break;
                     default:
                         goto unknown_op;
@@ -6305,9 +6335,11 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                         break;
                     case 2: /* fclex */
                         gen_helper_fclex(cpu_env);
+                        update_fip = false;
                         break;
                     case 3: /* fninit */
                         gen_helper_fninit(cpu_env);
+                        update_fip = false;
                         break;
                     case 4: /* fsetpm (287 only, just do nop here) */
                         break;
@@ -6428,6 +6460,15 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                     goto unknown_op;
                 }
             }
+
+            if (update_fip) {
+                tcg_gen_ld_i32(s->tmp2_i32, cpu_env,
+                               offsetof(CPUX86State, segs[R_CS].selector));
+                tcg_gen_st16_i32(s->tmp2_i32, cpu_env,
+                                 offsetof(CPUX86State, fpcs));
+                tcg_gen_st_tl(tcg_constant_tl(pc_start - s->cs_base),
+                              cpu_env, offsetof(CPUX86State, fpip));
+            }
         }
         break;
         /************************/
-- 
2.25.1


