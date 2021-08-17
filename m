Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 664523EF385
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 22:19:43 +0200 (CEST)
Received: from localhost ([::1]:39610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG5Yk-0003FA-Fr
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 16:19:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mG5Xu-0002N6-GY
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 16:18:50 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:40510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mG5Xs-0001lb-LV
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 16:18:50 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 x2-20020a1c7c02000000b002e6f1f69a1eso2750757wmc.5
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 13:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X9+TtUOGOW4Kke6aYkw3DIDjY+8T0v70IdNRT7rgM7I=;
 b=pPJFuFNTeJ6OOOohE19+Rs2m2FR6yB+y4+0fmz2oaZpUQU0kgCsAarnTGPPK8lhCv1
 QfzFyL0hBJG6XJQH41I0/qBxSwjaVgMjVgh0Olj7DQQRX4MZQDK0KCFKrXqCWB2ZGT86
 XI4vldq+QDWS7o6KfxtjJe/JVuyycABVQwbCz89UNN2YIC8R1Hhd8UJAEwkOq/RyfWq9
 MwVzoIymlScdR5NLqB3lq+lDaZJM95fHdZMHJqQqsC51dcm89tdbOByXCei31cqGdfhJ
 hL62ZsWlgJsy0VoCb2HdvhITImYC7NmzvWszRS9c/cBwZvSg1vd9HVxBRCboftqI+p87
 vQtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X9+TtUOGOW4Kke6aYkw3DIDjY+8T0v70IdNRT7rgM7I=;
 b=CMbAG4tnr9n+pFuHNevjMArtbuWOtqRf80WkVq5wWBjAZy/ByviT0Pf5ARur3xjsyq
 4AuJvHf3sbs9LDnUCqVNMyO22+mY05ZOhgnLhkRzv1rQQ0bZjert30MbnJnSX7A+Hl+6
 j6gz467LepXdfwsilCfsxVBHKEKsA//Na+FOBnFVRWIrnsAkog+xWGDjesIATxyrMDns
 Exsm/OeCsuDSBJYLI110npXPv1gh2+X6M2Kvu8Px9Eecqvh69+Xrz90dIu7CL9dNn+wN
 7P0IreaLF0rYNHfDGHQe+uuMxSqJVPd4h9Z5fw2SI6vb7cqp+c4AsKi5PqAPoUaWHKhx
 49Hw==
X-Gm-Message-State: AOAM531Q5wqW7pZyxPGUraSZ46oDQvn8A6G3qZqFMXMuWURJ9htRE5IY
 RPKyAl7mYGBXobg7mw+aOkPcGg==
X-Google-Smtp-Source: ABdhPJw3uHhnRBpHvQ75kSIdGDY5wXtdsFeU4vOXLE0h6hgJYFwajggMX4082ISVP5BctRZpOnwPNQ==
X-Received: by 2002:a1c:2905:: with SMTP id p5mr5119910wmp.146.1629231526559; 
 Tue, 17 Aug 2021 13:18:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w9sm2964785wmc.19.2021.08.17.13.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 13:18:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Do hflags rebuild in cpsr_write()
Date: Tue, 17 Aug 2021 21:18:43 +0100
Message-Id: <20210817201843.3829-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently we rely on all the callsites of cpsr_write() to rebuild the
cached hflags if they change one of the CPSR bits which we use as a
TB flag and cache in hflags.  This is a bit awkward when we want to
change the set of CPSR bits that we cache, because it means we need
to re-audit all the cpsr_write() callsites to see which flags they
are writing and whether they now need to rebuild the hflags.

Switch instead to making cpsr_write() call arm_rebuild_hflags()
itself if one of the bits being changed is a cached bit.

We don't do the rebuild for the CPSRWriteRaw write type, because that
kind of write is generally doing something special anyway.  For the
CPSRWriteRaw callsites in the KVM code and inbound migration we
definitely don't want to recalculate the hflags; the callsites in
boot.c and arm-powerctl.c have to do a rebuild-hflags call themselves
anyway because of other CPU state changes they make.

This allows us to drop explicit arm_rebuild_hflags() calls in a
couple of places where the only reason we needed to call it was the
CPSR write.

This fixes a bug where we were incorrectly failing to rebuild hflags
in the code path for a gdbstub write to CPSR, which meant that you
could make QEMU assert by breaking into a running guest, altering the
CPSR to change the value of, for example, CPSR.E, and then
continuing.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I've included CPSR.IL on the list of "cached bits" on the assumption
that my "honour PSTATE.IL" patch is going in, but this patch doesn't
strictly depend on that one. Just in case, though:
Based-on: id:20210817162118.24319-1-peter.maydell@linaro.org
"[PATCH] target/arm: Take an exception if PSTATE.IL is set"

 target/arm/cpu.h        | 10 ++++++++--
 linux-user/arm/signal.c |  2 --
 target/arm/helper.c     |  4 ++++
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index be557bf5d83..4c0568f85a8 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1393,11 +1393,17 @@ uint32_t cpsr_read(CPUARMState *env);
 typedef enum CPSRWriteType {
     CPSRWriteByInstr = 0,         /* from guest MSR or CPS */
     CPSRWriteExceptionReturn = 1, /* from guest exception return insn */
-    CPSRWriteRaw = 2,             /* trust values, do not switch reg banks */
+    CPSRWriteRaw = 2,
+        /* trust values, no reg bank switch, no hflags rebuild */
     CPSRWriteByGDBStub = 3,       /* from the GDB stub */
 } CPSRWriteType;
 
-/* Set the CPSR.  Note that some bits of mask must be all-set or all-clear.*/
+/*
+ * Set the CPSR.  Note that some bits of mask must be all-set or all-clear.
+ * This will do an arm_rebuild_hflags() if any of the bits in @mask
+ * correspond to TB flags bits cached in the hflags, unless @write_type
+ * is CPSRWriteRaw.
+ */
 void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
                 CPSRWriteType write_type);
 
diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
index 32b68ee302b..1dfcfd2d57b 100644
--- a/linux-user/arm/signal.c
+++ b/linux-user/arm/signal.c
@@ -289,7 +289,6 @@ setup_return(CPUARMState *env, struct target_sigaction *ka,
     env->regs[14] = retcode;
     env->regs[15] = handler & (thumb ? ~1 : ~3);
     cpsr_write(env, cpsr, CPSR_IT | CPSR_T | CPSR_E, CPSRWriteByInstr);
-    arm_rebuild_hflags(env);
 
     return 0;
 }
@@ -547,7 +546,6 @@ restore_sigcontext(CPUARMState *env, struct target_sigcontext *sc)
     __get_user(env->regs[15], &sc->arm_pc);
     __get_user(cpsr, &sc->arm_cpsr);
     cpsr_write(env, cpsr, CPSR_USER | CPSR_EXEC, CPSRWriteByInstr);
-    arm_rebuild_hflags(env);
 
     err |= !valid_user_regs(env);
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 201ecf8c67f..cdd6e0858fc 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9215,6 +9215,7 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
                 CPSRWriteType write_type)
 {
     uint32_t changed_daif;
+    bool rebuild_hflags = mask & (CPSR_M | CPSR_E | CPSR_IL);
 
     if (mask & CPSR_NZCV) {
         env->ZF = (~val) & CPSR_Z;
@@ -9334,6 +9335,9 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
     }
     mask &= ~CACHED_CPSR_BITS;
     env->uncached_cpsr = (env->uncached_cpsr & ~mask) | (val & mask);
+    if (rebuild_hflags) {
+        arm_rebuild_hflags(env);
+    }
 }
 
 /* Sign/zero extend */
-- 
2.20.1


