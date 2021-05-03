Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28124371FC7
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 20:37:32 +0200 (CEST)
Received: from localhost ([::1]:53722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lddRj-0007bA-4z
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 14:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lddQE-0005mr-Jp
 for qemu-devel@nongnu.org; Mon, 03 May 2021 14:35:58 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:38748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lddQ6-0008GL-D1
 for qemu-devel@nongnu.org; Mon, 03 May 2021 14:35:58 -0400
Received: by mail-pg1-x52f.google.com with SMTP id i14so4291862pgk.5
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 11:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W8Z7GWgWXrx3oneyk7vmOA8UkgJl0Dw9JeNEtpO+NwA=;
 b=c5bYKWGBJfJFn0+Gp4HAiApQb28PB78Johf3qZsIjE2+pd24WSWe6cnjfS0akNzKeD
 QlBlV0SWUckmAjTs3tirLzLkO2N5qnC1VjY3EXciHhcnxf+Iv3FTbUdkkpjynb/GC8WM
 3AoVUsKRkUCqFMNBliPu4mQlV6D8+PuMUOAcrTqHMO9Cs3LBYGkjTKZ9aRsMC1sN1nP/
 VVdG5ffkJXXPWhF6gGuKG8id+i8RB/vXdPOtuOzUwE52kDKANbWzPJCXTglTersAn6kd
 9Na4QQv+7iF8InM3SJ30z/pQg8DGpANIqKZ2w7s6WsqfHpfFWhURCCKQFts55IzTn6F/
 lsKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W8Z7GWgWXrx3oneyk7vmOA8UkgJl0Dw9JeNEtpO+NwA=;
 b=UYAz8K71AOPVvH4vm0Cb2Q6VkkRvJTbXNy+iEKWuiK/hXGAVqKjbIPHgP+eJtQuKuB
 QOgg5mJ5NDPeLdr8rWGBpOsK/VFAMvZh84TXNU6LsR0/XS0kBpW8y0cU4XIlWShb9Z4K
 0Gm87LY/IHt1l+O+PR3oYb9fsJS7C4qy7Ebt7jtS60FwBLz4dXwWj0zlnidw388wzziL
 VAMqlkJDeM4x62PnxImiWfna8pC02sNXv4NdO6QmHbb/jqwJviFwQBvgdAejEXqpnu1S
 tKi4SsItPDkTXMQZaVh5Pk9PVALbYcA6lLDja9c0OV+Q8B0rBssdu/+rNOybbzNI2Iff
 BlNw==
X-Gm-Message-State: AOAM533u81yadZnxPJ6EdP9MbIkWbLIIkjQ1/BwwiNgpYTjmj5iXEuEJ
 LCEtabRXrnktoZUpPuZS4SIZ/ELRg3/e5A==
X-Google-Smtp-Source: ABdhPJyQFMgwsEHiGxRfb0Y388iepFJ87N89bwydcGJnmmbMgKD0riS6IXRAuiPJFWSfnpqWRS243w==
X-Received: by 2002:a17:90a:c087:: with SMTP id
 o7mr23308611pjs.65.1620066946718; 
 Mon, 03 May 2021 11:35:46 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q27sm4251567pfl.41.2021.05.03.11.35.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 11:35:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/16] tcg/s390x: Implement tcg_out_mov for vector types
Date: Mon,  3 May 2021 11:35:31 -0700
Message-Id: <20210503183541.2014496-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210503183541.2014496-1-richard.henderson@linaro.org>
References: <20210503183541.2014496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
 tcg/s390x/tcg-target.c.inc | 72 +++++++++++++++++++++++++++++++++++---
 1 file changed, 68 insertions(+), 4 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 6ed9a309c1..439ab5a359 100644
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


