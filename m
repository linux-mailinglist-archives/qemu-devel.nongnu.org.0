Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5BD30EA6F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:51:58 +0100 (CET)
Received: from localhost ([::1]:40178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7UkP-00066J-0v
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:51:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TsU-0000UX-H6
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:56:14 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:35093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TsR-0006rE-TD
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:56:14 -0500
Received: by mail-pf1-x434.google.com with SMTP id w14so1098799pfi.2
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B9R5rR38+7XqiIyLeWWFMRDiEMmeppRUcow0M2UfyuA=;
 b=DKE4Mw8yMXsTj/dAkKPmuGw5wSrpXbp0kui9ioYWRLe0uP6eWNe9j4hv1m2C9H/tCG
 +3dMbch8lYBt3lg3z7YBZGRWTGxECvwkBH3rD/hEy2CqleviE+fPaWJUWhoQYUk0UBNH
 6NC9qwLO7KWXtdB83TXQNNOKoU9hTiDGPxhn/m/zTbggxT3p0J6TjnLNUKywHDHqhDaf
 iym9MxMBcVsdFHNNdermf6iGxQjrvLFk4XK06dNA6scPTfQTMJdXHnnSdoGm9HHIqYQj
 BRjhYOss+LOC/QnHn4Esj/LUk2xqv7DZKm3MSB6A0iE832DZkMEnRIyDx70icplDFmkN
 5V9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B9R5rR38+7XqiIyLeWWFMRDiEMmeppRUcow0M2UfyuA=;
 b=CUpMMaheBh8skSa6SBDJXRxUT3hCzF70AbdW8iO3FNWqY8tgr3j9KLZ/jzy5MVjhjs
 6e6BWn8JDaSgAtBC16s97dkMnlwnCGaoZvN15ItYi0L68zdCdv4tzBV00jFqsL6XDuNM
 9nr6/Ckz0JBRiHo2Z8ufg+wc3Bz+d+n8aWhVndo5bVh3OcP3WPsQSyrZoJnzzM+B4mwm
 M5aCqpKIyimGqxxxyR7IqT504oqw5TYaJzUjbo6g9lIA0p6DXxCF7bJiik7wHeNCNL/a
 gvRkUgfB+qKXIc2MpLhI9MToEmiHiU92KczQZ9XEgSWog/SoqwVVhMfVp69+Gf8oWhdL
 y5Tw==
X-Gm-Message-State: AOAM532OsiFwr6XaqV0y4muR28vkzzrbWC2Lzmi6afDTQFDiTHftP5UE
 OiPSEEGvAcZZZ1AUaU4p3JAkS80eE4JBhFyM
X-Google-Smtp-Source: ABdhPJza1/8/To96va1xMuV1h4IdZ09iYLUIlVw1Un3M8HLR/M3fhp0bPQLS3UasozNFBZd213vUKg==
X-Received: by 2002:a62:3503:0:b029:1aa:6f15:b9fe with SMTP id
 c3-20020a6235030000b02901aa6f15b9femr5771737pfa.65.1612403770414; 
 Wed, 03 Feb 2021 17:56:10 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id s1sm3218165pjg.17.2021.02.03.17.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:56:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 84/93] tcg/tci: Emit setcond before brcond
Date: Wed,  3 Feb 2021 15:56:07 -1000
Message-Id: <20210204015607.885503-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The encoding planned for tci does not have enough room for
brcond2, with 4 registers and a condition as input as well
as the label.  Resolve the condition into TCG_REG_TMP, and
relax brcond to one register plus a label, considering the
condition to always be reg != 0.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c                | 68 ++++++++++------------------------------
 tcg/tci/tcg-target.c.inc | 52 +++++++++++-------------------
 2 files changed, 35 insertions(+), 85 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index d27db9f720..e7268b13e1 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -141,6 +141,16 @@ static void tci_args_nl(const uint8_t **tb_ptr, uint8_t *n0, void **l1)
     check_size(start, tb_ptr);
 }
 
