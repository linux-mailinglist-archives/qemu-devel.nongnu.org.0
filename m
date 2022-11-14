Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E91628F28
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 02:23:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouinL-0007VM-Vg; Mon, 14 Nov 2022 18:23:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1ouiey-000361-Rp
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:42 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1ouc5d-0000h2-4w
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 11:13:45 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id
 2AEGC1Fa001851; Mon, 14 Nov 2022 16:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=4DflnbBA9FMxrXXMVvtkmxubeTqLf1Su4n0sFT3yirA=;
 b=CcAgqWo/o28CxhtF/I7wN+KM2YCGIBpdY/mXx17wszfdEpMxvDBg1vYAdjNNtvs2IrO3
 f46se/RLTuL06IUyEWS+yfZ6qXIyg2grYDIkpHV4zqxK4S89evp1Q1dRKjjzEpg85BWj
 MggXhE3BIUgongs87UabqjrtSVmL27h5s1b2J97lYgxtldbXxw0Q+mQHiFNI2ohlkfDb
 Y4vsL9fYc+wKNsS4Kjhojzi+QwntP65KZ+WGO693XUgsIlqFUV6A8pLdogBdFEU3bdCG
 zmm3vA5xz8uegsp1XeDSXsdZebNqlz4SOVAFCMhs4TG6+vgtLMWwQ9ST1TRnsWMwUurO og== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kus03g15c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Nov 2022 16:13:36 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AEGDQvN006042;
 Mon, 14 Nov 2022 16:13:36 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kus03g149-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Nov 2022 16:13:35 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AEG72e6030991;
 Mon, 14 Nov 2022 16:13:33 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 3kt348t25t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Nov 2022 16:13:32 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2AEGE8hG42205484
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Nov 2022 16:14:08 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7923F11C04A;
 Mon, 14 Nov 2022 16:13:29 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 16D7311C04C;
 Mon, 14 Nov 2022 16:13:29 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.39.72])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 14 Nov 2022 16:13:29 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: "Vanderson M . do Rosario" <vandersonmr2@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 1/1] tcg: add perfmap and jitdump
Date: Mon, 14 Nov 2022 17:13:21 +0100
Message-Id: <20221114161321.3364875-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221114161321.3364875-1-iii@linux.ibm.com>
References: <20221114161321.3364875-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zAvVjspANpZSw5hlPQMPooWbdMau_ja9
X-Proofpoint-GUID: QeACN0AsykCrC6ZeO-PBjxTU2ILEcW_R
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-14_12,2022-11-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211140114
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add ability to dump /tmp/perf-<pid>.map and jit-<pid>.dump.
The first one allows the perf tool to map samples to each individual
translation block. The second one adds the ability to resolve symbol
names, line numbers and inspect JITed code.

Example of use:

    perf record qemu-x86_64 -perfmap ./a.out
    perf report

or

    perf record -k 1 qemu-x86_64 -jitdump ./a.out
    perf inject -j -i perf.data -o perf.data.jitted
    perf report -i perf.data.jitted

Co-developed-by: Vanderson M. do Rosario <vandersonmr2@gmail.com>
Co-developed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20221012051846.1432050-2-iii@linux.ibm.com>
---
 accel/tcg/debuginfo.c     |  99 +++++++++++
 accel/tcg/debuginfo.h     |  52 ++++++
 accel/tcg/meson.build     |   2 +
 accel/tcg/perf.c          | 334 ++++++++++++++++++++++++++++++++++++++
 accel/tcg/perf.h          |  28 ++++
 accel/tcg/translate-all.c |   8 +
 docs/devel/tcg.rst        |  23 +++
 hw/core/loader.c          |   5 +
 include/tcg/tcg.h         |   4 +-
 linux-user/elfload.c      |   3 +
 linux-user/exit.c         |   2 +
 linux-user/main.c         |  15 ++
 linux-user/meson.build    |   1 +
 meson.build               |   8 +
 qemu-options.hx           |  20 +++
 softmmu/vl.c              |  11 ++
 tcg/region.c              |   2 +-
 tcg/tcg.c                 |   2 +
 18 files changed, 616 insertions(+), 3 deletions(-)
 create mode 100644 accel/tcg/debuginfo.c
 create mode 100644 accel/tcg/debuginfo.h
 create mode 100644 accel/tcg/perf.c
 create mode 100644 accel/tcg/perf.h

