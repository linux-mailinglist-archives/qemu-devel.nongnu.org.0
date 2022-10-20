Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 080A8606277
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:08:46 +0200 (CEST)
Received: from localhost ([::1]:38700 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWDy-00068B-Ex
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:08:42 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olW8u-0001sn-Ac
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU7F-0003xG-TG
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:53:38 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:46660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU79-0000xd-EB
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:53:33 -0400
Received: by mail-pl1-x631.google.com with SMTP id f9so1610858plb.13
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pcFc6BCiy8AgtsELn4bI9AGbxpo/4pmRIjtL3WupDdQ=;
 b=jiyaZZuzURhOXqrzXsfPynw51W9qgCpHzQU1SKsxLKsVN3Jw7xHFSJM1Mryn8t8Jot
 QuNOvh4PjRPO2oaGKtby2NP3cmvPWmTB73wk7xO1GKMIIG74UKour41Mx8GYKGRy9F2W
 hlgWop2U7xsJP2Q1BDKH6BI2aDXR08+wdVh3j1lZEZqsc27mHpxAaqseUIHjrHcphWqB
 eSs/WkKX7LU4LkRVMja5nn8JQNR7q2KQFLRr7j6AcOZ0qK9IRSNsPhQdAKxQwIkRHmt1
 qQACZOqbb42CXtKSDSnppZtWE8wG/37rxVdtYM87U8KVuIWq9ormrJCWnsqZ98rZLoHX
 CfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pcFc6BCiy8AgtsELn4bI9AGbxpo/4pmRIjtL3WupDdQ=;
 b=dfGPoi8rsPAUKCZgCYqvRpWtqaJg+920N6ZdRA68T3QvGHpEUDQJ5jvjvV0vKSfewN
 8umK89IT5NM4GtWLqUf/c360YILr1/o39hjpZhB3zrmvcUEnfIrIYlL6OPX2r8taK6xn
 avtiOLQKWEHIOJQcJQ/ns1x0Lnhh17tNsZxD1K7kveyWEwYR6szm1a7pWPpnJ3J3I/uu
 6ZQ6oRCTojAStm0zeP6w2H4MFtviGuM18tH/hNqtorekDGTya3RZEaC1KSFneGvyD8nm
 iA/CM0wz/mKoQbzOGf7x0o8Ej87d0agG1uTrSBMKzIhwT5OTeDQCJ3b53N4XPsIF3eaR
 f2Cw==
X-Gm-Message-State: ACrzQf3WF6njw8ZqvizqGWm2kTDGW4dGWSAaY5QDfWm8RgD2kqU+6s3e
 gs4yyuIeupDdBkSdf4HDjERaZtwvlKPXSZ+N
X-Google-Smtp-Source: AMsMyM523cfLAOYEDjsZ5iXev1yAAyIePJCQch7QjZ7syaWcCgt25AgYTdA+LqVg6p/Bv2SKcVStYQ==
X-Received: by 2002:a17:90b:1c0a:b0:20a:7393:d8e9 with SMTP id
 oc10-20020a17090b1c0a00b0020a7393d8e9mr49702207pjb.188.1666266809799; 
 Thu, 20 Oct 2022 04:53:29 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 w206-20020a627bd7000000b0056109e15638sm13065464pfc.54.2022.10.20.04.53.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:53:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/31] tcg/arm: Use register pair allocation for qemu_{ld,
 st}_i64
Date: Thu, 20 Oct 2022 21:52:15 +1000
Message-Id: <20221020115242.2301066-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115242.2301066-1-richard.henderson@linaro.org>
References: <20221020115242.2301066-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Although we still can't use ldrd and strd for all operations,
increase the chances by getting the register allocation correct.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target-con-set.h |  7 ++++---
 tcg/arm/tcg-target-con-str.h |  2 ++
 tcg/arm/tcg-target.c.inc     | 28 ++++++++++++++++++----------
 3 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/tcg/arm/tcg-target-con-set.h b/tcg/arm/tcg-target-con-set.h
index 3685e1786a..b8849b2478 100644
--- a/tcg/arm/tcg-target-con-set.h
+++ b/tcg/arm/tcg-target-con-set.h
@@ -15,8 +15,9 @@ C_O0_I2(r, rIN)
 C_O0_I2(s, s)
 C_O0_I2(w, r)
 C_O0_I3(s, s, s)
+C_O0_I3(S, p, s)
 C_O0_I4(r, r, rI, rI)
-C_O0_I4(s, s, s, s)
+C_O0_I4(S, p, s, s)
 C_O1_I1(r, l)
 C_O1_I1(r, r)
 C_O1_I1(w, r)
@@ -38,8 +39,8 @@ C_O1_I2(w, w, wZ)
 C_O1_I3(w, w, w, w)
 C_O1_I4(r, r, r, rI, rI)
 C_O1_I4(r, r, rIN, rIK, 0)
-C_O2_I1(r, r, l)
-C_O2_I2(r, r, l, l)
+C_O2_I1(e, p, l)
+C_O2_I2(e, p, l, l)
 C_O2_I2(r, r, r, r)
 C_O2_I4(r, r, r, r, rIN, rIK)
 C_O2_I4(r, r, rI, rI, rIN, rIK)
