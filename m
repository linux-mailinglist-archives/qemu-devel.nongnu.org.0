Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D32B5FC01D
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 07:27:41 +0200 (CEST)
Received: from localhost ([::1]:37456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiUHL-0003Mp-9j
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 01:27:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oiU98-0005tL-El
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 01:19:10 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:28932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oiU95-0000yk-1d
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 01:19:10 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29C3c7vd001067;
 Wed, 12 Oct 2022 05:19:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=QF5wnWAG911xYtp/K6gnUlTfUsyHJPs1Nl5f3zrGNpY=;
 b=UYxPu7L736NbBLxzCvfkU6jpHBdHoiIdJZ2hsWGpN5qgFr/NlJ6OdOqqdtEQISaiWcPk
 G9qQXhCbs5Y4q1LGYPQAbNzsnJIoAoTU0OUg+opZmrfKG0yB9fjZ7Q8ZL4cLlPYFXSvW
 b6u5HUA1/KD3YenFgPpA6DNELi00+R27E5fHYrkmiheqvOrxyuowHlt/nuQzQKPZGlcy
 H5vhkxRDdW9kH0SJHMA38Oscy1NdvqZ+yLM6nyC3LhtY4MzEhjkJ9FMqJFoA/9PrHggR
 Uy19UjcgLZZigP4bp5ap6zArE/miXuxg1CTNDpw6R1U3xlMpHoerYnMOXbEb5Fge45XG Fg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k5j4kf2h2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 05:19:03 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29C4oKD5028686;
 Wed, 12 Oct 2022 05:19:03 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k5j4kf2gd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 05:19:02 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29C5HWbp021986;
 Wed, 12 Oct 2022 05:19:01 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 3k30fj42vf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 05:19:00 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 29C5JTEP53281032
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Oct 2022 05:19:29 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BAC8CAE051;
 Wed, 12 Oct 2022 05:18:57 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59CBDAE045;
 Wed, 12 Oct 2022 05:18:57 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.39.72])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 Oct 2022 05:18:57 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "Vanderson M . do Rosario" <vandersonmr2@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 1/1] tcg: add perfmap and jitdump
Date: Wed, 12 Oct 2022 07:18:46 +0200
Message-Id: <20221012051846.1432050-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221012051846.1432050-1-iii@linux.ibm.com>
References: <20221012051846.1432050-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wAIBkj9XeYHGcHD4KqDjWkZM0FPinxQF
X-Proofpoint-ORIG-GUID: oRv6xBkBuavEFRFKCOTpW1xbvdaGIZHQ
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_01,2022-10-11_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210120033
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 accel/tcg/debuginfo.c     | 108 +++++++++++++
 accel/tcg/debuginfo.h     |  54 +++++++
 accel/tcg/meson.build     |   2 +
 accel/tcg/perf.c          | 333 ++++++++++++++++++++++++++++++++++++++
 accel/tcg/perf.h          |  28 ++++
 accel/tcg/translate-all.c |   3 +
 docs/devel/tcg.rst        |  20 +++
 linux-user/elfload.c      |   3 +
 linux-user/exit.c         |   2 +
 linux-user/main.c         |  15 ++
 linux-user/meson.build    |   1 +
 meson.build               |   8 +
 qemu-options.hx           |  20 +++
 softmmu/vl.c              |  11 ++
 tcg/tcg.c                 |   2 +
 15 files changed, 610 insertions(+)
 create mode 100644 accel/tcg/debuginfo.c
 create mode 100644 accel/tcg/debuginfo.h
 create mode 100644 accel/tcg/perf.c
 create mode 100644 accel/tcg/perf.h

