Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 646A1D44E5
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 18:03:05 +0200 (CEST)
Received: from localhost ([::1]:52890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIxNf-0000XZ-QR
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 12:03:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33585)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIxGl-0002GZ-KF
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 11:55:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIxGj-0007aC-DG
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 11:55:54 -0400
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:37864)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIxGj-0007ZB-9X
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 11:55:53 -0400
Received: by mail-yb1-xb42.google.com with SMTP id z125so3257328ybc.4
 for <qemu-devel@nongnu.org>; Fri, 11 Oct 2019 08:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JZ4FcxbCDDWJsqSaXfQWATqqO+tlQqneKyRyH+pvJoM=;
 b=VoKm83e3fCwHAtGn1hsDLYwwFA2FmbBEeuMbI1Wuu/C6nJEnbuJOeozqfZHTgZz0fG
 KT4A2Gwyamd8MUTe82jS3tbMnjnezUBxRPYzzG1nCFYrc7QpVo5/8RSkITGpYKXx5IDT
 n7f2NbeOwcxfOTZPJ2oY586SKGWp/w2AiIbmX0filRsQ1i5jngKKkB0j4rjwRHr4xl4y
 ojDUy4RHKfQbYi9FuvvuZlii37W4Gp1J6vdlz9cgXaA6GlYRYuBJnYhvooEptfAJEMiZ
 iZb2v1abw/Wdaqh5J04itKQK/TLxgKrUzjEJHSsFvMWM2b2+SiuGy7kBanCAiVaO6iph
 KTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JZ4FcxbCDDWJsqSaXfQWATqqO+tlQqneKyRyH+pvJoM=;
 b=rKSWgBvtlbd37ad984cvoyKfEGAU/WnAhH8Bdacr0ldUm9T1viBK8rrA1vblM4ELXb
 K4s4vOxZ+hKqjU3fQ6LUmGtRe+aOd2NDP8jUZAUsU6P+5ROL5DvZd7oLF+zlBxrx9JmK
 MniRJkNqROQbvstI3SiLSeFeDJTYd5BZO+ldhDc6zyAlrWuqZJHr5gC8wLdBPwAJ9qBO
 qd/d+GquzEF9levpwE/gRUHZh34MtlXcl1aOSdi3iGcJ7GGMiUORbufkEJFsou28CcGz
 veHMoRbJfysvSdKdbxQbzS7jSQ57HlP2ZSeN5YqInL+PItnS3rYBQJ9gOBpEuDJHct8k
 c2mQ==
X-Gm-Message-State: APjAAAVGpKzIy291kZvrAOWmI3e6wjLsopYhj/+4isv3VsNG8rXxDCJo
 RXeFYFKHtD0y3zXirJjd9HlTyBMapN8=
X-Google-Smtp-Source: APXvYqwm7E36eHgRIVaDeQwAM1ckqu1T/UHK9aLI0/FAiFTxwBUmAApQqrWEahDQ4M13RjlC8jS6Kw==
X-Received: by 2002:a25:7b44:: with SMTP id w65mr10012844ybc.393.1570809351386; 
 Fri, 11 Oct 2019 08:55:51 -0700 (PDT)
Received: from cloudburst.gateway.pace.com (67.216.151.25.pool.hargray.net.
 [67.216.151.25])
 by smtp.gmail.com with ESMTPSA id d17sm2473139ywb.95.2019.10.11.08.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 08:55:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 03/20] target/arm: Split out rebuild_hflags_common_32
Date: Fri, 11 Oct 2019 11:55:29 -0400
Message-Id: <20191011155546.14342-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011155546.14342-1-richard.henderson@linaro.org>
References: <20191011155546.14342-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b42
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
Cc: laurent.desnogues@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create a function to compute the values of the TBFLAG_A32 bits
that will be cached, and are used by all profiles.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 69da04786e..f05d042474 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11070,6 +11070,15 @@ static uint32_t rebuild_hflags_common(CPUARMState *env, int fp_el,
     return flags;
 }
 
+static uint32_t rebuild_hflags_common_32(CPUARMState *env, int fp_el,
+                                         ARMMMUIdx mmu_idx, uint32_t flags)
+{
+    flags = FIELD_DP32(flags, TBFLAG_A32, SCTLR_B, arm_sctlr_b(env));
+    flags = FIELD_DP32(flags, TBFLAG_A32, NS, !access_secure_reg(env));
+
+    return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
+}
+
 static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
                                    ARMMMUIdx mmu_idx)
 {
@@ -11141,7 +11150,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
     ARMMMUIdx mmu_idx = arm_mmu_idx(env);
     int current_el = arm_current_el(env);
     int fp_el = fp_exception_el(env, current_el);
-    uint32_t flags = 0;
+    uint32_t flags;
 
     if (is_a64(env)) {
         *pc = env->pc;
@@ -11151,12 +11160,11 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
         }
     } else {
         *pc = env->regs[15];
+        flags = rebuild_hflags_common_32(env, fp_el, mmu_idx, 0);
         flags = FIELD_DP32(flags, TBFLAG_A32, THUMB, env->thumb);
         flags = FIELD_DP32(flags, TBFLAG_A32, VECLEN, env->vfp.vec_len);
         flags = FIELD_DP32(flags, TBFLAG_A32, VECSTRIDE, env->vfp.vec_stride);
         flags = FIELD_DP32(flags, TBFLAG_A32, CONDEXEC, env->condexec_bits);
-        flags = FIELD_DP32(flags, TBFLAG_A32, SCTLR_B, arm_sctlr_b(env));
-        flags = FIELD_DP32(flags, TBFLAG_A32, NS, !access_secure_reg(env));
         if (env->vfp.xregs[ARM_VFP_FPEXC] & (1 << 30)
             || arm_el_is_aa64(env, 1) || arm_feature(env, ARM_FEATURE_M)) {
             flags = FIELD_DP32(flags, TBFLAG_A32, VFPEN, 1);
@@ -11166,8 +11174,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
             flags = FIELD_DP32(flags, TBFLAG_A32,
                                XSCALE_CPAR, env->cp15.c15_cpar);
         }
-
-        flags = rebuild_hflags_common(env, fp_el, mmu_idx, flags);
     }
 
     /* The SS_ACTIVE and PSTATE_SS bits correspond to the state machine
-- 
2.17.1


