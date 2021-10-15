Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A04CD42E7A4
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:21:21 +0200 (CEST)
Received: from localhost ([::1]:52256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbEie-0001St-Kr
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:21:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEYt-0007ES-58
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:15 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:47100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEYq-0000Hy-3V
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:13 -0400
Received: by mail-pf1-x42b.google.com with SMTP id i76so5149790pfe.13
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BEoOYfyvrRlliP3CVpcV5+AEGq6qhapGY3bb4mVGTHg=;
 b=nguHstMxODNDspQVrHP+s1x9jH1NX2XHVabg7k2QUt0njxyAWzrQPWjdYm+tPslwmn
 7KoZk0+8/2p7B1H7N8IfQ8afgpRILEN/jCcSyvda55430+XPuyrsHKvtWTR2RTBSfm9p
 AYTRT5NCVO9lWrFSijPcdRcfHXVdTkAtZGBWvqLJdXbcuUIox3O1oCSoIv7Wg3BBVh0B
 qLlg/pUKj1BfEc5dDI7UT6pwIhQHjPFmhIx50Q2MyzxwPeUEfxvSgvwUAS340MpWsWcy
 0deCcMZoMDTiQ+SRR785uobCe5s3eEOlVdFBMVJl4unO+1QSJk/zEsE2P1roBVtAMQHE
 jiwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BEoOYfyvrRlliP3CVpcV5+AEGq6qhapGY3bb4mVGTHg=;
 b=7ly2PC9H2LSCEmEVzRgomMhsHi7htAMZJrxORqiHaLM/EtbJJPYcbAjl7Fsu3j0Uen
 MpCt9lWoyuCec55sk6Hu/ZzUSmaQR7F+9nNL1oEkvS6qqyyhI3nDKimyWxpNdR8hsVfh
 TADXFdlk3ngrdRNEtODDiiNMarz/+vL5f4uCXg4q/VgJNLipcVrYTfsaR7zFXBGm6dW5
 zOUr8Ik2EDe2JIe7R156ve/5bqxZYTGPt3TT765hWUrQiZlC81yB2v2c2Wxa+z0s+Q1k
 24WeYd3dhsxGfGsOtte4yjsktoVusG2WHzrGHI6Xj2bAtLR3CbMwZkJXccJyYa92tawj
 nh7A==
X-Gm-Message-State: AOAM532z6RiTPjWG4JFi9jNtEQZ8AtrjqBaH5p9FQnwu4uj9LLNWEZCA
 oLhqOH7KxM+e9B4i9URdm+rCIT9uHa076g==
X-Google-Smtp-Source: ABdhPJweQZ5lNt7leRr9QTmH5N3qPkmOwwtyybkbO/qLb6VdapRDKAVutkmLAF6peGTpeMNLHExcDA==
X-Received: by 2002:a65:538e:: with SMTP id x14mr7352445pgq.364.1634271070690; 
 Thu, 14 Oct 2021 21:11:10 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id me12sm5718006pjb.27.2021.10.14.21.11.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:11:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 18/67] linux-user/signal: Drop HOST_SIGNAL_PLACEHOLDER
Date: Thu, 14 Oct 2021 21:10:04 -0700
Message-Id: <20211015041053.2769193-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that all of the linux-user hosts have been converted
to host-signal.h, drop the compatibility code.

Reviewed by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h | 12 ------------
 linux-user/signal.c     | 14 --------------
 2 files changed, 26 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 5f94d799aa..5dd663c153 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -685,18 +685,6 @@ MMUAccessType adjust_signal_pc(uintptr_t *pc, bool is_write);
 bool handle_sigsegv_accerr_write(CPUState *cpu, sigset_t *old_set,
                                  uintptr_t host_pc, abi_ptr guest_addr);
 
-/**
- * cpu_signal_handler
- * @signum: host signal number
- * @pinfo: host siginfo_t
- * @puc: host ucontext_t
- *
- * To be called from the SIGBUS and SIGSEGV signal handler to inform the
- * virtual cpu of exceptions.  Returns true if the signal was handled by
- * the virtual CPU.
- */
-int cpu_signal_handler(int signum, void *pinfo, void *puc);
-
 #else
 static inline void mmap_lock(void) {}
 static inline void mmap_unlock(void) {}
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 6900acb122..b816678ba5 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -780,17 +780,6 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
     ucontext_t *uc = puc;
     struct emulated_sigtable *k;
     int guest_sig;
-
-#ifdef HOST_SIGNAL_PLACEHOLDER
-    /* the CPU emulator uses some host signals to detect exceptions,
-       we forward to it some signals */
-    if ((host_sig == SIGSEGV || host_sig == SIGBUS)
-        && info->si_code > 0) {
-        if (cpu_signal_handler(host_sig, info, puc)) {
-            return;
-        }
-    }
-#else
     uintptr_t pc = 0;
     bool sync_sig = false;
 
@@ -850,7 +839,6 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
 
         sync_sig = true;
     }
-#endif
 
     /* get target signal number */
     guest_sig = host_to_target_signal(host_sig);
@@ -865,7 +853,6 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
     k->pending = guest_sig;
     ts->signal_pending = 1;
 
-#ifndef HOST_SIGNAL_PLACEHOLDER
     /*
      * For synchronous signals, unwind the cpu state to the faulting
      * insn and then exit back to the main loop so that the signal
@@ -875,7 +862,6 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
         cpu->exception_index = EXCP_INTERRUPT;
         cpu_loop_exit_restore(cpu, pc);
     }
-#endif
 
     rewind_if_in_safe_syscall(puc);
 
-- 
2.25.1


