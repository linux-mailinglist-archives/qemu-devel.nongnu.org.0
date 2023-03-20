Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DE36C0E60
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 11:12:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peCTe-0003oA-9X; Mon, 20 Mar 2023 06:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1peCTT-0003l1-Ay
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 06:10:44 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1peCTQ-0000D0-KG
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 06:10:42 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d17so1322790wrb.11
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 03:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679307039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cva0ieax6jGML0EyVMQUzaX64BrxGUwBDv8qEmGoIEA=;
 b=W1EBjXTmsyQ37x5a7mBbECHtVYXX+LQD/AUAD+3j16GvogtHMZkvvcG0jZaUSJfZ9i
 Un0c7imkaCWXwlrh6ApK4efLcdt44CKRGwftcGRtXuE4TCpV11EZ9SfE6A1lBIOOoXNJ
 VBQsvMmxz/UJBAubJRRZIJ34MhVS0JT/Ce3v7OPWiQs29K27++75Bn4Ia605HjqSbJQX
 WSItGwEZhnYtMBo/k9/GLWJ2cDzv2etEIICTvVzV9fVNKs6UooJCxwZEmXnEN/5HU9ou
 2+bSyihk2JXqe0uz71VKMp/1uiMzQ6uTz9NY/sHTa8j7x5DP5DpgGP+8hT2BpQzAUwm/
 C8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679307039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cva0ieax6jGML0EyVMQUzaX64BrxGUwBDv8qEmGoIEA=;
 b=Lpb18FD6N6wrpRWJq59CzRxr8Y+n9vxknV5VNKbhQQiOrWbujloMsKtbpHr3Z8Pnk3
 UY2wutmIbOz8xnby9Z+CbN/Q5MIPPFl7gi3kmRtsJURO2DVHvnkEGopqf5yxRn4Ac2sW
 wRIrXQ/GaiplgX/uisaiZ4NHCGLQCMlnCEPhGseRs2jtatU+ex7sRRg6izyXHt1TJYdd
 jLrnrYGBt/xMkgusl9rCrFeu7GHiVdObBE1uXl8VrwGkwfFqWio3S0ztrfTVHU2/JGlP
 iQ0p9BAEZbDyDv4BnzVkfqnQExAF0DlussjB/sPoGWw5O1VDAi4PAd8Tsy5LcfOLm1Qz
 +pTQ==
X-Gm-Message-State: AO0yUKUfdSPosMYGbT8cHjYCtdsCkpeRk1TknNSW5FgZ1r+7rPBuZ0x4
 z3rUqvJ78msp4QT02S4hiD+dRA==
X-Google-Smtp-Source: AK7set+fcuyWJKnEZ7hgLBF+hJoP6BpHf/gl9ST4hMPmciSsMDbALl/+Xx7BikKtmZeZCncC/Ey5xA==
X-Received: by 2002:a5d:6207:0:b0:2cf:eeae:88c3 with SMTP id
 y7-20020a5d6207000000b002cfeeae88c3mr12799388wru.32.1679307039149; 
 Mon, 20 Mar 2023 03:10:39 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 v3-20020adfe4c3000000b002cf8220cc75sm604607wrm.24.2023.03.20.03.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 03:10:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C7D5A1FFC0;
 Mon, 20 Mar 2023 10:10:36 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alessandro Di Federico <ale@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 09/10] accel/tcg: re-inline the filtering of virtual IRQs but
 data driven
Date: Mon, 20 Mar 2023 10:10:34 +0000
Message-Id: <20230320101035.2214196-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320101035.2214196-1-alex.bennee@linaro.org>
References: <20230320101035.2214196-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Although only I386 currently uses it it is not inconceivable that
other arches might find this facility useful.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/core/tcg-cpu-ops.h |  5 +++++
 accel/tcg/cpu-exec.c          | 29 +++++++++--------------------
 target/i386/tcg/tcg-cpu.c     |  1 +
 3 files changed, 15 insertions(+), 20 deletions(-)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index 66c0cecdde..8e8df8c330 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -121,6 +121,11 @@ struct TCGCPUOps {
      */
     bool (*io_recompile_replay_branch)(CPUState *cpu,
                                        const TranslationBlock *tb);
+    /**
+     * @virtual_interrupts: IRQs that can be ignored for replay purposes
+     */
+    int virtual_interrupts;
+
 #else
     /**
      * record_sigsegv:
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 8fa19b7222..56be7956e7 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -737,22 +737,6 @@ static inline bool cpu_handle_exception(CPUState *cpu, int *ret)
     return false;
 }
 
-#ifndef CONFIG_USER_ONLY
-/*
- * CPU_INTERRUPT_POLL is a virtual event which gets converted into a
- * "real" interrupt event later. It does not need to be recorded for
- * replay purposes.
- */
-static inline bool need_replay_interrupt(int interrupt_request)
-{
-#if defined(TARGET_I386)
-    return !(interrupt_request & CPU_INTERRUPT_POLL);
-#else
-    return true;
-#endif
-}
-#endif /* !CONFIG_USER_ONLY */
-
 static inline bool cpu_handle_interrupt(CPUState *cpu,
                                         TranslationBlock **last_tb)
 {
@@ -808,11 +792,16 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
              * interrupt isn't processed, True when it is, and we should
              * restart on a new TB, and via longjmp via cpu_loop_exit.
              */
-            CPUClass *cc = CPU_GET_CLASS(cpu);
+            struct TCGCPUOps const *tcg_ops = cpu->cc->tcg_ops;
 
-            if (cc->tcg_ops->cpu_exec_interrupt &&
-                cc->tcg_ops->cpu_exec_interrupt(cpu, interrupt_request)) {
-                if (need_replay_interrupt(interrupt_request)) {
+            if (tcg_ops->cpu_exec_interrupt &&
+                tcg_ops->cpu_exec_interrupt(cpu, interrupt_request)) {
+                /*
+                 * Virtual events gets converted into a "real"
+                 * interrupt event later. They do not need to be
+                 * recorded for replay purposes.
+                 */
+                if (!(interrupt_request & tcg_ops->virtual_interrupts)) {
                     replay_interrupt();
                 }
                 /*
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index b942c306d6..750ae0f945 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -104,6 +104,7 @@ static const struct TCGCPUOps x86_tcg_ops = {
     .do_unaligned_access = x86_cpu_do_unaligned_access,
     .debug_excp_handler = breakpoint_handler,
     .debug_check_breakpoint = x86_debug_check_breakpoint,
+    .virtual_interrupts = CPU_INTERRUPT_POLL,
 #endif /* !CONFIG_USER_ONLY */
 };
 
-- 
2.39.2


