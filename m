Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC3569ECA8
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 03:02:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUeQx-00034j-0p; Tue, 21 Feb 2023 21:00:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUeQs-00032n-SR
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:00:34 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUeQq-00013t-Qc
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:00:34 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 nt5-20020a17090b248500b00237161e33f4so4834792pjb.4
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 18:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nN1Nd19UG7Ob6HhOyu1ZExnb36Rzel7CeIAQhipYNRY=;
 b=j9n06ynxaS0F5kR+CHFeJ7ySRkcjI3DdScemCh4CqaPv4cror1TVmjW85Fe3fwnFNH
 yLXQK3Fj8MBeLQQlSZllrc31ZvC3Ax7xkcU9t8Kc4T+5RIOwBc5KlzJ6ksGi5PdQiVhh
 9h6W/+BAJi5rLYw/oDScVo1/HIzp+Uk3b2lsczQ4WqyNfKy+SYLP/k2y9Ut+f25N2K63
 1QH3dciqBbgc4OiZArWFLOEB9xGrYOayggFgfAefolEk+0g7zDBOBbHx5paWAWSWcVLU
 yzgeCMG/2MoGW2qDLHpM/wRQm7tyqEEBQKgmF+OgvKzVhtFHwK5UOUUHzT10KWkrAFKH
 rneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nN1Nd19UG7Ob6HhOyu1ZExnb36Rzel7CeIAQhipYNRY=;
 b=7LACxOH60cdGikvFVXg0ts5NFQ5QfSDABz3MCG0niEy4QlyYKeMsc8AipMtBqeYsBF
 isXJQytPvfQFSZL9XIskPIWT1agDfGWW92AdcS2MvmmUNtNGykb8cWuUN7aqnCczszOC
 UufIrVOYFPgPOvIUt/0wJOE8IGaTbhSBI1yni3L010WQy5rqm55XDriKZeyAIj+JGean
 cXdfI6MRSqnDsBjJIC9EBJJXIpoOQ+VnxEz2/UviRS1nB2zTFT2vX11hpGVeB3kofZw6
 L1iD2AMyyjdMLydElvzmUfPuRJ/2f7wja+zx/Tb1uYXInXUrHbxDZl8TFbmkt6ZZI4Kd
 bpiQ==
X-Gm-Message-State: AO0yUKVtywinz5zUkhBjafk1e1xCBtdAE72oUYzcqTp4RevavkpqDgAZ
 +ogt68cJyRDVEefrPrgSN6incJI4qOvpHQifoJE=
X-Google-Smtp-Source: AK7set+PvmvUFyl0Wy0Eysf2WHuSEMGPg3hvGoN6tRoUqhUx7VcEwLjCzEfcjp/iCaGXSbqXN6m54w==
X-Received: by 2002:a17:902:c94f:b0:196:88b8:8616 with SMTP id
 i15-20020a170902c94f00b0019688b88616mr8337734pla.5.1677031231455; 
 Tue, 21 Feb 2023 18:00:31 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170902c10200b00189743ed3b6sm91468pli.64.2023.02.21.18.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 18:00:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 3/8] linux-user: Always exit from exclusive state in
 fork_end()
Date: Tue, 21 Feb 2023 16:00:18 -1000
Message-Id: <20230222020023.904232-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222020023.904232-1-richard.henderson@linaro.org>
References: <20230222020023.904232-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Ilya Leoshkevich <iii@linux.ibm.com>

fork()ed processes currently start with
current_cpu->in_exclusive_context set, which is, strictly speaking, not
correct, but does not cause problems (even assertion failures).

With one of the next patches, the code begins to rely on this value, so
fix it by always calling end_exclusive() in fork_end().

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20230214140829.45392-2-iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/main.c    | 10 ++++++----
 linux-user/syscall.c |  1 +
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index 4290651c3c..4ff30ff980 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -161,13 +161,15 @@ void fork_end(int child)
         }
         qemu_init_cpu_list();
         gdbserver_fork(thread_cpu);
-        /* qemu_init_cpu_list() takes care of reinitializing the
-         * exclusive state, so we don't need to end_exclusive() here.
-         */
     } else {
         cpu_list_unlock();
-        end_exclusive();
     }
+    /*
+     * qemu_init_cpu_list() reinitialized the child exclusive state, but we
+     * also need to keep current_cpu consistent, so call end_exclusive() for
+     * both child and parent.
+     */
+    end_exclusive();
 }
 
 __thread CPUState *thread_cpu;
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 1e868e9b0e..a6c426d73c 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6752,6 +6752,7 @@ static int do_fork(CPUArchState *env, unsigned int flags, abi_ulong newsp,
             cpu_clone_regs_parent(env, flags);
             fork_end(0);
         }
+        g_assert(!cpu_in_exclusive_context(cpu));
     }
     return ret;
 }
-- 
2.34.1


