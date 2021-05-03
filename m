Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4455E371FD6
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 20:43:35 +0200 (CEST)
Received: from localhost ([::1]:42688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lddXa-0006ID-Au
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 14:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lddQE-0005nE-Qq
 for qemu-devel@nongnu.org; Mon, 03 May 2021 14:35:58 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:43690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lddQ6-0008GP-DE
 for qemu-devel@nongnu.org; Mon, 03 May 2021 14:35:58 -0400
Received: by mail-pf1-x42d.google.com with SMTP id e15so4808048pfv.10
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 11:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EAmpl9tZ1TjXkOGMsr1vBw+4Q9UTTCPOO+VZt9ciAAE=;
 b=FiNYW7sPzfXvo49Cl/5sVD12pRlyu2l4CLLQCqLcPNx4fcmHhc46UojJ7rKueDiqtV
 Gq6qJwGa4VaumhTXb+pDtnX6YY2ezx7ZihEcIsRhd7qECzRCOFcApyx/lcFT1YICvObQ
 g9w4Z7FMj1iQtichmgLmppXQQGwv5Z0cDvYSd7G2bAHF16zswHEa29gKxC4hnLopwpOq
 sWs38N498MJBVMsWnnJCge/HvEkyRH5RSDb119Er0TwXnNPfwH45khCq4hkl5LuhwWCq
 r9oAWU/dBh4ju8vb7zSMRT96SmsVG3r4eDOfQwbS7IPLm/p6Wduec5LoIgTkIzfPUx1/
 TwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EAmpl9tZ1TjXkOGMsr1vBw+4Q9UTTCPOO+VZt9ciAAE=;
 b=JpSmRDwfHirpO76zc4XXgKrnwwj+nMrxcIxb8z0jSvXiS1am5Y8/veogGjogyJvmUs
 w1MujjE25MwIUHJINL5L5NHEKXuTdhdJq1DtJuZCtAdr87MDmcWb78tCR6sJy8F94Afh
 spoDGmE6z/5sBYhqfO6jzQvpwXKXwRxP/PCXg2y5o+AHzeKRt/XFRoVeUvGbwoC2z7DH
 TZovQS/DsVydogIN/tVbGT64mwf2zQnJq79mWk97jP5+RRvPSOE9WwbvEhpXkc+GL6IX
 zNNJdXjxETivAqjFoK7EyljC3zgNUVmYQOkr+ntb/x336jdQAO8msUZSUSyKtEIFB+To
 F5CA==
X-Gm-Message-State: AOAM531LhgyW0aTaNOl1uEnEl+eVNN4ZBgF2nSMiqwTb8Kk9x6F1iQA4
 dKPe8A1fpCNKpAzx2SdECFPgI0BROu0dng==
X-Google-Smtp-Source: ABdhPJz9YHefXMXHeBP9+mxxoEaBG3FplCKHlJRYecQALOueusnQe6sjP9O1t7GtX4L5hRr91T1eMQ==
X-Received: by 2002:a63:490a:: with SMTP id w10mr6158453pga.286.1620066947326; 
 Mon, 03 May 2021 11:35:47 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q27sm4251567pfl.41.2021.05.03.11.35.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 11:35:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/16] tcg/s390x: Implement tcg_out_dup*_vec
Date: Mon,  3 May 2021 11:35:32 -0700
Message-Id: <20210503183541.2014496-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210503183541.2014496-1-richard.henderson@linaro.org>
References: <20210503183541.2014496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Cc: thuth@redhat.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 122 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 119 insertions(+), 3 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 439ab5a359..ff28d84f95 100644
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
@@ -551,6 +558,34 @@ static int RXB(TCGReg v1, TCGReg v2, TCGReg v3, TCGReg v4)
          | ((v4 & 16) << (4 - 3));
 }
 
+static void tcg_out_insn_VRIa(TCGContext *s, S390Opcode op,
+                              TCGReg v1, uint16_t i2, int m3)
+{
+    tcg_debug_assert(v1 >= TCG_REG_V0 && v1 <= TCG_REG_V31);
+    tcg_out16(s, (op & 0xff00) | ((v1 & 15) << 4));
+    tcg_out16(s, i2);
+    tcg_out16(s, (op & 0x00ff) | RXB(v1, 0, 0, 0) | (m3 << 12));
+}
+
+static void tcg_out_insn_VRIb(TCGContext *s, S390Opcode op,
+                              TCGReg v1, uint8_t i2, uint8_t i3, int m4)
+{
+    tcg_debug_assert(v1 >= TCG_REG_V0 && v1 <= TCG_REG_V31);
+    tcg_out16(s, (op & 0xff00) | ((v1 & 15) << 4));
+    tcg_out16(s, (i2 << 8) | (i3 & 0xff));
+    tcg_out16(s, (op & 0x00ff) | RXB(v1, 0, 0, 0) | (m4 << 12));
+}
+
+static void tcg_out_insn_VRIc(TCGContext *s, S390Opcode op,
+                              TCGReg v1, uint16_t i2, TCGReg v3, int m4)
+{
+    tcg_debug_assert(v1 >= TCG_REG_V0 && v1 <= TCG_REG_V31);
+    tcg_debug_assert(v3 >= TCG_REG_V0 && v3 <= TCG_REG_V31);
+    tcg_out16(s, (op & 0xff00) | ((v1 & 15) << 4) | (v3 & 15));
+    tcg_out16(s, i2);
+    tcg_out16(s, (op & 0x00ff) | RXB(v1, 0, v3, 0) | (m4 << 12));
+}
+
 static void tcg_out_insn_VRRa(TCGContext *s, S390Opcode op,
                               TCGReg v1, TCGReg v2, int m3)
 {
@@ -560,6 +595,17 @@ static void tcg_out_insn_VRRa(TCGContext *s, S390Opcode op,
     tcg_out32(s, (op & 0x00ff) | RXB(v1, v2, 0, 0) | (m3 << 12));
 }
 
+static void tcg_out_insn_VRRf(TCGContext *s, S390Opcode op,
+                              TCGReg v1, TCGReg r2, TCGReg r3)
+{
+    tcg_debug_assert(v1 >= TCG_REG_V0 && v1 <= TCG_REG_V31);
+    tcg_debug_assert(r2 <= TCG_REG_R15);
+    tcg_debug_assert(r3 <= TCG_REG_R15);
+    tcg_out16(s, (op & 0xff00) | ((v1 & 15) << 4) | r2);
+    tcg_out16(s, r3 << 12);
+    tcg_out16(s, (op & 0x00ff) | RXB(v1, 0, 0, 0));
+}
+
 static void tcg_out_insn_VRSb(TCGContext *s, S390Opcode op, TCGReg v1,
                               intptr_t d2, TCGReg b2, TCGReg r3, int m4)
 {
@@ -2467,19 +2513,89 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
 static bool tcg_out_dup_vec(TCGContext *s, TCGType type, unsigned vece,
                             TCGReg dst, TCGReg src)
 {
-    g_assert_not_reached();
+    if (src < 16) {
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


