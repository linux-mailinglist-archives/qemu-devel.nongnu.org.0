Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8623A42451C
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 19:45:54 +0200 (CEST)
Received: from localhost ([::1]:57712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYAzJ-0005Qj-Gk
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 13:45:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdc-0007Dj-7J
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:28 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:36562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdZ-00085v-2U
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:27 -0400
Received: by mail-pf1-x431.google.com with SMTP id m26so2978911pff.3
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 10:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BEoOYfyvrRlliP3CVpcV5+AEGq6qhapGY3bb4mVGTHg=;
 b=XhH4BzsrJrdFo0R76RVQHqpEFxZZdTypS4Z7GxpICdJbf0St8sla11MQ3jHhT/O8Ml
 Y9ej3y9+8dqnZmcuXNwBonG5KEq+UMtO8sdIGp9R9oaFLQHr1CcBjU/bnh/CUuh8g/jQ
 WQuOh4O9SioDG//kpzyv6xMtrW1WT7A0j1Xz1ixz/zUBx9G/+E+qM+P2asffwssMc+I/
 mkMvouRq6xh9qAP8AFTU74Hl6Rs6TayN+4c743VV6y1j9nTHUNp7xAQYVZmqKpz8fsKN
 QBnkqIRBZ8qif5aR40PU+4wMqp1Rkoj15LlFn7VAIAslmeCxo/x8o7yxa/urNyJBOkti
 EYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BEoOYfyvrRlliP3CVpcV5+AEGq6qhapGY3bb4mVGTHg=;
 b=axQUJKp+GuL6zxvwr+xD3FYEBiQvHIuvCsJOfp4v1EOi7LfuqfwC19rHJDLQwD0lCy
 qgVD51kVWbxOy2WRkpmkYcmsnurILBF/cO0XU/wYE9fn/vvTm8sG19aPztyrW9hy8TZN
 clA87NEB3dbErWQI1CYN9ACh/VODsy0iX8dO56FYMWnf8DbOn5zkQTsUX/cE7+EMJg8g
 deugTQLRjNFKlQqnSRyUxH2HzcEGRgI02PJH/iQc1ZnaKzeyeu4kuOmuCSxNgJnsWSvx
 Mo8FX3t+F+OQMow6WU5Iv+7k3aPqyFC5H/J/cmem9INnit2vsJmXB2Np2BioG6hub75p
 vjUQ==
X-Gm-Message-State: AOAM533LsErtxn131bepTAiD2geg/Vbh0vHRw9fpraK7LN4k9qUCU8O5
 Vmwz5J4mY0z8vlABlX7ZR4CQ2dzUnT0Vmg==
X-Google-Smtp-Source: ABdhPJz9Cc7ZKcAVgNxBrib4QypdP0z+7ldFGb/emI4SWSadgyQTH4FvO4XJ5UJ/CdOZQTBgNfpZXg==
X-Received: by 2002:a05:6a00:15c9:b0:44c:a998:b50d with SMTP id
 o9-20020a056a0015c900b0044ca998b50dmr3329678pfu.49.1633541003405; 
 Wed, 06 Oct 2021 10:23:23 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w7sm21606929pfj.189.2021.10.06.10.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 10:23:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 18/41] linux-user/signal: Drop HOST_SIGNAL_PLACEHOLDER
Date: Wed,  6 Oct 2021 10:22:44 -0700
Message-Id: <20211006172307.780893-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006172307.780893-1-richard.henderson@linaro.org>
References: <20211006172307.780893-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu,
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


