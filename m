Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EBA50A462
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:37:07 +0200 (CEST)
Received: from localhost ([::1]:33752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhYri-0008Gw-Bv
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:37:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZT-0007S5-Qa
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:15 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:37813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZO-0006Ib-Uo
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:15 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 mm4-20020a17090b358400b001cb93d8b137so8023279pjb.2
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HXZTY79ogdU3cuAmQiOEqFI8HiKCYgS/bxD1qQ4VBwM=;
 b=JjMjdW/UXeVYH7d8YJ3VSVXohTIXUzi6KLoJIQHcpGEwfvZYkAT60P1gyN+kPeBzaI
 aBTtw4g5OmEx6kQ+U03dEjNdbepTb+94iVVjNiz4FzRE1GiUCWEZJVrQj3fzBhFD3RMo
 zYbbonELEYS6Wc2L0S92c15cHqZ+LBDV2mek8L6PmEu7JRAW9sG5s/LRLodbpEUgLb0X
 okyqK7bpj12Rpm64gmz/CtAiv05TbOFKK8dzT81/JQJNYcVIZGZKfH2iUnNuAEtPAURF
 4P6uxaF54/BVLCuWqoeOqgRZPOqA4cdC5qmZrigUxQ9scs0wjjaDMzXx+FDPrDiVHKJc
 so3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HXZTY79ogdU3cuAmQiOEqFI8HiKCYgS/bxD1qQ4VBwM=;
 b=m9ZCFbRS2mTTDeTAwKMJH1FbgAUjSgD45BqBe5MWRRE38dsO2jYzqjEIsHKymcEV2C
 XAVWNMVneoxoWNtRUhfrpR85sSLxk8is2IKTnrc04h89x2+OaFv8wqCgkasGKtaJoErG
 s0dobAJrNS768f7UJr1lmLMEM6l2AGy/MB1SwriKXRPyJMo96dMmQMdmlTr/VFU902du
 nj4RqZLiI74GzsHdI4yNyeS2BBcgWlCxCX3NtXzQPP+oDd8kkhzC7wA6qe/0aFspcmiy
 /ClceY1ejhKP+DuagPj1NlifKythaBqfl+D2jBVDGCNifgTr+fkDhyjEYw2fbSZr1u/m
 TV6g==
X-Gm-Message-State: AOAM533mshn0uUqQWAtqWp8RcSJ9ynvyQdyjvt3gIkSXki7RzVJgh4Yf
 6f2LOLg3VD8lSKSyoBN4l9/w0+t7L9z5rw==
X-Google-Smtp-Source: ABdhPJyt4D88Sh2e6SFIFJUcoQYcO5sgE7jIjObbPBMqd4AVMS3llwqeYljOibO8bZxH22fBfxr+ug==
X-Received: by 2002:a17:902:b906:b0:14f:76a0:ad48 with SMTP id
 bf6-20020a170902b90600b0014f76a0ad48mr26683471plb.79.1650554288825; 
 Thu, 21 Apr 2022 08:18:08 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a056a00241000b004f3a647ae89sm24616248pfh.174.2022.04.21.08.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:18:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 20/64] linux-user/nios2: Only initialize SP and PC in
 target_cpu_copy_regs
Date: Thu, 21 Apr 2022 08:16:51 -0700
Message-Id: <20220421151735.31996-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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


