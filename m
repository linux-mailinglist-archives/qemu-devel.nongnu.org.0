Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 472FD424189
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 17:43:53 +0200 (CEST)
Received: from localhost ([::1]:54758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY95D-0008Li-Rr
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 11:43:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8j5-0002do-Oo
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:21:00 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:41870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8ip-0007rw-0o
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:20:59 -0400
Received: by mail-pg1-x530.google.com with SMTP id v11so2748760pgb.8
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 08:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jDEFrOuF5vzpvLt/BuSnZw7aY6SBxJIsD/hC5MysJfc=;
 b=jPXh3vA/2y8ZFfvws5q/V/TVfH73DRD/4xBU6gGniVyjlt6Tm2ReDsl5PjrRGVWn0L
 LUp9tVsZJiEVNefIhnjHhorUifTomJx0nDge4jV8+K/CIiwUnhog3xMeXuezTFLmrBTM
 LNf6P97QBkOG0HSODQjZwXpKu0fL1kKePiOCCG3qGMbPiUWSbb/2FpjeEIm0VWiXo8/U
 LNCwrisfZL/glCM8WLSSI15zHFL2ybdJV4bJmpdhRmZXQHglocokA8u2LGRlfpAjm239
 QBHfaBLmuHFaqWQMAdIrs3ffYlZiTEKRaQhLMrAcYZoP6QRb8Doh6ivKPK5f3lkzej7R
 UkHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jDEFrOuF5vzpvLt/BuSnZw7aY6SBxJIsD/hC5MysJfc=;
 b=fwCLtv30KRzOt1ReI3T1exQX3k+zxWQ6JqKIP6P5T3Gh7iWL0AyU9LD+8sxbsl2wZE
 EGiGCNREJYmA/rAFCz7YVeEz3PObm6zxd1JLRguXgagW9SYbEclrGuNZhhlv/rNhKfl3
 f5Lu5n84cR0HV+FIgjB8IMcbJqRQMxA7dam4pxkyeF1BFzz31MvOc56PzUcuMfVI9GB+
 vh8Q/obpP1kb+8I97FRGRYoJpqgaukkxon/jfx07AOtafVrTKfB/M87xqb3QTUe0/kD8
 DFcjj58QdfKN+GSS86vAx5oaOh+GaJ5KrQ5vlQZlZSGsvpRqBgXM0Jbck8CYsJo2x5gq
 iRtA==
X-Gm-Message-State: AOAM530UsJKvz95FqX70x2eeNXtebUio320UI3k9jyR+VBvewgCT84fI
 vRYRRtpRv480m9LKwjEe571zqzDUE0TytA==
X-Google-Smtp-Source: ABdhPJw6d+F637B7BlqSW+RMvz39rj4J3k6SLZD8d0AMVTgwIKK0tl+VZK96Tn9wXt5x31V7KDZ2Gw==
X-Received: by 2002:aa7:8116:0:b0:44b:e0d1:25e9 with SMTP id
 b22-20020aa78116000000b0044be0d125e9mr38273882pfi.53.1633533633296; 
 Wed, 06 Oct 2021 08:20:33 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 130sm22239256pfz.77.2021.10.06.08.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 08:20:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/28] tcg/s390x: Implement tcg_out_mov for vector types
Date: Wed,  6 Oct 2021 08:20:05 -0700
Message-Id: <20211006152014.741026-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006152014.741026-1-richard.henderson@linaro.org>
References: <20211006152014.741026-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 72 +++++++++++++++++++++++++++++++++++---
 1 file changed, 68 insertions(+), 4 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index d80f25e48e..586a4b5587 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -265,6 +265,11 @@ typedef enum S390Opcode {
     RX_STC      = 0x42,
     RX_STH      = 0x40,
 
+    VRRa_VLR    = 0xe756,
+
+    VRSb_VLVG   = 0xe722,
+    VRSc_VLGV   = 0xe721,
+
     VRX_VL      = 0xe706,
     VRX_VLLEZ   = 0xe704,
     VRX_VST     = 0xe70e,
@@ -558,6 +563,39 @@ static int RXB(TCGReg v1, TCGReg v2, TCGReg v3, TCGReg v4)
          | ((v4 & 0x10) << (4 + 0));
 }
 
