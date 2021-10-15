Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3D442E79A
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:15:54 +0200 (CEST)
Received: from localhost ([::1]:35348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbEdN-0006vQ-3B
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:15:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEYf-0006fq-KO
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:01 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:39596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEYc-00005L-Rv
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:01 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 ls18-20020a17090b351200b001a00250584aso8442778pjb.4
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oWBO3F4xYVHiKUc+8+wn/0Gm+2aHBS/NMTMJJaAZTpE=;
 b=WgZSYMdM5MiEpebpmYIdI2+8BQ124sV9aynGIBIyP/3QtsS+A7ArDlL5tNSlZwJfTU
 Biq6QVu4gcNXAfwuFi/fIrMIdttIwP2gpphizZGasIx/Nm1gPLlCchXqBs50Z2NVDBSt
 lSSPj6EEmITk5PjtpKXOb5egjYQiNPwN2ZrtqxRDlyULZdz71hQsnu8CezSt2nTAOEgT
 TNyHIp9rcUf3Z2J1UV7RSNVu8vAdbx37OhfjuxaTaXje8rS8hUsqDhWUuhSiF5P3uNhF
 eOGmZ7Zmuu812U/PBKH65Qb+5zqCbia3/n5rR36eyRNiVxDUHfGSLL11M91W1iKDmssG
 VY6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oWBO3F4xYVHiKUc+8+wn/0Gm+2aHBS/NMTMJJaAZTpE=;
 b=wl91TrKdoGdIrqyFugYbVNg1MjgUCrdT11fy7Z5kdkiVt/DLiFuLdO3VtRAt3AqKXW
 NVWhx82SFGOoV1VjeObjBZ6QMyFkph7dPP0GSDRPV4fGnummCbn7MVdxV+OkLGKBrAds
 tC1rx9/LMU2u7psebi8jMK3ZoUTMtLsD17Ky03X7JATQBCzK97fBL9ynhb+UPD4TlHwj
 hKIA+ccWQZWFUfF2lq4RMuYjzZK4aaUdCepIqx5cn/lW+YTcjD5izLszEy+4TbRsVE0D
 n8XOfAtn4YWSiFEj9LFna4XJECyXi2lGuyQjbzNox1CHealwUYkljLicDT444iPzJYke
 XcpA==
X-Gm-Message-State: AOAM533IT9ogewkTTQNug/lRUJJJhyQPFmMslvdyyrDjsMpcZ35f/Z4n
 pan4VkXZeFNL0X1Imp3e7EX1Z5byBkxosQ==
X-Google-Smtp-Source: ABdhPJz1sbQThlrKg1UhgrL/EOAnjTMxjq47ygbjBjA0fwhfT4RNBIoGhNCr0RRm3nu3DfK3nqKlaw==
X-Received: by 2002:a17:90a:4812:: with SMTP id
 a18mr24935113pjh.40.1634271057210; 
 Thu, 14 Oct 2021 21:10:57 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id me12sm5718006pjb.27.2021.10.14.21.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:10:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 03/67] accel/tcg: Split out handle_sigsegv_accerr_write
Date: Thu, 14 Oct 2021 21:09:49 -0700
Message-Id: <20211015041053.2769193-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index 3f3e793b7b..cb63e528c5 100644
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


