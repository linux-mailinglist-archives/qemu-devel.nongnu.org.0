Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3164844435D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 15:23:22 +0100 (CET)
Received: from localhost ([::1]:42322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miHAf-0001l0-Av
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 10:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGx4-0003NG-4b
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:09:18 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:43961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGx1-0005Lb-Ug
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:09:17 -0400
Received: by mail-qk1-x72b.google.com with SMTP id bp7so2345046qkb.10
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 07:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aSGoNpLJmGSYi5bNrETBfs3C1lY0kiG6L8JLO5qLPZk=;
 b=Wqd4CS5XGxU3NVIgsYd88Auk4RqpxUhlmGbeuszjR7kGKz0IxEdCJIWTmeGGDx832m
 MO6qpxCnRpEGcok0+FYdIh0UnPHkH47VOJmFXlrukDxTCT1lUdHmWVTkctU16rSSFdw6
 YFK/mrhjUxkHsymHSY9N0pI5e8GvER65+PmVHY62pT3d4qYwTs/B5I8Wb4jhfLbHFCS1
 a/mXXnYwUXdmH39oRiZzUWJJOnTluxInY7hR8TRY8+3OndH6nKhRfVy7bVu65OxE1mPg
 OwE/KVc4qr/fKU2sAGYtho6mlKucnFOj0oXgH9p/JDZBiP0dlM9g3uIcannMbv5Wth9O
 P3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aSGoNpLJmGSYi5bNrETBfs3C1lY0kiG6L8JLO5qLPZk=;
 b=BesMvOFz7dVw4WClpaqtPR+CdPNG1an7kLLGUNIor9hteCX0VQH6JoKbqvGS2+5Eew
 8Ux+3AWA5KaIW/OotbxcW1RJcoSY/YNn8gh/lWBLscJa7LGnvZeWnUJgrbbI66O/u50t
 AWzEnhinDI9TZ2/RROrAIbpq223kBL4HzKjS3B/9I+3jAmv6Yp8DE/IZi+B8Et+Z1SM9
 V8RTue0eYvqDS0iShBGsHJQeS5Lo7FJPTN9wBj6NfV0hdrska9Mw7YEX0kqy0AL4x72e
 kmXYy6resurDupmNLSeNf0gtu/w8Onn+x8NA7PaLr3+pdaEF5Zl4DDRvZjMsz6joV1lN
 CLKQ==
X-Gm-Message-State: AOAM533nZk941TSolZzNfowDD2yIlXhOgCkoMrpxqlgN3T9DPHTDMFOW
 lFbQF0QVUrk0/hQvvv7vfvyNWjmnpRN1Iw==
X-Google-Smtp-Source: ABdhPJyP4Sj7OSFk+7GHTigGfdMaalleeWQb+QiviCdPRhIhy4ccAXlbJDlj5UBSg8hpmLCSvLr9lg==
X-Received: by 2002:a05:620a:4588:: with SMTP id
 bp8mr28073316qkb.292.1635948543552; 
 Wed, 03 Nov 2021 07:09:03 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id z5sm1669377qtw.71.2021.11.03.07.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 07:09:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 22/23] linux-user/sparc: Use force_sig_fault
Date: Wed,  3 Nov 2021 10:08:46 -0400
Message-Id: <20211103140847.454070-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103140847.454070-1-richard.henderson@linaro.org>
References: <20211103140847.454070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72b.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new function instead of setting up a target_siginfo_t
and calling queue_signal. Fill in the missing PC for SIGTRAP.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/cpu_loop.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 0ba65e431c..b3e44bc1aa 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -155,7 +155,6 @@ void cpu_loop (CPUSPARCState *env)
     CPUState *cs = env_cpu(env);
     int trapnr;
     abi_long ret;
-    target_siginfo_t info;
 
     while (1) {
         cpu_exec_start(cs);
@@ -241,19 +240,10 @@ void cpu_loop (CPUSPARCState *env)
             /* just indicate that signals should be handled asap */
             break;
         case TT_ILL_INSN:
-            {
-                info.si_signo = TARGET_SIGILL;
-                info.si_errno = 0;
-                info.si_code = TARGET_ILL_ILLOPC;
-                info._sifields._sigfault._addr = env->pc;
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            }
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC, env->pc);
             break;
         case EXCP_DEBUG:
-            info.si_signo = TARGET_SIGTRAP;
-            info.si_errno = 0;
-            info.si_code = TARGET_TRAP_BRKPT;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
             break;
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
-- 
2.25.1


