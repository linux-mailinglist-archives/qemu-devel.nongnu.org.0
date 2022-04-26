Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE48510744
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 20:39:55 +0200 (CEST)
Received: from localhost ([::1]:58852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQ6L-0007tu-R2
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 14:39:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmb-0002ci-Fe
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:30 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:46853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmZ-0004Pz-Uy
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:29 -0400
Received: by mail-pf1-x436.google.com with SMTP id j6so16380692pfe.13
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XWBe6x9J/Z2cYvBtaKJvqh+NFZjbIgZiKhNrx43HC0o=;
 b=TD+T1mZ4hjt2wuHTYsr8xHo7bG18IAWwTl4YNmoEKB5g+eRwGjp7kbJi1XTjaC2m32
 JRcj0WafA66XWt7XJsKJmuEkBTRl39DAj3QimHAp4s1CCgxNVD+NFe8skpya0QCGjMMd
 AmU3u7OHoLQfNrUpq/FW6043hxR3fLmbjHrEpUn0DrZhEsaweZXOV1Lo/zjth5jWcZRf
 5bmE7CgN+5wayGtQrvMYD5oh4xLGllDNczie9bRMioAGYdXlU9EmOwTZolCLXROPZNTW
 QgeycLacvnNeQS3vSmeqN230X/kjAdblr3R52xal3Cm+Hz6JsZtmblGU9jc0j+uLK5QH
 LQBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XWBe6x9J/Z2cYvBtaKJvqh+NFZjbIgZiKhNrx43HC0o=;
 b=EpMDWNDFEHM8LAyp1OCD2wAjGYkC65HGCha84YrhgYCfc6G4p9hANBzVAb/FX9WMsu
 e68XNj/f0Y1a62l8FSG8GE7UTHEifFX20HU7wlbMjJrg0rREcTSFHkzLQGNyslliUTtg
 mt1lAhozO9PZirHACzdkgheo+mFRlA87/SMNNTsfSVWzyax7y0KHOCpgGljShDO00WAb
 yuQnszm2EcHOek/ucXUWImCdFXw7UOQ+/y1Hp0CppJaboNeEA0PFrJYI6YAQMhiNYTFg
 GfWABBAcCYlxaEfLCbReboKpiDUqgO6qZqqt4dHXHN7LP5Q/DWl94kM0cTfiZI973r7o
 OGSw==
X-Gm-Message-State: AOAM533efvUnF23FN0t/xxj1J6i4rCgzjxT9EvmeaGQijKngOYr9s/TD
 qxRWWwwb84quJ2yG1+C9RGULm6jmlsHkWA==
X-Google-Smtp-Source: ABdhPJy95I4USoGF2lAWUUg8Y+9YJPyiYXlxke2hoVWuUSsEP+6eNA6owiUjQck+bP8RL7ma7BXtcA==
X-Received: by 2002:a05:6a00:1943:b0:4cb:79c9:fa48 with SMTP id
 s3-20020a056a00194300b004cb79c9fa48mr25628813pfk.47.1650997166606; 
 Tue, 26 Apr 2022 11:19:26 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a056a00130700b004b9f7cd94a4sm16482827pfu.56.2022.04.26.11.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:19:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/68] linux-user/nios2: Only initialize SP and PC in
 target_cpu_copy_regs
Date: Tue, 26 Apr 2022 11:18:19 -0700
Message-Id: <20220426181907.103691-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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


