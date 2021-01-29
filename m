Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BB0308E57
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 21:23:23 +0100 (CET)
Received: from localhost ([::1]:38146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5aId-000266-1m
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 15:23:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5a6e-0006gx-AB
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:11:00 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:46304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5a6b-000887-HZ
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:10:59 -0500
Received: by mail-pg1-x52c.google.com with SMTP id r38so7387770pgk.13
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 12:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ub1nQ8Juh5iPdbwapeH2zYEuiPf/Gb0rWV9s3PXu8aw=;
 b=xdC+CjGDaN5m50Vt6ZkgSde9MoVys2bmO2yyVMN4IBlqMivWEo4jHUyayUxZfwjyfo
 PSG3KAgjuB/m2Y06RNFy9vm5EDoMXF8NVeqV2zdMEn6X/CR6Va9YsVeuuVw3fCwD4wRl
 yGV8fSYOjQ6JuoBEW85Q3hMGXK7PBzn9sT2J3AnxLKqCg6QoocjTqUSiNulQ5nhwdD9d
 hFYdcnlW5wZ0iSb9a0BwPVh3Lyreh/+KKh4DL8m81SV8/7kKgar87T/6/QhDhcyvKGEd
 KMbGVbKTcVx9f1701o0vkfrtKiE/83n/J/m3u35vrDd9sXWJiVAtmrJFriFJalgaxCVE
 2i5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ub1nQ8Juh5iPdbwapeH2zYEuiPf/Gb0rWV9s3PXu8aw=;
 b=MF+iiDFd0PbymsCcC62YdxSTs+iEAECsRzQRvG7gIq+RFqzNm3uk7pCs0EdchCb+IS
 wEeZub8xpf4ujdPOVg6n1crXfj9dtkFpYdDwP6x2I+Dgb1XVcUwt7NtdRd/wiwv3W2gL
 pIb489KOmbnRwP/MeTKxFkBSlYiCBE8rsBD4s5+4pZuOLGC80G4J9Zm4be2kuoSs1R7K
 MR81VSu35j+1Cb0JAVVjhUqXz25JGKl5oiJUkDIIHVTzL/nnr6A3zlFIbyq01UTJ0vg8
 pX1AyFsm0w5q81YCmBr4AKbJE+ToQWF30mFn44x2rDq4ASoFGX0RoGosOoH7qlDcn4VF
 icgQ==
X-Gm-Message-State: AOAM530BcBt6j93Su36LXklbU+s/x2CQ9OjYcbY8PvIRVRyAaiRS3HWG
 ecXQx51cJjP0lPPgpuMPTrQySZRFcRrWRCSf
X-Google-Smtp-Source: ABdhPJzhwFSTar5uIzZaWxqJ/g639X384ay0MftcyB7FC2oB0FWGeT39N7AIHUlvEiP4zcrUaNu0Hg==
X-Received: by 2002:a63:43c6:: with SMTP id q189mr6290836pga.245.1611951056128; 
 Fri, 29 Jan 2021 12:10:56 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id d133sm9247265pfd.6.2021.01.29.12.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 12:10:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/24] tcg/i386: Split out constraint sets to
 tcg-target-con-set.h
Date: Fri, 29 Jan 2021 10:10:19 -1000
Message-Id: <20210129201028.787853-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210129201028.787853-1-richard.henderson@linaro.org>
References: <20210129201028.787853-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This exports the constraint sets from tcg_target_op_def to
a place we will be able to manipulate more in future.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target-con-set.h |  55 ++++++++++
 tcg/i386/tcg-target.h         |   1 +
 tcg/tcg.c                     | 119 +++++++++++++++++++++
 tcg/i386/tcg-target.c.inc     | 194 ++++++++++++----------------------
 4 files changed, 242 insertions(+), 127 deletions(-)
 create mode 100644 tcg/i386/tcg-target-con-set.h