diff --git a/tcg/arm/tcg-target-con-str.h b/tcg/arm/tcg-target-con-str.h
index 8f501149e1..24b4b59feb 100644
--- a/tcg/arm/tcg-target-con-str.h
+++ b/tcg/arm/tcg-target-con-str.h
@@ -8,9 +8,11 @@
  * Define constraint letters for register sets:
  * REGS(letter, register_mask)
  */
+REGS('e', ALL_GENERAL_REGS & 0x5555) /* even regs */
 REGS('r', ALL_GENERAL_REGS)
 REGS('l', ALL_QLOAD_REGS)
 REGS('s', ALL_QSTORE_REGS)
+REGS('S', ALL_QSTORE_REGS & 0x5555)  /* even qstore */
 REGS('w', ALL_VECTOR_REGS)
 
 /*
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 2c6c353eea..aa3a888fed 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1686,9 +1686,11 @@ static void tcg_out_qemu_ld_index(TCGContext *s, MemOp opc,
         tcg_out_ld32_r(s, COND_AL, datalo, addrlo, addend);
         break;
     case MO_UQ:
+        /* We used pair allocation for datalo, so already should be aligned. */
+        tcg_debug_assert((datalo & 1) == 0);
+        tcg_debug_assert(datahi == datalo + 1);
         /* LDRD requires alignment; double-check that. */
-        if (get_alignment_bits(opc) >= MO_64
-            && (datalo & 1) == 0 && datahi == datalo + 1) {
+        if (get_alignment_bits(opc) >= MO_64) {
             /*
              * Rm (the second address op) must not overlap Rt or Rt + 1.
              * Since datalo is aligned, we can simplify the test via alignment.
@@ -1742,9 +1744,11 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg datalo,
         tcg_out_ld32_12(s, COND_AL, datalo, addrlo, 0);
         break;
     case MO_UQ:
+        /* We used pair allocation for datalo, so already should be aligned. */
+        tcg_debug_assert((datalo & 1) == 0);
+        tcg_debug_assert(datahi == datalo + 1);
         /* LDRD requires alignment; double-check that. */
-        if (get_alignment_bits(opc) >= MO_64
-            && (datalo & 1) == 0 && datahi == datalo + 1) {
+        if (get_alignment_bits(opc) >= MO_64) {
             tcg_out_ldrd_8(s, COND_AL, datalo, addrlo, 0);
         } else if (datalo == addrlo) {
             tcg_out_ld32_12(s, COND_AL, datahi, addrlo, 4);
@@ -1826,9 +1830,11 @@ static void tcg_out_qemu_st_index(TCGContext *s, ARMCond cond, MemOp opc,
         tcg_out_st32_r(s, cond, datalo, addrlo, addend);
         break;
     case MO_64:
+        /* We used pair allocation for datalo, so already should be aligned. */
+        tcg_debug_assert((datalo & 1) == 0);
+        tcg_debug_assert(datahi == datalo + 1);
         /* STRD requires alignment; double-check that. */
-        if (get_alignment_bits(opc) >= MO_64
-            && (datalo & 1) == 0 && datahi == datalo + 1) {
+        if (get_alignment_bits(opc) >= MO_64) {
             tcg_out_strd_r(s, cond, datalo, addrlo, addend);
         } else if (scratch_addend) {
             tcg_out_st32_rwb(s, cond, datalo, addend, addrlo);
@@ -1863,9 +1869,11 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg datalo,
         tcg_out_st32_12(s, COND_AL, datalo, addrlo, 0);
         break;
     case MO_64:
+        /* We used pair allocation for datalo, so already should be aligned. */
+        tcg_debug_assert((datalo & 1) == 0);
+        tcg_debug_assert(datahi == datalo + 1);
         /* STRD requires alignment; double-check that. */
-        if (get_alignment_bits(opc) >= MO_64
-            && (datalo & 1) == 0 && datahi == datalo + 1) {
+        if (get_alignment_bits(opc) >= MO_64) {
             tcg_out_strd_8(s, COND_AL, datalo, addrlo, 0);
         } else {
             tcg_out_st32_12(s, COND_AL, datalo, addrlo, 0);
@@ -2333,11 +2341,11 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_qemu_ld_i32:
         return TARGET_LONG_BITS == 32 ? C_O1_I1(r, l) : C_O1_I2(r, l, l);
     case INDEX_op_qemu_ld_i64:
-        return TARGET_LONG_BITS == 32 ? C_O2_I1(r, r, l) : C_O2_I2(r, r, l, l);
+        return TARGET_LONG_BITS == 32 ? C_O2_I1(e, p, l) : C_O2_I2(e, p, l, l);
     case INDEX_op_qemu_st_i32:
         return TARGET_LONG_BITS == 32 ? C_O0_I2(s, s) : C_O0_I3(s, s, s);
     case INDEX_op_qemu_st_i64:
-        return TARGET_LONG_BITS == 32 ? C_O0_I3(s, s, s) : C_O0_I4(s, s, s, s);
+        return TARGET_LONG_BITS == 32 ? C_O0_I3(S, p, s) : C_O0_I4(S, p, s, s);
 
     case INDEX_op_st_vec:
         return C_O0_I2(w, r);
-- 
2.34.1


