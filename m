Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C1C41F301
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 19:23:14 +0200 (CEST)
Received: from localhost ([::1]:45450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWMFd-0004w3-OH
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 13:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM54-00052y-4K
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:18 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:46050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM52-0005DI-0j
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:17 -0400
Received: by mail-qk1-x72e.google.com with SMTP id q125so9797793qkd.12
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kQq48uinsO7YylDhnHpQEq7bEF7K0DH0ooQKeZ28gIs=;
 b=P7sgxRwKcGnzx8/NU7x2zpkmBdAQ8+FhiZOPALlK4fdZ3iS2eRQnNxSm7h3/+iZ6PP
 rsXgcY4KYj/1gPMwtis9OrynI7ELmTk6xY1TJyUVeU2/AVmmcm6fyNX7oq5mJht55q+C
 yLUXpzqlGPj+/gV71fg7uw2+KmlfbAeZ5Qm8vcdchVHrK0pHxUAXk+HfjGXBTOkPlFWu
 U3W2Cuzhc1ouEDH3iRltjWIfuWe4W4DH25IoVMFL1lMG93fG+MkWbSm46l597fLtPdaS
 yLDojQdfjhi8/ORN6p7EHKSMWMpKaTm6d8x6d7EYBdnPMeoQvrbBmZ8NnNDbQz3BZ4lV
 Ce2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kQq48uinsO7YylDhnHpQEq7bEF7K0DH0ooQKeZ28gIs=;
 b=h5Mms0Iitp3b7tIJoDhdN2nftipZOdhZUQwBboghdR7AZjlFfHIUBCYBeuFINm5zRp
 4tVTnTvv78KOWCXfidcgep6BGAUsX3yQOFquY0+pfYvGXQzPCSz4A9nqyFBZdwv6h4wR
 S3r+yM02r2zW/NBWcMMYhqPF1ymxXvazKoV9KnonBASWFpwdNAl3vW5KMU6ZwqGr6iDy
 S+XJ/FF0cR94cyZhQJSKANhQEGpe9UMg9Atx0vqULWwcz8/jkMeiEELxvhkekRvBclFm
 xKfkWLV18QH6APRBu9TDBZRL1WgvwUTu3B/SxziPjOmOMftOVPikv9RytUczRkvvvRrJ
 Adjg==
X-Gm-Message-State: AOAM533qjE5Gjs+Q59CcjreHYm1P0TnLT8qfqZJpvjvE76PRwPiMzkdH
 zZrtdflspI+MWepWFt75JUtlBFOaGEKfCQ==
X-Google-Smtp-Source: ABdhPJy4xt/rQKfzyiADxhIrKaVEkmpv9cLo5f/xdN/x4Mj2KNy1xOKv7ETRRiYDbcqiZ3gzrRmfJg==
X-Received: by 2002:a37:41ca:: with SMTP id
 o193mr10861873qka.187.1633108335112; 
 Fri, 01 Oct 2021 10:12:15 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id y15sm3557250qko.78.2021.10.01.10.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:12:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 25/41] target/hexagon: Remove hexagon_cpu_tlb_fill
Date: Fri,  1 Oct 2021 13:11:35 -0400
Message-Id: <20211001171151.1739472-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001171151.1739472-1-richard.henderson@linaro.org>
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
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
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fallback code in raise_sigsegv is sufficient for hexagon.
Remove the code from cpu_loop that raises SIGSEGV.

Cc: Taylor Simpson <tsimpson@quicinc.com>
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


