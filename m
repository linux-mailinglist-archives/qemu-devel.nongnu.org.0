Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9AF32ECB5
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 15:02:38 +0100 (CET)
Received: from localhost ([::1]:53358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIB2L-0004w6-5t
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 09:02:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lIB0m-0003vM-Ea
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 09:01:06 -0500
Received: from indium.canonical.com ([91.189.90.7]:37458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lIB0i-0001aa-Vu
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 09:01:00 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lIB0f-00012K-PI
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 14:00:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id BE1B22E815A
 for <qemu-devel@nongnu.org>; Fri,  5 Mar 2021 14:00:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Mar 2021 13:54:51 -0000
From: =?utf-8?q?Alex_Benn=C3=A9e?= <1915925@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=alex.bennee@linaro.org; 
X-Launchpad-Bug-Tags: semihosting testcase
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee inver7 pmaydell
X-Launchpad-Bug-Reporter: iNvEr7 (inver7)
X-Launchpad-Bug-Modifier: =?utf-8?q?Alex_Benn=C3=A9e_=28ajbennee=29?=
References: <161356438332.24036.4652954745285513495.malonedeb@chaenomeles.canonical.com>
Message-Id: <20210305135451.15427-4-alex.bennee@linaro.org>
Subject: [Bug 1915925] [PATCH v1 3/3] semihosting/arg-compat: fix up handling
 of SYS_HEAPINFO
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fc09074b06b3b9178bd28175bdab646b3b5abfce"; Instance="production"
X-Launchpad-Hash: b6ea80e91760951dc55326d363d0b6f53af9f90d
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1915925 <1915925@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm not sure this every worked properly and it's certainly not
exercised by check-tcg or Peter's semihosting tests. Hoist it into
it's own helper function and attempt to validate the results in the
linux-user semihosting test at the least.

Bug: https://bugs.launchpad.net/bugs/1915925
Cc: Bug 1915925 <1915925@bugs.launchpad.net>
Cc: Keith Packard <keithp@keithp.com>
Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
---
 tests/tcg/arm/semicall.h      |   1 +
 semihosting/arm-compat-semi.c | 129 +++++++++++++++++++---------------
 tests/tcg/arm/semihosting.c   |  34 ++++++++-
 3 files changed, 107 insertions(+), 57 deletions(-)

diff --git a/tests/tcg/arm/semicall.h b/tests/tcg/arm/semicall.h
index d4f6818192..676a542be5 100644
--- a/tests/tcg/arm/semicall.h
+++ b/tests/tcg/arm/semicall.h
@@ -9,6 +9,7 @@
 =

 #define SYS_WRITE0      0x04
 #define SYS_READC       0x07
+#define SYS_HEAPINFO    0x16
 #define SYS_REPORTEXC   0x18
 =

 uintptr_t __semi_call(uintptr_t type, uintptr_t arg0)
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 94950b6c56..a8fdbceb5f 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -822,6 +822,78 @@ static const GuestFDFunctions guestfd_fns[] =3D {
     put_user_utl(val, args + (n) * sizeof(target_ulong))
 #endif
 =

+/*
+ * SYS_HEAPINFO is a little weird: "On entry, the PARAMETER REGISTER
+ * contains the address of a pointer to a four-field data block" which
+ * we then fill in. The PARAMETER REGISTER is unchanged.
+ */
+
+struct HeapInfo {
+    target_ulong heap_base;
+    target_ulong heap_limit;
+    target_ulong stack_base;
+    target_ulong stack_limit;
+};
+
+static bool do_heapinfo(CPUState *cs, target_long arg0)
+{
+    target_ulong limit;
+    struct HeapInfo info =3D {};
+#ifdef CONFIG_USER_ONLY
+    TaskState *ts =3D cs->opaque;
+#else
+    target_ulong rambase =3D common_semi_rambase(cs);
+#endif
+
+#ifdef CONFIG_USER_ONLY
+    /*
+     * Some C libraries assume the heap immediately follows .bss, so
+     * allocate it using sbrk.
+     */
+    if (!ts->heap_limit) {
+        abi_ulong ret;
+
+        ts->heap_base =3D do_brk(0);
+        limit =3D ts->heap_base + COMMON_SEMI_HEAP_SIZE;
+        /* Try a big heap, and reduce the size if that fails.  */
+        for (;;) {
+            ret =3D do_brk(limit);
+            if (ret >=3D limit) {
+                break;
+            }
+            limit =3D (ts->heap_base >> 1) + (limit >> 1);
+        }
+        ts->heap_limit =3D limit;
+    }
+
+    info.heap_base =3D ts->heap_base;
+    info.heap_limit =3D ts->heap_limit;
+    info.stack_base =3D ts->stack_base;
+    info.stack_limit =3D 0; /* Stack limit.  */
+
+    if (copy_to_user(arg0, &info, sizeof(info))) {
+        errno =3D EFAULT;
+        return  set_swi_errno(cs, -1);
+    }
+#else
+    limit =3D current_machine->ram_size;
+    /* TODO: Make this use the limit of the loaded application.  */
+    info.heap_base =3D rambase + limit / 2;
+    info.heap_limit =3D rambase + limit;
+    info.stack_base =3D rambase + limit; /* Stack base */
+    info.stack_limit =3D rambase; /* Stack limit.  */
+
+    if (cpu_memory_rw_debug(cs, arg0, &info, sizeof(info), true)) {
+        errno =3D EFAULT;
+        return  set_swi_errno(cs, -1);
+    }
+
+#endif
+
+    return 0;
+}
+
+
 /*
  * Do a semihosting call.
  *
@@ -1184,63 +1256,8 @@ target_ulong do_common_semihosting(CPUState *cs)
         }
     case TARGET_SYS_HEAPINFO:
         {
-            target_ulong retvals[4];
-            target_ulong limit;
-            int i;
-#ifdef CONFIG_USER_ONLY
-            TaskState *ts =3D cs->opaque;
-#else
-            target_ulong rambase =3D common_semi_rambase(cs);
-#endif
-
             GET_ARG(0);
-
-#ifdef CONFIG_USER_ONLY
-            /*
-             * Some C libraries assume the heap immediately follows .bss, =
so
-             * allocate it using sbrk.
-             */
-            if (!ts->heap_limit) {
-                abi_ulong ret;
-
-                ts->heap_base =3D do_brk(0);
-                limit =3D ts->heap_base + COMMON_SEMI_HEAP_SIZE;
-                /* Try a big heap, and reduce the size if that fails.  */
-                for (;;) {
-                    ret =3D do_brk(limit);
-                    if (ret >=3D limit) {
-                        break;
-                    }
-                    limit =3D (ts->heap_base >> 1) + (limit >> 1);
-                }
-                ts->heap_limit =3D limit;
-            }
-
-            retvals[0] =3D ts->heap_base;
-            retvals[1] =3D ts->heap_limit;
-            retvals[2] =3D ts->stack_base;
-            retvals[3] =3D 0; /* Stack limit.  */
-#else
-            limit =3D current_machine->ram_size;
-            /* TODO: Make this use the limit of the loaded application.  */
-            retvals[0] =3D rambase + limit / 2;
-            retvals[1] =3D rambase + limit;
-            retvals[2] =3D rambase + limit; /* Stack base */
-            retvals[3] =3D rambase; /* Stack limit.  */
-#endif
-
-            for (i =3D 0; i < ARRAY_SIZE(retvals); i++) {
-                bool fail;
-
-                fail =3D SET_ARG(i, retvals[i]);
-
-                if (fail) {
-                    /* Couldn't write back to argument block */
-                    errno =3D EFAULT;
-                    return set_swi_errno(cs, -1);
-                }
-            }
-            return 0;
+            return do_heapinfo(cs, arg0);
         }
     case TARGET_SYS_EXIT:
     case TARGET_SYS_EXIT_EXTENDED:
diff --git a/tests/tcg/arm/semihosting.c b/tests/tcg/arm/semihosting.c
index 33faac9916..fd5780ec3c 100644
--- a/tests/tcg/arm/semihosting.c
+++ b/tests/tcg/arm/semihosting.c
@@ -7,7 +7,13 @@
  * SPDX-License-Identifier: GPL-3.0-or-later
  */
 =

+#define _GNU_SOURCE  /* asprintf is a GNU extension */
+
 #include <stdint.h>
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include <unistd.h>
 #include "semicall.h"
 =

 int main(int argc, char *argv[argc])
@@ -18,8 +24,34 @@ int main(int argc, char *argv[argc])
     uintptr_t exit_block[2] =3D {0x20026, 0};
     uintptr_t exit_code =3D (uintptr_t) &exit_block;
 #endif
+    struct {
+        void *heap_base;
+        void *heap_limit;
+        void *stack_base;
+        void *stack_limit;
+    } info;
+    void *ptr_to_info =3D (void *) &info;
+    char *heap_info, *stack_info;
+    void *brk =3D sbrk(0);
+
+    __semi_call(SYS_WRITE0, (uintptr_t) "Hello World\n");
+
+    memset(&info, 0, sizeof(info));
+    __semi_call(SYS_HEAPINFO, (uintptr_t) &ptr_to_info);
+
+    asprintf(&heap_info, "heap: %p -> %p\n", info.heap_base, info.heap_lim=
it);
+    __semi_call(SYS_WRITE0, (uintptr_t) heap_info);
+    if (info.heap_base !=3D brk) {
+        sprintf(heap_info, "heap mismatch: %p\n", brk);
+        __semi_call(SYS_WRITE0, (uintptr_t) heap_info);
+        return -1;
+    }
+
+    asprintf(&stack_info, "stack: %p -> %p\n", info.stack_base, info.stack=
_limit);
+    __semi_call(SYS_WRITE0, (uintptr_t) stack_info);
+    free(heap_info);
+    free(stack_info);
 =

-    __semi_call(SYS_WRITE0, (uintptr_t) "Hello World");
     __semi_call(SYS_REPORTEXC, exit_code);
     /* if we get here we failed */
     return -1;
-- =

2.20.1

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1915925

Title:
  ARM semihosting HEAPINFO results wrote to wrong address

Status in QEMU:
  Confirmed

Bug description:
  This affects latest development branch of QEMU.

  According to the ARM spec of the HEAPINFO semihosting call:

  https://developer.arm.com/documentation/100863/0300/Semihosting-
  operations/SYS-HEAPINFO--0x16-?lang=3Den

  > the PARAMETER REGISTER contains the address of a pointer to a four-
  field data block.

  However, QEMU treated the PARAMETER REGISTER as pointing to a four-
  field data block directly.

  Here is a simple program that can demonstrate this problem:
  https://github.com/iNvEr7/qemu-learn/tree/newlib-bug/semihosting-
  newlib

  This code links with newlib with semihosting mode, which will call the
  HEAPINFO SVC during crt0 routine. When running in QEMU (make run), it
  may crash the program either because of invalid write or memory
  curruption, depending on the compiled program structure.

  Also refer to my discussion with newlib folks:
  https://sourceware.org/pipermail/newlib/2021/018260.html

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1915925/+subscriptions