+static void tci_args_rl(const uint8_t **tb_ptr, TCGReg *r0, void **l1)
+{
+    const uint8_t *start = *tb_ptr;
+
+    *r0 = tci_read_r(tb_ptr);
+    *l1 = (void *)tci_read_label(tb_ptr);
+
+    check_size(start, tb_ptr);
+}
+
 static void tci_args_rr(const uint8_t **tb_ptr,
                         TCGReg *r0, TCGReg *r1)
 {
@@ -212,19 +222,6 @@ static void tci_args_rrs(const uint8_t **tb_ptr,
     check_size(start, tb_ptr);
 }
 
-static void tci_args_rrcl(const uint8_t **tb_ptr,
-                          TCGReg *r0, TCGReg *r1, TCGCond *c2, void **l3)
-{
-    const uint8_t *start = *tb_ptr;
-
-    *r0 = tci_read_r(tb_ptr);
-    *r1 = tci_read_r(tb_ptr);
-    *c2 = tci_read_b(tb_ptr);
-    *l3 = (void *)tci_read_label(tb_ptr);
-
-    check_size(start, tb_ptr);
-}
-
 static void tci_args_rrrc(const uint8_t **tb_ptr,
                           TCGReg *r0, TCGReg *r1, TCGReg *r2, TCGCond *c3)
 {
@@ -293,21 +290,6 @@ static void tci_args_rrrr(const uint8_t **tb_ptr,
     check_size(start, tb_ptr);
 }
 
-static void tci_args_rrrrcl(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
-                            TCGReg *r2, TCGReg *r3, TCGCond *c4, void **l5)
-{
-    const uint8_t *start = *tb_ptr;
-
-    *r0 = tci_read_r(tb_ptr);
-    *r1 = tci_read_r(tb_ptr);
-    *r2 = tci_read_r(tb_ptr);
-    *r3 = tci_read_r(tb_ptr);
-    *c4 = tci_read_b(tb_ptr);
-    *l5 = (void *)tci_read_label(tb_ptr);
-
-    check_size(start, tb_ptr);
-}
-
 static void tci_args_rrrrrc(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
                             TCGReg *r2, TCGReg *r3, TCGReg *r4, TCGCond *c5)
 {
@@ -723,8 +705,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
 #endif
         case INDEX_op_brcond_i32:
-            tci_args_rrcl(&tb_ptr, &r0, &r1, &condition, &ptr);
-            if (tci_compare32(regs[r0], regs[r1], condition)) {
+            tci_args_rl(&tb_ptr, &r0, &ptr);
+            if ((uint32_t)regs[r0]) {
                 tb_ptr = ptr;
             }
             break;
@@ -741,15 +723,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             T2 = tci_uint64(regs[r5], regs[r4]);
             tci_write_reg64(regs, r1, r0, T1 - T2);
             break;
-        case INDEX_op_brcond2_i32:
-            tci_args_rrrrcl(&tb_ptr, &r0, &r1, &r2, &r3, &condition, &ptr);
-            T1 = tci_uint64(regs[r1], regs[r0]);
-            T2 = tci_uint64(regs[r3], regs[r2]);
-            if (tci_compare64(T1, T2, condition)) {
-                tb_ptr = ptr;
-                continue;
-            }
-            break;
         case INDEX_op_mulu2_i32:
             tci_args_rrrr(&tb_ptr, &r0, &r1, &r2, &r3);
             tci_write_reg64(regs, r1, r0, (uint64_t)regs[r2] * regs[r3]);
@@ -877,8 +850,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
 #endif
         case INDEX_op_brcond_i64:
-            tci_args_rrcl(&tb_ptr, &r0, &r1, &condition, &ptr);
-            if (tci_compare64(regs[r0], regs[r1], condition)) {
+            tci_args_rl(&tb_ptr, &r0, &ptr);
+            if (regs[r0]) {
                 tb_ptr = ptr;
             }
             break;
@@ -1188,9 +1161,9 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
 
     case INDEX_op_brcond_i32:
     case INDEX_op_brcond_i64:
-        tci_args_rrcl(&tb_ptr, &r0, &r1, &c, &ptr);
-        info->fprintf_func(info->stream, "%-12s  %s,%s,%s,%p",
-                           op_name, str_r(r0), str_r(r1), str_c(c), ptr);
+        tci_args_rl(&tb_ptr, &r0, &ptr);
+        info->fprintf_func(info->stream, "%-12s  %s,0,ne,%p",
+                           op_name, str_r(r0), ptr);
         break;
 
     case INDEX_op_setcond_i32:
@@ -1315,13 +1288,6 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
                            str_r(r3), str_r(r4), str_c(c));
         break;
 
-    case INDEX_op_brcond2_i32:
-        tci_args_rrrrcl(&tb_ptr, &r0, &r1, &r2, &r3, &c, &ptr);
-        info->fprintf_func(info->stream, "%-12s  %s,%s,%s,%s,%s,%p",
-                           op_name, str_r(r0), str_r(r1),
-                           str_r(r2), str_r(r3), str_c(c), ptr);
-        break;
-
     case INDEX_op_mulu2_i32:
         tci_args_rrrr(&tb_ptr, &r0, &r1, &r2, &r3);
         info->fprintf_func(info->stream, "%-12s  %s,%s,%s,%s",
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index b29e75425d..e06d4e9380 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -349,6 +349,17 @@ static void tcg_out_op_rI(TCGContext *s, TCGOpcode op,
 }
 #endif
 
+static void tcg_out_op_rl(TCGContext *s, TCGOpcode op, TCGReg r0, TCGLabel *l1)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tci_out_label(s, l1);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_op_rr(TCGContext *s, TCGOpcode op, TCGReg r0, TCGReg r1)
 {
     uint8_t *old_code_ptr = s->code_ptr;
@@ -400,20 +411,6 @@ static void tcg_out_op_rrs(TCGContext *s, TCGOpcode op,
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
-static void tcg_out_op_rrcl(TCGContext *s, TCGOpcode op,
-                            TCGReg r0, TCGReg r1, TCGCond c2, TCGLabel *l3)
-{
-    uint8_t *old_code_ptr = s->code_ptr;
-
-    tcg_out_op_t(s, op);
-    tcg_out_r(s, r0);
-    tcg_out_r(s, r1);
-    tcg_out8(s, c2);
-    tci_out_label(s, l3);
-
-    old_code_ptr[1] = s->code_ptr - old_code_ptr;
-}
-
 static void tcg_out_op_rrrc(TCGContext *s, TCGOpcode op,
                             TCGReg r0, TCGReg r1, TCGReg r2, TCGCond c3)
 {
@@ -487,23 +484,6 @@ static void tcg_out_op_rrrr(TCGContext *s, TCGOpcode op,
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
-static void tcg_out_op_rrrrcl(TCGContext *s, TCGOpcode op,
-                              TCGReg r0, TCGReg r1, TCGReg r2, TCGReg r3,
-                              TCGCond c4, TCGLabel *l5)
-{
-    uint8_t *old_code_ptr = s->code_ptr;
-
-    tcg_out_op_t(s, op);
-    tcg_out_r(s, r0);
-    tcg_out_r(s, r1);
-    tcg_out_r(s, r2);
-    tcg_out_r(s, r3);
-    tcg_out8(s, c4);
-    tci_out_label(s, l5);
-
-    old_code_ptr[1] = s->code_ptr - old_code_ptr;
-}
-
 static void tcg_out_op_rrrrrc(TCGContext *s, TCGOpcode op,
                               TCGReg r0, TCGReg r1, TCGReg r2,
                               TCGReg r3, TCGReg r4, TCGCond c5)
@@ -704,7 +684,10 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
 
     CASE_32_64(brcond)
-        tcg_out_op_rrcl(s, opc, args[0], args[1], args[2], arg_label(args[3]));
+        tcg_out_op_rrrc(s, (opc == INDEX_op_brcond_i32
+                            ? INDEX_op_setcond_i32 : INDEX_op_setcond_i64),
+                        TCG_REG_TMP, args[0], args[1], args[2]);
+        tcg_out_op_rl(s, opc, TCG_REG_TMP, arg_label(args[3]));
         break;
 
     CASE_32_64(neg)      /* Optional (TCG_TARGET_HAS_neg_*). */
@@ -730,8 +713,9 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
                           args[3], args[4], args[5]);
         break;
     case INDEX_op_brcond2_i32:
-        tcg_out_op_rrrrcl(s, opc, args[0], args[1], args[2],
-                          args[3], args[4], arg_label(args[5]));
+        tcg_out_op_rrrrrc(s, INDEX_op_setcond2_i32, TCG_REG_TMP,
+                          args[0], args[1], args[2], args[3], args[4]);
+        tcg_out_op_rl(s, INDEX_op_brcond_i32, TCG_REG_TMP, arg_label(args[5]));
         break;
     case INDEX_op_mulu2_i32:
         tcg_out_op_rrrr(s, opc, args[0], args[1], args[2], args[3]);
-- 
2.25.1


