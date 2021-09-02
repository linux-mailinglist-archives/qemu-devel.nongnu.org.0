Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C313FEFE7
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 17:12:24 +0200 (CEST)
Received: from localhost ([::1]:45698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLoO7-0005U5-4q
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 11:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLoL7-0000R4-AU
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 11:09:17 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:54898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLoL4-0003Of-Sz
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 11:09:17 -0400
Received: by mail-wm1-x330.google.com with SMTP id g138so1512672wmg.4
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 08:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1GDIll3Av4qQx8oCwKBUtu2UrHTCpi3Blkr0Kr5nmJg=;
 b=asQzEQcvty1KByuCZjXGLEW2Ezsw8VDK/HEzIonZkHcN+fzZZ/yGoQDEP/GlihlEt6
 P7eYYqA3+ur9ejxvSgD9zGLxVmvQEz8gxAQdGz26dzLSC9hXbWxK6UczIVmnAO1NHRpe
 y3upnhOO4R8wv30cBfWFZDQWz7Wo8CObEjchfHqG1OJnUhl8/vKxK8v+wP9ylq5tUEY3
 u51OIhvENneRNNn43HMk/8i3KBAmOKrTD1uxGV28KFs4voJGbVjh8QDal0pgG35kE31e
 +Nzv+ID9BEDkYO07XoI+5rDks9CkX2gGGxE+IxXy1XJhC1TK2GSdnyOjlRRn+Knhh9z1
 utvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1GDIll3Av4qQx8oCwKBUtu2UrHTCpi3Blkr0Kr5nmJg=;
 b=FsRmYKd7tFaPPkELdbxDcK/AWE/F4Y6vR9tjVp5/65c0P91M2Smdx0gBoZO+/pI8FT
 YBajzX2i9bbIs8wz7ILTIt8TwKxpS173aNnkI83lSR4+lQP2IBdxPy7rodLRJ50Mw2H3
 ZycSVmsUfhMumTWy60VIwMzW6vlb9YdwCzd+9RZUVgZKToRTse6s10jcCLsw39vc6bSj
 2ioBQeSWSnE45pYYNun7bXzULk4sYJ3XbIQ5PCPHlEumWx6F6oYIJzgVvk6fWk41xKlm
 yB7+zV4+yiNoWYhZnhp8z5xnYybbMaICX/tjsJ0i/q0gVMOo6VIeZNxaEv0Mz6o4n7jj
 psow==
X-Gm-Message-State: AOAM530wvY6ShJv1iVAWjnsZr+YnAbEiw+6rVZ/UP/MRTxrgNLvuo6jd
 95RdFLu+DXHfSO4szAwrSaooWw==
X-Google-Smtp-Source: ABdhPJzPRUtME3bEuGybo9N+TiIH4FGx2+4WjEvIg3Fao3BVyL/x/g6Xm2Q+uYa9zgEJCalLXsaiRQ==
X-Received: by 2002:a7b:cb01:: with SMTP id u1mr3624272wmj.152.1630595353529; 
 Thu, 02 Sep 2021 08:09:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c24sm2107842wrb.57.2021.09.02.08.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 08:09:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/4] target/arm: Add TB flag for "MVE insns not predicated"
Date: Thu,  2 Sep 2021 16:09:07 +0100
Message-Id: <20210902150910.15748-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210902150910.15748-1-peter.maydell@linaro.org>
References: <20210902150910.15748-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Our current codegen for MVE always calls out to helper functions,
because some byte lanes might be predicated. The common case is
that in fact there is no predication active and all lanes should
be updated together, so we can produce better code by detecting
that and using the TCG generic vector infrastructure.

Add a TB flag that is set when we can guarantee that there
is no active MVE predication, and a bool in the DisasContext.
Subsequent patches will use this flag to generate improved
code for some instructions.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Another of those awkward-to-review patches where the interesting
question is "did I miss anywhere where we set v7m.vpr to non-0
or v7m.ltpsize to non-4 while in the middle of a TB ?" ...

I've left the TB flag as non-cached because there seemed to
be an irritatingly large set of places where we'd have to do
an hflags recomputation.
---
 target/arm/cpu.h              |  4 +++-
 target/arm/translate.h        |  2 ++
 target/arm/helper.c           | 23 +++++++++++++++++++++++
 target/arm/translate-m-nocp.c |  8 ++++++++
 target/arm/translate-mve.c    |  9 ++++++++-
 target/arm/translate-vfp.c    |  3 +++
 target/arm/translate.c        |  4 ++++
 7 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 6a987f65e41..460d611e65e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3440,7 +3440,7 @@ typedef ARMCPU ArchCPU;
  * | TBFLAG_AM32 |          +-----+----------+
  * |             |                |TBFLAG_M32|
  * +-------------+----------------+----------+