diff --git a/accel/tcg/debuginfo.c b/accel/tcg/debuginfo.c
new file mode 100644
index 00000000000..c312db77146
--- /dev/null
+++ b/accel/tcg/debuginfo.c
@@ -0,0 +1,99 @@
+/*
+ * Debug information support.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/lockable.h"
+
+#include <elfutils/libdwfl.h>
+
+#include "debuginfo.h"
+
+static QemuMutex lock;
+static Dwfl *dwfl;
+static const Dwfl_Callbacks dwfl_callbacks = {
+    .find_elf = NULL,
+    .find_debuginfo = dwfl_standard_find_debuginfo,
+    .section_address = NULL,
+    .debuginfo_path = NULL,
+};
+
+__attribute__((constructor))
+static void debuginfo_init(void)
+{
+    qemu_mutex_init(&lock);
+}
+
+bool debuginfo_report_elf(const char *image_name, int image_fd,
+                          unsigned long long load_bias)
+{
+    QEMU_LOCK_GUARD(&lock);
+
+    if (dwfl == NULL) {
+        dwfl = dwfl_begin(&dwfl_callbacks);
+    } else {
+        dwfl_report_begin_add(dwfl);
+    }
+
+    if (dwfl == NULL) {
+        return false;
+    }
+
+    dwfl_report_elf(dwfl, image_name, image_name, image_fd, load_bias, true);
+    dwfl_report_end(dwfl, NULL, NULL);
+    return true;
+}
+
+bool debuginfo_get_symbol(unsigned long long address,
+                          const char **symbol, unsigned long long *offset)
+{
+    Dwfl_Module *dwfl_module;
+    GElf_Off dwfl_offset;
+    GElf_Sym dwfl_sym;
+
+    QEMU_LOCK_GUARD(&lock);
+
+    if (dwfl == NULL) {
+        return false;
+    }
+
+    dwfl_module = dwfl_addrmodule(dwfl, address);
+    if (dwfl_module == NULL) {
+        return false;
+    }
+
+    *symbol = dwfl_module_addrinfo(dwfl_module, address, &dwfl_offset,
+                                   &dwfl_sym, NULL, NULL, NULL);
+    if (*symbol == NULL) {
+        return false;
+    }
+    *offset = dwfl_offset;
+    return true;
+}
+
+bool debuginfo_get_line(unsigned long long address,
+                        const char **file, int *line)
+{
+    Dwfl_Module *dwfl_module;
+    Dwfl_Line *dwfl_line;
+
+    QEMU_LOCK_GUARD(&lock);
+
+    if (dwfl == NULL) {
+        return false;
+    }
+
+    dwfl_module = dwfl_addrmodule(dwfl, address);
+    if (dwfl_module == NULL) {
+        return false;
+    }
+
+    dwfl_line = dwfl_module_getsrc(dwfl_module, address);
+    if (dwfl_line == NULL) {
+        return false;
+    }
+    *file = dwfl_lineinfo(dwfl_line, NULL, line, 0, NULL, NULL);
+    return true;
+}
diff --git a/accel/tcg/debuginfo.h b/accel/tcg/debuginfo.h
new file mode 100644
index 00000000000..d41d9d8d9b4
--- /dev/null
+++ b/accel/tcg/debuginfo.h
@@ -0,0 +1,52 @@
+/*
+ * Debug information support.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef ACCEL_TCG_DEBUGINFO_H
+#define ACCEL_TCG_DEBUGINFO_H
+
+#if defined(CONFIG_TCG) && defined(CONFIG_LIBDW)
+/*
+ * Load debuginfo for the specified guest ELF image.
+ * Return true on success, false on failure.
+ */
+bool debuginfo_report_elf(const char *image_name, int image_fd,
+                          unsigned long long load_bias);
+
+/*
+ * Find a symbol name associated with the specified guest PC.
+ * Return true on success, false if there is no associated symbol.
+ */
+bool debuginfo_get_symbol(unsigned long long address,
+                          const char **symbol, unsigned long long *offset);
+
+/*
+ * Find a line number associated with the specified guest PC.
+ * Return true on success, false if there is no associated line number.
+ */
+bool debuginfo_get_line(unsigned long long address,
+                        const char **file, int *line);
+#else
+static inline bool debuginfo_report_elf(const char *image_name, int image_fd,
+                                        unsigned long long load_bias)
+{
+    return false;
+}
+
+static inline bool debuginfo_get_symbol(unsigned long long address,
+                                        const char **symbol,
+                                        unsigned long long *offset)
+{
+    return false;
+}
+
+static inline bool debuginfo_get_line(unsigned long long address,
+                                      const char **file, int *line)
+{
+    return false;
+}
+#endif
+
+#endif
diff --git a/accel/tcg/meson.build b/accel/tcg/meson.build
index 75e1dffb4df..f916110f651 100644
--- a/accel/tcg/meson.build
+++ b/accel/tcg/meson.build
@@ -1,5 +1,6 @@
 tcg_ss = ss.source_set()
 tcg_ss.add(files(
+  'perf.c',
   'tcg-all.c',
   'cpu-exec-common.c',
   'cpu-exec.c',
@@ -12,6 +13,7 @@ tcg_ss.add(files(
 tcg_ss.add(when: 'CONFIG_USER_ONLY', if_true: files('user-exec.c'))
 tcg_ss.add(when: 'CONFIG_SOFTMMU', if_false: files('user-exec-stub.c'))
 tcg_ss.add(when: 'CONFIG_PLUGIN', if_true: [files('plugin-gen.c')])
+tcg_ss.add(when: libdw, if_true: files('debuginfo.c'))
 specific_ss.add_all(when: 'CONFIG_TCG', if_true: tcg_ss)
 
 specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files(
diff --git a/accel/tcg/perf.c b/accel/tcg/perf.c
new file mode 100644
index 00000000000..c7283406162
--- /dev/null
+++ b/accel/tcg/perf.c
@@ -0,0 +1,334 @@
+/*
+ * Linux perf perf-<pid>.map and jit-<pid>.dump integration.
+ *
+ * The jitdump spec can be found at [1].
+ *
+ * [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/tools/perf/Documentation/jitdump-specification.txt
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "elf.h"
+#include "qemu/timer.h"
+#include "tcg/tcg.h"
+
+#include "debuginfo.h"
+#include "perf.h"
+
+static FILE *safe_fopen_w(const char *path)
+{
+    int saved_errno;
+    FILE *f;
+    int fd;
+
+    /* Delete the old file, if any. */
+    unlink(path);
+
+    /* Avoid symlink attacks by using O_CREAT | O_EXCL. */
+    fd = open(path, O_RDWR | O_CREAT | O_EXCL, S_IRUSR | S_IWUSR);
+    if (fd == -1) {
+        return NULL;
+    }
+
+    /* Convert fd to FILE*. */
+    f = fdopen(fd, "w");
+    if (f == NULL) {
+        saved_errno = errno;
+        close(fd);
+        errno = saved_errno;
+        return NULL;
+    }
+
+    return f;
+}
+
+static FILE *perfmap;
+
+void perf_enable_perfmap(void)
+{
+    char map_file[32];
+
+    snprintf(map_file, sizeof(map_file), "/tmp/perf-%d.map", getpid());
+    perfmap = safe_fopen_w(map_file);
+    if (perfmap == NULL) {
+        warn_report("Could not open %s: %s, proceeding without perfmap",
+                     map_file, strerror(errno));
+    }
+}
+
+static FILE *jitdump;
+
+#define JITHEADER_MAGIC 0x4A695444
+#define JITHEADER_VERSION 1
+
+struct jitheader {
+    uint32_t magic;
+    uint32_t version;
+    uint32_t total_size;
+    uint32_t elf_mach;
+    uint32_t pad1;
+    uint32_t pid;
+    uint64_t timestamp;
+    uint64_t flags;
+};
+
+enum jit_record_type {
+    JIT_CODE_LOAD = 0,
+    JIT_CODE_DEBUG_INFO = 2,
+};
+
+struct jr_prefix {
+    uint32_t id;
+    uint32_t total_size;
+    uint64_t timestamp;
+};
+
+struct jr_code_load {
+    struct jr_prefix p;
+
+    uint32_t pid;
+    uint32_t tid;
+    uint64_t vma;
+    uint64_t code_addr;
+    uint64_t code_size;
+    uint64_t code_index;
+};
+
+struct debug_entry {
+    uint64_t addr;
+    int lineno;
+    int discrim;
+    const char name[];
+};
+
+struct jr_code_debug_info {
+    struct jr_prefix p;
+
+    uint64_t code_addr;
+    uint64_t nr_entry;
+    struct debug_entry entries[];
+};
+
+static uint32_t get_e_machine(void)
+{
+    Elf64_Ehdr elf_header;
+    FILE *exe;
+    size_t n;
+
+    QEMU_BUILD_BUG_ON(offsetof(Elf32_Ehdr, e_machine) !=
+                      offsetof(Elf64_Ehdr, e_machine));
+
+    exe = fopen("/proc/self/exe", "r");
+    if (exe == NULL) {
+        return EM_NONE;
+    }
+
+    n = fread(&elf_header, sizeof(elf_header), 1, exe);
+    fclose(exe);
+    if (n != 1) {
+        return EM_NONE;
+    }
+
+    return elf_header.e_machine;
+}
+
+void perf_enable_jitdump(void)
+{
+    struct jitheader header;
+    char jitdump_file[32];
+#ifdef CONFIG_LINUX
+    void *perf_marker;
+#endif
+
+    if (!use_rt_clock) {
+        warn_report("CLOCK_MONOTONIC is not available, proceeding without jitdump");
+        return;
+    }
+
+    snprintf(jitdump_file, sizeof(jitdump_file), "jit-%d.dump", getpid());
+    jitdump = safe_fopen_w(jitdump_file);
+    if (jitdump == NULL) {
+        warn_report("Could not open %s: %s, proceeding without jitdump",
+                     jitdump_file, strerror(errno));
+        return;
+    }
+
+#ifdef CONFIG_LINUX
+    /*
+     * `perf inject` will see that the mapped file name in the corresponding
+     * PERF_RECORD_MMAP or PERF_RECORD_MMAP2 event is of the form jit-%d.dump
+     * and will process it as a jitdump file.
+     */
+    perf_marker = mmap(NULL, qemu_real_host_page_size(), PROT_READ | PROT_EXEC,
+                       MAP_PRIVATE, fileno(jitdump), 0);
+    if (perf_marker == MAP_FAILED) {
+        warn_report("Could not map %s: %s, proceeding without jitdump",
+                     jitdump_file, strerror(errno));
+        fclose(jitdump);
+        jitdump = NULL;
+        return;
+    }
+#endif
+
+    header.magic = JITHEADER_MAGIC;
+    header.version = JITHEADER_VERSION;
+    header.total_size = sizeof(header);
+    header.elf_mach = get_e_machine();
+    header.pad1 = 0;
+    header.pid = getpid();
+    header.timestamp = get_clock();
+    header.flags = 0;
+    fwrite(&header, sizeof(header), 1, jitdump);
+}
+
+void perf_report_prologue(const void *start, size_t size)
+{
+    if (perfmap) {
+        fprintf(perfmap, "%"PRIxPTR" %zx tcg-prologue-buffer\n",
+                (uintptr_t)start, size);
+    }
+}
+
+/*
+ * Append a single line mapping to a JIT_CODE_DEBUG_INFO jitdump entry.
+ * Return 1 on success, 0 if there is no line number information for guest_pc.
+ */
+static int append_debug_entry(GArray *raw, const void *host_pc,
+                              target_ulong guest_pc)
+{
+    struct debug_entry ent;
+    const char *file;
+    int line;
+
+    if (!debuginfo_get_line(guest_pc, &file, &line)) {
+        return 0;
+    }
+
+    ent.addr = (uint64_t)host_pc;
+    ent.lineno = line;
+    ent.discrim = 0;
+    g_array_append_vals(raw, &ent, sizeof(ent));
+    g_array_append_vals(raw, file, strlen(file) + 1);
+    return 1;
+}
+
+/* Write a JIT_CODE_DEBUG_INFO jitdump entry. */
+static void write_jr_code_debug_info(const void *start, size_t size,
+                                     int icount)
+{
+    GArray *raw = g_array_new(false, false, 1);
+    struct jr_code_debug_info rec;
+    struct debug_entry ent;
+    target_ulong guest_pc;
+    const void *host_pc;
+    int insn;
+
+    /* Reserve space for the header. */
+    g_array_set_size(raw, sizeof(rec));
+
+    /* Create debug entries. */
+    rec.nr_entry = 0;
+    for (insn = 0; insn < icount; insn++) {
+        host_pc = start;
+        if (insn != 0) {
+            host_pc += tcg_ctx->gen_insn_end_off[insn - 1];
+        }
+        guest_pc = tcg_ctx->gen_insn_data[insn][0];
+        rec.nr_entry += append_debug_entry(raw, host_pc, guest_pc);
+    }
+
+    /* Trailing debug_entry. */
+    ent.addr = (uint64_t)start + size;
+    ent.lineno = 0;
+    ent.discrim = 0;
+    g_array_append_vals(raw, &ent, sizeof(ent));
+    g_array_append_vals(raw, "", 1);
+    rec.nr_entry++;
+
+    /* Create header. */
+    rec.p.id = JIT_CODE_DEBUG_INFO;
+    rec.p.total_size = raw->len;
+    rec.p.timestamp = get_clock();
+    rec.code_addr = (uint64_t)start;
+    memcpy(raw->data, &rec, sizeof(rec));
+
+    /* Flush. */
+    fwrite(raw->data, raw->len, 1, jitdump);
+    g_array_unref(raw);
+}
+
+/* Write a JIT_CODE_LOAD jitdump entry. */
+static void write_jr_code_load(const void *start, size_t size,
+                               const char *symbol, const char *suffix)
+{
+    static uint64_t code_index;
+    struct jr_code_load rec;
+    size_t suffix_size;
+    size_t name_size;
+
+    name_size = strlen(symbol);
+    suffix_size = strlen(suffix) + 1;
+    rec.p.id = JIT_CODE_LOAD;
+    rec.p.total_size = sizeof(rec) + name_size + suffix_size + size;
+    rec.p.timestamp = get_clock();
+    rec.pid = getpid();
+    rec.tid = gettid();
+    rec.vma = (uint64_t)start;
+    rec.code_addr = (uint64_t)start;
+    rec.code_size = size;
+    rec.code_index = code_index++;
+    fwrite(&rec, sizeof(rec), 1, jitdump);
+    fwrite(symbol, name_size, 1, jitdump);
+    fwrite(suffix, suffix_size, 1, jitdump);
+    fwrite(start, size, 1, jitdump);
+}
+
+void perf_report_code(const void *start, size_t size, int icount, uint64_t pc)
+{
+    char suffix[32] = "";
+    char symbol_buf[32];
+    const char *symbol;
+    unsigned long long offset;
+
+    /* Symbolize guest PC. */
+    if (perfmap || jitdump) {
+        if (!debuginfo_get_symbol(pc, &symbol, &offset)) {
+            snprintf(symbol_buf, sizeof(symbol_buf), "subject-%"PRIx64, pc);
+            symbol = symbol_buf;
+            offset = 0;
+        }
+        if (offset != 0) {
+            snprintf(suffix, sizeof(suffix), "+0x%"PRIx64, (uint64_t)offset);
+        }
+    }
+
+    /* Emit a perfmap entry if needed. */
+    if (perfmap) {
+        flockfile(perfmap);
+        fprintf(perfmap, "%"PRIxPTR" %zx %s%s\n",
+                (uintptr_t)start, size, symbol, suffix);
+        funlockfile(perfmap);
+    }
+
+    /* Emit jitdump entries if needed. */
+    if (jitdump) {
+        flockfile(jitdump);
+        write_jr_code_debug_info(start, size, icount);
+        write_jr_code_load(start, size, symbol, suffix);
+        funlockfile(jitdump);
+    }
+}
+
+void perf_exit(void)
+{
+    if (perfmap) {
+        fclose(perfmap);
+        perfmap = NULL;
+    }
+
+    if (jitdump) {
+        fclose(jitdump);
+        jitdump = NULL;
+    }
+}
diff --git a/accel/tcg/perf.h b/accel/tcg/perf.h
new file mode 100644
index 00000000000..68c80ac2fd9
--- /dev/null
+++ b/accel/tcg/perf.h
@@ -0,0 +1,28 @@
+/*
+ * Linux perf perf-<pid>.map and jit-<pid>.dump integration.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef ACCEL_TCG_PERF_H
+#define ACCEL_TCG_PERF_H
+
+#include <stddef.h>
+#include <stdint.h>
+
+/* Start writing perf-<pid>.map. */
+void perf_enable_perfmap(void);
+
+/* Start writing jit-<pid>.dump. */
+void perf_enable_jitdump(void);
+
+/* Add information about TCG prologue to profiler maps. */
+void perf_report_prologue(const void *start, size_t size);
+
+/* Add information about JITted guest code to profiler maps. */
+void perf_report_code(const void *start, size_t size, int icount, uint64_t pc);
+
+/* Stop writing perf-<pid>.map and/or jit-<pid>.dump. */
+void perf_exit(void);
+
+#endif
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index ac3ee3740cb..2e1a6dc004e 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -62,6 +62,7 @@
 #include "tb-hash.h"
 #include "tb-context.h"
 #include "internal.h"
+#include "perf.h"
 
 /* make various TB consistency checks */
 
@@ -884,6 +885,13 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     }
     tb->tc.size = gen_code_size;
 
+    /*
+     * For TARGET_TB_PCREL, attribute all executions of the generated
+     * code to its first mapping.
+     */
+    perf_report_code(tcg_splitwx_to_rx(gen_code_buf), gen_code_size,
+                     tb->icount, pc);
+
 #ifdef CONFIG_PROFILER
     qatomic_set(&prof->code_time, prof->code_time + profile_getclock() - ti);
     qatomic_set(&prof->code_in_len, prof->code_in_len + tb->size);
diff --git a/docs/devel/tcg.rst b/docs/devel/tcg.rst
index a65fb7b1c44..fa479414ddc 100644
--- a/docs/devel/tcg.rst
+++ b/docs/devel/tcg.rst
@@ -188,3 +188,26 @@ memory areas instead calls out to C code for device emulation.
 Finally, the MMU helps tracking dirty pages and pages pointed to by
 translation blocks.
 
+Profiling JITted code
+---------------------
+
+The Linux ``perf`` tool will treat all JITted code as a single block as
+unlike the main code it can't use debug information to link individual
+program counter samples with larger functions. To overcome this
+limitation you can use the ``-perfmap`` or the ``-jitdump`` option to generate
+map files. ``-perfmap`` is lightweight and produces only guest-host mappings.
+``-jitdump`` additionally saves JITed code and guest debug information (if
+available); its output needs to be integrated with the ``perf.data`` file
+before the final report can be viewed.
+
+.. code::
+
+  perf record $QEMU -perfmap $REMAINING_ARGS
+  perf report
+
+  perf record -k 1 $QEMU -jitdump $REMAINING_ARGS
+  perf inject -j -i perf.data -o perf.data.jitted
+  perf report -i perf.data.jitted
+
+Note that qemu-system generates mappings only for ``-kernel`` files in ELF
+format.
diff --git a/hw/core/loader.c b/hw/core/loader.c
index 0548830733e..55dbe2e1993 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -61,6 +61,7 @@
 #include "hw/boards.h"
 #include "qemu/cutils.h"
 #include "sysemu/runstate.h"
+#include "accel/tcg/debuginfo.h"
 
 #include <zlib.h>
 
@@ -503,6 +504,10 @@ ssize_t load_elf_ram_sym(const char *filename,
                          clear_lsb, data_swab, as, load_rom, sym_cb);
     }
 
+    if (ret != ELF_LOAD_FAILED) {
+        debuginfo_report_elf(filename, fd, 0);
+    }
+
  fail:
     close(fd);
     return ret;
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index d84bae6e3f5..cd237cdaeff 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -639,10 +639,10 @@ extern TCGv_env cpu_env;
 bool in_code_gen_buffer(const void *p);
 
 #ifdef CONFIG_DEBUG_TCG
-const void *tcg_splitwx_to_rx(void *rw);
+const void *tcg_splitwx_to_rx(const void *rw);
 void *tcg_splitwx_to_rw(const void *rx);
 #else
-static inline const void *tcg_splitwx_to_rx(void *rw)
+static inline const void *tcg_splitwx_to_rx(const void *rw)
 {
     return rw ? rw + tcg_splitwx_diff : NULL;
 }
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 20894b633f5..5928c14dfc9 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -19,6 +19,7 @@
 #include "qemu/selfmap.h"
 #include "qapi/error.h"
 #include "target_signal.h"
+#include "accel/tcg/debuginfo.h"
 
 #ifdef _ARCH_PPC64
 #undef ARCH_DLINFO
@@ -3261,6 +3262,8 @@ static void load_elf_image(const char *image_name, int image_fd,
         load_symbols(ehdr, image_fd, load_bias);
     }
 
+    debuginfo_report_elf(image_name, image_fd, load_bias);
+
     mmap_unlock();
 
     close(image_fd);
diff --git a/linux-user/exit.c b/linux-user/exit.c
index fa6ef0b9b44..607b6da9fc4 100644
--- a/linux-user/exit.c
+++ b/linux-user/exit.c
@@ -17,6 +17,7 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
+#include "accel/tcg/perf.h"
 #include "exec/gdbstub.h"
 #include "qemu.h"
 #include "user-internals.h"
@@ -38,4 +39,5 @@ void preexit_cleanup(CPUArchState *env, int code)
 #endif
         gdb_exit(code);
         qemu_plugin_user_exit();
+        perf_exit();
 }
diff --git a/linux-user/main.c b/linux-user/main.c
index a17fed045bf..4290651c3cf 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -53,6 +53,7 @@
 #include "signal-common.h"
 #include "loader.h"
 #include "user-mmap.h"
+#include "accel/tcg/perf.h"
 
 #ifdef CONFIG_SEMIHOSTING
 #include "semihosting/semihost.h"
@@ -423,6 +424,16 @@ static void handle_arg_abi_call0(const char *arg)
 }
 #endif
 
