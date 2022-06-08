Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E62D5542145
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 07:33:02 +0200 (CEST)
Received: from localhost ([::1]:53984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyoJS-0004kY-0Y
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 01:33:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyo6p-0006zg-Nf
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 01:19:59 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:34584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyo6n-00023x-5Y
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 01:19:59 -0400
Received: by mail-pf1-x436.google.com with SMTP id c196so17413536pfb.1
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 22:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qIoo0LzyvHSUbYXwQZj3nHuBOs19Duk2E4Vx8ekmqlk=;
 b=q6r5wPFTvsqXnIBveexZxvp4k6gm/9xxQXvVVoMje8uveB2lxPwPsG49B9BexbOwbe
 4yjy4sOopC+2wb+JYmzrXXMbYTwc1odjZWsV1McE6X0OPyg/oLOSHd/9ug3jgCS+Rkvz
 Srtp+XCA/QbqDRML/R+diJO242a9/eRWwTv/EshsHDM8cdCfofvLyvpTzLUPW4X04Pn+
 E5rqktwNLSrAEOGdUmouiotxF5pC6BOxg5T9C20DbAkWMXeS8fIRkcM6TW9nKuTwXSBz
 2XXdDvWi+9yPBt385RoXvxUX9OyQGU3N/sLX/WaWdh94Cv7pgSljWuCbNKy5EWAKHXXg
 gbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qIoo0LzyvHSUbYXwQZj3nHuBOs19Duk2E4Vx8ekmqlk=;
 b=xTQpgEk8Sa42TrBYYnLO0CAIzcNFT1A7tmEBqzZRekEubCYrozSQV55Fk/3yvSX2PV
 Bg05LOZaE4FJxXQNNcZTUDOV6WWGRKfbUFjgjk2pryvXdiPr4JTYUWg3RL/ZA2AhrPa1
 EEcy4tZM/dMEEeO8QI6JH+sAYgdPgyBDns9VEpm1OL40xHWrCMJNvzBpDVa4/hRzIHlw
 FeE3L84gf7R0OcnhRGiVWhpxq1RUmpc5+7gPPYGFBlRkL+hrWUh4x+vQMbRxfoC2X3uV
 39KbXKqpVwRFkLE3+A+822rAd7rGBPauyGZ580rXDNrGatLMvIxFpS95Ousn5X8Gf+Nl
 ETgg==
X-Gm-Message-State: AOAM531P3dmokzNBBypVNIPGshOT61vBiO92xXV7X2bhLTP2/IkbhzYW
 bkIrJHywLFp5F4U/GOSq1MYauaX3DR48zQ==
X-Google-Smtp-Source: ABdhPJzInboqWhAneSHUeg9CAylmFnAHeM0uqaLj35N62Y04XMwOg+0H24stJtE0fKRx25grKG0nUA==
X-Received: by 2002:a63:210e:0:b0:3fd:9c07:7670 with SMTP id
 h14-20020a63210e000000b003fd9c077670mr14256096pgh.222.1654665595764; 
 Tue, 07 Jun 2022 22:19:55 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:c626:2f70:ac99:7c97])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a170902d58800b001641244d051sm13378807plh.257.2022.06.07.22.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 22:19:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org
Subject: [PATCH v4 10/11] target/mips: Simplify UHI_argnlen and UHI_argn
Date: Tue,  7 Jun 2022 22:19:44 -0700
Message-Id: <20220608051945.802339-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220608051945.802339-1-richard.henderson@linaro.org>
References: <20220608051945.802339-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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


