Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E9D442C43
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:11:59 +0100 (CET)
Received: from localhost ([::1]:54382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhrhu-0001VZ-RY
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrdp-0003Zy-Fs
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:07:45 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:40653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrdn-0000r1-32
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:07:45 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id b11so9632152qvm.7
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IKLMeO+3mWomlul9GD0bgra/twuVZxh+Vxqn0acqDpE=;
 b=fdxqpc5SsTQqvN2m0uzkLW3aQ8kneUC7Qy2HbZre6aPCr0TiLcgPespn9CitWKh5id
 kALWIB5NoUze4eBVbC66CaC1UI6xECSSaYIlKPl8OG1zCEnBV3j6Aa++cfH6CNb4uRI2
 9YZ5H5ttByc8c8E51xkzOPRX0RA9eigl9533q9HRpioAPvNQ8XG9hJ04v3piHvsHaG9z
 YSokPctQn4GGBNP4q6jgyBWKwFP5dk0n4Fms3QyKo0tvborV4GrGXXbTblVQ1f6SCDBk
 nOF8A0ddIt2LcVuYktvhT3tiNZdVAcMR2kxHCVwdFQJMwHUPl3mZR9J337i8nGR8Fbq3
 dDUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IKLMeO+3mWomlul9GD0bgra/twuVZxh+Vxqn0acqDpE=;
 b=bYSjfOlcKFCrWTaQhgHmdw9fGtle0KZt11s6fVBtX3ZG5EI5K4L3tgECkRNYeZRNUy
 ubdjQFBjROgip0OfYNzq8LGOYcJvZ91jWKLP9G+IwX+rr3lNmJ4JkLEch3eCbRc5Sjwu
 NsVOWxagAVVb0VkWJcu+CJX9Ba7UC9C5eI367F43jtd2M7ReRponEdPVO1G8vqePa3mm
 brBIocFCB8ZDt/UC6QJXEQpRGRgds4g8H/WMp7E0e47HHLhn+IMZd6xIe36SkzIc6FCR
 dHywfT7Je8zGDvVABqT4LzxH+K07kzCrZznz5fRLVed2PlO9kodPnTd6lXzVebstY2cw
 suWg==
X-Gm-Message-State: AOAM530E5DhOkE+i4xOqyW4R4KF+2rAXpM65s/KLq1PiVzdqisqLqnk0
 nXi+S4AGbUGK/tx9S0xH1XfQXe3hmmwWGQ==
X-Google-Smtp-Source: ABdhPJzmLiXLZxRR3OXreqaLzDspxiFwvx8UQWKoNLiwymWkgE4HaeZw9kJT/XFPJdOXqhMF6Oq4Sw==
X-Received: by 2002:a05:6214:400e:: with SMTP id
 kd14mr12582204qvb.66.1635851261924; 
 Tue, 02 Nov 2021 04:07:41 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm7sm3568612qkb.86.2021.11.02.04.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:07:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/60] accel/tcg: Split out adjust_signal_pc
Date: Tue,  2 Nov 2021 07:06:41 -0400
Message-Id: <20211102110740.215699-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2c.google.com
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


