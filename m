Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEC66AC583
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 16:36:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCrU-00045V-2E; Mon, 06 Mar 2023 10:34:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCrS-000448-04
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:34:50 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCrQ-0002At-9N
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:34:49 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so5441626wmi.3
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 07:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678116887;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7zDGynslJU4b+FRAwgcAI/YIPi0m+DP8+CtCFF4RjQo=;
 b=RPPRzob5zs5tkt/8nf/YsDMV/82t16+udjpVuEU0lfsa2bjIl/UbH7+UpwGDlcVWuE
 r86NOEZcHwqJ9Eps0hOBZKUb8o0uSc7I/8BI6pGhnhjLt3lR3d2J9cxk4c1pDgFKPcIi
 JbhUP/j6kZXhOW7t3Jqevz4fNbS4BNmXS5BV2L9MxYGb95YIdwnhDcjaRzVu682HeLmg
 gJ5gWG9GbV+n1nd+aofMGCjKS9ejgq+0m3SCLuMc0fXmte/JQc5c9AaCSorEQaBNt1NX
 i0bhrciFCzOzcCUz+EF5zKEyQvYnn8jn43u0oyetXK9TiZavplLdbxsilDz/5PgF3/Fs
 i0Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678116887;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7zDGynslJU4b+FRAwgcAI/YIPi0m+DP8+CtCFF4RjQo=;
 b=TwLocXsK30CSPqtfcPEhm9rHhWhb8Gel73smXy4NK8DEoNer46OHOkzV/VHL8YqRmL
 JWTcZ+kYj3Xd5ZyfUmgbLqN73Qycse6jd429WsoDfvfu9ON2kRBINxukNBWafm+NnQI+
 EX3mrgwPA7w2yeoRDMdPMZH7oLwoKHwlreSWzSFE4sDP8A6x1Pw3N1EpQMID77YPkQKH
 9ZpMW1isKUfbHOq8LlsBH1HgeWtjyXP87L5CGiBHLUBdenSKd32+gopzMn35OGZjJnFN
 nqpz+R07JBDG2JSKs7kRJc8dTsXFwoKkhBY8K5+ByVyS1kL7IGLZEZG1MeUXn1aMt8X1
 TU8A==
X-Gm-Message-State: AO0yUKUGEyRgeV+fqWejajsn8vWBTndJLjbYJPlJAWh7i9k68DHe+uUC
 w+zOV6TVMybArQuf7LtJRtzxC9Riqbun7elEPkA=
X-Google-Smtp-Source: AK7set9jk0qCH+oah7jWv/uCHkGWdyQ21kYmYrijoskIVFpzChziDdFOSXSvzCHcQwvdQ+epLZZO0Q==
X-Received: by 2002:a7b:cb01:0:b0:3ea:d611:f8 with SMTP id
 u1-20020a7bcb01000000b003ead61100f8mr10229648wmj.38.1678116886909; 
 Mon, 06 Mar 2023 07:34:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a05600c444700b003eb0d6f48f3sm15287432wmn.27.2023.03.06.07.34.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 07:34:46 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/21] target/arm: Export arm_v7m_mrs_control
Date: Mon,  6 Mar 2023 15:34:26 +0000
Message-Id: <20230306153435.490894-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306153435.490894-1-peter.maydell@linaro.org>
References: <20230306153435.490894-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: David Reiss <dreiss@meta.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230227213329.793795-13-richard.henderson@linaro.org
[rth: Split out of a larger patch]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h    | 3 +++
 target/arm/tcg/m_helper.c | 6 +++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index dda89aa5dff..086e88e2377 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1357,6 +1357,9 @@ void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
 void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp);
 #endif
 
+/* Read the CONTROL register as the MRS instruction would. */
+uint32_t arm_v7m_mrs_control(CPUARMState *env, uint32_t secure);
+
 #ifdef CONFIG_USER_ONLY
 static inline void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu) { }
 #else
diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
index f94e87e7289..03be79e7bfa 100644
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


