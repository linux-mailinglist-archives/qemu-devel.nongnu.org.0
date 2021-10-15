Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F16C142E7E2
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:31:22 +0200 (CEST)
Received: from localhost ([::1]:58096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbEsL-0007K7-Vi
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:31:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEZ0-0007LQ-K0
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:22 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:40931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEYv-0000MR-MK
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:22 -0400
Received: by mail-pf1-x42f.google.com with SMTP id o133so7289603pfg.7
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z8ecs4LTwGjkTaIMjFwaDU18rjRNxTTeFlYdhpfOXR8=;
 b=Y5qiD56RsJ8Nq4PW05mNcjMMjwYz2jfPvkW213stwBafxD4PnzgoAYsX1S6nD2Yff5
 de+rItUoevaMOdp9l6RQsoWkmi2bTp04yWCaqGqdijdPL17LA3YrNMdKVD3gocNVwcyD
 kjrpR9U/ZB4FX3dxKpM2yzJA5da660XKvyph7gxMPQNT3RSJ6z/QoQr/F4DeP70SeP5D
 uc1gu+m2vvDyGsLofkx0IwnME4q0QyYpt27YpksB0IwLjEuPrG8Pc0Ah9bNJ10Zxo+8P
 9nKp/gFFNURkgBvFH+y4ksW33d7QdVxSGLR5JG57+51T9Fxxp8jOQjIM3zLd0wUBAZSD
 Y+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z8ecs4LTwGjkTaIMjFwaDU18rjRNxTTeFlYdhpfOXR8=;
 b=lPD086icM7Ut+6n/ZgF6gWCpa1hd8xPwN2HVCWJCmbRSw4Tza+ZyqY9u2DrscZCCMg
 B+A/yFU5iQ0JYlSDk+53UNMsQA2kyMWXrK6SndvYV4cw9qQGrVNix/LSHouyqROJtr2t
 3knzvfrr23fBOqRVIRT97NStcjYLMdkcM/b84LHFrOt4m6LLbgLx85tFKOtb+AcN2/Fv
 Z1j2H+s8yKBFUHRjP0lkDLj4b7icp6/Jnq8W1YE/ppL+xP5BTVYNeUGFWHDbiv0icQtd
 lpWIzxlGu5agtoZCXXut1XGogv+O+IZVgeSW7IPVZ6FQZ+X/1sdz68hAAw7Xc+6WzFZ+
 y/rQ==
X-Gm-Message-State: AOAM530/xjU5q6CxDrZsx2EKCMbFtCERAHtk6NnI9QD9hqmW/X0RMTwN
 rlyru+XxYVszQHQoboMbF63XOa0nPth92Q==
X-Google-Smtp-Source: ABdhPJyUfAOWeBarOFNzrTPDPvUEbiowt6bfPgHUa0EN7Bqnll40toZDAkWNpyfmi16VtIlPO8XXOw==
X-Received: by 2002:a65:62d1:: with SMTP id m17mr7324322pgv.370.1634271076273; 
 Thu, 14 Oct 2021 21:11:16 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id me12sm5718006pjb.27.2021.10.14.21.11.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:11:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 25/67] target/hexagon: Remove hexagon_cpu_tlb_fill
Date: Thu, 14 Oct 2021 21:10:11 -0700
Message-Id: <20211015041053.2769193-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Taylor Simpson <tsimpson@quicinc.com>, alex.bennee@linaro.org,
 laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fallback code in cpu_loop_exit_sigsegv is sufficient
for hexagon linux-user.

Remove the code from cpu_loop that raises SIGSEGV.

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/hexagon/cpu_loop.c | 24 +-----------------------
 target/hexagon/cpu.c          | 23 -----------------------
 2 files changed, 1 insertion(+), 46 deletions(-)

diff --git a/linux-user/hexagon/cpu_loop.c b/linux-user/hexagon/cpu_loop.c
index bee2a9e4ea..6b24cbaba9 100644
--- a/linux-user/hexagon/cpu_loop.c
+++ b/linux-user/hexagon/cpu_loop.c
@@ -28,8 +28,7 @@
 void cpu_loop(CPUHexagonState *env)
 {
     CPUState *cs = env_cpu(env);
-    int trapnr, signum, sigcode;
-    target_ulong sigaddr;
+    int trapnr;
     target_ulong syscallnum;
     target_ulong ret;
 
@@ -39,10 +38,6 @@ void cpu_loop(CPUHexagonState *env)
         cpu_exec_end(cs);
         process_queued_cpu_work(cs);
 
-        signum = 0;
-        sigcode = 0;
-        sigaddr = 0;
-
         switch (trapnr) {
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
@@ -65,12 +60,6 @@ void cpu_loop(CPUHexagonState *env)
                 env->gpr[0] = ret;
             }
             break;
-        case HEX_EXCP_FETCH_NO_UPAGE:
-        case HEX_EXCP_PRIV_NO_UREAD:
-        case HEX_EXCP_PRIV_NO_UWRITE:
-            signum = TARGET_SIGSEGV;
-            sigcode = TARGET_SEGV_MAPERR;
-            break;
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
             break;
@@ -79,17 +68,6 @@ void cpu_loop(CPUHexagonState *env)
                      trapnr);
             exit(EXIT_FAILURE);
         }
-
-        if (signum) {
-            target_siginfo_t info = {
-                .si_signo = signum,
-                .si_errno = 0,
-                .si_code = sigcode,
-                ._sifields._sigfault._addr = sigaddr
-            };
-            queue_signal(env, info.si_signo, QEMU_SI_KILL, &info);
-        }
-
         process_pending_signals(env);
     }
 }
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 3338365c16..160a46a3d5 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -245,34 +245,11 @@ static void hexagon_cpu_init(Object *obj)
     qdev_property_add_static(DEVICE(obj), &hexagon_lldb_stack_adjust_property);
 }
 
-static bool hexagon_tlb_fill(CPUState *cs, vaddr address, int size,
-                             MMUAccessType access_type, int mmu_idx,
-                             bool probe, uintptr_t retaddr)
-{
-#ifdef CONFIG_USER_ONLY
-    switch (access_type) {
-    case MMU_INST_FETCH:
-        cs->exception_index = HEX_EXCP_FETCH_NO_UPAGE;
-        break;
-    case MMU_DATA_LOAD:
-        cs->exception_index = HEX_EXCP_PRIV_NO_UREAD;
-        break;
-    case MMU_DATA_STORE:
-        cs->exception_index = HEX_EXCP_PRIV_NO_UWRITE;
-        break;
-    }
-    cpu_loop_exit_restore(cs, retaddr);
-#else
-#error System mode not implemented for Hexagon
-#endif
-}
-
 #include "hw/core/tcg-cpu-ops.h"
 
 static const struct TCGCPUOps hexagon_tcg_ops = {
     .initialize = hexagon_translate_init,
     .synchronize_from_tb = hexagon_cpu_synchronize_from_tb,
-    .tlb_fill = hexagon_tlb_fill,
 };
 
 static void hexagon_cpu_class_init(ObjectClass *c, void *data)
-- 
2.25.1


