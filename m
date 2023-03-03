Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C69A36A8F7B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 03:59:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXvcw-0007co-3p; Thu, 02 Mar 2023 21:58:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvct-0007bf-Ld
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:31 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvcr-0001ti-Gs
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:31 -0500
Received: by mail-pl1-x631.google.com with SMTP id i5so1367106pla.2
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 18:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677812308;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6d5cuY6swY8U6e//2djcuW9/WFKA+am2NtOsQtC3Xo4=;
 b=hHYpkzksNrat8BA3PYARXUxXH1R2SflMSwePo8EImrDoYFC7kji1Qrr1s5RiiWlLdP
 0PiomXrDunwVCrl1ueWvL+gIDpG6WeA0NHhPyihQZGXfCw/rYojzwc+NlVq7M7nU3wUM
 R4gOAPS3cYatrV5f87UDnVDmKmM/r6EOb+TMDd5s2GkN/bcR+k1q1knLcieuhJX0JXFS
 fbearFxrPbv7clLpMxxFocpflLxxQaBdNQhLvHv7jDCwgdjTJtTrRMR+5jjGb1AuIbQv
 GxqpdyadPNuGmK9L3RVyPdkMNGbFFuT8WgF6Ckb8KwwzfpUUsCUou6A4Z3B32mSDwGxq
 ALPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677812308;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6d5cuY6swY8U6e//2djcuW9/WFKA+am2NtOsQtC3Xo4=;
 b=c2NZ66fNXHZvjx7duhqEKY1qLRKQ2qtqpJItDO+15t+jbhrLYrodBhTQl33EZOvnG4
 Is+pW89l+dsIRTwvzypaivUEuvYcgLmUqo3qRXjKSIOB+qsOLMWrofS3MhtYk5q2lRs/
 aaESDAnZCpw9C0fUzOFwcRDN35OQvmuTZwR8v//WO/cp20BHowflaBP3z/RogjO6yiWC
 LEUhLo8Xh7lZi0rFnFx8UX6h1nKRLtQhGo8LrE/onXqRgoK8XZrkD7IcnWjX3lACj5kR
 DeLEl1pgz4zyA2JmyU3pI17boKA64cTvsI09RA/7qayNXaLsuEu87paEvVTtTAD9hDvf
 JyZA==
X-Gm-Message-State: AO0yUKV7tbF9oqWq4kUNpzpVwsJR1uHJ1HJ2YzRw/RZMbPgm7O8lEUoL
 3qWIKRHJf4TCY+AueZ1EVdX9cln+xTalILSg+Jo=
X-Google-Smtp-Source: AK7set/0SYfzKFP6O2Br6mI7iBNZfVsZc2EXbK6etfa5w7oaW1B9KUff7WM2wVHuKbx7Z2F5Dc6CSw==
X-Received: by 2002:a17:902:8bcb:b0:19e:664e:fcaf with SMTP id
 r11-20020a1709028bcb00b0019e664efcafmr546260plo.0.1677812308062; 
 Thu, 02 Mar 2023 18:58:28 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a17090301c400b001992e74d055sm372244plh.12.2023.03.02.18.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 18:58:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH v4.5 25/29] gdbstub: split out softmmu/user specifics for
 syscall handling
Date: Thu,  2 Mar 2023 18:58:01 -0800
Message-Id: <20230303025805.625589-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303025805.625589-1-richard.henderson@linaro.org>
References: <20230303025805.625589-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

From: Alex Bennée <alex.bennee@linaro.org>

Most of the syscall code is config agnostic aside from the size of
target_ulong. In preparation for the next patch move the final bits
of specialisation into the appropriate user and softmmu helpers.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230302190846.2593720-26-alex.bennee@linaro.org>
---
 gdbstub/internals.h |  3 +++
 gdbstub/softmmu.c   | 14 ++++++++++++++
 gdbstub/syscalls.c  | 27 +++------------------------
 gdbstub/user.c      | 14 ++++++++++++++
 4 files changed, 34 insertions(+), 24 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index 8db61f7fb4..94ddff4495 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -195,6 +195,9 @@ bool gdb_handled_syscall(void);
 void gdb_disable_syscalls(void);
 void gdb_syscall_reset(void);
 
