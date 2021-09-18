Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E40410847
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 21:07:44 +0200 (CEST)
Received: from localhost ([::1]:34496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRfgd-0008Ve-Ul
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 15:07:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLQ-00057r-MY
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:45:53 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:41768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLN-0006qi-K6
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:45:47 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 m21-20020a17090a859500b00197688449c4so9813119pjn.0
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 11:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mkpDyQi3PMKrFdlMQCQLbDcKXDWO1ARW+CoOrVOZKpc=;
 b=C08oYr/sxbSpb6AQYxQFXBxty12fy9N81y/zC20rgTXkfzyDq6pluJnlOC4zwqp4+t
 BRxoJEsIezBPfIJewy5xd7cBRuI3Z+4r69YyFCmTZnniMC18f0T1zGQ0UF0piFaXRGXg
 sJR1VPKBrqGaH5OKnLXZ0N4wS4Ox3shTDn8CDzjz94Ple3dr0hPKH0+GG8tWvtR/+Q6B
 NH1ZgKGKRIWyw4w44dAV+fJgv0kD5+e+P827s0iGefr6mly+tQSEZQVP4dD7AP8JjvbK
 qaG0d9+vK1CnEEiO5SD0svIe22YnlgH+Z6dXocl8jPJQsVxw0u2lQkuWwyOFWW08i1nq
 BwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mkpDyQi3PMKrFdlMQCQLbDcKXDWO1ARW+CoOrVOZKpc=;
 b=EBOk6dH244ygYcaUQTiclqCU5RmIvoUV7ppVLWUl0mp4vStNwFOI2oeV39T0hqq7b/
 oiOrA/1LUU/50yjABYrJEnwgpBwDRB/Waj8UZIuVbuXHw/L6MSmYcSwct7DIO00JYm0s
 kP5btGS8k9pWKkUOVRTLzl2OuiwI531e5wCOSqjF7sClvdorppq3htiInyf9KgeX4Tx3
 cmuN3s2BIViWlky4Vq2Lik5HjfIIXb1BCGUduChi6YQHmHQvNg476kcqlkA3BCZGGZhv
 DZIB8Mh5aF3+HI6nW0vM57U4jd2aNpCmJWggENxgnRBw4rw7kl4gSaAf3O6GcCcIgi5S
 OmPw==
X-Gm-Message-State: AOAM531SSGPxJfQc7QT+simDFxbfhocarFmAO0KV6Z3Qp0XcDItmsszU
 s2NjuIOfAdNv1YN00NfQ7CMApwFDln428A==
X-Google-Smtp-Source: ABdhPJyR1tUmb/YNeif2lH7LrhODtn/XgtaooKxnuMrP0I/McwBiJ6URAVIBtAFMeYzrw1Kr2/5opg==
X-Received: by 2002:a17:90a:191a:: with SMTP id
 26mr19997917pjg.79.1631990743992; 
 Sat, 18 Sep 2021 11:45:43 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y26sm9555858pfe.69.2021.09.18.11.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 11:45:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/41] linux-user/signal: Drop HOST_SIGNAL_PLACEHOLDER
Date: Sat, 18 Sep 2021 11:45:04 -0700
Message-Id: <20210918184527.408540-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918184527.408540-1-richard.henderson@linaro.org>
References: <20210918184527.408540-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

Now that all of the linux-user hosts have been converted
to host-signal.h, drop the compatibility code.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h | 12 ------------
 linux-user/signal.c     | 13 -------------
 2 files changed, 25 deletions(-)

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
index 6f953f10d4..e6531fdfa0 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -773,16 +773,6 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
     ucontext_t *uc = puc;
     struct emulated_sigtable *k;
     int guest_sig;
-
-#ifdef HOST_SIGNAL_PLACEHOLDER
-    /* the CPU emulator uses some host signals to detect exceptions,
-       we forward to it some signals */
-    if ((host_sig == SIGSEGV || host_sig == SIGBUS)
-        && info->si_code > 0) {
-        if (cpu_signal_handler(host_sig, info, puc))
-            return;
-    }
-#else
     uintptr_t pc = 0;
     bool sync_sig = false;
 
@@ -842,7 +832,6 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
 
         sync_sig = true;
     }
-#endif
 
     /* get target signal number */
     guest_sig = host_to_target_signal(host_sig);
@@ -857,7 +846,6 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
     k->pending = guest_sig;
     ts->signal_pending = 1;
 
-#ifndef HOST_SIGNAL_PLACEHOLDER
     /*
      * For synchronous signals, unwind the cpu state to the faulting
      * insn and then exit back to the main loop so that the signal
@@ -867,7 +855,6 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
         cpu->exception_index = EXCP_INTERRUPT;
         cpu_loop_exit_restore(cpu, pc);
     }
-#endif
 
     rewind_if_in_safe_syscall(puc);
 
-- 
2.25.1


