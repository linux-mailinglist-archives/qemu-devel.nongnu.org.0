Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 622D9410928
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 04:06:13 +0200 (CEST)
Received: from localhost ([::1]:53590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRmDc-0000vb-DO
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 22:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm5G-0003tK-RL
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:34 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:37838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm5B-00058x-TK
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:34 -0400
Received: by mail-pg1-x534.google.com with SMTP id 17so13750166pgp.4
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 18:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lBh6JcQcK8YNqf7QKyfjXqmHzipOIrGfiM0/NJ1jpt4=;
 b=ZhjRJUYisDODW2KNACVP+JdEhj+jmD8Mr7+MM2UBT/zCgTVA5Rx7cvJMREbCJ0YbFt
 4PqRerzFOhRRb0kpomlwj+IP8dTibNNG/AVtowkzEQEp/1HRLQCuV11DztM4dtjCM8lV
 slqZ35eljBn4uQ3uXCn9R1rLtii7CNDuTGxZTYnywnvfKq41bp+QGs4DcTej4ayY76KC
 uVtK3QT5EQJiFj/cSZJn3sXWQpzKD4zd4y4OKvllx6JQNghSkKu6kLaQ1UHigXcNz9o9
 OhzJl+OJecA6abPakugzWXjK5aRdHf703fa1MfqHQle1cahV0Na5pyVAF1OJtGbVPkUo
 AuTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lBh6JcQcK8YNqf7QKyfjXqmHzipOIrGfiM0/NJ1jpt4=;
 b=Rq7Xt2wLnUE3R8KDmKJoIXNpAPx/U8/V+bNUN7jtz4Yahy4TkeGhEnGH1J8HtqRng6
 oNPOAqWn/MWQah6ND2GS0gIVBIcPOT3bbP8WIXNXF8c+1+ERh0tXDgC3+GhdZc6sk7Pp
 8XSDweDKHwYoaR1vrYdYNspBSOEEY1tluU8LNspUsvQ5AEJriGu81rUXe51cQTl8NdxI
 RxdLvOhj0s3WuhBvrB2W7pb4eGzlZ1VJPaneZ7aHu89RLgpznDbePoAlHxQvrxNwu1Qv
 PIYN69FytFVqRB8nby5tARK/U1a2sg4rZtHmV4tGPK9QYq6jbr1u8uEw6Bh3lcILEDUw
 Ki+g==
X-Gm-Message-State: AOAM533lseZGzNAlwV7W6awzgV3IxIqdaB3XRqGu+HRlfbmE/bp9pIbd
 7mWwWshfBbRC6TZJ4lnDjzit4ODly2l9Rg==
X-Google-Smtp-Source: ABdhPJxUHHRrZ3X+pzfM2YhsR+nQLWw/aY4AlS55DCnYu4WUfHl5ybMgS1DNA3EhnUkc3nmCAoXpvg==
X-Received: by 2002:a63:595:: with SMTP id 143mr17476095pgf.33.1632016647545; 
 Sat, 18 Sep 2021 18:57:27 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k14sm6747899pgg.92.2021.09.18.18.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 18:57:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/25] linux-user/hppa: Set FPE_CONDTRAP for COND
Date: Sat, 18 Sep 2021 18:57:02 -0700
Message-Id: <20210919015718.466207-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210919015718.466207-1-richard.henderson@linaro.org>
References: <20210919015718.466207-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This si_code was changed in 75abf64287cab, for linux 4.17.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall_defs.h  | 1 +
 linux-user/hppa/cpu_loop.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 55ccc6ae03..f9efbffe0c 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -688,6 +688,7 @@ typedef struct target_siginfo {
 #define TARGET_FPE_FLTINV      (7)  /* floating point invalid operation */
 #define TARGET_FPE_FLTSUB      (8)  /* subscript out of range */
 #define TARGET_FPE_FLTUNK      (14) /* undiagnosed fp exception */
+#define TARGET_FPE_CONDTRAP    (15) /* trap on condition */
 #define TARGET_NSIGFPE         15
 
 /*
diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index 10487df88c..a7177ab54e 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -159,6 +159,8 @@ void cpu_loop(CPUHPPAState *env)
             force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTOVF, env->iaoq_f);
             break;
         case EXCP_COND:
+            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_CONDTRAP, env->iaoq_f);
+            break;
         case EXCP_ASSIST:
             force_sig_fault(TARGET_SIGFPE, 0, env->iaoq_f);
             break;
-- 
2.25.1


