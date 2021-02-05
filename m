Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B25D331167A
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 00:17:45 +0100 (CET)
Received: from localhost ([::1]:43102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8AMC-0001pT-Or
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 18:17:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2w-0002TJ-H2
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:52 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:40838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2r-0003V8-63
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:50 -0500
Received: by mail-pf1-x42b.google.com with SMTP id i63so5296914pfg.7
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 14:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qiThUlNgHGJ/mquJtz2e8kAX1s9Aecgyjtto5Sl+Qt8=;
 b=IG85gxo2JKC6LcenbsCMp+MvmEbCPXpLX6sMLvIUa/0vfkA4ZLM5kBKogdtQWatiG5
 bEj86w99JO7dRP+Sz0Ro1hbdYNFdK6IEwGHPBLIghneQmDjSYKHHqSeLa6d3Cx0aSGS3
 3UnCH3wtRnyhaJ+lh1l798QYexLIqaIA/Zh9FOsnD4SJC1BA+54FpFgqcM//7b1EWwvi
 Ph6NGVdp1/4NFFm1ZtL42VBFWNENWRyrcQXyaLKQ9Xs3R1iHnNZzRcVhW77spMbEmZvc
 9LUP4m4Z2PoDJIx44nT2DYcg2bLmkF2Tg/Bmnejcr7BLXB+HRyUy+pno+FJTZZ11+rj1
 EXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qiThUlNgHGJ/mquJtz2e8kAX1s9Aecgyjtto5Sl+Qt8=;
 b=nYKeQczCK/GlKtIEYs5IzwlvB19TxCC+cCfkPKTHQElrvTExRBNvX8lT2JRxrG277g
 gPO3BraZNcGblcv30TsVcSc05sTyk0rfkS062PqqvwCmqis0SI4H6dfJtbfbjbvZK2To
 yUbciOLj4ajy+vCflsNhI2wTZzVnHX9TG0ZuCMQq3QHcqnNftp8xLeXmWKqWF/kxpYHV
 eeraeJPvimlzQAiSSoqdxKyiTSWet9LJ6WS/CJlNmUAa8wdpVkxMD1xHUxDgdWieBNLy
 6ZD89QaZvNZEPseceNh9WWIJmPUQvpv4Mh+mQKxLcMCGjHeU7tf29JvwPzt/cwQLhfRL
 RHDQ==
X-Gm-Message-State: AOAM533sO/sNrHWue1u3ev167H6qJcpZur5h4HWhD4+AICmsH/Ln6tui
 shbxuDYloCJq54GYNHpIAzL54jvbgazygtIa
X-Google-Smtp-Source: ABdhPJwvP1N+Uw8Q1dZmoGTdXA6YBIsTfu3t14qZ+Su0yK8puDwUUWp6BOsJ+rDXx4D8x3m3HSYd4A==
X-Received: by 2002:a63:3008:: with SMTP id w8mr6392876pgw.207.1612565861934; 
 Fri, 05 Feb 2021 14:57:41 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id c23sm12155149pgc.72.2021.02.05.14.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:57:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/46] tcg/tci: Restrict TCG_TARGET_NB_REGS to 16
Date: Fri,  5 Feb 2021 12:56:30 -1000
Message-Id: <20210205225650.1330794-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205225650.1330794-1-richard.henderson@linaro.org>
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As noted in several comments, 8 regs is not enough for 32-bit
to perform calls, as currently implemented.  Shortly, we will
rearrange the encoding which will make 32 regs impossible.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.h     | 32 +++++---------------------------
 tcg/tci/tcg-target.c.inc | 26 --------------------------
 2 files changed, 5 insertions(+), 53 deletions(-)

diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 7fc349a3de..8f7ed676fc 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -133,11 +133,8 @@
 #define TCG_TARGET_HAS_mulu2_i32        1
 #endif /* TCG_TARGET_REG_BITS == 64 */
 
