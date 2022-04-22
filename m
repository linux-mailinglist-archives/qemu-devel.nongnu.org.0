Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD4E50BE6F
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:18:08 +0200 (CEST)
Received: from localhost ([::1]:47006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhwv1-0007VD-2Z
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:18:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwX3-00010O-5V
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:22 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:35429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwX0-0007IJ-0N
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:19 -0400
Received: by mail-pf1-x435.google.com with SMTP id w16so2091371pfj.2
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XWBe6x9J/Z2cYvBtaKJvqh+NFZjbIgZiKhNrx43HC0o=;
 b=rdnmV0Va6mXmloGySB16UnCvTCrA2o8LxsFX51ERShjg7rB6JOGQzRAwtUzxREREFw
 14uYo6J8vc6XbEfCABVM2+jfEHArHhlT1mVeNvbH61SBb0v2Eqrf73Kj4jdk1JM3MBfD
 p8ZkKyLyxgltCf95YmRsw8BfOnQNx+PUyB/jmUN0cSMhuZq2oikkpX1mu3CyAGyE5JPS
 kA/5NWFS2V2ov5po7/FCnWlLLM7wzanzRsMj9iz6k9CQAtqyhz67z9TPqEmNX11hzYmv
 beeas0IQc7GvxAV9v2HOCL71FYwiX6wjbyMpun3f0Fk1RKHeYhGFZvKQBxMVOKlIMcdQ
 Amow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XWBe6x9J/Z2cYvBtaKJvqh+NFZjbIgZiKhNrx43HC0o=;
 b=wsP/Ckjuz3EcEhT+KLnk8Hho3/OXKChXxy7L4SB9yuCVT6rSUjE2MpZzhJLmldr+zt
 zPzz51CG2G3AP0o99OWB/6sddtuR3GXs12KaQgE5HiDXsv8QOZXXPuo/1CI8sQHyL8zm
 6SAfhZZ6Wby73fgbZ+Ohzr4QdQT/6OttR81692/+KvAkj6dV4DNX8S0TNAIsjlPP19+P
 fJfm1H4OeGmpoBbB2eyyqjjDUZNM+5PQcrzgXQGJSV0iYakkzR3Pn5f3aZvutT/baF1h
 8udxNDSmiRlbnvnuSwMpBfybcLR8H/Qf16/70rIVLMuTUcAKqJp1c7ihTrIctQZwA8i2
 q8VA==
X-Gm-Message-State: AOAM530R3RPgrhP1OYmL88GPlHN/2JK1/cYoWeiWRPRWBvecbrjpgtXx
 xyOP47LPNFJ9B5waC4buJmN2gwDk13es0vRL
X-Google-Smtp-Source: ABdhPJyf4J6jbFYsGRCCJXN5mkLsN99p8j8jbr6AM+tr7iopx2O3XCkQKpAIvnFuNYtwcLHP0ktdUA==
X-Received: by 2002:a62:a50b:0:b0:4f7:4457:a48a with SMTP id
 v11-20020a62a50b000000b004f74457a48amr5784119pfm.50.1650646396528; 
 Fri, 22 Apr 2022 09:53:16 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 6-20020a17090a030600b001cd4989ff5fsm6835904pje.38.2022.04.22.09.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:53:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 20/68] linux-user/nios2: Only initialize SP and PC in
 target_cpu_copy_regs
Date: Fri, 22 Apr 2022 09:51:50 -0700
Message-Id: <20220422165238.1971496-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

Drop the set of estatus in init_thread; it was clearly intended
to be setting the value of CR_STATUS for the application, but we
never actually performed that copy.  However, the proper value is
set in nios2_cpu_reset so we don't need to do anything here.

We only initialize SP and EA in init_thread, there's no value in
copying other uninitialized data into ENV.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-21-richard.henderson@linaro.org>
---
 linux-user/elfload.c        |  1 -
 linux-user/nios2/cpu_loop.c | 22 ----------------------
 2 files changed, 23 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 397dec5eb8..61063fd974 100644
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
index a941f9032e..c5e68ac048 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -133,28 +133,6 @@ void cpu_loop(CPUNios2State *env)
 
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
2.34.1


