Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDB4254E32
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Aug 2020 21:25:49 +0200 (CEST)
Received: from localhost ([::1]:51640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBNWu-0005EE-Jd
	for lists+qemu-devel@lfdr.de; Thu, 27 Aug 2020 15:25:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kBNS1-00047B-S9
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 15:20:45 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:58907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kBNRy-0000ER-SA
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 15:20:45 -0400
Received: from localhost.localdomain ([82.252.135.186]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M9Frd-1kHiAK2vwt-006Q6b; Thu, 27 Aug 2020 21:20:32 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 06/18] linux-user: Add strace support for printing arguments of
 syscalls used to lock and unlock memory
Date: Thu, 27 Aug 2020 21:20:06 +0200
Message-Id: <20200827192018.2442099-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200827192018.2442099-1-laurent@vivier.eu>
References: <20200827192018.2442099-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:f0nRlCcWTzGwn9gK0ez3eLTyeo0HG0H/6rbwmTiga1TleANHppN
 PvaeZe2jFg6jR/IC9CtXiHMfylpyy0NSKbH4/TuN7Htbf3GFKTeNHMwU1Df/WP/UDlmdc8G
 TAKoYvpmsPJ0TFpsJqp1QczTEjXlZjvkCYsxmh9Ce7pUWWsc8KpPRxkqzBdDGWPtpz0USyO
 YJ7KmrT/m3A3hrnJat4rg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fAcFz1Py0+A=:yOz1fVyDwnsQlP1x8xH9Nr
 13mI+910JosTNv7qdqzkuXKNBwNEaMoU1yBcMOhxxg9S2Woxww2Qtg6/ARhb7cX1xLg1xsSgP
 UvTYRV1IkyisV0AJ4MrUfAwC0R7hkpatCNeNZf4Pab306+5EX6pdtvEXJ95VXY7uuP4ZROyav
 a9OqOYnaepFENRdvEcY/mP6ALLYktbeONgxUhe+wEw5aaDLNVdV+KgguKN7hSmtANxbAf7F/R
 4wvO8MQrhgsDu70YT7vDdPlfgj4KLSzv+6++xyR1bL7y6+f+SQTnQwbpqTsP2JQrAuVvIde1/
 JHcqTANyjnn5121oPT4XmAbt2PkB6Mk7yDVRTc+lCghmBz3msgH6nNUIYdiVPM09pX50o9Lhq
 dmhVd0TKHyPOKE5E6FgtprOaz4kg1sU9crGkEMNTKpZzZZs6Xgt2ZVTFM/NH+3xWed5fBCYGK
 LQXDOQgXNH2F4QczHiSIzdNyUsJWmv5YYG3KODEpBuNFgf/Q03CUuDraYhoG6j5G3/i+X+r2a
 3SFXRVtyvLj4KvrvW8LnY6C6f8/bB1ihj5qfbff+Zax3CsyXRoZjf9K4OXMTFJBOrjfSMcoBe
 0zT8+9wvkzhiaMMJF500czIo/p9grICb1Q+dZ7JqPExK6A+lOQspj46kQItGKmCt/SVNLa9cG
 Exn9qw6pAhaM6peP1xDRn45elaDDlFNZRSfJX2pMCY7yuBwOCXZWUScCJ1yCTzUitnFJ3n/+Z
 jhhtA80wjLV2W1DnRzGbIh0nQiIa8oWErie5hhtKr0KRab67a4ZZx8r3ulGr8EWR37QpRW49r
 NaHXQq6t2/shtM9Y1s8lPJCuNOlQHhGnvsRgXj+b66sCu4Wg7DWRn8aL4dONnYiI91e2As5
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 15:20:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
 Filip Bozuta <Filip.Bozuta@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Filip Bozuta <Filip.Bozuta@syrmia.com>

This patch implements strace argument printing functionality for following syscalls:

    * mlock, munlock, mlockall, munlockall - lock and unlock memory

       int mlock(const void *addr, size_t len)
       int munlock(const void *addr, size_t len)
       int mlockall(int flags)
       int munlockall(void)
       man page: https://man7.org/linux/man-pages/man2/mlock.2.html

Implementation notes:

    Syscall mlockall() takes an argument that is composed of predefined values
    which represent flags that determine the type of locking operation that is
    to be performed. For that reason, a printing function "print_mlockall" was
    stated in file "strace.list". This printing function uses an already existing
    function "print_flags()" to print the "flags" argument.  These flags are stated
    inside an array "mlockall_flags" that contains values of type "struct flags".
    These values are instantiated using an existing macro "FLAG_TARGET()" that
    crates aproppriate target flag values based on those defined in files
    '/target_syscall.h'. These target flag values were changed from
    "TARGET_MLOCKALL_MCL*" to "TARGET_MCL_*" so that they can be aproppriately set
    and recognised in "strace.c" with "FLAG_TARGET()". Value for "MCL_ONFAULT"
    was added in this patch. This value was also added in "syscall.c" in function
    "target_to_host_mlockall_arg()". Because this flag value was added in kernel
    version 4.4, it is enwrapped in an #ifdef directive (both in "syscall.c" and
    in "strace.c") as to support older kernel versions.
    The other syscalls have only primitive argument types, so the
    rest of the implementation was handled by stating an appropriate
    printing format in file "strace.list". Syscall mlock2() is not implemented in
    "syscall.c" and thus it's argument printing is not implemented in this patch.