+static void tcg_out_insn_VRRa(TCGContext *s, S390Opcode op,
+                              TCGReg v1, TCGReg v2, int m3)
+{
+    tcg_debug_assert(is_vector_reg(v1));
+    tcg_debug_assert(is_vector_reg(v2));
+    tcg_out16(s, (op & 0xff00) | ((v1 & 0xf) << 4) | (v2 & 0xf));
+    tcg_out32(s, (op & 0x00ff) | RXB(v1, v2, 0, 0) | (m3 << 12));
+}
+
+static void tcg_out_insn_VRSb(TCGContext *s, S390Opcode op, TCGReg v1,
+                              intptr_t d2, TCGReg b2, TCGReg r3, int m4)
+{
+    tcg_debug_assert(is_vector_reg(v1));
+    tcg_debug_assert(d2 >= 0 && d2 <= 0xfff);
+    tcg_debug_assert(is_general_reg(b2));
+    tcg_debug_assert(is_general_reg(r3));
+    tcg_out16(s, (op & 0xff00) | ((v1 & 0xf) << 4) | r3);
+    tcg_out16(s, b2 << 12 | d2);
+    tcg_out16(s, (op & 0x00ff) | RXB(v1, 0, 0, 0) | (m4 << 12));
+}
+
+static void tcg_out_insn_VRSc(TCGContext *s, S390Opcode op, TCGReg r1,
+                              intptr_t d2, TCGReg b2, TCGReg v3, int m4)
+{
+    tcg_debug_assert(is_general_reg(r1));
+    tcg_debug_assert(d2 >= 0 && d2 <= 0xfff);
+    tcg_debug_assert(is_general_reg(b2));
+    tcg_debug_assert(is_vector_reg(v3));
+    tcg_out16(s, (op & 0xff00) | (r1 << 4) | (v3 & 0xf));
+    tcg_out16(s, b2 << 12 | d2);
+    tcg_out16(s, (op & 0x00ff) | RXB(0, 0, v3, 0) | (m4 << 12));
+}
+
 static void tcg_out_insn_VRX(TCGContext *s, S390Opcode op, TCGReg v1,
                              TCGReg b2, TCGReg x2, intptr_t d2, int m3)
 {
@@ -591,12 +629,38 @@ static void tcg_out_sh32(TCGContext* s, S390Opcode op, TCGReg dest,
 
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg dst, TCGReg src)
 {
-    if (src != dst) {
-        if (type == TCG_TYPE_I32) {
+    if (src == dst) {
+        return true;
+    }
+    switch (type) {
+    case TCG_TYPE_I32:
+        if (likely(is_general_reg(dst) && is_general_reg(src))) {
             tcg_out_insn(s, RR, LR, dst, src);
-        } else {
-            tcg_out_insn(s, RRE, LGR, dst, src);
+            break;
         }
+        /* fallthru */
+
+    case TCG_TYPE_I64:
+        if (likely(is_general_reg(dst))) {
+            if (likely(is_general_reg(src))) {
+                tcg_out_insn(s, RRE, LGR, dst, src);
+            } else {
+                tcg_out_insn(s, VRSc, VLGV, dst, 0, 0, src, 3);
+            }
+            break;
+        } else if (is_general_reg(src)) {
+            tcg_out_insn(s, VRSb, VLVG, dst, 0, 0, src, 3);
+            break;
+        }
+        /* fallthru */
+
+    case TCG_TYPE_V64:
+    case TCG_TYPE_V128:
+        tcg_out_insn(s, VRRa, VLR, dst, src, 0);
+        break;
+
+    default:
+        g_assert_not_reached();
     }
     return true;
 }
-- 
2.25.1


