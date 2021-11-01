Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E564441FCA
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 19:07:33 +0100 (CET)
Received: from localhost ([::1]:37738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhbiW-0000nE-By
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 14:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb9B-0007ql-0d
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:31:01 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:38689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb97-0001Bc-97
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:31:00 -0400
Received: by mail-qk1-x72a.google.com with SMTP id bi29so17226598qkb.5
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Ep7pHHg1zb1sPSHGpQ1/FF+Txy5JMnbD431/U5MPag=;
 b=eLS85f51FkQhA4d5K4CglCP7g1P9dKHkau2QtyPOtAQUa87Uz3mAHr7xffSOfG59Wg
 TTUTwcryXcV4sqhoqNplo6ufIqYWtgiIeLiQDXIUMrzL6SH5cysnE1X+uaiChX2NiN4/
 Fwg2Jg1PZyZyCuOttAFISuYSG9ZV7egBS4ckSIaSvf2JVg/dEADBVBzWfATFFM96iKTD
 QE/V1cQQOjYIyAxCA8bZu/1ZXjYDwhMKuTo1UxzHLoK0NmsUQTEsZF3gzi5dR1r5qQRc
 co4fRv1/sV3J15cyEAmJOFaoHPApil7qRItb4GMk2TFiP6TQ13rXt/HP02E+iV7T4a8X
 Jf4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1Ep7pHHg1zb1sPSHGpQ1/FF+Txy5JMnbD431/U5MPag=;
 b=cmpoKeJ1CQNaympoqhEBf46xg/2wIoeqYb6jskXNJvSODc1KiMCTKj3hU2ZOLtZuIB
 tGmEruIFAXjgTxcmtzF0Zu4lXp1w9nXo1YXjIr43yZqJwz7sCZWzbmnUXm650H5krea5
 Piy368QjPGWV2oTX1JAbHfBJmB2v1EvqHp0TqLL1QEPiIeg+Ow+LZCk0Nw6s6Jr4PtqB
 Q/a408FWc01GpFkNgko9GoBALDo5j4X0GYwrt7Ov/N6431DKVBmc7ECcl9GIIYDjHhGv
 Rbv3kmPr3oJAbL6kHSXxoM6YtDnyW5SZjweCdVTvMX2csYtXSvFTziphzQr5pTax0nDe
 88mw==
X-Gm-Message-State: AOAM532dLTJrbV7/j7zqQlC0Ufrj5bAAeaquGvh5q85/xvX40O6UEVSQ
 1/KpzUvo1aDj3Jqqc2wYW6i13+HxAi+VDg==
X-Google-Smtp-Source: ABdhPJxJTFBd1U/flWN3IhrjrDYUY+iDbsFg/uXMvb1sHQYWiDwlBprmlaAzMVTErkgtUBRTBSmx9Q==
X-Received: by 2002:a37:4050:: with SMTP id n77mr23651706qka.267.1635787856357; 
 Mon, 01 Nov 2021 10:30:56 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id 13sm1222289qkc.40.2021.11.01.10.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:30:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 43/60] linux-user: Add cpu_loop_exit_sigbus
Date: Mon,  1 Nov 2021 13:27:12 -0400
Message-Id: <20211101172729.23149-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72a.google.com
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


