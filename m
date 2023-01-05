Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E0665F173
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 17:50:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTMS-0000y8-Bo; Thu, 05 Jan 2023 11:45:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTM6-0000ds-U6
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:41 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTM5-0007Qs-9B
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:38 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so1747935wmb.2
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=aTsMmCJLl94F3lARaNShxP5uscfsUduynI0oR3AN0iE=;
 b=tqxdM7VT1/X+UCcqkT4f3GcDHMSUhVRvu6OnYzI6pa2ZUKOy+HVEPdj4JR8OcrM2IL
 vHEYwzH2K8GNItFP9l5DbSFf9xg9cg8MgWKKrjNco4RCbfXSEMW7ozGEzoplVQQmCMOU
 GqR2rlrWe8nfDCTKNcaW3Rddjxzm2gaLrNahnGCDoicHkKjzUOUHdlTmxCpM/lL3KJFX
 rVwLO8Mc4gZ1kvNtZSe5u0z/JTcDJkkfi18OHxtPM43F7R9ZnOTe6W50L+jSFCiGeZf3
 3UtNsohuFE/33HpfIHuLI0kzRg3osxOWlwu8l3XIT3EKzLNR9t/Aq7EXOOCAjICKCKFp
 fqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aTsMmCJLl94F3lARaNShxP5uscfsUduynI0oR3AN0iE=;
 b=3SN1oxZ9htKUjn86kwX3+KusFj67AiSMQ4wtmaeGJ0mCdZwSnDfAHa/Fqvd74UIuCa
 fNwgDgVMCxmF28OlWN3vR3m81FYY3QT1ZDX3UN0o38Q+LbLEW9Z3Q/WJ320AbmNCqmUF
 PLVIbL0bV62J6e4u7DxrCYXaZnhsdzgc819/P0hOWNqYGO0R4Rt9EU4xuuJMo5KsDON4
 jh72Tpf3TxoI6Y3A17Q1Qtri8xS0tmHaEWMuhDgjt048w5bghMflX84/HZ4om1YMx2hx
 s/SexdlTqZyd7F5OJ3eY+eDUaLuBPbfrdXAvgzjXQ374RB2Ydo693J/rgQzk2cw3NQPz
 joLg==
X-Gm-Message-State: AFqh2kpHCiGbViyihxBoM2+4P9sN4tPBqXaMpdLxASVUPA8XRSIRUJnz
 2Zn1LAO7zn46H0vPyj73gOuwvLeQRXe0AqSW
X-Google-Smtp-Source: AMrXdXvjJHVsKHpKQ/Ny0xKUtVECF0D0TlcFklC70LX4tAmKtESlsdqvLOrjBTty3+T7uE/ezwLI2g==
X-Received: by 2002:a05:600c:3506:b0:3cf:803b:d7cc with SMTP id
 h6-20020a05600c350600b003cf803bd7ccmr39920959wmq.33.1672937075999; 
 Thu, 05 Jan 2023 08:44:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 hg9-20020a05600c538900b003cf71b1f66csm3055547wmb.0.2023.01.05.08.44.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:44:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/34] target/arm: Fix checkpatch brace errors in helper.c
Date: Thu,  5 Jan 2023 16:44:03 +0000
Message-Id: <20230105164417.3994639-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105164417.3994639-1-peter.maydell@linaro.org>
References: <20230105164417.3994639-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Fabiano Rosas <farosas@suse.de>

Fix this:
ERROR: braces {} are necessary for all arms of this statement

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Message-id: 20221213190537.511-4-farosas@suse.de
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 67 ++++++++++++++++++++++++++++-----------------
 1 file changed, 42 insertions(+), 25 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8f1cc2d7cfb..5d8971aa51e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9461,10 +9461,12 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
         env->CF = (val >> 29) & 1;
         env->VF = (val << 3) & 0x80000000;
     }
