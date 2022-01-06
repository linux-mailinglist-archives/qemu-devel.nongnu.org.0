Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EED486327
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 11:50:46 +0100 (CET)
Received: from localhost ([::1]:34980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5QM1-0001SX-Hm
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 05:50:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDU-0007cM-I0
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:41:56 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:59737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDO-0004jJ-Ps
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:41:56 -0500
Received: from quad ([82.142.12.178]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MYeV1-1mrvX01FHX-00Vi8v; Thu, 06
 Jan 2022 11:41:45 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 09/27] linux-user: Add code for PR_GET/SET_UNALIGN
Date: Thu,  6 Jan 2022 11:41:19 +0100
Message-Id: <20220106104137.732883-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220106104137.732883-1-laurent@vivier.eu>
References: <20220106104137.732883-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:TUEOrmH/hZxcqE7J5ubrNdT0wFbaHHCSStrL48mcd29iat3HgwG
 UpVGX4ga/6cgyFaOwfITFOPPQ0IuY2RNm2ICdC3a9G4OZtwtVgDBQsLzsJ6EF9vV7Okdnek
 6iGzVccwIWQhdNjYvK2RosijCPmfahIjld02Hv9Th/bk3G+78pL0Ttc30RRSEwhYyg8Jq9b
 ThyVvWgJpWrm3+SGdPTuA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:O80bhlyC4cM=:gB6xfR4360QT8qahfDKlMB
 bX4ybgM9YzD4lo7lzTFI+6087c2MEXVQl7TB5btFV64WY4LBfZJt0VsZrVmdXOrlnfRsQNf/y
 Tngx+xWtDgrvxSedKZ59TuyXpChp2GNPnYKiE8m15Wi9DItcJWWL2oVV4UPj8V3y0e2/ZaOJR
 3OjSSKRBNe+Fp9LLo4XG99Kxbaphd0lGOh08zSYt+p9QHfzapk39CP1k0zxBudKpqsDMsyq14
 0R8FtsELFhTR4ABZchP5hBNfT8YpPqy9oXjajwhK7sH58erqKXPt8u83gY5Y4ahsKBk5GhU3r
 ABERrP04Oxh66MI+bcHGkypbmQX/1M9dfSPoom3eD17WqrSnJWAV3aMmEzPvKxsOq1kT6gvl+
 EPIfESPZrVOIzl1iiINN5fBWWwKEXbx4yv09lw64COZFqe2xCdyDJU3GADxkDzXPWrmYu6wCC
 IwnGczHE+xd96Sjzb+pg+VFkPEtnxeIM9rGikAtxH3mrxStzQ77SGKCv4xdw4mayJcky5ekAf
 qwmAvdy7/2cmsEUfRWuqyCXVS0zvP5qSKfN2c0E774d6A8ZQd/RkN1Jm/KYsrstfv+hRNC7ex
 2PBG5xRKjhyBANHMwAosX3YwmsnikTze0DplhO/KF1DyziLV+QtMzGy+Ceu57Mp2iDZ3koqAq
 dsdVok1a5d8fetyoJqpYYks1BN9H2jUkHIjjA5669LmptdnlOmcu+avLTGK/4heWnhc8=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

This requires extra work for each target, but adds the
common syscall code, and the necessary flag in CPUState.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211227150127.2659293-4-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 cpu.c                                     | 20 ++++++++++++-----
 include/hw/core/cpu.h                     |  3 +++
 linux-user/generic/target_prctl_unalign.h | 27 +++++++++++++++++++++++
 linux-user/syscall.c                      | 13 +++++++++--
 4 files changed, 56 insertions(+), 7 deletions(-)
 create mode 100644 linux-user/generic/target_prctl_unalign.h

diff --git a/cpu.c b/cpu.c
index 945dd3dded4a..016bf06a1aec 100644
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
+    /*
+     * Create a property for the user-only object, so users can
+     * adjust prctl(PR_SET_UNALIGN) from the command-line.
+     * Has no effect if the target does not support the feature.
+     */
+    DEFINE_PROP_BOOL("prctl-unalign-sigbus", CPUState,
+                     prctl_unalign_sigbus, false),
+#else
     /*
-     * Create a memory property for softmmu CPU object,
-     * so users can wire up its memory. (This can't go in hw/core/cpu.c
-     * because that file is compiled only once for both user-mode
-     * and system builds.) The default if no link is set up is to use
+     * Create a memory property for softmmu CPU object, so users can
+     * wire up its memory.  The default if no link is set up is to use
      * the system address space.
      */
     DEFINE_PROP_LINK("memory", CPUState, memory, TYPE_MEMORY_REGION,
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index e948e81f1a97..76ab3b851c87 100644
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
index 000000000000..bc3b83af2a6b
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
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index d868ef291085..b5112891b046 100644
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
2.33.1


