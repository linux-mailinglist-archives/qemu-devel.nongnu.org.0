Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00286410828
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 20:48:51 +0200 (CEST)
Received: from localhost ([::1]:40112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRfON-0007vh-1g
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 14:48:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLF-0004yc-9f
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:45:37 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:33284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLC-0006iJ-DF
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:45:37 -0400
Received: by mail-pl1-x62f.google.com with SMTP id t4so8427277plo.0
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 11:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d0XAyTZlMLuZKO7GS2lQ57aRasECVtACHoF9DI2hSaY=;
 b=XgZYrKNbCuJ25En3uFCieCBRkoENjIqeZk7KdwjA9HS0Um0PsAtaHD/KoqFdN9rkfd
 yH7PB8SfdzukttMDyyPOSTYqFg1q9v9nJOlYF5VB9Gt7tZeDGHgihnbKpB8YjQzPEL18
 p+0dEy5Uwg/91VveahU8cXvlKfmB0B2sxKYb0FWTVo5VeaWg47XGbWm+yoxmrJmy/qSb
 d5TX4bDJTy9t/gKOKR74dldyu/EgN1xl255se+KJwuMoGmZE5BP+kdqtLDMwzlJ5Al+F
 b72eKoYRKA4to/wxE7gbXSKhRRPI+hedR7Gf9pw7TRBXVJFuNbiBNzB2gjm1mrviMf87
 VNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d0XAyTZlMLuZKO7GS2lQ57aRasECVtACHoF9DI2hSaY=;
 b=UvItkHpX+bDMkuO1UUP6fcLIpzryCU68CJ8WmjL12MSJsTiHbI4VVyBdHHAg48NFG7
 pUwhfyvtyahhRilpbTPhhJyeczeVd4XUDb5i6ol3gir/2DM7y9mdjToY7zEdLzMGCMw/
 tOkS6PBckhln/YldSlrjucXafVIxwIA/X3LQkUKzP2MCKaLAnZO5bDI8D3IRf6UdN6fm
 +5UHuG+bTOorkAFxKFTUJ6cH/ssyx4opi02jGP1QOigLqTVzrQWIOSEhOuYU9SRQ0tCB
 4hkeejWPcmFLpE7O+9VZe6WmsAfxyAL1l+C/2eo2jWMbAIY34HoK6xf8/d/0sUKvDLPb
 jNyw==
X-Gm-Message-State: AOAM530QFuI0OncgR6IvG6ZjpixBcEN1fGzt7sCacORJ9r1NNsLr8b3c
 OCnUDpKTEcGC7uhv1TE6tFBR1tyR3eWBFA==
X-Google-Smtp-Source: ABdhPJy0Qp4GrU2CQDhNyzP5IR9pqL+T1ftFwTPUNRBELHOnO35kD77mmjEDlWVCab6mV/sFRwuVaQ==
X-Received: by 2002:a17:90a:4b83:: with SMTP id
 i3mr19580389pjh.22.1631990731929; 
 Sat, 18 Sep 2021 11:45:31 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y26sm9555858pfe.69.2021.09.18.11.45.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 11:45:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/41] accel/tcg: Split out handle_sigsegv_accerr_write
Date: Sat, 18 Sep 2021 11:44:49 -0700
Message-Id: <20210918184527.408540-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918184527.408540-1-richard.henderson@linaro.org>
References: <20210918184527.408540-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the major portion of handle_cpu_signal which is specific
to tcg, handling the page protections for the translations.
Most of the rest will migrate to linux-user/ shortly.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Pass guest address to handle_sigsegv_accerr_write.
---
 include/exec/exec-all.h |  12 +++++
 accel/tcg/user-exec.c   | 103 ++++++++++++++++++++++++----------------
 2 files changed, 74 insertions(+), 41 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index e54f8e5d65..5f94d799aa 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -673,6 +673,18 @@ static inline tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env,
  */
 MMUAccessType adjust_signal_pc(uintptr_t *pc, bool is_write);
 
