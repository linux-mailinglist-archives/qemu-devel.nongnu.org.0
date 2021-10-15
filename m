Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E59842E7F8
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:41:19 +0200 (CEST)
Received: from localhost ([::1]:60896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbF1y-0003Jo-Nr
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:41:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEc5-0006Yt-N7
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:33 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:44017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEc4-0002mo-5K
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:33 -0400
Received: by mail-pl1-x635.google.com with SMTP id y1so5590553plk.10
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=67r73sMxmFAFlBR0ViNOs8odKIpwZUQrX4e2focSvME=;
 b=PDYhmQPC1wqr9JTz7mYBYfET4px6+8klt9olHF+41DAhgt7tLeUyyWOPba8RW7b4RB
 EIX89Lkfo+jZVUwe92XAnA6Mjesxyna20E1NBcWbTP9TSe4y7nuo6Zk7jGLE9mDPzwYO
 yj3SklMZb5O7RmFl1F0RhIoB+C0iXMwjviHr/zb68/7MkJco473o6iNCIaGkAGNl4I5a
 BoXhJvQ2frhpm9HuOdDEmle8fOqEyDqLP0LH3URDlxELuvd6L7nS7hUpvIxX4qZ+NxjS
 MLgRcCYAKHhVo+ggGmEEmMrkmI0b1vjtZOkQPU+MOLCsZbvqygDx1QzY/NiQ9A/cVf3t
 /M6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=67r73sMxmFAFlBR0ViNOs8odKIpwZUQrX4e2focSvME=;
 b=Z/p1ewz3L24+b3gHBaSVMt/WW5mNiTSPeRNLnYdCK9j0LaO7Z6DVGfMQfMfc1Z+XZM
 DSvehxNxxtC+oBuHIvdBKsjT54+CB58vw1QKAJc/fdbFyYXVBpPMD5vbwc7+VROX8V7M
 zG3s5otOVTS27+Ymf+U8vn/8eBYGOjczVjrRJOdEOBV0hzMOEP7uWVA4DXVR52nUBLPa
 XdKV4kHTFS98F7DuEvSPoepjv0vWJ+3NXcw3k9zDeWpdhIAj9aqB85o7y69x/dWRvvEP
 ibk9bYsRPmHvZ1dFGEFaPh++h0c5FAXwxagsQieVsBvRIy2EddLwnz4kQuH0/+0fAovj
 jhWg==
X-Gm-Message-State: AOAM530e4oXeNb4HREwQFqPxyJU6R+Q/dFK9JY+rjBO23m2Sk4/AjIr5
 2kEqbGLMLjgnkldN2lM7yT4feajoZVVTfA==
X-Google-Smtp-Source: ABdhPJzAM28XGjKxjkrghZfO9fcaPZ0uo2Es0pMWNrKCArcREgjLDe7nnQbboVtLalwFaxCWSLOiPw==
X-Received: by 2002:a17:90a:e7c8:: with SMTP id
 kb8mr10707601pjb.95.1634271270863; 
 Thu, 14 Oct 2021 21:14:30 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q8sm10236885pja.52.2021.10.14.21.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:14:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 44/67] linux-user: Add cpu_loop_exit_sigbus
Date: Thu, 14 Oct 2021 21:10:30 -0700
Message-Id: <20211015041053.2769193-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a new interface to be provided by the os emulator for
raising SIGBUS on fault.  Use the new record_sigbus target hook.

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


