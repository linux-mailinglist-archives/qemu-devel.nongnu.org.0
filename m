Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 531C241F319
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 19:28:32 +0200 (CEST)
Received: from localhost ([::1]:59130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWMKl-0005iH-0t
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 13:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM50-0004py-HF
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:14 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:42628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM4v-00056t-T5
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:14 -0400
Received: by mail-qk1-x72e.google.com with SMTP id x12so9810800qkf.9
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=plpjMgZs0Fmj1no4dWQvatctpg292W263ogwu9LIdH8=;
 b=otGns6K9LbdwNOmejpmuDxPUaHT3dlCKnwXo+BvZwjQp6r9i/YX32rNDzD1o7qWfkH
 yDH0qmoEZ/b+DnMzVjWRgsbFgcA02KDlIfSgVqbVAnFAXxx3wckiR456+kX1aM6Tx/Av
 dpM+25P9ciO3tcMtOHnQ8+wLl719rGCM6p/Rwi+8Yf43nJqT7BUUdoPJsVjLrBLILBsY
 wrVtZB9BXvTgo3SkBRkpcMp8rtBDUITFU9DEdLm9R2oKurS+XROF0VgvGqWSOqohRY02
 kAvBkzDEukaNe/9AVPjP4YafY/IyV2BlKXQ7aZTwveXGenZjIjuVNqcPF2iZ8Izm/IFa
 RLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=plpjMgZs0Fmj1no4dWQvatctpg292W263ogwu9LIdH8=;
 b=6z2Rb3ASIvcJuzzNdvv/fMDH2IWbcL/b/Ddhhz0ZrUk6Nc/jIUrswi5MneBBFCSY/0
 pT9XguxVsfVPDoSCwQQqtUJXBcFRBVT4CLlB77hlGDo7HsFiVXJ1bED7ciE+O1KEayIg
 ryG3naLpm2hhcUjBQzkk9Fa5qr0VX97rvtEiZ/PKqvwL8aX38wLYKW89NUihZcbOiZy+
 /916Hd0TIyXdtgcH2Uj+GQwbjRPRaiRN/JQHyxwV+QR0asG1GmqlTnQf+658HwizpOzi
 HH7cJJGICFIWWNtD2qTP1Db2WGeKg7tcqSnuzyJVzpvc0aQ1NnA8o7vDfcE90pe2pmLH
 jHVA==
X-Gm-Message-State: AOAM532Q+P4Tgj3xmGth3as415Tu/LQ+CphaRfLowFHxUQf4xDpHYDv5
 WJXlkjpeJ6uPvcozXkI9OMd+nMua3d6vQw==
X-Google-Smtp-Source: ABdhPJxKkmVpz6DZfDCDbezX6eVGCRrvL2RmU1sG3eWshNrFYFInCdlOVIYtQsf6Y4A8+gLTmKmC5Q==
X-Received: by 2002:a37:27d5:: with SMTP id n204mr10251474qkn.31.1633108328922; 
 Fri, 01 Oct 2021 10:12:08 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id y15sm3557250qko.78.2021.10.01.10.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:12:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 18/41] linux-user/signal: Drop HOST_SIGNAL_PLACEHOLDER
Date: Fri,  1 Oct 2021 13:11:28 -0400
Message-Id: <20211001171151.1739472-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001171151.1739472-1-richard.henderson@linaro.org>
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
index bab47a6962..537c6c41c0 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -777,17 +777,6 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
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
 
@@ -847,7 +836,6 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
 
         sync_sig = true;
     }
-#endif
 
     /* get target signal number */
     guest_sig = host_to_target_signal(host_sig);
@@ -862,7 +850,6 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
     k->pending = guest_sig;
     ts->signal_pending = 1;
 
-#ifndef HOST_SIGNAL_PLACEHOLDER
     /*
      * For synchronous signals, unwind the cpu state to the faulting
      * insn and then exit back to the main loop so that the signal
@@ -872,7 +859,6 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
         cpu->exception_index = EXCP_INTERRUPT;
         cpu_loop_exit_restore(cpu, pc);
     }
-#endif
 
     rewind_if_in_safe_syscall(puc);
 
-- 
2.25.1