-    if (mask & CPSR_Q)
+    if (mask & CPSR_Q) {
         env->QF = ((val & CPSR_Q) != 0);
-    if (mask & CPSR_T)
+    }
+    if (mask & CPSR_T) {
         env->thumb = ((val & CPSR_T) != 0);
+    }
     if (mask & CPSR_IT_0_1) {
         env->condexec_bits &= ~3;
         env->condexec_bits |= (val >> 25) & 3;
@@ -9669,8 +9671,9 @@ static void switch_mode(CPUARMState *env, int mode)
     int i;
 
     old_mode = env->uncached_cpsr & CPSR_M;
-    if (mode == old_mode)
+    if (mode == old_mode) {
         return;
+    }
 
     if (old_mode == ARM_CPU_MODE_FIQ) {
         memcpy(env->fiq_regs, env->regs + 8, 5 * sizeof(uint32_t));
@@ -10276,10 +10279,11 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
         new_mode = ARM_CPU_MODE_UND;
         addr = 0x04;
         mask = CPSR_I;
-        if (env->thumb)
+        if (env->thumb) {
             offset = 2;
-        else
+        } else {
             offset = 4;
+        }
         break;
     case EXCP_SWI:
         new_mode = ARM_CPU_MODE_SVC;
@@ -11070,10 +11074,11 @@ static inline uint16_t add16_sat(uint16_t a, uint16_t b)
 
     res = a + b;
     if (((res ^ a) & 0x8000) && !((a ^ b) & 0x8000)) {
-        if (a & 0x8000)
+        if (a & 0x8000) {
             res = 0x8000;
-        else
+        } else {
             res = 0x7fff;
+        }
     }
     return res;
 }
@@ -11085,10 +11090,11 @@ static inline uint8_t add8_sat(uint8_t a, uint8_t b)
 
     res = a + b;
     if (((res ^ a) & 0x80) && !((a ^ b) & 0x80)) {
-        if (a & 0x80)
+        if (a & 0x80) {
             res = 0x80;
-        else
+        } else {
             res = 0x7f;
+        }
     }
     return res;
 }
@@ -11100,10 +11106,11 @@ static inline uint16_t sub16_sat(uint16_t a, uint16_t b)
 
     res = a - b;
     if (((res ^ a) & 0x8000) && ((a ^ b) & 0x8000)) {
-        if (a & 0x8000)
+        if (a & 0x8000) {
             res = 0x8000;
-        else
+        } else {
             res = 0x7fff;
+        }
     }
     return res;
 }
@@ -11115,10 +11122,11 @@ static inline uint8_t sub8_sat(uint8_t a, uint8_t b)
 
     res = a - b;
     if (((res ^ a) & 0x80) && ((a ^ b) & 0x80)) {
-        if (a & 0x80)
+        if (a & 0x80) {
             res = 0x80;
-        else
+        } else {
             res = 0x7f;
+        }
     }
     return res;
 }
@@ -11136,34 +11144,38 @@ static inline uint16_t add16_usat(uint16_t a, uint16_t b)
 {
     uint16_t res;
     res = a + b;
-    if (res < a)
+    if (res < a) {
         res = 0xffff;
+    }
     return res;
 }
 
 static inline uint16_t sub16_usat(uint16_t a, uint16_t b)
 {
-    if (a > b)
+    if (a > b) {
         return a - b;
-    else
+    } else {
         return 0;
+    }
 }
 
 static inline uint8_t add8_usat(uint8_t a, uint8_t b)
 {
     uint8_t res;
     res = a + b;
-    if (res < a)
+    if (res < a) {
         res = 0xff;
+    }
     return res;
 }
 
 static inline uint8_t sub8_usat(uint8_t a, uint8_t b)
 {
-    if (a > b)
+    if (a > b) {
         return a - b;
-    else
+    } else {
         return 0;
+    }
 }
 
 #define ADD16(a, b, n) RESULT(add16_usat(a, b), n, 16);
@@ -11267,10 +11279,11 @@ static inline uint8_t sub8_usat(uint8_t a, uint8_t b)
 
 static inline uint8_t do_usad(uint8_t a, uint8_t b)
 {
-    if (a > b)
+    if (a > b) {
         return a - b;
-    else
+    } else {
         return b - a;
+    }
 }
 
 /* Unsigned sum of absolute byte differences.  */
@@ -11290,14 +11303,18 @@ uint32_t HELPER(sel_flags)(uint32_t flags, uint32_t a, uint32_t b)
     uint32_t mask;
 
     mask = 0;
-    if (flags & 1)
+    if (flags & 1) {
         mask |= 0xff;
-    if (flags & 2)
+    }
+    if (flags & 2) {
         mask |= 0xff00;
-    if (flags & 4)
+    }
+    if (flags & 4) {
         mask |= 0xff0000;
-    if (flags & 8)
+    }
+    if (flags & 8) {
         mask |= 0xff000000;
+    }
     return (a & mask) | (b & ~mask);
 }
 
-- 
2.25.1


