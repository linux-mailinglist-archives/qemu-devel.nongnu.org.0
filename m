Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B92FF41F167
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 17:43:25 +0200 (CEST)
Received: from localhost ([::1]:55320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWKh2-0003YD-Fw
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 11:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWKY1-0006fM-LT
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:34:05 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:41945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWKXt-0007k7-Lu
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:34:05 -0400
Received: by mail-qk1-x72a.google.com with SMTP id m7so9492388qke.8
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 08:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F9yEwPrmR9xpxjbUMZcvWlIm4BrVKkXnEjUbM9qs6VM=;
 b=o5YqmOZ8FQBpCsn3z4vAOehwAN/laf9MPTJhYFBaERaLSGNW5YWCYzLnKFmjDVJBpY
 nhDH4Pu1UY+3kJS8mpObw5e8sfY9wSKtnW+Nilgr+M7wVFAqjXhaaoLgnN+gV703rkPw
 uaSDs9KpDJ1b8X4dkMUnhB9snJKW4Z7NPgvb4cjUfr6UgvcfxZ5vJhS6lqA8bI/iVzLw
 BJGTkZt2tHPkYoW2Iupse/ws8qDhQKvkBz9MLwXp1abzRblh44nwp1RpI3rBnQVidhAf
 0RSM/OJ4+qWhN9zLTEJcrTblQry22ni/xKp/jdZfMXTuFeaz6r4CQxQBywU9R5RzrS82
 gjRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F9yEwPrmR9xpxjbUMZcvWlIm4BrVKkXnEjUbM9qs6VM=;
 b=NSO9LaACfSIX2rYiq+BZXVR+4BI8O5gYfUF/zfysxdiEdEY8L+KIAIjctTXTmqeDdf
 1MSoC1Zrq7DxcfLTQcl5y9SU0zCCSId/jxhPFjXIrxPRvB1vrYIh6adNKKsZPUeS4nP2
 refU1DAzTy992inZd4vbdYTZOiJAoaOJVsY+yf8rxva0s4I3Z/ETLax3ssrzvYwYWwi2
 evoEGnkIw5piNwg45OBnO8u0W6aU5F4Qwf373a8UpG/knCFihvR+N6pi5odlMrk95RWX
 dFnbWEnqYrz7sSjQSXiBmPlShEWK5DIh0xe9FYu5UE4wcrJiOzXKupdF9c52I8orTj0N
 coiw==
X-Gm-Message-State: AOAM530Fkti5a5nBgaiTGimFYlLIcaptz90NK4VE34zTChSunCDhGWOg
 zlLbyuCQ+vKwGjsfZ0AN9YSWkBUo9hxXlw==
X-Google-Smtp-Source: ABdhPJxYw4bSnJgXYt85lBdeJRJG+eS/taTfbQ/fs1kNtm98tHgwebwcy5tSox0tR+IflpdZidIABA==
X-Received: by 2002:a37:a20a:: with SMTP id l10mr10193543qke.273.1633102436730; 
 Fri, 01 Oct 2021 08:33:56 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id x8sm3484823qtv.5.2021.10.01.08.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 08:33:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/9] linux-user/nios2: Fix EA vs PC confusion
Date: Fri,  1 Oct 2021 11:33:44 -0400
Message-Id: <20211001153347.1736014-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001153347.1736014-1-richard.henderson@linaro.org>
References: <20211001153347.1736014-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: marex@denx.de, crwulff@gmail.com, alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The real kernel will talk about the user PC as EA,
because that's where the hardware will have copied it,
and where it expects to put it to then use ERET.
But qemu does not emulate all of the exception stuff
while emulating user-only.  Manipulate PC directly.

This fixes signal entry and return, and eliminates
some slight confusion from target_cpu_copy_regs.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/nios2/cpu_loop.c | 5 +----
 linux-user/nios2/signal.c   | 6 +++---
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index de0fc63e21..1e93ef34e6 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -155,9 +155,6 @@ void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
     env->regs[R_SP] = regs->sp;
     env->regs[R_GP] = regs->gp;
     env->regs[CR_ESTATUS] = regs->estatus;
-    env->regs[R_EA] = regs->ea;
-    /* TODO: unsigned long  orig_r7; */
-
-    /* Emulate eret when starting thread. */
     env->regs[R_PC] = regs->ea;
+    /* TODO: unsigned long  orig_r7; */
 }
diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
index adbffe32e3..20b65aa06e 100644
--- a/linux-user/nios2/signal.c
+++ b/linux-user/nios2/signal.c
@@ -73,7 +73,7 @@ static void rt_setup_ucontext(struct target_ucontext *uc, CPUNios2State *env)
     __put_user(env->regs[R_RA], &gregs[23]);
     __put_user(env->regs[R_FP], &gregs[24]);
     __put_user(env->regs[R_GP], &gregs[25]);
-    __put_user(env->regs[R_EA], &gregs[27]);
+    __put_user(env->regs[R_PC], &gregs[27]);
     __put_user(env->regs[R_SP], &gregs[28]);
 }
 
@@ -122,7 +122,7 @@ static int rt_restore_ucontext(CPUNios2State *env, struct target_ucontext *uc,
     __get_user(env->regs[R_GP], &gregs[25]);
     /* Not really necessary no user settable bits */
     __get_user(temp, &gregs[26]);
-    __get_user(env->regs[R_EA], &gregs[27]);
+    __get_user(env->regs[R_PC], &gregs[27]);
 
     __get_user(env->regs[R_RA], &gregs[23]);
     __get_user(env->regs[R_SP], &gregs[28]);
@@ -181,7 +181,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     env->regs[4] = sig;
     env->regs[5] = frame_addr + offsetof(struct target_rt_sigframe, info);
     env->regs[6] = frame_addr + offsetof(struct target_rt_sigframe, uc);
-    env->regs[R_EA] = ka->_sa_handler;
+    env->regs[R_PC] = ka->_sa_handler;
 
     unlock_user_struct(frame, frame_addr, 1);
 }
-- 
2.25.1