- *  31         23                5 4        0
+ *  31         23                6 5        0
  *
  * Unless otherwise noted, these bits are cached in env->hflags.
  */
@@ -3497,6 +3497,8 @@ FIELD(TBFLAG_M32, LSPACT, 2, 1)                 /* Not cached. */
 FIELD(TBFLAG_M32, NEW_FP_CTXT_NEEDED, 3, 1)     /* Not cached. */
 /* Set if FPCCR.S does not match current security state */
 FIELD(TBFLAG_M32, FPCCR_S_WRONG, 4, 1)          /* Not cached. */
+/* Set if MVE insns are definitely not predicated */
+FIELD(TBFLAG_M32, MVE_NO_PRED, 5, 1)            /* Not cached. */
 
 /*
  * Bit usage when in AArch64 state
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 8636c20c3b4..908b8ded8ee 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -98,6 +98,8 @@ typedef struct DisasContext {
     bool hstr_active;
     /* True if memory operations require alignment */
     bool align_mem;
+    /* True if MVE insns are definitely not predicated for any reason */
+    bool mve_no_pred;
     /*
      * >= 0, a copy of PSTATE.BTYPE, which will be 0 without v8.5-BTI.
      *  < 0, set by the current instruction.
diff --git a/target/arm/helper.c b/target/arm/helper.c
index a7ae78146d4..cf41b746b64 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13673,6 +13673,25 @@ static inline void assert_hflags_rebuild_correctly(CPUARMState *env)
 #endif
 }
 
+static bool mve_no_predication(CPUARMState *env)
+{
+    /*
+     * Return true if there is definitely no predication of MVE
+     * instructions for any reason. (Returning false even if there
+     * isn't any predication is OK; generated code will just be
+     * a little worse.)
+     * We do not account here for partial insn execution due to
+     * ECI bits as those are already in the TB flags elsewhere.
+     */
+    if (env->v7m.vpr) {
+        return false;
+    }
+    if (env->v7m.ltpsize < 4) {
+        return false;
+    }
+    return true;
+}
+
 void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags)
 {
@@ -13712,6 +13731,10 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
             if (env->v7m.fpccr[is_secure] & R_V7M_FPCCR_LSPACT_MASK) {
                 DP_TBFLAG_M32(flags, LSPACT, 1);
             }
+
+            if (mve_no_predication(env)) {
+                DP_TBFLAG_M32(flags, MVE_NO_PRED, 1);
+            }
         } else {
             /*
              * Note that XSCALE_CPAR shares bits with VECSTRIDE.
diff --git a/target/arm/translate-m-nocp.c b/target/arm/translate-m-nocp.c
index 5eab04832cd..79613fc150a 100644
--- a/target/arm/translate-m-nocp.c
+++ b/target/arm/translate-m-nocp.c
@@ -92,6 +92,8 @@ static bool trans_VLLDM_VLSTM(DisasContext *s, arg_VLLDM_VLSTM *a)
         gen_helper_v7m_vlstm(cpu_env, fptr);
     }
     tcg_temp_free_i32(fptr);
+    /* VLLDM or VLSTM helpers might have updated vpr or ltpsize */
+    s->mve_no_pred = false;
 
     clear_eci_state(s);
 
@@ -326,6 +328,7 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
     case ARM_VFP_FPSCR:
         tmp = loadfn(s, opaque, true);
         gen_helper_vfp_set_fpscr(cpu_env, tmp);
+        s->mve_no_pred = false;
         tcg_temp_free_i32(tmp);
         gen_lookup_tb(s);
         break;
@@ -397,6 +400,7 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
         store_cpu_field(control, v7m.control[M_REG_S]);
         tcg_gen_andi_i32(tmp, tmp, ~FPCR_NZCV_MASK);
         gen_helper_vfp_set_fpscr(cpu_env, tmp);
+        s->mve_no_pred = false;
         tcg_temp_free_i32(tmp);
         tcg_temp_free_i32(sfpa);
         break;
@@ -409,6 +413,7 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
         }
         tmp = loadfn(s, opaque, true);
         store_cpu_field(tmp, v7m.vpr);
+        s->mve_no_pred = false;
         break;
     case ARM_VFP_P0:
     {
@@ -418,6 +423,7 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
         tcg_gen_deposit_i32(vpr, vpr, tmp,
                             R_V7M_VPR_P0_SHIFT, R_V7M_VPR_P0_LENGTH);
         store_cpu_field(vpr, v7m.vpr);
+        s->mve_no_pred = false;
         tcg_temp_free_i32(tmp);
         break;
     }
@@ -500,6 +506,7 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
         store_cpu_field(control, v7m.control[M_REG_S]);
         fpscr = load_cpu_field(v7m.fpdscr[M_REG_NS]);
         gen_helper_vfp_set_fpscr(cpu_env, fpscr);
