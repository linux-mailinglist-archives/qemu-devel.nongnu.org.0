Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDEE6A4D58
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 22:37:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWl86-0007Mx-W8; Mon, 27 Feb 2023 16:33:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl85-0007Ik-KY
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 16:33:53 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl83-0004Kt-Ra
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 16:33:53 -0500
Received: by mail-pl1-x62f.google.com with SMTP id i3so8265429plg.6
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 13:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oFabQEE82JV36HMrVDQBYDbr2a18gGcUEuaUfpMg43Q=;
 b=mxv/KyZ/rhHd4cQavQuKiVpgjunHydFwPctfMhrwvdpDVu0s2JQx8ueIawA8daj/B4
 +KTRZru9muo0r478dJ+rEcTp2kCRIbZRuosVr7S7mLUHjJxU8vD6uQPuBBBs3hyQTZ3u
 tJXEsp8Z33IlnDTjFB9EJbp3KEbBrCXsXtfI3iqgQd2EQTYjubBVAPRHHt4KVCFZLLQF
 McLIpV74yI00QpxhRmYedjMeXrxHR3keT8jpj3p6HloPrkhQ43Qg8gK+Ck7XtMNy+wHC
 6YAsyM+6yadS9zRReYbTYjBARE8wsHhsN1Z9TjD0BxTWLsEUnAIeUCeb0F51hI59dTiV
 Hg5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oFabQEE82JV36HMrVDQBYDbr2a18gGcUEuaUfpMg43Q=;
 b=UYD4qL0RV8biD+yDQy/8VM/SSlxE2046hxQtoS+iq74qdRUmA4Oa8r17tzx2QMqhUM
 XlMz1+AztFV3r2VOtKM0s9k9SJrHrWWX4+uQnrHAN80xBf+g4SMx8tQfXAMGrFIlcbIf
 v69IL/FkQAcM0/bTzrr88XoUkTCz97c2aHDNWluHoCGkdSZqFsXz6K2+6dh6NsRdi0Ao
 TfOjyZ8S6H/wHMCtvhW5KE90sjIw3orVsrJzVEpZRfO1BrCN8YHa2ZcCHKReMUznCODr
 gzYBpbqOQ+IC3HwSvIXFRq4q4FE4VtZ3fXPetMjKe7UTyLJOIV/9oqg7USDrejacyJ0D
 A/Hw==
X-Gm-Message-State: AO0yUKVuHew2obbJb1ruoqgYyd89pWyk1qsv3m6+gIf5NuNkBPpW4Qnn
 mRW3erEMEwsrhGmrZWyGhv1LaWbVJ02vjoAYGQM=
X-Google-Smtp-Source: AK7set9skPtbCa93vK3Hm7yekSUcmBH/Q+7iHH46q2GM2YjcPSp0LvGmCtQrxbJQIqx1tH0BL5XUfQ==
X-Received: by 2002:a17:90b:4b52:b0:237:3d0c:89ae with SMTP id
 mi18-20020a17090b4b5200b002373d0c89aemr604646pjb.34.1677533630523; 
 Mon, 27 Feb 2023 13:33:50 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d137-20020a63368f000000b00478c48cf73csm4375262pga.82.2023.02.27.13.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 13:33:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, David Reiss <dreiss@meta.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 12/14] target/arm: Export arm_v7m_mrs_control
Date: Mon, 27 Feb 2023 11:33:27 -1000
Message-Id: <20230227213329.793795-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227213329.793795-1-richard.henderson@linaro.org>
References: <20230227213329.793795-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: David Reiss <dreiss@meta.com>
[rth: Split out of a larger patch]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h    | 3 +++
 target/arm/tcg/m_helper.c | 6 +++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 97271117a4..0f2c48ad4b 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1355,6 +1355,9 @@ void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
 void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp);
 #endif
 
+/* Read the CONTROL register as the MRS instruction would. */
+uint32_t arm_v7m_mrs_control(CPUARMState *env, uint32_t secure);
+
 #ifdef CONFIG_USER_ONLY
 static inline void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu) { }
 #else
diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
index f94e87e728..03be79e7bf 100644
--- a/target/arm/tcg/m_helper.c
+++ b/target/arm/tcg/m_helper.c
@@ -56,7 +56,7 @@ static uint32_t v7m_mrs_xpsr(CPUARMState *env, uint32_t reg, unsigned el)
     return xpsr_read(env) & mask;
 }
 
-static uint32_t v7m_mrs_control(CPUARMState *env, uint32_t secure)
+uint32_t arm_v7m_mrs_control(CPUARMState *env, uint32_t secure)
 {
     uint32_t value = env->v7m.control[secure];
 
@@ -93,7 +93,7 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
     case 0 ... 7: /* xPSR sub-fields */
         return v7m_mrs_xpsr(env, reg, 0);
     case 20: /* CONTROL */
-        return v7m_mrs_control(env, 0);
+        return arm_v7m_mrs_control(env, 0);
     default:
         /* Unprivileged reads others as zero.  */
         return 0;
@@ -2465,7 +2465,7 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
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


