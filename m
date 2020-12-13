Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1E42D9099
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 21:34:59 +0100 (CET)
Received: from localhost ([::1]:42672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koY54-0007eS-Ct
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 15:34:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXsK-0003XG-7D
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:21:48 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:54798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXsH-0005i1-Kl
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:21:47 -0500
Received: by mail-wm1-x32c.google.com with SMTP id d3so11953060wmb.4
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 12:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zC5YsscNbzWCzjRwHYTqYhMRZYSKGJAcauFwzW475P4=;
 b=O5cwCVELqRkpQhG/Gi+KnwgwwxeEQekbFMOxbxn3EvXx8HTPtFctBvGKvogIqcCBPg
 9K8JcXqvpjH4tAWCiTyYQYhkWlactnMHoiXjkV3JX93ZNQtVOaQVIuhtwbYpf98HZJZy
 sKW2oiB/is2596VNfV/I27rBx5k8M+R7i2GC2T14uKJW2leu6Q48IMCYuWSCu1hUYYpO
 G6Wfl7vvOgaMzqzU88K2uteFtoy9RlrfABtz50PLdlaggeA4CwBKpTEtxi8+ytrktA5Y
 OnVJDkJVa1D305ckcY3RUsLpmdPN13jd4Pl/VRe+JgSp8V0IGN4l8kdaM4lecNhx1jQS
 VSTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zC5YsscNbzWCzjRwHYTqYhMRZYSKGJAcauFwzW475P4=;
 b=hDlsWOkt633b8xF4nK1cfUsDGCg47IwlR9wrp6Y1OWitgFQ4ZlK95kNDxmSxhfNgzg
 y/Km0pDcbF+e/H43RypRuDo6WqRAHaIlLRB1CDcaMmQCtTE7lhCaevTh5liaqHD7oQqM
 L7cfVDD1AuE7hd7MTCFirE7SH3VruPYmY3ITQaVI2hg8u2AZ6D+GJ2Je1zxRqVRSOceg
 3CLm0H+952katJSX8RsPQgYLiWkNPhjpaiN0kzqp/FbjpY5Z5znk/Pn9fNukJ9Waz6+3
 R0ckN+cpC6TGCgi3oKoTPdhOdBKU/kXZh9M2DAQV7ZSgdiY8xcDdP22JXSxZYCZSiIkQ
 bQCA==
X-Gm-Message-State: AOAM5309g8gO55xMBsBHMMzHMdmPInIHd91PEPPXNyagkRqjTaCAHm1u
 OR2hbqZfasyopE5LHH5lEaGvHe9+fp8=
X-Google-Smtp-Source: ABdhPJyiCZwUbQMhykg7i7M1vk2uLxhJZJQlQw/cE6ZKBazOEyFejEzDz1Vnm1q6QoyBhIdJTR+o7Q==
X-Received: by 2002:a05:600c:210e:: with SMTP id
 u14mr24783077wml.48.1607890903664; 
 Sun, 13 Dec 2020 12:21:43 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id h5sm30146925wrp.56.2020.12.13.12.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 12:21:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/26] target/mips: Move cpu definitions,
 reset() and realize() to cpu.c
Date: Sun, 13 Dec 2020 21:19:43 +0100
Message-Id: <20201213201946.236123-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201213201946.236123-1-f4bug@amsat.org>
References: <20201213201946.236123-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Nothing TCG specific there, move to common cpu code.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201206233949.3783184-16-f4bug@amsat.org>
---
 target/mips/internal.h  |   4 -
 target/mips/cpu.c       | 243 ++++++++++++++++++++++++++++++++++++++++
 target/mips/translate.c | 240 ---------------------------------------
 3 files changed, 243 insertions(+), 244 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index bcd3d857ab6..0515966469b 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -207,10 +207,6 @@ static inline bool cpu_mips_hw_interrupts_pending(CPUMIPSState *env)
 
 void mips_tcg_init(void);
 
