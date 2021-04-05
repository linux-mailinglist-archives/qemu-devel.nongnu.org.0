Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1F8354302
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 16:51:39 +0200 (CEST)
Received: from localhost ([::1]:34818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTQZm-0008Ft-95
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 10:51:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1lTQHO-0001TS-O9
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:32:38 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:35614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1lTQHI-0001oh-CN
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:32:36 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 r14-20020a05600c35ceb029010fe0f81519so4227279wmq.0
 for <qemu-devel@nongnu.org>; Mon, 05 Apr 2021 07:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LIEX6afAEpUS1c9q4OBty86jWj4nISipcykSLPdMOu4=;
 b=rSXk+NJmCXYBjT0FXAkd7Q98/fevptNYZ1LstdPrGpQ0TMCejv1cmrnOpGcyU3tBhk
 xXVYzadzcyo1SPGUYNEKOYX6st3fn3PtLbK8Djr6kj1yY5CvmyoQ5V1btxy2/RWet8jk
 YFlSyGQ1yimcAyhtJgnq29kY/HMYulCABK63ELmlVaVnanhvpLE9Xlg8WSuIbjXdEXWE
 MaMr1rTd3SBoNu//vf/GpuHZO1+mRhLMfCExzYn/+PedNdwB52WVut4MNtifFDHR6O3n
 vyIdAA52Ygm3VRUhY9gr8AIdpDlLTnh/EN+iimAiiRcmxc3OzfnmfftYVcDoiRWaTDP5
 zNKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LIEX6afAEpUS1c9q4OBty86jWj4nISipcykSLPdMOu4=;
 b=JWIX20uOcX0/vfA6y/w3gf6dPjqS/vAYYZQ+088ZjPq/zXvu6bbSvJ0MdWvRQo7Tvv
 jWaLGqSLIZLXIR/BEoPCVhNgveSSqj2IGi+hJmJkbvRnhVtvCZFURxpfEWdMj/4qQjah
 TTib7VXmBiGAnMg+Uzvlw3RbPTVti05D9QDumbhS1UrStg8183+XjDv2jhS8GjlYpxCz
 jR7XK+5BkSruldiJsEwIDbRKG93ZjKY8ETfWtUz2mUCjLV51En6tXQbVEO/eYDbVDN/P
 5RLvGz3OUvqxHo2UIabJK1t1JanoLESEuY6m0GmonCoyJRf/hQNWkpYJDo6zqnCMhFT8
 rfCw==
X-Gm-Message-State: AOAM531zE8idLSLX3t1dVN5BCj9y3FJJ0DNZxwGqK9m8rlRmLciYilYZ
 wgyRjXy6D3amPDxgb2XwBLnzSyRvDdb7Qw==
X-Google-Smtp-Source: ABdhPJwzC/noJPYtJu6AV4KkUX1i1k4/vai/XXKaMI0Tn9IGSLd7e8PewB0nDCetu/d1rSOPri4mQw==
X-Received: by 2002:a1c:a958:: with SMTP id s85mr24931814wme.138.1617633150817; 
 Mon, 05 Apr 2021 07:32:30 -0700 (PDT)
Received: from cmiranda-laptop.localdomain (bl15-158-218.dsl.telepac.pt.
 [188.80.158.218])
 by smtp.gmail.com with ESMTPSA id k3sm8231552wrc.67.2021.04.05.07.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 07:32:30 -0700 (PDT)
From: cupertinomiranda@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH 20/27] arcv3: TCG, decoder glue code and helper changes
Date: Mon,  5 Apr 2021 15:31:31 +0100
Message-Id: <20210405143138.17016-21-cupertinomiranda@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210405143138.17016-1-cupertinomiranda@gmail.com>
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=cupertinomiranda@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cupertino Miranda <cmiranda@synopsys.com>

---
 target/arc/extra_mapping.def      |  16 +
 target/arc/helper.c               |  11 +
 target/arc/helper.h               |  16 +
 target/arc/op_helper.c            | 110 ++++++-
 target/arc/semfunc-v2_mapping.def | 321 ++++++++++++++++++++
 target/arc/semfunc-v3_mapping.def | 468 ++++++++++++++++++++++++++++++
 target/arc/semfunc_mapping.def    | 308 +-------------------
 7 files changed, 937 insertions(+), 313 deletions(-)
 create mode 100644 target/arc/semfunc-v2_mapping.def
 create mode 100644 target/arc/semfunc-v3_mapping.def

diff --git a/target/arc/extra_mapping.def b/target/arc/extra_mapping.def
index 50517f058e..527a70f304 100644
--- a/target/arc/extra_mapping.def
+++ b/target/arc/extra_mapping.def
@@ -43,6 +43,7 @@ MAPPING(swi, SWI, 1, 0)
 CONSTANT(SWI, swi_s, 0, 0)
 MAPPING(swi_s, SWI, 1, 0)
 
+#ifdef TARGET_ARCV2
 SEMANTIC_FUNCTION(VADD2, 3)
 SEMANTIC_FUNCTION(VADD2H, 3)
 SEMANTIC_FUNCTION(VADD4H, 3)
@@ -61,3 +62,18 @@ MAPPING(vsub2h, VSUB2H, 3, 0, 1, 2)
 MAPPING(vsub4h, VSUB4H, 3, 0, 1, 2)
 MAPPING(mpyd, MPYD, 3, 0, 1, 2)
 MAPPING(mpydu, MPYDU, 3, 0, 1, 2)
+#endif
+
+#ifdef TARGET_ARCV3
+SEMANTIC_FUNCTION(MPYL, 3)
+SEMANTIC_FUNCTION(MPYML, 3)
+SEMANTIC_FUNCTION(MPYMUL, 3)
+SEMANTIC_FUNCTION(MPYMSUL, 3)
+SEMANTIC_FUNCTION(ADDHL, 3)
+
+MAPPING(mpyl, MPYL, 3, 0, 1, 2)
+MAPPING(mpyml, MPYML, 3, 0, 1, 2)
+MAPPING(mpymul, MPYMUL, 3, 0, 1, 2)
+MAPPING(mpymsul, MPYMSUL, 3, 0, 1, 2)
+MAPPING(addhl, ADDHL, 3, 0, 1, 2)
+#endif
diff --git a/target/arc/helper.c b/target/arc/helper.c
index e11d21d576..10c46cbee4 100644
--- a/target/arc/helper.c
+++ b/target/arc/helper.c
@@ -80,12 +80,23 @@ void arc_cpu_do_interrupt(CPUState *cs)
     case EXCP_MACHINE_CHECK:
         name = "Machine Check";
         break;
+#ifdef TARGET_ARCV2
     case EXCP_TLB_MISS_I:
         name = "TLB Miss Instruction";
         break;
     case EXCP_TLB_MISS_D:
         name = "TLB Miss Data";
         break;
+#elif TARGET_ARCV3
+    case EXCP_IMMU_FAULT:
+        name = "Instruction MMU Fault";
+        break;
+    case EXCP_DMMU_FAULT:
+        name = "Data MMU Fault";
+        break;
+#else
+#error
+#endif
     case EXCP_PROTV:
         name = "Protection Violation";
         break;
