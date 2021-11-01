Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C699441FA3
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 18:54:05 +0100 (CET)
Received: from localhost ([::1]:48020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhbVU-0003Z8-5k
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 13:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb6C-0003o5-7p
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:57 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:33602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb63-0000eV-KF
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:55 -0400
Received: by mail-qk1-x733.google.com with SMTP id a132so16129125qkg.0
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z8ecs4LTwGjkTaIMjFwaDU18rjRNxTTeFlYdhpfOXR8=;
 b=LmMbj8qzjRgQykPT4dCwpD/o7dhNRuK8kbb845YFRuC5ISdf0yKGyyToIO6la0qbiY
 cozeBZgvDYwx9Qc4JZ91TKs1WYB/bmRDaEMfn1EzK9IEcJ+Pu+RybkbmedUzHMPYA43u
 V3MsgoFcPJRna06gS5X/aA5OpiagMsxqp+8PLGdYV2aPle8cfu1Gjj6sMby9ry1WHYEt
 SYGBG7HtFbCkEP2XEzySjo8u+p9RywQDuCLa6NXPTj56rQyD1ziDft8SeLqn3bvhIcWB
 Xeypwx3QGULOLwbSPtdqR3WXSw0kpzs+mIinRgU1ViqvUbU/dlIugKajRNON9wGDiFAR
 5crw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z8ecs4LTwGjkTaIMjFwaDU18rjRNxTTeFlYdhpfOXR8=;
 b=rksJ3bs8eDX87JodZRD8KAdQr9K/HnbbNRRQ9ylGzAwrOZ8XxxEfvCEDzoLcMzOXRN
 S7+snZn4ZjDYmXmT2pz1PIyk161QQ3UO0F22M+5nUDPAkXuRszZrUyq4PRWZI7+wmjLz
 apz9PoYxaObXVUiDcAmVpVwC0OolCvezoMslKkzQsSijAoMOe4/P0rBoWNm0Vk4LlyOz
 jvo+ksV9MI3f9sH87Ml1rTUx55/QesxpVMQl6DtgaqRHZ4OU86pJluSUfXtnWSiiMEoK
 ffOu5uxkLnAuUW+1HgT6nVCcw/7K0jGjPmSAbSqBqC45Oove45CrDGQplBctf8lDkE5r
 FayQ==
X-Gm-Message-State: AOAM533p93cIgD2kX0bmIDd/IwcBm96fS6uC2/B5Zv66r2/4rekowwVe
 aZ3TB36PLuv+/kQhrs/69yW4zrdMwLjV9w==
X-Google-Smtp-Source: ABdhPJyy4O6V1oGFXBif7f3pvaMu+LPtoRg0nLPzY79yQwNk+26OeWFbNxTyCcKnVDPPREN7lEcCkA==
X-Received: by 2002:a37:ae83:: with SMTP id x125mr24420977qke.37.1635787665694; 
 Mon, 01 Nov 2021 10:27:45 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id t5sm6075331qkf.34.2021.11.01.10.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:27:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 25/60] target/hexagon: Remove hexagon_cpu_tlb_fill
Date: Mon,  1 Nov 2021 13:26:54 -0400
Message-Id: <20211101172729.23149-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x733.google.com
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
Cc: Taylor Simpson <tsimpson@quicinc.com>
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


