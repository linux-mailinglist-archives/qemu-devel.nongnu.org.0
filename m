Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2E91DD73F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 21:31:19 +0200 (CEST)
Received: from localhost ([::1]:43054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbquU-0008DK-Kj
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 15:31:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jbqgQ-00030u-Qn
 for qemu-devel@nongnu.org; Thu, 21 May 2020 15:16:46 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jbqgP-0000VK-Q1
 for qemu-devel@nongnu.org; Thu, 21 May 2020 15:16:46 -0400
Received: by mail-wr1-x42a.google.com with SMTP id l11so7811112wru.0
 for <qemu-devel@nongnu.org>; Thu, 21 May 2020 12:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=L3EBlkC846TlitKEKsoLOy71erLb9L5nYlku8kDSWCM=;
 b=W9L3eJ+ElVnuWx37iAUFLxZDCogjYBrCxLitsboj4Kkfl17IRFGgjAlgqhkf5PMiWv
 Qaq7sMryOL/TRS061Tb8YOFGjaoVc8m5Omru2htNhasxYXW3bAG0QnFrssfH3F1tNWjz
 5eWqUQ7PeErDrHt8W2OmnEZsOIT30UF1/Rsn7mqOoBn9i2s7FcMlJqMWO46KOYo3/qMz
 FEJNj2DvOPYIhshTLz1zn2KY7d5WppK5VYBdgtcIM+h5bhGTbDlb36FzS94/ZMKxVr2Q
 XDTtfVyy4zK1PX/Y2VUzcOrLe5t4iTifGMPdFIIJG7XH9GfqZRx/thE+dOyRdsIn4Oxn
 jnkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L3EBlkC846TlitKEKsoLOy71erLb9L5nYlku8kDSWCM=;
 b=NBf9d0BcOWNpTKPHy+fshVwqUwubl4iM2MYIRo/DUfmNVpTKXYXXo1j5IK/gIEIJVA
 AUg/MqJLmYqkCXcg4LhDJ1oMzo71rwALD3CHsPajIn0LVebH9ESHeb9DwPQEDELLya+/
 EOxWOwHcintGveGcSaSKlV6mr3sneGGVDU3CEjOGO5stq3s/xVKnYQMeLddCP3v/PELI
 TMvJKeSMgMz2LX+ei5MJzjN3RioTInkxIQ4PfmYwF4biLUateNf1Glg/9IqlDdcQyEc6
 0YDj4mhCf/v3WEJUbAMUHREThtQ3jBmwsUv2qjjwSG0C+wV0dn9PyQWW20VZN4AIGV9c
 BY9Q==
X-Gm-Message-State: AOAM5329UZEd1kPejnxnfSvUdEpgHoE5SvgK3rSs3HvQCNeo4DknQFOC
 NFwYCbiZLKZLu2kL/rLTYoaMVpcoXeM7mA==
X-Google-Smtp-Source: ABdhPJzs5ZLIWAPszcP2LOZ4Dl7KZoi7ZhASx0SkQy0jCPwROI8oiNny3FH6GY6N5SY29gjsfPWx7w==
X-Received: by 2002:a05:6000:114e:: with SMTP id
 d14mr112709wrx.110.1590088603861; 
 Thu, 21 May 2020 12:16:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id z124sm7335100wmg.20.2020.05.21.12.16.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 12:16:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/29] target/arm: Allow user-mode code to write CPSR.E via MSR
Date: Thu, 21 May 2020 20:16:08 +0100
Message-Id: <20200521191610.10941-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200521191610.10941-1-peter.maydell@linaro.org>
References: <20200521191610.10941-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using the MSR instruction to write to CPSR.E is deprecated, but it is
required to work from any mode including unprivileged code.  We were
incorrectly forbidding usermode code from writing it because
CPSR_USER did not include the CPSR_E bit.

We use CPSR_USER in only three places:
 * as the mask of what to allow userspace MSR to write to CPSR
 * when deciding what bits a linux-user signal-return should be
   able to write from the sigcontext structure
 * in target_user_copy_regs() when we set up the initial
   registers for the linux-user process

In the first two cases not being able to update CPSR.E is a bug, and
in the third case it doesn't matter because CPSR.E is always 0 there.
So we can fix both bugs by adding CPSR_E to CPSR_USER.

Because the cpsr_write() in restore_sigcontext() is now changing
a CPSR bit which is cached in hflags, we need to add an
arm_rebuild_hflags() call there; the callsite in
target_user_copy_regs() was already rebuilding hflags for other
reasons.

(The recommended way to change CPSR.E is to use the 'SETEND'
instruction, which we do correctly allow from usermode code.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20200518142801.20503-1-peter.maydell@linaro.org
---
 target/arm/cpu.h        | 2 +-
 linux-user/arm/signal.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5d995368d4f..677584e5da0 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1230,7 +1230,7 @@ void pmu_init(ARMCPU *cpu);
 #define CACHED_CPSR_BITS (CPSR_T | CPSR_AIF | CPSR_GE | CPSR_IT | CPSR_Q \
     | CPSR_NZCV)
 /* Bits writable in user mode.  */
-#define CPSR_USER (CPSR_NZCV | CPSR_Q | CPSR_GE)
+#define CPSR_USER (CPSR_NZCV | CPSR_Q | CPSR_GE | CPSR_E)
 /* Execution state bits.  MRS read as zero, MSR writes ignored.  */
 #define CPSR_EXEC (CPSR_T | CPSR_IT | CPSR_J | CPSR_IL)
 
diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
index d96fc27ce11..8020c80acb5 100644
--- a/linux-user/arm/signal.c
+++ b/linux-user/arm/signal.c
@@ -546,6 +546,7 @@ restore_sigcontext(CPUARMState *env, struct target_sigcontext *sc)
 #ifdef TARGET_CONFIG_CPU_32
     __get_user(cpsr, &sc->arm_cpsr);
     cpsr_write(env, cpsr, CPSR_USER | CPSR_EXEC, CPSRWriteByInstr);
+    arm_rebuild_hflags(env);
 #endif
 
     err |= !valid_user_regs(env);
-- 
2.20.1


