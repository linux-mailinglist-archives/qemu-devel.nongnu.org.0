Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7621441FB0
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 18:56:21 +0100 (CET)
Received: from localhost ([::1]:58402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhbXh-000245-0c
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 13:56:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb6L-0003wn-6w
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:28:05 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:42922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb6A-0000g9-Ul
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:28:04 -0400
Received: by mail-qk1-x731.google.com with SMTP id bm28so2117144qkb.9
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OFBASZgYo/dnEXgBhwjQsgVMikt4qFVfoC5aZFh8E0o=;
 b=wQI0shq0lD1M12UnnUQFskMElA1km38wJ5Z/OsXAGW/yzwzA9qKLNJNkTMpmc2w9BN
 9bFWSm8ukNVm8xa+5YWogZSrczp4yDgUlPPfWXhdm25v2NLwJifZri/6bl/jzz+zVg6i
 qGsJKF0bzmbJwf8I4VbUtLjHMp8pde8q4fPXPv/gKWXh+p1hOjTwJOfOn/YBac8QsUxm
 JVCkaUbNH4jPvnHysx53xMHSbElFEyV1CZUthrKEhjBK6TbI33iKqd/93bT+4YIMGRL2
 b4nt7/+naX89hZsVUOCBYpTjY1IxvBMiehz9IkSzCeuvHcAGkNHeuhzOYuOFvteDZCSj
 9xGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OFBASZgYo/dnEXgBhwjQsgVMikt4qFVfoC5aZFh8E0o=;
 b=n7Xv/RrLPX3yWXp/z5e1WP7owNabMUuIw4pSl9Soadp8NfJeYPhSKXyMNwiwh0eD53
 xhD266I+Io97RQf9ywqtrBOnYpocwQTOwfxPzZmLJIXq2xftc1ltoatpSQ5v/s4U43Ro
 9ai3wMj/tLTDLC2Mkf8HjqDnm8MYBP4SEQ3hngbRkUyA9oW17HbPbIDa7WoJLfvyPqJ0
 F4C+20QMv31cWs9qdxgWFTMEuDBPYHFz6dyzKlkX6+o8OtMRZ3v5Ihdls02FTUrXI0Uw
 u3vWO6HHf2zUKe3gUZIjn65eN9/Kfds54tNsFlPZCmAoXNre7NeMFQor1tRC428O/fBH
 LGcA==
X-Gm-Message-State: AOAM531EeC9o7EtQuIZwgMGGcEOHi7eLli/qBBfQvnCA9x+cXWaeZT6q
 B5/wdPBBnWsWD6UJ6YIiP0ocW1qfRjvVnw==
X-Google-Smtp-Source: ABdhPJwcS8c/uB93M5wFgwreiqISHZuT6oT5i2ZMvWTcx0FBmvsrSV7NhbMF6MKhh8ofcxHF0cO0tQ==
X-Received: by 2002:a37:9404:: with SMTP id w4mr24638911qkd.469.1635787673649; 
 Mon, 01 Nov 2021 10:27:53 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id t5sm6075331qkf.34.2021.11.01.10.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:27:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 39/60] target/sparc: Make sparc_cpu_tlb_fill sysemu only
Date: Mon,  1 Nov 2021 13:27:08 -0400
Message-Id: <20211101172729.23149-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x731.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fallback code in cpu_loop_exit_sigsegv is sufficient
for sparc linux-user.

This makes all of the code in mmu_helper.c sysemu only, so remove
the ifdefs and move the file to sparc_softmmu_ss.  Remove the code
from cpu_loop that handled TT_DFAULT and TT_TFAULT.

Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/cpu_loop.c | 25 -------------------------
 target/sparc/cpu.c          |  2 +-
 target/sparc/mmu_helper.c   | 25 -------------------------
 target/sparc/meson.build    |  2 +-
 4 files changed, 2 insertions(+), 52 deletions(-)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index ad29b4eb6a..0ba65e431c 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -219,17 +219,6 @@ void cpu_loop (CPUSPARCState *env)
         case TT_WIN_UNF: /* window underflow */
             restore_window(env);
             break;