diff --git a/tcg/i386/tcg-target-con-set.h b/tcg/i386/tcg-target-con-set.h
new file mode 100644
index 0000000000..78774d1005
--- /dev/null
+++ b/tcg/i386/tcg-target-con-set.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Define i386 target-specific constraint sets.
+ * Copyright (c) 2021 Linaro
+ */
+
+/*
+ * C_On_Im(...) defines a constraint set with <n> outputs and <m> inputs.
+ * Each operand should be a sequence of constraint letters as defined by
+ * tcg-target-con-str.h; the constraint combination is inclusive or.
+ *
+ * C_N1_Im(...) defines a constraint set with 1 output and <m> inputs,
+ * except that the output must use a new register.
+ */
+C_O0_I1(r)
+C_O0_I2(L, L)
+C_O0_I2(qi, r)
+C_O0_I2(re, r)
+C_O0_I2(ri, r)
+C_O0_I2(r, re)
+C_O0_I2(s, L)
+C_O0_I2(x, r)
+C_O0_I3(L, L, L)
+C_O0_I3(s, L, L)
+C_O0_I4(L, L, L, L)
+C_O0_I4(r, r, ri, ri)
+C_O1_I1(r, 0)
+C_O1_I1(r, L)
+C_O1_I1(r, q)
+C_O1_I1(r, r)
+C_O1_I1(x, r)
+C_O1_I1(x, x)
+C_O1_I2(Q, 0, Q)
+C_O1_I2(q, r, re)
+C_O1_I2(r, 0, ci)
+C_O1_I2(r, 0, r)
+C_O1_I2(r, 0, re)
+C_O1_I2(r, 0, reZ)
+C_O1_I2(r, 0, ri)
+C_O1_I2(r, 0, rI)
+C_O1_I2(r, L, L)
+C_O1_I2(r, r, re)
+C_O1_I2(r, r, ri)
+C_O1_I2(r, r, rI)
+C_O1_I2(x, x, x)
+C_N1_I2(r, r, r)
+C_N1_I2(r, r, rW)
+C_O1_I3(x, x, x, x)
+C_O1_I4(r, r, re, r, 0)
+C_O1_I4(r, r, r, ri, ri)
+C_O2_I1(r, r, L)
+C_O2_I2(a, d, a, r)
+C_O2_I2(r, r, L, L)
+C_O2_I3(a, d, 0, 1, r)
+C_O2_I4(r, r, 0, 1, re, re)
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index b693d3692d..48a6f2a336 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -235,5 +235,6 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
 #define TCG_TARGET_NEED_LDST_LABELS
 #endif
 #define TCG_TARGET_NEED_POOL_LABELS
+#define TCG_TARGET_CON_SET_H
 
 #endif
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 39bcdff8dc..df9f32763e 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -69,7 +69,9 @@
 /* Forward declarations for functions declared in tcg-target.c.inc and
    used here. */
 static void tcg_target_init(TCGContext *s);
+#ifndef TCG_TARGET_CON_SET_H
 static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode);
+#endif
 static void tcg_target_qemu_prologue(TCGContext *s);
 static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
                         intptr_t value, intptr_t addend);
@@ -347,6 +349,112 @@ static void set_jmp_reset_offset(TCGContext *s, int which)
     s->tb_jmp_reset_offset[which] = tcg_current_code_size(s);
 }
 
