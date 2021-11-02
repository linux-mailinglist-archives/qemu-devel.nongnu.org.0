Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A20442CBF
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:37:20 +0100 (CET)
Received: from localhost ([::1]:45040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhs6S-0002Gy-0D
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:37:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrh7-0001C2-Up
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:11:09 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:43617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrh6-0001uQ-AV
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:11:09 -0400
Received: by mail-qk1-x731.google.com with SMTP id bp7so13985271qkb.10
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Ep7pHHg1zb1sPSHGpQ1/FF+Txy5JMnbD431/U5MPag=;
 b=MQMc9UQVF+oJp0CFP4SP5f5cysFZzMzv1FVu3vZPjgrJ94zLCmfnNcaYxwsaVMi4K0
 rRD0bZB1FODVLejNbFxgTqjHBJyz91O7uDY/GE1mQHfwn/ez4t6JQXWq9VVD7L/X+uQn
 UHLdh0NACzcdItTfq6ixdsx2Tb1eO05DvApWSsvbTxDbe51U2glnVoKkQLJg3p8qNtex
 0vPiT62/SZhJgm3B1mi3OT82672OU5TlNgY8Hzw2MAifpwFI1roWXGhW0Wn2oaevFRO+
 i5dt70jwEBbv0xsTU/+BbhIoE15F0x2CNq3a5m0WgsXHVKKtcJsH+tcNBUe1/HHXNZSe
 0V8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1Ep7pHHg1zb1sPSHGpQ1/FF+Txy5JMnbD431/U5MPag=;
 b=uL9l3UBD2ZLH1qECoA4TeCMCK+OVkp+rbCoU5OBkrqaK1YHYZddDTIHUY8iPfJtj8K
 /lzO9zP6+GeKaKjjp1HWNp64UrH2x6YDO22jgswTHzvemqp/f40XdIjMy0eYRb0H765/
 /lOtGJrrrTQmTUwi4G1kTk+no7fCjiM28lgzKRnVuhQSUCXfATcs1AvDrPmGmwqzXLWm
 MrTJxDorpYfEz98m2P9CFt4qfaCqiiCkVv/hwILzWGtB/awEw+CdQl5pSWnP6xT+JZN7
 QGgBNg9x1mGYP+kOYZLQp9DmIUAHtzxoBR1KyaMDOy1D3SrbY+xm7XD2ufG478tvok04
 93hQ==
X-Gm-Message-State: AOAM533p6xgeLisETsjnasHv90Xk5WDDbrLJF/otqQipgot+vmecAWkW
 nJ+MDD2w6oXBMx9uN7gDjbYR6KtYlulztw==
X-Google-Smtp-Source: ABdhPJwQ+EJbdKwZt+9xrrMYiEuR9yJSfSr1X9UeX/AJxcPsdd7c29uOo9qn3FVEQ4kwMTe9aOMz1w==
X-Received: by 2002:a37:2c86:: with SMTP id
 s128mr27348650qkh.516.1635851467423; 
 Tue, 02 Nov 2021 04:11:07 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm25sm12730854qkb.4.2021.11.02.04.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:11:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 43/60] linux-user: Add cpu_loop_exit_sigbus
Date: Tue,  2 Nov 2021 07:07:23 -0400
Message-Id: <20211102110740.215699-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x731.google.com
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