Signed-off-by: Filip Bozuta <Filip.Bozuta@syrmia.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20200811164553.27713-4-Filip.Bozuta@syrmia.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/aarch64/target_syscall.h    |  5 +++--
 linux-user/alpha/target_syscall.h      |  5 +++--
 linux-user/arm/target_syscall.h        |  6 ++++--
 linux-user/cris/target_syscall.h       |  5 +++--
 linux-user/hppa/target_syscall.h       |  5 +++--
 linux-user/i386/target_syscall.h       |  5 +++--
 linux-user/m68k/target_syscall.h       |  6 +++---
 linux-user/microblaze/target_syscall.h |  5 +++--
 linux-user/mips/target_syscall.h       |  5 +++--
 linux-user/mips64/target_syscall.h     |  5 +++--
 linux-user/nios2/target_syscall.h      |  5 +++--
 linux-user/openrisc/target_syscall.h   |  5 +++--
 linux-user/ppc/target_syscall.h        |  5 +++--
 linux-user/riscv/target_syscall.h      |  5 +++--
 linux-user/s390x/target_syscall.h      |  5 +++--
 linux-user/sh4/target_syscall.h        |  5 +++--
 linux-user/sparc/target_syscall.h      |  5 +++--
 linux-user/sparc64/target_syscall.h    |  5 +++--
 linux-user/strace.c                    | 21 +++++++++++++++++++++
 linux-user/strace.list                 |  8 ++++----
 linux-user/syscall.c                   | 10 ++++++++--
 linux-user/tilegx/target_syscall.h     |  5 +++--
 linux-user/x86_64/target_syscall.h     |  5 +++--
 linux-user/xtensa/target_syscall.h     |  5 +++--
 24 files changed, 97 insertions(+), 49 deletions(-)

