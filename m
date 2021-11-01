Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D386441F90
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 18:48:51 +0100 (CET)
Received: from localhost ([::1]:53730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhbQQ-00054o-6b
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 13:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb63-0003hf-NL
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:47 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:43687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb5y-0000cZ-8T
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:46 -0400
Received: by mail-qk1-x72b.google.com with SMTP id bp7so11991761qkb.10
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BEoOYfyvrRlliP3CVpcV5+AEGq6qhapGY3bb4mVGTHg=;
 b=ZFu/X7kcgmlrLRSIKJeaG4icaNj7m2zvhirGUtcP4BBFKttgroETgqF5pEnigaoesq
 EprvdNBkfd659Y5pRoHTy6+fqtje6nkeLfwKRpXhFRlXsATbFnK2q1NVOzm2lWIqJJjO
 VS7StUN/eA505r+p1t4gMK5QYvs/ckJ+a4i1ZQTLVMWDLD1Ou1LjA8dZjzYFVTRS49Wk
 lu3TuTX19LEpvbyxkxCekbwrewNdo7QE/tACo1fLflUERsTiOFN49xKZ9Af2QttvJ4qM
 JKyJ1+Z+LRIKr93a9P3eVo5KRruieTfJ2siiacYqNwSUdL7WHtCiVdYrtFOucE2b6X55
 pVyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BEoOYfyvrRlliP3CVpcV5+AEGq6qhapGY3bb4mVGTHg=;
 b=Ino9Cl0CO1euryMN2rHrhNJbsPAqNZjfezAwf/+xHTPM/BNTdHn75UZ9cfvsSYTCz6
 JzbWrGRfxvX5mE/k6++nlW7ODyBRzsUGf7X75Vpn8e7jHjcQ2D0mc7/gwo24Njc+GuaI
 dlftfoLTbebqtyB+y3UqDT+uHDR7kKMJjSFunDgacRnZneUCVQySkzMMm/gaH87mffD6
 6ED9+nV6hBNK+/IJn6clciNgzWQyHgOeHMSag6fWR82ECJEBXAmEAbyUHNxcywYd6X+z
 dYj6pYnVls5QyqJFEVdj2kyo+WjgLR/eu7Nl9a9PMCnTWFJxMkXO3csx/O7d4RcmjTSB
 ioJA==
X-Gm-Message-State: AOAM533ako8r7V/P0KB69zNeq2jKmTaES5O8W4Pp2NYzJtcF7g/i5j8O
 hIDMDReWnk6MoHRZVpnInovAvniqN9n7qQ==
X-Google-Smtp-Source: ABdhPJy5xDmc/M0RXEctFVIz/Ugl3F9yLy4mFRoxcTrObxQvsU5Phc7DiNsyHJYNTGJ25F0ovJJTlA==
X-Received: by 2002:a05:620a:4091:: with SMTP id
 f17mr4248507qko.56.1635787661463; 
 Mon, 01 Nov 2021 10:27:41 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id t5sm6075331qkf.34.2021.11.01.10.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:27:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 18/60] linux-user/signal: Drop HOST_SIGNAL_PLACEHOLDER
Date: Mon,  1 Nov 2021 13:26:47 -0400
Message-Id: <20211101172729.23149-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72b.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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


