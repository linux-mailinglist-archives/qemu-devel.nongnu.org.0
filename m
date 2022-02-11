Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B447A4B1BA8
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 02:53:52 +0100 (CET)
Received: from localhost ([::1]:56786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIL8B-0005xz-Qp
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 20:53:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKnY-0004qh-Pv
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:32:32 -0500
Received: from [2607:f8b0:4864:20::1033] (port=34343
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKnS-0007RB-Q7
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:32:32 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 ki18-20020a17090ae91200b001b8be87e9abso3064062pjb.1
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 17:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dGf6H379BZy6DeZ68czss+3cTWHfMO8pxL4mOJcpMBU=;
 b=TkaflsB18rfoW+jzTeM4vskmjopROlEpt4ExDn3FobscgH3UiuJlMLl25ZIzGSehBd
 s3opCbPNek54+9gSozyza8y7Y/e/MgQJA6n/6ekI4g3g8u9UNfr/sGP3PE4GfZ6GO+9X
 zwuiSWn/Z04BacqzuIWBKtctmTyTdVAoIbKUuyVE0k7VaNyVYaYQYtj8zx0S0JzcdNYO
 p8qAHEhgYwIOOJ1/st7SF/OlUGXgtvVK4Q0uSXqh8igDf6LWSuTTZ5FY+AO/QSakOWSh
 NHyNHbluq22aJq6gPl55OfqYTV9LsiHQX+OM9RD7cHTpWJg85KxHWnpyt3r5sKpdSpb8
 t4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dGf6H379BZy6DeZ68czss+3cTWHfMO8pxL4mOJcpMBU=;
 b=mH+Wo8DlvabYwu/Sx/bXirbiroNiXxzEIZcFv0JTPBi8ePx3Y6tnlHrz1Sspejd73X
 rl+HoBl7mpBC031iIvBXWDjupHMD8N+P/ezXNzMh7BMP34Yx3VoAN7dyoy8MT8lLnhtP
 6mP5ZbBmzJ6sDIKWjoXaDiAXguHDKniSEjM2zpGbNJ0fOxG8Scwofs74YfG3yso0jCTF
 tR9/KRrlhw7GYQdMtVhcWPlMFd6ke6ZUaImqdE3xXKYuvBH3KZEqGHtYFK8uV4O52O0O
 Ownyk3GMEgNHc9+mwVmznBG/1Ewyv9rhIzLoucL+wh5Jjv8pXN6+LlwvD4ZHg4awE6I+
 a4DA==
X-Gm-Message-State: AOAM531bEvK/6khPCqeyXH7urfqicaSTEwjyLcvB3gTMXsXC5+Tn1LEV
 HrIneaejmp0FxWUVbFLPPRJSWEgaXrPkchkM
X-Google-Smtp-Source: ABdhPJzMte4nnmQyz5U5BBwlrponfdHYEG7M9s50boEGeZiHblYIfJ70tWM6kBv5dnmGssmsbUH7cg==
X-Received: by 2002:a17:903:11d0:: with SMTP id
 q16mr10000412plh.134.1644543145426; 
 Thu, 10 Feb 2022 17:32:25 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id h5sm25738788pfi.111.2022.02.10.17.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 17:32:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/34] tcg/arm: Check alignment for ldrd and strd
Date: Fri, 11 Feb 2022 12:30:45 +1100
Message-Id: <20220211013059.17994-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211013059.17994-1-richard.henderson@linaro.org>
References: <20220211013059.17994-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

We will shortly allow the use of unaligned memory accesses,
and these require proper alignment.  Use get_alignment_bits
to verify and remove USING_SOFTMMU.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 9eb43407ea..4b0b4f4c2f 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -34,13 +34,6 @@ bool use_idiv_instructions;
 bool use_neon_instructions;
 #endif
 
-/* ??? Ought to think about changing CONFIG_SOFTMMU to always defined.  */
-#ifdef CONFIG_SOFTMMU
-# define USING_SOFTMMU 1
-#else
-# define USING_SOFTMMU 0
-#endif
-
 #ifdef CONFIG_DEBUG_TCG
 static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
     "%r0",  "%r1",  "%r2",  "%r3",  "%r4",  "%r5",  "%r6",  "%r7",
@@ -1621,8 +1614,8 @@ static void tcg_out_qemu_ld_index(TCGContext *s, MemOp opc,
         tcg_out_ld32_r(s, COND_AL, datalo, addrlo, addend);
         break;
     case MO_UQ:
-        /* Avoid ldrd for user-only emulation, to handle unaligned.  */
-        if (USING_SOFTMMU
+        /* LDRD requires alignment; double-check that. */
+        if (get_alignment_bits(opc) >= MO_64
             && (datalo & 1) == 0 && datahi == datalo + 1) {
             tcg_out_ldrd_r(s, COND_AL, datalo, addrlo, addend);
         } else if (datalo != addend) {
@@ -1664,8 +1657,8 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg datalo,
         tcg_out_ld32_12(s, COND_AL, datalo, addrlo, 0);
         break;
     case MO_UQ:
-        /* Avoid ldrd for user-only emulation, to handle unaligned.  */
-        if (USING_SOFTMMU
+        /* LDRD requires alignment; double-check that. */
+        if (get_alignment_bits(opc) >= MO_64
             && (datalo & 1) == 0 && datahi == datalo + 1) {
             tcg_out_ldrd_8(s, COND_AL, datalo, addrlo, 0);
         } else if (datalo == addrlo) {
@@ -1741,8 +1734,8 @@ static void tcg_out_qemu_st_index(TCGContext *s, ARMCond cond, MemOp opc,
         tcg_out_st32_r(s, cond, datalo, addrlo, addend);
         break;
     case MO_64:
-        /* Avoid strd for user-only emulation, to handle unaligned.  */
-        if (USING_SOFTMMU
+        /* STRD requires alignment; double-check that. */
+        if (get_alignment_bits(opc) >= MO_64
             && (datalo & 1) == 0 && datahi == datalo + 1) {
             tcg_out_strd_r(s, cond, datalo, addrlo, addend);
         } else {
@@ -1773,8 +1766,8 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg datalo,
         tcg_out_st32_12(s, COND_AL, datalo, addrlo, 0);
         break;
     case MO_64:
-        /* Avoid strd for user-only emulation, to handle unaligned.  */
-        if (USING_SOFTMMU
+        /* STRD requires alignment; double-check that. */
+        if (get_alignment_bits(opc) >= MO_64
             && (datalo & 1) == 0 && datahi == datalo + 1) {
             tcg_out_strd_8(s, COND_AL, datalo, addrlo, 0);
         } else {
-- 
2.25.1


