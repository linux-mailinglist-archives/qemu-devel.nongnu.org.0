Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7174DBE02
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:14:00 +0100 (CET)
Received: from localhost ([::1]:58472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUiSV-0002jg-27
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:13:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKd-0000Zf-T8
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:05:51 -0400
Received: from [2607:f8b0:4864:20::535] (port=33682
 helo=mail-pg1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKc-0002Dc-3a
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:05:51 -0400
Received: by mail-pg1-x535.google.com with SMTP id 6so1807890pgg.0
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V6MtvqowYaVi0x7SdYoHS8WdpajzKex2EuqCuCmkLJA=;
 b=OJAPnaFVm8IoIR0xvAbBHoCmcVnrt/pahQ+wX0DPATQV7X4LiPqr3DCyOROoVkn5q4
 fRNur0iUNU1TSWsF1KyEnkZEY/zF0e9Bd+GVI2sf3DOkZvxHXVZtBvy+FBs26ZmDAthP
 QzuqdDStnmhyXY/tGekuvra02hRWpRiY11tuzZ2MraCuubV3ryiBa6dlYSaSGti6PcbW
 mh78qFASJev05H+YR6gQ4MgX3NnqtxvODMeOqnxr5pcfrewkhHfqiHtVZf+JKc2+XHea
 ZL6nBkN2tpXJP3YEksZtJIwyZ04JJXLASCJVbZZSjhsw+RNjGJioEF4I7SjiMnq3plgj
 Mnjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V6MtvqowYaVi0x7SdYoHS8WdpajzKex2EuqCuCmkLJA=;
 b=ScZZi+mNQOofP99oxyg2sFO4k8frl/cyn6ZVlQovvThqaUid8NSItm0Tz8M9YNd8Dx
 jreQ7F5CFuvsiX10XEDg1JRwLYbDMByI7Y9s1ZasOhRbuzCXTZoGuqFOSU4vNA2mgkkk
 vNkqwHfxtGlq8qzBiymrnoy04aPvN6iWHIYaXShnXZcB4yIFPaleF9EB7o9i1F7C/+qS
 BhMDY9H/x3kRu61DJAbLp4qXhbRfbCukRk73SlOm+dSJC9H30Il86YaMcy+T9z5cU4ls
 lg3NJZsNz4ebtuA/nmkVivvfz9cTxWTxmQPwEbmnSnmebD92f5X9h73j4ZCF5PJ3w3P5
 /+tA==
X-Gm-Message-State: AOAM533e/fE6+oMx7aj+F282iDomsUaAaZAC+VddBAlGO+0vA6jrM5kp
 pCrjsrPEsPfZp3xgtF6Q50hQQlPHhnAL2g==
X-Google-Smtp-Source: ABdhPJxzLUntpnZjgOlH679YshM7jMyWSCdWgA4ihvGcjKr5EIvh9MzC6OfOZj/kZNL+6/0tqJs6KA==
X-Received: by 2002:a05:6a00:885:b0:4f4:17d8:be31 with SMTP id
 q5-20020a056a00088500b004f417d8be31mr3016859pfj.57.1647493548767; 
 Wed, 16 Mar 2022 22:05:48 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056a001a5600b004f7c17b291asm5101357pfv.87.2022.03.16.22.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:05:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 09/51] linux-user/nios2: Only initialize SP and PC
 in target_cpu_copy_regs
Date: Wed, 16 Mar 2022 22:04:56 -0700
Message-Id: <20220317050538.924111-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::535
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, Peter Maydell <peter.maydell@linaro.org>,
 amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Drop the set of estatus in init_thread; it was clearly intended
to be setting the value of CR_STATUS for the application, but we
never actually performed that copy.  However, the proper value is
set in nios2_cpu_reset so we don't need to do anything here.

We only initialize SP and EA in init_thread, there's no value in
copying other uninitialized data into ENV.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c        |  1 -
 linux-user/nios2/cpu_loop.c | 22 ----------------------
 2 files changed, 23 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 23ff9659a5..8c85c933b7 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1096,7 +1096,6 @@ static void init_thread(struct target_pt_regs *regs, struct image_info *infop)
 {
     regs->ea = infop->entry;
     regs->sp = infop->start_stack;
-    regs->estatus = 0x3;
 }
 
 #define LO_COMMPAGE  TARGET_PAGE_SIZE
diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index 7b20c024db..fa234cb2af 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -132,28 +132,6 @@ void cpu_loop(CPUNios2State *env)
 
 void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
 {
-    env->regs[0] = 0;
-    env->regs[1] = regs->r1;
-    env->regs[2] = regs->r2;
-    env->regs[3] = regs->r3;
-    env->regs[4] = regs->r4;
-    env->regs[5] = regs->r5;
-    env->regs[6] = regs->r6;
-    env->regs[7] = regs->r7;
-    env->regs[8] = regs->r8;
-    env->regs[9] = regs->r9;
-    env->regs[10] = regs->r10;
-    env->regs[11] = regs->r11;
-    env->regs[12] = regs->r12;
-    env->regs[13] = regs->r13;
-    env->regs[14] = regs->r14;
-    env->regs[15] = regs->r15;
-    /* TODO: unsigned long  orig_r2; */
-    env->regs[R_RA] = regs->ra;
-    env->regs[R_FP] = regs->fp;
     env->regs[R_SP] = regs->sp;
-    env->regs[R_GP] = regs->gp;
-    env->regs[CR_ESTATUS] = regs->estatus;
     env->pc = regs->ea;
-    /* TODO: unsigned long  orig_r7; */
 }
-- 
2.25.1


