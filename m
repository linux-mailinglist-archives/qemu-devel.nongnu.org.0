Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C09C63B4CBB
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 07:06:39 +0200 (CEST)
Received: from localhost ([::1]:48738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx0Wc-0006km-NQ
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 01:06:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx0TM-0006ti-Tl
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 01:03:17 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:45968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx0TJ-0008FQ-HO
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 01:03:16 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 z3-20020a17090a3983b029016bc232e40bso6744109pjb.4
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 22:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BbcFUradXh47LTNqrpbiX+7rM/MXo7sQwZti2q7+rTM=;
 b=M+l7amu4/cG0Tv8Kzx2ZHm2wT2YPV4ImcqDuxPwKzOwGFVWBqNfFh0iT+DHrMXYBr0
 UD3JkIiMyq1b62vWatFY69UYrxj9tKrCrHPttGUqQOMNsh5z4A5d6lpxWIkYGuTiSpWT
 iMXAyjbSd/s7zCx5BY4xOf3ghBQOpI92E2m98tk7/Adem3FyGV913XdUgj8Rs9WL9JV5
 uhfeId/1fCcIUkCLIeJ7npFJONGYr3lgqEwu4d1BluvFNMeORc2egF8xDi0edw/YnUQY
 YXSRX9TNMm/ttk3ohZ7TpzaLGc7Nl1CD3YvdVDIZDKB4JZeYU2jF2qlLu4YPXFuoOLx/
 7KRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BbcFUradXh47LTNqrpbiX+7rM/MXo7sQwZti2q7+rTM=;
 b=p8TvGBEo+bJg9p52nEbAdoUoxIcw8KW9juCBJsYhTle9y4DplHjkYJowrn9SLooL8f
 gnvBU/xxDATgf8e6pbgqRveMGp+z0SmRWx7m0PcSumQ0oEJp87jsMP6YKYgQO4QE7uUZ
 ApU7KK9T1hsZI+gmStCkE4UeNJY7U1s4EZH/nKZsMiTQ5boKz6n1u2ZbM5SQcOGJ80z9
 BtMwgA8ECAVx+81iPJ7zwROzEDHSEadDQ7c/+3MOO+Q9ccoPhLXb19vqt6CleMAbl43U
 tV0zjhau+q4Ak990goVqyjmgi3sbtgNTYisPYtn1X6K/AX92zObjFDd9yK3qbX8mK7xt
 +tNg==
X-Gm-Message-State: AOAM533vKZJhT7HM/Car9Vka/z8/VtmirysaqJ5gJEmLCFDTvMuWEaYf
 gun/fmBA04WNXxkBU/6dzEeopUSPgLak5Q==
X-Google-Smtp-Source: ABdhPJzhbe44QtgIYg8JYRP0ki296sEF3U3zrGIVuy8t8gnHNhm34tXFyingrJg9imvGeQ3m97kg4w==
X-Received: by 2002:a17:90a:4890:: with SMTP id
 b16mr24221113pjh.211.1624683792106; 
 Fri, 25 Jun 2021 22:03:12 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id c62sm7389768pfa.12.2021.06.25.22.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 22:03:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/16] tcg/s390x: Implement tcg_out_dup*_vec
Date: Fri, 25 Jun 2021 22:02:58 -0700
Message-Id: <20210626050307.2408505-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210626050307.2408505-1-richard.henderson@linaro.org>
References: <20210626050307.2408505-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
index c4e12a57f3..76216eb5bc 100644
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
@@ -553,6 +560,34 @@ static int RXB(TCGReg v1, TCGReg v2, TCGReg v3, TCGReg v4)
          | ((v4 & 0x10) << (4 + 0));
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
@@ -562,6 +597,17 @@ static void tcg_out_insn_VRRa(TCGContext *s, S390Opcode op,
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
@@ -2469,19 +2515,89 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
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


