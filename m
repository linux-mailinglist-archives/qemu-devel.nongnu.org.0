Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 316402CF751
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Dec 2020 00:09:49 +0100 (CET)
Received: from localhost ([::1]:34066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klKCy-0003hu-9t
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 18:09:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1klKA1-0002PX-4N
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 18:06:45 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:43296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1klK9x-0004Qy-OV
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 18:06:44 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B4N3QVS092565; Fri, 4 Dec 2020 18:06:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=zMvdYCraNdwEGRuDIhfDOdleyD/vTXD2UxQLQacSQfk=;
 b=QBCcyFFUKRimAYoftuilcMOj8ehuBZzpqaNuznDHJCr6f5KGXRkxOzC8UNG96LAcSW2O
 QCoDhhbHkpPesZ+35JapYrbN9BHH3wXCJIsL7afqGtIWM7TEPkeQkiUEjmk0mCc1u9pP
 eqTiF2emnYDlzC3KYobbM3VaxH0PYCTMfcPhlSCixRpuck8EGOoCZiWLcfIgST0Dyb8H
 H3i9N4g2yljB+pVyddNPMKY5SsQMNbLcR17T3oU8TxCUERXmBQJGlWKOgkfFI+pZ/34h
 BXoCDZhSbZ1i0tYrbrPHjtNKw3aBMNMkW+6RB0+kQf24e20w5yHItxkk51LLZeC14GGJ LQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 357uq6m4u9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 18:06:39 -0500
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B4N565F105970;
 Fri, 4 Dec 2020 18:06:39 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 357uq6m4tr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 18:06:38 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B4N1gE3017519;
 Fri, 4 Dec 2020 23:06:37 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01dal.us.ibm.com with ESMTP id 355rf8a0aw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 23:06:37 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B4N6ac215663512
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Dec 2020 23:06:36 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 547846A051;
 Fri,  4 Dec 2020 23:06:36 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4AA786A047;
 Fri,  4 Dec 2020 23:06:35 +0000 (GMT)
Received: from Buonos-Thinkpad-X1.ibm.com (unknown [9.160.122.174])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  4 Dec 2020 23:06:35 +0000 (GMT)
From: Daniele Buono <dbuono@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/5] cfi: Initial support for cfi-icall in QEMU
Date: Fri,  4 Dec 2020 18:06:12 -0500
Message-Id: <20201204230615.2392-3-dbuono@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201204230615.2392-1-dbuono@linux.vnet.ibm.com>
References: <20201204230615.2392-1-dbuono@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-04_13:2020-12-04,
 2020-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=3 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 bulkscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012040132
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=dbuono@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>, Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

LLVM/Clang, supports runtime checks for forward-edge Control-Flow
Integrity (CFI).

CFI on indirect function calls (cfi-icall) ensures that, in indirect
function calls, the function called is of the right signature for the
pointer type defined at compile time.

For this check to work, the code must always respect the function
signature when using function pointer, the function must be defined
at compile time, and be compiled with link-time optimization.

This rules out, for example, shared libraries that are dynamically loaded
(given that functions are not known at compile time), and code that is
dynamically generated at run-time.

This patch:

1) Introduces the CONFIG_CFI flag to support cfi in QEMU

2) Introduces a decorator to allow the definition of "sensitive"
functions, where a non-instrumented function may be called at runtime
through a pointer. The decorator will take care of disabling cfi-icall
checks on such functions, when cfi is enabled.

3) Marks functions currently in QEMU that exhibit such behavior,
in particular:
- The function in TCG that calls pre-compiled TBs
- The function in TCI that interprets instructions
- Functions in the plugin infrastructures that jump to callbacks
- Functions in util that directly call a signal handler

Signed-off-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
Acked-by: Alex Bennée <alex.bennee@linaro.org
---
 accel/tcg/cpu-exec.c    | 11 +++++++++++
 include/qemu/compiler.h | 12 ++++++++++++
 plugins/core.c          | 37 +++++++++++++++++++++++++++++++++++++
 plugins/loader.c        |  7 +++++++
 tcg/tci.c               |  7 +++++++
 util/main-loop.c        | 11 +++++++++++
 util/oslib-posix.c      | 11 +++++++++++
 7 files changed, 96 insertions(+)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 58aea605d8..ffe0e1e3fb 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -26,6 +26,7 @@
 #include "exec/exec-all.h"
 #include "tcg/tcg.h"
 #include "qemu/atomic.h"
