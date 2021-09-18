Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 970B5410825
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 20:48:50 +0200 (CEST)
Received: from localhost ([::1]:39966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRfOL-0007qT-9L
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 14:48:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLC-0004yO-RK
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:45:34 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:36538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLA-0006gV-2V
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:45:34 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so12336326pjr.1
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 11:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MwSLIpZg3SBDOkqorWI9RwSF0cto2aAplNrO4o3oH4g=;
 b=OfcFIhVaDEiEzOK/rX+3aeV5ZbEHksw7k5lRIrl80/Siq9JyTSHhmSvXnIZluCCKBu
 o5HB9T9YTynZqHWwmThHk3sgWmB72P9tWfiR+E/jotKGZ1xU8904lLqjZ+e6o8c58MA8
 OIrnCss3CO/kbhUAkncFYf8Dmal0fuCiWOjlFkwK6quCut4B0irXv/q9KukwcX6dD6Nj
 9Z4kYt9myZ9d9D9yH6qGaD3ZNLJVPZOzoCy1ywhyUu82/BbeZ7lU20TL6xKCL0kbN2AZ
 E6zz/jLMMR9y03KJ33pqLlo72LlxK9z4h2mgfIylYpCzq9G3s7Urim1yMyslfhOFI14/
 Aznw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MwSLIpZg3SBDOkqorWI9RwSF0cto2aAplNrO4o3oH4g=;
 b=MoGkVLtURgss5tw5KNT0713C4AH8EH9YDfaD0m0cCk+Pa52yuYr4QFYHAELXTPL9fn
 GqVl434CPkGBJy+pLWq459Mwax4VLqdZsBk9UZNQo78r0YKLZeB8hPfwHd2KS7kcSXGr
 p1Uk7WcZuHlIEzpQ3D/Fb7GJyWKqbNoS98QEAE70eDaW82Yhhl6scVMzNczya2aaQARJ
 dMoWXBcnd+3jVAnKA0kXCNsJBC9+2ow2gbrwAfmbF8qrin+Kr5IH11LFvGxKY7YPj19+
 kvi+rot45Eo0xu2joGz7idSUsQdhIDEODeuuzT+YDF7mMUowTJyf7t5QjYKopArU8gvh
 HcyA==
X-Gm-Message-State: AOAM530Yr61kODscYa+5V2l7Hzkf1b4hT70Q3IOC8EoLRTpOOFkcmN/r
 aLWxAkUfoIfOQSBPyw+dFZCAFZbG380o7A==
X-Google-Smtp-Source: ABdhPJwY/ErwGhQkQf7b1ww54TPpYz6OH/yaLMhyzuXmDOlor1NQwOGOCXVBlW3bX2di8yCX3h4BMw==
X-Received: by 2002:a17:90a:1d4c:: with SMTP id
 u12mr19050420pju.95.1631990730360; 
 Sat, 18 Sep 2021 11:45:30 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y26sm9555858pfe.69.2021.09.18.11.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 11:45:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/41] accel/tcg: Split out adjust_signal_pc
Date: Sat, 18 Sep 2021 11:44:47 -0700
Message-Id: <20210918184527.408540-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918184527.408540-1-richard.henderson@linaro.org>
References: <20210918184527.408540-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
index 8fed542622..cef025d001 100644
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


