Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D17CC47FE0A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Dec 2021 16:03:53 +0100 (CET)
Received: from localhost ([::1]:55196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1rXU-0008L1-GA
	for lists+qemu-devel@lfdr.de; Mon, 27 Dec 2021 10:03:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n1rVF-0005gO-Uo
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 10:01:33 -0500
Received: from [2607:f8b0:4864:20::42c] (port=43577
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n1rVD-0000lE-M7
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 10:01:33 -0500
Received: by mail-pf1-x42c.google.com with SMTP id 196so13849518pfw.10
 for <qemu-devel@nongnu.org>; Mon, 27 Dec 2021 07:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yP/kb34Ziz8gNeF1s6OUVtEmlihcmFFw3he3QQHc/vU=;
 b=e61cg2+aapaaj+tartRozLdRRgczJHjzWFzsbmjmQNnfNenj6GxSr0uF6S5fZ9TuQG
 n2plxq9RmqxRA1Wptp0TEdagm7qrsnt2UzWD1CGvC5xj1ErZYlRgikpz5uZ9YaUXwwTd
 izBgFSiuvbWZ8PJy0o9N/O4ziwekbcPPh5cTRfV4C4YBLBTrGI2VtwAWQG+l26jlbBIo
 IMIbXN966UheqqvV3+pm0NqQD+Tmemuqel/cMTeuSBRy6FYcECl8rxfpAhWicHUFMrN5
 aJQcWsklHfQVc2G/XgNIDsDbSAFzT5DHaX3n199bPgnqKk6DyDFKVYQ72vlUuQZTfEco
 gXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yP/kb34Ziz8gNeF1s6OUVtEmlihcmFFw3he3QQHc/vU=;
 b=UU59vTfZF6XWvo3bvglSJTHZ292b+R0YXAVbDY5Um7vV0kxQGmRoWORauMfxjyltFe
 ISE/g0qDMKgV63LHl8jLKBe6iGVseGNVwcEJqpng5lxt/BiJRT3gvXx8GdsfdsG0Doq4
 02+IOP7KcUWRfTlgLr3lEwE1hexmJLguHl2pEvsbtVCRVes0Y+I6FcqJoe4Jbfpnqy4v
 pN8I2zMD46GfRnhnmgopgeXfXWFOlQFAKtaC3TjQk5tw8ShJ3UB+MeBQmUuKueMcvxm9
 PafY+0KJQxu2V4n6M8sS0Wq0445kT+ewgb2AWIvzyqqMUjr0dgUdMMvJp7t9aTqHNAwy
 cdtw==
X-Gm-Message-State: AOAM531CrvQNj2BxLEDbvedPGJ5tCVgI57BjlUygLaE6x61hjTpcOD92
 LkHPIj/Y02GQ6P6CMJ1Pa2DdxBUxS25ITg==
X-Google-Smtp-Source: ABdhPJycY90uzWt+zdS+N3y0d/J3Ybi1CYRXduneGQal9+fsHcvYVY1KmW6CSyDMUY0MZOusDNr8NA==
X-Received: by 2002:a63:5f57:: with SMTP id t84mr15842702pgb.192.1640617290351; 
 Mon, 27 Dec 2021 07:01:30 -0800 (PST)
Received: from localhost.localdomain (76-14-210-194.or.wavecable.com.
 [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id m13sm14756743pgt.22.2021.12.27.07.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 07:01:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/6] linux-user: Add code for PR_GET/SET_UNALIGN
Date: Mon, 27 Dec 2021 07:01:24 -0800
Message-Id: <20211227150127.2659293-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211227150127.2659293-1-richard.henderson@linaro.org>
References: <20211227150127.2659293-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This requires extra work for each target, but adds the
common syscall code, and the necessary flag in CPUState.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h                     |  3 +++
 linux-user/generic/target_prctl_unalign.h | 27 +++++++++++++++++++++++
 cpu.c                                     | 20 ++++++++++++-----
 linux-user/syscall.c                      | 13 +++++++++--
 4 files changed, 56 insertions(+), 7 deletions(-)
 create mode 100644 linux-user/generic/target_prctl_unalign.h

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index e948e81f1a..76ab3b851c 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -413,6 +413,9 @@ struct CPUState {
 
     bool ignore_memory_transaction_failures;
 
+    /* Used for user-only emulation of prctl(PR_SET_UNALIGN). */
+    bool prctl_unalign_sigbus;
+
     struct hax_vcpu_state *hax_vcpu;
 
     struct hvf_vcpu_state *hvf;
diff --git a/linux-user/generic/target_prctl_unalign.h b/linux-user/generic/target_prctl_unalign.h
new file mode 100644
index 0000000000..bc3b83af2a
--- /dev/null
+++ b/linux-user/generic/target_prctl_unalign.h
@@ -0,0 +1,27 @@
+/*
+ * Generic prctl unalign functions for linux-user
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef GENERIC_TARGET_PRCTL_UNALIGN_H
+#define GENERIC_TARGET_PRCTL_UNALIGN_H
+
+static abi_long do_prctl_get_unalign(CPUArchState *env, target_long arg2)
+{
+    CPUState *cs = env_cpu(env);
+    uint32_t res = PR_UNALIGN_NOPRINT;
+    if (cs->prctl_unalign_sigbus) {
+        res |= PR_UNALIGN_SIGBUS;
+    }
+    return put_user_u32(res, arg2);
+}
+#define do_prctl_get_unalign do_prctl_get_unalign
+
+static abi_long do_prctl_set_unalign(CPUArchState *env, target_long arg2)
+{
+    env_cpu(env)->prctl_unalign_sigbus = arg2 & PR_UNALIGN_SIGBUS;
+    return 0;
+}
+#define do_prctl_set_unalign do_prctl_set_unalign
+
+#endif /* GENERIC_TARGET_PRCTL_UNALIGN_H */
diff --git a/cpu.c b/cpu.c
index 945dd3dded..016bf06a1a 100644
--- a/cpu.c
+++ b/cpu.c
@@ -174,13 +174,23 @@ void cpu_exec_unrealizefn(CPUState *cpu)
     cpu_list_remove(cpu);
 }
 
+/*
+ * This can't go in hw/core/cpu.c because that file is compiled only
+ * once for both user-mode and system builds.
+ */
 static Property cpu_common_props[] = {
-#ifndef CONFIG_USER_ONLY
+#ifdef CONFIG_USER_ONLY
     /*
-     * Create a memory property for softmmu CPU object,
-     * so users can wire up its memory. (This can't go in hw/core/cpu.c
-     * because that file is compiled only once for both user-mode
-     * and system builds.) The default if no link is set up is to use
+     * Create a property for the user-only object, so users can
+     * adjust prctl(PR_SET_UNALIGN) from the command-line.
+     * Has no effect if the target does not support the feature.
+     */
+    DEFINE_PROP_BOOL("prctl-unalign-sigbus", CPUState,
+                     prctl_unalign_sigbus, false),
+#else
+    /*
+     * Create a memory property for softmmu CPU object, so users can
+     * wire up its memory.  The default if no link is set up is to use
      * the system address space.
      */
     DEFINE_PROP_LINK("memory", CPUState, memory, TYPE_MEMORY_REGION,
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index d868ef2910..b5112891b0 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6378,6 +6378,12 @@ static abi_long do_prctl_inval1(CPUArchState *env, abi_long arg2)
 #ifndef do_prctl_get_tagged_addr_ctrl
 #define do_prctl_get_tagged_addr_ctrl do_prctl_inval0
 #endif
+#ifndef do_prctl_get_unalign
+#define do_prctl_get_unalign do_prctl_inval1
+#endif
+#ifndef do_prctl_set_unalign
+#define do_prctl_set_unalign do_prctl_inval1
+#endif
 
 static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
                          abi_long arg3, abi_long arg4, abi_long arg5)
@@ -6441,6 +6447,11 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
         }
         return do_prctl_get_tagged_addr_ctrl(env);
 
+    case PR_GET_UNALIGN:
+        return do_prctl_get_unalign(env, arg2);
+    case PR_SET_UNALIGN:
+        return do_prctl_set_unalign(env, arg2);
+
     case PR_GET_DUMPABLE:
     case PR_SET_DUMPABLE:
     case PR_GET_KEEPCAPS:
@@ -6483,8 +6494,6 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
     case PR_SET_THP_DISABLE:
     case PR_GET_TSC:
     case PR_SET_TSC:
-    case PR_GET_UNALIGN:
-    case PR_SET_UNALIGN:
         /* Disable to prevent the target disabling stuff we need. */
         return -TARGET_EINVAL;
 
-- 
2.25.1


