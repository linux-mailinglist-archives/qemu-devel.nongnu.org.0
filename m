Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AE7410855
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 21:20:12 +0200 (CEST)
Received: from localhost ([::1]:38880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRfsh-00056S-2F
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 15:20:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLl-0005FJ-2P
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:46:09 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:42517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLe-0006wZ-BS
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:46:08 -0400
Received: by mail-pl1-x62d.google.com with SMTP id l6so3611895plh.9
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 11:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vy3PmhKz8vrPuLguGAuScpJF3WUMXPHzvRxSKLuEp08=;
 b=Z//66kk5Co2E+DdUydRCtkHZRXfSEEyRO+ADyIOZwKbQ7iBs/sQ0QJJIS6fjv2xpI8
 abZebf4q4HIl6PaFYFV78fOHuqQGZVJyTxmpFFt5FhYInNyjg79z7TLs6yR75MEUJ0mQ
 RevZz9aXJ6S7aRb8pSuI3M48MlY43steRDwSuajQ2QwSPWExxh4EREr+qxcgWy+kFepU
 Fg4fYt/ZwNoX23FwakvBNWVyH5mMQkE1Tj/yYke7mfVJwIzNSKeN1w8AYCzP7IqtHTi7
 p1V/UyxIIw9xCztb7F1T6/GkFIGrNI6syyo6gfxVBlbbNpSnXHaz3hQ/qpkPYQ7Zdq0u
 wOdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vy3PmhKz8vrPuLguGAuScpJF3WUMXPHzvRxSKLuEp08=;
 b=67vSzpA6MJDqJpnhVIQT/e/AJUhGZCAxYxqvndwq4b+CBQS7xBioC9vl8GMxcEaPfB
 VqGThyvsxQbgXV+NxcGOZgH36YgfGLG4QS0Rp3yX6tSYOLwS26DYQ+Jr3Mgg2Nnn/Vtd
 vT8gEEORVX1XVS/R843S/1koIA/KI/GOQy8VH4nkb4ng+oa7u6OsracxIlxtySouVPVu
 5X8HPdr8G8BdalAoaCZest+h0qEezZkR63PJ5g2bzBlW9gpgAEk5rbaCLOQSBxinc4z/
 bbeUTqDyhiEPJVONFIhDb0G0djHJipu2El4OYyqiPE8xsrp4tG9uIC5KEqLtMcLvMILD
 Pw3Q==
X-Gm-Message-State: AOAM530HLD9BlfngKgjKvAO5bNSijmQvvMZ5qUHwyfmB7MSxxXw3gPaV
 AkKd8Vqx3O0+cDo51r+nZrfUvsYiJ0SFwA==
X-Google-Smtp-Source: ABdhPJxoeTbDygQbJLVOEMzj8ABSA0yLwAXWtPtk4puAASCdGz06W6uZQNfRVJYKmqV7vczsDWDUVw==
X-Received: by 2002:a17:90a:ab90:: with SMTP id
 n16mr19530162pjq.157.1631990752811; 
 Sat, 18 Sep 2021 11:45:52 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y26sm9555858pfe.69.2021.09.18.11.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 11:45:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 29/41] target/microblaze: Make mb_cpu_tlb_fill sysemu only
Date: Sat, 18 Sep 2021 11:45:15 -0700
Message-Id: <20210918184527.408540-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918184527.408540-1-richard.henderson@linaro.org>
References: <20210918184527.408540-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fallback code in raise_sigsegv is sufficient for mb linux-user.
Remove the code from cpu_loop that handled the unnamed 0xaa exception.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/cpu.h          |  8 ++++----
 linux-user/microblaze/cpu_loop.c | 10 ----------
 target/microblaze/cpu.c          |  2 +-
 target/microblaze/helper.c       | 13 +------------
 4 files changed, 6 insertions(+), 27 deletions(-)

diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index 13ed3cd4dd..2f3075d902 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -394,10 +394,6 @@ void mb_tcg_init(void);
 #define MMU_USER_IDX    2
 /* See NB_MMU_MODES further up the file.  */
 
-bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                     MMUAccessType access_type, int mmu_idx,
-                     bool probe, uintptr_t retaddr);
-
 typedef CPUMBState CPUArchState;
 typedef MicroBlazeCPU ArchCPU;
 
@@ -415,6 +411,10 @@ static inline void cpu_get_tb_cpu_state(CPUMBState *env, target_ulong *pc,
 }
 
 #if !defined(CONFIG_USER_ONLY)
+bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                     MMUAccessType access_type, int mmu_idx,
+                     bool probe, uintptr_t retaddr);
+
 void mb_cpu_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
                                unsigned size, MMUAccessType access_type,
                                int mmu_idx, MemTxAttrs attrs,
diff --git a/linux-user/microblaze/cpu_loop.c b/linux-user/microblaze/cpu_loop.c
index c3396a6e09..0b889a04a7 100644
--- a/linux-user/microblaze/cpu_loop.c
+++ b/linux-user/microblaze/cpu_loop.c
@@ -35,16 +35,6 @@ void cpu_loop(CPUMBState *env)
         process_queued_cpu_work(cs);
 
         switch (trapnr) {
-        case 0xaa:
-            {
-                info.si_signo = TARGET_SIGSEGV;
-                info.si_errno = 0;
-                /* XXX: check env->error_code */
-                info.si_code = TARGET_SEGV_MAPERR;
-                info._sifields._sigfault._addr = 0;
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            }
-            break;
         case EXCP_INTERRUPT:
           /* just indicate that signals should be handled asap */
           break;
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 36e6e54048..67a3b80512 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -366,10 +366,10 @@ static const struct SysemuCPUOps mb_sysemu_ops = {
 static const struct TCGCPUOps mb_tcg_ops = {
     .initialize = mb_tcg_init,
     .synchronize_from_tb = mb_cpu_synchronize_from_tb,
-    .tlb_fill = mb_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
     .has_work = mb_cpu_has_work,
+    .tlb_fill = mb_cpu_tlb_fill,
     .cpu_exec_interrupt = mb_cpu_exec_interrupt,
     .do_interrupt = mb_cpu_do_interrupt,
     .do_transaction_failed = mb_cpu_transaction_failed,
diff --git a/target/microblaze/helper.c b/target/microblaze/helper.c
index dd2aecd1d5..a607fe68e5 100644
--- a/target/microblaze/helper.c
+++ b/target/microblaze/helper.c
@@ -24,18 +24,7 @@
 #include "qemu/host-utils.h"
 #include "exec/log.h"
 
-#if defined(CONFIG_USER_ONLY)
-
-bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                     MMUAccessType access_type, int mmu_idx,
-                     bool probe, uintptr_t retaddr)
-{
-    cs->exception_index = 0xaa;
-    cpu_loop_exit_restore(cs, retaddr);
-}
-
-#else /* !CONFIG_USER_ONLY */
-
+#ifndef CONFIG_USER_ONLY
 static bool mb_cpu_access_is_secure(MicroBlazeCPU *cpu,
                                     MMUAccessType access_type)
 {
-- 
2.25.1


