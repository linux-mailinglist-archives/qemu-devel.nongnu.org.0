Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 422137006B1
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 13:24:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxQrN-00062U-Hf; Fri, 12 May 2023 07:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pxQrL-00061o-CF
 for qemu-devel@nongnu.org; Fri, 12 May 2023 07:22:51 -0400
Received: from mout.kundenserver.de ([212.227.126.135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pxQrJ-0002PM-HD
 for qemu-devel@nongnu.org; Fri, 12 May 2023 07:22:51 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MCXhr-1q5vJj114l-009dog; Fri, 12
 May 2023 13:22:40 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Afonso Bordado <afonsobordado@gmail.com>,
 Palmer Dabbelt <palmer@rivosinc.com>, Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <alistair.francis@wdc.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PULL 1/9] linux-user: Emulate /proc/cpuinfo output for riscv
Date: Fri, 12 May 2023 13:22:30 +0200
Message-Id: <20230512112238.85272-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230512112238.85272-1-laurent@vivier.eu>
References: <20230512112238.85272-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:I4rMKSwAL0IuP4QDTZP5cBkepjeqY/TU5Co7ldp0YnY9Tpy9vov
 BOQPnRui93RoJ8fscfsBSYaAiXpwUJTnbJ/5fzfNLfg7eww384x7Wqwv96qpMQJG1BnaiLT
 xQmxibZa9Apbs4KDKW83wiMdI8VTJm/affDmuuu95n6+LJ/t4idQWKe/aIU7FE9Cp9XnICp
 6yzonAQ+VQtFv/1rAaraw==
UI-OutboundReport: notjunk:1;M01:P0:36wJv0rPpp4=;W0QapBdhMtYy5xZ5FdRfRIk/AgW
 p/HRw419lbUgq4h2eeLEwYqqv10M9nOu6GcNbDd9rsWp9JpXjm2ZRDWLn7At/hwF1S68oXrau
 RifoPvmvCvcxIH3m1gdGLhv9X8MvKWz5/329/XDmBBYH3UN2+uO+7qDBJSVv3mHpETn80J2RS
 pAugn8yZ5X1KDNvKaKk6vTmzAY7Dv48Szvss9Qf5b4AhfIKd5/0MrkFqscxPAwHSdYHL+rYeX
 QI1ruKbXvhJhYufw5+A4LoBjZLL4PnjUAdfGojCtiCLg+OpQDuY1OBa84APR2IybYfwtbHZtl
 06hk6KG0IEPK47QYjz7MIrN4oK31HS/1sRhFW0j09Rvn7eumIwKLcv2ruNNjCBYTjyGNgpvSk
 LUOIXYbFZR7/9PGMXsOSQbtXIE5fV6quUtVOYt0K/u2Tw2XRN2UQezXl+Uo+2Y2gq+/a8U5OZ
 HJFGHBwdChEiJIP5MsKhOW1/eR4LFbDotBqUGkBDENC1Ia2M2u7h1bIQoqayGoF3rgE5SVxT6
 rV71qt3bHQQs02NRJ6inY5m+enAOX/ftXLt5Uwjdbis+oDiKhLmuEDfrzwYWjtmp0D5pEK/4R
 hc8lC8XD8P8ruDh8X0zUI0svDrDqtkU8YC3Qq9hbASz84fWciUkyaPVXnKQWtYCfPtrAME2oi
 6w16eHG8XlNoPEg1g+SpMnBewmKLnXu27cePiMkboA==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Afonso Bordado <afonsobordado@gmail.com>

RISC-V does not expose all extensions via hwcaps, thus some userspace
applications may want to query these via /proc/cpuinfo.

Currently when querying this file the host's file is shown instead
which is slightly confusing. Emulate a basic /proc/cpuinfo file
with mmu info and an ISA string.

Signed-off-by: Afonso Bordado <afonsobordado@gmail.com>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Message-Id: <167873059442.9885.15152085316575248452-0@git.sr.ht>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c              | 34 +++++++++++++++++++++++++++++--
 tests/tcg/riscv64/Makefile.target |  1 +
 tests/tcg/riscv64/cpuinfo.c       | 30 +++++++++++++++++++++++++++
 3 files changed, 63 insertions(+), 2 deletions(-)
 create mode 100644 tests/tcg/riscv64/cpuinfo.c

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 69f740ff98c8..085ce530213e 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8231,7 +8231,8 @@ void target_exception_dump(CPUArchState *env, const char *fmt, int code)
 }
 
 #if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN || \
