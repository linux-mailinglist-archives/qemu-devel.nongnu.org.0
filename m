Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5998B442CB1
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:34:38 +0100 (CET)
Received: from localhost ([::1]:36874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhs3p-0005EA-Em
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:34:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhreB-0003nX-Pk
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:08:07 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:33501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhre0-0000uh-FR
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:07:59 -0400
Received: by mail-qt1-x82f.google.com with SMTP id h16so14036787qtk.0
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BEoOYfyvrRlliP3CVpcV5+AEGq6qhapGY3bb4mVGTHg=;
 b=FFU5BWwwGn+SsA3IB4vNCzUdtUYaH0vC37mTtTDE7fKYg7Vj85GKmaC3li9IdC82Iu
 zZpTwehtziNiC3M204qllouO0Rfs7/7siHsSLO14Sh0p45VA/D3nIHx/q7btNxYCs6Yv
 V2eEHVsCtvqu/Doepmp7+/92IwwnicaIruWv/IHd7V1XSalkLvFqZjaD3Wre3snw6BfT
 jOCLmY6H2ZH0ZT8zpS8fFaqgRuz6y8ZM8Tryq2crHjJ4+3qr5URf17uAT/2zAoQGlNZn
 /G3XIKV5cjaG9s0lY6cNE/dHfri2P5i8HbLH0UcnPNwcNLKo6LLwyl/7Ajdnv5a8WxaE
 NOhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BEoOYfyvrRlliP3CVpcV5+AEGq6qhapGY3bb4mVGTHg=;
 b=s0T5oViLYV0DbRZUjha9FQNoOEi/BO83E2Z1ntcrVxKNIaNusrLmp0VrQUOUis2bUb
 80jegQf04EqYBe0PBI3S1j/xqHeIvTqoOG23D0iBHwMBRy80oETSOoLid76CTbPrw9vm
 x1U54RZUc2qA5H5TNTaZmx7RX3ufma+xj90qG16VpNiBv2ARqEfsSkxZ/JCECcWNpNcP
 SQmBuoc30DPTXZfw5W93MqNMxVzInCpya/KneJ1Zxy/kllNbU1oPiSqpfIDzRoaaL4mv
 QWCFdok9smkeL1ANMQrO1D5zcRnTl3zLULzNoDo0Txy+wvuxTtFuo8SaNCMC4Mn+aU+s
 vopw==
X-Gm-Message-State: AOAM530ATzwjk0iUGH7yHWD8Ep8MBwRvo1r/xwBvHafoMGxulXSlkE5H
 BCH3yK1w++8O7Rfllvj000M1IYWdtCaw7Q==
X-Google-Smtp-Source: ABdhPJzqxYeWXxlrQlMvtg/Yia39lDCqTxGKfiZ9jgJhbrCBTaBiFYWwbCTMQ9uG7MaUnvS1hXwqXQ==
X-Received: by 2002:a05:622a:346:: with SMTP id
 r6mr37424173qtw.0.1635851272330; 
 Tue, 02 Nov 2021 04:07:52 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm7sm3568612qkb.86.2021.11.02.04.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:07:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/60] linux-user/signal: Drop HOST_SIGNAL_PLACEHOLDER
Date: Tue,  2 Nov 2021 07:06:58 -0400
Message-Id: <20211102110740.215699-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
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


