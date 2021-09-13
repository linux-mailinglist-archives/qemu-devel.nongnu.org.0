Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF10409F86
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 00:15:31 +0200 (CEST)
Received: from localhost ([::1]:40416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPuEc-0006mU-Oc
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 18:15:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPu5Q-0001os-HP
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 18:06:01 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:34712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPu5N-0007MR-H2
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 18:05:59 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 on12-20020a17090b1d0c00b001997c60aa29so770088pjb.1
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 15:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HOihbZxbdSpTNEi6dYGIvfhNa3VVAsIH5ySEcJN4hRo=;
 b=ZLnxGjAtCr/fEBkb0eK+iwTmRE7XPQui9grmT2r+gAv7yrTB+p1QVAwcbh4TBTwSRW
 A+kvxnl4NF6qZOsftRoMA5/bd9VCkbXWQn0wokS9EUmKur2gKuMorKaWweay+YLw1+cP
 VjIaVuwnyEqzx/590boigjO24aolmHobmhdBobskh/4JPQ93MEVfGeWqWIj5tNCjgD5Y
 jUXG593olEJmZyrR20sRt5ayxGwtHPdv4V/zEN9wZPi4FqZnlXF5U/cl7vUV3kmen1sg
 8yz7ZXbcyaChT9uXP7MJ+DG7uUA85d/YP/GG6kN6/w6fKE0sUBEGRK4A30RiyjJx9dCQ
 T3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HOihbZxbdSpTNEi6dYGIvfhNa3VVAsIH5ySEcJN4hRo=;
 b=E3kOOFY6QAsAKK/eMHgxc8BuYotCn9uDwpeobViaPN6ATMbCyGx+4B3V2KABNB5GVY
 CULHC3iLyPTQIKHoQ+qnMRBL8Q59ppTsyif1zvmPLHmRc9V21sMfQVwjoJ7Sfww5yXv1
 9F+8g6YR+MT8I8GPzPlC48TVxYu3mmpLsf4BG8/rQk7N7tZxR27WQTj3ul0sBwZkbVSm
 8mk9/DliShzRHeJWr4EZt9lSpnZNAi5O6ay2TcnpklTyfD+I9z8UsyZC4DqlcmGmc47L
 Y+CT/q6xGvcJZZ0OUcwwcAhC9AMj7AY/SC4+a2B/juTF6+Kf+gJlwHP6znYfYVCZPvFK
 dnCg==
X-Gm-Message-State: AOAM533nRfu3khF7UtLTx2ogv2YVd67fcvhtNAxR7pvkHcH2qbQzEKu7
 Q7Me5HUhyH3Io7WSjcN4covlcrs4Zxafdg==
X-Google-Smtp-Source: ABdhPJyyYkOQv0Iu3Ijbd6KXxfZC36lT0J8vCqUa8nEBv3a83gSyFSvSSa3ZQPAWPIRLcm5y2zkr8w==
X-Received: by 2002:a17:902:d114:b0:13a:4dec:d590 with SMTP id
 w20-20020a170902d11400b0013a4decd590mr12350306plw.76.1631570756083; 
 Mon, 13 Sep 2021 15:05:56 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 17sm7721404pfx.167.2021.09.13.15.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 15:05:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 2/7] accel/tcg: Split out adjust_signal_pc
Date: Mon, 13 Sep 2021 15:05:47 -0700
Message-Id: <20210913220552.604064-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913220552.604064-1-richard.henderson@linaro.org>
References: <20210913220552.604064-1-richard.henderson@linaro.org>
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split out a function to adjust the raw signal pc into a
value that could be passed to cpu_restore_state.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h |  8 +++++++
 accel/tcg/user-exec.c   | 50 ++++++++++++++++++++++++++---------------
 2 files changed, 40 insertions(+), 18 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 9d5987ba04..7207912306 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -663,6 +663,14 @@ static inline tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env,
     return addr;
 }
 
+/**
+ * adjust_signal_pc:
+ * @pc: raw pc from the host signal ucontext_t.
+ *
+ * Return the pc to pass to cpu_restore_state.
+ */
+uintptr_t adjust_signal_pc(uintptr_t pc);
+
 /**
  * cpu_signal_handler
  * @signum: host signal number
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 8fed542622..1f7b7a3692 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -57,18 +57,14 @@ static void QEMU_NORETURN cpu_exit_tb_from_sighandler(CPUState *cpu,
     cpu_loop_exit_noexc(cpu);
 }
 
-/* 'pc' is the host PC at which the exception was raised. 'address' is
-   the effective address of the memory exception. 'is_write' is 1 if a
-   write caused the exception and otherwise 0'. 'old_set' is the
-   signal set which should be restored */
-static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
-                                    int is_write, sigset_t *old_set)
+/**
+ * adjust_signal_pc:
+ * @pc: raw pc from the host signal ucontext_t.
+ *
+ * Return the pc to pass to cpu_restore_state.
+ */
+uintptr_t adjust_signal_pc(uintptr_t pc)
 {
-    CPUState *cpu = current_cpu;
-    CPUClass *cc;
-    unsigned long address = (unsigned long)info->si_addr;
-    MMUAccessType access_type = is_write ? MMU_DATA_STORE : MMU_DATA_LOAD;
-
     switch (helper_retaddr) {
     default:
         /*
@@ -77,8 +73,7 @@ static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
          * pointer into the generated code that will unwind to the
          * correct guest pc.
          */
-        pc = helper_retaddr;
-        break;
+        return helper_retaddr;
 
     case 0:
         /*
@@ -97,8 +92,7 @@ static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
          * Therefore, adjust to compensate for what will be done later
          * by cpu_restore_state_from_tb.
          */
-        pc += GETPC_ADJ;
-        break;
+        return pc + GETPC_ADJ;
 
     case 1:
         /*
@@ -113,11 +107,31 @@ static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
          *
          * Like tb_gen_code, release the memory lock before cpu_loop_exit.
          */
-        pc = 0;
-        access_type = MMU_INST_FETCH;
         mmap_unlock();
-        break;
+        return 0;
     }
+}
+
+/* 'pc' is the host PC at which the exception was raised. 'address' is
+   the effective address of the memory exception. 'is_write' is 1 if a
+   write caused the exception and otherwise 0'. 'old_set' is the
+   signal set which should be restored */
+static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
+                                    int is_write, sigset_t *old_set)
+{
+    CPUState *cpu = current_cpu;
+    CPUClass *cc;
+    unsigned long address = (unsigned long)info->si_addr;
+    MMUAccessType access_type;
+
+    if (is_write) {
+        access_type = MMU_DATA_STORE;
+    } else if (helper_retaddr == 1) {
+        access_type = MMU_INST_FETCH;
+    } else {
+        access_type = MMU_DATA_LOAD;
+    }
+    pc = adjust_signal_pc(pc);
 
     /* For synchronous signals we expect to be coming from the vCPU
      * thread (so current_cpu should be valid) and either from running
-- 
2.25.1


