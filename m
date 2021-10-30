Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF58A440AF6
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 20:24:12 +0200 (CEST)
Received: from localhost ([::1]:35980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgt1X-0004xI-TA
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 14:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryl-0002PH-S3
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:17:15 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:42977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryj-0000Ed-Fl
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:17:15 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 nn3-20020a17090b38c300b001a03bb6c4ebso9607095pjb.1
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OFBASZgYo/dnEXgBhwjQsgVMikt4qFVfoC5aZFh8E0o=;
 b=hn6eQcNsa3UxaC/ODRJXUKmGHGGuto6mmkFhWfHMai9e9OJPTs1lsX8xcZtu+xIcLq
 cE0pcVikGuca9LEXuVGlE4DnaEe/8DY8BwFrzbTHAAtWZ8AZbp6b1q3xRk26S45sGckj
 1Y7ofw5pjK4XpOhG8woKyQjhyWp6tbf/hE02EZjJtjIcOGQMej5hlcwDHE9Ff+F5fhNH
 9vlGJislC1vTSScfAut9Sx70T/iqUd5L3IcF3E1iI5sjHJ2WO+lDKdttmyhktV8KbMie
 jdrFN7dl0gqPzCxrU6duewBvap1if6jPQjvNiBsDGsVb2J2/+xUaxMP7fBblPTQV0xfA
 nF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OFBASZgYo/dnEXgBhwjQsgVMikt4qFVfoC5aZFh8E0o=;
 b=uicw/kUafeUhoNeaKX5p14XxxPQRBwSj5Pgz/1v6nr2Me3jSbpvlyFgCqjdz9iI8p5
 NVK0r7KJeVSOIe0mRXr7LfVFG46rpjvWO0tPHdAgVQ3qopxPzMPhURe0lhcNIPjbUyUh
 sM7W8JCeZhUHHGGqKOd516gbEzU7eflHv7yYUEPFgp7MFXimWrzwaDU7c0/5DXrbq8p2
 Wt8nkPawoz5rsSxLzzQ7YfyisCDU5j26gU/+oaNA3GVvGxbAJmJzjSZnFRhNtbN16tY4
 aLcoAcl2mKi7nSsUqQ2kI2Saf41ONrhhqHAABdGngI8+LMHg4jBLxnqf+lFR9tP0NBFV
 KebQ==
X-Gm-Message-State: AOAM533lL67a1c11hdYHWzTXrxem6OUUTyYAVM64J8CCB8sLfHDl39XJ
 tS27/d6qBO9iWnar8vagu7RXyn92NMmSSA==
X-Google-Smtp-Source: ABdhPJxCXj6exfHc/78Rzx12UsKjt5nPwUb7ruxLsRgl3SvzmD1B8SPvA3yP34tv5RzZvBd5PiKBnA==
X-Received: by 2002:a17:902:6a86:b0:13f:f048:9778 with SMTP id
 n6-20020a1709026a8600b0013ff0489778mr16018094plk.27.1635614232067; 
 Sat, 30 Oct 2021 10:17:12 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id nv4sm3111943pjb.17.2021.10.30.10.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:17:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 39/66] target/sparc: Make sparc_cpu_tlb_fill sysemu only
Date: Sat, 30 Oct 2021 10:16:08 -0700
Message-Id: <20211030171635.1689530-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, alex.bennee@linaro.org,
 laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
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


