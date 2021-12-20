Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AEC47B552
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 22:44:53 +0100 (CET)
Received: from localhost ([::1]:58702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzQSi-0003IT-C7
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 16:44:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzQPg-0000Ca-Lf
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:41:44 -0500
Received: from [2607:f8b0:4864:20::102e] (port=51823
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzQPe-0002xR-Tw
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:41:44 -0500
Received: by mail-pj1-x102e.google.com with SMTP id v16so10600555pjn.1
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 13:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=00fE8MU4YB8lLeaygGfMhlhkpPT5xron8A0y1lHaeHI=;
 b=bulLhTTUasD/NtqkON/zCsmH0clyimrvPsdhDEtFjD4NVwkett/wJIlr79EVf2yMI0
 s4jrTcYmAjO6vBWIVc+pylgVhR2qrgZe7dbhvbcEtQQMrvIgf0UxgmnyEbJhbCEvJgUZ
 EA2+XJjtxuzjKuALyaYoZuslL/pPF5fnV4QUwWxRLKrUk0Z7/0jug0WMkhE+G0INdBKV
 27ZJowfzuudpLd3z4XfpjZJoSW2C6g+wsiEjrQRd/3KsU5lRWMR2zzAWY//7w3OG4ABI
 lB5r1iSn75I0od61bdDA9opaYckDbSzKM8/iiNdQXMI0VIgtXukFo7NcRYPXVKRLi5lN
 xpJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=00fE8MU4YB8lLeaygGfMhlhkpPT5xron8A0y1lHaeHI=;
 b=TXQGTJ2Bd/HXtjtgiwEUsrTnAmNlZQnTaQfe3quH3xH2WQIDhChl5VsHkK//wx+T0r
 bzoxY8OHuXfWlhVyXqippAstfwK/9e+Sausb08dD5NTcAxviVtcyb4+l+jbHlTVCa1hK
 JNwATDJ8TVKua2QwVQZ21mUV8g6EB5j7ycuw/fpYAqLONNBo6rvesh9P0KIeLcA0/hlS
 UkgKFteedGGDB0WlluURYm+PB/O0ApM3KfLuHHmZMe5R6M+nB42MMSGrrEkOl4fFblZ8
 EVtO0aVq2pjs8kb8+2IQNg7JTF2n9da53yqJw1bZG3ZUfKjvS/dLzljVPdoXnyOKxyc4
 t+hw==
X-Gm-Message-State: AOAM533vaiYioaS1af6o9TyHvCEjq1iB6xRsup7op50237yPiJCajBML
 +Npr8qYA+ghxc0K3la4xS5PZ8oTtofIGoA==
X-Google-Smtp-Source: ABdhPJyTK2G85LxrOFSPsOf5BwIBKdlc2RP+4XmszDT3elHEwFNrUlibXKE/pzji0Y2V/yhpUYZyDg==
X-Received: by 2002:a17:90b:1b43:: with SMTP id
 nv3mr152998pjb.93.1640036501416; 
 Mon, 20 Dec 2021 13:41:41 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id u10sm12508748pfm.58.2021.12.20.13.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 13:41:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/6] linux-user: Add code for PR_GET/SET_UNALIGN
Date: Mon, 20 Dec 2021 13:41:32 -0800
Message-Id: <20211220214135.189157-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220214135.189157-1-richard.henderson@linaro.org>
References: <20211220214135.189157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: laurent@vivier.eu, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This requires extra work for each target, but adds the
common syscall code, and the necessary flag in CPUState.

Reviewed-by: Warner Losh <imp@bsdimp.com>
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
index ef7a955dbb..3f481eb5b2 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6377,6 +6377,12 @@ static abi_long do_prctl_inval1(CPUArchState *env, abi_long arg2)
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
@@ -6440,6 +6446,11 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
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
@@ -6482,8 +6493,6 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
     case PR_SET_THP_DISABLE:
     case PR_GET_TSC:
     case PR_SET_TSC:
-    case PR_GET_UNALIGN:
-    case PR_SET_UNALIGN:
     default:
         /* Disable to prevent the target disabling stuff we need. */
         return -TARGET_EINVAL;
-- 
2.25.1


