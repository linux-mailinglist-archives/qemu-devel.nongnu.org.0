Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE6C325C81
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 05:22:34 +0100 (CET)
Received: from localhost ([::1]:60960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFUe9-00079H-MC
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 23:22:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTkb-000361-3b
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:25:10 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:45893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTkT-0002oZ-T7
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:25:07 -0500
Received: by mail-pl1-x636.google.com with SMTP id w18so4544691plc.12
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 19:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=FKnryOF0s9Y/Io2fNYLbDDDtdLCCjWf3zSSF+1yjo44=;
 b=jBNqcCKm9habHdFw1/5GpAXbQTPBRsTgpfTRv/+BIO+CwlWaRuAcZNKRlW7EW63sA5
 lJWUJSVpQ/+dGUtJHPpjI254VRZzfrwTdjLn5h2h2pxRoROjx7ivMpTILJCC5qhTPOuO
 GHvlMCJyK91gZIJdDMlE04gy/qetLVvsM/VHR5Plukfiw4DA7OHmt34X4OynykP4lLZj
 9lpNh+Lf7dGJq72pFdolJu/B9gjQzlmO7/UpT3WUqhNbKXeS3wYGlLArB2CcRsOhcuWY
 8aFuBHNJ2spLgQyMMnkLy50RfWAHDMcfR9GaOpQON4B2nzxBOsa4dQNOu6EZMLwapqjY
 cGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=FKnryOF0s9Y/Io2fNYLbDDDtdLCCjWf3zSSF+1yjo44=;
 b=WDd/RTxpVTRTcxUY5q8XSBoIUOV3ztbesjy/wLsnmLcj/sXY1wLAjfnEyqBYqzLKRn
 U1XCR1vpzAdwsUCVxNXk+04hUNfrgJRKiZf9lqjvazWDpooa3QsGWC4YbAtIRzBB+0p2
 KSqbTN8l72m6/+A4umbA3RGtTnZlc1NfsaL47vSFm4CFmvfJXvIulNkl9MNTK+FH1hFn
 gQZJQjeKrmwGAzmaMd+smqofskkMloFXp7/9/mfaRtFh7Mqx3egAXdlZMXIeFP6cITUo
 oGwcZRPuOrtZQdb+k4VlSiHzcUSISb8XRGeE/c7Vyn0YxYlXA/5DF+PJy/wPdnVMY1Fi
 T7LA==
X-Gm-Message-State: AOAM530QVXBZbEgIgEg1MwoCjaiyukK5aQ1T1ng1KikeWjT8JGBVSY0s
 SSPg94K9XomCckQV8rrX7BZRDZQqkSGQzw==
X-Google-Smtp-Source: ABdhPJyBKxqXcMlSQwVnS4v9ggBN8LIOk04d5sFQtJ8ATXBDwYxhDJqPYh1pdJt4VIW4nTs64WDjJw==
X-Received: by 2002:a17:90a:4603:: with SMTP id
 w3mr1204120pjg.125.1614309900462; 
 Thu, 25 Feb 2021 19:25:00 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:25:00 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 60/75] target/riscv: rvv-1.0: floating-point/integer
 type-convert instructions
Date: Fri, 26 Feb 2021 11:18:44 +0800
Message-Id: <20210226031902.23656-61-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Frank Chang <frank.chang@sifive.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Add the following instructions:

* vfcvt.rtz.xu.f.v
* vfcvt.rtz.x.f.v

Also adjust GEN_OPFV_TRANS() to accept multiple floating-point rounding
modes.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode              | 11 ++--
 target/riscv/insn_trans/trans_rvv.c.inc | 83 ++++++++++++++++---------
 2 files changed, 59 insertions(+), 35 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 0d29ac2b2a1..c15ed5d3dbb 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -560,10 +560,13 @@ vmfge_vf        011111 . ..... ..... 101 ..... 1010111 @r_vm
 vfclass_v       010011 . ..... 10000 001 ..... 1010111 @r2_vm
 vfmerge_vfm     010111 0 ..... ..... 101 ..... 1010111 @r_vm_0
 vfmv_v_f        010111 1 00000 ..... 101 ..... 1010111 @r2
