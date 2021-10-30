Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8D6440B4F
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 20:39:36 +0200 (CEST)
Received: from localhost ([::1]:34192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgtGR-000637-Kc
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 14:39:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1n-0001SP-3i
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:25 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:41653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1h-00029L-LX
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:21 -0400
Received: by mail-pl1-x636.google.com with SMTP id z11so8912639plg.8
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Ep7pHHg1zb1sPSHGpQ1/FF+Txy5JMnbD431/U5MPag=;
 b=t5T8Q7bXCnjztyyeSXIMeTShRPqGze7C5CDko58XZl/h3aHchf+onWiIA2t75Hk1Jc
 dBB8gfQKH97Uzn7/ACDuHGpLETiauncVjVjoYe5z5XaeiVM+FZM82bE3LrGg45BcT3gL
 ZLJZVsU9ecaFdsowHkYHIwQuYijq9gni/v6MDzVabt4VpTOVo4dQ+qd2tAB5PsBbQVE8
 xxwYiInPR3T9wABxk6AMfvUMaWkj5Bpek4+dFInrjY2aJ1FAMBT3+2QZ8OYxMsQY30qQ
 INtGz3v4rxuTTbmc1390wj2P1KUAgUdS1+XiRN4KvRK6+KFIQByvQtlQ1h2TB0Hax3MF
 +oTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1Ep7pHHg1zb1sPSHGpQ1/FF+Txy5JMnbD431/U5MPag=;
 b=GXVQkTOVlQFnZz9nXGe2ceHIInq6CMMyqjMGej7F09jVMmKNb4AvipITZKt0P2F56d
 XXRUiwMfgP24f9fJOFD+1wnu0vekHNTlKr0I6IV8eM7vSGTCgid9ReoY/smZfhUYbbhS
 srs+X+LS/Qw5KhVBxFOBQbNEj/haHSIxGGpZHF3HwxTCAjS0RuiuxDgS8aw8xwHXPKhd
 YeS11SmiRbLw4Fwzgr0XrrWHEC/pj0ZHOxI4/8mvMX25IZyTymtBsPy1j2mgS+Dk//Ob
 DaH/ofqcVCdOkCMwQDYQwNfCzhlG9Pd9gzpXsorg4WlOzkbRmRVvruZWUl273pbgwPzF
 PS0Q==
X-Gm-Message-State: AOAM533TDY9fCBlAfu4KzXGkdAgiqTl3KWeYukogaQZsOipNU1Zqnips
 hP2ML9eQUuCX7ldAJDqUBvVy2VN6GCUmxw==
X-Google-Smtp-Source: ABdhPJzkqg/YL3aezG6E1cYJK5Oz/HZOOrNDuXp+9oADr3ONpYTS2TretgMR/qBbV74+Dw1q2vmVQg==
X-Received: by 2002:a17:902:7892:b0:141:b34e:d884 with SMTP id
 q18-20020a170902789200b00141b34ed884mr8734584pll.87.1635614416385; 
 Sat, 30 Oct 2021 10:20:16 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k14sm9584798pji.45.2021.10.30.10.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:20:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 43/66] linux-user: Add cpu_loop_exit_sigbus
Date: Sat, 30 Oct 2021 10:16:12 -0700
Message-Id: <20211030171635.1689530-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This is a new interface to be provided by the os emulator for
raising SIGBUS on fault.  Use the new record_sigbus target hook.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h | 14 ++++++++++++++
 linux-user/signal.c     | 14 ++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index f74578500c..6bb2a0f7ec 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -700,6 +700,20 @@ void QEMU_NORETURN cpu_loop_exit_sigsegv(CPUState *cpu, target_ulong addr,
                                          MMUAccessType access_type,
                                          bool maperr, uintptr_t ra);
 
+/**
+ * cpu_loop_exit_sigbus:
+ * @cpu: the cpu context
+ * @addr: the guest address of the alignment fault
+ * @access_type: access was read/write/execute
+ * @ra: host pc for unwinding
+ *
+ * Use the TCGCPUOps hook to record cpu state, do guest operating system
+ * specific things to raise SIGBUS, and jump to the main cpu loop.
+ */
+void QEMU_NORETURN cpu_loop_exit_sigbus(CPUState *cpu, target_ulong addr,
+                                        MMUAccessType access_type,
+                                        uintptr_t ra);
+
 #else
 static inline void mmap_lock(void) {}
 static inline void mmap_unlock(void) {}
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 9d60abc038..df2c8678d0 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -706,6 +706,20 @@ void cpu_loop_exit_sigsegv(CPUState *cpu, target_ulong addr,
     cpu_loop_exit_restore(cpu, ra);
 }
 
+void cpu_loop_exit_sigbus(CPUState *cpu, target_ulong addr,
+                          MMUAccessType access_type, uintptr_t ra)
+{
+    const struct TCGCPUOps *tcg_ops = CPU_GET_CLASS(cpu)->tcg_ops;
+
+    if (tcg_ops->record_sigbus) {
+        tcg_ops->record_sigbus(cpu, addr, access_type, ra);
+    }
+
+    force_sig_fault(TARGET_SIGBUS, TARGET_BUS_ADRALN, addr);
+    cpu->exception_index = EXCP_INTERRUPT;
+    cpu_loop_exit_restore(cpu, ra);
+}
+
 /* abort execution with signal */
 static void QEMU_NORETURN dump_core_and_abort(int target_sig)
 {
-- 
2.25.1