-/* TODO QOM'ify CPU reset and remove */
-void cpu_state_reset(CPUMIPSState *s);
-void cpu_mips_realize_env(CPUMIPSState *env);
-
 /* cp0_timer.c */
 uint32_t cpu_mips_get_count(CPUMIPSState *env);
 void cpu_mips_store_count(CPUMIPSState *env, uint32_t value);
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index c29fef29d00..f2c4de7d070 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -20,6 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/cutils.h"
+#include "qemu/qemu-print.h"
 #include "qapi/error.h"
 #include "cpu.h"
 #include "internal.h"
@@ -30,6 +31,7 @@
 #include "exec/exec-all.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-clock.h"
+#include "hw/semihosting/semihost.h"
 #include "qapi/qapi-commands-machine-target.h"
 
 static void mips_cpu_set_pc(CPUState *cs, vaddr value)
@@ -100,6 +102,247 @@ static bool mips_cpu_has_work(CPUState *cs)
     return has_work;
 }
 
+#include "translate_init.c.inc"
+
+static void cpu_mips_realize_env(CPUMIPSState *env)
+{
+    env->exception_base = (int32_t)0xBFC00000;
+
+#ifndef CONFIG_USER_ONLY
+    mmu_init(env, env->cpu_model);
+#endif
+    fpu_init(env, env->cpu_model);
+    mvp_init(env);
+}
+
+/* TODO QOM'ify CPU reset and remove */
+static void cpu_state_reset(CPUMIPSState *env)
+{
+    CPUState *cs = env_cpu(env);
+
+    /* Reset registers to their default values */
+    env->CP0_PRid = env->cpu_model->CP0_PRid;
+    env->CP0_Config0 = env->cpu_model->CP0_Config0;
+#ifdef TARGET_WORDS_BIGENDIAN
+    env->CP0_Config0 |= (1 << CP0C0_BE);
+#endif
+    env->CP0_Config1 = env->cpu_model->CP0_Config1;
+    env->CP0_Config2 = env->cpu_model->CP0_Config2;
+    env->CP0_Config3 = env->cpu_model->CP0_Config3;
+    env->CP0_Config4 = env->cpu_model->CP0_Config4;
+    env->CP0_Config4_rw_bitmask = env->cpu_model->CP0_Config4_rw_bitmask;
+    env->CP0_Config5 = env->cpu_model->CP0_Config5;
+    env->CP0_Config5_rw_bitmask = env->cpu_model->CP0_Config5_rw_bitmask;
+    env->CP0_Config6 = env->cpu_model->CP0_Config6;
+    env->CP0_Config6_rw_bitmask = env->cpu_model->CP0_Config6_rw_bitmask;
+    env->CP0_Config7 = env->cpu_model->CP0_Config7;
+    env->CP0_Config7_rw_bitmask = env->cpu_model->CP0_Config7_rw_bitmask;
+    env->CP0_LLAddr_rw_bitmask = env->cpu_model->CP0_LLAddr_rw_bitmask
+                                 << env->cpu_model->CP0_LLAddr_shift;
+    env->CP0_LLAddr_shift = env->cpu_model->CP0_LLAddr_shift;
+    env->SYNCI_Step = env->cpu_model->SYNCI_Step;
+    env->CCRes = env->cpu_model->CCRes;
+    env->CP0_Status_rw_bitmask = env->cpu_model->CP0_Status_rw_bitmask;
+    env->CP0_TCStatus_rw_bitmask = env->cpu_model->CP0_TCStatus_rw_bitmask;
+    env->CP0_SRSCtl = env->cpu_model->CP0_SRSCtl;
+    env->current_tc = 0;
+    env->SEGBITS = env->cpu_model->SEGBITS;
+    env->SEGMask = (target_ulong)((1ULL << env->cpu_model->SEGBITS) - 1);
+#if defined(TARGET_MIPS64)
+    if (env->cpu_model->insn_flags & ISA_MIPS3) {
+        env->SEGMask |= 3ULL << 62;
+    }
+#endif
+    env->PABITS = env->cpu_model->PABITS;
+    env->CP0_SRSConf0_rw_bitmask = env->cpu_model->CP0_SRSConf0_rw_bitmask;
+    env->CP0_SRSConf0 = env->cpu_model->CP0_SRSConf0;
+    env->CP0_SRSConf1_rw_bitmask = env->cpu_model->CP0_SRSConf1_rw_bitmask;
+    env->CP0_SRSConf1 = env->cpu_model->CP0_SRSConf1;
+    env->CP0_SRSConf2_rw_bitmask = env->cpu_model->CP0_SRSConf2_rw_bitmask;
+    env->CP0_SRSConf2 = env->cpu_model->CP0_SRSConf2;
+    env->CP0_SRSConf3_rw_bitmask = env->cpu_model->CP0_SRSConf3_rw_bitmask;
+    env->CP0_SRSConf3 = env->cpu_model->CP0_SRSConf3;
+    env->CP0_SRSConf4_rw_bitmask = env->cpu_model->CP0_SRSConf4_rw_bitmask;
+    env->CP0_SRSConf4 = env->cpu_model->CP0_SRSConf4;
+    env->CP0_PageGrain_rw_bitmask = env->cpu_model->CP0_PageGrain_rw_bitmask;
+    env->CP0_PageGrain = env->cpu_model->CP0_PageGrain;
+    env->CP0_EBaseWG_rw_bitmask = env->cpu_model->CP0_EBaseWG_rw_bitmask;
+    env->active_fpu.fcr0 = env->cpu_model->CP1_fcr0;
+    env->active_fpu.fcr31_rw_bitmask = env->cpu_model->CP1_fcr31_rw_bitmask;
+    env->active_fpu.fcr31 = env->cpu_model->CP1_fcr31;
+    env->msair = env->cpu_model->MSAIR;
+    env->insn_flags = env->cpu_model->insn_flags;
+
+#if defined(CONFIG_USER_ONLY)
+    env->CP0_Status = (MIPS_HFLAG_UM << CP0St_KSU);
+# ifdef TARGET_MIPS64
+    /* Enable 64-bit register mode.  */
+    env->CP0_Status |= (1 << CP0St_PX);
+# endif
+# ifdef TARGET_ABI_MIPSN64
+    /* Enable 64-bit address mode.  */
+    env->CP0_Status |= (1 << CP0St_UX);
+# endif
+    /*
+     * Enable access to the CPUNum, SYNCI_Step, CC, and CCRes RDHWR
+     * hardware registers.
+     */
+    env->CP0_HWREna |= 0x0000000F;
+    if (env->CP0_Config1 & (1 << CP0C1_FP)) {
+        env->CP0_Status |= (1 << CP0St_CU1);
+    }
+    if (env->CP0_Config3 & (1 << CP0C3_DSPP)) {
+        env->CP0_Status |= (1 << CP0St_MX);
+    }
+# if defined(TARGET_MIPS64)
+    /* For MIPS64, init FR bit to 1 if FPU unit is there and bit is writable. */
+    if ((env->CP0_Config1 & (1 << CP0C1_FP)) &&
+        (env->CP0_Status_rw_bitmask & (1 << CP0St_FR))) {
+        env->CP0_Status |= (1 << CP0St_FR);
+    }
+# endif
+#else /* !CONFIG_USER_ONLY */
+    if (env->hflags & MIPS_HFLAG_BMASK) {
+        /*
+         * If the exception was raised from a delay slot,
+         * come back to the jump.
+         */
+        env->CP0_ErrorEPC = (env->active_tc.PC
+                             - (env->hflags & MIPS_HFLAG_B16 ? 2 : 4));
+    } else {
+        env->CP0_ErrorEPC = env->active_tc.PC;
+    }
+    env->active_tc.PC = env->exception_base;
+    env->CP0_Random = env->tlb->nb_tlb - 1;
+    env->tlb->tlb_in_use = env->tlb->nb_tlb;
+    env->CP0_Wired = 0;
+    env->CP0_GlobalNumber = (cs->cpu_index & 0xFF) << CP0GN_VPId;
+    env->CP0_EBase = (cs->cpu_index & 0x3FF);
+    if (mips_um_ksegs_enabled()) {
+        env->CP0_EBase |= 0x40000000;
+    } else {
+        env->CP0_EBase |= (int32_t)0x80000000;
+    }
+    if (env->CP0_Config3 & (1 << CP0C3_CMGCR)) {
+        env->CP0_CMGCRBase = 0x1fbf8000 >> 4;
+    }
+    env->CP0_EntryHi_ASID_mask = (env->CP0_Config5 & (1 << CP0C5_MI)) ?
+            0x0 : (env->CP0_Config4 & (1 << CP0C4_AE)) ? 0x3ff : 0xff;
+    env->CP0_Status = (1 << CP0St_BEV) | (1 << CP0St_ERL);
+    /*
+     * Vectored interrupts not implemented, timer on int 7,
+     * no performance counters.
+     */
+    env->CP0_IntCtl = 0xe0000000;
+    {
+        int i;
+
+        for (i = 0; i < 7; i++) {
+            env->CP0_WatchLo[i] = 0;
+            env->CP0_WatchHi[i] = 0x80000000;
+        }
+        env->CP0_WatchLo[7] = 0;
+        env->CP0_WatchHi[7] = 0;
+    }
+    /* Count register increments in debug mode, EJTAG version 1 */
+    env->CP0_Debug = (1 << CP0DB_CNT) | (0x1 << CP0DB_VER);
+
+    cpu_mips_store_count(env, 1);
+
+    if (ase_mt_available(env)) {
+        int i;
+
+        /* Only TC0 on VPE 0 starts as active.  */
+        for (i = 0; i < ARRAY_SIZE(env->tcs); i++) {
+            env->tcs[i].CP0_TCBind = cs->cpu_index << CP0TCBd_CurVPE;
+            env->tcs[i].CP0_TCHalt = 1;
+        }
+        env->active_tc.CP0_TCHalt = 1;
+        cs->halted = 1;
+
+        if (cs->cpu_index == 0) {
+            /* VPE0 starts up enabled.  */
+            env->mvp->CP0_MVPControl |= (1 << CP0MVPCo_EVP);
+            env->CP0_VPEConf0 |= (1 << CP0VPEC0_MVP) | (1 << CP0VPEC0_VPA);
+
+            /* TC0 starts up unhalted.  */
+            cs->halted = 0;
+            env->active_tc.CP0_TCHalt = 0;
+            env->tcs[0].CP0_TCHalt = 0;
+            /* With thread 0 active.  */
+            env->active_tc.CP0_TCStatus = (1 << CP0TCSt_A);
+            env->tcs[0].CP0_TCStatus = (1 << CP0TCSt_A);
+        }
+    }
+
+    /*
+     * Configure default legacy segmentation control. We use this regardless of
+     * whether segmentation control is presented to the guest.
+     */
+    /* KSeg3 (seg0 0xE0000000..0xFFFFFFFF) */
+    env->CP0_SegCtl0 =   (CP0SC_AM_MK << CP0SC_AM);
+    /* KSeg2 (seg1 0xC0000000..0xDFFFFFFF) */
+    env->CP0_SegCtl0 |= ((CP0SC_AM_MSK << CP0SC_AM)) << 16;
+    /* KSeg1 (seg2 0xA0000000..0x9FFFFFFF) */
+    env->CP0_SegCtl1 =   (0 << CP0SC_PA) | (CP0SC_AM_UK << CP0SC_AM) |
+                         (2 << CP0SC_C);
+    /* KSeg0 (seg3 0x80000000..0x9FFFFFFF) */
+    env->CP0_SegCtl1 |= ((0 << CP0SC_PA) | (CP0SC_AM_UK << CP0SC_AM) |
+                         (3 << CP0SC_C)) << 16;
+    /* USeg (seg4 0x40000000..0x7FFFFFFF) */
+    env->CP0_SegCtl2 =   (2 << CP0SC_PA) | (CP0SC_AM_MUSK << CP0SC_AM) |
+                         (1 << CP0SC_EU) | (2 << CP0SC_C);
+    /* USeg (seg5 0x00000000..0x3FFFFFFF) */
+    env->CP0_SegCtl2 |= ((0 << CP0SC_PA) | (CP0SC_AM_MUSK << CP0SC_AM) |
+                         (1 << CP0SC_EU) | (2 << CP0SC_C)) << 16;
+    /* XKPhys (note, SegCtl2.XR = 0, so XAM won't be used) */
+    env->CP0_SegCtl1 |= (CP0SC_AM_UK << CP0SC1_XAM);
+#endif /* !CONFIG_USER_ONLY */
+    if ((env->insn_flags & ISA_MIPS32R6) &&
+        (env->active_fpu.fcr0 & (1 << FCR0_F64))) {
+        /* Status.FR = 0 mode in 64-bit FPU not allowed in R6 */
+        env->CP0_Status |= (1 << CP0St_FR);
+    }
+
+    if (env->insn_flags & ISA_MIPS32R6) {
+        /* PTW  =  1 */
+        env->CP0_PWSize = 0x40;
+        /* GDI  = 12 */
+        /* UDI  = 12 */
+        /* MDI  = 12 */
+        /* PRI  = 12 */
+        /* PTEI =  2 */
+        env->CP0_PWField = 0x0C30C302;
+    } else {
+        /* GDI  =  0 */
+        /* UDI  =  0 */
+        /* MDI  =  0 */
+        /* PRI  =  0 */
+        /* PTEI =  2 */
+        env->CP0_PWField = 0x02;
+    }
+
+    if (env->CP0_Config3 & (1 << CP0C3_ISA) & (1 << (CP0C3_ISA + 1))) {
+        /*  microMIPS on reset when Config3.ISA is 3 */
+        env->hflags |= MIPS_HFLAG_M16;
+    }
+
+    /* MSA */
+    if (env->CP0_Config3 & (1 << CP0C3_MSAP)) {
+        msa_reset(env);
+    }
+
+    compute_hflags(env);
+    restore_fp_status(env);
+    restore_pamask(env);
+    cs->exception_index = EXCP_NONE;
+
+    if (semihosting_get_argc()) {
+        /* UHI interface can be used to obtain argc and argv */
+        env->active_tc.gpr[4] = -1;
+    }
+}
+
 static void mips_cpu_reset(DeviceState *dev)
 {
     CPUState *s = CPU(dev);
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 84d2d44e5d5..19933b7868c 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -31753,246 +31753,6 @@ void mips_tcg_init(void)
 #endif
 }
 
