Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA82315B1B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 01:28:26 +0100 (CET)
Received: from localhost ([::1]:41630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9dMn-0002Og-O5
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 19:28:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cyh-0003yt-Ix
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:03:31 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:45163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cyG-00088f-Hu
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:03:31 -0500
Received: by mail-pf1-x430.google.com with SMTP id j12so86820pfj.12
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 16:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+5hZcB3mFjnWG5tCYVBAVH8vDfhhkDYHCqbXJC4msCo=;
 b=oVvv3xHmKfNbLAD3kSFvz56/Lmxi1TWeY4HCKkv8UhsqAJ560iDDx4aPfHiGIHAcMX
 0Xu5gqHjwqdJ8bJdvrQXslo0uDhMxGCz5cKkDGE0rhUHNEnLAWCYP4gBtaEVLclErV6z
 M4Q4K1ZXjfNVp3ZmN2vC01NxYnBqzXRqmQxxFiz9Pi39BelFrjjyjqL1YhTHxHA61Q3B
 yVR94FQCMYTQWC8dUzk2+Bn1ztx92iDgv7bvHfjxH/UMRkpC6/aOozWa7T/1YzK9wvMx
 nFhAJQOk/jyc+cAW/E+ITEkUu0S9MRSv9Z+BH3Mw0TkyF87klDmEEoa02xh5yOnXxbJw
 cUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+5hZcB3mFjnWG5tCYVBAVH8vDfhhkDYHCqbXJC4msCo=;
 b=kNsiU4b8I1pCx/yHabtBnL6oRkC2pjRYcs31f5kzhG7bf1QMoeGrh5JmZ093YWs6QL
 uKXHA4AO1b1vCiXUvk+jFXCvtyzGa2rcSSKgWaWdcOWAVxwQqZD/5QkB4lKoE+OIzmJB
 i6/b1jt1gc+qex6Kny2BeOLCoqz1cR+ceDtKAtGDtzgndMWP79y+voZg3SoJFg20p/tX
 9mrSpnxg086iFdmkbddpQnz4lv4sQQgmKWbcrRquKLv3QDP9vUNy7x9DDQcjdtybOE4p
 NRONSzmYNqx+cUteoPZKXRADSQBt8sIM+6zAuV+81A50l6SQPy3NSjADEmeqnTuKc3ps
 zd/g==
X-Gm-Message-State: AOAM531c5nfFcQOMHRNz4hLsPcA9fZdi/yWMCNl1nQw8luqKk2sh0gTl
 iUu/1/ScFmb+jLmUb7GYTeJiB3PMhB/S8Q==
X-Google-Smtp-Source: ABdhPJxU7g2k9TmzyB+90K1MPcsRXeHO/fxCyuJUh2gmOhEtxGyrls97AnpD+4dzrGienUvt8tL+7g==
X-Received: by 2002:a62:16cb:0:b029:1da:358c:4338 with SMTP id
 194-20020a6216cb0000b02901da358c4338mr572182pfw.36.1612915377020; 
 Tue, 09 Feb 2021 16:02:57 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id me3sm164189pjb.32.2021.02.09.16.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 16:02:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 26/31] linux-user/aarch64: Pass syndrome to EXC_*_ABORT
Date: Tue,  9 Feb 2021 16:02:18 -0800
Message-Id: <20210210000223.884088-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210000223.884088-1-richard.henderson@linaro.org>
References: <20210210000223.884088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A proper syndrome is required to fill in the proper si_code.
Use page_get_flags to determine permission vs translation for user-only.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/cpu_loop.c | 24 +++++++++++++++++++++---
 target/arm/tlb_helper.c       | 15 +++++++++------
 2 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 42b9c15f53..4e43906e66 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -23,6 +23,7 @@
 #include "cpu_loop-common.h"
 #include "qemu/guest-random.h"
 #include "hw/semihosting/common-semi.h"
+#include "target/arm/syndrome.h"
 
 #define get_user_code_u32(x, gaddr, env)                \
     ({ abi_long __r = get_user_u32((x), (gaddr));       \
@@ -76,7 +77,7 @@
 void cpu_loop(CPUARMState *env)
 {
     CPUState *cs = env_cpu(env);
-    int trapnr;
+    int trapnr, ec, fsc;
     abi_long ret;
     target_siginfo_t info;
 
@@ -117,9 +118,26 @@ void cpu_loop(CPUARMState *env)
         case EXCP_DATA_ABORT:
             info.si_signo = TARGET_SIGSEGV;
             info.si_errno = 0;
-            /* XXX: check env->error_code */
-            info.si_code = TARGET_SEGV_MAPERR;
             info._sifields._sigfault._addr = env->exception.vaddress;
+
+            /* We should only arrive here with EC in {DATAABORT, INSNABORT}. */
+            ec = syn_get_ec(env->exception.syndrome);
+            assert(ec == EC_DATAABORT || ec == EC_INSNABORT);
+
+            /* Both EC have the same format for FSC, or close enough. */
+            fsc = extract32(env->exception.syndrome, 0, 6);
+            switch (fsc) {
+            case 0x04 ... 0x07: /* Translation fault, level {0-3} */
+                info.si_code = TARGET_SEGV_MAPERR;
+                break;
+            case 0x09 ... 0x0b: /* Access flag fault, level {1-3} */
+            case 0x0d ... 0x0f: /* Permission fault, level {1-3} */
+                info.si_code = TARGET_SEGV_ACCERR;
+                break;
+            default:
+                g_assert_not_reached();
+            }
+
             queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             break;
         case EXCP_DEBUG:
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index df85079d9f..9609333cbd 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -154,21 +154,24 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                       bool probe, uintptr_t retaddr)
 {
     ARMCPU *cpu = ARM_CPU(cs);
+    ARMMMUFaultInfo fi = {};
 
 #ifdef CONFIG_USER_ONLY
-    cpu->env.exception.vaddress = address;
-    if (access_type == MMU_INST_FETCH) {
-        cs->exception_index = EXCP_PREFETCH_ABORT;
+    int flags = page_get_flags(useronly_clean_ptr(address));
+    if (flags & PAGE_VALID) {
+        fi.type = ARMFault_Permission;
     } else {
-        cs->exception_index = EXCP_DATA_ABORT;
+        fi.type = ARMFault_Translation;
     }
-    cpu_loop_exit_restore(cs, retaddr);
+
+    /* now we have a real cpu fault */
+    cpu_restore_state(cs, retaddr, true);
+    arm_deliver_fault(cpu, address, access_type, mmu_idx, &fi);
 #else
     hwaddr phys_addr;
     target_ulong page_size;
     int prot, ret;
     MemTxAttrs attrs = {};
-    ARMMMUFaultInfo fi = {};
     ARMCacheAttrs cacheattrs = {};
 
     /*
-- 
2.25.1


