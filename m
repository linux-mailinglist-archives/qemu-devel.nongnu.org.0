Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7D053C10B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 00:48:31 +0200 (CEST)
Received: from localhost ([::1]:46230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwtcE-0001KT-G2
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 18:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskQ-0001if-2Z
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:52:59 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:46946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskL-0000tx-Dp
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:52:51 -0400
Received: by mail-pl1-x634.google.com with SMTP id w3so5508758plp.13
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VJKQ6WoqB0EGYqa/ELNpHbDiJmRFJHnsDZvzPsZOiDk=;
 b=gsZz0TyimC007DcePY8I4GsBFmI0xvPR19BY6g6qfL4iDKpXqKeSnoz60taOm6W96y
 DLGXYn16Pmu4jO5i1j5DG6ptDnC75rVssLmu3xOJH3iE9rIKbaBcJpORN6U0n6cXOQM6
 MlPArFcCsLiOdHLDaotSJgLO9WY6QwrZVqRJaPhYsw9ORC5PCGk+Wh8lo11C+SXIC+je
 KGe5XJuVnWF9fxux019CeFbK98oOvMGCD9ihw8rNg9/5OPLSxJYVdupzq9B1IeMII03X
 0aDaHaa4i3+MO55Ud3EPCvoWV+Y2F1yY8z40rQWcVDRJBb/L+8p4yosNdrzbsuVqjriC
 n3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VJKQ6WoqB0EGYqa/ELNpHbDiJmRFJHnsDZvzPsZOiDk=;
 b=h62XPSVqEBz/OPXMgwi3CzZpmjD8c0HrMz74Wwaad5oxapo10i4C/1makWwBv3KeDh
 dN5FwUlSw13ldZfi9fZSWv5ISzLZU1ZMWNTBtNEjYdT/eyZQUAskiGWAgXBiSNXA0rxP
 yqbAUrdAv8vxvAIhX6maQeXhkFc4g88bRW0KrwlekWS9wI33Yy5RSkGb+dXR+rhkys5U
 ewYR4eZU46XAvIHePyV0O3/jrGsBB3+I8hZ6zSGlLPklPknlQrShU2dw0gZAA9DNeP3L
 SXUFmdZAWhkPd1gpyj65o2l4g2rrFN2OPdsyX2Kvca7jMDDi971MJg5i/BYxEFPAlKk6
 4wdw==
X-Gm-Message-State: AOAM533Hn6Q6rcPYNOFAfmW00+wtdckvDEp7h2mbFQqs51HWnIodazLe
 JHssuTSaheTlSLzy2yywf3lwzopHdVIQ+A==
X-Google-Smtp-Source: ABdhPJwdz7AgvrHWWyQcjaFEGJiQZKJPHfn7BzN+sQTgmBqUUNESFNxLfmfMrg+jPWWREPAAlDAW3Q==
X-Received: by 2002:a17:902:ef43:b0:156:9c5d:b0fe with SMTP id
 e3-20020a170902ef4300b001569c5db0femr6923626plx.158.1654206766667; 
 Thu, 02 Jun 2022 14:52:46 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170902ed8e00b0015edfccfdb5sm4039605plj.50.2022.06.02.14.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:52:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 60/71] linux-user/aarch64: Reset PSTATE.SM on syscalls
Date: Thu,  2 Jun 2022 14:48:42 -0700
Message-Id: <20220602214853.496211-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/cpu_loop.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 3b273f6299..4af6996d57 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -89,6 +89,15 @@ void cpu_loop(CPUARMState *env)
 
         switch (trapnr) {
         case EXCP_SWI:
+            /*
+             * On syscall, PSTATE.ZA is preserved, along with the ZA matrix.
+             * PSTATE.SM is cleared, per SMSTOP, which does ResetSVEState.
+             */
+            if (FIELD_EX64(env->svcr, SVCR, SM)) {
+                env->svcr = FIELD_DP64(env->svcr, SVCR, SM, 0);
+                arm_rebuild_hflags(env);
+                arm_reset_sve_state(env);
+            }
             ret = do_syscall(env,
                              env->xregs[8],
                              env->xregs[0],
-- 
2.34.1


