Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A34142451E
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 19:45:58 +0200 (CEST)
Received: from localhost ([::1]:57824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYAzN-0005Ui-4f
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 13:45:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdg-0007H9-Jg
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:32 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:37669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAde-0008Bp-MZ
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:32 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 oa6-20020a17090b1bc600b0019ffc4b9c51so4899499pjb.2
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 10:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z8ecs4LTwGjkTaIMjFwaDU18rjRNxTTeFlYdhpfOXR8=;
 b=x48uw6AKId2K7X5DW7DPA1mvvfEu3wBL++DacMVDJzI0XnyIKb+t/WoA8xyvOPcldr
 F8QJ1Z+/+TI/DJKh9U6uXete6ULeA0vERFvkWbbVXiKjxTEjV+ujen6g/u1dJT0H+//3
 vuXncVbAcLGGdMLuARFOQ/d4Gq9GaHtXH1/2cuH3dci0z7S9TijSfcDmIJRm5YDYaECY
 98kduTLFSieYG8MOyfT8dewKv9EtMd/ZJmMv8l7ZjFqW+3XGXn3EQLgBPoEkftrZpGp8
 /QGIxazkdGIybm6UxAEoMbSsneAx1RVfzYIeriHH1ZqOmtosWI4zN2iikmDgXGCAyehy
 2PVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z8ecs4LTwGjkTaIMjFwaDU18rjRNxTTeFlYdhpfOXR8=;
 b=DcT3zIFjeDqOKhO95hqKN1WnayGlmTpkb5ib7en74IvGsZmyTQKtpDJV2oouzcYV6P
 EA9UTC/r5S5SaYhcKGDqm33BR2iz2m/6U/RefAP6GWg/iKWb9jymxXJ27BoKUkNaeuz6
 iuiX3i2lA2HSi7FxsivlfEIxaR+N5poDk/YDEQIjrbe4TgR2iu9GtJgTF6w1fNF3az55
 8VJ+V2qbYn4zfbwHcmvx2dM8FRbeJVhaLxRyDxh17ZnQbeHC911C28Uo/kg+Jo6PFuiC
 EOrD37gzy02BiWNCRNjTbGngByzZfVsoHGSGNawaLz9MwHC+kHTpM3UMO3g6mBO0jV26
 m4yw==
X-Gm-Message-State: AOAM5328uArWa8rhE2LCVDLR3ASUiS7GGxjeqzdekRAUedoxArQ/fVVe
 daA/TLn2VR4K/POWgIk7/fKqRJZtWy5KKg==
X-Google-Smtp-Source: ABdhPJxwnf79Bz9Am15EHME7sg9qvPweLfA/uNR1ROjrBJF8RXiFLoATCjVc/Febfd7/HbWvA+kD6A==
X-Received: by 2002:a17:90a:4290:: with SMTP id
 p16mr12103057pjg.112.1633541009316; 
 Wed, 06 Oct 2021 10:23:29 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w7sm21606929pfj.189.2021.10.06.10.23.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 10:23:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 25/41] target/hexagon: Remove hexagon_cpu_tlb_fill
Date: Wed,  6 Oct 2021 10:22:51 -0700
Message-Id: <20211006172307.780893-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006172307.780893-1-richard.henderson@linaro.org>
References: <20211006172307.780893-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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


