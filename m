Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DAF440AC7
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:54:59 +0200 (CEST)
Received: from localhost ([::1]:57032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgsZG-0003L4-TP
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:54:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryV-0002De-4z
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:17:00 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:39614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryR-00009U-27
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:16:58 -0400
Received: by mail-pf1-x42a.google.com with SMTP id b1so8788181pfm.6
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BEoOYfyvrRlliP3CVpcV5+AEGq6qhapGY3bb4mVGTHg=;
 b=pXc5aelQRjCX3AXjADbdUa8FmuaEUSfgXyeEzLQfdVXjET8TDDDqTwdE5pe3qPlHXe
 gjMTvg8xZVCEPOfMv0ZB3dNyOaYXpDmxteqK15rCD1Unv5w5oJ6/bLb6PjNNR4XI1x+v
 NQX7ZEzKVNpNw/eo1y7pdGKB1NxHfNOQmz5rZV+YwaAcJGuds/tw5zzE73g/bfRNMAfi
 TaGAS/KR3+zHPN6M0ztiskk1Zh69oxeAteGjVyKXLucSk/0z+srmrl49yW32jxU+Gk5D
 M3S6VWix8TWajcD8Wr+4YYnxiDSbZJifqrePYsBeI2aEZkuHZ6ui1J9cBahAIsph51+Q
 MNSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BEoOYfyvrRlliP3CVpcV5+AEGq6qhapGY3bb4mVGTHg=;
 b=qP016JlrWrZFChp0a2DlXT782oHOjg+ke5GPVnRBlZZe36IBM6N+mNS3eiARAobKBL
 fo/H1mFjsHgdHCuhyf8HEezIsfh/8EM7l/a5deqEkmQQoQE6ocAmL2fLHipk/h7uPqFu
 Nn3eaSG/E+H2YiKYC+3ikKRage6u0uh7TELj4ORPEWq2P1Hn5o2i/guUNYXFb7fKiA4S
 sOftF/oku3VpRE2MFpS+JHeiJVHWjcNgVfnfyPA0zkmkKyOXCg37xXhrYDluFkAPik8+
 ULeIiLS2u0LvghmmFZSiESyc1LWowFtg7PCOUuIunoKlyX7ELGxFk9qY4LWCYCjpPJaJ
 /Lxw==
X-Gm-Message-State: AOAM533rqFdo2rum14AqqyqcyJgo7I0vHIXsnj4DceGg2CDxRxVHQLp4
 cD1GPbKtexvsY15lZvea+rgwEgTmhMP/fg==
X-Google-Smtp-Source: ABdhPJykUDIkGBcroN/4GWSu+ZXzlvEMSPXFzT+uuemrima/GEdvjQeCdGBHjRvDuKQI2VdvkII0cQ==
X-Received: by 2002:a05:6a00:c81:b029:30e:21bf:4c15 with SMTP id
 a1-20020a056a000c81b029030e21bf4c15mr18131490pfv.70.1635614213710; 
 Sat, 30 Oct 2021 10:16:53 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id nv4sm3111943pjb.17.2021.10.30.10.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:16:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 18/66] linux-user/signal: Drop HOST_SIGNAL_PLACEHOLDER
Date: Sat, 30 Oct 2021 10:15:47 -0700
Message-Id: <20211030171635.1689530-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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


