Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E476A895D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 20:17:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXoNz-00072T-Gh; Thu, 02 Mar 2023 14:14:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXoNv-0006qj-Js
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 14:14:35 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXoNo-0000nR-Cw
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 14:14:35 -0500
Received: by mail-wr1-x42b.google.com with SMTP id bx12so122286wrb.11
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 11:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KZ1bzurdoC+jowRyfZk2dA2rPNkKxibvGc1imFmhxks=;
 b=iiyS5GMcA7ksWgSh+I6plVtuEIoHFQ45VTTszckDYqHLaDajTxYx/sX1Rvfxhy69YG
 SAVS4/Kz4ggxsyxJuBu++OU6bnNYPQoDGeGVxXu2dawFC0KpWt+2gKdMb2NPmYiTvTPI
 5xzWhVn/ZdC2waLe67u6QYICfXz6YMZ8mROwKmFfyLoFWNUQCXW23788s8mmgoXev51L
 iMKsdeZ6qGP720vAIx/P4B68YxCvgvkt/FQFG+4GLunKZ2frwmsInKsVWeKuHYl8nHSp
 WvtdfztrP6FJf1hEjmFfV1J9gjnqmATd9f45fdlo4h01KmX/aQS+uSWvpAJ/Dj+7Y4Pg
 lvVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KZ1bzurdoC+jowRyfZk2dA2rPNkKxibvGc1imFmhxks=;
 b=UzVI14yDOeXJkZUIAQm1+4KrWVdl3KE+P5yFA+gmu98OUjG0vd8yDcVbxHgvJElHa6
 PG94I2KlqY9yBIewqGi4Yw70CuFAEhN7Gky2yptBaEE+6zrZw3escrL552WpHJpq6m04
 fORYTB6pqBM/HGScI7mov9uwlC12d98MUQ3wmjuHcF6D+FnutFzvbDRI87tWVmPSU0pA
 EnjiUivk7zSVFHNzNG0VdRE1c3KF/noeXXAtNXlbI0udzrvdn/o30YJnoL2JkDKdlkey
 Dnw0Z7XNk5YBcITRzVPBCbOv3cauY21p8bMFgwAZ25z5drgxrcc0AkmPDUApSvBwlDMo
 GUgA==
X-Gm-Message-State: AO0yUKXL7RmP0As1VKpoDLn6VH18Nkt/svqh5R7ZODfMHkJX9vVMSHoC
 r/cL1Newg0S25007aPfRiOt3EA==
X-Google-Smtp-Source: AK7set9DSU6r1TNemmP4mTn0dJ3ZetGzBqAQsEAxD7m0DxYYbeyuBlVmdAoq0rTaYFCFGc1P0pdZrQ==
X-Received: by 2002:adf:ef0c:0:b0:2c7:d56:777b with SMTP id
 e12-20020adfef0c000000b002c70d56777bmr8047214wro.64.1677784464789; 
 Thu, 02 Mar 2023 11:14:24 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a5d4312000000b002c7107ce17fsm186010wrq.3.2023.03.02.11.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 11:14:23 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 80B491FFCA;
 Thu,  2 Mar 2023 19:08:50 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Weiwei Li <liweiwei@iscas.ac.cn>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Laurent Vivier <laurent@vivier.eu>,
 nicolas.eder@lauterbach.com, Ilya Leoshkevich <iii@linux.ibm.com>,
 kvm@vger.kernel.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, qemu-s390x@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Bin Meng <bin.meng@windriver.com>,
 Marek Vasut <marex@denx.de>, Greg Kurz <groug@kaod.org>,
 Song Gao <gaosong@loongson.cn>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Chris Wulff <crwulff@gmail.com>, qemu-riscv@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 mads@ynddal.dk, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-ppc@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 John Snow <jsnow@redhat.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yanan Wang <wangyanan55@huawei.com>, David Hildenbrand <david@redhat.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 25/26] gdbstub: split out softmmu/user specifics for
 syscall handling
Date: Thu,  2 Mar 2023 19:08:45 +0000
Message-Id: <20230302190846.2593720-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302190846.2593720-1-alex.bennee@linaro.org>
References: <20230302190846.2593720-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
target_ulong. In preparation for the next patch move the final bits of
specialisation into the appropriate user and softmmu helpers.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v4
  - checkpatch cleanups
---
 gdbstub/internals.h |  5 +++++
 gdbstub/softmmu.c   | 24 ++++++++++++++++++++++++
 gdbstub/syscalls.c  | 35 +++++++++++------------------------
 gdbstub/user.c      | 24 ++++++++++++++++++++++++
 4 files changed, 64 insertions(+), 24 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index 8db61f7fb4..65d75d9435 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -195,6 +195,11 @@ bool gdb_handled_syscall(void);
 void gdb_disable_syscalls(void);
 void gdb_syscall_reset(void);
 
+/* user/softmmu specific signal handling */
+void gdb_pre_syscall_handling(void);
+bool gdb_send_syscall_now(void);
+void gdb_post_syscall_handling(void);
+
 /*
  * Break/Watch point support - there is an implementation for softmmu
  * and user mode.
diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index d3152fb6e7..02f3b41095 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -103,6 +103,30 @@ static void gdb_chr_event(void *opaque, QEMUChrEvent event)
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
+
+void gdb_pre_syscall_handling(void)
+{
+    vm_stop(RUN_STATE_DEBUG);
+}
+
+bool gdb_send_syscall_now(void)
+{
+    return false;
+}
+
+void gdb_post_syscall_handling(void)
+{
+    qemu_cpu_kick(gdbserver_state.c_cpu);
+}
+
 static void gdb_vm_state_change(void *opaque, bool running, RunState state)
 {
     CPUState *cpu = gdbserver_state.c_cpu;
diff --git a/gdbstub/syscalls.c b/gdbstub/syscalls.c
index f15b210958..1ca3d81305 100644
--- a/gdbstub/syscalls.c
+++ b/gdbstub/syscalls.c
@@ -104,9 +104,10 @@ void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va)
     }
 
     gdbserver_syscall_state.current_syscall_cb = cb;
-#ifndef CONFIG_USER_ONLY
-    vm_stop(RUN_STATE_DEBUG);
-#endif
+
+    /* user/softmmu specific handling */
+    gdb_pre_syscall_handling();
+
     p = &gdbserver_syscall_state.syscall_buf[0];
     p_end = &gdbserver_syscall_state.syscall_buf[sizeof(gdbserver_syscall_state.syscall_buf)];
     *(p++) = 'F';
@@ -141,27 +142,13 @@ void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va)
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
+    if (gdb_send_syscall_now()) { /* true only for *-user */
+        gdb_put_packet(gdbserver_syscall_state.syscall_buf);
+    }
+
+    /* user/softmmu specific handling */
+    gdb_post_syscall_handling();
 }
 
 void gdb_do_syscall(gdb_syscall_complete_cb cb, const char *fmt, ...)
diff --git a/gdbstub/user.c b/gdbstub/user.c
index 3da410e221..583cc83898 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -472,3 +472,27 @@ void gdb_breakpoint_remove_all(CPUState *cs)
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
+
+void gdb_pre_syscall_handling(void)
+{
+    return;
+}
+
+bool gdb_send_syscall_now(void)
+{
+    return true;
+}
+
+void gdb_post_syscall_handling(void)
+{
+    gdb_handlesig(gdbserver_state.c_cpu, 0);
+}
-- 
2.39.2


