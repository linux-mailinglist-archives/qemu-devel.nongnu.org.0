Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA11F31296D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:36:55 +0100 (CET)
Received: from localhost ([::1]:48778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xM6-0003U8-Ul
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:36:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wdx-0008BP-FP
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:51:17 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:34104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wdr-0001Kt-Pn
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:51:17 -0500
Received: by mail-pj1-x1029.google.com with SMTP id my11so8654212pjb.1
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7/qGIn8tY1yMvYr3HTJwBYjhBdPYnfUp7IIb+uD8MPE=;
 b=bjiYBztQTUVuJVgmRbwFzHGkMkegM4rbeem7hj8LI05QiVpi63LTqRJghswFKpoS0O
 R+18wnehO1yi9DLPnAElB6vPMOXsBlBR+KSwxakX69+8wqapvdunLgX1B4yx9+G7O3Vc
 UiQ39h2LoGERsgnscSyhPBL6QZ9JqZ9ruxTQHajxvZ6hE4f2/t0am7LVjxIh9naozAGz
 y0diQMXPVlFB26cxMtoJlzkOTD9SwneP6zGOBeGmdYnCsy5YCbQOSeNgJgMwjoGWvWpP
 mnE7vmy3qtXCvhXigQj+iK45ew9BHQC/Vm1PDsMuxQp90NK9FrDIEb7urdsOkNbLM/8s
 U8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7/qGIn8tY1yMvYr3HTJwBYjhBdPYnfUp7IIb+uD8MPE=;
 b=FBV+IW1WIGnqX16Y8tiFa9MQHcVUaKz16m7nup7/Vw4BUG3KEw43hs/dB7cnJtDwAu
 Act/vsKmvliRhxFpwB32lqWDnaMr5Dvd2Z0AjrxwziEquPnaulyKZzWXl+ob4ymfE9ba
 sANFuqso1PtO03J2SgkH7WG6VM3hXCsZhtTfxxHO+7+9GTLONYBPM2ojTILKIUVWjkrT
 58gw7cte7O1zMWjL0Krl0zlMrNGC6fC5lKQGOqCiiOPDz33Oh+8LGVF9O+TaWQVXwT/9
 cetS8PXNu7XZxE2/IcLKSlfxiUq3oYOl4FckFl3ADDvW/Hz8156wfWU1NEoL4TGvSu2G
 DPmA==
X-Gm-Message-State: AOAM53248Cc/hATv9WwTCeBDfDfSSh1Y1jzlLKZ8OfvHHon95kQbv8/+
 9ie8QuDO7Rqrnue80bI0QI+YBNRmsCttZQ==
X-Google-Smtp-Source: ABdhPJzqxofvU4CVjTWrh4R6lF3wABxkYSXHjxmqVE+yXDhd4dQdd4713ZThphXsah7Hj2tF0Cb2Dw==
X-Received: by 2002:a17:902:6b43:b029:df:fb48:aece with SMTP id
 g3-20020a1709026b43b02900dffb48aecemr14439188plt.59.1612752670398; 
 Sun, 07 Feb 2021 18:51:10 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id p12sm10308690pju.35.2021.02.07.18.51.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:51:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/16] tcg/s390x: Implement tcg_out_mov for vector types
Date: Sun,  7 Feb 2021 18:50:51 -0800
Message-Id: <20210208025101.271726-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208025101.271726-1-richard.henderson@linaro.org>
References: <20210208025101.271726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 72 +++++++++++++++++++++++++++++++++++---
 1 file changed, 68 insertions(+), 4 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index df10ee0feb..fdf7475b2d 100644
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
@@ -546,6 +551,39 @@ static int RXB(TCGReg v1, TCGReg v2, TCGReg v3, TCGReg v4)
          | ((v4 & 16) << (4 - 3));
 }
 
+static void tcg_out_insn_VRRa(TCGContext *s, S390Opcode op,
+                              TCGReg v1, TCGReg v2, int m3)
+{
+    tcg_debug_assert(v1 >= TCG_REG_V0 && v1 <= TCG_REG_V31);
+    tcg_debug_assert(v2 >= TCG_REG_V0 && v2 <= TCG_REG_V31);
+    tcg_out16(s, (op & 0xff00) | ((v1 & 15) << 4) | (v2 & 15));
+    tcg_out32(s, (op & 0x00ff) | RXB(v1, v2, 0, 0) | (m3 << 12));
+}
+
+static void tcg_out_insn_VRSb(TCGContext *s, S390Opcode op, TCGReg v1,
+                              intptr_t d2, TCGReg b2, TCGReg r3, int m4)
+{
+    tcg_debug_assert(v1 >= TCG_REG_V0 && v1 <= TCG_REG_V31);
+    tcg_debug_assert(d2 >= 0 && d2 <= 0xfff);
+    tcg_debug_assert(b2 <= TCG_REG_R15);
+    tcg_debug_assert(r3 <= TCG_REG_R15);
+    tcg_out16(s, (op & 0xff00) | ((v1 & 15) << 4) | r3);
+    tcg_out16(s, b2 << 12 | d2);
+    tcg_out16(s, (op & 0x00ff) | RXB(v1, 0, 0, 0) | (m4 << 12));
+}
+
+static void tcg_out_insn_VRSc(TCGContext *s, S390Opcode op, TCGReg r1,
+                              intptr_t d2, TCGReg b2, TCGReg v3, int m4)
+{
+    tcg_debug_assert(r1 <= TCG_REG_R15);
+    tcg_debug_assert(d2 >= 0 && d2 <= 0xfff);
+    tcg_debug_assert(b2 <= TCG_REG_R15);
+    tcg_debug_assert(v3 >= TCG_REG_V0 && v3 <= TCG_REG_V31);
+    tcg_out16(s, (op & 0xff00) | (r1 << 4) | (v3 & 15));
+    tcg_out16(s, b2 << 12 | d2);
+    tcg_out16(s, (op & 0x00ff) | RXB(0, 0, v3, 0) | (m4 << 12));
+}
+
 static void tcg_out_insn_VRX(TCGContext *s, S390Opcode op, TCGReg v1,
                              TCGReg b2, TCGReg x2, intptr_t d2, int m3)
 {
@@ -579,12 +617,38 @@ static void tcg_out_sh32(TCGContext* s, S390Opcode op, TCGReg dest,
 
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg dst, TCGReg src)
 {
-    if (src != dst) {
-        if (type == TCG_TYPE_I32) {
+    if (src == dst) {
+        return true;
+    }
+    switch (type) {
+    case TCG_TYPE_I32:
+        if (likely(dst < 16 && src < 16)) {
             tcg_out_insn(s, RR, LR, dst, src);
-        } else {
-            tcg_out_insn(s, RRE, LGR, dst, src);
+            break;
         }
+        /* fallthru */
+
+    case TCG_TYPE_I64:
+        if (likely(dst < 16)) {
+            if (likely(src < 16)) {
+                tcg_out_insn(s, RRE, LGR, dst, src);
+            } else {
+                tcg_out_insn(s, VRSc, VLGV, dst, 0, 0, src, 3);
+            }
+            break;
+        } else if (src < 16) {
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


