Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A96CB31293E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:17:08 +0100 (CET)
Received: from localhost ([::1]:38660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8x2x-0001NX-LV
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:17:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSd-0002q7-KI
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:35 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:39200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSb-0006Bd-WC
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:35 -0500
Received: by mail-pl1-x631.google.com with SMTP id k22so2650280pll.6
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nbzdCRnUzVvHAlHdm0W/U/kL5Ps02KKsV67u0VtR3Rc=;
 b=aI1MZUadjl7beKap6OTg2bPVbWJTAAde2E9trzg6HvoDaW8G5LL++TMpyceLhPhnwR
 1yVcrUnUrdZkDzTTSse2XTzarjfyO4qS22jzCHLWMQcd/zMJW8I1GmCA1XXzitIheczZ
 9Gmk03jUFnXjGQXoQ53TSPD8z+ze6UkY+SI0+MU9N5azW/X4lt6/sAqVHHhPONyPszKn
 P4g677zeUMkbBhHOX09lsZnSQjbEAe10OL7kefFSVrO01Qbz+IHocKNaakUQdlnv9Nyc
 FHSGZfL5bS7WiAv5lzWSVDxLIAp8HZs+jYhRl34NNtelJBAofObQXSqBxhV6f/js4Evt
 tRtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nbzdCRnUzVvHAlHdm0W/U/kL5Ps02KKsV67u0VtR3Rc=;
 b=pQwuU485uK02V3bfJPnC2LF8uxBJwXgnLqBksE13zZITRoyk98d+Mcf8zaNopCRl8+
 cXAObyzVhi13lfFTbG9bwq8bz+7UlnuEOATwcUZO6x3fCyP8uRcMSQx7hTcG9Y52EJT4
 tby86bwA76n309tlG79udEevoHOJE2lfYM4Dilp+wzFmep9rRtjRGrvVLRc7SHr0vR8x
 379pG5EQUmuLIdCximLBHgmEj4mbjHaYGu/e6cpycRg8QoQv6qzTaUXuB7PGj8rSEJ7b
 TA2C9hBxVFI+zvXW48n0QotE4OVs00l3C4OFuox9p3ayRGAhJZ1x99/OhumKVs/y0zmQ
 26xg==
X-Gm-Message-State: AOAM532E2lMbG4wJ0JQZycFmWYn6ZHCJkDlK6I/3pOGMeirwEhyIRFt4
 TER3MVhAY5FfVwpZAP/Ss6mDLp4I1M3Yjg==
X-Google-Smtp-Source: ABdhPJxyXT+C5pI0cu8Of0T2qTwauPDOCJbshfH8isSJbSybLHVgsxUd0nIPUJllm9P5kuNC8yboTw==
X-Received: by 2002:a17:90a:db12:: with SMTP id
 g18mr15056912pjv.72.1612751972854; 
 Sun, 07 Feb 2021 18:39:32 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id 74sm650954pfw.53.2021.02.07.18.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:39:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 57/70] tcg/tci: Split out tcg_out_op_r[iI]
Date: Sun,  7 Feb 2021 18:37:39 -0800
Message-Id: <20210208023752.270606-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 50 ++++++++++++++++++++++++++++------------
 1 file changed, 35 insertions(+), 15 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index e4a5872b2a..c2d2bd24d7 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -324,6 +324,31 @@ static void tcg_out_op_np(TCGContext *s, TCGOpcode op,
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_ri(TCGContext *s, TCGOpcode op, TCGReg r0, int32_t i1)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out32(s, i1);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
+#if TCG_TARGET_REG_BITS == 64
+static void tcg_out_op_rI(TCGContext *s, TCGOpcode op,
+                          TCGReg r0, uint64_t i1)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out64(s, i1);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+#endif
+
 static void tcg_out_op_rr(TCGContext *s, TCGOpcode op, TCGReg r0, TCGReg r1)
 {
     uint8_t *old_code_ptr = s->code_ptr;
@@ -550,25 +575,20 @@ static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
 }
 
 static void tcg_out_movi(TCGContext *s, TCGType type,
-                         TCGReg t0, tcg_target_long arg)
+                         TCGReg ret, tcg_target_long arg)
 {
-    uint8_t *old_code_ptr = s->code_ptr;
-    uint32_t arg32 = arg;
-    if (type == TCG_TYPE_I32 || arg == arg32) {
-        tcg_out_op_t(s, INDEX_op_tci_movi_i32);
-        tcg_out_r(s, t0);
-        tcg_out32(s, arg32);
-    } else {
-        tcg_debug_assert(type == TCG_TYPE_I64);
+    switch (type) {
+    case TCG_TYPE_I32:
+        tcg_out_op_ri(s, INDEX_op_tci_movi_i32, ret, arg);
+        break;
 #if TCG_TARGET_REG_BITS == 64
-        tcg_out_op_t(s, INDEX_op_tci_movi_i64);
-        tcg_out_r(s, t0);
-        tcg_out64(s, arg);
-#else
-        TODO();
+    case TCG_TYPE_I64:
+        tcg_out_op_rI(s, INDEX_op_tci_movi_i64, ret, arg);
+        break;
 #endif
+    default:
+        g_assert_not_reached();
     }
-    old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
 static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg)
-- 
2.25.1


