Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CA93EB60F
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 15:26:53 +0200 (CEST)
Received: from localhost ([::1]:49286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEXD2-00045s-HT
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 09:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEX4m-00063H-JA
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 09:18:22 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:39852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEX4k-0001Bg-Ft
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 09:18:20 -0400
Received: by mail-wr1-x42f.google.com with SMTP id q6so1750872wrv.6
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 06:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FaVpNm4zi8LBLF74GF2v06M6jAfCJGSvBMAfoKeKoug=;
 b=VOaLi687fL6Is7ILAK3PKrUw3xskbJEMqf2kZdrf1Gr08zJIzt4R+rkRJtYjplg26g
 u2MK7poz6mnWwSRliLVouV2CblX5gFGKwrCYDxpYBfgWYDwu/t101sYG72Tpw3ZSPW0A
 6HsXDsXxN/ERbko1IqZ+7LMerfw2jbnMgfBevG7EOhGAp7YkkNK/qYYfYSeiVJFDzRxL
 u0FcgX7DiA3SwTyfXqKwJvkp2KF6To9jbpUq4EKPUtQTd4bx1LewVIg3S9V2X/Y63OwU
 exf/hLuKkgDE3DmsWkVfOyQV195mcBJi14D5oZgpPklYj/ysOoNbcbVwYMkiFf0O/yC2
 OjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FaVpNm4zi8LBLF74GF2v06M6jAfCJGSvBMAfoKeKoug=;
 b=X1fF/lLF3BCzg73eoWcWQSkwtaunvYT9IP/Rb+fTZ3cwF2feJitWEmCRDNHffCtfd5
 1SI0Arx/rwocC6+FAHn0AHLqTPCNYu4J5IaxxHiFbaonqKE+caW6jOHfXbu3NNwfj4iM
 D8m+JZbx2D6MCUMb8p5hlcyt6DnRR03EQb6KSr434izCydFN+BNQJi5cYZtNvgdU6dIf
 sW1PoIxuZgk7inCMf8WTwP1LnQjxtWMavI8/EOgXnbFzqxDNmjS1leqfdqILgkM0E9Tz
 uoFbQHCO+7Lstz3Juhn24DurQb4oNEBETRx3txRKjhm+S3YLFUTGfZeWGLCHhHbwRlCC
 fDqA==
X-Gm-Message-State: AOAM530BeH4J2pTW0ugq9HOCfhnU9FtHctL5bRQkrgoBLLsetyrrvwIe
 Ze6Ax1byygWqLj/Q0XA1yosvvqEtqr2G0g==
X-Google-Smtp-Source: ABdhPJzAp/qvARIkWgQRX7un8A2esKETp6DyePAEVActL5hXTEk5d2WScRdDv6OG8xJs85afql+mzg==
X-Received: by 2002:adf:fb8f:: with SMTP id a15mr3151012wrr.92.1628860697168; 
 Fri, 13 Aug 2021 06:18:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q75sm1585705wme.40.2021.08.13.06.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 06:18:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 7/7] linux-user/aarch64: Use force_sig_fault()
Date: Fri, 13 Aug 2021 14:18:09 +0100
Message-Id: <20210813131809.28655-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210813131809.28655-1-peter.maydell@linaro.org>
References: <20210813131809.28655-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new force_sig_fault() function instead of setting up
a target_siginfo_t and calling queue_signal().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/aarch64/cpu_loop.c | 34 +++++++++-------------------------
 1 file changed, 9 insertions(+), 25 deletions(-)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 5d8675944d9..11e34cb1007 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 #include "qemu/guest-random.h"
 #include "semihosting/common-semi.h"
 #include "target/arm/syndrome.h"
@@ -77,9 +78,8 @@
 void cpu_loop(CPUARMState *env)
 {
     CPUState *cs = env_cpu(env);
-    int trapnr, ec, fsc;
+    int trapnr, ec, fsc, si_code;
     abi_long ret;
-    target_siginfo_t info;
 
     for (;;) {
         cpu_exec_start(cs);
@@ -108,18 +108,10 @@ void cpu_loop(CPUARMState *env)
             /* just indicate that signals should be handled asap */
             break;
         case EXCP_UDEF:
-            info.si_signo = TARGET_SIGILL;
-            info.si_errno = 0;
-            info.si_code = TARGET_ILL_ILLOPN;
-            info._sifields._sigfault._addr = env->pc;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->pc);
             break;
         case EXCP_PREFETCH_ABORT:
         case EXCP_DATA_ABORT:
-            info.si_signo = TARGET_SIGSEGV;
-            info.si_errno = 0;
-            info._sifields._sigfault._addr = env->exception.vaddress;
-
             /* We should only arrive here with EC in {DATAABORT, INSNABORT}. */
             ec = syn_get_ec(env->exception.syndrome);
             assert(ec == EC_DATAABORT || ec == EC_INSNABORT);
@@ -128,28 +120,24 @@ void cpu_loop(CPUARMState *env)
             fsc = extract32(env->exception.syndrome, 0, 6);
             switch (fsc) {
             case 0x04 ... 0x07: /* Translation fault, level {0-3} */
-                info.si_code = TARGET_SEGV_MAPERR;
+                si_code = TARGET_SEGV_MAPERR;
                 break;
             case 0x09 ... 0x0b: /* Access flag fault, level {1-3} */
             case 0x0d ... 0x0f: /* Permission fault, level {1-3} */
-                info.si_code = TARGET_SEGV_ACCERR;
+                si_code = TARGET_SEGV_ACCERR;
                 break;
             case 0x11: /* Synchronous Tag Check Fault */
-                info.si_code = TARGET_SEGV_MTESERR;
+                si_code = TARGET_SEGV_MTESERR;
                 break;
             default:
                 g_assert_not_reached();
             }
 
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGSEGV, si_code, env->exception.vaddress);
             break;
         case EXCP_DEBUG:
         case EXCP_BKPT:
-            info.si_signo = TARGET_SIGTRAP;
-            info.si_errno = 0;
-            info.si_code = TARGET_TRAP_BRKPT;
-            info._sifields._sigfault._addr = env->pc;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
             break;
         case EXCP_SEMIHOST:
             env->xregs[0] = do_common_semihosting(cs);
@@ -169,11 +157,7 @@ void cpu_loop(CPUARMState *env)
         /* Check for MTE asynchronous faults */
         if (unlikely(env->cp15.tfsr_el[0])) {
             env->cp15.tfsr_el[0] = 0;
-            info.si_signo = TARGET_SIGSEGV;
-            info.si_errno = 0;
-            info._sifields._sigfault._addr = 0;
-            info.si_code = TARGET_SEGV_MTEAERR;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_MTEAERR, 0);
         }
 
         process_pending_signals(env);
-- 
2.20.1