+static void handle_arg_perfmap(const char *arg)
+{
+    perf_enable_perfmap();
+}
+
+static void handle_arg_jitdump(const char *arg)
+{
+    perf_enable_jitdump();
+}
+
 static QemuPluginList plugins = QTAILQ_HEAD_INITIALIZER(plugins);
 
 #ifdef CONFIG_PLUGIN
@@ -493,6 +504,10 @@ static const struct qemu_argument arg_table[] = {
     {"xtensa-abi-call0", "QEMU_XTENSA_ABI_CALL0", false, handle_arg_abi_call0,
      "",           "assume CALL0 Xtensa ABI"},
 #endif
+    {"perfmap",    "QEMU_PERFMAP",     false, handle_arg_perfmap,
+     "",           "Generate a /tmp/perf-${pid}.map file for perf"},
+    {"jitdump",    "QEMU_JITDUMP",     false, handle_arg_jitdump,
+     "",           "Generate a jit-${pid}.dump file for perf"},
     {NULL, NULL, false, NULL, NULL, NULL}
 };
 
diff --git a/linux-user/meson.build b/linux-user/meson.build
index de4320af053..7171dc60be2 100644
--- a/linux-user/meson.build
+++ b/linux-user/meson.build
@@ -22,6 +22,7 @@ linux_user_ss.add(files(
   'uname.c',
 ))
 linux_user_ss.add(rt)
