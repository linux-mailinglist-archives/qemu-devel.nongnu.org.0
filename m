Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CF03F3C60
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 22:05:49 +0200 (CEST)
Received: from localhost ([::1]:52730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHXFU-0001kf-Hi
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 16:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHXA0-0002Es-WC
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 16:00:09 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:42861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHX9v-0004UM-Lk
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 16:00:08 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 mq2-20020a17090b3802b0290178911d298bso9504990pjb.1
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 13:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nW9fMChnRBXVS7c8vZgjblWrAXidwfTLKIZtt2ybyaE=;
 b=N/A6BnybYHaEQ0iErEI5N9lHcQCR1qT0aUkfWVo35cgh9mNImUZNbfE6yQYSN3mL5X
 N2c97P5BfN4DqnKC+5ZKMcldTVoNDQaHLP6b/TFu9SDHZ2T7JxId4thCzOS/jPX8juwN
 P529i7ge1OTyybd2JThNWAz76YlmwIi5NTByU+gq/e9cvDdoXO4pxwvirHSj8FNJrnW0
 nJ7hkTrlhC0EW9zbiId+rEkmt7aGHu8M1eQRVzaPntCLbN1VKwFOV8B2nRU6r3ascUjr
 c7/GihWKYXGnB2P8Q6vsPzOChhtMA//pyfRkqMIqHnteeL/susz8Oi1EaGR6cmyJb7NP
 5ZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nW9fMChnRBXVS7c8vZgjblWrAXidwfTLKIZtt2ybyaE=;
 b=RWPNLDgn50a3+SJNbxv+rhtCxkf0mfxXVuMzqyPO5sWEk6kFrBBQ2BhZHpLZJ/yEvh
 fn0n0KwV9uJKoXVYG3kmlwx+3fWYjUCzncKy/vK59sp1APY1n6OkPZcZ/pZBDmii0CJt
 fQhaf2GJALvFte4l8gAmGEiLwrO9+IBl1iY+1P2HR8FC5pXADyUGzZzzuJcELt+pgjgb
 IA6YZSmHUMnbixSsHeZGBtCsRrqe/pxFdCOnPu0F72dW43XUG0yH+j9tiDvOz982vbiP
 AJzOJqJU3PmxQGuffdUfYup+l0BmwYr/IycIDf7PeNxfCkJ5U0jzv3zLv5uPBCRW2KPP
 4WcQ==
X-Gm-Message-State: AOAM5337EL38UkbeQJCRNEOfMkzOxADn9cd/m6ug4WUg7CDgNKUyki9z
 OC0Brp6Cs75RV6tLXElMv/x/RCcF4sdGFw==
X-Google-Smtp-Source: ABdhPJzY1Vt5SIVoFMAbxxJCNHikIMXVUTkZYTvUj61PV6BWsxz/1Xm0fUc30Wr6NDW5E5Qv/XuWAA==
X-Received: by 2002:a17:90a:d814:: with SMTP id
 a20mr7933793pjv.130.1629576002369; 
 Sat, 21 Aug 2021 13:00:02 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id h13sm12562257pgh.93.2021.08.21.13.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 13:00:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/8] linux-user/arm: Report SIGBUS and SIGSEGV correctly
Date: Sat, 21 Aug 2021 12:59:54 -0700
Message-Id: <20210821195958.41312-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210821195958.41312-1-richard.henderson@linaro.org>
References: <20210821195958.41312-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pull the fault information from where we placed it, in
arm_cpu_tlb_fill and arm_cpu_do_unaligned_access.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Pulled out from the larger unaligned data patch set.
For short-form FSC, pc misalignment is reported in the same way.
---
 linux-user/arm/cpu_loop.c | 39 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index d4b4f0c71f..5731d3c937 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -24,6 +24,7 @@
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 #include "semihosting/common-semi.h"
+#include "target/arm/syndrome.h"
 
 #define get_user_code_u32(x, gaddr, env)                \
     ({ abi_long __r = get_user_u32((x), (gaddr));       \
@@ -279,8 +280,8 @@ static bool emulate_arm_fpa11(CPUARMState *env, uint32_t opcode)
 void cpu_loop(CPUARMState *env)
 {
     CPUState *cs = env_cpu(env);
-    int trapnr;
-    unsigned int n, insn;
+    int trapnr, si_signo, si_code;
+    unsigned int n, insn, ec, fsc;
     abi_ulong ret;
 
     for(;;) {
@@ -422,9 +423,37 @@ void cpu_loop(CPUARMState *env)
             break;
         case EXCP_PREFETCH_ABORT:
         case EXCP_DATA_ABORT:
-            /* XXX: check env->error_code */
-            force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_MAPERR,
-                            env->exception.vaddress);
+            /*
+             * For user-only we don't set TTBCR_EAE, so we always get
+             * short-form FSC, which then tells us to look at the FSR.
+             */
+            ec = syn_get_ec(env->exception.syndrome);
+            assert(ec == EC_DATAABORT || ec == EC_INSNABORT);
+            fsc = extract32(env->exception.syndrome, 0, 6);
+            assert(fsc == 0x3f);
+            switch (env->exception.fsr & 0x1f) {
+            case 0x1: /* Alignment */
+                si_signo = TARGET_SIGBUS;
+                si_code = TARGET_BUS_ADRALN;
+                break;
+            case 0x3: /* Access flag fault, level 1 */
+            case 0x6: /* Access flag fault, level 2 */
+            case 0x9: /* Domain fault, level 1 */
+            case 0xb: /* Domain fault, level 2 */
+            case 0xd: /* Permision fault, level 1 */
+            case 0xf: /* Permision fault, level 2 */
+                si_signo = TARGET_SIGSEGV;
+                si_code = TARGET_SEGV_ACCERR;
+                break;
+            case 0x5: /* Translation fault, level 1 */
+            case 0x7: /* Translation fault, level 2 */
+                si_signo = TARGET_SIGSEGV;
+                si_code = TARGET_SEGV_MAPERR;
+                break;
+            default:
+                g_assert_not_reached();
+            }
+            force_sig_fault(si_signo, si_code, env->exception.vaddress);
             break;
         case EXCP_DEBUG:
         case EXCP_BKPT:
-- 
2.25.1