-    defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA)
+    defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA) || \
+    defined(TARGET_RISCV)
 static int is_proc(const char *filename, const char *entry)
 {
     return strcmp(filename, entry) == 0;
@@ -8309,6 +8310,35 @@ static int open_cpuinfo(CPUArchState *cpu_env, int fd)
 }
 #endif
 
+#if defined(TARGET_RISCV)
+static int open_cpuinfo(CPUArchState *cpu_env, int fd)
+{
+    int i;
+    int num_cpus = sysconf(_SC_NPROCESSORS_ONLN);
+    RISCVCPU *cpu = env_archcpu(cpu_env);
+    const RISCVCPUConfig *cfg = riscv_cpu_cfg((CPURISCVState *) cpu_env);
+    char *isa_string = riscv_isa_string(cpu);
+    const char *mmu;
+
+    if (cfg->mmu) {
+        mmu = (cpu_env->xl == MXL_RV32) ? "sv32"  : "sv48";
+    } else {
+        mmu = "none";
+    }
+
+    for (i = 0; i < num_cpus; i++) {
+        dprintf(fd, "processor\t: %d\n", i);
+        dprintf(fd, "hart\t\t: %d\n", i);
+        dprintf(fd, "isa\t\t: %s\n", isa_string);
+        dprintf(fd, "mmu\t\t: %s\n", mmu);
+        dprintf(fd, "uarch\t\t: qemu\n\n");
+    }
+
+    g_free(isa_string);
+    return 0;
+}
+#endif
+
 #if defined(TARGET_M68K)
 static int open_hardware(CPUArchState *cpu_env, int fd)
 {
@@ -8333,7 +8363,7 @@ static int do_openat(CPUArchState *cpu_env, int dirfd, const char *pathname, int
 #if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN
         { "/proc/net/route", open_net_route, is_proc },
 #endif
-#if defined(TARGET_SPARC) || defined(TARGET_HPPA)
+#if defined(TARGET_SPARC) || defined(TARGET_HPPA) || defined(TARGET_RISCV)
         { "/proc/cpuinfo", open_cpuinfo, is_proc },
 #endif
 #if defined(TARGET_M68K)
diff --git a/tests/tcg/riscv64/Makefile.target b/tests/tcg/riscv64/Makefile.target
index 9973ba3b5f8c..2da65dccaf6a 100644
--- a/tests/tcg/riscv64/Makefile.target
+++ b/tests/tcg/riscv64/Makefile.target
@@ -4,6 +4,7 @@
 VPATH += $(SRC_PATH)/tests/tcg/riscv64
 TESTS += test-div
 TESTS += noexec
+TESTS += cpuinfo
 
 # Disable compressed instructions for test-noc
 TESTS += test-noc
diff --git a/tests/tcg/riscv64/cpuinfo.c b/tests/tcg/riscv64/cpuinfo.c
new file mode 100644
index 000000000000..296abd0a8cf9
--- /dev/null
+++ b/tests/tcg/riscv64/cpuinfo.c
@@ -0,0 +1,30 @@
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <assert.h>
+
+#define BUFFER_SIZE 1024
+
+int main(void)
+{
+    char buffer[BUFFER_SIZE];
+    FILE *fp = fopen("/proc/cpuinfo", "r");
+    assert(fp != NULL);
+
+    while (fgets(buffer, BUFFER_SIZE, fp) != NULL) {
+        if (strstr(buffer, "processor") != NULL) {
+            assert(strstr(buffer, "processor\t: ") == buffer);
+        } else if (strstr(buffer, "hart") != NULL) {
+            assert(strstr(buffer, "hart\t\t: ") == buffer);
+        } else if (strstr(buffer, "isa") != NULL) {
+            assert(strcmp(buffer, "isa\t\t: rv64imafdc_zicsr_zifencei\n") == 0);
+        } else if (strstr(buffer, "mmu") != NULL) {
+            assert(strcmp(buffer, "mmu\t\t: sv48\n") == 0);
+        } else if (strstr(buffer, "uarch") != NULL) {
+            assert(strcmp(buffer, "uarch\t\t: qemu\n") == 0);
+        }
+    }
+
+    fclose(fp);
+    return 0;
+}
-- 
2.40.1