+linux_user_ss.add(libdw)
 
 linux_user_ss.add(when: 'TARGET_HAS_BFLT', if_true: files('flatload.c'))
 linux_user_ss.add(when: 'TARGET_I386', if_true: files('vm86.c'))
diff --git a/meson.build b/meson.build
index cf3e517e56d..2a736dcf7e6 100644
--- a/meson.build
+++ b/meson.build
@@ -1642,6 +1642,12 @@ if libbpf.found() and not cc.links('''
   endif
 endif
 
+# libdw
+libdw = dependency('libdw',
+                   method: 'pkg-config',
+                   kwargs: static_kwargs,
+                   required: false)
+
 #################
 # config-host.h #
 #################
@@ -1911,6 +1917,7 @@ config_host_data.set('CONFIG_DBUS_DISPLAY', dbus_display)
 config_host_data.set('CONFIG_CFI', get_option('cfi'))
 config_host_data.set('CONFIG_SELINUX', selinux.found())
 config_host_data.set('CONFIG_XEN_BACKEND', xen.found())
+config_host_data.set('CONFIG_LIBDW', libdw.found())
 if xen.found()
   # protect from xen.version() having less than three components
   xen_version = xen.version().split('.') + ['0', '0']
@@ -3970,6 +3977,7 @@ summary_info += {'libudev':           libudev}
 # Dummy dependency, keep .found()
 summary_info += {'FUSE lseek':        fuse_lseek.found()}
 summary_info += {'selinux':           selinux}
+summary_info += {'libdw':             libdw}
 summary(summary_info, bool_yn: true, section: 'Dependencies')
 
 if not supported_cpus.contains(cpu)
diff --git a/qemu-options.hx b/qemu-options.hx
index 7f99d15b231..99dd7f0e584 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4844,6 +4844,26 @@ SRST
     Enable synchronization profiling.
 ERST
 
+#ifdef CONFIG_TCG
+DEF("perfmap", 0, QEMU_OPTION_perfmap,
+    "-perfmap        generate a /tmp/perf-${pid}.map file for perf\n",
+    QEMU_ARCH_ALL)
+SRST
+``-perfmap``
+    Generate a map file for Linux perf tools that will allow basic profiling
+    information to be broken down into basic blocks.
+ERST
+
+DEF("jitdump", 0, QEMU_OPTION_jitdump,
+    "-jitdump        generate a jit-${pid}.dump file for perf\n",
+    QEMU_ARCH_ALL)
+SRST
+``-jitdump``
+    Generate a dump file for Linux perf tools that maps basic blocks to symbol
+    names, line numbers and JITted code.
+ERST
+#endif
+
 DEFHEADING()
 
 DEFHEADING(Generic object creation:)
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 5115221efe4..6ae3d874679 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -96,6 +96,9 @@
 #include "fsdev/qemu-fsdev.h"
 #endif
 #include "sysemu/qtest.h"
+#ifdef CONFIG_TCG
+#include "accel/tcg/perf.h"
+#endif
 
 #include "disas/disas.h"
 
@@ -2926,6 +2929,14 @@ void qemu_init(int argc, char **argv)
             case QEMU_OPTION_DFILTER:
                 qemu_set_dfilter_ranges(optarg, &error_fatal);
                 break;
+#ifdef CONFIG_TCG
+            case QEMU_OPTION_perfmap:
+                perf_enable_perfmap();
+                break;
+            case QEMU_OPTION_jitdump:
+                perf_enable_jitdump();
+                break;
+#endif
             case QEMU_OPTION_seed:
                 qemu_guest_random_seed_main(optarg, &error_fatal);
                 break;
diff --git a/tcg/region.c b/tcg/region.c
index 88d6bb273f1..af334c5c61d 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -83,7 +83,7 @@ bool in_code_gen_buffer(const void *p)
 }
 
 #ifdef CONFIG_DEBUG_TCG
-const void *tcg_splitwx_to_rx(void *rw)
+const void *tcg_splitwx_to_rx(const void *rw)
 {
     /* Pass NULL pointers unchanged. */
     if (rw) {
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 436fcf6ebd2..e2151a93001 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -61,6 +61,7 @@
 #include "exec/log.h"
 #include "tcg/tcg-ldst.h"
 #include "tcg-internal.h"
+#include "accel/tcg/perf.h"
 
 #ifdef CONFIG_TCG_INTERPRETER
 #include <ffi.h>
@@ -749,6 +750,7 @@ void tcg_prologue_init(TCGContext *s)
 #endif
 
     prologue_size = tcg_current_code_size(s);
+    perf_report_prologue(s->code_gen_ptr, prologue_size);
 
 #ifndef CONFIG_TCG_INTERPRETER
     flush_idcache_range((uintptr_t)tcg_splitwx_to_rx(s->code_buf),
-- 
2.37.2