-vfcvt_xu_f_v    100010 . ..... 00000 001 ..... 1010111 @r2_vm
-vfcvt_x_f_v     100010 . ..... 00001 001 ..... 1010111 @r2_vm
-vfcvt_f_xu_v    100010 . ..... 00010 001 ..... 1010111 @r2_vm
-vfcvt_f_x_v     100010 . ..... 00011 001 ..... 1010111 @r2_vm
+
+vfcvt_xu_f_v       010010 . ..... 00000 001 ..... 1010111 @r2_vm
+vfcvt_x_f_v        010010 . ..... 00001 001 ..... 1010111 @r2_vm
+vfcvt_f_xu_v       010010 . ..... 00010 001 ..... 1010111 @r2_vm
+vfcvt_f_x_v        010010 . ..... 00011 001 ..... 1010111 @r2_vm
+vfcvt_rtz_xu_f_v   010010 . ..... 00110 001 ..... 1010111 @r2_vm
+vfcvt_rtz_x_f_v    010010 . ..... 00111 001 ..... 1010111 @r2_vm
 vfwcvt_xu_f_v   100010 . ..... 01000 001 ..... 1010111 @r2_vm
 vfwcvt_x_f_v    100010 . ..... 01001 001 ..... 1010111 @r2_vm
 vfwcvt_f_xu_v   100010 . ..... 01010 001 ..... 1010111 @r2_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 3f453ed457a..4f5f36aae8f 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1,5 +1,4 @@
 /*
- * RISC-V translation routines for the RVV Standard Extension.
  *
  * Copyright (c) 2020 T-Head Semiconductor Co., Ltd. All rights reserved.
  *
@@ -2600,33 +2599,41 @@ static bool opfv_check(DisasContext *s, arg_rmr *a)
            vext_check_ss(s, a->rd, a->rs2, a->vm);
 }
 
-#define GEN_OPFV_TRANS(NAME, CHECK)                                \
-static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
-{                                                                  \
-    if (CHECK(s, a)) {                                             \
-        uint32_t data = 0;                                         \
-        static gen_helper_gvec_3_ptr * const fns[3] = {            \
-            gen_helper_##NAME##_h,                                 \
-            gen_helper_##NAME##_w,                                 \
-            gen_helper_##NAME##_d,                                 \
-        };                                                         \
-        TCGLabel *over = gen_new_label();                          \
-        gen_set_rm(s, RISCV_FRM_DYN);                              \
-        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
-                                                                   \
-        data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
-        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
-        tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
-                           vreg_ofs(s, a->rs2), cpu_env, 0,        \
-                           s->vlen / 8, data, fns[s->sew - 1]);    \
-        mark_vs_dirty(s);                                          \
-        gen_set_label(over);                                       \
-        return true;                                               \
-    }                                                              \
-    return false;                                                  \
+static bool do_opfv(DisasContext *s, arg_rmr *a,
+                    gen_helper_gvec_3_ptr *fn,
+                    bool (*checkfn)(DisasContext *, arg_rmr *),
+                    int rm)
+{
+    if (checkfn(s, a)) {
+        uint32_t data = 0;
+        TCGLabel *over = gen_new_label();
+        gen_set_rm(s, rm);
+        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+
+        data = FIELD_DP32(data, VDATA, VM, a->vm);
+        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
+        tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
+                vreg_ofs(s, a->rs2), cpu_env, 0,
+                s->vlen / 8, data, fn);
+        mark_vs_dirty(s);
+        gen_set_label(over);
+        return true;
+    }
+    return false;
+}
+
+#define GEN_OPFV_TRANS(NAME, CHECK, FRM)               \
+static bool trans_##NAME(DisasContext *s, arg_rmr *a)  \
+{                                                      \
+    static gen_helper_gvec_3_ptr * const fns[3] = {    \
+        gen_helper_##NAME##_h,                         \
+        gen_helper_##NAME##_w,                         \
+        gen_helper_##NAME##_d                          \
+    };                                                 \
+    return do_opfv(s, a, fns[s->sew - 1], CHECK, FRM); \
 }
 
-GEN_OPFV_TRANS(vfsqrt_v, opfv_check)
+GEN_OPFV_TRANS(vfsqrt_v, opfv_check, RISCV_FRM_DYN)
 
 /* Vector Floating-Point MIN/MAX Instructions */
 GEN_OPFVV_TRANS(vfmin_vv, opfvv_check)
@@ -2672,7 +2679,7 @@ GEN_OPFVF_TRANS(vmfgt_vf, opfvf_cmp_check)
 GEN_OPFVF_TRANS(vmfge_vf, opfvf_cmp_check)
 
 /* Vector Floating-Point Classify Instruction */
-GEN_OPFV_TRANS(vfclass_v, opfv_check)
+GEN_OPFV_TRANS(vfclass_v, opfv_check, RISCV_FRM_DYN)
 
 /* Vector Floating-Point Merge Instruction */
 GEN_OPFVF_TRANS(vfmerge_vfm,  opfvf_check)
@@ -2727,10 +2734,24 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
 }
 
 /* Single-Width Floating-Point/Integer Type-Convert Instructions */
-GEN_OPFV_TRANS(vfcvt_xu_f_v, opfv_check)
-GEN_OPFV_TRANS(vfcvt_x_f_v, opfv_check)
-GEN_OPFV_TRANS(vfcvt_f_xu_v, opfv_check)
-GEN_OPFV_TRANS(vfcvt_f_x_v, opfv_check)
+#define GEN_OPFV_CVT_TRANS(NAME, HELPER, FRM)               \
+static bool trans_##NAME(DisasContext *s, arg_rmr *a)       \
+{                                                           \
+    static gen_helper_gvec_3_ptr * const fns[3] = {         \
+        gen_helper_##HELPER##_h,                            \
+        gen_helper_##HELPER##_w,                            \
+        gen_helper_##HELPER##_d                             \
+    };                                                      \
+    return do_opfv(s, a, fns[s->sew - 1], opfv_check, FRM); \
+}
+
+GEN_OPFV_CVT_TRANS(vfcvt_xu_f_v, vfcvt_xu_f_v, RISCV_FRM_DYN)
+GEN_OPFV_CVT_TRANS(vfcvt_x_f_v, vfcvt_x_f_v, RISCV_FRM_DYN)
+GEN_OPFV_CVT_TRANS(vfcvt_f_xu_v, vfcvt_f_xu_v, RISCV_FRM_DYN)
+GEN_OPFV_CVT_TRANS(vfcvt_f_x_v, vfcvt_f_x_v, RISCV_FRM_DYN)
+/* Reuse the helper functions from vfcvt.xu.f.v and vfcvt.x.f.v */
+GEN_OPFV_CVT_TRANS(vfcvt_rtz_xu_f_v, vfcvt_xu_f_v, RISCV_FRM_RTZ)
+GEN_OPFV_CVT_TRANS(vfcvt_rtz_x_f_v, vfcvt_x_f_v, RISCV_FRM_RTZ)
 
 /* Widening Floating-Point/Integer Type-Convert Instructions */
 
-- 
2.17.1