diff --git a/accel/tcg/debuginfo.c b/accel/tcg/debuginfo.c
new file mode 100644
index 0000000000..904eb23103
--- /dev/null
+++ b/accel/tcg/debuginfo.c
@@ -0,0 +1,108 @@
+/*
+ * Debug information support.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
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
+                          target_ulong load_bias)
+{
+    qemu_mutex_lock(&lock);
+
+    if (dwfl == NULL) {
+        dwfl = dwfl_begin(&dwfl_callbacks);
+    } else {
+        dwfl_report_begin_add(dwfl);
+    }
+
+    if (dwfl == NULL) {
+        qemu_mutex_unlock(&lock);
+        return false;
+    }
+
+    dwfl_report_elf(dwfl, image_name, image_name, image_fd, load_bias, true);
+    dwfl_report_end(dwfl, NULL, NULL);
+    qemu_mutex_unlock(&lock);
+    return true;
+}
+
+bool debuginfo_get_symbol(target_ulong address,
+                          const char **symbol, target_ulong *offset)
+{
+    Dwfl_Module *dwfl_module;
+    GElf_Off dwfl_offset;
+    GElf_Sym dwfl_sym;
+
+    qemu_mutex_lock(&lock);
+
+    if (dwfl == NULL) {
+        qemu_mutex_unlock(&lock);
+        return false;
+    }
+
+    dwfl_module = dwfl_addrmodule(dwfl, address);
+    if (dwfl_module == NULL) {
+        qemu_mutex_unlock(&lock);
+        return false;
+    }
+
+    *symbol = dwfl_module_addrinfo(dwfl_module, address, &dwfl_offset,
+                                   &dwfl_sym, NULL, NULL, NULL);
+    if (*symbol == NULL) {
+        qemu_mutex_unlock(&lock);
+        return false;
+    }
+    *offset = dwfl_offset;
+    qemu_mutex_unlock(&lock);
+    return true;
+}
+
+bool debuginfo_get_line(target_ulong address,
+                        const char **file, int *line)
+{
+    Dwfl_Module *dwfl_module;
+    Dwfl_Line *dwfl_line;
+
+    qemu_mutex_lock(&lock);
+
+    if (dwfl == NULL) {
+        qemu_mutex_unlock(&lock);
+        return false;
+    }
+
+    dwfl_module = dwfl_addrmodule(dwfl, address);
+    if (dwfl_module == NULL) {
+        qemu_mutex_unlock(&lock);
+        return false;
+    }
+
+    dwfl_line = dwfl_module_getsrc(dwfl_module, address);
+    if (dwfl_line == NULL) {
+        qemu_mutex_unlock(&lock);
+        return false;
+    }
+    *file = dwfl_lineinfo(dwfl_line, NULL, line, 0, NULL, NULL);
+    qemu_mutex_unlock(&lock);
+    return true;
+}
diff --git a/accel/tcg/debuginfo.h b/accel/tcg/debuginfo.h
new file mode 100644
index 0000000000..f4f22aa786
--- /dev/null
+++ b/accel/tcg/debuginfo.h
@@ -0,0 +1,54 @@
+/*
+ * Debug information support.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef ACCEL_TCG_DEBUGINFO_H
+#define ACCEL_TCG_DEBUGINFO_H
+
+#include "exec/cpu-defs.h"
+
+#ifdef CONFIG_LIBDW
+/*
+ * Load debuginfo for the specified guest ELF image.
+ * Return true on success, false on failure.
+ */
+bool debuginfo_report_elf(const char *image_name, int image_fd,
+                          target_ulong load_bias);
+
+/*
+ * Find a symbol name associated with the specified guest PC.
+ * Return true on success, false if there is no associated symbol.
+ */
+bool debuginfo_get_symbol(target_ulong address,
+                          const char **symbol, target_ulong *offset);
+
+/*
+ * Find a line number associated with the specified guest PC.
+ * Return true on success, false if there is no associated line number.
+ */
+bool debuginfo_get_line(target_ulong address,
+                        const char **file, int *line);
+#else
+static inline bool debuginfo_report_elf(const char *image_name, int image_fd,
+                                        target_ulong load_bias)
+{
+    return false;
+}
+
+static inline bool debuginfo_get_symbol(target_ulong address,
+                                        const char **symbol,
+                                        target_ulong *offset)
+{
+    return false;
+}
+
+static inline bool debuginfo_get_line(target_ulong address,
+                                      const char **file, int *line)
+{
+    return false;
+}
+#endif
+
+#endif
diff --git a/accel/tcg/meson.build b/accel/tcg/meson.build
index 7a0a79d731..e206e3471b 100644
--- a/accel/tcg/meson.build
+++ b/accel/tcg/meson.build
@@ -1,5 +1,6 @@
 tcg_ss = ss.source_set()
 tcg_ss.add(files(
+  'perf.c',
   'tcg-all.c',
   'cpu-exec-common.c',
   'cpu-exec.c',
@@ -11,6 +12,7 @@ tcg_ss.add(files(
 tcg_ss.add(when: 'CONFIG_USER_ONLY', if_true: files('user-exec.c'))
 tcg_ss.add(when: 'CONFIG_SOFTMMU', if_false: files('user-exec-stub.c'))
 tcg_ss.add(when: 'CONFIG_PLUGIN', if_true: [files('plugin-gen.c')])
+tcg_ss.add(when: libdw, if_true: files('debuginfo.c'))
 specific_ss.add_all(when: 'CONFIG_TCG', if_true: tcg_ss)
 
 specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files(
diff --git a/accel/tcg/perf.c b/accel/tcg/perf.c
new file mode 100644
index 0000000000..80b5a1bf8b
--- /dev/null
+++ b/accel/tcg/perf.c
@@ -0,0 +1,333 @@
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
+void perf_report_prologue(void *start, size_t size)
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
+static int append_debug_entry(GArray *raw, void *host_pc,
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
+static void write_jr_code_debug_info(void *start, size_t size, int icount)
+{
+    GArray *raw = g_array_new(false, false, 1);
+    struct jr_code_debug_info rec;
+    struct debug_entry ent;
+    target_ulong guest_pc;
+    void *host_pc;
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
+static void write_jr_code_load(void *start, size_t size,
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
+void perf_report_code(void *start, size_t size, int icount, uint64_t pc)
+{
+    char suffix[32] = "";
+    char symbol_buf[32];
+    const char *symbol;
+    target_ulong offset;
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
index 0000000000..df54be9ccd
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
+void perf_report_prologue(void *start, size_t size);
+
+/* Add information about JITted guest code to profiler maps. */
+void perf_report_code(void *start, size_t size, int icount, uint64_t pc);
+
+/* Stop writing perf-<pid>.map and/or jit-<pid>.dump. */
+void perf_exit(void);
+
+#endif
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 4ed75a13e1..b9e8d8066f 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -62,6 +62,7 @@
 #include "tb-hash.h"
 #include "tb-context.h"
 #include "internal.h"
+#include "perf.h"
 
 /* #define DEBUG_TB_INVALIDATE */
 /* #define DEBUG_TB_FLUSH */
@@ -1492,6 +1493,8 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     }
     tb->tc.size = gen_code_size;
 
+    perf_report_code(gen_code_buf, gen_code_size, tb->icount, tb->pc);
+
 #ifdef CONFIG_PROFILER
     qatomic_set(&prof->code_time, prof->code_time + profile_getclock() - ti);
     qatomic_set(&prof->code_in_len, prof->code_in_len + tb->size);
diff --git a/docs/devel/tcg.rst b/docs/devel/tcg.rst
index a65fb7b1c4..63e42b0426 100644
--- a/docs/devel/tcg.rst
+++ b/docs/devel/tcg.rst
@@ -188,3 +188,23 @@ memory areas instead calls out to C code for device emulation.
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
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 20894b633f..5928c14dfc 100644
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
index fa6ef0b9b4..607b6da9fc 100644
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
index a17fed045b..4290651c3c 100644
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
index de4320af05..7171dc60be 100644
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
index b686dfef75..be625efcc5 100644
--- a/meson.build
+++ b/meson.build
@@ -1631,6 +1631,12 @@ if libbpf.found() and not cc.links('''
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
@@ -1897,6 +1903,7 @@ config_host_data.set('CONFIG_DBUS_DISPLAY', dbus_display)
 config_host_data.set('CONFIG_CFI', get_option('cfi'))
 config_host_data.set('CONFIG_SELINUX', selinux.found())
 config_host_data.set('CONFIG_XEN_BACKEND', xen.found())
+config_host_data.set('CONFIG_LIBDW', libdw.found())
 if xen.found()
   # protect from xen.version() having less than three components
   xen_version = xen.version().split('.') + ['0', '0']
@@ -3937,6 +3944,7 @@ summary_info += {'libudev':           libudev}
 # Dummy dependency, keep .found()
 summary_info += {'FUSE lseek':        fuse_lseek.found()}
 summary_info += {'selinux':           selinux}
+summary_info += {'libdw':             libdw}
 summary(summary_info, bool_yn: true, section: 'Dependencies')
 
 if not supported_cpus.contains(cpu)
diff --git a/qemu-options.hx b/qemu-options.hx
index 95b998a13b..b0c64c4a31 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4799,6 +4799,26 @@ SRST
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
index b464da25bc..40e371a0c2 100644
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
 
@@ -2900,6 +2903,14 @@ void qemu_init(int argc, char **argv)
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
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 612a12f58f..cd1ccf2bff 100644
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


