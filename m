Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B31E630EA19
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:22:44 +0100 (CET)
Received: from localhost ([::1]:43694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7UI7-0004gA-PO
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:22:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tj7-0005LA-KK
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:34 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:40255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tis-0003vo-U0
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:33 -0500
Received: by mail-pj1-x102f.google.com with SMTP id z9so817703pjl.5
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rPMFB2Q7bqmshseEZXdi4DH7vz7QmPfw5K/IzP922xY=;
 b=fnsTU3vlxjWSLIbztOkICaZPN3fThTs6i6j+MDQlHxNb8A/vSpRTqQWoNN+TGuN96q
 nYVCv6ofxi6o4Ce4tyJ5s4fMJxM3l+3ks4utECwcrlrgNmXSp/PXNwvKpcI8LCcM0+UT
 jplLWDZDtQQr7POlxL7r1CMRufZMBcpIfX/7Uf3q4N7qL2s0i3tIy+WAy5y3Gn41kryV
 BMtRhGNFdbow9nqcu0vWi4JIJ8VSZKsmnAwSiYgtzjXAqOIuhGRlnGU8bYIeQzp62sAd
 n5cNghADkCMEFZ9Mahdc74DNdKjTHJVIqBzlUshKF3r8roHOTK3A54I1VLl6Ah0m7/A0
 rzkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rPMFB2Q7bqmshseEZXdi4DH7vz7QmPfw5K/IzP922xY=;
 b=j7P2tc+ev4+Wc5mgVGRD4w5er74FkNwYzuZaYe8Yy6NJXbDN/FLD7XQQaQPIFN4+td
 rPP4XMSOspKZ9WPzcTu3jMMjWAAyshGhx+U1QVmd09cCwbKVEuC5Xcu0qqrrKCLOAgpq
 iUiMAkdLqX5bm2M4OaYyTM1RmcCPf7Z+DFIhDiRBbyUBJzPGp6OSc7Q16/hSCKA2+I6t
 RU7MCyVgiy0GEg3GfEFnrjCBKEpbQWzbY1CkkyOQdUKxScdiTYZClh9Fp7+t1WnHCkUL
 YJLHEjUXsQSMEC8MqtwizCW3Qo0I9D19G5wW4VwaOixC7HXVzwVPR827LtVDVfPDeDFy
 /ddA==
X-Gm-Message-State: AOAM533ZBWVHC50XJiVleiP4XUEdTOAXc0pzXHspvKQKHgT9wUEDsu/G
 tL//ayLRm4T50iZhTshIpbsEvfHvbxlz0/Po
X-Google-Smtp-Source: ABdhPJzFyInoelaPqEi6eKesf/DbTJvzPcOqQIi+GS9ICjplhDelm4W3mgADRKjFlxo1WtCVV07CQA==
X-Received: by 2002:a17:90a:1503:: with SMTP id
 l3mr5776066pja.41.1612403177531; 
 Wed, 03 Feb 2021 17:46:17 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:46:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 36/93] tcg/tci: Reduce use of tci_read_r64
Date: Wed,  3 Feb 2021 15:44:12 -1000
Message-Id: <20210204014509.882821-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

In all cases restricted to 64-bit hosts, tcg_read_r is
identical.  We retain the 64-bit symbol for the single
case of INDEX_op_qemu_st_i64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 93 +++++++++++++++++++++++++------------------------------
 1 file changed, 42 insertions(+), 51 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 9c8395397a..0246e663a3 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -57,13 +57,6 @@ static tcg_target_ulong tci_read_reg(const tcg_target_ulong *regs, TCGReg index)
     return regs[index];
 }
 
-#if TCG_TARGET_REG_BITS == 64
-static uint64_t tci_read_reg64(const tcg_target_ulong *regs, TCGReg index)
-{
-    return tci_read_reg(regs, index);
-}
-#endif
-
 static void
 tci_write_reg(tcg_target_ulong *regs, TCGReg index, tcg_target_ulong value)
 {
@@ -146,9 +139,7 @@ static uint64_t tci_read_r64(const tcg_target_ulong *regs,
 static uint64_t tci_read_r64(const tcg_target_ulong *regs,
                              const uint8_t **tb_ptr)
 {
-    uint64_t value = tci_read_reg64(regs, **tb_ptr);
-    *tb_ptr += 1;
-    return value;
+    return tci_read_r(regs, tb_ptr);
 }
 #endif
 
@@ -407,8 +398,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #elif TCG_TARGET_REG_BITS == 64
         case INDEX_op_setcond_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             condition = *tb_ptr++;
             tci_write_reg(regs, t0, tci_compare64(t1, t2, condition));
             break;
@@ -689,7 +680,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_REG_BITS == 64
         case INDEX_op_mov_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1);
             break;
         case INDEX_op_tci_movi_i64:
@@ -713,7 +704,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg(regs, t0, *(uint64_t *)(t1 + t2));
             break;
         case INDEX_op_st_i64:
-            t0 = tci_read_r64(regs, &tb_ptr);
+            t0 = tci_read_r(regs, &tb_ptr);
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
             *(uint64_t *)(t1 + t2) = t0;
@@ -723,62 +714,62 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         case INDEX_op_add_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 + t2);
             break;
         case INDEX_op_sub_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 - t2);
             break;
         case INDEX_op_mul_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 * t2);
             break;
         case INDEX_op_div_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (int64_t)t1 / (int64_t)t2);
             break;
         case INDEX_op_divu_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (uint64_t)t1 / (uint64_t)t2);
             break;
         case INDEX_op_rem_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (int64_t)t1 % (int64_t)t2);
             break;
         case INDEX_op_remu_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (uint64_t)t1 % (uint64_t)t2);
             break;
         case INDEX_op_and_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 & t2);
             break;
         case INDEX_op_or_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 | t2);
             break;
         case INDEX_op_xor_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 ^ t2);
             break;
 
@@ -786,41 +777,41 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         case INDEX_op_shl_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 << (t2 & 63));
             break;
         case INDEX_op_shr_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 >> (t2 & 63));
             break;
         case INDEX_op_sar_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, ((int64_t)t1 >> (t2 & 63)));
             break;
 #if TCG_TARGET_HAS_rot_i64
         case INDEX_op_rotl_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, rol64(t1, t2 & 63));
             break;
         case INDEX_op_rotr_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, ror64(t1, t2 & 63));
             break;
 #endif
 #if TCG_TARGET_HAS_deposit_i64
         case INDEX_op_deposit_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
             tmp16 = *tb_ptr++;
             tmp8 = *tb_ptr++;
             tmp64 = (((1ULL << tmp8) - 1) << tmp16);
@@ -828,8 +819,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
 #endif
         case INDEX_op_brcond_i64:
-            t0 = tci_read_r64(regs, &tb_ptr);
-            t1 = tci_read_r64(regs, &tb_ptr);
+            t0 = tci_read_r(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
             condition = *tb_ptr++;
             label = tci_read_label(&tb_ptr);
             if (tci_compare64(t0, t1, condition)) {
@@ -899,21 +890,21 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_HAS_bswap64_i64
         case INDEX_op_bswap64_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, bswap64(t1));
             break;
 #endif
 #if TCG_TARGET_HAS_not_i64
         case INDEX_op_not_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, ~t1);
             break;
 #endif
 #if TCG_TARGET_HAS_neg_i64
         case INDEX_op_neg_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r64(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, -t1);
             break;
 #endif
-- 
2.25.1


