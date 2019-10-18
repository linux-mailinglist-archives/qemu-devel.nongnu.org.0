Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BF5DCD0B
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 19:52:28 +0200 (CEST)
Received: from localhost ([::1]:44304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLWQM-0005De-If
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 13:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59153)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWIu-0006T7-Aq
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 13:44:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWIr-0005PE-Uh
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 13:44:44 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:42902)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLWIr-0005Ng-PI
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 13:44:41 -0400
Received: by mail-pf1-x442.google.com with SMTP id q12so4311301pff.9
 for <qemu-devel@nongnu.org>; Fri, 18 Oct 2019 10:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O5qTDR4/yunqOnDsae4ZjoUIG4TsLVXzaOK/t5hnYkI=;
 b=a/O1FjpnSDTBNHQcZsOznehraztcF4C6rwZ0hMgYS0GxM0Q9Uv47pb7bArYiHwVrfM
 egAxl6bcj0Bc42hadAgWZBDyFGB3rQTNYK9rIiw5YbmA+nOgYpI8jn0PCU4ksoAitWzl
 LdoePutqQzeq72tt69Lsa0r4mllzQ5boORY8Jor9ZbL0MN8wlvT395OOnWriGRBl0f2B
 cPJaHEKQp5kRTlCYWra4qFZrPqWwEVEkcOxAVpOWfK5lWKKtcOoYHmBJ9Bp+pdLkSKgS
 oe9bnAZq15bf06y6YCp0Ec16BX0hZKrrtE++caHrXv2AUBYJ4ay6MAu1M9jPsD8u27iz
 BDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O5qTDR4/yunqOnDsae4ZjoUIG4TsLVXzaOK/t5hnYkI=;
 b=cGgcpIB5tKurg40aNrSz0+sHqNFCeieYfu7RSug8bP3lJLNfAj+NkSzIbqEBjLgyar
 nlrUK2EUZd7AU4uT1gfSzc/yCH1jla+xP7fXylNiK5GASCSFIqFvWhKCZm+5Ql8sxb4H
 M26g8/AgIkrf6CX+4MpDn8TSJ6KjQ18aTaAw31ZwxZQ1rjOFDEVzCj6boYA/GxogvMbU
 Mq/gY2njltdhwYe9ZvEg1apLFvI7+rIi7bNM5z5NMA/kwrVj610GMLZhT3m6NIv/dXw9
 JhJnlXBKp/P585tOnx0FUflSIjO/FP656cBXVB7CssHcjxTAQ98/zBMO1MoXO9K1DC+J
 kHLQ==
X-Gm-Message-State: APjAAAX3FUEtpF1oqH/X1oesqXMM14Y4diVVfdG1CDKRVgE7AQ6f/sY1
 gYgyaVkCckUWjbUzx5brPfCPNY4qKig=
X-Google-Smtp-Source: APXvYqw4DDetWHJk0AKxMja5lHldRP/1vbsNWG3YISsrohV7ldYOD3LCuyqoF1bmYaQXscyfYv2/5w==
X-Received: by 2002:aa7:8691:: with SMTP id d17mr8194090pfo.152.1571420679438; 
 Fri, 18 Oct 2019 10:44:39 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d20sm7857534pfq.88.2019.10.18.10.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 10:44:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 06/22] target/arm: Reduce tests vs M-profile in
 cpu_get_tb_cpu_state
Date: Fri, 18 Oct 2019 10:44:15 -0700
Message-Id: <20191018174431.1784-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018174431.1784-1-richard.henderson@linaro.org>
References: <20191018174431.1784-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hoist the computation of some TBFLAG_A32 bits that only apply to
M-profile under a single test for ARM_FEATURE_M.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 49 +++++++++++++++++++++------------------------
 1 file changed, 23 insertions(+), 26 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d4303420da..296a4b2232 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11194,6 +11194,29 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
 
         if (arm_feature(env, ARM_FEATURE_M)) {
             flags = rebuild_hflags_m32(env, fp_el, mmu_idx);
+
+            if (arm_feature(env, ARM_FEATURE_M_SECURITY) &&
+                FIELD_EX32(env->v7m.fpccr[M_REG_S], V7M_FPCCR, S)
+                != env->v7m.secure) {
+                flags = FIELD_DP32(flags, TBFLAG_A32, FPCCR_S_WRONG, 1);
+            }
+
+            if ((env->v7m.fpccr[env->v7m.secure] & R_V7M_FPCCR_ASPEN_MASK) &&
+                (!(env->v7m.control[M_REG_S] & R_V7M_CONTROL_FPCA_MASK) ||
+                 (env->v7m.secure &&
+                  !(env->v7m.control[M_REG_S] & R_V7M_CONTROL_SFPA_MASK)))) {
+                /*
+                 * ASPEN is set, but FPCA/SFPA indicate that there is no
+                 * active FP context; we must create a new FP context before
+                 * executing any FP insn.
+                 */
+                flags = FIELD_DP32(flags, TBFLAG_A32, NEW_FP_CTXT_NEEDED, 1);
+            }
+
+            bool is_secure = env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_S_MASK;
+            if (env->v7m.fpccr[is_secure] & R_V7M_FPCCR_LSPACT_MASK) {
+                flags = FIELD_DP32(flags, TBFLAG_A32, LSPACT, 1);
+            }
         } else {
             flags = rebuild_hflags_common_32(env, fp_el, mmu_idx, 0);
         }
@@ -11233,32 +11256,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
         }
     }
 
-    if (arm_feature(env, ARM_FEATURE_M_SECURITY) &&
-        FIELD_EX32(env->v7m.fpccr[M_REG_S], V7M_FPCCR, S) != env->v7m.secure) {
-        flags = FIELD_DP32(flags, TBFLAG_A32, FPCCR_S_WRONG, 1);
-    }
-
-    if (arm_feature(env, ARM_FEATURE_M) &&
-        (env->v7m.fpccr[env->v7m.secure] & R_V7M_FPCCR_ASPEN_MASK) &&
-        (!(env->v7m.control[M_REG_S] & R_V7M_CONTROL_FPCA_MASK) ||
-         (env->v7m.secure &&
-          !(env->v7m.control[M_REG_S] & R_V7M_CONTROL_SFPA_MASK)))) {
-        /*
-         * ASPEN is set, but FPCA/SFPA indicate that there is no active
-         * FP context; we must create a new FP context before executing
-         * any FP insn.
-         */
-        flags = FIELD_DP32(flags, TBFLAG_A32, NEW_FP_CTXT_NEEDED, 1);
-    }
-
-    if (arm_feature(env, ARM_FEATURE_M)) {
-        bool is_secure = env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_S_MASK;
-
-        if (env->v7m.fpccr[is_secure] & R_V7M_FPCCR_LSPACT_MASK) {
-            flags = FIELD_DP32(flags, TBFLAG_A32, LSPACT, 1);
-        }
-    }
-
     if (!arm_feature(env, ARM_FEATURE_M)) {
         int target_el = arm_debug_target_el(env);
 
-- 
2.17.1


