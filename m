Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 430B8678DE0
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 03:06:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK8gZ-0008Nc-RZ; Mon, 23 Jan 2023 21:05:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK8gX-0008NM-2u
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 21:05:17 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK8gV-0003mP-98
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 21:05:16 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 u1-20020a17090a450100b0022936a63a21so17062125pjg.4
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 18:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aZuwAJqzP7Egb7aI8Buoh7A0UjJ62m3w+Hid4HWJcXg=;
 b=J1r6zS48hsSBZEnMRIYUBjIm4Jo4mEFqZW/cElMYC9vuHc5Et93JKACBBnhSLWeFIl
 mT6uJd/N9fudNbBxwt7DT81L0bWZUaB25YHwlP/YnPNzKVul6uLdQsuT1gOs0+XgCiIn
 TjMZFw5Kqu45wAVfm7gj7VzvWAW6SR3+xf8ag7TDMPEislr1/MCSqmsO+CatWmF00tf9
 ZtpDTF8gbSmm3u6UWTCwloZ8p1im+OA2DTP6vJQn7ZBFtGsLUCGGS1sNZy/RuZdDcX1B
 nJw7oHxlJBGP5vPb8qSSr63uDjgwFTPDz3Xd3LBPgthp3XNbdcV+Eaze4X9bbq2HI2p6
 K6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aZuwAJqzP7Egb7aI8Buoh7A0UjJ62m3w+Hid4HWJcXg=;
 b=MJTW37OWD67BP6tKTRsTDlrDywvkbLswcKASG34rbT5kYbepLZy5tshr+Kw9v8aRcQ
 rbTkgkq4q53IgmSyACHPdPHJhu9ocmcuKFibmWNkTJgNhkp1wu7bJjP3KZNq2dB13fVF
 mg6hxBWSD3VrhxW7M9KQPx22iCvtrxrUej/0zAeTwts0FMQRruJmDXIIbpi56HV5hMKj
 YjjoURNTz/lfF8gjJl2sFIaVi9dZ1uwitFsqN+IVPeK3F0tF4Gq85Je3NWQXT66ei7qa
 fZhMdf927k4ObwRLIdk7r/IInsVIampKSSEhlVNyFwumtckK+RD54BR93Sty+kDYA4c4
 8WEw==
X-Gm-Message-State: AFqh2kotyOL/aF538qn8rULKI5kUIKrJdrmGjrzC562HlkD8OW1ma4Z5
 3TKsRpe/OtmbtM2/4kgRc32ugO6YS1aQ8G/z
X-Google-Smtp-Source: AMrXdXvYC9LA5E8PHdw/Tp6dMtn23DLTHyH3VPtJW6JETGzaL0PKeFbwTEohWX4hTxPBc8dY2SC2aA==
X-Received: by 2002:a17:90a:1a5c:b0:22b:b76b:5043 with SMTP id
 28-20020a17090a1a5c00b0022bb76b5043mr13466244pjl.9.1674525913762; 
 Mon, 23 Jan 2023 18:05:13 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 fh3-20020a17090b034300b00228e56d375asm283936pjb.33.2023.01.23.18.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 18:05:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL v2 02/15] tcg/arm: Use register pair allocation for qemu_{ld,
 st}_i64
Date: Mon, 23 Jan 2023 16:04:54 -1000
Message-Id: <20230124020507.3732200-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124020507.3732200-1-richard.henderson@linaro.org>
References: <20230124020507.3732200-1-richard.henderson@linaro.org>
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
index 6abe94137e..0f5f9f4925 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1694,9 +1694,11 @@ static void tcg_out_qemu_ld_index(TCGContext *s, MemOp opc,
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
@@ -1750,9 +1752,11 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg datalo,
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
@@ -1834,9 +1838,11 @@ static void tcg_out_qemu_st_index(TCGContext *s, ARMCond cond, MemOp opc,
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
@@ -1871,9 +1877,11 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg datalo,
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
@@ -2372,11 +2380,11 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
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