-        case TT_TFAULT:
-        case TT_DFAULT:
-            {
-                info.si_signo = TARGET_SIGSEGV;
-                info.si_errno = 0;
-                /* XXX: check env->error_code */
-                info.si_code = TARGET_SEGV_MAPERR;
-                info._sifields._sigfault._addr = env->mmuregs[4];
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            }
-            break;
 #else
         case TT_SPILL: /* window overflow */
             save_window(env);
@@ -237,20 +226,6 @@ void cpu_loop (CPUSPARCState *env)
         case TT_FILL: /* window underflow */
             restore_window(env);
             break;
-        case TT_TFAULT:
-        case TT_DFAULT:
-            {
-                info.si_signo = TARGET_SIGSEGV;
-                info.si_errno = 0;
-                /* XXX: check env->error_code */
-                info.si_code = TARGET_SEGV_MAPERR;
-                if (trapnr == TT_DFAULT)
-                    info._sifields._sigfault._addr = env->dmmu.mmuregs[4];
-                else
-                    info._sifields._sigfault._addr = cpu_tsptr(env)->tpc;
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            }
-            break;
 #ifndef TARGET_ABI32
         case 0x16e:
             flush_windows(env);
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 21dd27796d..55268ed2a1 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -865,9 +865,9 @@ static const struct SysemuCPUOps sparc_sysemu_ops = {
 static const struct TCGCPUOps sparc_tcg_ops = {
     .initialize = sparc_tcg_init,
     .synchronize_from_tb = sparc_cpu_synchronize_from_tb,
-    .tlb_fill = sparc_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .tlb_fill = sparc_cpu_tlb_fill,
     .cpu_exec_interrupt = sparc_cpu_exec_interrupt,
     .do_interrupt = sparc_cpu_do_interrupt,
     .do_transaction_failed = sparc_cpu_do_transaction_failed,
diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index a44473a1c7..2ad47391d0 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -25,30 +25,6 @@
 
 /* Sparc MMU emulation */
 
-#if defined(CONFIG_USER_ONLY)
-
-bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                        MMUAccessType access_type, int mmu_idx,
-                        bool probe, uintptr_t retaddr)
-{
-    SPARCCPU *cpu = SPARC_CPU(cs);
-    CPUSPARCState *env = &cpu->env;
-
-    if (access_type == MMU_INST_FETCH) {
-        cs->exception_index = TT_TFAULT;
-    } else {
-        cs->exception_index = TT_DFAULT;
-#ifdef TARGET_SPARC64
-        env->dmmu.mmuregs[4] = address;
-#else
-        env->mmuregs[4] = address;
-#endif
-    }
-    cpu_loop_exit_restore(cs, retaddr);
-}
-
-#else
-
 #ifndef TARGET_SPARC64
 /*
  * Sparc V8 Reference MMU (SRMMU)
@@ -926,4 +902,3 @@ hwaddr sparc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     }
     return phys_addr;
 }
-#endif
diff --git a/target/sparc/meson.build b/target/sparc/meson.build
index a3638b9503..a801802ee2 100644
--- a/target/sparc/meson.build
+++ b/target/sparc/meson.build
@@ -6,7 +6,6 @@ sparc_ss.add(files(
   'gdbstub.c',
   'helper.c',
   'ldst_helper.c',
-  'mmu_helper.c',
   'translate.c',
   'win_helper.c',
 ))
@@ -16,6 +15,7 @@ sparc_ss.add(when: 'TARGET_SPARC64', if_true: files('int64_helper.c', 'vis_helpe
 sparc_softmmu_ss = ss.source_set()
 sparc_softmmu_ss.add(files(
   'machine.c',
+  'mmu_helper.c',
   'monitor.c',
 ))
 
-- 
2.25.1


