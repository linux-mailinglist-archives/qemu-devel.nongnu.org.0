Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D785D40CEE7
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 23:33:30 +0200 (CEST)
Received: from localhost ([::1]:57292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQcX3-0006YE-R1
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 17:33:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQcV5-0003d0-H4
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 17:31:27 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:36615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQcV3-0003JX-Ib
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 17:31:27 -0400
Received: by mail-pf1-x432.google.com with SMTP id m26so3973374pff.3
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 14:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=stWSR7qRo/1NR9SkwqkGeYDwQgSo1q/XXGXGf1fWvmY=;
 b=JtgJvWiKHN/9SZ4cMlbM2NiwPE/iSPyua3O90iVi8MJxD3j8nINW2PZsaI6dNXR6Oa
 N6PFRfUw545egu80IINCeSj71AC9+toGbO6TyBnRyHps8J1ZYDvIOCwgAbqhpEUYmHrC
 iZk+6K1MeSgLX95K5iYAAmeuWib6wg221QvGMVVcURll4a4Hj5Y2NaljE7UoSMOlpN9Q
 2fenyK3BSYPK72CTzpZiwp6pycH/b+NwdFlB3rdYBiK3bKotB3KimKKpnu/WzGkfT1op
 h3ADDNh1nJcO9PZnjMu9T2xYQwggNmCTodh7psn3Fbz+rxCWolrBQZ7ksbAiBM5Lq+xw
 JTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=stWSR7qRo/1NR9SkwqkGeYDwQgSo1q/XXGXGf1fWvmY=;
 b=nS/PpLtXlFTWk9emSwxo0toq4Zm0QUEcG9MUb914knCTrR9Xg8IPT4xAhv3JkuUcrz
 6pyYyHnY/GDlreY78Y7Uq7hhbHg1uYmsAA98A/gkgNaEZKNeC56xt08n5ZtvgJv5YwmS
 mDjymdzWXL6HzgGRDjiqCpc5QdXue+EATfXtvGDzHY3PuMDaqwUr5BKTTOknrc/V5Wpp
 +BGX22cA5RqoUElMjvCPNGEdSqoTlF1MFTpYSFm5dtFkPycRdF59y9vcOsUkfjZ2IsnR
 AtF2+kBQNh+fTYnWLqW+towAYsXPgWE3tPjsDWySfm/gO8JXg4hkBNJ8acKZBgALic2L
 CHxw==
X-Gm-Message-State: AOAM5331MOBWUcenS/o2wIw1TgcqR7v26T4LbMCYJg8DyP4a+tp7oowO
 mvGR4nFACNlFM3LK9WAFkHFMQuqXUMZivw==
X-Google-Smtp-Source: ABdhPJwTct9xaj8wgv9+dqmbMxa4C84ljlV6ci8QYRNneDJMit0g3y1ph1YEVYzseT6k5izWaVHiAg==
X-Received: by 2002:aa7:8088:0:b029:3c1:1672:2f25 with SMTP id
 v8-20020aa780880000b02903c116722f25mr1734894pff.22.1631741484016; 
 Wed, 15 Sep 2021 14:31:24 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q20sm837879pgu.31.2021.09.15.14.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 14:31:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 08/16] tcg/s390x: Implement tcg_out_dup*_vec
Date: Wed, 15 Sep 2021 14:31:06 -0700
Message-Id: <20210915213114.1923776-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210915213114.1923776-1-richard.henderson@linaro.org>
References: <20210915213114.1923776-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 122 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 119 insertions(+), 3 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 76061bfd80..b9de4dc821 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -265,13 +265,20 @@ typedef enum S390Opcode {
     RX_STC      = 0x42,
     RX_STH      = 0x40,
 
+    VRIa_VGBM   = 0xe744,
+    VRIa_VREPI  = 0xe745,
+    VRIb_VGM    = 0xe746,
+    VRIc_VREP   = 0xe74d,
+
     VRRa_VLR    = 0xe756,
+    VRRf_VLVGP  = 0xe762,
 
     VRSb_VLVG   = 0xe722,
     VRSc_VLGV   = 0xe721,
 
     VRX_VL      = 0xe706,
     VRX_VLLEZ   = 0xe704,
+    VRX_VLREP   = 0xe705,
     VRX_VST     = 0xe70e,
     VRX_VSTEF   = 0xe70b,
     VRX_VSTEG   = 0xe70a,
@@ -563,6 +570,34 @@ static int RXB(TCGReg v1, TCGReg v2, TCGReg v3, TCGReg v4)
          | ((v4 & 0x10) << (4 + 0));
 }
 
