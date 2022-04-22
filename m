Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EB350BDC1
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 18:58:22 +0200 (CEST)
Received: from localhost ([::1]:59926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhwbt-0000Xf-Nq
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 12:58:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwWd-0000Ga-6e
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:52:55 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:42753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwWb-0007EF-NJ
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:52:54 -0400
Received: by mail-pl1-x62b.google.com with SMTP id s17so12081411plg.9
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nqaKUgAiXbPVN3N+PzEnaP4AnWTK8+75oezV6iZmBrU=;
 b=Dr5UbS8J6Y8I6/+XtI7ZABqz/46vna2FPcN+tASrPITgzKHRLs+aQPyBa+zAFgTpjs
 fwI8qrvUuC+BvfSawPqEoWWm3adwFJggRbuMr6ugVn6oYhj2XefnAbJjEY+/lDvLiLRN
 vPqcB1D++VdWiyV3LEwCVmt2UE1VMGbr552GV2Sjuma8CDUbA0Mv3WoWYVG1dxofG/Ko
 qdDQCn4fp+CVYKhqtfEn5nHVGC32tLxkj3baxhJTZquuS8aTOHg+rIwFHB3oM0kBArdO
 UxqpNAnkWVdLkjDORNcxUBOWWQPU7HyZCed1zCBSziNGt6GRRY+O0WjkZi3HSAD+DJO4
 a6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nqaKUgAiXbPVN3N+PzEnaP4AnWTK8+75oezV6iZmBrU=;
 b=vYltFXSzKzTdYkOSRPEL59TuSpS4qLLviEN55S0ihOeUGMbdr4KpPeBs7JPONlwop8
 IQ/hPq3ZEOAhPi9s5r6p5JvpTAImYC60dsshUB7nOLeXCREaYj1gim9xWODOdctoZ9fU
 gSgXJ1cYCWFolxOB/Dj+5ECsCvln4gqEER30aNBTfANcE6qv+WPVDbbutwNIWlY9TaRn
 Bj/mLTr+WeLf3nyINibnpY3PQmAdKwGwUWkdF/uIIKT0BCbKYyn3w3wYjxHWa4ORMfTu
 O37EJFYUP90SZMfpg29s6givjDbnhXE2amTOmZR6S2m9cxzZ0njJrt8ch9g1VmYYkil0
 LD2A==
X-Gm-Message-State: AOAM530KmYPvYZgPsRQDgiNB3iUO+J9c4B7xkoooRzqehwEdiLlzOW3m
 C+JIKcsADUeOz0M7VFimUM+D5fRxYrjbbGz3
X-Google-Smtp-Source: ABdhPJy2hl04DWixkSSOcSq0Qd4QHLXnd+wOil+UBKQm9eu+gr9ASaERM55mSylhSkK9vrh0pq8GhQ==
X-Received: by 2002:a17:90b:1808:b0:1d2:77f9:639a with SMTP id
 lw8-20020a17090b180800b001d277f9639amr6260369pjb.57.1650646372358; 
 Fri, 22 Apr 2022 09:52:52 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 6-20020a17090a030600b001cd4989ff5fsm6835904pje.38.2022.04.22.09.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:52:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 06/68] linux-user/nios2: Remove do_sigreturn
Date: Fri, 22 Apr 2022 09:51:36 -0700
Message-Id: <20220422165238.1971496-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

There is no sigreturn syscall, only rt_sigreturn.
This function is unused.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-7-richard.henderson@linaro.org>
---
 linux-user/nios2/signal.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
index 517cd39270..133bc05673 100644
--- a/linux-user/nios2/signal.c
+++ b/linux-user/nios2/signal.c
@@ -185,13 +185,6 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     unlock_user_struct(frame, frame_addr, 1);
 }
 
-long do_sigreturn(CPUNios2State *env)
-{
-    trace_user_do_sigreturn(env, 0);
-    qemu_log_mask(LOG_UNIMP, "do_sigreturn: not implemented\n");
-    return -TARGET_ENOSYS;
-}
-
 long do_rt_sigreturn(CPUNios2State *env)
 {
     /* Verify, can we follow the stack back */
-- 
2.34.1


