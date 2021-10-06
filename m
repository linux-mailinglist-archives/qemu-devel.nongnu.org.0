Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A16C2424588
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 20:02:51 +0200 (CEST)
Received: from localhost ([::1]:46514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYBFi-0002BN-Nb
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 14:02:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdk-0007OS-Fk
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:36 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:35574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdh-0008F8-S0
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:36 -0400
Received: by mail-pf1-x435.google.com with SMTP id c29so2984675pfp.2
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 10:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YhPxcjX9C92fdBuTOUcy5hI4xkueqmtVuHt+rQj+PNs=;
 b=uQAvwXQoDul6RR/zyzQV5KsCFFNnNK3tN80v+2qAsVxnOhemwlPZRK9puWScex9EFE
 eoP39vLaZz/s1ywWP2+dQVXU42gZjSaL6Eja3DLOuJngPqNkCRt4VaxiLTx3hcwodH5E
 A4MU8h5bhpGyLS0cyQRhP9ybTxT5Odrnpazw/swDcVWOrX+BuCt0ze+hu455mYupROal
 b9gdXk7KMZbA/X9+GmK40bFjS2oOH43KLcOQ0/sqsXxf5GPoBX1ZLyDIxW1S8KqYEx+z
 32OesThrHv7H/uajbBUHHissbRtNWlwC4j0meOZTtlfW21QSvkVg1je9cMh9hADE06N7
 AJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YhPxcjX9C92fdBuTOUcy5hI4xkueqmtVuHt+rQj+PNs=;
 b=rIdBdDruAqClb4dUx+Ex8cdmTXZc5hcloalb/rGT+zDH5YVAxr0lTReXAq47aF2jI7
 igjzW2yzN8adFJyl1XshIOsoPOpZD6t+/Ee9wWp1coPT3/5ccuH+TZtHMqwbI1giA0sV
 cc4XREDEEaysES1RcK7souN9lub0UkjhtTW4Gmg90SAOsc/j+bo8ah5nHTTTVaRLhyJo
 iPPy0iu7kL9kw9vXpaz5iUH2gNBRLaQouc2BSZBj0avcMGvsWVGAJAHtFwh7ngJEY3ub
 uot4s5+Ej2KuuRIa+r0334kF/GUaPurFRdio/ev1Ro/bDeMMDYryMW84G/99dQENGmb6
 ChUQ==
X-Gm-Message-State: AOAM530oALJMtjvU/VJwhPvZjboc6ZQYBJzF4vFW5aNB+5DQEWH9zjHZ
 6g+gjjazKAnZysJlJ1pxC5ZjKXqG3x0B7w==
X-Google-Smtp-Source: ABdhPJz2QX+70wdBg/cmXX7ZmPSN/YnOD0eznNgd5G+EM8EzahWuMp6r/lOdNy1I+ci1SMOpXE9GGQ==
X-Received: by 2002:a65:51c7:: with SMTP id i7mr21648079pgq.300.1633541012646; 
 Wed, 06 Oct 2021 10:23:32 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w7sm21606929pfj.189.2021.10.06.10.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 10:23:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 29/41] target/microblaze: Make mb_cpu_tlb_fill sysemu only
Date: Wed,  6 Oct 2021 10:22:55 -0700
Message-Id: <20211006172307.780893-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006172307.780893-1-richard.henderson@linaro.org>
References: <20211006172307.780893-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>, alex.bennee@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fallback code in cpu_loop_exit_sigsegv is sufficient
for microblaze linux-user.

Remove the code from cpu_loop that handled the unnamed 0xaa exception.

Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/cpu.h          |  8 ++++----
 linux-user/microblaze/cpu_loop.c | 10 ----------
 target/microblaze/cpu.c          |  2 +-
 target/microblaze/helper.c       | 13 +------------
 4 files changed, 6 insertions(+), 27 deletions(-)

diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index b7a848bbae..e9cd0b88de 100644
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
index 52222eb93f..a94467dd2d 100644
--- a/linux-user/microblaze/cpu_loop.c
+++ b/linux-user/microblaze/cpu_loop.c
@@ -37,16 +37,6 @@ void cpu_loop(CPUMBState *env)
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
index 15db277925..b9c888b87e 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -365,9 +365,9 @@ static const struct SysemuCPUOps mb_sysemu_ops = {
 static const struct TCGCPUOps mb_tcg_ops = {
     .initialize = mb_tcg_init,
     .synchronize_from_tb = mb_cpu_synchronize_from_tb,
-    .tlb_fill = mb_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
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


