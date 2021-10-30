Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2930440B52
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 20:42:36 +0200 (CEST)
Received: from localhost ([::1]:40698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgtJL-00022q-Td
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 14:42:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs22-0001gQ-0j
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:38 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:40585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1z-0002Jg-Uj
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:37 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 n36-20020a17090a5aa700b0019fa884ab85so13062685pji.5
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c4K4bq+N5IErCjdHSmC7m5HyJJ6X1g8RLx33K/0SW0g=;
 b=xRnszdL5K6Qc4t8bKFpnXPhdx0itTKql3IpCpji3+ivJ7REI7VZdH/gBxZv72piRsQ
 +OxFG/rnFN7K+KpmwCCDnlQNQSTSzxbroONbnE+pNURzMeP91sQvGsx2fJML+8eYxg4r
 4h9icin+55ypsU6ln69qihSr9sdDQxqluhdHrtaWIESNLQmWFjAIgPkzr6uFG8hTIoYU
 iWKoVv2M2KEvzbzyjtZnpKODWnzD545KSmgHg0Ns9R12xY6Uz25N85O+ehV2EoetFRYi
 Fmuw8Cy9I64ZxZVC0J0UYUQSrv9BsAyaj5nMq6HfjPNCYwAL3+RAa+xpsBBpDep9B/Yt
 MMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c4K4bq+N5IErCjdHSmC7m5HyJJ6X1g8RLx33K/0SW0g=;
 b=1hZ/T3ILGemnc7ym0iLnl4TyfptzqhId4cIWTd1IatsfWBfIaZ9zoZvcuX0Fstc7lY
 JTqIhlaVE/NmHq6ONPKbMVC9/UY0Y3JFI2W3LvP7RPmPRVEDqvAy6OxPDwr76r8NOAXo
 JlyBgs6qP1OstWwRKwVMPocZZzmwTnXoqd027N9FtBrpZPyax/sOtyTNC13cpRS9bIpd
 YnxxQvVelAu1ykVZoAysWyYl/bbHIWa+WfnI31ljAoE6fU5KbmApxMMIROjxCkh7pb41
 lv2RcRFcLASTb7snvWU9wlB+4f4Q5ZuB6VHAhq9Mp8veLylNwfLDfwbxAmjd3aIITujG
 J1EQ==
X-Gm-Message-State: AOAM533XcaxmbQdlc0g03uUDeH68Vc1v8bmxa4hE8Fv1b99knHUdEtB8
 41Gy1ggoSEKqizEy8v+qhcFSeRxL44bftw==
X-Google-Smtp-Source: ABdhPJzcXvL0ssvpiNCENsx99fPa8d3V4aqUtxLqaHG3CNBzgzuCS2EHeVU8/DWob9hauXL6bOG0Ng==
X-Received: by 2002:a17:90b:1e4a:: with SMTP id
 pi10mr19226716pjb.142.1635614434568; 
 Sat, 30 Oct 2021 10:20:34 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k14sm9584798pji.45.2021.10.30.10.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:20:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 63/66] linux-user: Add code for PR_GET/SET_UNALIGN
Date: Sat, 30 Oct 2021 10:16:32 -0700
Message-Id: <20211030171635.1689530-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
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
index 1a10497af3..6202bbf9c3 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -412,6 +412,9 @@ struct CPUState {
 
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
index 9bce67ef55..9e388d9cd3 100644
--- a/cpu.c
+++ b/cpu.c
@@ -179,13 +179,23 @@ void cpu_exec_unrealizefn(CPUState *cpu)
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
index 7635c2397a..ac3bc8a330 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6375,6 +6375,12 @@ static abi_long do_prctl_inval1(CPUArchState *env, abi_long arg2)
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
@@ -6438,6 +6444,11 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
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
@@ -6480,8 +6491,6 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
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


