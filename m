Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D81A8607168
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 09:49:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmmB-0008Or-SV
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:49:07 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmH2-00037i-BD
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:16:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmGo-0002x2-FE
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:16:45 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmGm-0005d3-F0
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:16:42 -0400
Received: by mail-pj1-x102e.google.com with SMTP id ez6so1688923pjb.1
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pcFc6BCiy8AgtsELn4bI9AGbxpo/4pmRIjtL3WupDdQ=;
 b=d7uxq0v7iEmNumcYcjP/cIDwcGioQIiqwKLIe2rltU/x/PIgShfXztkffaalOn/zJ5
 K187OOIDYwKeKTnBxRPsu8G/sbgZ/KB27Q2p6FZd8G55prSGtXliBJ3qcKlURp5hjzD0
 LKhM81wLnNx63M5xIJ5l3Qa5XZZxmdAuGjFmHfejlDKrKPVjd4KUgkdswwZyu41LVRus
 2XMmSsGsVHDZjHEbu52BlFcIQcHWNzQ8X29BmiHCfJSFjGq0cpdxoytJOTErMojMPhBe
 bcS7pfP41PdNA9mOc60zt6POMZ7ek+Yt/Sa+5Y0Dux6uaa80DKDZAuymVTbL5QlC8eVb
 r+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pcFc6BCiy8AgtsELn4bI9AGbxpo/4pmRIjtL3WupDdQ=;
 b=HMzydYpg/2G3H6R0cCPeFCk2F7TZolf5TbJs2eErFKCohixXWq4BCRHCJEVV9ZQpbv
 82cFUTP4rBDzAMZDXoQhmqiO4GQvm3/spopYSPC7xLbMdQlFaZ8sBVIMq/bxfsgYLvxc
 6TNrDWszDyHoFHo2JVMmxEcNTA8K0gM6HjZX7oUOyfOrU05AwaCjCcqmDENoqFHntBv8
 thcznycILzf6PUoMJjTD/BseDuiT7nt3q/VhX5+nuctasXcnqprcuKEXIkefHZSeJaEv
 BdjlV/Id/oAzOs8xBjnyyTyImB9m9NT8ESR9i3SYrqrh4pQXyWefG3tOEcg06FEGPyE3
 g27A==
X-Gm-Message-State: ACrzQf32FkpncXTMOrkOjQQsoEq/qBF25rV+aMwB5yFzCkNhkU5iVBcG
 EjORq8npL2doIL+mNDi5REtuQnuTreunTp76
X-Google-Smtp-Source: AMsMyM7utyYVycrM+Fjq32Z/nCwkOByUH8lwHJ4x8U3K7dqQJHP7rcdcTSnknE5JdzzHxZIN/Af7ow==
X-Received: by 2002:a17:90b:3141:b0:20d:1690:d3d2 with SMTP id
 ip1-20020a17090b314100b0020d1690d3d2mr57013105pjb.230.1666336599061; 
 Fri, 21 Oct 2022 00:16:39 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a638c49000000b0041cd5ddde6fsm13003327pgn.76.2022.10.21.00.16.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:16:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/36] tcg/arm: Use register pair allocation for qemu_{ld,
 st}_i64
Date: Fri, 21 Oct 2022 17:15:18 +1000
Message-Id: <20221021071549.2398137-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021071549.2398137-1-richard.henderson@linaro.org>
References: <20221021071549.2398137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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


