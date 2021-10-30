Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B85F440AB5
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:45:56 +0200 (CEST)
Received: from localhost ([::1]:60082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgsQV-0002aA-7J
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:45:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryK-0001un-Uh
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:16:49 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:37847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryB-0008UZ-VA
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:16:48 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 t5-20020a17090a4e4500b001a0a284fcc2so13074203pjl.2
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IKLMeO+3mWomlul9GD0bgra/twuVZxh+Vxqn0acqDpE=;
 b=yv/Hd+pzFAYspSSHurdxOu8V+3E5AKU4yDzRMlBFkTg0vUGtRmieo7H3kkrAEBEM3n
 HMi08ImSf0J1TDXp1CPitvL+zijMHvQAutB4Y+BCYUUu1HbdRFSh1HB/H3LOqXzvhf4U
 ibBkkzOpfV/M7wXg2l5jHUyND9Yk6xY4iUMJ2SS4gDOYlT47D6O3WtXtzC4o4Ue/tImn
 /t2APtK8NgbDuXA67tzW1jIZKSO4CBzL6oTD3SedqWPCreuB5DWJU2Pg2Wi1lDoc5fns
 N7LcRFh04GjxA/37ADd2ecMtN4sjyfxH32ioFgglV+KB1Cjg6KprbucgeXnCnZZ0IcnS
 3ZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IKLMeO+3mWomlul9GD0bgra/twuVZxh+Vxqn0acqDpE=;
 b=INQ3yIprm3O/R7v8PKTqBkeKnhR4V7W1r5lwprTJ/U8Kt7eBxIo7JHSrtkPUGuDO8R
 fNCyeRS9A5CFq6VNISbnu9fxPLFpwukDzlp99pfxE0QLzYmV0f6HIrM/Gaq8Gs9/F+zF
 RRqv5viN2sQudWZkEW9k+W72HfDaBOCkCocZBcXnv8Eg47jAlqJY1/ZdV3aUrgzMWdpH
 F4KOFVT3j4uxFPs7WfEc0szFi5CLRkDF0gE5nSQlp/briOcpyCsTqZUrEzP8YwTVwPHu
 vnBjufz14XME17omgxCcaodw/5x5J2NFYJsz2RifJuj2mAjSjzR7ZuPQ/diZZeP9wG4P
 P+oA==
X-Gm-Message-State: AOAM5326x2vSpMrb6KzYcFaVVN/y3fAN+v5prW+RCO2bQFfLZ3egNG7B
 Knn83pYHfm7t73SojvOOM1TsM/g3A/i1IQ==
X-Google-Smtp-Source: ABdhPJyGAnuear3wlZ+Aiylo5dvQQbvrbEPwqrRGd57TGsgoQ/yJGzrgw11tsnq5QuYIoqIEy9fGcQ==
X-Received: by 2002:a17:902:778a:b0:13f:672c:103a with SMTP id
 o10-20020a170902778a00b0013f672c103amr16420218pll.55.1635614198270; 
 Sat, 30 Oct 2021 10:16:38 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id nv4sm3111943pjb.17.2021.10.30.10.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:16:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 01/66] accel/tcg: Split out adjust_signal_pc
Date: Sat, 30 Oct 2021 10:15:30 -0700
Message-Id: <20211030171635.1689530-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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


