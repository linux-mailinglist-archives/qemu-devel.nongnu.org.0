Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CE331E112
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 22:12:39 +0100 (CET)
Received: from localhost ([::1]:54052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCU7i-0007qQ-LX
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 16:12:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMs-0001u5-Ks
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:24:14 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:38741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMo-0007jd-So
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:24:14 -0500
Received: by mail-pg1-x529.google.com with SMTP id m2so9218425pgq.5
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xVPJpsDWn13Ikd2YVdvJyZUJO3co9ndv44w3DFxxxYY=;
 b=n5JhAdaoCpZs4UIrCwZfG25PPl6Q7GwnWdHx0QqnhHDdGinjc2k8n5bpIGWsiRWSUV
 9qKStwKk933xK66ELC/oMrWWvHxZFbaKDbgWreoQYibDVT2GS41pWdi1Kdez6PZPSDA8
 6aVAvmppcFlWNhDaohvNzP9FAqMT6HE7TrOmLdU/qZQjLDlDMBxZqNnD0wenlOuClyFr
 0saH6EvVU4kC1QkhGOBeTb/FQPBzc5AbfdeT9qRvHOAMWCYV+PGDEtV2eYiHCrXqmpgh
 hPTZyTZHUpCQ2vfsfVPJlsKsMBuFMu0+8vfPd/PN56FT3TrXaf+7YCYWLDUm0WzUHedj
 +TUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xVPJpsDWn13Ikd2YVdvJyZUJO3co9ndv44w3DFxxxYY=;
 b=mogDaoAufK7TFvFVB5L4crtNjAcAj+BrFpbPbn/nZnJRW3LSM3h4rJ77R3OjmGvjym
 YOop/WiJUFLAUq40Gq+aAN2WpfvQPICt8RTFt675UEMxkD0Ce9M2Aq4yZ91aeJqMmg4G
 IfTdC0Q2UT49SrNLVfb9efrhkwQkf9hlgj9C8T/Ml3YGoObgRpgItDFAUmeJxB0XQmsL
 +blCvfANO2ZID4CMGC/fUI1l6hqUmbE+BQnTNi+K0mVkbqLmmCR/IKogPrMFeefCaXqa
 ldAh6V0qua8JR4eTb4Fpzh82gSKF5zmiGEpYOoXhsCkf3Uyc3QOS6T5m9o3Bl17Vcie0
 rpaw==
X-Gm-Message-State: AOAM530kbtNWUGOkN71C5ikxdFRM+qnosMbk9q1tmFLNaRI/12gEjxY0
 N4E9DM3CFX+6Nl4gz6bcltlo2ToDJ/snEg==
X-Google-Smtp-Source: ABdhPJzJJEXDtRy4uysYa+S7pGFRqSLiZVsvtFU+5wrsohdRSz5eAQhJ4ENekYnAlE/+b4gJdTN7Rw==
X-Received: by 2002:aa7:9e82:0:b029:1ec:c566:50b2 with SMTP id
 p2-20020aa79e820000b02901ecc56650b2mr989607pfq.22.1613593449589; 
 Wed, 17 Feb 2021 12:24:09 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id v126sm3232038pfv.163.2021.02.17.12.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:24:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 59/71] tcg/tci: Emit setcond before brcond
Date: Wed, 17 Feb 2021 12:20:24 -0800
Message-Id: <20210217202036.1724901-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
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
index 5718fc42a6..3f8c6a0291 100644
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
@@ -713,8 +695,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -731,15 +713,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -867,8 +840,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -1178,9 +1151,9 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
 
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
@@ -1305,13 +1278,6 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
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


