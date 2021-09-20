Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7A1410E7D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 04:48:22 +0200 (CEST)
Received: from localhost ([::1]:44264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS9Lw-00085E-TT
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 22:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mS9Is-0005Cm-Ky
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 22:45:10 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:34576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mS9Iq-0008Ca-NC
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 22:45:10 -0400
Received: by mail-pf1-x42c.google.com with SMTP id g14so14936718pfm.1
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 19:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CtQUY+VgkQT1rox5MwFOniOvDKV16giSUD56+x0u+Dc=;
 b=jq+L2dnpHgrIK8wcRbWEzdX1zmYvJLjQfMVbUGR4wS88LLKplbSxzc4XWI6Aik9tJ1
 PH/bvimKg1PX70MeUorumde1SLeQgR7AmRRIjDxFihVrgnsHDg/8dAZBzByqroPcPJa1
 UH0cawgvVP3AUID2VAIcK0pAr7YYvzqyWu2cr9RDvTbmnE2Jench5Hur/ggt/6nnwExk
 9qWnipQvfkI+Kd3/7cTvJUg96W/2a5PO0XW6oDio2+RWdWB/4EBLIHApSV6Z9kTWC5cO
 a1kRrEdzysZS11olOY8N4Hra8SKhE+Aqaz8RtOwKdrIzbubzRRC61W+16bf+racCXJHB
 sGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CtQUY+VgkQT1rox5MwFOniOvDKV16giSUD56+x0u+Dc=;
 b=0u7O/08xkQlyGdP/uCUyLiyw3YGH0E0sTNc5Gfbt6marp3ajH7sl04Nbp1E1mbeqkN
 dMBnJ74YztKAlCEjVnSJntH1MZ4miLUEagCG0xhvfEUkrLrnmM/iUiuLCiakUoYuFe1K
 gWflzsnmwefz6yAYZB4NyJcjDVWg2NBxUR4sCgsBpRJTIeopkz0SR5Im+Onca++x5QMt
 hIXMByqjZPAFByfPwqGsJKc/wVt+tnMZxuz3d0GK0wx2trmJ6hqk1Zfvuel/YTgyOhHB
 uaIR1wkz4zbkGI7JJfsLPJ4LFvU/tzsLxZ06LlA8otwfpbXSXGKDExn0JYyq+6U4M1mG
 RvVg==
X-Gm-Message-State: AOAM531FbhEsHkPqg1odLz8orMMyWl0CnMtRUySBuU5Son0FfATKjvkc
 xqpePgRr5Wwc0F3hyk5kN+HIPon1fKMMtw==
X-Google-Smtp-Source: ABdhPJyYR9qBS4L93E7BENRUPkFYmrGz6MebrvpJacEv/ZYH5nfvp91CO0yiLPJezhmCh73PEO9AWw==
X-Received: by 2002:a65:6487:: with SMTP id e7mr21295360pgv.27.1632105907014; 
 Sun, 19 Sep 2021 19:45:07 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id fh3sm16164767pjb.8.2021.09.19.19.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 19:45:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/6] linux-user/aarch64: Handle EC_PCALIGNMENT
Date: Sun, 19 Sep 2021 19:44:59 -0700
Message-Id: <20210920024504.625965-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920024504.625965-1-richard.henderson@linaro.org>
References: <20210920024504.625965-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will shortly be raised for execution with a misaligned pc.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/cpu_loop.c | 44 +++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 17 deletions(-)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 11e34cb100..6e03afb2bd 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -78,7 +78,7 @@
 void cpu_loop(CPUARMState *env)
 {
     CPUState *cs = env_cpu(env);
-    int trapnr, ec, fsc, si_code;
+    int trapnr, ec, fsc, si_sig, si_code;
     abi_long ret;
 
     for (;;) {
@@ -112,28 +112,38 @@ void cpu_loop(CPUARMState *env)
             break;
         case EXCP_PREFETCH_ABORT:
         case EXCP_DATA_ABORT:
-            /* We should only arrive here with EC in {DATAABORT, INSNABORT}. */
             ec = syn_get_ec(env->exception.syndrome);
-            assert(ec == EC_DATAABORT || ec == EC_INSNABORT);
-
-            /* Both EC have the same format for FSC, or close enough. */
-            fsc = extract32(env->exception.syndrome, 0, 6);
-            switch (fsc) {
-            case 0x04 ... 0x07: /* Translation fault, level {0-3} */
-                si_code = TARGET_SEGV_MAPERR;
+            switch (ec) {
+            case EC_DATAABORT:
+            case EC_INSNABORT:
+                /* Both EC have the same format for FSC, or close enough. */
+                fsc = extract32(env->exception.syndrome, 0, 6);
+                switch (fsc) {
+                case 0x04 ... 0x07: /* Translation fault, level {0-3} */
+                    si_sig = TARGET_SIGSEGV;
+                    si_code = TARGET_SEGV_MAPERR;
+                    break;
+                case 0x09 ... 0x0b: /* Access flag fault, level {1-3} */
+                case 0x0d ... 0x0f: /* Permission fault, level {1-3} */
+                    si_sig = TARGET_SIGSEGV;
+                    si_code = TARGET_SEGV_ACCERR;
+                    break;
+                case 0x11: /* Synchronous Tag Check Fault */
+                    si_sig = TARGET_SIGSEGV;
+                    si_code = TARGET_SEGV_MTESERR;
+                    break;
+                default:
+                    g_assert_not_reached();
+                }
                 break;
-            case 0x09 ... 0x0b: /* Access flag fault, level {1-3} */
-            case 0x0d ... 0x0f: /* Permission fault, level {1-3} */
-                si_code = TARGET_SEGV_ACCERR;
-                break;
-            case 0x11: /* Synchronous Tag Check Fault */
-                si_code = TARGET_SEGV_MTESERR;
+            case EC_PCALIGNMENT:
+                si_sig = TARGET_SIGBUS;
+                si_code = TARGET_BUS_ADRALN;
                 break;
             default:
                 g_assert_not_reached();
             }
-
-            force_sig_fault(TARGET_SIGSEGV, si_code, env->exception.vaddress);
+            force_sig_fault(si_sig, si_code, env->exception.vaddress);
             break;
         case EXCP_DEBUG:
         case EXCP_BKPT:
-- 
2.25.1


