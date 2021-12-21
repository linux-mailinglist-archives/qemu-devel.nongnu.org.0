Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFF247B898
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 03:53:14 +0100 (CET)
Received: from localhost ([::1]:50744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzVH7-000782-NR
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 21:53:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzVEM-0003hK-5o
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 21:50:22 -0500
Received: from [2607:f8b0:4864:20::52d] (port=44924
 helo=mail-pg1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzVEK-0000C3-6z
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 21:50:21 -0500
Received: by mail-pg1-x52d.google.com with SMTP id m15so11016644pgu.11
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 18:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F9yEwPrmR9xpxjbUMZcvWlIm4BrVKkXnEjUbM9qs6VM=;
 b=D8TZnIfLabC0AmpSuzjzLdtK0EWfT+HTror9COebxvSfFoRHkl1YGeEJyI0Wcpfxoe
 IjuOb7QEmLSp11PIsk2KsMdkFDSfGPVhPXzinYzwQ9nj9kdliJM877tGBU4w1hWmdlzZ
 QeVL4YaKjXkFb4YSMLWUMq8Pjwf8DaXbasXAJFu+jy6PzL47peoKYbrfqeZ96KHZrl40
 qz/WnFLdnLd91tD4vn9cbOjKyswNDyKmZu55rpooIwdXXAelgnG+lsUWceOF8ft9vXEB
 SlCbkAn37tnMHG5PN+UAU51JThg43Ncg9iOLetSiURpF0e0DD7ZcjLh5zAlw2ySM9NUe
 wNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F9yEwPrmR9xpxjbUMZcvWlIm4BrVKkXnEjUbM9qs6VM=;
 b=HP4xgqSYHhllqXq6UHMdsyAFqPSEtNhWDzFb0FK8Xlrh8CByrPiclAz2saZZFw+EsF
 Z2q81Ye5FFDkXXEXcRi/+R3ly23l1D9J3SAocIAVfCBfhcTT00sPpQf7enoJDg0cDDjL
 vFOs84UOuPQ9vU8Y/07IfL5Uh4Op9C3dBy7t3ZhRw3p4MRJamj/ey2hKxbN2GzX53t7M
 3mLTpKW/9qh+mb4S6iBKiRdyZlQB/16jFagJvQ73Q2XfzwYS6d6Eiu+P125fYMk2yaia
 KPIvmQhCbHvNAJLZsdnh30LKdCnMSRRvC++izXsuqZ5ljieoERWvtx8Njjj/87Io6o3G
 mexA==
X-Gm-Message-State: AOAM530mPv2zzbIvAsxw3B5fWS/I7t0ok8JdEF6JLbVN1R6/CV31I+Fa
 ajkJAV7pZfpRIfp1FxQql/zaNEEU+5tY0g==
X-Google-Smtp-Source: ABdhPJxsqRoyVh2syVTmaMp7paIxU5zmdXoD8JSvBoX9syj+vknf0TQmf2A0KKK9Gd/DaDHNAlfVPg==
X-Received: by 2002:a65:6411:: with SMTP id a17mr1043081pgv.203.1640055018869; 
 Mon, 20 Dec 2021 18:50:18 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id bg23sm694025pjb.24.2021.12.20.18.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 18:50:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/7] linux-user/nios2: Fix EA vs PC confusion
Date: Mon, 20 Dec 2021 18:50:10 -0800
Message-Id: <20211221025012.1057923-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221025012.1057923-1-richard.henderson@linaro.org>
References: <20211221025012.1057923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
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


