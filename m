Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B8D440AE6
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 20:08:11 +0200 (CEST)
Received: from localhost ([::1]:35614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgsm2-0001au-VL
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 14:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryc-0002HR-Px
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:17:08 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:33340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgrya-0000C7-So
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:17:06 -0400
Received: by mail-pg1-x534.google.com with SMTP id r28so13081772pga.0
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uBSoYrit32aNGLBOXaD1hzT0A4rXkiN+8LxdOJhc9ag=;
 b=kd1RSk58ZH1sTKyfBBANuNoWBho0yQcQokREU5EhDAjjwJSXKOhrgYnRILuB6APz8Q
 HQc1SYJFOleEB6mbgC4G3xXzC3zr5p5Moi7TV8cu6HZjSVKxkBESYVFSw97yDwUgtc6n
 xkXm+5csEAQueDR3CqMRTVlTelyVeYw8WksRfr1i6eJ75ci/HTjZxatCn5Q0uGMhbYxm
 b/zIcSRwisw9UdenV+tacKJc1dQUwPEz+G7bJCts2isM7Eqs892sNJx9eKvKqO9GRLRw
 txbJETS6oGATHH30b2AkHDUPKiLEmijUQvJBFfOF/BT2htnNkz04Uf7vHm60n6uAFod7
 W3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uBSoYrit32aNGLBOXaD1hzT0A4rXkiN+8LxdOJhc9ag=;
 b=JD5FhJ5b3H7+tsm+uv8yV9X/soowpetwXbumhLCsHtp/6R1PhgbGmeSQ1P+xsXP68d
 noA4gtsvHuKiu7QJItygtu1oAKXSNr12jMPa37rP+dBQAJaQiDYBPT/azSoZ1FTwkilB
 F/rr83ISTNIYlMXcOGNgHNFeLBSofeJEWoCnv2POVKcb5W0PjhjRdl4TA1hIMzufuD3Q
 4sdGV+KmX+GXhSX77hV4gOcFk+HgR8nLBxeY6CqN+L7iIl7l7ExpldZeBNf9RByiXZD0
 BR43y4b6hQwiY4q7tI7ULg4hr5BWsbzO/npfU8fg7w8i2AUWahWQ38VoifI/C210YIt2
 Gv0Q==
X-Gm-Message-State: AOAM531hOeUUNMVwcT+2PmdmJcvjGE16E7u2E+NZOaSCFIQotoGVzimn
 oLL3EDsa1y1iRh/O/QgDVnRLkaZkJIWkuA==
X-Google-Smtp-Source: ABdhPJyy+kW+HPJJ46XL75B9b4Bf07ygwD29V+7nVaSdSTFwdc98kJsXIwOZTrtElx5wNWpDwqMouw==
X-Received: by 2002:aa7:83cd:0:b0:480:9e79:fae5 with SMTP id
 j13-20020aa783cd000000b004809e79fae5mr3202713pfn.42.1635614223696; 
 Sat, 30 Oct 2021 10:17:03 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id nv4sm3111943pjb.17.2021.10.30.10.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:17:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 29/66] target/microblaze: Make mb_cpu_tlb_fill sysemu only
Date: Sat, 30 Oct 2021 10:15:58 -0700
Message-Id: <20211030171635.1689530-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fallback code in cpu_loop_exit_sigsegv is sufficient
for microblaze linux-user.

Remove the code from cpu_loop that handled the unnamed 0xaa exception.

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


