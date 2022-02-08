Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C2D4AD2D2
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 09:09:13 +0100 (CET)
Received: from localhost ([::1]:45946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHLYm-0003GB-RK
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 03:09:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHKke-0000ON-B9
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:17:26 -0500
Received: from [2607:f8b0:4864:20::102b] (port=37443
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHKkb-00018A-Av
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:17:22 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 v5-20020a17090a4ec500b001b8b702df57so1317089pjl.2
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 23:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iWGhaZHijfvDesszGrFn/aH0aQI0aOahuchhLdkaRxg=;
 b=gmYbOyHnRRx25PqbtkoldsWGj829upddaG0l7dqxwlvXsg+T6IxD9Yv/R8r+7IlAP1
 4jRt0juUpwoJtaLKj6THF/6QZUp0YHDm4hUuXV9rzfl/CSQqQxpIpWC1NZr/nGk3HKwr
 8YPt7BEtviv3xnJYkkcjgdTqhtB0kZavxSHTH662tTHQI6Ix1QmHwR6d/9DyN3PzjRGN
 Ctfa5yWOf/NlLp8YrRC9HnZcCZhTi8eZlDHXSLliZV0qjVcpXGkyhzR+KeXBzecL/p1r
 PsNh8WnLBVGvHuQYT1oHjv+iq4QvtyzhXiJo+GeuvPeM8Asun73x2dokIcGx5/EasENu
 hfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iWGhaZHijfvDesszGrFn/aH0aQI0aOahuchhLdkaRxg=;
 b=Jb78veqw5OQOJa/CkVa4MEHNtxUaChKNidM17uZ9weaiwjboJ61kvPQYD2VLwhRFd6
 msB758iNkMNa/saO/E+wz1NV5fCr8KcllTcVHYDe76J1m5dmFvGgOgF+MasCLVuKfP9W
 X3JMOuA4gjs7ZECVc8O7K62NivbGgfqnU5Ivdnj2QRkM6lPcy3V1I+gF1DlV8UeBS0A7
 1G3wx2pdPrcglkH87DHb3sRnOJfJcWE/tiR6uBedZ/tIyDpilaSXekvYsTeVkeRUAOOV
 8sGmItFjBuqwtOLKOn/ndEGmizjqmsNczGHzEbrYcgdLZHhkszF8W9Ofi8IpSE5mpH7V
 w/HQ==
X-Gm-Message-State: AOAM533lle2/WIUGje7yPPOfUVY46hv1KAvystVDxaK/w8upmdWwoXpL
 jKNLehG+hRRU3BfPdp7sHIFT4nT5Y9pJzw==
X-Google-Smtp-Source: ABdhPJxW4p+7gfKLDPLWMeY7uxeLBwAsuf0WXOKJ5N5qNYwn/ihqXzbH69sur0QUJHP4+HWFrCw7Zw==
X-Received: by 2002:a17:902:eccc:: with SMTP id
 a12mr3371454plh.140.1644304639970; 
 Mon, 07 Feb 2022 23:17:19 -0800 (PST)
Received: from localhost.localdomain (121-45-127-8.tpgi.com.au. [121.45.127.8])
 by smtp.gmail.com with ESMTPSA id mi11sm1543422pjb.37.2022.02.07.23.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 23:17:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 2/8] tcg/sparc: Split out tcg_out_movi_imm32
Date: Tue,  8 Feb 2022 18:17:04 +1100
Message-Id: <20220208071710.320122-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208071710.320122-1-richard.henderson@linaro.org>
References: <20220208071710.320122-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Handle 32-bit constants with a separate function, so that
tcg_out_movi_int does not need to recurse.  This slightly
rearranges the order of tests for small constants, but
produces the same output.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc/tcg-target.c.inc | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 82a7c684b6..576903e0d8 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -413,15 +413,30 @@ static void tcg_out_movi_imm13(TCGContext *s, TCGReg ret, int32_t arg)
     tcg_out_arithi(s, ret, TCG_REG_G0, arg, ARITH_OR);
 }
 
+static void tcg_out_movi_imm32(TCGContext *s, TCGReg ret, int32_t arg)
+{
+    if (check_fit_i32(arg, 13)) {
+        /* A 13-bit constant sign-extended to 64-bits.  */
+        tcg_out_movi_imm13(s, ret, arg);
+    } else {
+        /* A 32-bit constant zero-extended to 64 bits.  */
+        tcg_out_sethi(s, ret, arg);
+        if (arg & 0x3ff) {
+            tcg_out_arithi(s, ret, ret, arg & 0x3ff, ARITH_OR);
+        }
+    }
+}
+
 static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
                              tcg_target_long arg, bool in_prologue)
 {
     tcg_target_long hi, lo = (int32_t)arg;
     tcg_target_long test, lsb;
 
-    /* Make sure we test 32-bit constants for imm13 properly.  */
-    if (type == TCG_TYPE_I32) {
-        arg = lo;
+    /* A 32-bit constant, or 32-bit zero-extended to 64-bits.  */
+    if (type == TCG_TYPE_I32 || arg == (uint32_t)arg) {
+        tcg_out_movi_imm32(s, ret, arg);
+        return;
     }
 
     /* A 13-bit constant sign-extended to 64-bits.  */
@@ -439,15 +454,6 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
         }
     }
 
-    /* A 32-bit constant, or 32-bit zero-extended to 64-bits.  */
-    if (type == TCG_TYPE_I32 || arg == (uint32_t)arg) {
-        tcg_out_sethi(s, ret, arg);
-        if (arg & 0x3ff) {
-            tcg_out_arithi(s, ret, ret, arg & 0x3ff, ARITH_OR);
-        }
-        return;
-    }
-
     /* A 32-bit constant sign-extended to 64-bits.  */
     if (arg == lo) {
         tcg_out_sethi(s, ret, ~arg);
@@ -471,13 +477,13 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
     /* A 64-bit constant decomposed into 2 32-bit pieces.  */
     if (check_fit_i32(lo, 13)) {
         hi = (arg - lo) >> 32;
-        tcg_out_movi(s, TCG_TYPE_I32, ret, hi);
+        tcg_out_movi_imm32(s, ret, hi);
         tcg_out_arithi(s, ret, ret, 32, SHIFT_SLLX);
         tcg_out_arithi(s, ret, ret, lo, ARITH_ADD);
     } else {
         hi = arg >> 32;
-        tcg_out_movi(s, TCG_TYPE_I32, ret, hi);
-        tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_T2, lo);
+        tcg_out_movi_imm32(s, ret, hi);
+        tcg_out_movi_imm32(s, TCG_REG_T2, lo);
         tcg_out_arithi(s, ret, ret, 32, SHIFT_SLLX);
         tcg_out_arith(s, ret, ret, TCG_REG_T2, ARITH_OR);
     }
-- 
2.25.1