-/* Number of registers available.
-   For 32 bit hosts, we need more than 8 registers (call arguments). */
-/* #define TCG_TARGET_NB_REGS 8 */
+/* Number of registers available. */
 #define TCG_TARGET_NB_REGS 16
-/* #define TCG_TARGET_NB_REGS 32 */
 
 /* List of registers which are used by TCG. */
 typedef enum {
@@ -149,7 +146,6 @@ typedef enum {
     TCG_REG_R5,
     TCG_REG_R6,
     TCG_REG_R7,
-#if TCG_TARGET_NB_REGS >= 16
     TCG_REG_R8,
     TCG_REG_R9,
     TCG_REG_R10,
@@ -158,33 +154,15 @@ typedef enum {
     TCG_REG_R13,
     TCG_REG_R14,
     TCG_REG_R15,
-#if TCG_TARGET_NB_REGS >= 32
-    TCG_REG_R16,
-    TCG_REG_R17,
-    TCG_REG_R18,
-    TCG_REG_R19,
-    TCG_REG_R20,
-    TCG_REG_R21,
-    TCG_REG_R22,
-    TCG_REG_R23,
-    TCG_REG_R24,
-    TCG_REG_R25,
-    TCG_REG_R26,
-    TCG_REG_R27,
-    TCG_REG_R28,
-    TCG_REG_R29,
-    TCG_REG_R30,
-    TCG_REG_R31,
-#endif
-#endif
+
+    TCG_AREG0 = TCG_REG_R14,
+    TCG_REG_CALL_STACK = TCG_REG_R15,
+
     /* Special value UINT8_MAX is used by TCI to encode constant values. */
     TCG_CONST = UINT8_MAX
 } TCGReg;
 
-#define TCG_AREG0                       (TCG_TARGET_NB_REGS - 2)
-
 /* Used for function call generation. */
-#define TCG_REG_CALL_STACK              (TCG_TARGET_NB_REGS - 1)
 #define TCG_TARGET_CALL_STACK_OFFSET    0
 #define TCG_TARGET_STACK_ALIGN          16
 
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 3327ce3072..7e3bed811e 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -187,7 +187,6 @@ static const int tcg_target_reg_alloc_order[] = {
     TCG_REG_R5,
     TCG_REG_R6,
     TCG_REG_R7,
-#if TCG_TARGET_NB_REGS >= 16
     TCG_REG_R8,
     TCG_REG_R9,
     TCG_REG_R10,
@@ -196,7 +195,6 @@ static const int tcg_target_reg_alloc_order[] = {
     TCG_REG_R13,
     TCG_REG_R14,
     TCG_REG_R15,
-#endif
 };
 
 #if MAX_OPC_PARAM_IARGS != 6
@@ -216,15 +214,11 @@ static const int tcg_target_call_iarg_regs[] = {
 #if TCG_TARGET_REG_BITS == 32
     /* 32 bit hosts need 2 * MAX_OPC_PARAM_IARGS registers. */
     TCG_REG_R7,
-#if TCG_TARGET_NB_REGS >= 16
     TCG_REG_R8,
     TCG_REG_R9,
     TCG_REG_R10,
     TCG_REG_R11,
     TCG_REG_R12,
-#else
-# error Too few input registers available
-#endif
 #endif
 };
 
@@ -245,7 +239,6 @@ static const char *const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
     "r05",
     "r06",
     "r07",
-#if TCG_TARGET_NB_REGS >= 16
     "r08",
     "r09",
     "r10",
@@ -254,25 +247,6 @@ static const char *const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
     "r13",
     "r14",
     "r15",
-#if TCG_TARGET_NB_REGS >= 32
-    "r16",
-    "r17",
-    "r18",
-    "r19",
-    "r20",
-    "r21",
-    "r22",
-    "r23",
-    "r24",
-    "r25",
-    "r26",
-    "r27",
-    "r28",
-    "r29",
-    "r30",
-    "r31"
-#endif
-#endif
 };
 #endif
 
-- 
2.25.1