+        s->mve_no_pred = false;
         tcg_temp_free_i32(fpscr);
         lookup_tb = true;
         break;
@@ -549,6 +556,7 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
         zero = tcg_const_i32(0);
         tcg_gen_movcond_i32(TCG_COND_EQ, fpscr, sfpa, zero, fpdscr, fpscr);
         gen_helper_vfp_set_fpscr(cpu_env, fpscr);
+        s->mve_no_pred = false;
         tcg_temp_free_i32(zero);
         tcg_temp_free_i32(sfpa);
         tcg_temp_free_i32(fpdscr);
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 2ed91577ec8..d95807541b1 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -810,7 +810,11 @@ DO_LOGIC(VORR, gen_helper_mve_vorr)
 DO_LOGIC(VORN, gen_helper_mve_vorn)
 DO_LOGIC(VEOR, gen_helper_mve_veor)
 
-DO_LOGIC(VPSEL, gen_helper_mve_vpsel)
+static bool trans_VPSEL(DisasContext *s, arg_2op *a)
+{
+    s->mve_no_pred = false;
+    return do_2op(s, a, gen_helper_mve_vpsel);
+}
 
 #define DO_2OP(INSN, FN) \
     static bool trans_##INSN(DisasContext *s, arg_2op *a)       \
@@ -1366,6 +1370,7 @@ static bool trans_VPNOT(DisasContext *s, arg_VPNOT *a)
     }
 
     gen_helper_mve_vpnot(cpu_env);
+    s->mve_no_pred = false;
     mve_update_eci(s);
     return true;
 }
@@ -1852,6 +1857,7 @@ static bool do_vcmp(DisasContext *s, arg_vcmp *a, MVEGenCmpFn *fn)
         /* VPT */
         gen_vpst(s, a->mask);
     }
+    s->mve_no_pred = false;
     mve_update_eci(s);
     return true;
 }
@@ -1883,6 +1889,7 @@ static bool do_vcmp_scalar(DisasContext *s, arg_vcmp_scalar *a,
         /* VPT */
         gen_vpst(s, a->mask);
     }
+    s->mve_no_pred = false;
     mve_update_eci(s);
     return true;
 }
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index e2eb797c829..155ca69075b 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -128,6 +128,8 @@ static void gen_preserve_fp_state(DisasContext *s)
          * any further FP insns in this TB.
          */
         s->v7m_lspact = false;
+        /* Helper might have updated vpr or ltpsize */
+        s->mve_no_pred = false;
     }
 }
 
@@ -164,6 +166,7 @@ static void gen_update_fp_context(DisasContext *s)
 
         fpscr = load_cpu_field(v7m.fpdscr[s->v8m_secure]);
         gen_helper_vfp_set_fpscr(cpu_env, fpscr);
+        s->mve_no_pred = false;
         tcg_temp_free_i32(fpscr);
         if (dc_isar_feature(aa32_mve, s)) {
             TCGv_i32 z32 = tcg_const_i32(0);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 24b7f49d767..54c31ad6dec 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8464,6 +8464,7 @@ static bool trans_DLS(DisasContext *s, arg_DLS *a)
         /* DLSTP: set FPSCR.LTPSIZE */
         tmp = tcg_const_i32(a->size);
         store_cpu_field(tmp, v7m.ltpsize);
+        s->mve_no_pred = false;
     }
     return true;
 }
@@ -8529,6 +8530,7 @@ static bool trans_WLS(DisasContext *s, arg_WLS *a)
         assert(ok);
         tmp = tcg_const_i32(a->size);
         store_cpu_field(tmp, v7m.ltpsize);
+        s->mve_no_pred = false;
     }
     gen_jmp_tb(s, s->base.pc_next, 1);
 
@@ -8711,6 +8713,7 @@ static bool trans_VCTP(DisasContext *s, arg_VCTP *a)
     gen_helper_mve_vctp(cpu_env, masklen);
     tcg_temp_free_i32(masklen);
     tcg_temp_free_i32(rn_shifted);
+    s->mve_no_pred = false;
     mve_update_eci(s);
     return true;
 }
@@ -9370,6 +9373,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
         dc->v7m_new_fp_ctxt_needed =
             EX_TBFLAG_M32(tb_flags, NEW_FP_CTXT_NEEDED);
         dc->v7m_lspact = EX_TBFLAG_M32(tb_flags, LSPACT);
+        dc->mve_no_pred = EX_TBFLAG_M32(tb_flags, MVE_NO_PRED) && dc->eci == 0;
     } else {
         dc->debug_target_el = EX_TBFLAG_ANY(tb_flags, DEBUG_TARGET_EL);
         dc->sctlr_b = EX_TBFLAG_A32(tb_flags, SCTLR__B);
-- 
2.20.1


