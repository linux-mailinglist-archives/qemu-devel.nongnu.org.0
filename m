Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5296C55C0A9
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 13:27:40 +0200 (CEST)
Received: from localhost ([::1]:52340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o69Nb-0006pT-47
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 07:27:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o69Dp-0004Ex-Gs
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:17:33 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:46011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o69Dn-0003Cm-WB
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:17:33 -0400
Received: by mail-pg1-x52d.google.com with SMTP id 184so11863209pga.12
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 04:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qIoo0LzyvHSUbYXwQZj3nHuBOs19Duk2E4Vx8ekmqlk=;
 b=TLew3rlNVvslip45PSkl6tIpvr8EWpPrzS2A/7URxjI9grS3zYZvC7ZmhwOgW/swvj
 1r4rs1jBRzPKs6a2S0xUk4U3LGk+KKWmMtUkSQaqBZD039WVinmo4aQgTp05tMopVab5
 b0NUwpZlsnv4XPdGz05CW4SosBvstrKd8bGjLHMsD6exNTxJxYIjCbRJpEdtrtLE/yo3
 RXFfCS3q4aU7j9WBBBGdYffSWFR52mXAZvNev0pLgIlxKAdQv2wBPDtDK65sZ5pAazkK
 Jvo7AOl5UT9xgNxSg3dfNH/6v1fb/uSJl+zd75udlb/XpGPMHjUgAprPIukKRTAZRMv0
 acYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qIoo0LzyvHSUbYXwQZj3nHuBOs19Duk2E4Vx8ekmqlk=;
 b=2wgwEUgsekrVFFPL04lWhY6ByEiFE4cdu/TOBMnyylswkNQMVdUiCsi+urK19SCvuH
 LYMnNnyAe1hwNvFAY8yN6xqT5w1ayNcqCd9D9gqRNPbO/bLldr9kGSmsJZIkti56ZxG7
 5x0pb2gxQ90Izhrzx8CSjm+rbfFyfA2pNRtXMjUeK2qwpEatONJ0kdCKnL/AdHUxXLPh
 fE62UsN1KQdtRNncPtkez1LYKjIjy42TrMmsQ/snH0wnyqj3/lQWeU9pkKktKG5CLXxJ
 i1dJPmNHKg3RJLaSKaUWQAiKkb2/UMgimsm4P2odeCkBE7kZT5AwDq2pQHP2ztXWftBJ
 owVw==
X-Gm-Message-State: AJIora80jMtSROZ99DrfDgWLL+3bR1a8Jo84LS/DgNgXKk/h0RGhCNrT
 Y/VpbInPuyav78k5bwEnr9TEa7Hb6QNTFw==
X-Google-Smtp-Source: AGRyM1tBXyH6sDF92a6+364iVAJsFCWPE8UJWlHrLLYVkgcrmSyBtStBEU7j/K76sA7A98aMzQLFHg==
X-Received: by 2002:a63:ee54:0:b0:3fe:30cc:899f with SMTP id
 n20-20020a63ee54000000b003fe30cc899fmr17762613pgk.234.1656415050695; 
 Tue, 28 Jun 2022 04:17:30 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 a8-20020a654188000000b003fd4831e6fesm9079283pgq.70.2022.06.28.04.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 04:17:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, alex.bennee@linaro.org, jiaxun.yang@flygoat.com,
 aleksandar.rikalo@syrmia.com
Subject: [PATCH v5 7/8] target/mips: Simplify UHI_argnlen and UHI_argn
Date: Tue, 28 Jun 2022 16:47:00 +0530
Message-Id: <20220628111701.677216-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628111701.677216-1-richard.henderson@linaro.org>
References: <20220628111701.677216-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With semihosting_get_arg, we already have a check vs argc, so
there's no point replicating it -- just check the result vs NULL.
Merge copy_argn_to_target into its caller.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/sysemu/mips-semi.c | 44 ++++++++++++++----------------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
index ae4b8849b1..b54267681e 100644
--- a/target/mips/tcg/sysemu/mips-semi.c
+++ b/target/mips/tcg/sysemu/mips-semi.c
@@ -198,21 +198,6 @@ static void uhi_fstat_cb(CPUState *cs, uint64_t ret, int err)
     uhi_cb(cs, ret, err);
 }
 
-static int copy_argn_to_target(CPUMIPSState *env, int arg_num,
-                               target_ulong vaddr)
-{
-    int strsize = strlen(semihosting_get_arg(arg_num)) + 1;
-    char *dst = lock_user(VERIFY_WRITE, vaddr, strsize, 0);
-    if (!dst) {
-        report_fault(env);
-    }
-
-    strcpy(dst, semihosting_get_arg(arg_num));
-
-    unlock_user(dst, vaddr, strsize);
-    return 0;
-}
-
 #define GET_TARGET_STRING(p, addr)              \
     do {                                        \
         p = lock_user_string(addr);             \
@@ -285,18 +270,31 @@ void mips_semihosting(CPUMIPSState *env)
         gpr[2] = semihosting_get_argc();
         break;
     case UHI_argnlen:
-        if (gpr[4] >= semihosting_get_argc()) {
-            gpr[2] = -1;
-            return;
+        {
+            const char *s = semihosting_get_arg(gpr[4]);
+            gpr[2] = s ? strlen(s) : -1;
         }
-        gpr[2] = strlen(semihosting_get_arg(gpr[4]));
         break;
     case UHI_argn:
-        if (gpr[4] >= semihosting_get_argc()) {
-            gpr[2] = -1;
-            return;
+        {
+            const char *s = semihosting_get_arg(gpr[4]);
+            target_ulong addr;
+            size_t len;
+
+            if (!s) {
+                gpr[2] = -1;
+                break;
+            }
+            len = strlen(s) + 1;
+            addr = gpr[5];
+            p = lock_user(VERIFY_WRITE, addr, len, 0);
+            if (!p) {
+                report_fault(env);
+            }
+            memcpy(p, s, len);
+            unlock_user(p, addr, len);
+            gpr[2] = 0;
         }
-        gpr[2] = copy_argn_to_target(env, gpr[4], gpr[5]);
         break;
 
     case UHI_plog:
-- 
2.34.1


