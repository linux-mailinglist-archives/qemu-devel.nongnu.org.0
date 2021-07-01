Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2523B93EA
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 17:27:43 +0200 (CEST)
Received: from localhost ([::1]:38324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyybL-0007Hr-3d
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 11:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyyZd-0004Q8-RO
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 11:25:54 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:38810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyyZT-0008A3-VH
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 11:25:51 -0400
Received: by mail-pg1-x531.google.com with SMTP id h4so6415067pgp.5
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 08:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i7Yv44S3soVKhBIR2nVe5GqBZQT4ofBHKeU6kY+QU8k=;
 b=ey5e9mycMNZxCgnId6p6mxPLm0GuUqM8fVAG2z6e1B/mdNm5/2SerTryPobih7msfi
 SyqZ6lrysWm41m56AJbgcyBdYP6d11BdKS4FJlZH1gq8HOgTHUIcJCogHt5JBD1qJoSh
 Zc1cKqq3910mPTXxpUB7Iw+Rl76Q3FE4hYilyK7Vte+B/3XioCrwwGvstp1cV+80XVZ2
 o1IcPUsrjVfyEcmoe4Htt+zDgei5LXG+T3LoGzWbFDBxLw3+4/Cqef1pdChsTofuXjPa
 Tdqb73hjQqYPYVD6y1VetxttNF7M/wQ0K9r+YROhM8oyH9tasYxyp3uM9yQxNo4uoQOk
 aYhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i7Yv44S3soVKhBIR2nVe5GqBZQT4ofBHKeU6kY+QU8k=;
 b=ewvUzBGndpwJJkuefLrCWgh945NF6Rh4kfqBKNSiTuQlL4/N+4K/dktp7maNvH3TQD
 XNS/fEEGcKlTON/dCsFy6OLDhVEQbJ8uK85GgRnFzbAvYXMWf7yOj+08XitJnBdYdxFX
 9Fw7tcH8Lh5FKDwgrdI8G9MMeBa6TNUwGx87cMdODNiNRbPYdmM63P0A9s5mKTEQjoYW
 j05EZarFv5shN6fyHdLzAASMHt3F6m57DHPSDUeWsn55OTzq5kU1qvCMqwdV1fm8xjRk
 I2xhzzxvisOC1oknawWrpoqhmoEwk6ysDqFjq+T7XfvM7wJ2ZAzMuhck7uS9jgf8K4ah
 2pGQ==
X-Gm-Message-State: AOAM532L/IF9qa6vlah4Bt4a9Ru46O0MD9GeY4pIQkffMWBlifvHCXQK
 LzniZyl+K9DQAPf4L1VMcPGrQFxLicg4XA==
X-Google-Smtp-Source: ABdhPJwtkij4MnVlVyu60PsWu/dlKPJMNP1Tg8McUf0J5iCnt1Pe44VXj2MAcdXxahM1mMD1j1KuSQ==
X-Received: by 2002:a62:e318:0:b029:30a:bdd:f979 with SMTP id
 g24-20020a62e3180000b029030a0bddf979mr282460pfh.8.1625153141096; 
 Thu, 01 Jul 2021 08:25:41 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j4sm10213197pjv.7.2021.07.01.08.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 08:25:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/17] accel/tcg: Split out log_cpu_exec
Date: Thu,  1 Jul 2021 08:25:24 -0700
Message-Id: <20210701152537.3330420-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210701152537.3330420-1-richard.henderson@linaro.org>
References: <20210701152537.3330420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split out CPU_LOG_EXEC and CPU_LOG_TB_CPU logging from
cpu_tb_exec to a new function.  Perform only one pc
range check after a combined mask check.

Use the new function in lookup_tb_ptr.  This enables
CPU_LOG_TB_CPU between indirectly chained tbs.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 61 ++++++++++++++++++++++++--------------------
 1 file changed, 34 insertions(+), 27 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 0d92698030..67ed25beb9 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -175,6 +175,36 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
     return tb;
 }
 
+static inline void log_cpu_exec(target_ulong pc, CPUState *cpu,
+                                const TranslationBlock *tb)
+{
+    if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_CPU | CPU_LOG_EXEC))
+        && qemu_log_in_addr_range(pc)) {
+
+        qemu_log_mask(CPU_LOG_EXEC,
+                      "Trace %d: %p [" TARGET_FMT_lx
+                      "/" TARGET_FMT_lx "/%#x] %s\n",
+                      cpu->cpu_index, tb->tc.ptr, tb->cs_base, pc, tb->flags,
+                      lookup_symbol(pc));
+
+#if defined(DEBUG_DISAS)
+        if (qemu_loglevel_mask(CPU_LOG_TB_CPU)) {
+            FILE *logfile = qemu_log_lock();
+            int flags = 0;
+
+            if (qemu_loglevel_mask(CPU_LOG_TB_FPU)) {
+                flags |= CPU_DUMP_FPU;
+            }
+#if defined(TARGET_I386)
+            flags |= CPU_DUMP_CCOP;
+#endif
+            log_cpu_state(cpu, flags);
+            qemu_log_unlock(logfile);
+        }
+#endif /* DEBUG_DISAS */
+    }
+}
+
 /**
  * helper_lookup_tb_ptr: quick check for next tb
  * @env: current cpu state
@@ -196,11 +226,9 @@ const void *HELPER(lookup_tb_ptr)(CPUArchState *env)
     if (tb == NULL) {
         return tcg_code_gen_epilogue;
     }
-    qemu_log_mask_and_addr(CPU_LOG_EXEC, pc,
-                           "Chain %d: %p ["
-                           TARGET_FMT_lx "/" TARGET_FMT_lx "/%#x] %s\n",
-                           cpu->cpu_index, tb->tc.ptr, cs_base, pc, flags,
-                           lookup_symbol(pc));
+
+    log_cpu_exec(pc, cpu, tb);
+
     return tb->tc.ptr;
 }
 
@@ -222,28 +250,7 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
     TranslationBlock *last_tb;
     const void *tb_ptr = itb->tc.ptr;
 
-    qemu_log_mask_and_addr(CPU_LOG_EXEC, itb->pc,
-                           "Trace %d: %p ["
-                           TARGET_FMT_lx "/" TARGET_FMT_lx "/%#x] %s\n",
-                           cpu->cpu_index, itb->tc.ptr,
-                           itb->cs_base, itb->pc, itb->flags,
-                           lookup_symbol(itb->pc));
-
-#if defined(DEBUG_DISAS)
-    if (qemu_loglevel_mask(CPU_LOG_TB_CPU)
-        && qemu_log_in_addr_range(itb->pc)) {
-        FILE *logfile = qemu_log_lock();
-        int flags = 0;
-        if (qemu_loglevel_mask(CPU_LOG_TB_FPU)) {
-            flags |= CPU_DUMP_FPU;
-        }
-#if defined(TARGET_I386)
-        flags |= CPU_DUMP_CCOP;
-#endif
-        log_cpu_state(cpu, flags);
-        qemu_log_unlock(logfile);
-    }
-#endif /* DEBUG_DISAS */
+    log_cpu_exec(itb->pc, cpu, itb);
 
     qemu_thread_jit_execute();
     ret = tcg_qemu_tb_exec(env, tb_ptr);
-- 
2.25.1