+/* user/softmmu specific syscall handling */
+void gdb_syscall_handling(const char *syscall_packet);
+
 /*
  * Break/Watch point support - there is an implementation for softmmu
  * and user mode.
diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index d3152fb6e7..22ecd09d04 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -103,6 +103,20 @@ static void gdb_chr_event(void *opaque, QEMUChrEvent event)
     }
 }
 
+/*
+ * In softmmu mode we stop the VM and wait to send the syscall packet
+ * until notification that the CPU has stopped. This must be done
+ * because if the packet is sent now the reply from the syscall
+ * request could be received while the CPU is still in the running
+ * state, which can cause packets to be dropped and state transition
+ * 'T' packets to be sent while the syscall is still being processed.
+ */
+void gdb_syscall_handling(const char *syscall_packet)
+{
+    vm_stop(RUN_STATE_DEBUG);
+    qemu_cpu_kick(gdbserver_state.c_cpu);
+}
+
 static void gdb_vm_state_change(void *opaque, bool running, RunState state)
 {
     CPUState *cpu = gdbserver_state.c_cpu;
diff --git a/gdbstub/syscalls.c b/gdbstub/syscalls.c
index f15b210958..0a48f58d70 100644
--- a/gdbstub/syscalls.c
+++ b/gdbstub/syscalls.c
@@ -104,9 +104,7 @@ void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va)
     }
 
     gdbserver_syscall_state.current_syscall_cb = cb;
-#ifndef CONFIG_USER_ONLY
-    vm_stop(RUN_STATE_DEBUG);
-#endif
+
     p = &gdbserver_syscall_state.syscall_buf[0];
     p_end = &gdbserver_syscall_state.syscall_buf[sizeof(gdbserver_syscall_state.syscall_buf)];
     *(p++) = 'F';
@@ -141,27 +139,8 @@ void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va)
         }
     }
     *p = 0;
-#ifdef CONFIG_USER_ONLY
-    gdb_put_packet(gdbserver_syscall_state.syscall_buf);
-    /*
-     * Return control to gdb for it to process the syscall request.
-     * Since the protocol requires that gdb hands control back to us
-     * using a "here are the results" F packet, we don't need to check
-     * gdb_handlesig's return value (which is the signal to deliver if
-     * execution was resumed via a continue packet).
-     */
-    gdb_handlesig(gdbserver_state.c_cpu, 0);
-#else
-    /*
-     * In this case wait to send the syscall packet until notification that
-     * the CPU has stopped.  This must be done because if the packet is sent
-     * now the reply from the syscall request could be received while the CPU
-     * is still in the running state, which can cause packets to be dropped
-     * and state transition 'T' packets to be sent while the syscall is still
-     * being processed.
-     */
-    qemu_cpu_kick(gdbserver_state.c_cpu);
-#endif
+
+    gdb_syscall_handling(gdbserver_syscall_state.syscall_buf);
 }
 
 void gdb_do_syscall(gdb_syscall_complete_cb cb, const char *fmt, ...)
diff --git a/gdbstub/user.c b/gdbstub/user.c
index 3da410e221..80488b6bb9 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -472,3 +472,17 @@ void gdb_breakpoint_remove_all(CPUState *cs)
 {
     cpu_breakpoint_remove_all(cs, BP_GDB);
 }
+
+/*
+ * For user-mode syscall support we send the system call immediately
+ * and then return control to gdb for it to process the syscall request.
+ * Since the protocol requires that gdb hands control back to us
+ * using a "here are the results" F packet, we don't need to check
+ * gdb_handlesig's return value (which is the signal to deliver if
+ * execution was resumed via a continue packet).
+ */
+void gdb_syscall_handling(const char *syscall_packet)
+{
+    gdb_put_packet(syscall_packet);
+    gdb_handlesig(gdbserver_state.c_cpu, 0);
+}
-- 
2.34.1


