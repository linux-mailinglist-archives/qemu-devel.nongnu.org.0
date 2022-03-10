Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B23D4D45ED
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:40:33 +0100 (CET)
Received: from localhost ([::1]:50228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSH9k-0002gn-Go
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:40:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxG-00055C-PQ
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:38 -0500
Received: from [2607:f8b0:4864:20::42f] (port=33513
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxF-0007w0-6R
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:38 -0500
Received: by mail-pf1-x42f.google.com with SMTP id s42so4889778pfg.0
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hT9+kz2FAkTBjPGP7wP7XlOIGomdVd803xe/PZq0Q4s=;
 b=bWeHWB3vjwbcZuJKqb7uF2HS60ggyIyHzls7IPzcRjRK9xxeKLRxRdWHhMuy+NNt6U
 vK8sjn1QWLsjA8sII0yg0LSIXaYoFFaRkmoXKJaaPeOcNYzv4KT80BX+a/xvcoR5dyDl
 zwrLeOG5mjRGasLC0MWsfjkc0XebbhCumbunuONl2IO6t2u8HufxYZitGon1WWlMXrFD
 IVDZPbDBWhBqM3ncR8h85YMFCkBuw5Onkjfk6VXXyDckB19MZIGUGAunfY64CXQPJsek
 DiMuMYzDcXzs1cW3ufOlz5fZ1Z48jxR+Ja8elMJq5T2uXQZPmDSlNRafNfd/t9wXSjgD
 jBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hT9+kz2FAkTBjPGP7wP7XlOIGomdVd803xe/PZq0Q4s=;
 b=4MdOQFJBShuiiPQDK2R25BN9ZCjOb47jXvp8dyYW046cn8Avd6qMlg5uumb29sNnb+
 hy4KHUu0xjN5OiXsP/XKHZIEziOiX/bMU3WPvNv4QxE8Qr2R3kKx/WO1X/BYzgoQQDu9
 jGPDRVUka4aHVyRStSJJ6h0k9Q61iGPwPVF3mumnt4b4Rmbb9Wzh89+JGoHZIsJEraEl
 +6n2vvkk+kGAjY4S7EbklDKrz2f7VY6/Vec2rGDgmyqGrQ8bBcdgEfOVEOPRxCUKmMEW
 RexbdM9Qjuj9duJ6Io1hkavSuZCR53fhp+N69IO61WUSmfZwlrdOHL51lWAyb2eOjgbT
 fGOg==
X-Gm-Message-State: AOAM533pihM4NgPoEQvxW6ynGwgCEQPmWqpsqMwSGfJXIAoR1uqL6Xs4
 I5yR1ZiKNTwm3wCp617vhzW/kMj+qUXv1Q==
X-Google-Smtp-Source: ABdhPJzY5Yc/zzyNnpafew8AsGJYvj8cOMwzzAmmrEePRi2MzrDvzKlHWAu1/A/q/EeesTrnvX3JQw==
X-Received: by 2002:a63:824a:0:b0:37c:94e3:e7de with SMTP id
 w71-20020a63824a000000b0037c94e3e7demr3723745pgd.496.1646911655857; 
 Thu, 10 Mar 2022 03:27:35 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 js15-20020a17090b148f00b001bfc8614b93sm3114977pjb.1.2022.03.10.03.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:27:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 08/48] linux-user/nios2: Only initialize SP and PC in
 target_cpu_copy_regs
Date: Thu, 10 Mar 2022 03:26:45 -0800
Message-Id: <20220310112725.570053-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Drop the set of estatus in init_thread; it was clearly intended
to be setting the value of CR_STATUS for the application, but we
never actually performed that copy.  However, the proper value is
set in nios2_cpu_reset so we don't need to do anything here.

We only initialize SP and EA in init_thread, there's no value in
copying other uninitialized data into ENV.

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


