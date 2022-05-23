Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0BA531D36
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 22:58:42 +0200 (CEST)
Received: from localhost ([::1]:46896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntF8S-0004Zn-Lw
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 16:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEy4-0008O6-Gx
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:48:00 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:53017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEy2-00052C-Ii
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:47:56 -0400
Received: by mail-pj1-x1032.google.com with SMTP id l14so15064557pjk.2
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 13:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EfHC5sh/pejKXX57jmwQUPJC/F0imk6n0vf48RAawTc=;
 b=eD9YlSJ/LV1T585l5ykRzRgfChRcnUsqJpUsRBjA2AyjXiKcgB8xpiyASEIVhM6HFj
 xpbc+MeK21D+OB38BbNLXJag1sBTQtxKOmyzZq2aqrDkVyZgvOGKFsySfAJBDJlayyok
 +q9brb+s+qo/d+FKE2PbY6QmcZSIwjE5aVSzyhSv7KfskGh8cFVtbs1h/bFK7mZpGj1d
 Ig79tFeUndaA0InrEFTNgs+BIbbZsxeNonKqRPkXnKqtk9TiH3fUJBCy8ClWEbx8l5pr
 bhWeCnWq3Yt3c71e2fFAIPx2VoFHDEPh6JFvGFsLO7zqVHk0fnEbMSvDFAmQR8t6ido7
 5NCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EfHC5sh/pejKXX57jmwQUPJC/F0imk6n0vf48RAawTc=;
 b=2YSHhP9klpAT9dm9RpyfgAa8D5T3Mm4DEn/zrwoHdbd/Vsn+Kcijr5ZCLl49RKxEhK
 iCOZkenVLSysX5UKdjg0hLpFbzZMg9EapnaiOHd3EP7Ii56KN6Lipco6svO8dCzqTDrf
 CLgw+sZYwKU8TbTUA5hgFwxrYlfoeZ49G1oPQVeKZbviEkvd8WemxI0Mj9p2lFE5zthL
 Kqy10gx45br9DapvGA3Ve2OLE32cKkX9qwyJhVo7ExwKzIU2cbUeXcCag1BwsPq9zzJp
 olPSVmMwnN4Y2EE3Nn/DYEk/YxucdN1QpQ3dIwbzpLz3bOCr12Q+2v1EOhNswy8hY0BO
 0GHw==
X-Gm-Message-State: AOAM530qnh2NPNPhhT9DYJUhPn85KpzW2dxaLRY3Em6eeZ8GtUDUFU75
 fnd482U+KEqbSjOcr5Q+/ZweZDj8ltF7nw==
X-Google-Smtp-Source: ABdhPJwm6vsUIubKxoc6ZzaeWrIoevY34XLtGjIfEZ4qHQgEFuszRsXSakBdAayvEjxUxHXcHizx7g==
X-Received: by 2002:a17:902:9b94:b0:161:5a74:aa6c with SMTP id
 y20-20020a1709029b9400b001615a74aa6cmr24005748plp.108.1653338873311; 
 Mon, 23 May 2022 13:47:53 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 c16-20020a624e10000000b0050dc7628142sm7721788pfb.28.2022.05.23.13.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 13:47:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 09/18] target/arm: Move exception_bkpt_insn to debug_helper.c
Date: Mon, 23 May 2022 13:47:33 -0700
Message-Id: <20220523204742.740932-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220523204742.740932-1-richard.henderson@linaro.org>
References: <20220523204742.740932-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/debug_helper.c | 31 +++++++++++++++++++++++++++++++
 target/arm/op_helper.c    | 29 -----------------------------
 2 files changed, 31 insertions(+), 29 deletions(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 3a86901779..bdcd5f36d6 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -429,6 +429,37 @@ void arm_debug_excp_handler(CPUState *cs)
     }
 }
 
+/*
+ * Raise an EXCP_BKPT with the specified syndrome register value,
+ * targeting the correct exception level for debug exceptions.
+ */
+void HELPER(exception_bkpt_insn)(CPUARMState *env, uint32_t syndrome)
+{
+    int debug_el = arm_debug_target_el(env);
+    int cur_el = arm_current_el(env);
+
+    /* FSR will only be used if the debug target EL is AArch32. */
+    env->exception.fsr = arm_debug_exception_fsr(env);
+    /*
+     * FAR is UNKNOWN: clear vaddress to avoid potentially exposing
+     * values to the guest that it shouldn't be able to see at its
+     * exception/security level.
+     */
+    env->exception.vaddress = 0;
+    /*
+     * Other kinds of architectural debug exception are ignored if
+     * they target an exception level below the current one (in QEMU
+     * this is checked by arm_generate_debug_exceptions()). Breakpoint
+     * instructions are special because they always generate an exception
+     * to somewhere: if they can't go to the configured debug exception
+     * level they are taken to the current exception level.
+     */
+    if (debug_el < cur_el) {
+        debug_el = cur_el;
+    }
+    raise_exception(env, EXCP_BKPT, syndrome, debug_el);
+}
+
 #if !defined(CONFIG_USER_ONLY)
 
 vaddr arm_adjust_watchpoint_address(CPUState *cs, vaddr addr, int len)
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 55440dfa84..0a50dbf274 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -413,35 +413,6 @@ void HELPER(exception_with_syndrome)(CPUARMState *env, uint32_t excp,
     raise_exception(env, excp, syndrome, target_el);
 }
 
-/* Raise an EXCP_BKPT with the specified syndrome register value,
- * targeting the correct exception level for debug exceptions.
- */
-void HELPER(exception_bkpt_insn)(CPUARMState *env, uint32_t syndrome)
-{
-    int debug_el = arm_debug_target_el(env);
-    int cur_el = arm_current_el(env);
-
-    /* FSR will only be used if the debug target EL is AArch32. */
-    env->exception.fsr = arm_debug_exception_fsr(env);
-    /* FAR is UNKNOWN: clear vaddress to avoid potentially exposing
-     * values to the guest that it shouldn't be able to see at its
-     * exception/security level.
-     */
-    env->exception.vaddress = 0;
-    /*
-     * Other kinds of architectural debug exception are ignored if
-     * they target an exception level below the current one (in QEMU
-     * this is checked by arm_generate_debug_exceptions()). Breakpoint
-     * instructions are special because they always generate an exception
-     * to somewhere: if they can't go to the configured debug exception
-     * level they are taken to the current exception level.
-     */
-    if (debug_el < cur_el) {
-        debug_el = cur_el;
-    }
-    raise_exception(env, EXCP_BKPT, syndrome, debug_el);
-}
-
 uint32_t HELPER(cpsr_read)(CPUARMState *env)
 {
     return cpsr_read(env) & ~CPSR_EXEC;
-- 
2.34.1