+/**
+ * handle_sigsegv_accerr_write:
+ * @cpu: the cpu context
+ * @old_set: the sigset_t from the signal ucontext_t
+ * @host_pc: the host pc, adjusted for the signal
+ * @host_addr: the host address of the fault
+ *
+ * Return true if the write fault has been handled, and should be re-tried.
+ */
+bool handle_sigsegv_accerr_write(CPUState *cpu, sigset_t *old_set,
+                                 uintptr_t host_pc, abi_ptr guest_addr);
+
 /**
  * cpu_signal_handler
  * @signum: host signal number
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index e94f1fed00..6f4fc01b60 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -114,6 +114,54 @@ MMUAccessType adjust_signal_pc(uintptr_t *pc, bool is_write)
     return is_write ? MMU_DATA_STORE : MMU_DATA_LOAD;
 }
 
+/**
+ * handle_sigsegv_accerr_write:
+ * @cpu: the cpu context
+ * @old_set: the sigset_t from the signal ucontext_t
+ * @host_pc: the host pc, adjusted for the signal
+ * @guest_addr: the guest address of the fault
+ *
+ * Return true if the write fault has been handled, and should be re-tried.
+ *
+ * Note that it is important that we don't call page_unprotect() unless
+ * this is really a "write to nonwriteable page" fault, because
+ * page_unprotect() assumes that if it is called for an access to
+ * a page that's writeable this means we had two threads racing and
+ * another thread got there first and already made the page writeable;
+ * so we will retry the access. If we were to call page_unprotect()
+ * for some other kind of fault that should really be passed to the
+ * guest, we'd end up in an infinite loop of retrying the faulting access.
+ */
+bool handle_sigsegv_accerr_write(CPUState *cpu, sigset_t *old_set,
+                                 uintptr_t host_pc, abi_ptr guest_addr)
+{
+    switch (page_unprotect(guest_addr, host_pc)) {
+    case 0:
+        /*
+         * Fault not caused by a page marked unwritable to protect
+         * cached translations, must be the guest binary's problem.
+         */
+        return false;
+    case 1:
+        /*
+         * Fault caused by protection of cached translation; TBs
+         * invalidated, so resume execution.  Retain helper_retaddr
+         * for a possible second fault.
+         */
+        return true;
+    case 2:
+        /*
+         * Fault caused by protection of cached translation, and the
+         * currently executing TB was modified and must be exited
+         * immediately.  Clear helper_retaddr for next execution.
+         */
+        cpu_exit_tb_from_sighandler(cpu, old_set);
+        /* NORETURN */
+    default:
+        g_assert_not_reached();
+    }
+}
+
 /*
  * 'pc' is the host PC at which the exception was raised.
  * 'address' is the effective address of the memory exception.
@@ -125,8 +173,9 @@ static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
 {
     CPUState *cpu = current_cpu;
     CPUClass *cc;
-    unsigned long address = (unsigned long)info->si_addr;
+    unsigned long host_addr = (unsigned long)info->si_addr;
     MMUAccessType access_type = adjust_signal_pc(&pc, is_write);
+    abi_ptr guest_addr;
 
     /* For synchronous signals we expect to be coming from the vCPU
      * thread (so current_cpu should be valid) and either from running
@@ -143,49 +192,21 @@ static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
 
 #if defined(DEBUG_SIGNAL)
     printf("qemu: SIGSEGV pc=0x%08lx address=%08lx w=%d oldset=0x%08lx\n",
-           pc, address, is_write, *(unsigned long *)old_set);
+           pc, host_addr, is_write, *(unsigned long *)old_set);
 #endif
-    /* XXX: locking issue */
-    /* Note that it is important that we don't call page_unprotect() unless
-     * this is really a "write to nonwriteable page" fault, because
-     * page_unprotect() assumes that if it is called for an access to
-     * a page that's writeable this means we had two threads racing and
-     * another thread got there first and already made the page writeable;
-     * so we will retry the access. If we were to call page_unprotect()
-     * for some other kind of fault that should really be passed to the
-     * guest, we'd end up in an infinite loop of retrying the faulting
-     * access.
-     */
-    if (is_write && info->si_signo == SIGSEGV && info->si_code == SEGV_ACCERR &&
-        h2g_valid(address)) {
-        switch (page_unprotect(h2g(address), pc)) {
-        case 0:
-            /* Fault not caused by a page marked unwritable to protect
-             * cached translations, must be the guest binary's problem.
-             */
-            break;
-        case 1:
-            /* Fault caused by protection of cached translation; TBs
-             * invalidated, so resume execution.  Retain helper_retaddr
-             * for a possible second fault.
-             */
-            return 1;
-        case 2:
-            /* Fault caused by protection of cached translation, and the
-             * currently executing TB was modified and must be exited
-             * immediately.  Clear helper_retaddr for next execution.
-             */
-            cpu_exit_tb_from_sighandler(cpu, old_set);
-            /* NORETURN */
-
-        default:
-            g_assert_not_reached();
-        }
-    }
 
     /* Convert forcefully to guest address space, invalid addresses
        are still valid segv ones */
-    address = h2g_nocheck(address);
+    guest_addr = h2g_nocheck(host_addr);
+
+    /* XXX: locking issue */
+    if (is_write &&
+        info->si_signo == SIGSEGV &&
+        info->si_code == SEGV_ACCERR &&
+        h2g_valid(host_addr) &&
+        handle_sigsegv_accerr_write(cpu, old_set, pc, guest_addr)) {
+        return 1;
+    }
 
     /*
      * There is no way the target can handle this other than raising
@@ -194,7 +215,7 @@ static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
     sigprocmask(SIG_SETMASK, old_set, NULL);
 
     cc = CPU_GET_CLASS(cpu);
-    cc->tcg_ops->tlb_fill(cpu, address, 0, access_type,
+    cc->tcg_ops->tlb_fill(cpu, guest_addr, 0, access_type,
                           MMU_USER_IDX, false, pc);
     g_assert_not_reached();
 }
-- 
2.25.1


