Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E0569D868
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 03:22:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUIGd-0001jz-0p; Mon, 20 Feb 2023 21:20:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIGO-0001fU-Pg
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 21:20:18 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIGM-000821-Kd
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 21:20:15 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 nt5-20020a17090b248500b00237161e33f4so1357346pjb.4
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 18:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i+YvvHaR7YFBJCK+oJ5F1iI+cpvOya9eRF9FOFdF3og=;
 b=vOM+OaLy67OxZjZ8zTEWTulThlKqQT/rjLIk3R6UDyiK+WrDGymOL+41kPA0K5a8Ly
 y9/va0xEmm7Srh9EaMeV4m69eVrLrmgOHiXtK9okm9z8WqKhSKuzoBlEphkR6iJZFuCx
 K6qZvQ5rcHv6Y+WtX1ne6nzTII0Z5zhG/lu96sfejFayYJCfYi/DX32dEy28afdEzN6U
 niiS6d+zfHI3hW2CzwmKJLqwdRn70OYE0o9IqwjLz4YT+PqNzm0eeb0OrAP/bhTbSirZ
 y53f9LT0wkEl/G1mepKZilGfJn4wd4hFOst6LIutg73hNtnGHjov/1U1iDjvssRFJO8K
 t8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i+YvvHaR7YFBJCK+oJ5F1iI+cpvOya9eRF9FOFdF3og=;
 b=vrhwkcdcnYtT2xwI1SI+V/7GSMyYtzzEz66piS5/1C6Sw0D5JvMxtEnBlkLI8sNznh
 8ASgFwo72zpkLX+ySsBnAruA1KEeyhMkmEVkWTuZF1QaxLwXLd/1JTVNDuMSu3k83I+8
 9jjItg7ZoxpzI4IVkH9Ngm/3puY3iemge+657eOjfaub2YtmWSfkGksr6Om/7Zrq6VeA
 JoP73xGX9eUlqmEayocrs9G/1JsmZWvutN2S17iZHoHWBM8FaWU9SoHBCqPOUhwqq5+J
 iJhLhpNZv4evRDCPohBakmiF77iEqG+mpvyhf15ExqZpFkSghcBafb0zzV1wPOyhuRJE
 JhBg==
X-Gm-Message-State: AO0yUKV6tZUOXL2nRdrrpux74vy5cT/j4u/nxiJSqtkHUOAd//omwYMw
 4+/4A3QyaaBcpkkWZMSE3YbBokxpnpaC8Gfw7oY=
X-Google-Smtp-Source: AK7set+Vmg25E19V+Kjp8aPZl24fLeCyxfwaLqtTGBGaTFQAdL6qZmMUNa/neZ78+0hrRVHTRA3Q+Q==
X-Received: by 2002:a17:903:183:b0:19b:33c0:40ab with SMTP id
 z3-20020a170903018300b0019b33c040abmr3504795plg.43.1676946013245; 
 Mon, 20 Feb 2023 18:20:13 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a170902e98300b0019141c79b1dsm8559328plb.254.2023.02.20.18.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 18:20:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, David Reiss <dreiss@meta.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 12/14] target/arm: Export arm_v7m_mrs_control
Date: Mon, 20 Feb 2023 16:19:49 -1000
Message-Id: <20230221021951.453601-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230221021951.453601-1-richard.henderson@linaro.org>
References: <20230221021951.453601-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: David Reiss <dreiss@meta.com>
[rth: Split out of a larger patch]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 3 +++
 target/arm/m_helper.c  | 6 +++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index fb88b16579..89052b1c94 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1339,6 +1339,9 @@ void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
 void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp);
 #endif
 
+/* Read the CONTROL register as the MRS instruction would. */
+uint32_t arm_v7m_mrs_control(CPUARMState *env, uint32_t secure);
+
 #ifdef CONFIG_USER_ONLY
 static inline void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu) { }
 #else
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index f94e87e728..03be79e7bf 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
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


