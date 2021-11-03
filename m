Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C3C44431E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 15:10:52 +0100 (CET)
Received: from localhost ([::1]:38142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miGyZ-0004qg-Gz
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 10:10:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwf-00025k-65
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:08:53 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:40616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwc-0004um-TE
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:08:52 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id b11so3032799qvm.7
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 07:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J2ekQZgUHFBwZ3Oz3uiVU6aBNOJi28RxLl6uhXrVgUY=;
 b=zJoZTnLPOBIuC6dwuFd5eQBMRhyNbYljs/S+k+EV3iT/ujQqq9KTP5EpLVFwZTHpRL
 CWSJDbjDjipP3AILc6KfDJS0B63XZm1proJAy79q4DX2FbufPhlZlX+4l/I00OqbSLTJ
 m5F5Gy3uLKaV6qYpo9vek0o+99wyLFDxZBvhXFDsRxeDhjOkzcosY3kuVRRCiERuM4f2
 14ZwzoFrDX69rN6XiDul6rikLp3j2XjdJi2xhECCMHNUyIXk3jcQb5JJy8zr3T4xJgD5
 q32/cfOjT0bKEiFT8WboQmo/a8b9Ee9Nzf7zE2uW+waRv7W2kfaFdXHbM6udJEV8YTpX
 g7cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J2ekQZgUHFBwZ3Oz3uiVU6aBNOJi28RxLl6uhXrVgUY=;
 b=f1eQ2iTPVjF5z3MipHi4ELq5MQ73vZ+WDtp0zLFGpQvhs7bGGrEib1MWQ6DLFFYrJO
 hflIye7NjTtEtCm99DO5wIFHwG5gKECsBqdj3ICxYAP5luew/mmlZFAHH3myNKobWeQr
 RaJwO6efGme9/cw/xjKi1DU5dL9Hjbl+q16pmVmermyauhsow8QliD+OeRUbZ/CFHzAF
 SRcjkDkAl3Pz2ho8BktGJwpQNAp0lQnzBE0Ce2Ijr4PLL/zk89FWBdeASEdvwwCbeOYM
 qWn1d5EO0Ltp4nl8rP3L1bRmQeLPm93yCIJhNuJg7pi7hdBiXQ4U5tUst9Mozz5oN8J3
 aubQ==
X-Gm-Message-State: AOAM532ufdffRZKDE9BetKgAt5IaRd0wiUqbIvB+QFVciPooIRZs3oJ1
 V6Gm9QvtqLVPcbl2Wx++mMVQ2ojC1rg5lQ==
X-Google-Smtp-Source: ABdhPJx0FvzACsCWUYZG6m2OBbFUItYcoJ3jzIpYJPEOtjowdBKJV/7866LnUm5vFOIdVc46ABsaog==
X-Received: by 2002:a05:6214:27c7:: with SMTP id
 ge7mr32075882qvb.44.1635948529446; 
 Wed, 03 Nov 2021 07:08:49 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id z5sm1669377qtw.71.2021.11.03.07.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 07:08:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/23] linux-user/alpha: Set TRAP_UNK for bugchk and
 unknown gentrap
Date: Wed,  3 Nov 2021 10:08:25 -0400
Message-Id: <20211103140847.454070-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103140847.454070-1-richard.henderson@linaro.org>
References: <20211103140847.454070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2e.google.com
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

These si_codes were changed in 535906c684fca, for linux 4.17.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall_defs.h   | 1 +
 linux-user/alpha/cpu_loop.c | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index a5ce487dcc..55ccc6ae03 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -715,6 +715,7 @@ typedef struct target_siginfo {
 #define TARGET_TRAP_TRACE	(2)	/* process trace trap */
 #define TARGET_TRAP_BRANCH      (3)     /* process taken branch trap */
 #define TARGET_TRAP_HWBKPT      (4)     /* hardware breakpoint/watchpoint */
+#define TARGET_TRAP_UNK         (5)     /* undiagnosed trap */
 
 struct target_rlimit {
         abi_ulong   rlim_cur;
diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c
index 4029849d5c..b039369198 100644
--- a/linux-user/alpha/cpu_loop.c
+++ b/linux-user/alpha/cpu_loop.c
@@ -86,7 +86,7 @@ void cpu_loop(CPUAlphaState *env)
                 /* BUGCHK */
                 info.si_signo = TARGET_SIGTRAP;
                 info.si_errno = 0;
-                info.si_code = 0;
+                info.si_code = TARGET_TRAP_UNK;
                 info._sifields._sigfault._addr = env->pc;
                 queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
                 break;
@@ -155,7 +155,7 @@ void cpu_loop(CPUAlphaState *env)
                     break;
                 default:
                     info.si_signo = TARGET_SIGTRAP;
-                    info.si_code = 0;
+                    info.si_code = TARGET_TRAP_UNK;
                     break;
                 }
                 info.si_errno = 0;
-- 
2.25.1


