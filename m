Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA55742E78B
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:13:14 +0200 (CEST)
Received: from localhost ([::1]:54766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbEan-00015b-Hp
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEYd-0006f5-57
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:10:59 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:41947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEYb-0008WE-7c
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:10:58 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so6415392pjb.0
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KuLneJaR8ad6zfXTHHDWg+qki3lZgiD+ST/qhhyEGtg=;
 b=Q8DQDDwoPV6XOzXFGiN+2e06iPsAqlzS3h9OYiPILk9999LxJ1yf765DaQ4z94o2gO
 CtYJnqk9Chw4CLku5tXfdWgzs6a02qm2Z/AP2G0XQoWVxyiZWe4MvLVi7rO1EvOWqWpV
 M12CpK74BDAKupe3kgjq/kItxoIxNzW/KMy6pv7RkKOTG6U+OPx7a2claOb2oc+UMvfg
 6LnvbI2Y8YhnrVVxriOIe8H/EEd+HVUYq1wivlnDBUMjJDkFKO8uzOhAyyEtJrdh9XoU
 TbOJD7WGLNwILfHIo6KE9gJ+qm2WDW2rrDPvhweJQUoU7h6RIlJNuE0JjhRrXTGsWeDY
 HNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KuLneJaR8ad6zfXTHHDWg+qki3lZgiD+ST/qhhyEGtg=;
 b=xIbouTGaPNExh3tMVkO799HB0c6mF982b0PPIzXS8ugr6D3uXJ+mdEB4V2/5wpkAKZ
 uFBKrlCkIFe9vT9GJKE3ETm92DudnoicbzJMCetVPs5SmU88PJcOCnxQgu9dNRXoc3Yd
 /cuOP7vl4dN/70A3Anz7IOil7jrdduDJa6Us5xhPM1sMXoDfYDc1q6atGX18OXMK4a8s
 iZ6IzPQ2fg71U7dB69YCFBc65rHAzClgFpC1YPonNOpv2xbqnWH/vnIxszzvDiCqnF2M
 sUyIo3uQnqhJJ/g8RBvSzoe3jZyeKfzW7a/6n2JWCmDDyV/PGnfdIQExl2tkjqO4oyzs
 V8Nw==
X-Gm-Message-State: AOAM532icjzrVknR0F9gaTZASmdJ39SNi1CG6GYXVQAS0UlMYcrSEzFR
 SLSwrHO6rY+RQtQw4ApGLkrrddIlPhhY9w==
X-Google-Smtp-Source: ABdhPJzphE7WbWe9VqXJhZv77Dw/itXeRthCWbCQibv+SlhYN3+z3JL1SYlkpwpApl8ssORwUNyJuQ==
X-Received: by 2002:a17:90a:de84:: with SMTP id
 n4mr7006410pjv.226.1634271055778; 
 Thu, 14 Oct 2021 21:10:55 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id me12sm5718006pjb.27.2021.10.14.21.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:10:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 01/67] accel/tcg: Split out adjust_signal_pc
Date: Thu, 14 Oct 2021 21:09:47 -0700
Message-Id: <20211015041053.2769193-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

Split out a function to adjust the raw signal pc into a
value that could be passed to cpu_restore_state.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Adjust pc in place; return MMUAccessType.
---
 include/exec/exec-all.h | 10 ++++++++++
 accel/tcg/user-exec.c   | 41 +++++++++++++++++++++++++----------------
 2 files changed, 35 insertions(+), 16 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 9d5987ba04..e54f8e5d65 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -663,6 +663,16 @@ static inline tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env,
     return addr;
 }
 
+/**
+ * adjust_signal_pc:
+ * @pc: raw pc from the host signal ucontext_t.
+ * @is_write: host memory operation was write, or read-modify-write.
+ *
+ * Alter @pc as required for unwinding.  Return the type of the
+ * guest memory access -- host reads may be for guest execution.
+ */
+MMUAccessType adjust_signal_pc(uintptr_t *pc, bool is_write);
+
 /**
  * cpu_signal_handler
  * @signum: host signal number
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index e6bb29b42d..c02d509ec6 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -57,18 +57,11 @@ static void QEMU_NORETURN cpu_exit_tb_from_sighandler(CPUState *cpu,
     cpu_loop_exit_noexc(cpu);
 }
 
-/* 'pc' is the host PC at which the exception was raised. 'address' is
-   the effective address of the memory exception. 'is_write' is 1 if a
-   write caused the exception and otherwise 0'. 'old_set' is the
-   signal set which should be restored */
-static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
-                                    int is_write, sigset_t *old_set)
+/*
+ * Adjust the pc to pass to cpu_restore_state; return the memop type.
+ */
+MMUAccessType adjust_signal_pc(uintptr_t *pc, bool is_write)
 {
-    CPUState *cpu = current_cpu;
-    CPUClass *cc;
-    unsigned long address = (unsigned long)info->si_addr;
-    MMUAccessType access_type = is_write ? MMU_DATA_STORE : MMU_DATA_LOAD;
-
     switch (helper_retaddr) {
     default:
         /*
@@ -77,7 +70,7 @@ static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
          * pointer into the generated code that will unwind to the
          * correct guest pc.
          */
-        pc = helper_retaddr;
+        *pc = helper_retaddr;
         break;
 
     case 0:
@@ -97,7 +90,7 @@ static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
          * Therefore, adjust to compensate for what will be done later
          * by cpu_restore_state_from_tb.
          */
-        pc += GETPC_ADJ;
+        *pc += GETPC_ADJ;
         break;
 
     case 1:
@@ -113,12 +106,28 @@ static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
          *
          * Like tb_gen_code, release the memory lock before cpu_loop_exit.
          */
-        pc = 0;
-        access_type = MMU_INST_FETCH;
         mmap_unlock();
-        break;
+        *pc = 0;
+        return MMU_INST_FETCH;
     }
 
+    return is_write ? MMU_DATA_STORE : MMU_DATA_LOAD;
+}
+
+/*
+ * 'pc' is the host PC at which the exception was raised.
+ * 'address' is the effective address of the memory exception.
+ * 'is_write' is 1 if a write caused the exception and otherwise 0.
+ * 'old_set' is the signal set which should be restored.
+ */
+static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
+                                    int is_write, sigset_t *old_set)
+{
+    CPUState *cpu = current_cpu;
+    CPUClass *cc;
+    unsigned long address = (unsigned long)info->si_addr;
+    MMUAccessType access_type = adjust_signal_pc(&pc, is_write);
+
     /* For synchronous signals we expect to be coming from the vCPU
      * thread (so current_cpu should be valid) and either from running
      * code or during translation which can fault as we cross pages.
-- 
2.25.1


