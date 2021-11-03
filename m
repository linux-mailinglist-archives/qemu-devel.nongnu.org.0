Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CBA444356
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 15:22:00 +0100 (CET)
Received: from localhost ([::1]:37792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miH9L-00074h-Mr
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 10:21:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwk-0002GK-5p
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:08:58 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:38590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwh-00053w-VU
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:08:57 -0400
Received: by mail-qt1-x833.google.com with SMTP id h4so928292qth.5
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 07:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eorTYpTGmRMqlosPMgNCUx4CrYGaNy55bmumMBNoYKc=;
 b=Yq8iQ5in0C1NgWCyi9rfpzWeJSg4FUhC4iIHgo3iRskj1bG87UemKVpqCt6S1AbUWO
 D/80g1PjaMLY50gA76/8kEmuIR58LWQfdkIzSLb+mWvXAO7s/Q6QJZFGFogY3TCmTZjo
 GySzlng4kxDrbY8d7D1z65a5UIGFE9fJIW2kWo3aYwKdif2LZiYaplwPAArw+ccNkPfb
 kFXjb47xkghTzv+/Zc0sw+ojO/RBG5tOpWzSM73t6Pe3aId4gK0xKw1eZjIi9X4CtmIQ
 NxLZ9T1Yo6fco3weYs0RQXlNgyNV6GMOIhXwzRN48XWHc9joRqiy/H1rRjULfIuRo3/y
 e53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eorTYpTGmRMqlosPMgNCUx4CrYGaNy55bmumMBNoYKc=;
 b=11ZsbUOmrKRQtb4/MTIGjJEFnRL2l78NuRPWaAmEjV3vZ8Yxa1nsHAyp+xSJGW5Qkk
 Md3k1i05hQWQrg+oV80AaqKg/hRiGA8rPU2waqBNQHD+39TYSGB9ty5SUgBYmlkweAS0
 ZDMtmFPpXPO6UU6/5JAc0OSvqKYlYGYilDIkcQS3tgvMXXkL3o02BWb/tHok6rO88RzA
 DLUFP80gBh2tdi+xrC128iS0mGm1LbPh5uoWwLLEy0pKUeJTj8L6NvIgytxtn000T4ls
 gCp+G89BOgIHJKXrwfru0at/jPYuO/fhd/ouyOOZOOIuJd1LFEKfgzqhWEMsbquPAIor
 yXtg==
X-Gm-Message-State: AOAM5309q54ZIhhaw7vlgQlb76jLiDFMQdGrKm6gSjxiAu32JzCST3EN
 zAYm7aPzAQLgysM8x/5okv8xwnnV8qJ3yg==
X-Google-Smtp-Source: ABdhPJyFCeU7g0PFR/6QdrMX3LfSVo/9mL2fFGJp4rbjvYOBHeCs0Idj63EUOFhENWHoSAbnuhrOVg==
X-Received: by 2002:ac8:5bd3:: with SMTP id b19mr27869626qtb.153.1635948534028; 
 Wed, 03 Nov 2021 07:08:54 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id z5sm1669377qtw.71.2021.11.03.07.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 07:08:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/23] linux-user/i386: Split out maybe_handle_vm86_trap
Date: Wed,  3 Nov 2021 10:08:32 -0400
Message-Id: <20211103140847.454070-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103140847.454070-1-richard.henderson@linaro.org>
References: <20211103140847.454070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x833.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reduce the number of ifdefs within cpu_loop().

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/i386/cpu_loop.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
index f6a1cc632b..a372cfe1b2 100644
--- a/linux-user/i386/cpu_loop.c
+++ b/linux-user/i386/cpu_loop.c
@@ -198,6 +198,17 @@ static void emulate_vsyscall(CPUX86State *env)
 }
 #endif
 
+static bool maybe_handle_vm86_trap(CPUX86State *env, int trapnr)
+{
+#ifndef TARGET_X86_64
+    if (env->eflags & VM_MASK) {
+        handle_vm86_trap(env, trapnr);
+        return true;
+    }
+#endif
+    return false;
+}
+
 void cpu_loop(CPUX86State *env)
 {
     CPUState *cs = env_cpu(env);
@@ -259,12 +270,9 @@ void cpu_loop(CPUX86State *env)
             break;
         case EXCP0D_GPF:
             /* XXX: potential problem if ABI32 */
-#ifndef TARGET_X86_64
-            if (env->eflags & VM_MASK) {
-                handle_vm86_fault(env);
+            if (maybe_handle_vm86_trap(env, trapnr)) {
                 break;
             }
-#endif
             gen_signal(env, TARGET_SIGSEGV, TARGET_SI_KERNEL, 0);
             break;
         case EXCP0E_PAGE:
@@ -274,22 +282,16 @@ void cpu_loop(CPUX86State *env)
                        env->cr[2]);
             break;
         case EXCP00_DIVZ:
-#ifndef TARGET_X86_64
-            if (env->eflags & VM_MASK) {
-                handle_vm86_trap(env, trapnr);
+            if (maybe_handle_vm86_trap(env, trapnr)) {
                 break;
             }
-#endif
             gen_signal(env, TARGET_SIGFPE, TARGET_FPE_INTDIV, env->eip);
             break;
         case EXCP01_DB:
         case EXCP03_INT3:
-#ifndef TARGET_X86_64
-            if (env->eflags & VM_MASK) {
-                handle_vm86_trap(env, trapnr);
+            if (maybe_handle_vm86_trap(env, trapnr)) {
                 break;
             }
-#endif
             if (trapnr == EXCP01_DB) {
                 gen_signal(env, TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->eip);
             } else {
@@ -298,12 +300,9 @@ void cpu_loop(CPUX86State *env)
             break;
         case EXCP04_INTO:
         case EXCP05_BOUND:
-#ifndef TARGET_X86_64
-            if (env->eflags & VM_MASK) {
-                handle_vm86_trap(env, trapnr);
+            if (maybe_handle_vm86_trap(env, trapnr)) {
                 break;
             }
-#endif
             gen_signal(env, TARGET_SIGSEGV, TARGET_SI_KERNEL, 0);
             break;
         case EXCP06_ILLOP:
-- 
2.25.1


