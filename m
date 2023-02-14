Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 919BD696982
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 17:31:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRyD6-0006kJ-Hr; Tue, 14 Feb 2023 11:31:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyD2-0006bY-I2
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:31:12 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyD0-00026G-Rw
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:31:12 -0500
Received: by mail-pf1-x42e.google.com with SMTP id n2so10549528pfo.3
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 08:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q0z/E1qdp++vmITAZJNktKsc7youUOaj3crCsXOdQsE=;
 b=nfAlfBJ2XuNv6JFKbSyj4R69oDm25CH3G9u/LDu+ReU8Tv6jzC5ofoq3ae3nrORGX2
 l2HLGBApNaiefhrj7hrLylwIHx5ers21WXJi5rbMlFBSEv3dQ8kCHzuY+fcf1rsEdsu7
 0KbhkguC37A0Hrk5h6avd8yiMTnOKKJ50HHv8MMJknWP2ijQBql97rm2hqglT5ASVreP
 K0UbtKXsRnrRv6NF6o/pgtU9olQ+roztV9b8Zsfcqe4ODTqGleo+DOmvtK3yqNtoRGJp
 KciMFhQ+mxMd0QhAa2a70OTY3uT9sekFclVUB/A60fiZdZVkrDyiXROPFvwBQjlpFOOP
 O+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q0z/E1qdp++vmITAZJNktKsc7youUOaj3crCsXOdQsE=;
 b=dDtNTKSMimf3EJWvDXn5d//mxgOpgG5tZ6ICoIcce5CjNQZgdGLCbyYuhtCNPvMvRO
 /03Mbhdxj4L2PqKu40NP+ynbWZS2YnLKTrPNvipHnrCPdW7D60DTKceybox8kWld+Dt3
 j5DF7OgZp6hoRiP3q/awAc7MugjgvZv8QKhXT01tMeeFQ+SA8w9+Re8yCTZHaMpwBBFI
 m8qWbBgaIhCftI/7cVvqhsuZ/MPKAJ3fPQ4QE4eMXf1eKsdSWDEeh2Nse/chTOucEFwI
 DGjetN+dshLkN6d8yuvuT4xkTtG75qocNU1Lw4isNgRd86m/l/n3BXwmUuCljIICXBiN
 cqpg==
X-Gm-Message-State: AO0yUKXhlMMKZ1gPCL5DQQfJY60VcozP1Vpkv1VxtGtl5MSr2K/tFcfa
 HP7YnwAfrLMCAXR/FVJqEMfiSWP8gP/X7JC/6II=
X-Google-Smtp-Source: AK7set+migrKgxV0t2Vly4IzkGhog+TNBwCtQ6rhdV/GNenE7xewaBXBVaAUO2KfPPPDcImlkQv5hA==
X-Received: by 2002:aa7:96ab:0:b0:5a8:b6e2:a3fd with SMTP id
 g11-20020aa796ab000000b005a8b6e2a3fdmr2828973pfk.7.1676392270053; 
 Tue, 14 Feb 2023 08:31:10 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 d17-20020aa78691000000b0058d99337381sm10337011pfo.172.2023.02.14.08.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 08:31:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	David Reiss <dreiss@meta.com>
Subject: [PATCH 12/14] target/arm: Export arm_v7m_mrs_control
Date: Tue, 14 Feb 2023 06:30:46 -1000
Message-Id: <20230214163048.903964-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230214163048.903964-1-richard.henderson@linaro.org>
References: <20230214163048.903964-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

From: David Reiss <dreiss@meta.com>

Allow the function to be used outside of m_helper.c.
Rename with an "arm_" prefix.

Signed-off-by: David Reiss <dreiss@meta.com>
[rth: Split out of a larger patch]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 3 +++
 target/arm/m_helper.c  | 6 +++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 4b60355a7e..127a425961 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1353,6 +1353,9 @@ void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
 void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp);
 #endif
 
+/* Read the CONTROL register as the MRS instruction would. */
+uint32_t arm_v7m_mrs_control(CPUARMState *env, uint32_t secure);
+
 #ifdef CONFIG_USER_ONLY
 static inline void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu) { }
 #else
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index e7e746ea18..c20bcac977 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -53,7 +53,7 @@ static uint32_t v7m_mrs_xpsr(CPUARMState *env, uint32_t reg, unsigned el)
     return xpsr_read(env) & mask;
 }
 
-static uint32_t v7m_mrs_control(CPUARMState *env, uint32_t secure)
+uint32_t arm_v7m_mrs_control(CPUARMState *env, uint32_t secure)
 {
     uint32_t value = env->v7m.control[secure];
 
@@ -90,7 +90,7 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
     case 0 ... 7: /* xPSR sub-fields */
         return v7m_mrs_xpsr(env, reg, 0);
     case 20: /* CONTROL */
-        return v7m_mrs_control(env, 0);
+        return arm_v7m_mrs_control(env, 0);
     default:
         /* Unprivileged reads others as zero.  */
         return 0;
@@ -2420,7 +2420,7 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
     case 0 ... 7: /* xPSR sub-fields */
         return v7m_mrs_xpsr(env, reg, el);
     case 20: /* CONTROL */
-        return v7m_mrs_control(env, env->v7m.secure);
+        return arm_v7m_mrs_control(env, env->v7m.secure);
     case 0x94: /* CONTROL_NS */
         /*
          * We have to handle this here because unprivileged Secure code
-- 
2.34.1


