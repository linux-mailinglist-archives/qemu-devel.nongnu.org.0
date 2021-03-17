Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2E133F4D1
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:59:34 +0100 (CET)
Received: from localhost ([::1]:41858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYa5-0008Cw-8t
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCP-00059w-OQ
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:05 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:39707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCH-00077t-Ay
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:05 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 h6-20020a0568300346b02901b71a850ab4so2179189ote.6
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 08:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xFXP6U+4B29OsOJ+BmqhfwEMNTn92rQ42jQHvULubqM=;
 b=CYT+gN5v/1mB2wlXgCWUxbtUXOODPIYxrb0wc2+3bKLn1D5MX9ohuf8oN30d9wKL6z
 5CID4ebRtLya4IngrhUQmtSFxw66A6aR+eVKy0rHLQRuocsAUhLMU+czKoptjEJI3cyN
 5z5wjcLHT+8UaGUQK4MvWFaiXxI2tg2GVIT0Xv1GSZ04GZQkOex83DYcg9vs6miKmFrD
 TU384vxbnoAo2DG97DKFQiPQNXPtBN6RnE2owPsYtbiMTddGkQBOZg7SYUHeWO/YfDJ0
 hlvbxSV1l2+054aI2Q4Pob0E8IaSCHwe72oSp62fgF0rrW4gEw4uO46BtPRXRVQlxCRc
 RGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xFXP6U+4B29OsOJ+BmqhfwEMNTn92rQ42jQHvULubqM=;
 b=hmrDb+TzLwjvEytZPABOIpVOEyAxiTVJbB39lR9EC0I+ql5p5NbQi4NjGz1WNwh7jE
 J2N8hsGCuysbiF29V4vT3gHRhTHsq71FBLyYLl6/2sTI8uWc4mL/yaSi06lIuzbuyCIf
 K6jyig1i40UcPlCJue2CsNLk+JE0OC6ioUiWK/p45Y7p7hOIRUq3cxslI+FxvYz97ye4
 e9WhY9Umo4mTPdTyQMvsxTOhy44YKqhOqOBBEzCUYU7OLVQkhflJ/KPnPH5RXVZFt3G6
 WfJQ9fWSz36co/oOWAKguk9DlAX9h6MzIikCE3eW0IqB9jRRBr4y4KUdiEerHks8tyMh
 AFnw==
X-Gm-Message-State: AOAM531RprckfCnLQUHmy2CSFV8+KMMfsz2TJt3v6j997w3TqykjhWht
 FI9sWLyHJ9QS6YxbO+jZbhJzklufw/jN81Si
X-Google-Smtp-Source: ABdhPJw3AtmrRNyvhwc92Tsf8WRomrXMg8f4cmWRYjKZrHaiRN7zoLjSPIJKuJx2UEFxQ3f/UidXMw==
X-Received: by 2002:a05:6830:1b68:: with SMTP id
 d8mr3689711ote.235.1615995296108; 
 Wed, 17 Mar 2021 08:34:56 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i11sm8271154otp.76.2021.03.17.08.34.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 08:34:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/38] tcg/tci: Split out tci_args_ri and tci_args_rI
Date: Wed, 17 Mar 2021 09:34:16 -0600
Message-Id: <20210317153444.310566-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317153444.310566-1-richard.henderson@linaro.org>
References: <20210317153444.310566-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 854fc8df5d..9bb529c5ae 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -121,16 +121,6 @@ static int32_t tci_read_s32(const uint8_t **tb_ptr)
     return value;
 }
 
-#if TCG_TARGET_REG_BITS == 64
-/* Read constant (64 bit) from bytecode. */
-static uint64_t tci_read_i64(const uint8_t **tb_ptr)
-{
-    uint64_t value = *(const uint64_t *)(*tb_ptr);
-    *tb_ptr += sizeof(value);
-    return value;
-}
-#endif
-
 /* Read indexed register (native size) from bytecode. */
 static tcg_target_ulong
 tci_read_rval(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
@@ -181,6 +171,8 @@ static tcg_target_ulong tci_read_label(const uint8_t **tb_ptr)
  * where arguments is a sequence of
  *
  *   c = condition (TCGCond)
+ *   i = immediate (uint32_t)
+ *   I = immediate (tcg_target_ulong)
  *   l = label or pointer
  *   r = register
  *   s = signed ldst offset
@@ -198,6 +190,22 @@ static void tci_args_rr(const uint8_t **tb_ptr,
     *r1 = tci_read_r(tb_ptr);
 }
 
+static void tci_args_ri(const uint8_t **tb_ptr,
+                        TCGReg *r0, tcg_target_ulong *i1)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *i1 = tci_read_i32(tb_ptr);
+}
+
+#if TCG_TARGET_REG_BITS == 64
+static void tci_args_rI(const uint8_t **tb_ptr,
+                        TCGReg *r0, tcg_target_ulong *i1)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *i1 = tci_read_i(tb_ptr);
+}
+#endif
+
 static void tci_args_rrr(const uint8_t **tb_ptr,
                          TCGReg *r0, TCGReg *r1, TCGReg *r2)
 {
@@ -483,9 +491,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             regs[r0] = regs[r1];
             break;
         case INDEX_op_tci_movi_i32:
-            t0 = *tb_ptr++;
-            t1 = tci_read_i32(&tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            tci_args_ri(&tb_ptr, &r0, &t1);
+            regs[r0] = t1;
             break;
 
             /* Load/store operations (32 bit). */
@@ -705,9 +712,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #endif
 #if TCG_TARGET_REG_BITS == 64
         case INDEX_op_tci_movi_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_i64(&tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            tci_args_rI(&tb_ptr, &r0, &t1);
+            regs[r0] = t1;
             break;
 
             /* Load/store operations (64 bit). */
-- 
2.25.1


