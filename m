Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8BA56BD1D
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 18:01:31 +0200 (CEST)
Received: from localhost ([::1]:53460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9qQ6-0003Ja-4T
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 12:01:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pjX-0004Pt-Ne
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:17:40 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:43563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pjU-0002Or-TW
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:17:30 -0400
Received: by mail-pf1-x42f.google.com with SMTP id b9so7753890pfp.10
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QXu/KgUnFX9XdonKOb4RpodqXgfNtkqVhXPaRa0Wz+g=;
 b=iPqiAvNnaPHiE+AFIGN3QAnhp87OHXfDLk7LAnf0PL92ygxf9A/1QsN8BOPsAA89lw
 4tkayynTtTHbSXgy5HFOAqxP+pvV20i6XZ3jd8pMmu/VP1DrdIUsmAbp+9lL4GD8GDyN
 9PQcUZzU27o/FB5ctTGsLVVXVRhV5mfb1bMBwXHYsCov9RQnMk4iKojYCq6xAhelh30N
 H6LF3VNsSokP9E+fxT5jj8O44Ajzp45v1gxk2X1iTqDjwF9PWHqGAkba4s/mH/KY9rak
 UF2R2/uOAekTQM9WyEYuSIPqcmYpyXNmQP2b3scGTLtW7WMpVvCOoSGW04V+QsCu8lqD
 w+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QXu/KgUnFX9XdonKOb4RpodqXgfNtkqVhXPaRa0Wz+g=;
 b=pQOcZreia5t64unblz9IePqjUeWWZ0AUHM2ojxvg4s6nyPn16dFcVA0q7JoAldYzaj
 dvriVkDnZYeon0rNEk9c2KjgGlLpov0Rw8TIAxXcbliQIuMTY/JV7zjLHWut7Z/KPZgx
 PtlsQCKBnYK9XvHCMTsE+9RXgpMEyZNYLKswifWOd6+PA/h5yEcThdt2YalICM3xLHu2
 +psQviFQMh31Zjl4f4JOtmRbAdmrGYINv1YQSxXhCT/VVBMKjtj+XVN64NydgIRUuiCw
 DSGyFa5xPjsmLvegdLCMnILBNTOk21UeEccVaS1MUhiS3rc6PG8yOlMitv1YCKeAqsw8
 HZdw==
X-Gm-Message-State: AJIora9Vn2c0ujmXDBbNdBsAzaXFArmEKncIrr5qdCneZf9fva0hxIP2
 4iTW8Wz2rKXAOpDpbPXgNP/nAi9X1r24SVdV
X-Google-Smtp-Source: AGRyM1tcTUNPXzYLbYG53zQbeJ/Ny4BkgYTG2GNr661Gkx9SG8y/fchdEvVhl1sQWUfNSixjgJejGw==
X-Received: by 2002:a62:29c2:0:b0:527:ab6a:c310 with SMTP id
 p185-20020a6229c2000000b00527ab6ac310mr4239129pfp.12.1657293448077; 
 Fri, 08 Jul 2022 08:17:28 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:17:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 34/45] linux-user/aarch64: Reset PSTATE.SM on syscalls
Date: Fri,  8 Jul 2022 20:45:29 +0530
Message-Id: <20220708151540.18136-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/cpu_loop.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index f7ef36cd9f..9875d609a9 100644
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