+#ifdef TCG_TARGET_CON_SET_H
+#define C_PFX1(P, A)                    P##A
+#define C_PFX2(P, A, B)                 P##A##_##B
+#define C_PFX3(P, A, B, C)              P##A##_##B##_##C
+#define C_PFX4(P, A, B, C, D)           P##A##_##B##_##C##_##D
+#define C_PFX5(P, A, B, C, D, E)        P##A##_##B##_##C##_##D##_##E
+#define C_PFX6(P, A, B, C, D, E, F)     P##A##_##B##_##C##_##D##_##E##_##F
+
+/* Define an enumeration for the various combinations. */
+
+#define C_O0_I1(I1)                     C_PFX1(c_o0_i1_, I1),
+#define C_O0_I2(I1, I2)                 C_PFX2(c_o0_i2_, I1, I2),
+#define C_O0_I3(I1, I2, I3)             C_PFX3(c_o0_i3_, I1, I2, I3),
+#define C_O0_I4(I1, I2, I3, I4)         C_PFX4(c_o0_i4_, I1, I2, I3, I4),
+
+#define C_O1_I1(O1, I1)                 C_PFX2(c_o1_i1_, O1, I1),
+#define C_O1_I2(O1, I1, I2)             C_PFX3(c_o1_i2_, O1, I1, I2),
+#define C_O1_I3(O1, I1, I2, I3)         C_PFX4(c_o1_i3_, O1, I1, I2, I3),
+#define C_O1_I4(O1, I1, I2, I3, I4)     C_PFX5(c_o1_i4_, O1, I1, I2, I3, I4),
+
+#define C_N1_I2(O1, I1, I2)             C_PFX3(c_n1_i2_, O1, I1, I2),
+
+#define C_O2_I1(O1, O2, I1)             C_PFX3(c_o2_i1_, O1, O2, I1),
+#define C_O2_I2(O1, O2, I1, I2)         C_PFX4(c_o2_i2_, O1, O2, I1, I2),
+#define C_O2_I3(O1, O2, I1, I2, I3)     C_PFX5(c_o2_i3_, O1, O2, I1, I2, I3),
+#define C_O2_I4(O1, O2, I1, I2, I3, I4) C_PFX6(c_o2_i4_, O1, O2, I1, I2, I3, I4),
+
+typedef enum {
+#include "tcg-target-con-set.h"
+} TCGConstraintSetIndex;
+
+static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode);
+
+#undef C_O0_I1
+#undef C_O0_I2
+#undef C_O0_I3
+#undef C_O0_I4
+#undef C_O1_I1
+#undef C_O1_I2
+#undef C_O1_I3
+#undef C_O1_I4
+#undef C_N1_I2
+#undef C_O2_I1
+#undef C_O2_I2
+#undef C_O2_I3
+#undef C_O2_I4
+
+/* Put all of the constraint sets into an array, indexed by the enum. */
+
+#define C_O0_I1(I1)                     { .args_ct_str = { #I1 } },
+#define C_O0_I2(I1, I2)                 { .args_ct_str = { #I1, #I2 } },
+#define C_O0_I3(I1, I2, I3)             { .args_ct_str = { #I1, #I2, #I3 } },
+#define C_O0_I4(I1, I2, I3, I4)         { .args_ct_str = { #I1, #I2, #I3, #I4 } },
+
+#define C_O1_I1(O1, I1)                 { .args_ct_str = { #O1, #I1 } },
+#define C_O1_I2(O1, I1, I2)             { .args_ct_str = { #O1, #I1, #I2 } },
+#define C_O1_I3(O1, I1, I2, I3)         { .args_ct_str = { #O1, #I1, #I2, #I3 } },
+#define C_O1_I4(O1, I1, I2, I3, I4)     { .args_ct_str = { #O1, #I1, #I2, #I3, #I4 } },
+
+#define C_N1_I2(O1, I1, I2)             { .args_ct_str = { "&" #O1, #I1, #I2 } },
+
+#define C_O2_I1(O1, O2, I1)             { .args_ct_str = { #O1, #O2, #I1 } },
+#define C_O2_I2(O1, O2, I1, I2)         { .args_ct_str = { #O1, #O2, #I1, #I2 } },
+#define C_O2_I3(O1, O2, I1, I2, I3)     { .args_ct_str = { #O1, #O2, #I1, #I2, #I3 } },
+#define C_O2_I4(O1, O2, I1, I2, I3, I4) { .args_ct_str = { #O1, #O2, #I1, #I2, #I3, #I4 } },
+
+static const TCGTargetOpDef constraint_sets[] = {
+#include "tcg-target-con-set.h"
+};
+
+
+#undef C_O0_I1
+#undef C_O0_I2
+#undef C_O0_I3
+#undef C_O0_I4
+#undef C_O1_I1
+#undef C_O1_I2
+#undef C_O1_I3
+#undef C_O1_I4
+#undef C_N1_I2
+#undef C_O2_I1
+#undef C_O2_I2
+#undef C_O2_I3
+#undef C_O2_I4
+
+/* Expand the enumerator to be returned from tcg_target_op_def(). */
+
+#define C_O0_I1(I1)                     C_PFX1(c_o0_i1_, I1)
+#define C_O0_I2(I1, I2)                 C_PFX2(c_o0_i2_, I1, I2)
+#define C_O0_I3(I1, I2, I3)             C_PFX3(c_o0_i3_, I1, I2, I3)
+#define C_O0_I4(I1, I2, I3, I4)         C_PFX4(c_o0_i4_, I1, I2, I3, I4)
+
+#define C_O1_I1(O1, I1)                 C_PFX2(c_o1_i1_, O1, I1)
+#define C_O1_I2(O1, I1, I2)             C_PFX3(c_o1_i2_, O1, I1, I2)
+#define C_O1_I3(O1, I1, I2, I3)         C_PFX4(c_o1_i3_, O1, I1, I2, I3)
+#define C_O1_I4(O1, I1, I2, I3, I4)     C_PFX5(c_o1_i4_, O1, I1, I2, I3, I4)
+
+#define C_N1_I2(O1, I1, I2)             C_PFX3(c_n1_i2_, O1, I1, I2)
+
+#define C_O2_I1(O1, O2, I1)             C_PFX3(c_o2_i1_, O1, O2, I1)
+#define C_O2_I2(O1, O2, I1, I2)         C_PFX4(c_o2_i2_, O1, O2, I1, I2)
+#define C_O2_I3(O1, O2, I1, I2, I3)     C_PFX5(c_o2_i3_, O1, O2, I1, I2, I3)
+#define C_O2_I4(O1, O2, I1, I2, I3, I4) C_PFX6(c_o2_i4_, O1, O2, I1, I2, I3, I4)
+
+#endif /* TCG_TARGET_CON_SET_H */
+
 #include "tcg-target.c.inc"
 
 /* compare a pointer @ptr and a tb_tc @s */