-#include "translate_init.c.inc"
-
-void cpu_mips_realize_env(CPUMIPSState *env)
-{
-    env->exception_base = (int32_t)0xBFC00000;
-
-#ifndef CONFIG_USER_ONLY
-    mmu_init(env, env->cpu_model);
-#endif
-    fpu_init(env, env->cpu_model);
-    mvp_init(env);
-}
-
-void cpu_state_reset(CPUMIPSState *env)
-{
-    CPUState *cs = env_cpu(env);
-
-    /* Reset registers to their default values */
-    env->CP0_PRid = env->cpu_model->CP0_PRid;
-    env->CP0_Config0 = env->cpu_model->CP0_Config0;
-#ifdef TARGET_WORDS_BIGENDIAN
-    env->CP0_Config0 |= (1 << CP0C0_BE);
-#endif
-    env->CP0_Config1 = env->cpu_model->CP0_Config1;
-    env->CP0_Config2 = env->cpu_model->CP0_Config2;
-    env->CP0_Config3 = env->cpu_model->CP0_Config3;
-    env->CP0_Config4 = env->cpu_model->CP0_Config4;
-    env->CP0_Config4_rw_bitmask = env->cpu_model->CP0_Config4_rw_bitmask;
-    env->CP0_Config5 = env->cpu_model->CP0_Config5;
-    env->CP0_Config5_rw_bitmask = env->cpu_model->CP0_Config5_rw_bitmask;
-    env->CP0_Config6 = env->cpu_model->CP0_Config6;
-    env->CP0_Config6_rw_bitmask = env->cpu_model->CP0_Config6_rw_bitmask;
-    env->CP0_Config7 = env->cpu_model->CP0_Config7;
-    env->CP0_Config7_rw_bitmask = env->cpu_model->CP0_Config7_rw_bitmask;
-    env->CP0_LLAddr_rw_bitmask = env->cpu_model->CP0_LLAddr_rw_bitmask
-                                 << env->cpu_model->CP0_LLAddr_shift;
-    env->CP0_LLAddr_shift = env->cpu_model->CP0_LLAddr_shift;
-    env->SYNCI_Step = env->cpu_model->SYNCI_Step;
-    env->CCRes = env->cpu_model->CCRes;
-    env->CP0_Status_rw_bitmask = env->cpu_model->CP0_Status_rw_bitmask;
-    env->CP0_TCStatus_rw_bitmask = env->cpu_model->CP0_TCStatus_rw_bitmask;
-    env->CP0_SRSCtl = env->cpu_model->CP0_SRSCtl;
-    env->current_tc = 0;
-    env->SEGBITS = env->cpu_model->SEGBITS;
-    env->SEGMask = (target_ulong)((1ULL << env->cpu_model->SEGBITS) - 1);
-#if defined(TARGET_MIPS64)
-    if (env->cpu_model->insn_flags & ISA_MIPS3) {
-        env->SEGMask |= 3ULL << 62;
-    }
-#endif
-    env->PABITS = env->cpu_model->PABITS;
-    env->CP0_SRSConf0_rw_bitmask = env->cpu_model->CP0_SRSConf0_rw_bitmask;
-    env->CP0_SRSConf0 = env->cpu_model->CP0_SRSConf0;
-    env->CP0_SRSConf1_rw_bitmask = env->cpu_model->CP0_SRSConf1_rw_bitmask;
-    env->CP0_SRSConf1 = env->cpu_model->CP0_SRSConf1;
-    env->CP0_SRSConf2_rw_bitmask = env->cpu_model->CP0_SRSConf2_rw_bitmask;
-    env->CP0_SRSConf2 = env->cpu_model->CP0_SRSConf2;
-    env->CP0_SRSConf3_rw_bitmask = env->cpu_model->CP0_SRSConf3_rw_bitmask;
-    env->CP0_SRSConf3 = env->cpu_model->CP0_SRSConf3;
-    env->CP0_SRSConf4_rw_bitmask = env->cpu_model->CP0_SRSConf4_rw_bitmask;
-    env->CP0_SRSConf4 = env->cpu_model->CP0_SRSConf4;
-    env->CP0_PageGrain_rw_bitmask = env->cpu_model->CP0_PageGrain_rw_bitmask;
-    env->CP0_PageGrain = env->cpu_model->CP0_PageGrain;
-    env->CP0_EBaseWG_rw_bitmask = env->cpu_model->CP0_EBaseWG_rw_bitmask;
-    env->active_fpu.fcr0 = env->cpu_model->CP1_fcr0;
-    env->active_fpu.fcr31_rw_bitmask = env->cpu_model->CP1_fcr31_rw_bitmask;
-    env->active_fpu.fcr31 = env->cpu_model->CP1_fcr31;
-    env->msair = env->cpu_model->MSAIR;
-    env->insn_flags = env->cpu_model->insn_flags;
-
-#if defined(CONFIG_USER_ONLY)
-    env->CP0_Status = (MIPS_HFLAG_UM << CP0St_KSU);
-# ifdef TARGET_MIPS64
-    /* Enable 64-bit register mode.  */
-    env->CP0_Status |= (1 << CP0St_PX);
-# endif
-# ifdef TARGET_ABI_MIPSN64
-    /* Enable 64-bit address mode.  */
-    env->CP0_Status |= (1 << CP0St_UX);
-# endif
-    /*
-     * Enable access to the CPUNum, SYNCI_Step, CC, and CCRes RDHWR
-     * hardware registers.
-     */
-    env->CP0_HWREna |= 0x0000000F;
-    if (env->CP0_Config1 & (1 << CP0C1_FP)) {
-        env->CP0_Status |= (1 << CP0St_CU1);
-    }
-    if (env->CP0_Config3 & (1 << CP0C3_DSPP)) {
-        env->CP0_Status |= (1 << CP0St_MX);
-    }
-# if defined(TARGET_MIPS64)
-    /* For MIPS64, init FR bit to 1 if FPU unit is there and bit is writable. */
-    if ((env->CP0_Config1 & (1 << CP0C1_FP)) &&
-        (env->CP0_Status_rw_bitmask & (1 << CP0St_FR))) {
-        env->CP0_Status |= (1 << CP0St_FR);
-    }
-# endif
-#else
-    if (env->hflags & MIPS_HFLAG_BMASK) {
-        /*
-         * If the exception was raised from a delay slot,
-         * come back to the jump.
-         */
-        env->CP0_ErrorEPC = (env->active_tc.PC
-                             - (env->hflags & MIPS_HFLAG_B16 ? 2 : 4));
-    } else {
-        env->CP0_ErrorEPC = env->active_tc.PC;
-    }
-    env->active_tc.PC = env->exception_base;
-    env->CP0_Random = env->tlb->nb_tlb - 1;
-    env->tlb->tlb_in_use = env->tlb->nb_tlb;
-    env->CP0_Wired = 0;
-    env->CP0_GlobalNumber = (cs->cpu_index & 0xFF) << CP0GN_VPId;
-    env->CP0_EBase = (cs->cpu_index & 0x3FF);
-    if (mips_um_ksegs_enabled()) {
-        env->CP0_EBase |= 0x40000000;
-    } else {
-        env->CP0_EBase |= (int32_t)0x80000000;
-    }
-    if (env->CP0_Config3 & (1 << CP0C3_CMGCR)) {
-        env->CP0_CMGCRBase = 0x1fbf8000 >> 4;
-    }
-    env->CP0_EntryHi_ASID_mask = (env->CP0_Config5 & (1 << CP0C5_MI)) ?
-            0x0 : (env->CP0_Config4 & (1 << CP0C4_AE)) ? 0x3ff : 0xff;
-    env->CP0_Status = (1 << CP0St_BEV) | (1 << CP0St_ERL);
-    /*
-     * Vectored interrupts not implemented, timer on int 7,
-     * no performance counters.
-     */
-    env->CP0_IntCtl = 0xe0000000;
-    {
-        int i;
-
-        for (i = 0; i < 7; i++) {
-            env->CP0_WatchLo[i] = 0;
-            env->CP0_WatchHi[i] = 0x80000000;
-        }
-        env->CP0_WatchLo[7] = 0;
-        env->CP0_WatchHi[7] = 0;
-    }
-    /* Count register increments in debug mode, EJTAG version 1 */
-    env->CP0_Debug = (1 << CP0DB_CNT) | (0x1 << CP0DB_VER);
-
-    cpu_mips_store_count(env, 1);
-
-    if (ase_mt_available(env)) {
-        int i;
-
-        /* Only TC0 on VPE 0 starts as active.  */
-        for (i = 0; i < ARRAY_SIZE(env->tcs); i++) {
-            env->tcs[i].CP0_TCBind = cs->cpu_index << CP0TCBd_CurVPE;
-            env->tcs[i].CP0_TCHalt = 1;
-        }
-        env->active_tc.CP0_TCHalt = 1;
-        cs->halted = 1;
-
-        if (cs->cpu_index == 0) {
-            /* VPE0 starts up enabled.  */
-            env->mvp->CP0_MVPControl |= (1 << CP0MVPCo_EVP);
-            env->CP0_VPEConf0 |= (1 << CP0VPEC0_MVP) | (1 << CP0VPEC0_VPA);
-
-            /* TC0 starts up unhalted.  */
-            cs->halted = 0;
-            env->active_tc.CP0_TCHalt = 0;
-            env->tcs[0].CP0_TCHalt = 0;
-            /* With thread 0 active.  */
-            env->active_tc.CP0_TCStatus = (1 << CP0TCSt_A);
-            env->tcs[0].CP0_TCStatus = (1 << CP0TCSt_A);
-        }
-    }
-
-    /*
-     * Configure default legacy segmentation control. We use this regardless of
-     * whether segmentation control is presented to the guest.
-     */
-    /* KSeg3 (seg0 0xE0000000..0xFFFFFFFF) */
-    env->CP0_SegCtl0 =   (CP0SC_AM_MK << CP0SC_AM);
-    /* KSeg2 (seg1 0xC0000000..0xDFFFFFFF) */
-    env->CP0_SegCtl0 |= ((CP0SC_AM_MSK << CP0SC_AM)) << 16;
-    /* KSeg1 (seg2 0xA0000000..0x9FFFFFFF) */
-    env->CP0_SegCtl1 =   (0 << CP0SC_PA) | (CP0SC_AM_UK << CP0SC_AM) |
-                         (2 << CP0SC_C);
-    /* KSeg0 (seg3 0x80000000..0x9FFFFFFF) */
-    env->CP0_SegCtl1 |= ((0 << CP0SC_PA) | (CP0SC_AM_UK << CP0SC_AM) |
-                         (3 << CP0SC_C)) << 16;
-    /* USeg (seg4 0x40000000..0x7FFFFFFF) */
-    env->CP0_SegCtl2 =   (2 << CP0SC_PA) | (CP0SC_AM_MUSK << CP0SC_AM) |
-                         (1 << CP0SC_EU) | (2 << CP0SC_C);
-    /* USeg (seg5 0x00000000..0x3FFFFFFF) */
-    env->CP0_SegCtl2 |= ((0 << CP0SC_PA) | (CP0SC_AM_MUSK << CP0SC_AM) |
-                         (1 << CP0SC_EU) | (2 << CP0SC_C)) << 16;
-    /* XKPhys (note, SegCtl2.XR = 0, so XAM won't be used) */
-    env->CP0_SegCtl1 |= (CP0SC_AM_UK << CP0SC1_XAM);
-#endif
-    if ((env->insn_flags & ISA_MIPS32R6) &&
-        (env->active_fpu.fcr0 & (1 << FCR0_F64))) {
-        /* Status.FR = 0 mode in 64-bit FPU not allowed in R6 */
-        env->CP0_Status |= (1 << CP0St_FR);
-    }
-
-    if (env->insn_flags & ISA_MIPS32R6) {
-        /* PTW  =  1 */
-        env->CP0_PWSize = 0x40;
-        /* GDI  = 12 */
-        /* UDI  = 12 */
-        /* MDI  = 12 */
-        /* PRI  = 12 */
-        /* PTEI =  2 */
-        env->CP0_PWField = 0x0C30C302;
-    } else {
-        /* GDI  =  0 */
-        /* UDI  =  0 */
-        /* MDI  =  0 */
-        /* PRI  =  0 */
-        /* PTEI =  2 */
-        env->CP0_PWField = 0x02;
-    }
-
-    if (env->CP0_Config3 & (1 << CP0C3_ISA) & (1 << (CP0C3_ISA + 1))) {
-        /*  microMIPS on reset when Config3.ISA is 3 */
-        env->hflags |= MIPS_HFLAG_M16;
-    }
-
-    /* MSA */
-    if (env->CP0_Config3 & (1 << CP0C3_MSAP)) {
-        msa_reset(env);
-    }
-
-    compute_hflags(env);
-    restore_fp_status(env);
-    restore_pamask(env);
-    cs->exception_index = EXCP_NONE;
-
-    if (semihosting_get_argc()) {
-        /* UHI interface can be used to obtain argc and argv */
-        env->active_tc.gpr[4] = -1;
-    }
-}
-
 void restore_state_to_opc(CPUMIPSState *env, TranslationBlock *tb,
                           target_ulong *data)
 {
-- 
2.26.2


