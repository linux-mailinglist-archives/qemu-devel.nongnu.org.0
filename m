Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A24441F53
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 18:31:15 +0100 (CET)
Received: from localhost ([::1]:47560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhb9O-0006Hs-8P
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 13:31:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb5q-0003GA-A9
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:34 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:37553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb5o-0000Zx-Jc
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:34 -0400
Received: by mail-qt1-x834.google.com with SMTP id o12so5763514qtv.4
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IKLMeO+3mWomlul9GD0bgra/twuVZxh+Vxqn0acqDpE=;
 b=hVEJUb/CKaTtun64AztJP2LYVZ61YcOdf/Oz5XZPlg0s6pyJI5NAmpgpwhD5xW7Yfu
 dKUWgjXPWkUByVXKQaVlZxIYfsTAAJdYawItAAIDz88F4G5g3EmxYek0UdeICWyhMnTf
 7VAlJdXBBvBGAi1hfSPwfWibykG85/HRNQ74+Ue+OMWTUQUIlGUSiBk6yOUS0xF9NBqs
 Ccj3H2AOt2p3HuY5bDmVkPWLGJ0LoD7YpyBH4vq2adQAem5d9yeJiILOMSAcW7xNENrI
 hWvEY31605gvJgsKERRu52oJPN+mQeefV+Kz5RCEl+j9LQ8DskgBMxO0L+d63PlVDFgs
 xKIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IKLMeO+3mWomlul9GD0bgra/twuVZxh+Vxqn0acqDpE=;
 b=iBXKnmd4sU81Iw69Dmrz2sDQa2mog252vKlomjrDuZcEWMogT2OOW+6Rgz+jVqW6Nm
 wSlYr9/WV54gvboPq+ABuZ1+Yrgn2wFCToVKAu3hF4OYu0C+2k/f774bInwt4NErjXoC
 p4sQSuuiNy5wcxXJNoKLzpDjKOyzJERuRX3rEXYFdeYYbTIJzEfzRabst+3DZ5AxwvTi
 6N5zI0pO9OlN+zXEsdrPDSQMZJ7Fyyhd0kuGX/LNTsw8JQ+asqgCFLgbnQTo2g3u5Feh
 9jlXFjblYCRFDPqVsN9Md2LHFy6lXipIbxCV+Ki472pukoUQu0Pa1PEmbJhE1WmLK8ru
 2BPA==
X-Gm-Message-State: AOAM532V5WGsvAW+fENDmHVu1l/EOs6QIaY1pDiR5CpO9fj1M8HaymaH
 cvcmylNPNd6cO4ZMrDuDTYJU0BuN3EyV7A==
X-Google-Smtp-Source: ABdhPJxXj0c8/X1qSI3YTgUo4SFgziAQvSepjH4Te2qUGcQhA+QVHggkQC2kJNrA924KNtHSPhcoQg==
X-Received: by 2002:ac8:7fd3:: with SMTP id b19mr3529615qtk.235.1635787651488; 
 Mon, 01 Nov 2021 10:27:31 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id t5sm6075331qkf.34.2021.11.01.10.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:27:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 01/60] accel/tcg: Split out adjust_signal_pc
Date: Mon,  1 Nov 2021 13:26:30 -0400
Message-Id: <20211101172729.23149-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x834.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split out a function to adjust the raw signal pc into a
value that could be passed to cpu_restore_state.

Reviewed-by: Warner Losh <imp@bsdimp.com>
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


