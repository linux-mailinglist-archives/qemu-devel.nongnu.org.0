Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD38762554D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 09:30:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOfR-00066j-Oj; Fri, 11 Nov 2022 02:41:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOfE-00065Y-1F
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:41:24 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOfB-0007Xu-Ui
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:41:23 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 r61-20020a17090a43c300b00212f4e9cccdso7064776pjg.5
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 23:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pcFc6BCiy8AgtsELn4bI9AGbxpo/4pmRIjtL3WupDdQ=;
 b=go6U+Gswa9viHTMLfQh5JdMuhK/mjOcYhcNcKcIufcThq4kupDvt0rKCTFdnDr9WQs
 yCDwh82tUBA+vkBCI1cr5KCb8s78d8YVSPcU9vJIUylKA45s/y0pRcz+k3cAdspwBwhw
 bSqcTp3qdaeAd3tzZYUYm3Y6FrnSlNUbreB4K66NG389If5Bo/sLJbRkJcR5scydFv9N
 qWlMHwNQ06aG2SCicEwtxx0a0ru/BmAMe/wCd/D1jhRefyC5nr3fpbar07bD3E+4s5A5
 ljkWsAq1YQvj29ykI63Msn6bxn1Z51Ag2p4DFh2Vr8+7hKzShmvbGVXfhKl0YtlEQyWh
 oeVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pcFc6BCiy8AgtsELn4bI9AGbxpo/4pmRIjtL3WupDdQ=;
 b=1ectagL+2HTmIw9bcH8zTGZ7u1MhPpY9kzkDz9z3z7xt012+Q0+IW76CG+UFUWQ0X3
 Err0Uw1rGqPjH6VlcPlOYj1HPHl+W+frmE23QJ098iPo3X7Dc80kbbGG/7eVvQHhGwxp
 Kd4S2BrDYzksoY6Lb+8aNgck31ekG6CTr3NCk1GokWnot9yZI7Z8L+Z9zg2YO/J2UvzG
 2XPYPKdafAB8vJpkDDaEl08ggXL0hSfqMy+FgUoCQzYeGMUQaDevGMbbUzlYDE0EGsPd
 SByybwAmJ8++WI6nmkMNUlGmB+iYdnl71JPVkeV7V4PPuJopT8qpyqgcPgHIwkdvrX4c
 4IzA==
X-Gm-Message-State: ANoB5pmUugy0cGLkiEd1D+WCKhMav0CiuCUlyiOQangVGLcUJ0hB/UGS
 LIVC+ErnxXqRGTUBbZkDKmnqXDVSw3z2Oeb3
X-Google-Smtp-Source: AA0mqf6bKC4LA/4ZAWbi1ojS4n6Uyl6nTCnlZr1KjAuo4GA7P8N3ICVJ/SmHHHOtHQeR5j7KbQK8Lw==
X-Received: by 2002:a17:902:e395:b0:17f:809b:7f85 with SMTP id
 g21-20020a170902e39500b0017f809b7f85mr1468880ple.21.1668152479447; 
 Thu, 10 Nov 2022 23:41:19 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b001754fa42065sm976069plg.143.2022.11.10.23.41.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 23:41:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 v3 05/45] tcg/arm: Use register pair allocation for
 qemu_{ld, st}_i64
Date: Fri, 11 Nov 2022 17:40:21 +1000
Message-Id: <20221111074101.2069454-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111074101.2069454-1-richard.henderson@linaro.org>
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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


