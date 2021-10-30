Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD90440AED
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 20:15:38 +0200 (CEST)
Received: from localhost ([::1]:49178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgstG-0002M1-0A
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 14:15:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgrya-0002GL-45
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:17:05 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:44868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryX-0000Az-JA
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:17:03 -0400
Received: by mail-pl1-x632.google.com with SMTP id t11so8901750plq.11
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z8ecs4LTwGjkTaIMjFwaDU18rjRNxTTeFlYdhpfOXR8=;
 b=LAMJRfu4dQi3C1J44DOR9pDRtXrzeGIGxMVyg2LssK1eCdDLsXhtawTVC6rzzHD35h
 pgZoc06LIIzAb7WvuRI+jfCT7OM9JTRULe6n7dep3IBhBZByDcc4rTgssCcqhKtMKZdz
 w4GMHwjJAP0/73KCQZCtmQwtsP90PPMn/3NOLzJJnNcJmKScLVaRVFWEHFSR12820jcq
 iBDvsaOg8mmg23s7RqFTfb1cTAAs9w31rg9CP52p90zRSiBsZx/qRzaDr9WIafZ+h5an
 5bzVKBC5/hXc1iGjl8SfoSAgZvwtIjIcnfmILcDAREzVmoDHo53draGn36njIrZLz3os
 d6qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z8ecs4LTwGjkTaIMjFwaDU18rjRNxTTeFlYdhpfOXR8=;
 b=2wmZCyHrZDxbynvbyFl6zJ3v6xQZ5GavSTmvxrcyy2vPYpXYRgYegqv9RFEVcasKhd
 GebJExW0vLPqgLvU/mTH7xmVy7+zcIGVZksQdeREAId/Z7Eu2srwsRT3/755KV3oFs2q
 oCeIeBu76QZdU0I0B+IDnCmUN17jtmbxxq8xnXOqle138AIT0H6hlq79oUQvo1SF7ocP
 601uSdip8oVaKF9i3TYJJkxym+sGJdTssRj8/Ar7sHlRCuL6nSqsyn4cDP6nN3O+/lzP
 p6+DruoQdBgoCvR5OqTWjrZG9+8lIRfJkKKPayXdICVDkSpy//0on+kZuVkFYU+W0lgV
 wyUg==
X-Gm-Message-State: AOAM533a8vFcAOQFU8mYiqa4ez/00y4e5pTPGFV+rz2aytTKHwlL60OU
 6U46m21nu5oVpv/+baYBkklKLuAzfxPgHg==
X-Google-Smtp-Source: ABdhPJwNn7FG60VPLxqW+W6qPffoG/5mAhJAqPU5cRXZ49L8SAT4o8fYbktzUuy3E0fpsU/zq84eVg==
X-Received: by 2002:a17:903:1111:b0:13f:d1d7:fb5c with SMTP id
 n17-20020a170903111100b0013fd1d7fb5cmr16057481plh.47.1635614220318; 
 Sat, 30 Oct 2021 10:17:00 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id nv4sm3111943pjb.17.2021.10.30.10.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:16:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 25/66] target/hexagon: Remove hexagon_cpu_tlb_fill
Date: Sat, 30 Oct 2021 10:15:54 -0700
Message-Id: <20211030171635.1689530-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
 laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
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


