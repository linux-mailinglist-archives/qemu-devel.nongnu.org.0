Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4012131294A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:22:14 +0100 (CET)
Received: from localhost ([::1]:57612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8x7t-0000kS-5N
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:22:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSg-0002w8-DW
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:38 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:36059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSe-0006Ci-Ax
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:38 -0500
Received: by mail-pf1-x434.google.com with SMTP id 18so6616603pfz.3
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B9R5rR38+7XqiIyLeWWFMRDiEMmeppRUcow0M2UfyuA=;
 b=zsunbZTfGM6UeEdWmDaVFEknrrQ64uR0jXiB2qaPGuBkHogmhWGb3i1bkJb2g2jyws
 BgVRK4mDxYUIPtUC4bx7AbdB0e1PZu6U2MYzR64SlYhAdKRC8/l9yr+iOSjixgv/Mk66
 R19+v9FkLa3JANhEZDWAiz/7nzm20DW2xesqtcXjghl+DsFDjjmzO6mYCo266F3Cy1qZ
 nSyYx6/rCcuYtC/ivZ3IGwbTn/FIMlygESTk+UwAurxhbylTqlfN/0k/XR9bB88dLlp/
 sHW1K3hvyuhOiwN0wbma4g9/RaHZPedMh5U6eN6Z5buEPQ5uRTgLD3vRotraEUS/ZPAP
 mUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B9R5rR38+7XqiIyLeWWFMRDiEMmeppRUcow0M2UfyuA=;
 b=m05GixFOa/WO5Ik4udiy5veSeb0FU/Z2/ek9EAca8lh+0rnFDtGZMknEjRPxok51/i
 zfsFmdOhEvPq8QXUlwm9MeAK/iabTUyelID+tjqTXbJpOT3eN55RbNPF3s4gBXFVyglB
 NOsvsifPStI6ELkuPE7Yr5V2o4/Qr3pCFbdgP24Fp7XxR7CsJdF+7sruZr7Fg2pbnDll
 URpQw7IWBX6+vCuqZhsZyJhYRQH/zRBHaxUid+79LhLtAVwF1ZPQu7WhsLIUtIexxuzr
 NGSrDiBC+cB4DtUbyulwQR9BG1WC584k/I5Br7USd0VCD5G+ojTERU879KqBMZ92sFYg
 LprQ==
X-Gm-Message-State: AOAM532KAot5cTfxoSzE/Ai4RmY7ZZ9BuTOcrueRgRy3Hx7HZX0b3X4O
 oQzYkJxfLKi32Q6dl6HcObU6NGpLaXtZXA==
X-Google-Smtp-Source: ABdhPJwIaNQpsFsfbwrAkqO84K3M1AjiNdPchVxpje2nbhwBpV90OudbeKADSYTyxmsmSpAYbU2Cbg==
X-Received: by 2002:aa7:88c7:0:b029:1d1:4f1f:5fb6 with SMTP id
 k7-20020aa788c70000b02901d14f1f5fb6mr15463576pff.14.1612751975023; 
 Sun, 07 Feb 2021 18:39:35 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id 74sm650954pfw.53.2021.02.07.18.39.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:39:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 59/70] tcg/tci: Emit setcond before brcond
Date: Sun,  7 Feb 2021 18:37:41 -0800
Message-Id: <20210208023752.270606-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
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