+static void tcg_out_insn_VRIa(TCGContext *s, S390Opcode op,
+                              TCGReg v1, uint16_t i2, int m3)
+{
+    tcg_debug_assert(is_vector_reg(v1));
+    tcg_out16(s, (op & 0xff00) | ((v1 & 0xf) << 4));
+    tcg_out16(s, i2);
+    tcg_out16(s, (op & 0x00ff) | RXB(v1, 0, 0, 0) | (m3 << 12));
+}
+
+static void tcg_out_insn_VRIb(TCGContext *s, S390Opcode op,
+                              TCGReg v1, uint8_t i2, uint8_t i3, int m4)
+{
+    tcg_debug_assert(is_vector_reg(v1));
+    tcg_out16(s, (op & 0xff00) | ((v1 & 0xf) << 4));
+    tcg_out16(s, (i2 << 8) | (i3 & 0xff));
+    tcg_out16(s, (op & 0x00ff) | RXB(v1, 0, 0, 0) | (m4 << 12));
+}
+
+static void tcg_out_insn_VRIc(TCGContext *s, S390Opcode op,
+                              TCGReg v1, uint16_t i2, TCGReg v3, int m4)
+{
+    tcg_debug_assert(is_vector_reg(v1));
+    tcg_debug_assert(is_vector_reg(v3));
+    tcg_out16(s, (op & 0xff00) | ((v1 & 0xf) << 4) | (v3 & 0xf));
+    tcg_out16(s, i2);
+    tcg_out16(s, (op & 0x00ff) | RXB(v1, 0, v3, 0) | (m4 << 12));
+}
+
 static void tcg_out_insn_VRRa(TCGContext *s, S390Opcode op,
                               TCGReg v1, TCGReg v2, int m3)
 {
@@ -572,6 +607,17 @@ static void tcg_out_insn_VRRa(TCGContext *s, S390Opcode op,
     tcg_out32(s, (op & 0x00ff) | RXB(v1, v2, 0, 0) | (m3 << 12));
 }
 
+static void tcg_out_insn_VRRf(TCGContext *s, S390Opcode op,
+                              TCGReg v1, TCGReg r2, TCGReg r3)
+{
+    tcg_debug_assert(is_vector_reg(v1));
+    tcg_debug_assert(is_general_reg(r2));
+    tcg_debug_assert(is_general_reg(r3));
+    tcg_out16(s, (op & 0xff00) | ((v1 & 0xf) << 4) | r2);
+    tcg_out16(s, r3 << 12);
+    tcg_out16(s, (op & 0x00ff) | RXB(v1, 0, 0, 0));
+}
+
 static void tcg_out_insn_VRSb(TCGContext *s, S390Opcode op, TCGReg v1,
                               intptr_t d2, TCGReg b2, TCGReg r3, int m4)
 {
@@ -2501,19 +2547,89 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
 static bool tcg_out_dup_vec(TCGContext *s, TCGType type, unsigned vece,
                             TCGReg dst, TCGReg src)
 {
-    g_assert_not_reached();
+    if (is_general_reg(src)) {
+        /* Replicate general register into two MO_64. */
+        tcg_out_insn(s, VRRf, VLVGP, dst, src, src);
+        if (vece == MO_64) {
+            return true;
+        }
+    }
+
+    /*
+     * Recall that the "standard" integer, within a vector, is the
+     * rightmost element of the leftmost doubleword, a-la VLLEZ.
+     */
+    tcg_out_insn(s, VRIc, VREP, dst, (8 >> vece) - 1, src, vece);
+    return true;
 }
 
 static bool tcg_out_dupm_vec(TCGContext *s, TCGType type, unsigned vece,
                              TCGReg dst, TCGReg base, intptr_t offset)
 {
-    g_assert_not_reached();
+    tcg_out_vrx_mem(s, VRX_VLREP, dst, base, TCG_REG_NONE, offset, vece);
+    return true;
 }
 
 static void tcg_out_dupi_vec(TCGContext *s, TCGType type, unsigned vece,
                              TCGReg dst, int64_t val)
 {
-    g_assert_not_reached();
+    int i, mask, msb, lsb;
+
+    /* Look for int16_t elements.  */
+    if (vece <= MO_16 ||
+        (vece == MO_32 ? (int32_t)val : val) == (int16_t)val) {
+        tcg_out_insn(s, VRIa, VREPI, dst, val, vece);
+        return;
+    }
+
+    /* Look for bit masks.  */
+    if (vece == MO_32) {
+        if (risbg_mask((int32_t)val)) {
+            /* Handle wraparound by swapping msb and lsb.  */
+            if ((val & 0x80000001u) == 0x80000001u) {
+                msb = 32 - ctz32(~val);
+                lsb = clz32(~val) - 1;
+            } else {
+                msb = clz32(val);
+                lsb = 31 - ctz32(val);
+            }
+            tcg_out_insn(s, VRIb, VGM, dst, lsb, msb, MO_32);
+            return;
+        }
+    } else {
+        if (risbg_mask(val)) {
+            /* Handle wraparound by swapping msb and lsb.  */
+            if ((val & 0x8000000000000001ull) == 0x8000000000000001ull) {
+                /* Handle wraparound by swapping msb and lsb.  */
+                msb = 64 - ctz64(~val);
+                lsb = clz64(~val) - 1;
+            } else {
+                msb = clz64(val);
+                lsb = 63 - ctz64(val);
+            }
+            tcg_out_insn(s, VRIb, VGM, dst, lsb, msb, MO_64);
+            return;
+        }
+    }
+
+    /* Look for all bytes 0x00 or 0xff.  */
+    for (i = mask = 0; i < 8; i++) {
+        uint8_t byte = val >> (i * 8);
+        if (byte == 0xff) {
+            mask |= 1 << i;
+        } else if (byte != 0) {
+            break;
+        }
+    }
+    if (i == 8) {
+        tcg_out_insn(s, VRIa, VGBM, dst, mask * 0x0101, 0);
+        return;
+    }
+
+    /* Otherwise, stuff it in the constant pool.  */
+    tcg_out_insn(s, RIL, LARL, TCG_TMP0, 0);
+    new_pool_label(s, val, R_390_PC32DBL, s->code_ptr - 2, 2);
+    tcg_out_insn(s, VRX, VLREP, dst, TCG_TMP0, TCG_REG_NONE, 0, MO_64);
 }
 
 static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
-- 
2.25.1