@@ -2424,9 +2532,20 @@ static void process_op_defs(TCGContext *s)
             continue;
         }
 
+#ifdef TCG_TARGET_CON_SET_H
+        /*
+         * Macro magic should make it impossible, but double-check that
+         * the array index is in range.  Since the signness of an enum
+         * is implementation defined, force the result to unsigned.
+         */
+        unsigned con_set = tcg_target_op_def(op);
+        tcg_debug_assert(con_set < ARRAY_SIZE(constraint_sets));
+        tdefs = &constraint_sets[con_set];
+#else
         tdefs = tcg_target_op_def(op);
         /* Missing TCGTargetOpDef entry. */
         tcg_debug_assert(tdefs != NULL);
+#endif
 
         for (i = 0; i < nb_args; i++) {
             const char *ct_str = tdefs->args_ct_str[i];
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index d3cf97748a..40326c2806 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -2894,41 +2894,11 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     }
 }
 
-static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
+static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 {
-    static const TCGTargetOpDef r = { .args_ct_str = { "r" } };
-    static const TCGTargetOpDef ri_r = { .args_ct_str = { "ri", "r" } };
-    static const TCGTargetOpDef re_r = { .args_ct_str = { "re", "r" } };
-    static const TCGTargetOpDef qi_r = { .args_ct_str = { "qi", "r" } };
-    static const TCGTargetOpDef r_r = { .args_ct_str = { "r", "r" } };
-    static const TCGTargetOpDef r_q = { .args_ct_str = { "r", "q" } };
-    static const TCGTargetOpDef r_re = { .args_ct_str = { "r", "re" } };
-    static const TCGTargetOpDef r_0 = { .args_ct_str = { "r", "0" } };
-    static const TCGTargetOpDef r_r_ri = { .args_ct_str = { "r", "r", "ri" } };
-    static const TCGTargetOpDef r_r_re = { .args_ct_str = { "r", "r", "re" } };
-    static const TCGTargetOpDef r_0_r = { .args_ct_str = { "r", "0", "r" } };
-    static const TCGTargetOpDef r_0_re = { .args_ct_str = { "r", "0", "re" } };
-    static const TCGTargetOpDef r_0_ci = { .args_ct_str = { "r", "0", "ci" } };
-    static const TCGTargetOpDef r_L = { .args_ct_str = { "r", "L" } };
-    static const TCGTargetOpDef L_L = { .args_ct_str = { "L", "L" } };
-    static const TCGTargetOpDef s_L = { .args_ct_str = { "s", "L" } };
-    static const TCGTargetOpDef r_L_L = { .args_ct_str = { "r", "L", "L" } };
-    static const TCGTargetOpDef r_r_L = { .args_ct_str = { "r", "r", "L" } };
-    static const TCGTargetOpDef L_L_L = { .args_ct_str = { "L", "L", "L" } };
-    static const TCGTargetOpDef s_L_L = { .args_ct_str = { "s", "L", "L" } };
-    static const TCGTargetOpDef r_r_L_L
-        = { .args_ct_str = { "r", "r", "L", "L" } };
-    static const TCGTargetOpDef L_L_L_L
-        = { .args_ct_str = { "L", "L", "L", "L" } };
-    static const TCGTargetOpDef x_x = { .args_ct_str = { "x", "x" } };
-    static const TCGTargetOpDef x_x_x = { .args_ct_str = { "x", "x", "x" } };
-    static const TCGTargetOpDef x_x_x_x
-        = { .args_ct_str = { "x", "x", "x", "x" } };
-    static const TCGTargetOpDef x_r = { .args_ct_str = { "x", "r" } };
-
     switch (op) {
     case INDEX_op_goto_ptr:
-        return &r;
+        return C_O0_I1(r);
 
     case INDEX_op_ld8u_i32:
     case INDEX_op_ld8u_i64:
@@ -2942,22 +2912,25 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_ld32u_i64:
     case INDEX_op_ld32s_i64:
     case INDEX_op_ld_i64:
-        return &r_r;
+        return C_O1_I1(r, r);
 
     case INDEX_op_st8_i32:
     case INDEX_op_st8_i64:
-        return &qi_r;
+        return C_O0_I2(qi, r);
+
     case INDEX_op_st16_i32:
     case INDEX_op_st16_i64:
     case INDEX_op_st_i32:
     case INDEX_op_st32_i64:
-        return &ri_r;
+        return C_O0_I2(ri, r);
+
     case INDEX_op_st_i64:
-        return &re_r;
+        return C_O0_I2(re, r);
 
     case INDEX_op_add_i32:
     case INDEX_op_add_i64:
-        return &r_r_re;
+        return C_O1_I2(r, r, re);
+
     case INDEX_op_sub_i32:
     case INDEX_op_sub_i64:
     case INDEX_op_mul_i32:
@@ -2966,24 +2939,15 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_or_i64:
     case INDEX_op_xor_i32:
     case INDEX_op_xor_i64:
-        return &r_0_re;
+        return C_O1_I2(r, 0, re);
 
     case INDEX_op_and_i32:
     case INDEX_op_and_i64:
-        {
-            static const TCGTargetOpDef and
-                = { .args_ct_str = { "r", "0", "reZ" } };
-            return &and;
-        }
-        break;
+        return C_O1_I2(r, 0, reZ);
+
     case INDEX_op_andc_i32:
     case INDEX_op_andc_i64:
-        {
-            static const TCGTargetOpDef andc
-                = { .args_ct_str = { "r", "r", "rI" } };
-            return &andc;
-        }
-        break;
+        return C_O1_I2(r, r, rI);
 
     case INDEX_op_shl_i32:
     case INDEX_op_shl_i64:
@@ -2991,16 +2955,17 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_shr_i64:
     case INDEX_op_sar_i32:
     case INDEX_op_sar_i64:
-        return have_bmi2 ? &r_r_ri : &r_0_ci;
+        return have_bmi2 ? C_O1_I2(r, r, ri) : C_O1_I2(r, 0, ci);
+
     case INDEX_op_rotl_i32:
     case INDEX_op_rotl_i64:
     case INDEX_op_rotr_i32:
     case INDEX_op_rotr_i64:
-        return &r_0_ci;
+        return C_O1_I2(r, 0, ci);
 
     case INDEX_op_brcond_i32:
     case INDEX_op_brcond_i64:
-        return &r_re;
+        return C_O0_I2(r, re);
 
     case INDEX_op_bswap16_i32:
     case INDEX_op_bswap16_i64:
@@ -3012,13 +2977,14 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_not_i32:
     case INDEX_op_not_i64:
     case INDEX_op_extrh_i64_i32:
-        return &r_0;
+        return C_O1_I1(r, 0);
 
     case INDEX_op_ext8s_i32:
     case INDEX_op_ext8s_i64:
     case INDEX_op_ext8u_i32:
     case INDEX_op_ext8u_i64:
-        return &r_q;
+        return C_O1_I1(r, q);
+
     case INDEX_op_ext16s_i32:
     case INDEX_op_ext16s_i64:
     case INDEX_op_ext16u_i32:
@@ -3033,110 +2999,83 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_sextract_i32:
     case INDEX_op_ctpop_i32:
     case INDEX_op_ctpop_i64:
-        return &r_r;
+        return C_O1_I1(r, r);
+
     case INDEX_op_extract2_i32:
     case INDEX_op_extract2_i64:
-        return &r_0_r;
+        return C_O1_I2(r, 0, r);
 
     case INDEX_op_deposit_i32:
     case INDEX_op_deposit_i64:
-        {
-            static const TCGTargetOpDef dep
-                = { .args_ct_str = { "Q", "0", "Q" } };
-            return &dep;
-        }
+        return C_O1_I2(Q, 0, Q);
+
     case INDEX_op_setcond_i32:
     case INDEX_op_setcond_i64:
-        {
-            static const TCGTargetOpDef setc
-                = { .args_ct_str = { "q", "r", "re" } };
-            return &setc;
-        }
+        return C_O1_I2(q, r, re);
+
     case INDEX_op_movcond_i32:
     case INDEX_op_movcond_i64:
-        {
-            static const TCGTargetOpDef movc
-                = { .args_ct_str = { "r", "r", "re", "r", "0" } };
-            return &movc;
-        }
+        return C_O1_I4(r, r, re, r, 0);
+
     case INDEX_op_div2_i32:
     case INDEX_op_div2_i64:
     case INDEX_op_divu2_i32:
     case INDEX_op_divu2_i64:
-        {
-            static const TCGTargetOpDef div2
-                = { .args_ct_str = { "a", "d", "0", "1", "r" } };
-            return &div2;
-        }
+        return C_O2_I3(a, d, 0, 1, r);
+
     case INDEX_op_mulu2_i32:
     case INDEX_op_mulu2_i64:
     case INDEX_op_muls2_i32:
     case INDEX_op_muls2_i64:
-        {
-            static const TCGTargetOpDef mul2
-                = { .args_ct_str = { "a", "d", "a", "r" } };
-            return &mul2;
-        }
+        return C_O2_I2(a, d, a, r);
+
     case INDEX_op_add2_i32:
     case INDEX_op_add2_i64:
     case INDEX_op_sub2_i32:
     case INDEX_op_sub2_i64:
-        {
-            static const TCGTargetOpDef arith2
-                = { .args_ct_str = { "r", "r", "0", "1", "re", "re" } };
-            return &arith2;
-        }
+        return C_O2_I4(r, r, 0, 1, re, re);
+
     case INDEX_op_ctz_i32:
     case INDEX_op_ctz_i64:
-        {
-            static const TCGTargetOpDef ctz[2] = {
-                { .args_ct_str = { "&r", "r", "r" } },
-                { .args_ct_str = { "&r", "r", "rW" } },
-            };
-            return &ctz[have_bmi1];
-        }
+        return have_bmi1 ? C_N1_I2(r, r, rW) : C_N1_I2(r, r, r);
+
     case INDEX_op_clz_i32:
     case INDEX_op_clz_i64:
-        {
-            static const TCGTargetOpDef clz[2] = {
-                { .args_ct_str = { "&r", "r", "r" } },
-                { .args_ct_str = { "&r", "r", "rW" } },
-            };
-            return &clz[have_lzcnt];
-        }
+        return have_lzcnt ? C_N1_I2(r, r, rW) : C_N1_I2(r, r, r);
 
     case INDEX_op_qemu_ld_i32:
-        return TARGET_LONG_BITS <= TCG_TARGET_REG_BITS ? &r_L : &r_L_L;
+        return (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS
+                ? C_O1_I1(r, L) : C_O1_I2(r, L, L));
+
     case INDEX_op_qemu_st_i32:
-        return TARGET_LONG_BITS <= TCG_TARGET_REG_BITS ? &L_L : &L_L_L;
+        return (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS
+                ? C_O0_I2(L, L) : C_O0_I3(L, L, L));
     case INDEX_op_qemu_st8_i32:
-        return TARGET_LONG_BITS <= TCG_TARGET_REG_BITS ? &s_L : &s_L_L;
+        return (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS
+                ? C_O0_I2(s, L) : C_O0_I3(s, L, L));
+
     case INDEX_op_qemu_ld_i64:
-        return (TCG_TARGET_REG_BITS == 64 ? &r_L
-                : TARGET_LONG_BITS <= TCG_TARGET_REG_BITS ? &r_r_L
-                : &r_r_L_L);
+        return (TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, L)
+                : TARGET_LONG_BITS <= TCG_TARGET_REG_BITS ? C_O2_I1(r, r, L)
+                : C_O2_I2(r, r, L, L));
+
     case INDEX_op_qemu_st_i64:
-        return (TCG_TARGET_REG_BITS == 64 ? &L_L
-                : TARGET_LONG_BITS <= TCG_TARGET_REG_BITS ? &L_L_L
-                : &L_L_L_L);
+        return (TCG_TARGET_REG_BITS == 64 ? C_O0_I2(L, L)
+                : TARGET_LONG_BITS <= TCG_TARGET_REG_BITS ? C_O0_I3(L, L, L)
+                : C_O0_I4(L, L, L, L));
 
     case INDEX_op_brcond2_i32:
-        {
-            static const TCGTargetOpDef b2
-                = { .args_ct_str = { "r", "r", "ri", "ri" } };
-            return &b2;
-        }
+        return C_O0_I4(r, r, ri, ri);
+
     case INDEX_op_setcond2_i32:
-        {
-            static const TCGTargetOpDef s2
-                = { .args_ct_str = { "r", "r", "r", "ri", "ri" } };
-            return &s2;
-        }
+        return C_O1_I4(r, r, r, ri, ri);
 
     case INDEX_op_ld_vec:
-    case INDEX_op_st_vec:
     case INDEX_op_dupm_vec:
-        return &x_r;
+        return C_O1_I1(x, r);
+
+    case INDEX_op_st_vec:
+        return C_O0_I2(x, r);
 
     case INDEX_op_add_vec:
     case INDEX_op_sub_vec:
@@ -3171,21 +3110,22 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
 #if TCG_TARGET_REG_BITS == 32
     case INDEX_op_dup2_vec:
 #endif
-        return &x_x_x;
+        return C_O1_I2(x, x, x);
+
     case INDEX_op_abs_vec:
     case INDEX_op_dup_vec:
     case INDEX_op_shli_vec:
     case INDEX_op_shri_vec:
     case INDEX_op_sari_vec:
     case INDEX_op_x86_psrldq_vec:
-        return &x_x;
+        return C_O1_I1(x, x);
+
     case INDEX_op_x86_vpblendvb_vec:
-        return &x_x_x_x;
+        return C_O1_I3(x, x, x, x);
 
     default:
-        break;
+        g_assert_not_reached();
     }
-    return NULL;
 }
 
 int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
-- 
2.25.1