diff --git a/target/arc/helper.h b/target/arc/helper.h
index 1929c1682f..2d93fc3a96 100644
--- a/target/arc/helper.h
+++ b/target/arc/helper.h
@@ -37,3 +37,19 @@ DEF_HELPER_FLAGS_3(overflow_sub_flag, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
 DEF_HELPER_FLAGS_3(mpymu, TCG_CALL_NO_RWG_SE, tl, env, tl, tl)
 DEF_HELPER_FLAGS_3(mpym, TCG_CALL_NO_RWG_SE, tl, env, tl, tl)
 DEF_HELPER_FLAGS_3(repl_mask, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
+
+/* ARCV3 helpers */
+#ifdef TARGET_ARCV3
+DEF_HELPER_FLAGS_2(ffs32, TCG_CALL_NO_RWG_SE, tl, env, tl)
+
+DEF_HELPER_FLAGS_3(carry_add_flag32, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
+DEF_HELPER_FLAGS_3(carry_sub_flag32, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
+DEF_HELPER_FLAGS_3(overflow_add_flag32, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
+DEF_HELPER_FLAGS_3(overflow_sub_flag32, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
+
+DEF_HELPER_FLAGS_2(rotate_left32, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(rotate_right32, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(asr_32, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+
+DEF_HELPER_2(norml, i64, env, i64)
+#endif
diff --git a/target/arc/op_helper.c b/target/arc/op_helper.c
index 1124541993..6d68018334 100644
--- a/target/arc/op_helper.c
+++ b/target/arc/op_helper.c
@@ -188,7 +188,9 @@ void helper_rtie(CPUARCState *env)
                       (target_ulong) pack_status32(&env->stat));
     }
 
+#ifdef TARGET_ARCV2
     helper_zol_verify(env, env->pc);
+#endif
 }
 
 void helper_flush(CPUARCState *env)
@@ -390,17 +392,103 @@ arc_status_regs_set(const struct arc_aux_reg_detail *aux_reg_detail,
     }
 }
 
-/*
- * uint32_t lf_variable = 0;
- * uint32_t helper_get_lf(void)
- * {
- *   return lf_variable;
- * }
- * void helper_set_lf(uint32_t v)
- * {
- *   lf_variable = v;
- * }
- */
+#ifdef TARGET_ARCV3
+uint64_t helper_carry_add_flag32(uint64_t dest, uint64_t b, uint64_t c) {
+    return carry_add_flag(dest, b, c, 32);
+}
+
+target_ulong helper_overflow_add_flag32(target_ulong dest, target_ulong b, target_ulong c) {
+    return overflow_add_flag(dest, b, c, 32);
+}
+
+target_ulong helper_overflow_sub_flag32(target_ulong dest, target_ulong b, target_ulong c) {
+    dest = dest & 0xffffffff;
+    b = b & 0xffffffff;
+    c = c & 0xffffffff;
+    return overflow_sub_flag(dest, b, c, 32);
+}
+
+uint64_t helper_carry_sub_flag32(uint64_t dest, uint64_t b, uint64_t c)
+{
+    uint32_t t1, t2, t3;
+
+    t1 = ~b;
+    t2 = t1 & c;
+    t3 = (t1 | c) & dest;
+
+    t2 = t2 | t3;
+    return (t2 >> 31) & 1;
+}
+
+uint64_t helper_rotate_left32(uint64_t orig, uint64_t n)
+{
+    uint64_t t;
+    uint64_t dest = (orig << n) & ((0xffffffff << n) & 0xffffffff);
+
+    t = (orig >> (32 - n)) & ((1 << n) - 1);
+    dest |= t;
+
+    return dest;
+}
+
+uint64_t helper_rotate_right32(uint64_t orig, uint64_t n)
+{
+    uint64_t t;
+    uint64_t dest = (orig >> n) & (0xffffffff >> n);
+
+    t = ((orig & ((1 << n) - 1)) << (32 - n));
+    dest |= t;
+
+    return dest;
+}
+
+uint64_t helper_asr_32(uint64_t b, uint64_t c)
+{
+  uint64_t t;
+  c = c & 31;
+  t = b;
+  for(int i = 0; i < c; i++) {
+    t >>= 1;
+    if((b & 0x80000000) != 0)
+      t |= 0x80000000;
+  }
+      //t |= ((1 << (c+1)) - 1) << (32 - c);
+
+  return t;
+}
+
+target_ulong helper_ffs32(CPUARCState *env, uint64_t src)
+{
+    int i;
+    if (src == 0) {
+      return 31;
+    }
+    for (i = 0; i <= 31; i++) {
+      if (((src >> i) & 1) != 0) {
+        break;
+      }
+    }
+    return i;
+}
+
+target_ulong helper_norml(CPUARCState *env, uint64_t src1)
+{
+    int i;
+    int64_t tmp = (int64_t) src1;
+    if (tmp == 0 || tmp == -1) {
+      return 0;
+    }
+    for (i = 0; i <= 63; i++) {
+      if ((tmp >> i) == 0) {
+          break;
+      }
+      if ((tmp >> i) == -1) {
+          break;
+      }
+    }
+    return i;
+}
+#endif
 
 /*-*-indent-tabs-mode:nil;tab-width:4;indent-line-function:'insert-tab'-*-*/
 /* vim: set ts=4 sw=4 et: */
diff --git a/target/arc/semfunc-v2_mapping.def b/target/arc/semfunc-v2_mapping.def
new file mode 100644
index 0000000000..ab8d9ff123
--- /dev/null
+++ b/target/arc/semfunc-v2_mapping.def
@@ -0,0 +1,321 @@
+/*
+ * QEMU ARC SEMANTIC MAPPING.
+ *
+ * Copyright (c) 2020 Synopsys, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+SEMANTIC_FUNCTION(FLAG, 1)
+SEMANTIC_FUNCTION(KFLAG, 1)
+SEMANTIC_FUNCTION(ADD, 3)
+SEMANTIC_FUNCTION(ADD1, 3)
+SEMANTIC_FUNCTION(ADD2, 3)
+SEMANTIC_FUNCTION(ADD3, 3)
+SEMANTIC_FUNCTION(ADC, 3)
+SEMANTIC_FUNCTION(SBC, 3)
+SEMANTIC_FUNCTION(NEG, 2)
+SEMANTIC_FUNCTION(SUB, 3)
+SEMANTIC_FUNCTION(SUB1, 3)
+SEMANTIC_FUNCTION(SUB2, 3)
+SEMANTIC_FUNCTION(SUB3, 3)
+SEMANTIC_FUNCTION(MAX, 3)
+SEMANTIC_FUNCTION(MIN, 3)
+SEMANTIC_FUNCTION(CMP, 2)
+SEMANTIC_FUNCTION(AND, 3)
+SEMANTIC_FUNCTION(OR, 3)
+SEMANTIC_FUNCTION(XOR, 3)
+SEMANTIC_FUNCTION(MOV, 2)
+SEMANTIC_FUNCTION(ASL, 3)
+SEMANTIC_FUNCTION(ASR, 3)
+SEMANTIC_FUNCTION(ASR8, 2)
+SEMANTIC_FUNCTION(ASR16, 2)
+SEMANTIC_FUNCTION(LSL16, 2)
+SEMANTIC_FUNCTION(LSL8, 2)
+SEMANTIC_FUNCTION(LSR, 3)
+SEMANTIC_FUNCTION(LSR16, 2)
+SEMANTIC_FUNCTION(LSR8, 2)
+SEMANTIC_FUNCTION(BIC, 3)
+SEMANTIC_FUNCTION(BCLR, 3)
+SEMANTIC_FUNCTION(BMSK, 3)
+SEMANTIC_FUNCTION(BMSKN, 3)
+SEMANTIC_FUNCTION(BSET, 3)
+SEMANTIC_FUNCTION(BXOR, 3)
+SEMANTIC_FUNCTION(ROL, 2)
+SEMANTIC_FUNCTION(ROL8, 2)
+SEMANTIC_FUNCTION(ROR, 3)
+SEMANTIC_FUNCTION(ROR8, 2)
+SEMANTIC_FUNCTION(RLC, 2)
+SEMANTIC_FUNCTION(RRC, 2)
+SEMANTIC_FUNCTION(SEXB, 2)
+SEMANTIC_FUNCTION(SEXH, 2)
+SEMANTIC_FUNCTION(EXTB, 2)
+SEMANTIC_FUNCTION(EXTH, 2)
+SEMANTIC_FUNCTION(BTST, 2)
+SEMANTIC_FUNCTION(TST, 2)
+SEMANTIC_FUNCTION(XBFU, 3)
+SEMANTIC_FUNCTION(AEX, 2)
+SEMANTIC_FUNCTION(LR, 2)
+SEMANTIC_FUNCTION(CLRI, 1)
+SEMANTIC_FUNCTION(SETI, 1)
+SEMANTIC_FUNCTION(NOP, 0)
+SEMANTIC_FUNCTION(PREALLOC, 0)
+SEMANTIC_FUNCTION(PREFETCH, 2)
+SEMANTIC_FUNCTION(MPY, 3)
+SEMANTIC_FUNCTION(MPYMU, 3)
+SEMANTIC_FUNCTION(MPYM, 3)
+SEMANTIC_FUNCTION(MPYU, 3)
+SEMANTIC_FUNCTION(MPYUW, 3)
+SEMANTIC_FUNCTION(MPYW, 3)
+SEMANTIC_FUNCTION(DIV, 3)
+SEMANTIC_FUNCTION(DIVU, 3)
+SEMANTIC_FUNCTION(REM, 3)
+SEMANTIC_FUNCTION(REMU, 3)
+SEMANTIC_FUNCTION(MAC, 3)
+SEMANTIC_FUNCTION(MACU, 3)
+SEMANTIC_FUNCTION(MACD, 3)
+SEMANTIC_FUNCTION(MACDU, 3)
+SEMANTIC_FUNCTION(ABS, 2)
+SEMANTIC_FUNCTION(SWAP, 2)
+SEMANTIC_FUNCTION(SWAPE, 2)
+SEMANTIC_FUNCTION(NOT, 2)
+SEMANTIC_FUNCTION(BI, 1)
+SEMANTIC_FUNCTION(BIH, 1)
+SEMANTIC_FUNCTION(B, 1)
+SEMANTIC_FUNCTION(B_S, 1)
+SEMANTIC_FUNCTION(BBIT0, 3)
+SEMANTIC_FUNCTION(BBIT1, 3)
+SEMANTIC_FUNCTION(BL, 1)
+SEMANTIC_FUNCTION(J, 1)
+SEMANTIC_FUNCTION(JL, 1)
+SEMANTIC_FUNCTION(SETEQ, 3)
+SEMANTIC_FUNCTION(BREQ, 3)
+SEMANTIC_FUNCTION(SETNE, 3)
+SEMANTIC_FUNCTION(BRNE, 3)
+SEMANTIC_FUNCTION(SETLT, 3)
+SEMANTIC_FUNCTION(BRLT, 3)
+SEMANTIC_FUNCTION(SETGE, 3)
+SEMANTIC_FUNCTION(BRGE, 3)
+SEMANTIC_FUNCTION(SETLE, 3)
+SEMANTIC_FUNCTION(SETGT, 3)
+SEMANTIC_FUNCTION(BRLO, 3)
+SEMANTIC_FUNCTION(SETLO, 3)
+SEMANTIC_FUNCTION(BRHS, 3)
+SEMANTIC_FUNCTION(SETHS, 3)
+SEMANTIC_FUNCTION(EX, 2)
+SEMANTIC_FUNCTION(LLOCK, 2)
+SEMANTIC_FUNCTION(LLOCKD, 2)
+SEMANTIC_FUNCTION(SCOND, 2)
+SEMANTIC_FUNCTION(SCONDD, 2)
+SEMANTIC_FUNCTION(DMB, 1)
+SEMANTIC_FUNCTION(LD, 3)
+SEMANTIC_FUNCTION(LDD, 3)
+SEMANTIC_FUNCTION(ST, 3)
+SEMANTIC_FUNCTION(STD, 3)
+SEMANTIC_FUNCTION(POP, 1)
+SEMANTIC_FUNCTION(PUSH, 1)
+SEMANTIC_FUNCTION(LP, 1)
+SEMANTIC_FUNCTION(NORM, 2)
+SEMANTIC_FUNCTION(NORMH, 2)
+SEMANTIC_FUNCTION(FLS, 2)
+SEMANTIC_FUNCTION(FFS, 2)
+
+
+MAPPING(flag, FLAG, 1, 0)
+MAPPING(kflag, KFLAG, 1, 0)
+MAPPING(add, ADD, 3, 1, 2, 0)
+MAPPING(add_s, ADD, 3, 1, 2, 0)
+MAPPING(add1, ADD1, 3, 1, 2, 0)
+MAPPING(add1_s, ADD1, 3, 1, 2, 0)
+MAPPING(add2, ADD2, 3, 1, 2, 0)
+MAPPING(add2_s, ADD2, 3, 1, 2, 0)
+MAPPING(add3, ADD3, 3, 1, 2, 0)
+MAPPING(add3_s, ADD3, 3, 1, 2, 0)
+MAPPING(adc, ADC, 3, 1, 2, 0)
+MAPPING(sbc, SBC, 3, 1, 2, 0)
+MAPPING(neg, NEG, 2, 1, 0)
+MAPPING(neg_s, NEG, 2, 1, 0)
+MAPPING(sub, SUB, 3, 1, 2, 0)
+MAPPING(sub_s, SUB, 3, 1, 2, 0)
+MAPPING(rsub, SUB, 3, 2, 1, 0)
+MAPPING(sub1, SUB1, 3, 1, 2, 0)
+MAPPING(sub2, SUB2, 3, 1, 2, 0)
+MAPPING(sub3, SUB3, 3, 1, 2, 0)
+MAPPING(max, MAX, 3, 1, 2, 0)
+MAPPING(min, MIN, 3, 1, 2, 0)
+MAPPING(cmp, CMP, 2, 0, 1)
+MAPPING(cmp_s, CMP, 2, 0, 1)
+MAPPING(rcmp, CMP, 2, 1, 0)
+MAPPING(and, AND, 3, 1, 2, 0)
+MAPPING(and_s, AND, 3, 1, 2, 0)
+MAPPING(or, OR, 3, 1, 2, 0)
+MAPPING(or_s, OR, 3, 1, 2, 0)
+MAPPING(xor, XOR, 3, 1, 2, 0)
+MAPPING(xor_s, XOR, 3, 1, 2, 0)
+MAPPING(mov, MOV, 2, 1, 0)
+MAPPING(mov_s, MOV, 2, 1, 0)
+CONSTANT(ASL, asl, 2, 268435457) /* For variable @c */
+MAPPING(asl, ASL, 3, 1, 2, 0)
+CONSTANT(ASL, asl_s, 2, 268435457) /* For variable @c */
+MAPPING(asl_s, ASL, 3, 1, 2, 0)
+CONSTANT(ASR, asr, 2, 1) /* For variable @c */
+MAPPING(asr, ASR, 3, 1, 2, 0)
+CONSTANT(ASR, asr_s, 2, 1) /* For variable @c */
+MAPPING(asr_s, ASR, 3, 1, 2, 0)
+MAPPING(asr8, ASR8, 2, 1, 0)
+MAPPING(asr16, ASR16, 2, 1, 0)
+MAPPING(lsl16, LSL16, 2, 1, 0)
+MAPPING(lsl8, LSL8, 2, 1, 0)
+CONSTANT(LSR, lsr, 2, 1) /* For variable @c */
+MAPPING(lsr, LSR, 3, 1, 2, 0)
+CONSTANT(LSR, lsr_s, 2, 1) /* For variable @c */
+MAPPING(lsr_s, LSR, 3, 1, 2, 0)
+MAPPING(lsr16, LSR16, 2, 1, 0)
+MAPPING(lsr8, LSR8, 2, 1, 0)
+MAPPING(bic, BIC, 3, 1, 2, 0)
+MAPPING(bic_s, BIC, 3, 1, 2, 0)
+MAPPING(bclr, BCLR, 3, 2, 1, 0)
+MAPPING(bclr_s, BCLR, 3, 2, 1, 0)
+MAPPING(bmsk, BMSK, 3, 2, 1, 0)
+MAPPING(bmsk_s, BMSK, 3, 2, 1, 0)
+MAPPING(bmskn, BMSKN, 3, 2, 1, 0)
+MAPPING(bset, BSET, 3, 2, 1, 0)
+MAPPING(bset_s, BSET, 3, 2, 1, 0)
+MAPPING(bxor, BXOR, 3, 2, 1, 0)
+MAPPING(rol, ROL, 2, 1, 0)
+MAPPING(rol8, ROL8, 2, 1, 0)
+CONSTANT(ROR, ror, 2, 1) /* For variable @n */
+MAPPING(ror, ROR, 3, 1, 2, 0)
+MAPPING(ror8, ROR8, 2, 1, 0)
+MAPPING(rlc, RLC, 2, 1, 0)
+MAPPING(rrc, RRC, 2, 1, 0)
+MAPPING(sexb, SEXB, 2, 0, 1)
+MAPPING(sexb_s, SEXB, 2, 0, 1)
+MAPPING(sexh, SEXH, 2, 0, 1)
+MAPPING(sexh_s, SEXH, 2, 0, 1)
+MAPPING(extb, EXTB, 2, 0, 1)
+MAPPING(extb_s, EXTB, 2, 0, 1)
+MAPPING(exth, EXTH, 2, 0, 1)
+MAPPING(exth_s, EXTH, 2, 0, 1)
+MAPPING(btst, BTST, 2, 1, 0)
+MAPPING(btst_s, BTST, 2, 1, 0)
+MAPPING(tst, TST, 2, 0, 1)
+MAPPING(tst_s, TST, 2, 0, 1)
+MAPPING(xbfu, XBFU, 3, 2, 1, 0)
+MAPPING(aex, AEX, 2, 1, 0)
+MAPPING(lr, LR, 2, 0, 1)
+MAPPING(clri, CLRI, 1, 0)
+MAPPING(seti, SETI, 1, 0)
+MAPPING(nop, NOP, 0)
+MAPPING(nop_s, NOP, 0)
+MAPPING(prealloc, PREALLOC, 0)
+CONSTANT(PREFETCH, prefetch, 1, 0) /* For variable @src2 */
+MAPPING(prefetch, PREFETCH, 2, 0, 1)
+CONSTANT(PREFETCH, prefetchw, 1, 0) /* For variable @src2 */
+MAPPING(prefetchw, PREFETCH, 2, 0, 1)
+MAPPING(mpy, MPY, 3, 1, 2, 0)
+MAPPING(mpy_s, MPY, 3, 1, 2, 0)
+MAPPING(mpymu, MPYMU, 3, 0, 1, 2)
+MAPPING(mpym, MPYM, 3, 0, 1, 2)
+MAPPING(mpyu, MPYU, 3, 1, 2, 0)
+MAPPING(mpyuw, MPYUW, 3, 0, 1, 2)
+MAPPING(mpyuw_s, MPYUW, 3, 0, 1, 2)
+MAPPING(mpyw, MPYW, 3, 0, 1, 2)
+MAPPING(mpyw_s, MPYW, 3, 0, 1, 2)
+MAPPING(div, DIV, 3, 2, 1, 0)
+MAPPING(divu, DIVU, 3, 2, 0, 1)
+MAPPING(rem, REM, 3, 2, 1, 0)
+MAPPING(remu, REMU, 3, 2, 0, 1)
+MAPPING(mac, MAC, 3, 1, 2, 0)
+MAPPING(macu, MACU, 3, 1, 2, 0)
+MAPPING(macd, MACD, 3, 1, 2, 0)
+MAPPING(macdu, MACDU, 3, 1, 2, 0)
+MAPPING(abs, ABS, 2, 1, 0)
+MAPPING(abs_s, ABS, 2, 1, 0)
+MAPPING(swap, SWAP, 2, 1, 0)
+MAPPING(swape, SWAPE, 2, 1, 0)
+MAPPING(not, NOT, 2, 0, 1)
+MAPPING(not_s, NOT, 2, 0, 1)
+MAPPING(bi, BI, 1, 0)
+MAPPING(bih, BIH, 1, 0)
+MAPPING(b, B, 1, 0)
+MAPPING(beq_s, B_S, 1, 0)
+MAPPING(bne_s, B_S, 1, 0)
+MAPPING(bgt_s, B_S, 1, 0)
+MAPPING(bge_s, B_S, 1, 0)
+MAPPING(blt_s, B_S, 1, 0)
+MAPPING(ble_s, B_S, 1, 0)
+MAPPING(bhi_s, B_S, 1, 0)
+MAPPING(bhs_s, B_S, 1, 0)
+MAPPING(blo_s, B_S, 1, 0)
+MAPPING(bls_s, B_S, 1, 0)
+MAPPING(b_s, B_S, 1, 0)
+MAPPING(bbit0, BBIT0, 3, 0, 1, 2)
+MAPPING(bbit1, BBIT1, 3, 0, 1, 2)
+MAPPING(bl, BL, 1, 0)
+MAPPING(bl_s, BL, 1, 0)
+MAPPING(j, J, 1, 0)
+MAPPING(j_s, J, 1, 0)
+MAPPING(jeq_s, J, 1, 0)
+MAPPING(jne_s, J, 1, 0)
+MAPPING(jl, JL, 1, 0)
+MAPPING(jl_s, JL, 1, 0)
+MAPPING(seteq, SETEQ, 3, 1, 2, 0)
+MAPPING(breq, BREQ, 3, 0, 1, 2)
+MAPPING(breq_s, BREQ, 3, 0, 1, 2)
+MAPPING(setne, SETNE, 3, 1, 2, 0)
+MAPPING(brne, BRNE, 3, 0, 1, 2)
+MAPPING(brne_s, BRNE, 3, 0, 1, 2)
+MAPPING(setlt, SETLT, 3, 1, 2, 0)
+MAPPING(brlt, BRLT, 3, 0, 1, 2)
+MAPPING(setge, SETGE, 3, 1, 2, 0)
+MAPPING(brge, BRGE, 3, 0, 1, 2)
+MAPPING(setle, SETLE, 3, 1, 2, 0)
+MAPPING(setgt, SETGT, 3, 1, 2, 0)
+MAPPING(brlo, BRLO, 3, 0, 1, 2)
+MAPPING(setlo, SETLO, 3, 1, 2, 0)
+MAPPING(brhs, BRHS, 3, 0, 1, 2)
+MAPPING(seths, SETHS, 3, 1, 2, 0)
+MAPPING(ex, EX, 2, 0, 1)
+MAPPING(llock, LLOCK, 2, 0, 1)
+MAPPING(llockd, LLOCKD, 2, 0, 1)
+MAPPING(scond, SCOND, 2, 1, 0)
+MAPPING(scondd, SCONDD, 2, 1, 0)
+MAPPING(dmb, DMB, 1, 0)
+CONSTANT(LD, ld, 2, 0) /* For variable @src2 */
+MAPPING(ld, LD, 3, 1, 2, 0)
+MAPPING(ld_s, LD, 3, 1, 2, 0)
+MAPPING(ldb_s, LD, 3, 1, 2, 0)
+MAPPING(ldh_s, LD, 3, 1, 2, 0)
+MAPPING(ldw_s, LD, 3, 1, 2, 0)
+CONSTANT(LD, ldi, 2, 0) /* For variable @src2 */
+MAPPING(ldi, LD, 3, 1, 2, 0)
+CONSTANT(LD, ldi_s, 2, 0) /* For variable @src2 */
+MAPPING(ldi_s, LD, 3, 1, 2, 0)
+CONSTANT(LDD, ldd, 2, 0) /* For variable @src2 */
+MAPPING(ldd, LDD, 3, 1, 2, 0)
+CONSTANT(ST, st, 2, 0) /* For variable @src2 */
+MAPPING(st, ST, 3, 1, 2, 0)
+MAPPING(st_s, ST, 3, 1, 2, 0)
+MAPPING(stb_s, ST, 3, 1, 2, 0)
+MAPPING(sth_s, ST, 3, 1, 2, 0)
+MAPPING(stw_s, ST, 3, 1, 2, 0)
+CONSTANT(STD, std, 2, 0) /* For variable @src2 */
+MAPPING(std, STD, 3, 1, 2, 0)
+MAPPING(pop_s, POP, 1, 0)
+MAPPING(push_s, PUSH, 1, 0)
+MAPPING(lp, LP, 1, 0)
+MAPPING(norm, NORM, 2, 1, 0)
+MAPPING(normh, NORMH, 2, 1, 0)
+MAPPING(fls, FLS, 2, 1, 0)
+MAPPING(ffs, FFS, 2, 1, 0)
diff --git a/target/arc/semfunc-v3_mapping.def b/target/arc/semfunc-v3_mapping.def
new file mode 100644
index 0000000000..2ecb55128a
--- /dev/null
+++ b/target/arc/semfunc-v3_mapping.def
@@ -0,0 +1,468 @@
+SEMANTIC_FUNCTION(FLAG, 1)
+SEMANTIC_FUNCTION(KFLAG, 1)
+SEMANTIC_FUNCTION(ADD, 3)
+SEMANTIC_FUNCTION(ADD1, 3)
+SEMANTIC_FUNCTION(ADD2, 3)
+SEMANTIC_FUNCTION(ADD3, 3)
+SEMANTIC_FUNCTION(ADC, 3)
+SEMANTIC_FUNCTION(SBC, 3)
+SEMANTIC_FUNCTION(NEG, 2)
+SEMANTIC_FUNCTION(SUB, 3)
+SEMANTIC_FUNCTION(SUB1, 3)
+SEMANTIC_FUNCTION(SUB2, 3)
+SEMANTIC_FUNCTION(SUB3, 3)
+SEMANTIC_FUNCTION(MAX, 3)
+SEMANTIC_FUNCTION(MIN, 3)
+SEMANTIC_FUNCTION(CMP, 2)
+SEMANTIC_FUNCTION(AND, 3)
+SEMANTIC_FUNCTION(OR, 3)
+SEMANTIC_FUNCTION(XOR, 3)
+SEMANTIC_FUNCTION(MOV, 2)
+SEMANTIC_FUNCTION(ASL, 3)
+SEMANTIC_FUNCTION(ASR, 3)
+SEMANTIC_FUNCTION(ASR8, 2)
+SEMANTIC_FUNCTION(ASR16, 2)
+SEMANTIC_FUNCTION(LSL16, 2)
+SEMANTIC_FUNCTION(LSL8, 2)
+SEMANTIC_FUNCTION(LSR, 3)
+SEMANTIC_FUNCTION(LSR16, 2)
+SEMANTIC_FUNCTION(LSR8, 2)
+SEMANTIC_FUNCTION(BIC, 3)
+SEMANTIC_FUNCTION(BCLR, 3)
+SEMANTIC_FUNCTION(BMSK, 3)
+SEMANTIC_FUNCTION(BMSKN, 3)
+SEMANTIC_FUNCTION(BSET, 3)
+SEMANTIC_FUNCTION(BXOR, 3)
+SEMANTIC_FUNCTION(ROL, 3)
+SEMANTIC_FUNCTION(ROL8, 2)
+SEMANTIC_FUNCTION(ROR, 3)
+SEMANTIC_FUNCTION(ROR8, 2)
+SEMANTIC_FUNCTION(RLC, 2)
+SEMANTIC_FUNCTION(RRC, 2)
+SEMANTIC_FUNCTION(SEXB, 2)
+SEMANTIC_FUNCTION(SEXH, 2)
+SEMANTIC_FUNCTION(EXTB, 2)
+SEMANTIC_FUNCTION(EXTH, 2)
+SEMANTIC_FUNCTION(BTST, 2)
+SEMANTIC_FUNCTION(TST, 2)
+SEMANTIC_FUNCTION(XBFU, 3)
+SEMANTIC_FUNCTION(AEX, 2)
+SEMANTIC_FUNCTION(LR, 2)
+SEMANTIC_FUNCTION(CLRI, 1)
+SEMANTIC_FUNCTION(SETI, 1)
+SEMANTIC_FUNCTION(NOP, 0)
+SEMANTIC_FUNCTION(PREALLOC, 0)
+SEMANTIC_FUNCTION(PREFETCH, 2)
+SEMANTIC_FUNCTION(MPY, 3)
+SEMANTIC_FUNCTION(MPYMU, 3)
+SEMANTIC_FUNCTION(MPYM, 3)
+SEMANTIC_FUNCTION(MPYU, 3)
+SEMANTIC_FUNCTION(MPYUW, 3)
+SEMANTIC_FUNCTION(MPYW, 3)
+SEMANTIC_FUNCTION(DIV, 3)
+SEMANTIC_FUNCTION(DIVU, 3)
+SEMANTIC_FUNCTION(REM, 3)
+SEMANTIC_FUNCTION(REMU, 3)
+SEMANTIC_FUNCTION(MAC, 3)
+SEMANTIC_FUNCTION(MACU, 3)
+SEMANTIC_FUNCTION(MACD, 3)
+SEMANTIC_FUNCTION(MACDU, 3)
+SEMANTIC_FUNCTION(ABS, 2)
+SEMANTIC_FUNCTION(SWAP, 2)
+SEMANTIC_FUNCTION(SWAPE, 2)
+SEMANTIC_FUNCTION(NOT, 2)
+SEMANTIC_FUNCTION(BI, 1)
+SEMANTIC_FUNCTION(BIH, 1)
+SEMANTIC_FUNCTION(B, 1)
+SEMANTIC_FUNCTION(B_S, 1)
+SEMANTIC_FUNCTION(BBIT0, 3)
+SEMANTIC_FUNCTION(BBIT1, 3)
+SEMANTIC_FUNCTION(BL, 1)
+SEMANTIC_FUNCTION(J, 1)
+SEMANTIC_FUNCTION(JL, 1)
+SEMANTIC_FUNCTION(SETEQ, 3)
+SEMANTIC_FUNCTION(BREQ, 3)
+SEMANTIC_FUNCTION(SETNE, 3)
+SEMANTIC_FUNCTION(BRNE, 3)
+SEMANTIC_FUNCTION(SETLT, 3)
+SEMANTIC_FUNCTION(BRLT, 3)
+SEMANTIC_FUNCTION(SETGE, 3)
+SEMANTIC_FUNCTION(BRGE, 3)
+SEMANTIC_FUNCTION(SETLE, 3)
+SEMANTIC_FUNCTION(SETGT, 3)
+SEMANTIC_FUNCTION(BRLO, 3)
+SEMANTIC_FUNCTION(SETLO, 3)
+SEMANTIC_FUNCTION(BRHS, 3)
+SEMANTIC_FUNCTION(SETHS, 3)
+SEMANTIC_FUNCTION(EX, 2)
+SEMANTIC_FUNCTION(LLOCK, 2)
+SEMANTIC_FUNCTION(LLOCKD, 2)
+SEMANTIC_FUNCTION(SCOND, 2)
+SEMANTIC_FUNCTION(SCONDD, 2)
+SEMANTIC_FUNCTION(DMB, 1)
+SEMANTIC_FUNCTION(LD, 3)
+SEMANTIC_FUNCTION(LDD, 3)
+SEMANTIC_FUNCTION(ST, 3)
+SEMANTIC_FUNCTION(STD, 3)
+SEMANTIC_FUNCTION(POP, 1)
+SEMANTIC_FUNCTION(PUSH, 1)
+SEMANTIC_FUNCTION(LP, 1)
+SEMANTIC_FUNCTION(NORM, 2)
+SEMANTIC_FUNCTION(NORMH, 2)
+SEMANTIC_FUNCTION(FLS, 2)
+SEMANTIC_FUNCTION(FFS, 2)
+
+
+MAPPING(flag, FLAG, 1, 0)
+MAPPING(kflag, KFLAG, 1, 0)
+MAPPING(add, ADD, 3, 1, 2, 0)
+MAPPING(add_s, ADD, 3, 1, 2, 0)
+MAPPING(add1, ADD1, 3, 1, 2, 0)
+MAPPING(add1_s, ADD1, 3, 1, 2, 0)
+MAPPING(add2, ADD2, 3, 1, 2, 0)
+MAPPING(add2_s, ADD2, 3, 1, 2, 0)
+MAPPING(add3, ADD3, 3, 1, 2, 0)
+MAPPING(add3_s, ADD3, 3, 1, 2, 0)
+MAPPING(adc, ADC, 3, 1, 2, 0)
+MAPPING(sbc, SBC, 3, 1, 2, 0)
+MAPPING(neg, NEG, 2, 1, 0)
+MAPPING(neg_s, NEG, 2, 1, 0)
+MAPPING(sub, SUB, 3, 1, 2, 0)
+MAPPING(sub_s, SUB, 3, 1, 2, 0)
+MAPPING(rsub, SUB, 3, 2, 1, 0)
+MAPPING(sub1, SUB1, 3, 1, 2, 0)
+MAPPING(sub2, SUB2, 3, 1, 2, 0)
+MAPPING(sub3, SUB3, 3, 1, 2, 0)
+MAPPING(max, MAX, 3, 1, 2, 0)
+MAPPING(min, MIN, 3, 1, 2, 0)
+MAPPING(cmp, CMP, 2, 0, 1)
+MAPPING(cmp_s, CMP, 2, 0, 1)
+MAPPING(rcmp, CMP, 2, 1, 0)
+MAPPING(and, AND, 3, 0, 1, 2)
+MAPPING(and_s, AND, 3, 0, 1, 2)
+MAPPING(or, OR, 3, 0, 1, 2)
+MAPPING(or_s, OR, 3, 0, 1, 2)
+MAPPING(xor, XOR, 3, 0, 1, 2)
+MAPPING(xor_s, XOR, 3, 0, 1, 2)
+MAPPING(mov, MOV, 2, 0, 1)
+MAPPING(mov_s, MOV, 2, 0, 1)
+CONSTANT(ASL, asl, 2, 268435457) /* For variable @c */
+MAPPING(asl, ASL, 3, 1, 2, 0)
+CONSTANT(ASL, asl_s, 2, 268435457) /* For variable @c */
+MAPPING(asl_s, ASL, 3, 1, 2, 0)
+CONSTANT(ASR, asr, 2, 1) /* For variable @c */
+MAPPING(asr, ASR, 3, 1, 2, 0)
+CONSTANT(ASR, asr_s, 2, 1) /* For variable @c */
+MAPPING(asr_s, ASR, 3, 1, 2, 0)
+MAPPING(asr8, ASR8, 2, 1, 0)
+MAPPING(asr16, ASR16, 2, 1, 0)
+MAPPING(lsl16, LSL16, 2, 1, 0)
+MAPPING(lsl8, LSL8, 2, 1, 0)
+CONSTANT(LSR, lsr, 2, 1) /* For variable @c */
+MAPPING(lsr, LSR, 3, 1, 2, 0)
+CONSTANT(LSR, lsr_s, 2, 1) /* For variable @c */
+MAPPING(lsr_s, LSR, 3, 1, 2, 0)
+MAPPING(lsr16, LSR16, 2, 1, 0)
+MAPPING(lsr8, LSR8, 2, 1, 0)
+MAPPING(bic, BIC, 3, 0, 1, 2)
+MAPPING(bic_s, BIC, 3, 0, 1, 2)
+MAPPING(bclr, BCLR, 3, 2, 0, 1)
+MAPPING(bclr_s, BCLR, 3, 2, 0, 1)
+MAPPING(bmsk, BMSK, 3, 2, 0, 1)
+MAPPING(bmsk_s, BMSK, 3, 2, 0, 1)
+MAPPING(bmskn, BMSKN, 3, 2, 0, 1)
+MAPPING(bset, BSET, 3, 2, 0, 1)
+MAPPING(bset_s, BSET, 3, 2, 0, 1)
+MAPPING(bxor, BXOR, 3, 2, 0, 1)
+CONSTANT(ROL, rol, 2, 1) /* For variable @n */
+MAPPING(rol, ROL, 3, 1, 2, 0)
+MAPPING(rol8, ROL8, 2, 1, 0)
+CONSTANT(ROR, ror, 2, 1) /* For variable @n */
+MAPPING(ror, ROR, 3, 1, 2, 0)
+MAPPING(ror8, ROR8, 2, 1, 0)
+MAPPING(rlc, RLC, 2, 1, 0)
+MAPPING(rrc, RRC, 2, 1, 0)
+MAPPING(sexb, SEXB, 2, 0, 1)
+MAPPING(sexb_s, SEXB, 2, 0, 1)
+MAPPING(sexh, SEXH, 2, 0, 1)
+MAPPING(sexh_s, SEXH, 2, 0, 1)
+MAPPING(extb, EXTB, 2, 0, 1)
+MAPPING(extb_s, EXTB, 2, 0, 1)
+MAPPING(exth, EXTH, 2, 0, 1)
+MAPPING(exth_s, EXTH, 2, 0, 1)
+MAPPING(btst, BTST, 2, 1, 0)
+MAPPING(btst_s, BTST, 2, 1, 0)
+MAPPING(tst, TST, 2, 0, 1)
+MAPPING(tst_s, TST, 2, 0, 1)
+MAPPING(xbfu, XBFU, 3, 2, 1, 0)
+MAPPING(aex, AEX, 2, 1, 0)
+MAPPING(lr, LR, 2, 0, 1)
+MAPPING(clri, CLRI, 1, 0)
+MAPPING(seti, SETI, 1, 0)
+MAPPING(nop, NOP, 0)
+MAPPING(nop_s, NOP, 0)
+MAPPING(prealloc, PREALLOC, 0)
+MAPPING(prefetch, PREFETCH, 2, 0, 1)
+MAPPING(prefetchw, PREFETCH, 2, 0, 1)
+MAPPING(mpy, MPY, 3, 1, 2, 0)
+MAPPING(mpy_s, MPY, 3, 1, 2, 0)
+MAPPING(mpymu, MPYMU, 3, 0, 1, 2)
+MAPPING(mpym, MPYM, 3, 0, 1, 2)
+MAPPING(mpyu, MPYU, 3, 1, 2, 0)
+MAPPING(mpyuw, MPYUW, 3, 0, 1, 2)
+MAPPING(mpyuw_s, MPYUW, 3, 0, 1, 2)
+MAPPING(mpyw, MPYW, 3, 0, 1, 2)
+MAPPING(mpyw_s, MPYW, 3, 0, 1, 2)
+MAPPING(div, DIV, 3, 2, 1, 0)
+MAPPING(divu, DIVU, 3, 2, 0, 1)
+MAPPING(rem, REM, 3, 2, 1, 0)
+MAPPING(remu, REMU, 3, 2, 0, 1)
+MAPPING(mac, MAC, 3, 1, 2, 0)
+MAPPING(macu, MACU, 3, 1, 2, 0)
+MAPPING(macd, MACD, 3, 1, 2, 0)
+MAPPING(macdu, MACDU, 3, 1, 2, 0)
+MAPPING(abs, ABS, 2, 1, 0)
+MAPPING(abs_s, ABS, 2, 1, 0)
+MAPPING(swap, SWAP, 2, 1, 0)
+MAPPING(swape, SWAPE, 2, 1, 0)
+MAPPING(not, NOT, 2, 0, 1)
+MAPPING(not_s, NOT, 2, 0, 1)
+MAPPING(bi, BI, 1, 0)
+MAPPING(bih, BIH, 1, 0)
+MAPPING(b, B, 1, 0)
+MAPPING(beq_s, B_S, 1, 0)
+MAPPING(bne_s, B_S, 1, 0)
+MAPPING(bgt_s, B_S, 1, 0)
+MAPPING(bge_s, B_S, 1, 0)
+MAPPING(blt_s, B_S, 1, 0)
+MAPPING(ble_s, B_S, 1, 0)
+MAPPING(bhi_s, B_S, 1, 0)
+MAPPING(bhs_s, B_S, 1, 0)
+MAPPING(blo_s, B_S, 1, 0)
+MAPPING(bls_s, B_S, 1, 0)
+MAPPING(b_s, B_S, 1, 0)
+MAPPING(bbit0, BBIT0, 3, 0, 1, 2)
+MAPPING(bbit1, BBIT1, 3, 0, 1, 2)
+MAPPING(bl, BL, 1, 0)
+MAPPING(bl_s, BL, 1, 0)
+MAPPING(j, J, 1, 0)
+MAPPING(j_s, J, 1, 0)
+MAPPING(jeq_s, J, 1, 0)
+MAPPING(jne_s, J, 1, 0)
+MAPPING(jl, JL, 1, 0)
+MAPPING(jl_s, JL, 1, 0)
+MAPPING(seteq, SETEQ, 3, 1, 2, 0)
+MAPPING(breq, BREQ, 3, 0, 1, 2)
+MAPPING(setne, SETNE, 3, 1, 2, 0)
+MAPPING(brne, BRNE, 3, 0, 1, 2)
+MAPPING(setlt, SETLT, 3, 1, 2, 0)
+MAPPING(brlt, BRLT, 3, 0, 1, 2)
+MAPPING(setge, SETGE, 3, 1, 2, 0)
+MAPPING(brge, BRGE, 3, 0, 1, 2)
+MAPPING(setle, SETLE, 3, 1, 2, 0)
+MAPPING(setgt, SETGT, 3, 1, 2, 0)
+MAPPING(brlo, BRLO, 3, 0, 1, 2)
+MAPPING(setlo, SETLO, 3, 1, 2, 0)
+MAPPING(brhs, BRHS, 3, 0, 1, 2)
+MAPPING(seths, SETHS, 3, 1, 2, 0)
+MAPPING(ex, EX, 2, 0, 1)
+MAPPING(llock, LLOCK, 2, 0, 1)
+MAPPING(scond, SCOND, 2, 1, 0)
+MAPPING(dmb, DMB, 1, 0)
+CONSTANT(LD, ld, 2, 0) /* For variable @src2 */
+MAPPING(ld, LD, 3, 1, 2, 0)
+MAPPING(ld_s, LD, 3, 1, 2, 0)
+CONSTANT(LD, ldb, 2, 0) /* For variable @src2 */
+MAPPING(ldb, LD, 3, 1, 2, 0)
+MAPPING(ldb_s, LD, 3, 1, 2, 0)
+CONSTANT(LD, ldh, 2, 0) /* For variable @src2 */
+MAPPING(ldh, LD, 3, 1, 2, 0)
+MAPPING(ldh_s, LD, 3, 1, 2, 0)
+CONSTANT(ST, st, 2, 0) /* For variable @src2 */
+MAPPING(st, ST, 3, 1, 2, 0)
+MAPPING(st_s, ST, 3, 1, 2, 0)
+MAPPING(stb_s, ST, 3, 1, 2, 0)
+MAPPING(sth_s, ST, 3, 1, 2, 0)
+MAPPING(norm, NORM, 2, 1, 0)
+MAPPING(normh, NORMH, 2, 1, 0)
+MAPPING(fls, FLS, 2, 1, 0)
+MAPPING(ffs, FFS, 2, 1, 0)
+
+/* Long instruction */
+
+SEMANTIC_FUNCTION(ADDL, 3)
+SEMANTIC_FUNCTION(ADD1L, 3)
+SEMANTIC_FUNCTION(ADD2L, 3)
+SEMANTIC_FUNCTION(ADD3L, 3)
+SEMANTIC_FUNCTION(ADCL, 3)
+SEMANTIC_FUNCTION(SBCL, 3)
+SEMANTIC_FUNCTION(SUBL, 3)
+SEMANTIC_FUNCTION(SUB1L, 3)
+SEMANTIC_FUNCTION(SUB2L, 3)
+SEMANTIC_FUNCTION(SUB3L, 3)
+SEMANTIC_FUNCTION(MAXL, 3)
+SEMANTIC_FUNCTION(MINL, 3)
+SEMANTIC_FUNCTION(CMPL, 2)
+SEMANTIC_FUNCTION(ANDL, 3)
+SEMANTIC_FUNCTION(ORL, 3)
+SEMANTIC_FUNCTION(XORL, 3)
+SEMANTIC_FUNCTION(MOVL, 2)
+SEMANTIC_FUNCTION(MOVHL, 2)
+SEMANTIC_FUNCTION(ASLL, 3)
+SEMANTIC_FUNCTION(ASRL, 3)
+SEMANTIC_FUNCTION(LSRL, 3)
+SEMANTIC_FUNCTION(BICL, 3)
+SEMANTIC_FUNCTION(BCLRL, 3)
+SEMANTIC_FUNCTION(BMSKL, 3)
+SEMANTIC_FUNCTION(BMSKNL, 3)
+SEMANTIC_FUNCTION(BSETL, 3)
+SEMANTIC_FUNCTION(BXORL, 3)
+SEMANTIC_FUNCTION(ROLL, 2)
+SEMANTIC_FUNCTION(SEXBL, 2)
+SEMANTIC_FUNCTION(SEXHL, 2)
+SEMANTIC_FUNCTION(BTSTL, 2)
+SEMANTIC_FUNCTION(TSTL, 2)
+SEMANTIC_FUNCTION(XBFUL, 3)
+SEMANTIC_FUNCTION(AEXL, 2)
+SEMANTIC_FUNCTION(LRL, 2)
+SEMANTIC_FUNCTION(DIVL, 3)
+SEMANTIC_FUNCTION(DIVUL, 3)
+SEMANTIC_FUNCTION(REML, 3)
+SEMANTIC_FUNCTION(REMUL, 3)
+SEMANTIC_FUNCTION(ABSL, 2)
+SEMANTIC_FUNCTION(SWAPL, 2)
+SEMANTIC_FUNCTION(SWAPEL, 2)
+SEMANTIC_FUNCTION(NOTL, 2)
+SEMANTIC_FUNCTION(SETEQL, 3)
+SEMANTIC_FUNCTION(BREQL, 3)
+SEMANTIC_FUNCTION(SETNEL, 3)
+SEMANTIC_FUNCTION(BRNEL, 3)
+SEMANTIC_FUNCTION(SETLTL, 3)
+SEMANTIC_FUNCTION(BRLTL, 3)
+SEMANTIC_FUNCTION(SETGEL, 3)
+SEMANTIC_FUNCTION(BRGEL, 3)
+SEMANTIC_FUNCTION(SETLEL, 3)
+SEMANTIC_FUNCTION(SETGTL, 3)
+SEMANTIC_FUNCTION(BRLOL, 3)
+SEMANTIC_FUNCTION(SETLOL, 3)
+SEMANTIC_FUNCTION(BRHSL, 3)
+SEMANTIC_FUNCTION(SETHSL, 3)
+SEMANTIC_FUNCTION(EXL, 2)
+SEMANTIC_FUNCTION(LLOCKL, 2)
+SEMANTIC_FUNCTION(SCONDL, 2)
+SEMANTIC_FUNCTION(LDL, 3)
+SEMANTIC_FUNCTION(STL, 3)
+SEMANTIC_FUNCTION(STDL, 3)
+SEMANTIC_FUNCTION(POPL, 1)
+SEMANTIC_FUNCTION(NORML, 2)
+SEMANTIC_FUNCTION(FLSL, 2)
+SEMANTIC_FUNCTION(FFSL, 2)
+SEMANTIC_FUNCTION(DBNZL, 2)
+SEMANTIC_FUNCTION(SEXWL, 2)
+SEMANTIC_FUNCTION(PUSHL, 1)
+
+MAPPING(absl, ABSL, 2, 1, 0)
+MAPPING(adcl, ADCL, 3, 1, 2, 0)
+MAPPING(add1l, ADD1L, 3, 1, 2, 0)
+MAPPING(add2l, ADD2L, 3, 1, 2, 0)
+MAPPING(add3l, ADD3L, 3, 1, 2, 0)
+MAPPING(addl, ADDL, 3, 1, 2, 0)
+MAPPING(addl_s, ADDL, 3, 1, 2, 0)
+MAPPING(aexl, AEXL, 2, 1, 0)
+MAPPING(andl, ANDL, 3, 0, 1, 2)
+MAPPING(andl_s, ANDL, 3, 0, 1, 2)
+MAPPING(asll, ASLL, 3, 1, 2, 0)
+MAPPING(asrl, ASRL, 3, 1, 2, 0)
+MAPPING(bclrl, BCLRL, 3, 2, 0, 1)
+MAPPING(bicl, BICL, 3, 0, 1, 2)
+MAPPING(bmskl, BMSKL, 3, 2, 0, 1)
+MAPPING(bmsknl, BMSKNL, 3, 2, 0, 1)
+
+MAPPING(breql, BREQL, 3, 0, 1, 2)
+MAPPING(brnel, BRNEL, 3, 0, 1, 2)
+MAPPING(brltl, BRLTL, 3, 0, 1, 2)
+MAPPING(brgel, BRGEL, 3, 0, 1, 2)
+MAPPING(brlol, BRLOL, 3, 0, 1, 2)
+MAPPING(brhsl, BRHSL, 3, 0, 1, 2)
+MAPPING(bsetl, BSETL, 3, 2, 0, 1)
+MAPPING(btstl, BTSTL, 2, 1, 0)
+MAPPING(bxorl, BXORL, 3, 2, 0, 1)
+MAPPING(cmpl, CMPL, 2, 0, 1)
+
+MAPPING(divl, DIVL, 3, 2, 1, 0)
+MAPPING(divul, DIVUL, 3, 2, 0, 1)
+
+MAPPING(exl, EXL, 2, 0, 1)
+MAPPING(flsl, FLSL, 2, 1, 0)
+MAPPING(ffsl, FFSL, 2, 1, 0)
+
+CONSTANT(LDL, ldl, 2, 0) /* For variable @src2 */
+MAPPING(ldl, LDL, 3, 1, 2, 0)
+
+CONSTANT(STL, stl, 2, 0) /* For variable @src2 */
+MAPPING(stl, STL, 3, 1, 2, 0)
+
+MAPPING(llockl, LLOCKL, 2, 0, 1)
+
+MAPPING(lrl, LRL, 2, 0, 1)
+
+CONSTANT(LSRL, lsrl, 2, 1) /* For variable @c */
+MAPPING(lsrl, LSRL, 3, 1, 2, 0)
+
+MAPPING(maxl, MAXL, 3, 1, 2, 0)
+MAPPING(minl, MINL, 3, 1, 2, 0)
+
+MAPPING(movl, MOVL, 2, 0, 1)
+MAPPING(movl_s, MOVL, 2, 0, 1)
+
+MAPPING(movhl, MOVHL, 2, 0, 1)
+MAPPING(movhl_s, MOVHL, 2, 0, 1)
+
+MAPPING(norml, NORML, 2, 1, 0)
+MAPPING(notl, NOTL, 2, 0, 1)
+MAPPING(orl, ORL, 3, 0, 1, 2)
+MAPPING(orl_s, ORL, 3, 0, 1, 2)
+MAPPING(xorl, XORL, 3, 0, 1, 2)
+MAPPING(rcmpl, CMPL, 2, 1, 0)
+MAPPING(reml, REML, 3, 2, 1, 0)
+MAPPING(remul, REMUL, 3, 2, 0, 1)
+
+MAPPING(roll, ROLL, 2, 1, 0)
+MAPPING(rsubl, SUBL, 3, 2, 1, 0)
+MAPPING(sbcl, SBCL, 3, 1, 2, 0)
+MAPPING(scondl, SCONDL, 2, 1, 0)
+
+MAPPING(seteql, SETEQL, 3, 1, 2, 0)
+MAPPING(setgel, SETGEL, 3, 1, 2, 0)
+MAPPING(setgtl, SETGTL, 3, 1, 2, 0)
+MAPPING(sethsl, SETHSL, 3, 1, 2, 0)
+MAPPING(setlel, SETLEL, 3, 1, 2, 0)
+MAPPING(setlol, SETLOL, 3, 1, 2, 0)
+MAPPING(setltl, SETLTL, 3, 1, 2, 0)
+MAPPING(setnel, SETNEL, 3, 1, 2, 0)
+
+MAPPING(sexbl, SEXBL, 2, 0, 1)
+MAPPING(sexhl, SEXHL, 2, 0, 1)
+MAPPING(sexwl, SEXWL, 2, 0, 1)
+
+CONSTANT(STDL, stdl, 2, 0) /* For variable @src2 */
+MAPPING(stdl, STDL, 3, 1, 2, 0)
+
+MAPPING(subl, SUBL, 3, 1, 2, 0)
+MAPPING(subl_s, SUBL, 3, 1, 2, 0)
+MAPPING(sub1l, SUB1L, 3, 1, 2, 0)
+MAPPING(sub2l, SUB2L, 3, 1, 2, 0)
+MAPPING(sub3l, SUB3L, 3, 1, 2, 0)
+
+MAPPING(swapl, SWAPL, 2, 1, 0)
+MAPPING(swapel, SWAPEL, 2, 1, 0)
+MAPPING(tstl, TSTL, 2, 0, 1)
+
+MAPPING(xbful, XBFUL, 3, 2, 1, 0)
+
+MAPPING(pushl_s, PUSHL, 1, 0)
+MAPPING(pushdl_s, PUSHL, 1, 0)
+MAPPING(popl_s, POPL, 1, 0)
+MAPPING(popdl_s, POPL, 1, 0)
+
+MAPPING(dbnz, DBNZL, 2, 0, 1)
diff --git a/target/arc/semfunc_mapping.def b/target/arc/semfunc_mapping.def
index ab8d9ff123..746339d9e6 100644
--- a/target/arc/semfunc_mapping.def
+++ b/target/arc/semfunc_mapping.def
@@ -16,306 +16,10 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-SEMANTIC_FUNCTION(FLAG, 1)
-SEMANTIC_FUNCTION(KFLAG, 1)
-SEMANTIC_FUNCTION(ADD, 3)
-SEMANTIC_FUNCTION(ADD1, 3)
-SEMANTIC_FUNCTION(ADD2, 3)
-SEMANTIC_FUNCTION(ADD3, 3)
-SEMANTIC_FUNCTION(ADC, 3)
-SEMANTIC_FUNCTION(SBC, 3)
-SEMANTIC_FUNCTION(NEG, 2)
-SEMANTIC_FUNCTION(SUB, 3)
-SEMANTIC_FUNCTION(SUB1, 3)
-SEMANTIC_FUNCTION(SUB2, 3)
-SEMANTIC_FUNCTION(SUB3, 3)
-SEMANTIC_FUNCTION(MAX, 3)
-SEMANTIC_FUNCTION(MIN, 3)
-SEMANTIC_FUNCTION(CMP, 2)
-SEMANTIC_FUNCTION(AND, 3)
-SEMANTIC_FUNCTION(OR, 3)
-SEMANTIC_FUNCTION(XOR, 3)
-SEMANTIC_FUNCTION(MOV, 2)
-SEMANTIC_FUNCTION(ASL, 3)
-SEMANTIC_FUNCTION(ASR, 3)
-SEMANTIC_FUNCTION(ASR8, 2)
-SEMANTIC_FUNCTION(ASR16, 2)
-SEMANTIC_FUNCTION(LSL16, 2)
-SEMANTIC_FUNCTION(LSL8, 2)
-SEMANTIC_FUNCTION(LSR, 3)
-SEMANTIC_FUNCTION(LSR16, 2)
-SEMANTIC_FUNCTION(LSR8, 2)
-SEMANTIC_FUNCTION(BIC, 3)
-SEMANTIC_FUNCTION(BCLR, 3)
-SEMANTIC_FUNCTION(BMSK, 3)
-SEMANTIC_FUNCTION(BMSKN, 3)
-SEMANTIC_FUNCTION(BSET, 3)
-SEMANTIC_FUNCTION(BXOR, 3)
-SEMANTIC_FUNCTION(ROL, 2)
-SEMANTIC_FUNCTION(ROL8, 2)
-SEMANTIC_FUNCTION(ROR, 3)
-SEMANTIC_FUNCTION(ROR8, 2)
-SEMANTIC_FUNCTION(RLC, 2)
-SEMANTIC_FUNCTION(RRC, 2)
-SEMANTIC_FUNCTION(SEXB, 2)
-SEMANTIC_FUNCTION(SEXH, 2)
-SEMANTIC_FUNCTION(EXTB, 2)
-SEMANTIC_FUNCTION(EXTH, 2)
-SEMANTIC_FUNCTION(BTST, 2)
-SEMANTIC_FUNCTION(TST, 2)
-SEMANTIC_FUNCTION(XBFU, 3)
-SEMANTIC_FUNCTION(AEX, 2)
-SEMANTIC_FUNCTION(LR, 2)
-SEMANTIC_FUNCTION(CLRI, 1)
-SEMANTIC_FUNCTION(SETI, 1)
-SEMANTIC_FUNCTION(NOP, 0)
-SEMANTIC_FUNCTION(PREALLOC, 0)
-SEMANTIC_FUNCTION(PREFETCH, 2)
-SEMANTIC_FUNCTION(MPY, 3)
-SEMANTIC_FUNCTION(MPYMU, 3)
-SEMANTIC_FUNCTION(MPYM, 3)
-SEMANTIC_FUNCTION(MPYU, 3)
-SEMANTIC_FUNCTION(MPYUW, 3)
-SEMANTIC_FUNCTION(MPYW, 3)
-SEMANTIC_FUNCTION(DIV, 3)
-SEMANTIC_FUNCTION(DIVU, 3)
-SEMANTIC_FUNCTION(REM, 3)
-SEMANTIC_FUNCTION(REMU, 3)
-SEMANTIC_FUNCTION(MAC, 3)
-SEMANTIC_FUNCTION(MACU, 3)
-SEMANTIC_FUNCTION(MACD, 3)
-SEMANTIC_FUNCTION(MACDU, 3)
-SEMANTIC_FUNCTION(ABS, 2)
-SEMANTIC_FUNCTION(SWAP, 2)
-SEMANTIC_FUNCTION(SWAPE, 2)
-SEMANTIC_FUNCTION(NOT, 2)
-SEMANTIC_FUNCTION(BI, 1)
-SEMANTIC_FUNCTION(BIH, 1)
-SEMANTIC_FUNCTION(B, 1)
-SEMANTIC_FUNCTION(B_S, 1)
-SEMANTIC_FUNCTION(BBIT0, 3)
-SEMANTIC_FUNCTION(BBIT1, 3)
-SEMANTIC_FUNCTION(BL, 1)
-SEMANTIC_FUNCTION(J, 1)
-SEMANTIC_FUNCTION(JL, 1)
-SEMANTIC_FUNCTION(SETEQ, 3)
-SEMANTIC_FUNCTION(BREQ, 3)
-SEMANTIC_FUNCTION(SETNE, 3)
-SEMANTIC_FUNCTION(BRNE, 3)
-SEMANTIC_FUNCTION(SETLT, 3)
-SEMANTIC_FUNCTION(BRLT, 3)
-SEMANTIC_FUNCTION(SETGE, 3)
-SEMANTIC_FUNCTION(BRGE, 3)
-SEMANTIC_FUNCTION(SETLE, 3)
-SEMANTIC_FUNCTION(SETGT, 3)
-SEMANTIC_FUNCTION(BRLO, 3)
-SEMANTIC_FUNCTION(SETLO, 3)
-SEMANTIC_FUNCTION(BRHS, 3)
-SEMANTIC_FUNCTION(SETHS, 3)
-SEMANTIC_FUNCTION(EX, 2)
-SEMANTIC_FUNCTION(LLOCK, 2)
-SEMANTIC_FUNCTION(LLOCKD, 2)
-SEMANTIC_FUNCTION(SCOND, 2)
-SEMANTIC_FUNCTION(SCONDD, 2)
-SEMANTIC_FUNCTION(DMB, 1)
-SEMANTIC_FUNCTION(LD, 3)
-SEMANTIC_FUNCTION(LDD, 3)
-SEMANTIC_FUNCTION(ST, 3)
-SEMANTIC_FUNCTION(STD, 3)
-SEMANTIC_FUNCTION(POP, 1)
-SEMANTIC_FUNCTION(PUSH, 1)
-SEMANTIC_FUNCTION(LP, 1)
-SEMANTIC_FUNCTION(NORM, 2)
-SEMANTIC_FUNCTION(NORMH, 2)
-SEMANTIC_FUNCTION(FLS, 2)
-SEMANTIC_FUNCTION(FFS, 2)
+#ifdef TARGET_ARCV2
+#include "semfunc-v2_mapping.def"
+#endif
 
-
-MAPPING(flag, FLAG, 1, 0)
-MAPPING(kflag, KFLAG, 1, 0)
-MAPPING(add, ADD, 3, 1, 2, 0)
-MAPPING(add_s, ADD, 3, 1, 2, 0)
-MAPPING(add1, ADD1, 3, 1, 2, 0)
-MAPPING(add1_s, ADD1, 3, 1, 2, 0)
-MAPPING(add2, ADD2, 3, 1, 2, 0)
-MAPPING(add2_s, ADD2, 3, 1, 2, 0)
-MAPPING(add3, ADD3, 3, 1, 2, 0)
-MAPPING(add3_s, ADD3, 3, 1, 2, 0)
-MAPPING(adc, ADC, 3, 1, 2, 0)
-MAPPING(sbc, SBC, 3, 1, 2, 0)
-MAPPING(neg, NEG, 2, 1, 0)
-MAPPING(neg_s, NEG, 2, 1, 0)
-MAPPING(sub, SUB, 3, 1, 2, 0)
-MAPPING(sub_s, SUB, 3, 1, 2, 0)
-MAPPING(rsub, SUB, 3, 2, 1, 0)
-MAPPING(sub1, SUB1, 3, 1, 2, 0)
-MAPPING(sub2, SUB2, 3, 1, 2, 0)
-MAPPING(sub3, SUB3, 3, 1, 2, 0)
-MAPPING(max, MAX, 3, 1, 2, 0)
-MAPPING(min, MIN, 3, 1, 2, 0)
-MAPPING(cmp, CMP, 2, 0, 1)
-MAPPING(cmp_s, CMP, 2, 0, 1)
-MAPPING(rcmp, CMP, 2, 1, 0)
-MAPPING(and, AND, 3, 1, 2, 0)
-MAPPING(and_s, AND, 3, 1, 2, 0)
-MAPPING(or, OR, 3, 1, 2, 0)
-MAPPING(or_s, OR, 3, 1, 2, 0)
-MAPPING(xor, XOR, 3, 1, 2, 0)
-MAPPING(xor_s, XOR, 3, 1, 2, 0)
-MAPPING(mov, MOV, 2, 1, 0)
-MAPPING(mov_s, MOV, 2, 1, 0)
-CONSTANT(ASL, asl, 2, 268435457) /* For variable @c */
-MAPPING(asl, ASL, 3, 1, 2, 0)
-CONSTANT(ASL, asl_s, 2, 268435457) /* For variable @c */
-MAPPING(asl_s, ASL, 3, 1, 2, 0)
-CONSTANT(ASR, asr, 2, 1) /* For variable @c */
-MAPPING(asr, ASR, 3, 1, 2, 0)
-CONSTANT(ASR, asr_s, 2, 1) /* For variable @c */
-MAPPING(asr_s, ASR, 3, 1, 2, 0)
-MAPPING(asr8, ASR8, 2, 1, 0)
-MAPPING(asr16, ASR16, 2, 1, 0)
-MAPPING(lsl16, LSL16, 2, 1, 0)
-MAPPING(lsl8, LSL8, 2, 1, 0)
-CONSTANT(LSR, lsr, 2, 1) /* For variable @c */
-MAPPING(lsr, LSR, 3, 1, 2, 0)
-CONSTANT(LSR, lsr_s, 2, 1) /* For variable @c */
-MAPPING(lsr_s, LSR, 3, 1, 2, 0)
-MAPPING(lsr16, LSR16, 2, 1, 0)
-MAPPING(lsr8, LSR8, 2, 1, 0)
-MAPPING(bic, BIC, 3, 1, 2, 0)
-MAPPING(bic_s, BIC, 3, 1, 2, 0)
-MAPPING(bclr, BCLR, 3, 2, 1, 0)
-MAPPING(bclr_s, BCLR, 3, 2, 1, 0)
-MAPPING(bmsk, BMSK, 3, 2, 1, 0)
-MAPPING(bmsk_s, BMSK, 3, 2, 1, 0)
-MAPPING(bmskn, BMSKN, 3, 2, 1, 0)
-MAPPING(bset, BSET, 3, 2, 1, 0)
-MAPPING(bset_s, BSET, 3, 2, 1, 0)
-MAPPING(bxor, BXOR, 3, 2, 1, 0)
-MAPPING(rol, ROL, 2, 1, 0)
-MAPPING(rol8, ROL8, 2, 1, 0)
-CONSTANT(ROR, ror, 2, 1) /* For variable @n */
-MAPPING(ror, ROR, 3, 1, 2, 0)
-MAPPING(ror8, ROR8, 2, 1, 0)
-MAPPING(rlc, RLC, 2, 1, 0)
-MAPPING(rrc, RRC, 2, 1, 0)
-MAPPING(sexb, SEXB, 2, 0, 1)
-MAPPING(sexb_s, SEXB, 2, 0, 1)
-MAPPING(sexh, SEXH, 2, 0, 1)
-MAPPING(sexh_s, SEXH, 2, 0, 1)
-MAPPING(extb, EXTB, 2, 0, 1)
-MAPPING(extb_s, EXTB, 2, 0, 1)
-MAPPING(exth, EXTH, 2, 0, 1)
-MAPPING(exth_s, EXTH, 2, 0, 1)
-MAPPING(btst, BTST, 2, 1, 0)
-MAPPING(btst_s, BTST, 2, 1, 0)
-MAPPING(tst, TST, 2, 0, 1)
-MAPPING(tst_s, TST, 2, 0, 1)
-MAPPING(xbfu, XBFU, 3, 2, 1, 0)
-MAPPING(aex, AEX, 2, 1, 0)
-MAPPING(lr, LR, 2, 0, 1)
-MAPPING(clri, CLRI, 1, 0)
-MAPPING(seti, SETI, 1, 0)
-MAPPING(nop, NOP, 0)
-MAPPING(nop_s, NOP, 0)
-MAPPING(prealloc, PREALLOC, 0)
-CONSTANT(PREFETCH, prefetch, 1, 0) /* For variable @src2 */
-MAPPING(prefetch, PREFETCH, 2, 0, 1)
-CONSTANT(PREFETCH, prefetchw, 1, 0) /* For variable @src2 */
-MAPPING(prefetchw, PREFETCH, 2, 0, 1)
-MAPPING(mpy, MPY, 3, 1, 2, 0)
-MAPPING(mpy_s, MPY, 3, 1, 2, 0)
-MAPPING(mpymu, MPYMU, 3, 0, 1, 2)
-MAPPING(mpym, MPYM, 3, 0, 1, 2)
-MAPPING(mpyu, MPYU, 3, 1, 2, 0)
-MAPPING(mpyuw, MPYUW, 3, 0, 1, 2)
-MAPPING(mpyuw_s, MPYUW, 3, 0, 1, 2)
-MAPPING(mpyw, MPYW, 3, 0, 1, 2)
-MAPPING(mpyw_s, MPYW, 3, 0, 1, 2)
-MAPPING(div, DIV, 3, 2, 1, 0)
-MAPPING(divu, DIVU, 3, 2, 0, 1)
-MAPPING(rem, REM, 3, 2, 1, 0)
-MAPPING(remu, REMU, 3, 2, 0, 1)
-MAPPING(mac, MAC, 3, 1, 2, 0)
-MAPPING(macu, MACU, 3, 1, 2, 0)
-MAPPING(macd, MACD, 3, 1, 2, 0)
-MAPPING(macdu, MACDU, 3, 1, 2, 0)
-MAPPING(abs, ABS, 2, 1, 0)
-MAPPING(abs_s, ABS, 2, 1, 0)
-MAPPING(swap, SWAP, 2, 1, 0)
-MAPPING(swape, SWAPE, 2, 1, 0)
-MAPPING(not, NOT, 2, 0, 1)
-MAPPING(not_s, NOT, 2, 0, 1)
-MAPPING(bi, BI, 1, 0)
-MAPPING(bih, BIH, 1, 0)
-MAPPING(b, B, 1, 0)
-MAPPING(beq_s, B_S, 1, 0)
-MAPPING(bne_s, B_S, 1, 0)
-MAPPING(bgt_s, B_S, 1, 0)
-MAPPING(bge_s, B_S, 1, 0)
-MAPPING(blt_s, B_S, 1, 0)
-MAPPING(ble_s, B_S, 1, 0)
-MAPPING(bhi_s, B_S, 1, 0)
-MAPPING(bhs_s, B_S, 1, 0)
-MAPPING(blo_s, B_S, 1, 0)
-MAPPING(bls_s, B_S, 1, 0)
-MAPPING(b_s, B_S, 1, 0)
-MAPPING(bbit0, BBIT0, 3, 0, 1, 2)
-MAPPING(bbit1, BBIT1, 3, 0, 1, 2)
-MAPPING(bl, BL, 1, 0)
-MAPPING(bl_s, BL, 1, 0)
-MAPPING(j, J, 1, 0)
-MAPPING(j_s, J, 1, 0)
-MAPPING(jeq_s, J, 1, 0)
-MAPPING(jne_s, J, 1, 0)
-MAPPING(jl, JL, 1, 0)
-MAPPING(jl_s, JL, 1, 0)
-MAPPING(seteq, SETEQ, 3, 1, 2, 0)
-MAPPING(breq, BREQ, 3, 0, 1, 2)
-MAPPING(breq_s, BREQ, 3, 0, 1, 2)
-MAPPING(setne, SETNE, 3, 1, 2, 0)
-MAPPING(brne, BRNE, 3, 0, 1, 2)
-MAPPING(brne_s, BRNE, 3, 0, 1, 2)
-MAPPING(setlt, SETLT, 3, 1, 2, 0)
-MAPPING(brlt, BRLT, 3, 0, 1, 2)
-MAPPING(setge, SETGE, 3, 1, 2, 0)
-MAPPING(brge, BRGE, 3, 0, 1, 2)
-MAPPING(setle, SETLE, 3, 1, 2, 0)
-MAPPING(setgt, SETGT, 3, 1, 2, 0)
-MAPPING(brlo, BRLO, 3, 0, 1, 2)
-MAPPING(setlo, SETLO, 3, 1, 2, 0)
-MAPPING(brhs, BRHS, 3, 0, 1, 2)
-MAPPING(seths, SETHS, 3, 1, 2, 0)
-MAPPING(ex, EX, 2, 0, 1)
-MAPPING(llock, LLOCK, 2, 0, 1)
-MAPPING(llockd, LLOCKD, 2, 0, 1)
-MAPPING(scond, SCOND, 2, 1, 0)
-MAPPING(scondd, SCONDD, 2, 1, 0)
-MAPPING(dmb, DMB, 1, 0)
-CONSTANT(LD, ld, 2, 0) /* For variable @src2 */
-MAPPING(ld, LD, 3, 1, 2, 0)
-MAPPING(ld_s, LD, 3, 1, 2, 0)
-MAPPING(ldb_s, LD, 3, 1, 2, 0)
-MAPPING(ldh_s, LD, 3, 1, 2, 0)
-MAPPING(ldw_s, LD, 3, 1, 2, 0)
-CONSTANT(LD, ldi, 2, 0) /* For variable @src2 */
-MAPPING(ldi, LD, 3, 1, 2, 0)
-CONSTANT(LD, ldi_s, 2, 0) /* For variable @src2 */
-MAPPING(ldi_s, LD, 3, 1, 2, 0)
-CONSTANT(LDD, ldd, 2, 0) /* For variable @src2 */
-MAPPING(ldd, LDD, 3, 1, 2, 0)
-CONSTANT(ST, st, 2, 0) /* For variable @src2 */
-MAPPING(st, ST, 3, 1, 2, 0)
-MAPPING(st_s, ST, 3, 1, 2, 0)
-MAPPING(stb_s, ST, 3, 1, 2, 0)
-MAPPING(sth_s, ST, 3, 1, 2, 0)
-MAPPING(stw_s, ST, 3, 1, 2, 0)
-CONSTANT(STD, std, 2, 0) /* For variable @src2 */
-MAPPING(std, STD, 3, 1, 2, 0)
-MAPPING(pop_s, POP, 1, 0)
-MAPPING(push_s, PUSH, 1, 0)
-MAPPING(lp, LP, 1, 0)
-MAPPING(norm, NORM, 2, 1, 0)
-MAPPING(normh, NORMH, 2, 1, 0)
-MAPPING(fls, FLS, 2, 1, 0)
-MAPPING(ffs, FFS, 2, 1, 0)
+#ifdef TARGET_ARCV3
+#include "semfunc-v3_mapping.def"
+#endif
-- 
2.20.1


