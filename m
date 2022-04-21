Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA2250A49F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:47:24 +0200 (CEST)
Received: from localhost ([::1]:35152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZ1f-0004x3-ML
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:47:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZ0-0006he-Ao
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:17:46 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:46818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYYy-0006Cl-NU
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:17:46 -0400
Received: by mail-pl1-x634.google.com with SMTP id q1so3995346plx.13
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kc+BmznUXwmW1pjlagM/yVLTM7/omr591S4lVhXMT6I=;
 b=aKtmofCBk4N0o1Hd7n0zDfJUllnQVItPRjRhTc9MPD5CdZQPkWA2XtVyWTDnO1jura
 mpus5QethwAOxQoAWngIxkaPNQJ3qjnQaG1NsiGyonxetmirOXR6tgwIRw3Y6PYsdwoX
 0U8K2C4acKTodN3huaEkXKQ4iOhq7JHuYr4hoQtVH0lCjk779u2DmtcGrD8tbCjdO0/w
 WX5H0d9CQHzz/s5qqkUI2GP/DEOeMQqJQ5UlU4DA2Y+3Djs+a0+SDhYqVaHUUljm6IHP
 LkKWeEjmZtI1ntXlHH4pg9jd0+ga9XFB6BGgnjCUz0gEiHuAhkBkEXEPllfd4yui7hHI
 y1QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kc+BmznUXwmW1pjlagM/yVLTM7/omr591S4lVhXMT6I=;
 b=2sT16GxlXZQQXBA/294nz91BrNY+rtFE6mwvprZXH4kqe1Np8gkM9H2ftlbWeK9Tl6
 bbPUAIqwrD963n/PF0ULw0JZLdqWInj+YWN6gU6zCZrqTat5DECkHB7t2u+4e1QyaypG
 3cG0XyGqR7kaXm/ZSLIlTYW2ofjcF72A86V0QvX64bArh7oycX6YRoijHRTRuXVneGcn
 7A4PzSAMSWCiZk5Ft5nkWKUcmcxrClYPDExUJpaGKuNRLLoIa3ZN1eARGAg1CY1FAIt2
 jGqk06g9/PsRj9SYPGXjuSrkLweg1vC/C0VxOWA+uGZ9rmCInJ07b/FTN348uJMBP+YD
 ZUTA==
X-Gm-Message-State: AOAM531mc5clpNoW70n3mXn7E5Smzp1Ct6QZV+FPvVOmjyjuBvvctrK7
 LnurN5I7LZoUlr//Bl85GNqb2KASef9WJA==
X-Google-Smtp-Source: ABdhPJzZk5yGpHlahsw9etbxusB8PQTZM92aQTWOars4EjH0r/HXpLt0BcBtuLJaS73HF5U8CgR3NA==
X-Received: by 2002:a17:90a:8405:b0:1bc:d521:b2c9 with SMTP id
 j5-20020a17090a840500b001bcd521b2c9mr10952630pjn.119.1650554263412; 
 Thu, 21 Apr 2022 08:17:43 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a056a00241000b004f3a647ae89sm24616248pfh.174.2022.04.21.08.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:17:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 03/64] linux-user/nios2: Drop syscall 0 "workaround"
Date: Thu, 21 Apr 2022 08:16:34 -0700
Message-Id: <20220421151735.31996-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Syscall 0 is __NR_io_setup for this target; there is nothing
to work around.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Fixes: a0a839b65b6 ("nios2: Add usermode binaries emulation")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/nios2/cpu_loop.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index 2e9296750d..91737c568f 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -55,10 +55,6 @@ void cpu_loop(CPUNios2State *env)
                                  env->regs[7], env->regs[8], env->regs[9],
                                  0, 0);
 
-                if (env->regs[2] == 0) {    /* FIXME: syscall 0 workaround */
-                    ret = 0;
-                }
-
                 env->regs[2] = abs(ret);
                 /* Return value is 0..4096 */
                 env->regs[7] = ret > 0xfffff000u;
-- 
2.34.1


