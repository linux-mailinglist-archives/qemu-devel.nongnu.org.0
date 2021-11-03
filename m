Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 286874443A8
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 15:34:27 +0100 (CET)
Received: from localhost ([::1]:38712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miHLO-00028E-Bh
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 10:34:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwt-0002lg-0n
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:09:07 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:38746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwr-0005C7-3D
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:09:06 -0400
Received: by mail-qk1-x72a.google.com with SMTP id bi29so2378800qkb.5
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 07:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5xSDql4+/4hjZ41MoR3OqxD/rR+Fa1of3CAUT/0rGzk=;
 b=ZmcsrWbP7rplnj2v6AVnty7fuCBFNtjO15O0UBMlVYSSsNKAEagpedvfBJ6vSun1Lm
 3w/PzKKqnuItwwu4Tl6WTCSIXV0c4OXWu42Jq4XqUhpTP0pmwEMCE00ya8AoDTu3DEXU
 47HMWAYKhURplzA4mclZVKy1G59S9/mRhLvRTpeUpcviuCsXl/JmyD628Dd0jWOzq0KG
 qmZ8VrdDPHF0vl6ZD3AgiZRNyEM/rjDalFXjIXPfp9XT1Rudpl/K4ungby8KAF4NdsxU
 9JnAnjpoUQdnPPiOv4HN2V+DF+yf/lDXvYI0x8sI0pvwdNloTO/V/NHN9fu9bUJGXhV6
 gr3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5xSDql4+/4hjZ41MoR3OqxD/rR+Fa1of3CAUT/0rGzk=;
 b=QZ2YNaJonz0eoBwCGoMjiZG6/14VBcr2RBxogJO8fx2CGPF1mSIsMhbrB1tpqk5frj
 i49A16t12OHRgBF+IlwEyzwfgiSv2QrhUKOkYpQVRgn47hhl1Et3ChEcsvFEXzG2GxK6
 9aFXZRBE9hxBz5O5H+Zmm9hjF9olnlu2dGEDD7kTx5z+rGclLADMXiCoQvlIYAnJ2UhS
 Xee9o7QLPVLheR9xjelO+zgLKTPM2yjfGKcQraThwtQDNDucJ9LpuWaj1g+j8pafSMxR
 Gb2IgbK4SBkVtRKJuYs/RXl59pSoeKYQNuJ923u/wj45m1ESkdC5VGyzfIriqZXGBwU/
 MW0A==
X-Gm-Message-State: AOAM532fTVtPmUQLQX0C0Bvc49/6T+SO90eF2/f1XdxU2S8AHeYtfcBV
 jiVSx5gbnd7C3xmyuKSCQLSW0gN1HKV4IQ==
X-Google-Smtp-Source: ABdhPJxYh0/VrJizuxw4VYHnu+Q7REsJfgO2TtuDB9UDktQ7UlfEnt7BH1Lt/t2If69RLVMJ4r9Jpw==
X-Received: by 2002:a37:b0c6:: with SMTP id
 z189mr35321418qke.344.1635948544136; 
 Wed, 03 Nov 2021 07:09:04 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id z5sm1669377qtw.71.2021.11.03.07.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 07:09:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 23/23] linux-user/xtensa: Use force_sig_fault
Date: Wed,  3 Nov 2021 10:08:47 -0400
Message-Id: <20211103140847.454070-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103140847.454070-1-richard.henderson@linaro.org>
References: <20211103140847.454070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72a.google.com
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

Use the new function instead of setting up a target_siginfo_t
and calling queue_signal. Fill in the missing PC for SIGTRAP.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/xtensa/cpu_loop.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/linux-user/xtensa/cpu_loop.c b/linux-user/xtensa/cpu_loop.c
index a83490ab35..34775feb7c 100644
--- a/linux-user/xtensa/cpu_loop.c
+++ b/linux-user/xtensa/cpu_loop.c
@@ -126,7 +126,6 @@ static void xtensa_underflow12(CPUXtensaState *env)
 void cpu_loop(CPUXtensaState *env)
 {
     CPUState *cs = env_cpu(env);
-    target_siginfo_t info;
     abi_ulong ret;
     int trapnr;
 
@@ -163,14 +162,12 @@ void cpu_loop(CPUXtensaState *env)
         case EXC_USER:
             switch (env->sregs[EXCCAUSE]) {
             case ILLEGAL_INSTRUCTION_CAUSE:
+                force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC,
+                                env->sregs[EPC1]);
+                break;
             case PRIVILEGED_CAUSE:
-                info.si_signo = TARGET_SIGILL;
-                info.si_errno = 0;
-                info.si_code =
-                    env->sregs[EXCCAUSE] == ILLEGAL_INSTRUCTION_CAUSE ?
-                    TARGET_ILL_ILLOPC : TARGET_ILL_PRVOPC;
-                info._sifields._sigfault._addr = env->sregs[EPC1];
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+                force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVOPC,
+                                env->sregs[EPC1]);
                 break;
 
             case SYSCALL_CAUSE:
@@ -219,11 +216,8 @@ void cpu_loop(CPUXtensaState *env)
                 break;
 
             case INTEGER_DIVIDE_BY_ZERO_CAUSE:
-                info.si_signo = TARGET_SIGFPE;
-                info.si_errno = 0;
-                info.si_code = TARGET_FPE_INTDIV;
-                info._sifields._sigfault._addr = env->sregs[EPC1];
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+                force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTDIV,
+                                env->sregs[EPC1]);
                 break;
 
             default:
@@ -232,10 +226,8 @@ void cpu_loop(CPUXtensaState *env)
             }
             break;
         case EXCP_DEBUG:
-            info.si_signo = TARGET_SIGTRAP;
-            info.si_errno = 0;
-            info.si_code = TARGET_TRAP_BRKPT;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT,
+                            env->sregs[EPC1]);
             break;
         case EXC_DEBUG:
         default:
-- 
2.25.1