diff --git a/linux-user/aarch64/target_syscall.h b/linux-user/aarch64/target_syscall.h
index 995e475c73f8..3194e6b0093c 100644
--- a/linux-user/aarch64/target_syscall.h
+++ b/linux-user/aarch64/target_syscall.h
@@ -16,8 +16,9 @@ struct target_pt_regs {
 #define UNAME_MINIMUM_RELEASE "3.8.0"
 #define TARGET_CLONE_BACKWARDS
 #define TARGET_MINSIGSTKSZ       2048
-#define TARGET_MLOCKALL_MCL_CURRENT 1
-#define TARGET_MLOCKALL_MCL_FUTURE  2
+#define TARGET_MCL_CURRENT 1
+#define TARGET_MCL_FUTURE  2
+#define TARGET_MCL_ONFAULT 4
 
 #define TARGET_PR_SVE_SET_VL  50
 #define TARGET_PR_SVE_GET_VL  51
diff --git a/linux-user/alpha/target_syscall.h b/linux-user/alpha/target_syscall.h
index 3426cc5b4e4f..fd389422e31e 100644
--- a/linux-user/alpha/target_syscall.h
+++ b/linux-user/alpha/target_syscall.h
@@ -258,7 +258,8 @@ struct target_pt_regs {
 #define TARGET_UAC_NOFIX		2
 #define TARGET_UAC_SIGBUS		4
 #define TARGET_MINSIGSTKSZ              4096
-#define TARGET_MLOCKALL_MCL_CURRENT     0x2000
-#define TARGET_MLOCKALL_MCL_FUTURE      0x4000
+#define TARGET_MCL_CURRENT     0x2000
+#define TARGET_MCL_FUTURE      0x4000
+#define TARGET_MCL_ONFAULT     0x8000
 
 #endif /* ALPHA_TARGET_SYSCALL_H */
diff --git a/linux-user/arm/target_syscall.h b/linux-user/arm/target_syscall.h
index f85cbdaf56ff..e870ed7a5468 100644
--- a/linux-user/arm/target_syscall.h
+++ b/linux-user/arm/target_syscall.h
@@ -28,8 +28,10 @@ struct target_pt_regs {
 #define TARGET_CLONE_BACKWARDS
 
 #define TARGET_MINSIGSTKSZ 2048
-#define TARGET_MLOCKALL_MCL_CURRENT 1
-#define TARGET_MLOCKALL_MCL_FUTURE  2
+#define TARGET_MCL_CURRENT 1
+#define TARGET_MCL_FUTURE  2
+#define TARGET_MCL_ONFAULT 4
+
 #define TARGET_WANT_OLD_SYS_SELECT
 
 #define TARGET_FORCE_SHMLBA
diff --git a/linux-user/cris/target_syscall.h b/linux-user/cris/target_syscall.h
index 29d69009ffe8..d109a6b42a35 100644
--- a/linux-user/cris/target_syscall.h
+++ b/linux-user/cris/target_syscall.h
@@ -40,7 +40,8 @@ struct target_pt_regs {
 
 #define TARGET_CLONE_BACKWARDS2
 #define TARGET_MINSIGSTKSZ 2048
-#define TARGET_MLOCKALL_MCL_CURRENT 1
-#define TARGET_MLOCKALL_MCL_FUTURE  2
+#define TARGET_MCL_CURRENT 1
+#define TARGET_MCL_FUTURE  2
+#define TARGET_MCL_ONFAULT 4
 
 #endif
diff --git a/linux-user/hppa/target_syscall.h b/linux-user/hppa/target_syscall.h
index e2f366839d80..f34e05edb57b 100644
--- a/linux-user/hppa/target_syscall.h
+++ b/linux-user/hppa/target_syscall.h
@@ -23,8 +23,9 @@ struct target_pt_regs {
 #define UNAME_MINIMUM_RELEASE "2.6.32"
 #define TARGET_CLONE_BACKWARDS
 #define TARGET_MINSIGSTKSZ       2048
-#define TARGET_MLOCKALL_MCL_CURRENT 1
-#define TARGET_MLOCKALL_MCL_FUTURE  2
+#define TARGET_MCL_CURRENT 1
+#define TARGET_MCL_FUTURE  2
+#define TARGET_MCL_ONFAULT 4
 
 #undef  TARGET_ENOMSG
 #define TARGET_ENOMSG          35
diff --git a/linux-user/i386/target_syscall.h b/linux-user/i386/target_syscall.h
index 2854758134d7..ed356b3908dc 100644
--- a/linux-user/i386/target_syscall.h
+++ b/linux-user/i386/target_syscall.h
@@ -151,8 +151,9 @@ struct target_vm86plus_struct {
 
 #define TARGET_CLONE_BACKWARDS
 #define TARGET_MINSIGSTKSZ 2048
-#define TARGET_MLOCKALL_MCL_CURRENT 1
-#define TARGET_MLOCKALL_MCL_FUTURE  2
+#define TARGET_MCL_CURRENT 1
+#define TARGET_MCL_FUTURE  2
+#define TARGET_MCL_ONFAULT 4
 #define TARGET_WANT_OLD_SYS_SELECT
 
 #endif /* I386_TARGET_SYSCALL_H */
diff --git a/linux-user/m68k/target_syscall.h b/linux-user/m68k/target_syscall.h
index c0366b1c622d..23359a6299dd 100644
--- a/linux-user/m68k/target_syscall.h
+++ b/linux-user/m68k/target_syscall.h
@@ -21,9 +21,9 @@ struct target_pt_regs {
 #define UNAME_MINIMUM_RELEASE "2.6.32"
 
 #define TARGET_MINSIGSTKSZ 2048
-#define TARGET_MLOCKALL_MCL_CURRENT 1
-#define TARGET_MLOCKALL_MCL_FUTURE  2
-
+#define TARGET_MCL_CURRENT 1
+#define TARGET_MCL_FUTURE  2
+#define TARGET_MCL_ONFAULT 4
 #define TARGET_WANT_OLD_SYS_SELECT
 
 #endif /* M68K_TARGET_SYSCALL_H */
diff --git a/linux-user/microblaze/target_syscall.h b/linux-user/microblaze/target_syscall.h
index 4141cbaa5ec2..7f653db34f87 100644
--- a/linux-user/microblaze/target_syscall.h
+++ b/linux-user/microblaze/target_syscall.h
@@ -50,8 +50,9 @@ struct target_pt_regs {
 
 #define TARGET_CLONE_BACKWARDS
 #define TARGET_MINSIGSTKSZ      2048
-#define TARGET_MLOCKALL_MCL_CURRENT 1
-#define TARGET_MLOCKALL_MCL_FUTURE  2
+#define TARGET_MCL_CURRENT 1
+#define TARGET_MCL_FUTURE  2
+#define TARGET_MCL_ONFAULT 4
 
 #define TARGET_WANT_NI_OLD_SELECT
 
diff --git a/linux-user/mips/target_syscall.h b/linux-user/mips/target_syscall.h
index d5509a34a7e2..dd6fd7af8eac 100644
--- a/linux-user/mips/target_syscall.h
+++ b/linux-user/mips/target_syscall.h
@@ -234,8 +234,9 @@ struct target_pt_regs {
 
 #define TARGET_CLONE_BACKWARDS
 #define TARGET_MINSIGSTKSZ 2048
-#define TARGET_MLOCKALL_MCL_CURRENT 1
-#define TARGET_MLOCKALL_MCL_FUTURE  2
+#define TARGET_MCL_CURRENT 1
+#define TARGET_MCL_FUTURE  2
+#define TARGET_MCL_ONFAULT 4
 
 #define TARGET_FORCE_SHMLBA
 
diff --git a/linux-user/mips64/target_syscall.h b/linux-user/mips64/target_syscall.h
index 8ccc46822c11..8594955eec26 100644
--- a/linux-user/mips64/target_syscall.h
+++ b/linux-user/mips64/target_syscall.h
@@ -231,8 +231,9 @@ struct target_pt_regs {
 
 #define TARGET_CLONE_BACKWARDS
 #define TARGET_MINSIGSTKSZ      2048
-#define TARGET_MLOCKALL_MCL_CURRENT 1
-#define TARGET_MLOCKALL_MCL_FUTURE  2
+#define TARGET_MCL_CURRENT 1
+#define TARGET_MCL_FUTURE  2
+#define TARGET_MCL_ONFAULT 4
 
 #define TARGET_FORCE_SHMLBA
 
diff --git a/linux-user/nios2/target_syscall.h b/linux-user/nios2/target_syscall.h
index f3b2a500f430..78006c24d479 100644
--- a/linux-user/nios2/target_syscall.h
+++ b/linux-user/nios2/target_syscall.h
@@ -31,7 +31,8 @@ struct target_pt_regs {
 };
 
 #define TARGET_MINSIGSTKSZ 2048
-#define TARGET_MLOCKALL_MCL_CURRENT 1
-#define TARGET_MLOCKALL_MCL_FUTURE  2
+#define TARGET_MCL_CURRENT 1
+#define TARGET_MCL_FUTURE  2
+#define TARGET_MCL_ONFAULT 4
 
 #endif /* NIOS2_TARGET_SYSCALL_H */
diff --git a/linux-user/openrisc/target_syscall.h b/linux-user/openrisc/target_syscall.h
index d586d2a018a5..ef0d89a551d5 100644
--- a/linux-user/openrisc/target_syscall.h
+++ b/linux-user/openrisc/target_syscall.h
@@ -16,8 +16,9 @@ struct target_pt_regs {
 #define UNAME_MINIMUM_RELEASE "2.6.32"
 
 #define TARGET_MINSIGSTKSZ 2048
-#define TARGET_MLOCKALL_MCL_CURRENT 1
-#define TARGET_MLOCKALL_MCL_FUTURE  2
+#define TARGET_MCL_CURRENT 1
+#define TARGET_MCL_FUTURE  2
+#define TARGET_MCL_ONFAULT 4
 
 #define MMAP_SHIFT TARGET_PAGE_BITS
 
diff --git a/linux-user/ppc/target_syscall.h b/linux-user/ppc/target_syscall.h
index afc0570410d8..c461f878f2d6 100644
--- a/linux-user/ppc/target_syscall.h
+++ b/linux-user/ppc/target_syscall.h
@@ -72,8 +72,9 @@ struct target_revectored_struct {
 #define TARGET_CLONE_BACKWARDS
 
 #define TARGET_MINSIGSTKSZ 2048
-#define TARGET_MLOCKALL_MCL_CURRENT 0x2000
-#define TARGET_MLOCKALL_MCL_FUTURE  0x4000
+#define TARGET_MCL_CURRENT 0x2000
+#define TARGET_MCL_FUTURE  0x4000
+#define TARGET_MCL_ONFAULT 0x8000
 #define TARGET_WANT_NI_OLD_SELECT
 
 #endif /* PPC_TARGET_SYSCALL_H */
diff --git a/linux-user/riscv/target_syscall.h b/linux-user/riscv/target_syscall.h
index a88e821f733d..dc597c897222 100644
--- a/linux-user/riscv/target_syscall.h
+++ b/linux-user/riscv/target_syscall.h
@@ -51,8 +51,9 @@ struct target_pt_regs {
 #define UNAME_MINIMUM_RELEASE "4.15.0"
 
 #define TARGET_MINSIGSTKSZ 2048
-#define TARGET_MLOCKALL_MCL_CURRENT 1
-#define TARGET_MLOCKALL_MCL_FUTURE  2
+#define TARGET_MCL_CURRENT 1
+#define TARGET_MCL_FUTURE  2
+#define TARGET_MCL_ONFAULT 4
 
 /* clone(flags, newsp, ptidptr, tls, ctidptr) for RISC-V */
 /* This comes from linux/kernel/fork.c, CONFIG_CLONE_BACKWARDS */
diff --git a/linux-user/s390x/target_syscall.h b/linux-user/s390x/target_syscall.h
index 8d4f609eaa5d..94f84178db79 100644
--- a/linux-user/s390x/target_syscall.h
+++ b/linux-user/s390x/target_syscall.h
@@ -28,7 +28,8 @@ struct target_pt_regs {
 
 #define TARGET_CLONE_BACKWARDS2
 #define TARGET_MINSIGSTKSZ        2048
-#define TARGET_MLOCKALL_MCL_CURRENT 1
-#define TARGET_MLOCKALL_MCL_FUTURE  2
+#define TARGET_MCL_CURRENT 1
+#define TARGET_MCL_FUTURE  2
+#define TARGET_MCL_ONFAULT 4
 
 #endif /* S390X_TARGET_SYSCALL_H */
diff --git a/linux-user/sh4/target_syscall.h b/linux-user/sh4/target_syscall.h
index 2b5f75be13d6..c1437adafefa 100644
--- a/linux-user/sh4/target_syscall.h
+++ b/linux-user/sh4/target_syscall.h
@@ -16,8 +16,9 @@ struct target_pt_regs {
 #define UNAME_MINIMUM_RELEASE "2.6.32"
 
 #define TARGET_MINSIGSTKSZ 2048
-#define TARGET_MLOCKALL_MCL_CURRENT 1
-#define TARGET_MLOCKALL_MCL_FUTURE  2
+#define TARGET_MCL_CURRENT 1
+#define TARGET_MCL_FUTURE  2
+#define TARGET_MCL_ONFAULT 4
 
 #define TARGET_FORCE_SHMLBA
 
diff --git a/linux-user/sparc/target_syscall.h b/linux-user/sparc/target_syscall.h
index b9160a771baa..d8ea04ea837a 100644
--- a/linux-user/sparc/target_syscall.h
+++ b/linux-user/sparc/target_syscall.h
@@ -21,8 +21,9 @@ struct target_pt_regs {
  */
 #define TARGET_CLONE_BACKWARDS
 #define TARGET_MINSIGSTKSZ      4096
-#define TARGET_MLOCKALL_MCL_CURRENT 0x2000
-#define TARGET_MLOCKALL_MCL_FUTURE  0x4000
+#define TARGET_MCL_CURRENT 0x2000
+#define TARGET_MCL_FUTURE  0x4000
+#define TARGET_MCL_ONFAULT 0x8000
 
 /* For SPARC SHMLBA is determined at runtime in the kernel, and
  * libc has to runtime-detect it using the hwcaps (see glibc
diff --git a/linux-user/sparc64/target_syscall.h b/linux-user/sparc64/target_syscall.h
index 3073a23e03ae..696a68b1ed4e 100644
--- a/linux-user/sparc64/target_syscall.h
+++ b/linux-user/sparc64/target_syscall.h
@@ -22,8 +22,9 @@ struct target_pt_regs {
  */
 #define TARGET_CLONE_BACKWARDS
 #define TARGET_MINSIGSTKSZ      4096
-#define TARGET_MLOCKALL_MCL_CURRENT 0x2000
-#define TARGET_MLOCKALL_MCL_FUTURE  0x4000
+#define TARGET_MCL_CURRENT 0x2000
+#define TARGET_MCL_FUTURE  0x4000
+#define TARGET_MCL_ONFAULT 0x8000
 
 #define TARGET_FORCE_SHMLBA
 
diff --git a/linux-user/strace.c b/linux-user/strace.c
index 31c7be24ebfd..4ac54ecffe9c 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -1198,6 +1198,15 @@ UNUSED static struct flags falloc_flags[] = {
 #endif
 };
 
+UNUSED static struct flags mlockall_flags[] = {
+    FLAG_TARGET(MCL_CURRENT),
+    FLAG_TARGET(MCL_FUTURE),
+#ifdef MCL_ONFAULT
+    FLAG_TARGET(MCL_ONFAULT),
+#endif
+    FLAG_END,
+};
+
 /*
  * print_xxx utility functions.  These are used to print syscall
  * parameters in certain format.  All of these have parameter
@@ -2009,6 +2018,18 @@ print_ftruncate64(void *cpu_env, const struct syscallname *name,
 }
 #endif
 
+#ifdef TARGET_NR_mlockall
+static void
+print_mlockall(void *cpu_env, const struct syscallname *name,
+               abi_long arg0, abi_long arg1, abi_long arg2,
+               abi_long arg3, abi_long arg4, abi_long arg5)
+{
+    print_syscall_prologue(name);
+    print_flags(mlockall_flags, arg0, 1);
+    print_syscall_epilogue(name);
+}
+#endif
+
 #if defined(TARGET_NR_socket)
 static void
 print_socket(void *cpu_env, const struct syscallname *name,
diff --git a/linux-user/strace.list b/linux-user/strace.list
index 8e5303d03500..d0ea7f3464b8 100644
--- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -568,13 +568,13 @@
 { TARGET_NR_mknodat, "mknodat" , NULL, print_mknodat, NULL },
 #endif
 #ifdef TARGET_NR_mlock
-{ TARGET_NR_mlock, "mlock" , NULL, NULL, NULL },
+{ TARGET_NR_mlock, "mlock" , "%s(%p," TARGET_FMT_lu ")", NULL, NULL },
 #endif
 #ifdef TARGET_NR_mlock2
 { TARGET_NR_mlock2, "mlock2" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_mlockall
-{ TARGET_NR_mlockall, "mlockall" , NULL, NULL, NULL },
+{ TARGET_NR_mlockall, "mlockall" , NULL, print_mlockall, NULL },
 #endif
 #ifdef TARGET_NR_mmap
 { TARGET_NR_mmap, "mmap" , NULL, print_mmap, print_syscall_ret_addr },
@@ -637,10 +637,10 @@
 { TARGET_NR_multiplexer, "multiplexer" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_munlock
-{ TARGET_NR_munlock, "munlock" , NULL, NULL, NULL },
+{ TARGET_NR_munlock, "munlock" , "%s(%p," TARGET_FMT_lu ")", NULL, NULL },
 #endif
 #ifdef TARGET_NR_munlockall
-{ TARGET_NR_munlockall, "munlockall" , NULL, NULL, NULL },
+{ TARGET_NR_munlockall, "munlockall" , "%s()", NULL, NULL },
 #endif
 #ifdef TARGET_NR_munmap
 { TARGET_NR_munmap, "munmap" , NULL, print_munmap, NULL },
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index ec7192112e9d..027dea35af41 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6975,12 +6975,18 @@ static inline int target_to_host_mlockall_arg(int arg)
 {
     int result = 0;
 
-    if (arg & TARGET_MLOCKALL_MCL_CURRENT) {
+    if (arg & TARGET_MCL_CURRENT) {
         result |= MCL_CURRENT;
     }
-    if (arg & TARGET_MLOCKALL_MCL_FUTURE) {
+    if (arg & TARGET_MCL_FUTURE) {
         result |= MCL_FUTURE;
     }
+#ifdef MCL_ONFAULT
+    if (arg & TARGET_MCL_ONFAULT) {
+        result |= MCL_ONFAULT;
+    }
+#endif
+
     return result;
 }
 #endif
diff --git a/linux-user/tilegx/target_syscall.h b/linux-user/tilegx/target_syscall.h
index d731acdafaa0..8e9db734b88b 100644
--- a/linux-user/tilegx/target_syscall.h
+++ b/linux-user/tilegx/target_syscall.h
@@ -34,8 +34,9 @@ struct target_pt_regs {
     tilegx_reg_t pad[2];
 };
 
-#define TARGET_MLOCKALL_MCL_CURRENT 1
-#define TARGET_MLOCKALL_MCL_FUTURE  2
+#define TARGET_MCL_CURRENT 1
+#define TARGET_MCL_FUTURE  2
+#define TARGET_MCL_ONFAULT 4
 
 /* For faultnum */
 #define TARGET_INT_SWINT_1            14
diff --git a/linux-user/x86_64/target_syscall.h b/linux-user/x86_64/target_syscall.h
index 5e221e1d9ddc..3ecccb72be2d 100644
--- a/linux-user/x86_64/target_syscall.h
+++ b/linux-user/x86_64/target_syscall.h
@@ -101,7 +101,8 @@ struct target_msqid64_ds {
 #define TARGET_ARCH_GET_FS 0x1003
 #define TARGET_ARCH_GET_GS 0x1004
 #define TARGET_MINSIGSTKSZ 2048
-#define TARGET_MLOCKALL_MCL_CURRENT 1
-#define TARGET_MLOCKALL_MCL_FUTURE  2
+#define TARGET_MCL_CURRENT 1
+#define TARGET_MCL_FUTURE  2
+#define TARGET_MCL_ONFAULT 4
 
 #endif /* X86_64_TARGET_SYSCALL_H */
diff --git a/linux-user/xtensa/target_syscall.h b/linux-user/xtensa/target_syscall.h
index 3866dad84930..afc86a153fc0 100644
--- a/linux-user/xtensa/target_syscall.h
+++ b/linux-user/xtensa/target_syscall.h
@@ -43,7 +43,8 @@ struct target_pt_regs {
     xtensa_reg_t areg[16];
 };
 
-#define TARGET_MLOCKALL_MCL_CURRENT 1
-#define TARGET_MLOCKALL_MCL_FUTURE  2
+#define TARGET_MCL_CURRENT 1
+#define TARGET_MCL_FUTURE  2
+#define TARGET_MCL_ONFAULT 4
 
 #endif
-- 
2.26.2


