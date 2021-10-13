Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6FF42B2E8
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 04:52:42 +0200 (CEST)
Received: from localhost ([::1]:33292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maUNl-0001oS-Gi
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 22:52:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHY-00047b-Ql
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:16 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:40831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHV-0004iu-9V
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:16 -0400
Received: by mail-pg1-x536.google.com with SMTP id q5so880124pgr.7
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=67r73sMxmFAFlBR0ViNOs8odKIpwZUQrX4e2focSvME=;
 b=NQbkrqfs0egp/cKGs4184FmagjnKIjA+4rI0Wpp55mzG0OycYcQ76V2fStyNyhsm/Y
 CixQhytSUYd2axE9lxCx61G4k96vi064v3Fbg+nVjB1pbKgaQcvJ+LUpdiayXGZ8yJDW
 ToNa76tWTHnPwA3M0dtX7bJ34VLcpteznj92sQN1Y9tGZrDvnCB4yaYgsWAjqTGZZK6A
 op3y9daij33C62Y1DKecuyybVS0pUMkWPya+7BaFNqD9zdC0j1b3bSgyKUMYYMmVh+1J
 acjndy/nUznqAjcodELPaXfD3tnGmeNB5/MlSYkFptLGwghGqMeRvbS4O7DLR4FedxRZ
 Eckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=67r73sMxmFAFlBR0ViNOs8odKIpwZUQrX4e2focSvME=;
 b=WULtpRExxYS0GYBwhQekCAVN0fuKBdU1aY8DMFZy+w0O3IYBiW0w99UhmCc6AEDH3G
 h8TOQMRgFswTtqN8/7x4VikPPVTKAdW496XL8817tGOGJ8wnOQoGI0FvzHGCSXxzrEq1
 XrdftnLJ6BKLGT8H+695kbcSrCFq9fZgTS8IJsk06WkLqYDryD12rzCu9C2ZQvHW/kwD
 KRQ4tdvvV8yEQWfOy2qVfZFmT31SNYqLIw28W3gT9AfS/d7vA1fbFBJF4wF/765TnnZW
 2NLVpnQvEw2ONsOB+VDEJQY0j7KyoYj+SENotDIdY4XlektMtF0fUPB6MLZcsZns+8xJ
 eJrg==
X-Gm-Message-State: AOAM530x79RSZqnzDHKQGVr4ulNbTZ3kRDVoTbgPeIUzVM2bx9c/zMX3
 tjNcBd7CT7ZsAXW+4Oq6DlFkRO5eCZZ0hA==
X-Google-Smtp-Source: ABdhPJw6L0q20nZ4o4g3gFZBSQKH50n41ztMTSOf9/QZT6v40f5PIppG/UT90adEanp2NPfk5XhzXQ==
X-Received: by 2002:a63:d34f:: with SMTP id u15mr25585438pgi.200.1634093171930; 
 Tue, 12 Oct 2021 19:46:11 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id qe17sm4855014pjb.39.2021.10.12.19.46.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:46:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/48] linux-user: Add cpu_loop_exit_sigbus
Date: Tue, 12 Oct 2021 19:45:21 -0700
Message-Id: <20211013024607.731881-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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


