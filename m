Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 320412E2C5C
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Dec 2020 21:30:55 +0100 (CET)
Received: from localhost ([::1]:52026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kstji-0005HB-9v
	for lists+qemu-devel@lfdr.de; Fri, 25 Dec 2020 15:30:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kstZJ-00030l-Kf
 for qemu-devel@nongnu.org; Fri, 25 Dec 2020 15:20:09 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:33324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kstZG-0005AC-I4
 for qemu-devel@nongnu.org; Fri, 25 Dec 2020 15:20:09 -0500
Received: by mail-pl1-x635.google.com with SMTP id b8so2737026plx.0
 for <qemu-devel@nongnu.org>; Fri, 25 Dec 2020 12:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xtPkJYSqxzCzENf0a3Xp5948v1FzYU34Jldab6lT+9g=;
 b=n6BLIuCf9moEbOGcTNNM9o7UYB518FWCvhhYUMUUONvP0mvuDHm+TIRrwb0XiGBH5K
 gmguTwv/3py8S6NG/gNV3934gBYejS0nXx1DgRcTMAG2b42mf6QoBO/jw62/aJWRfz4z
 gCSKYtLDoQp/cFRVZSRwUw/E4QfTx+YYFfIZH8umKZY5Dw0APSNHeTHqi2y7jNCrh10X
 UrmJuWrdc2rE19Aw101Kme8OBIg2Og3HjjGHAt5IYgjcLea3nAoLb2bgiCK9tegwFJ0e
 Q2ukMF3lN7JAv8hxjkKTEjhRj3Z/F0wcC6StrSUuJDgjfTzJVAYJeKDLcgneZS+hTXBO
 RH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xtPkJYSqxzCzENf0a3Xp5948v1FzYU34Jldab6lT+9g=;
 b=JHoximL5qQydux9cMgwR+AIqIZsInow0jqzTjJFBpqD9Cb7XnJoxljqSPcSuZ/aQoH
 nN9L2Zt+zi+t0ucuD8je1quSOA4ETZ07RnZideL3LkTVbXI/XY9Vi2LLImfwWzxtsW1r
 QmAnA6ei+BPlXXfeEAXX82LcROxS4WaSQvfpacI5XwBjEyKR9czuQvaHmos2Eid8NUVR
 a5CBIERzJqcIy/VsNF5DG2GJ7cfuqtqDU+C1Q6Cbgx5Q07XP8D0Y6DgP/s3QJ7VqnHmu
 s6SBRlyucmnaZ81+3QNA/UqsiHAuxWIk2d6nVj2Bol7juAWAQj4sEc6YpwbOrsk+ZDhj
 s9Gg==
X-Gm-Message-State: AOAM531r1jwhDJ/uz5P9RzI8tsaw0CQX2lWLey6X1AkyXvCztKLgPNfX
 aTycbgDtDQujYiWtxDjeMqtNBD0jU7rf3A==
X-Google-Smtp-Source: ABdhPJyALFvLyohacRH831wL7b1vMfdySPVHcIiiV8n59Dq62cjlEKiGZzwWCvJ1plcLs5KayukFLA==
X-Received: by 2002:a17:90b:2282:: with SMTP id
 kx2mr9674644pjb.77.1608927605083; 
 Fri, 25 Dec 2020 12:20:05 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id l8sm5816497pjt.32.2020.12.25.12.20.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Dec 2020 12:20:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/16] tcg/s390x: Implement tcg_out_mov for vector types
Date: Fri, 25 Dec 2020 12:19:46 -0800
Message-Id: <20201225201956.692861-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201225201956.692861-1-richard.henderson@linaro.org>
References: <20201225201956.692861-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
index bae70b9119..50113dbdd7 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -250,6 +250,11 @@ typedef enum S390Opcode {
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
@@ -530,6 +535,39 @@ static int RXB(TCGReg v1, TCGReg v2, TCGReg v3, TCGReg v4)
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
@@ -563,12 +601,38 @@ static void tcg_out_sh32(TCGContext* s, S390Opcode op, TCGReg dest,
 
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


