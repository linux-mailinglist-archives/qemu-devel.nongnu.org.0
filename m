Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2953660B40
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 02:08:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDxfY-0003qo-6v; Fri, 06 Jan 2023 20:06:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDxfW-0003qR-Gz
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 20:06:42 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDxfU-0002wP-H4
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 20:06:42 -0500
Received: by mail-pl1-x62a.google.com with SMTP id jn22so3455662plb.13
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 17:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=suHoxdhRQBaNRGQnMNu6zOYCu10KNe3AY1Hr24Mk9vY=;
 b=OQbduGNOYI0Q39yVeO0fx3uDvKTU1DTQSGVG8EyFYnMIUKlqAELk7yRmrIFxi+TqWh
 WcGXiJhJP7Wy9NJIh9XbjALjVYVoxFQcQjjZKYzY0fbNxjCx+CIOn3b5WHO770z79xbd
 jY5NRI2BiwVWK3zgiLUZCz8IxAMmOVMvLpz+I8s976gMBnZO1OXYOrwit4oq2LiwTcO9
 cCM74dBkNEIwEH/GN2TNqKT7x708d/cWTEymnd9AjTUE2Hkb57yhjYxxPBhV0J+lPKMn
 HFZ82ZNdAUOXv5RojeGrVvYrFTVtTeE2ZCMecvZDTV+Fc6DYXHWbzBrZAyZWeDu/HEPy
 aRgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=suHoxdhRQBaNRGQnMNu6zOYCu10KNe3AY1Hr24Mk9vY=;
 b=Tj3MkxcLcOOLdLtbkGyAhqHCA8sB0TjkGnIh6KOpChMQS0r6u4sGQUaSFhDAPZ9FVO
 02YHvvb2zjz7/00uDVWtZeo7cZyopL99j39tIDEyb9zKnr9Z58dg24exafEXnQA+hwMd
 1PQ0oRQFMqefm++WyeJvBNTAPYk9eghYniTu3JkUHHNBhatu475WVf2xcVGUjXpvnpi4
 hcvnQPMjJN70xHojNGn7SMbPhc6B+qr8YVFBTgBbL0WTvk9oWqKqY8fj/al+ZdetnXEN
 3GOa1QONtqM5ECiXWmwBEaGupm7il78rqm9ug4PTGyx64pEp48yaRn71xHbsCSp4KdJH
 hMMg==
X-Gm-Message-State: AFqh2koZ25humvJwHu5zLo1lzQ4lKcDORLHOkfb+NJCNIIA4XmWV9Gui
 Kc+zwmzAGix/34s4H6LAyfl0wzvBLaaroLXa
X-Google-Smtp-Source: AMrXdXt21Rv053p6PHsN+J999omIjpJdnAw6bS3i9bOvwLgei4AUtLOSvkcUPupelJT/ktmY8+sH/w==
X-Received: by 2002:a05:6a20:47c6:b0:b0:1e9b:e930 with SMTP id
 ey6-20020a056a2047c600b000b01e9be930mr61635770pzb.57.1673053598663; 
 Fri, 06 Jan 2023 17:06:38 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a654c89000000b004a281fb63c3sm1404360pgt.87.2023.01.06.17.06.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 17:06:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4] tcg/arm: Use register pair allocation for qemu_{ld, st}_i64
Date: Fri,  6 Jan 2023 17:06:37 -0800
Message-Id: <20230107010637.1285036-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Although we still can't use ldrd and strd for all operations,
increase the chances by getting the register allocation correct.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

v3 was patch 5 in a larger patch set:

  https://lore.kernel.org/qemu-devel/20221111074101.2069454-6-richard.henderson@linaro.org/

most of which has been merged.

r~

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
index 9245ea86d0..e82749a602 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1692,9 +1692,11 @@ static void tcg_out_qemu_ld_index(TCGContext *s, MemOp opc,
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
@@ -1748,9 +1750,11 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg datalo,
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
@@ -1832,9 +1836,11 @@ static void tcg_out_qemu_st_index(TCGContext *s, ARMCond cond, MemOp opc,
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
@@ -1869,9 +1875,11 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg datalo,
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
@@ -2339,11 +2347,11 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
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