+#include "qemu/compiler.h"
 #include "sysemu/qtest.h"
 #include "qemu/timer.h"
 #include "qemu/rcu.h"
@@ -144,6 +145,16 @@ static void init_delay_params(SyncClocks *sc, const CPUState *cpu)
 #endif /* CONFIG USER ONLY */
 
 /* Execute a TB, and fix up the CPU state afterwards if necessary */
+/*
+ * Disable CFI checks.
+ * TCG creates binary blobs at runtime, with the transformed code.
+ * A TB is a blob of binary code, created at runtime and called with an
+ * indirect function call. Since such function did not exist at compile time,
+ * the CFI runtime has no way to verify its signature and would fail.
+ * TCG is not considered a security-sensitive part of QEMU so this does not
+ * affect the impact of CFI in environment with high security requirements
+ */
+QEMU_DISABLE_CFI
 static inline tcg_target_ulong cpu_tb_exec(CPUState *cpu, TranslationBlock *itb)
 {
     CPUArchState *env = cpu->env_ptr;
diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index c76281f354..c87c242063 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -243,4 +243,16 @@ extern void QEMU_NORETURN QEMU_ERROR("code path is reachable")
 #define qemu_build_not_reached()  g_assert_not_reached()
 #endif
 
+#ifdef CONFIG_CFI
+/*
+ * If CFI is enabled, use an attribute to disable cfi-icall on the following
+ * function
+ */
+#define QEMU_DISABLE_CFI __attribute__((no_sanitize("cfi-icall")))
+#else
+/* If CFI is not enabled, use an empty define to not change the behavior */
+#define QEMU_DISABLE_CFI
+#endif
+
+
 #endif /* COMPILER_H */
diff --git a/plugins/core.c b/plugins/core.c
index 51bfc94787..87b823bbc4 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -31,6 +31,7 @@
 #include "tcg/tcg-op.h"
 #include "trace/mem-internal.h" /* mem_info macros */
 #include "plugin.h"
+#include "qemu/compiler.h"
 
 struct qemu_plugin_cb {
     struct qemu_plugin_ctx *ctx;
@@ -90,6 +91,12 @@ void plugin_unregister_cb__locked(struct qemu_plugin_ctx *ctx,
     }
 }
 
+/*
+ * Disable CFI checks.
+ * The callback function has been loaded from an external library so we do not
+ * have type information
+ */
+QEMU_DISABLE_CFI
 static void plugin_vcpu_cb__simple(CPUState *cpu, enum qemu_plugin_event ev)
 {
     struct qemu_plugin_cb *cb, *next;
@@ -111,6 +118,12 @@ static void plugin_vcpu_cb__simple(CPUState *cpu, enum qemu_plugin_event ev)
     }
 }
 
+/*
+ * Disable CFI checks.
+ * The callback function has been loaded from an external library so we do not
+ * have type information
+ */
+QEMU_DISABLE_CFI
 static void plugin_cb__simple(enum qemu_plugin_event ev)
 {
     struct qemu_plugin_cb *cb, *next;
@@ -128,6 +141,12 @@ static void plugin_cb__simple(enum qemu_plugin_event ev)
     }
 }
 
+/*
+ * Disable CFI checks.
+ * The callback function has been loaded from an external library so we do not
+ * have type information
+ */
+QEMU_DISABLE_CFI
 static void plugin_cb__udata(enum qemu_plugin_event ev)
 {
     struct qemu_plugin_cb *cb, *next;
@@ -325,6 +344,12 @@ void plugin_register_vcpu_mem_cb(GArray **arr,
     dyn_cb->f.generic = cb;
 }
 
+/*
+ * Disable CFI checks.
+ * The callback function has been loaded from an external library so we do not
+ * have type information
+ */
+QEMU_DISABLE_CFI
 void qemu_plugin_tb_trans_cb(CPUState *cpu, struct qemu_plugin_tb *tb)
 {
     struct qemu_plugin_cb *cb, *next;
@@ -339,6 +364,12 @@ void qemu_plugin_tb_trans_cb(CPUState *cpu, struct qemu_plugin_tb *tb)
     }
 }
 
+/*
+ * Disable CFI checks.
+ * The callback function has been loaded from an external library so we do not
+ * have type information
+ */
+QEMU_DISABLE_CFI
 void
 qemu_plugin_vcpu_syscall(CPUState *cpu, int64_t num, uint64_t a1, uint64_t a2,
                          uint64_t a3, uint64_t a4, uint64_t a5,
@@ -358,6 +389,12 @@ qemu_plugin_vcpu_syscall(CPUState *cpu, int64_t num, uint64_t a1, uint64_t a2,
     }
 }
 
