Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C2A6AF7BB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:32:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZesE-0004k8-25; Tue, 07 Mar 2023 16:29:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZesB-0004im-Uf
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:29:27 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZes8-0000vs-OQ
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:29:27 -0500
Received: by mail-wr1-x42d.google.com with SMTP id j2so13507153wrh.9
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 13:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678224563;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LZeCHk68iWaLLkMw4vDpg7elkprCEF+0ZWj+B5JRkJo=;
 b=kGCWJAapuCGA5FxAfCq1o0K4gq+Q2VmR32uprwF8uota1mHg8GtGr6L7xP1zlLVkVS
 WXn4J1tdjXWTNqwCNsQhVMh0JS83R0xNE3iLFeFAvdxG1kCDo3tAMg3Pkgg9jmpoIVWp
 ppz1hx69/gPrw8cegktXxkCV30EI0KhsQtyoDJannXB3uKLPhkbpHD0b1gxPY/uGuPiF
 WJeA9GEez8p/0R0gbpQ+DGrZnc4dMqO4I8sxG9yie3MK+ckYEQe4TuSXaJ0X9G95DL9O
 yF5fFX0fBSCN+7WJV1cpadUaqPHLLTqajANliLPohxegWLPN2G/3GOdKdt6IdgGrlQCF
 OP1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678224563;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LZeCHk68iWaLLkMw4vDpg7elkprCEF+0ZWj+B5JRkJo=;
 b=tS5Vn1oJ1X7aO/RfwvWtILxVU9ouD/5YzVj3Q/iK9O7+te0upXeDhhcgYdldieWWZE
 57xs5uUKBHHN99SWweeIXLSWdDNLYZn/27Zze0bUIgyu/pYDNKvH/masOIppUTLGS6n0
 GnVrNpXwrV0jMJU/V6PoUubdc+97f50mi5ccEEXxOzkm+c5bqXJt/hz/4EzjKyg9ckDw
 Q3ZGjbs7VEMHuCv3kME8xwY3VWGesyNbrB98p9HQy4h3mrQ73EvxjYtIyFw9ph7dfc1v
 jJmVqFL/rzVLBHWBXlf8CSh8BpwxFJeQlHEES8eD4hmq5XX55Xt39ZtVTzNnuXVty5GM
 a5Pg==
X-Gm-Message-State: AO0yUKXauy3ElwuvQj25ZOKW0JehlatiB1/klnzkIN5VBw+sZAphaaEc
 QePWipRjhNRWkx5SEBNK2VrX6w==
X-Google-Smtp-Source: AK7set9JuB9QfyJ8Ro/ybfIU1KK1l1NnWYa5jbxHpZfmzl/fXGnwtxjEPurd6PGu4rMxLEL/d66ltQ==
X-Received: by 2002:a5d:4006:0:b0:2c7:1c36:3c67 with SMTP id
 n6-20020a5d4006000000b002c71c363c67mr9765058wrp.23.1678224563215; 
 Tue, 07 Mar 2023 13:29:23 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a5d500f000000b002c561805a4csm13562033wrt.45.2023.03.07.13.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 13:29:21 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EAAF71FFD1;
 Tue,  7 Mar 2023 21:21:42 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 25/30] gdbstub: split out softmmu/user specifics for syscall
 handling
Date: Tue,  7 Mar 2023 21:21:34 +0000
Message-Id: <20230307212139.883112-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307212139.883112-1-alex.bennee@linaro.org>
References: <20230307212139.883112-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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

Most of the syscall code is config agnostic aside from the size of
target_ulong. In preparation for the next patch move the final bits
of specialisation into the appropriate user and softmmu helpers.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230302190846.2593720-26-alex.bennee@linaro.org>
Message-Id: <20230303025805.625589-26-richard.henderson@linaro.org>

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
index 46537938d5..6189940005 100644
--- a/gdbstub/syscalls.c
+++ b/gdbstub/syscalls.c
@@ -105,9 +105,7 @@ void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va)
     }
 
     gdbserver_syscall_state.current_syscall_cb = cb;
-#ifndef CONFIG_USER_ONLY
-    vm_stop(RUN_STATE_DEBUG);
-#endif
+
     p = &gdbserver_syscall_state.syscall_buf[0];
     p_end = &gdbserver_syscall_state.syscall_buf[sizeof(gdbserver_syscall_state.syscall_buf)];
     *(p++) = 'F';
@@ -142,27 +140,8 @@ void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va)
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
2.39.2