+/*
+ * Disable CFI checks.
+ * The callback function has been loaded from an external library so we do not
+ * have type information
+ */
+QEMU_DISABLE_CFI
 void qemu_plugin_vcpu_syscall_ret(CPUState *cpu, int64_t num, int64_t ret)
 {
     struct qemu_plugin_cb *cb, *next;
diff --git a/plugins/loader.c b/plugins/loader.c
index 8ac5dbc20f..fd491961de 100644
--- a/plugins/loader.c
+++ b/plugins/loader.c
@@ -32,6 +32,7 @@
 #ifndef CONFIG_USER_ONLY
 #include "hw/boards.h"
 #endif
+#include "qemu/compiler.h"
 
 #include "plugin.h"
 
@@ -150,6 +151,12 @@ static uint64_t xorshift64star(uint64_t x)
     return x * UINT64_C(2685821657736338717);
 }
 
+/*
+ * Disable CFI checks.
+ * The install and version functions have been loaded from an external library
+ * so we do not have type information
+ */
+QEMU_DISABLE_CFI
 static int plugin_load(struct qemu_plugin_desc *desc, const qemu_info_t *info)
 {
     qemu_plugin_install_func_t install;
diff --git a/tcg/tci.c b/tcg/tci.c
index 82039fd163..5d97b7c71c 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -31,6 +31,7 @@
 #include "tcg/tcg.h"           /* MAX_OPC_PARAM_IARGS */
 #include "exec/cpu_ldst.h"
 #include "tcg/tcg-op.h"
+#include "qemu/compiler.h"
 
 /* Marker for missing code. */
 #define TODO() \
@@ -475,6 +476,12 @@ static bool tci_compare64(uint64_t u0, uint64_t u1, TCGCond condition)
 #endif
 
 /* Interpret pseudo code in tb. */
+/*
+ * Disable CFI checks.
+ * One possible operation in the pseudo code is a call to binary code.
+ * Therefore, disable CFI checks in the interpreter function
+ */
+QEMU_DISABLE_CFI
 uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
 {
     tcg_target_ulong regs[TCG_TARGET_NB_REGS];
diff --git a/util/main-loop.c b/util/main-loop.c
index 6470f8eae3..6bfc7c46f5 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -33,6 +33,7 @@
 #include "block/aio.h"
 #include "qemu/error-report.h"
 #include "qemu/queue.h"
+#include "qemu/compiler.h"
 
 #ifndef _WIN32
 #include <sys/wait.h>
@@ -44,6 +45,16 @@
  * use signalfd to listen for them.  We rely on whatever the current signal
  * handler is to dispatch the signals when we receive them.
  */
+/*
+ * Disable CFI checks.
+ * We are going to call a signal hander directly. Such handler may or may not
+ * have been defined in our binary, so there's no guarantee that the pointer
+ * used to set the handler is a cfi-valid pointer. Since the handlers are
+ * stored in kernel memory, changing the handler to an attacker-defined
+ * function requires being able to call a sigaction() syscall,
+ * which is not as easy as overwriting a pointer in memory.
+ */
+QEMU_DISABLE_CFI
 static void sigfd_handler(void *opaque)
 {
     int fd = (intptr_t)opaque;
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index f15234b5c0..f1e2801b11 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -39,6 +39,7 @@
 #include "qemu/thread.h"
 #include <libgen.h>
 #include "qemu/cutils.h"
+#include "qemu/compiler.h"
 
 #ifdef CONFIG_LINUX
 #include <sys/syscall.h>
@@ -773,6 +774,16 @@ void qemu_free_stack(void *stack, size_t sz)
     munmap(stack, sz);
 }
 
+/*
+ * Disable CFI checks.
+ * We are going to call a signal hander directly. Such handler may or may not
+ * have been defined in our binary, so there's no guarantee that the pointer
+ * used to set the handler is a cfi-valid pointer. Since the handlers are
+ * stored in kernel memory, changing the handler to an attacker-defined
+ * function requires being able to call a sigaction() syscall,
+ * which is not as easy as overwriting a pointer in memory.
+ */
+QEMU_DISABLE_CFI
 void sigaction_invoke(struct sigaction *action,
                       struct qemu_signalfd_siginfo *info)
 {
-- 
2.17.1


