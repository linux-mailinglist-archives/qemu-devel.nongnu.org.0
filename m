Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B934B665139
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 02:48:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFQDD-0001X2-F3; Tue, 10 Jan 2023 20:47:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pFQDB-0001Wq-DM
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 20:47:29 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pFQD8-00037z-Jd
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 20:47:29 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30B1W57k008107; Wed, 11 Jan 2023 01:47:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=DV9p3adavQ6m94/gaRVcb7TM7AlI9rXzzdF5fqTkEe4=;
 b=G765SLwwqOyBXumzenOvZX4KSI2IpcybHMgzoh4Wc8XHzXpPgxmZi88YaYUszeczK5YI
 /F7Qe3EIVAkbVsucZ04Z8I91f9GhwQTgBfIxcBgI8AcWdR/2tKpGvq/g+Hi8RkTzxn1D
 Og8d/fco1HCjCa1O1Mn5wgstXw058kTYQFcBUQj7bTRrnzVpVpyLwi17uE9Lt+iITkTl
 16ZAmqJGKIBvttQglxABga8Abn9TeGaLsZ6jefcnwpHVOgCOJBw+pMzdDY+7jYjY0wrG
 whHKkpcyboD/j7h6GE45ySwleC2HupJqGZ0i7OKJMlXHiTFOmCas7qBaDlQTkgpxSOWi Eg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n1khmr84e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jan 2023 01:47:24 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30B1WSjU010563;
 Wed, 11 Jan 2023 01:47:23 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n1khmr83e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jan 2023 01:47:23 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30B1d28F003335;
 Wed, 11 Jan 2023 01:47:21 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3n1kmtg09g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jan 2023 01:47:20 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30B1lHd852560228
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Jan 2023 01:47:17 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EAD4D20040;
 Wed, 11 Jan 2023 01:47:16 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 748D02004F;
 Wed, 11 Jan 2023 01:47:16 +0000 (GMT)
Received: from heavy.lan (unknown [9.179.23.250])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 11 Jan 2023 01:47:16 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-devel@nongnu.org, 
 Ilya Leoshkevich <iii@linux.ibm.com>,
 "Vanderson M . do Rosario" <vandersonmr2@gmail.com>
Subject: [PATCH v3 3/3] tcg: add perfmap and jitdump
Date: Wed, 11 Jan 2023 02:47:05 +0100
Message-Id: <20230111014705.2275040-4-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111014705.2275040-1-iii@linux.ibm.com>
References: <20230111014705.2275040-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GFZJsv0d3YWGV4lpqmKpagZn0Y9jbvtf
X-Proofpoint-ORIG-GUID: UHkLY-CZvqXaXuoIvfu-R6QOgFPRAdht
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-10_10,2023-01-10_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301110005
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
    DEBUGINFOD_URLS= perf inject -j -i perf.data -o perf.data.jitted
    perf report -i perf.data.jitted

Co-developed-by: Vanderson M. do Rosario <vandersonmr2@gmail.com>
Co-developed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 accel/tcg/meson.build     |   1 +
 accel/tcg/perf.c          | 366 ++++++++++++++++++++++++++++++++++++++
 accel/tcg/perf.h          |  49 +++++
 accel/tcg/translate-all.c |   8 +
 docs/devel/tcg.rst        |  23 +++
 linux-user/exit.c         |   2 +
 linux-user/main.c         |  15 ++
 qemu-options.hx           |  20 +++
 softmmu/vl.c              |  11 ++
 tcg/tcg.c                 |   2 +
 10 files changed, 497 insertions(+)
 create mode 100644 accel/tcg/perf.c
 create mode 100644 accel/tcg/perf.h

diff --git a/accel/tcg/meson.build b/accel/tcg/meson.build
index 55b3b4dd7e3..77740b1a0d7 100644
--- a/accel/tcg/meson.build
+++ b/accel/tcg/meson.build
@@ -13,6 +13,7 @@ tcg_ss.add(when: 'CONFIG_USER_ONLY', if_true: files('user-exec.c'))
 tcg_ss.add(when: 'CONFIG_SOFTMMU', if_false: files('user-exec-stub.c'))
 tcg_ss.add(when: 'CONFIG_PLUGIN', if_true: [files('plugin-gen.c')])
 tcg_ss.add(when: libdw, if_true: files('debuginfo.c'))
+tcg_ss.add(when: 'CONFIG_LINUX', if_true: files('perf.c'))
 specific_ss.add_all(when: 'CONFIG_TCG', if_true: tcg_ss)
 
 specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files(
diff --git a/accel/tcg/perf.c b/accel/tcg/perf.c
new file mode 100644
index 00000000000..427ccbe80e1
--- /dev/null
+++ b/accel/tcg/perf.c
@@ -0,0 +1,366 @@
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
+                    map_file, strerror(errno));
+    }
+}
+
+/* Get PC and size of code JITed for guest instruction #INSN. */
+static void get_host_pc_size(uintptr_t *host_pc, uint16_t *host_size,
+                             const void *start, size_t insn)
+{
+    uint16_t start_off = insn ? tcg_ctx->gen_insn_end_off[insn - 1] : 0;
+
+    if (host_pc) {
+        *host_pc = (uintptr_t)start + start_off;
+    }
+    if (host_size) {
+        *host_size = tcg_ctx->gen_insn_end_off[insn] - start_off;
+    }
+}
+
+static const char *pretty_symbol(const struct debuginfo_query *q, size_t *len)
+{
+    static __thread char buf[64];
+    int tmp;
+
+    if (!q->symbol) {
+        tmp = snprintf(buf, sizeof(buf), "guest-0x%llx", q->address);
+        if (len) {
+            *len = MIN(tmp + 1, sizeof(buf));
+        }
+        return buf;
+    }
+
+    if (!q->offset) {
+        if (len) {
+            *len = strlen(q->symbol) + 1;
+        }
+        return q->symbol;
+    }
+
+    tmp = snprintf(buf, sizeof(buf), "%s+0x%llx", q->symbol, q->offset);
+    if (len) {
+        *len = MIN(tmp + 1, sizeof(buf));
+    }
+    return buf;
+}
+
+static void write_perfmap_entry(const void *start, size_t insn,
+                                const struct debuginfo_query *q)
+{
+    uint16_t host_size;
+    uintptr_t host_pc;
+
+    get_host_pc_size(&host_pc, &host_size, start, insn);
+    fprintf(perfmap, "%"PRIxPTR" %"PRIx16" %s\n",
+            host_pc, host_size, pretty_symbol(q, NULL));
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
+    void *perf_marker;
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
+                    jitdump_file, strerror(errno));
+        return;
+    }
+
+    /*
+     * `perf inject` will see that the mapped file name in the corresponding
+     * PERF_RECORD_MMAP or PERF_RECORD_MMAP2 event is of the form jit-%d.dump
+     * and will process it as a jitdump file.
+     */
+    perf_marker = mmap(NULL, qemu_real_host_page_size(), PROT_READ | PROT_EXEC,
+                       MAP_PRIVATE, fileno(jitdump), 0);
+    if (perf_marker == MAP_FAILED) {
+        warn_report("Could not map %s: %s, proceeding without jitdump",
+                    jitdump_file, strerror(errno));
+        fclose(jitdump);
+        jitdump = NULL;
+        return;
+    }
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
+/* Write a JIT_CODE_DEBUG_INFO jitdump entry. */
+static void write_jr_code_debug_info(const void *start,
+                                     const struct debuginfo_query *q,
+                                     size_t icount)
+{
+    struct jr_code_debug_info rec;
+    struct debug_entry ent;
+    uintptr_t host_pc;
+    int insn;
+
+    /* Write the header. */
+    rec.p.id = JIT_CODE_DEBUG_INFO;
+    rec.p.total_size = sizeof(rec) + sizeof(ent) + 1;
+    rec.p.timestamp = get_clock();
+    rec.code_addr = (uintptr_t)start;
+    rec.nr_entry = 1;
+    for (insn = 0; insn < icount; insn++) {
+        if (q[insn].file) {
+            rec.p.total_size += sizeof(ent) + strlen(q[insn].file) + 1;
+            rec.nr_entry++;
+        }
+    }
+    fwrite(&rec, sizeof(rec), 1, jitdump);
+
+    /* Write the main debug entries. */
+    for (insn = 0; insn < icount; insn++) {
+        if (q[insn].file) {
+            get_host_pc_size(&host_pc, NULL, start, insn);
+            ent.addr = host_pc;
+            ent.lineno = q[insn].line;
+            ent.discrim = 0;
+            fwrite(&ent, sizeof(ent), 1, jitdump);
+            fwrite(q[insn].file, strlen(q[insn].file) + 1, 1, jitdump);
+        }
+    }
+
+    /* Write the trailing debug_entry. */
+    ent.addr = (uintptr_t)start + tcg_ctx->gen_insn_end_off[icount - 1];
+    ent.lineno = 0;
+    ent.discrim = 0;
+    fwrite(&ent, sizeof(ent), 1, jitdump);
+    fwrite("", 1, 1, jitdump);
+}
+
+/* Write a JIT_CODE_LOAD jitdump entry. */
+static void write_jr_code_load(const void *start, uint16_t host_size,
+                               const struct debuginfo_query *q)
+{
+    static uint64_t code_index;
+    struct jr_code_load rec;
+    const char *symbol;
+    size_t symbol_size;
+
+    symbol = pretty_symbol(q, &symbol_size);
+    rec.p.id = JIT_CODE_LOAD;
+    rec.p.total_size = sizeof(rec) + symbol_size + host_size;
+    rec.p.timestamp = get_clock();
+    rec.pid = getpid();
+    rec.tid = qemu_get_thread_id();
+    rec.vma = (uintptr_t)start;
+    rec.code_addr = (uintptr_t)start;
+    rec.code_size = host_size;
+    rec.code_index = code_index++;
+    fwrite(&rec, sizeof(rec), 1, jitdump);
+    fwrite(symbol, symbol_size, 1, jitdump);
+    fwrite(start, host_size, 1, jitdump);
+}
+
+void perf_report_code(unsigned long long guest_pc, size_t icount,
+                      const void *start, size_t size)
+{
+    struct debuginfo_query *q;
+    size_t insn;
+
+    if (!perfmap && !jitdump) {
+        return;
+    }
+
+    q = g_try_malloc0_n(icount, sizeof(*q));
+    if (!q) {
+        return;
+    }
+
+    debuginfo_lock();
+
+    /* Query debuginfo for each guest instruction. */
+    for (insn = 0; insn < icount; insn++) {
+        q[insn].address = tcg_ctx->gen_insn_data[insn][0] +
+                          (TARGET_TB_PCREL ? guest_pc : 0);
+        q[insn].flags = DEBUGINFO_SYMBOL | (jitdump ? DEBUGINFO_LINE : 0);
+    }
+    debuginfo_query(q, icount);
+
+    /* Emit perfmap entries if needed. */
+    if (perfmap) {
+        flockfile(perfmap);
+        for (insn = 0; insn < icount; insn++) {
+            write_perfmap_entry(start, insn, &q[insn]);
+        }
+        funlockfile(perfmap);
+    }
+
+    /* Emit jitdump entries if needed. */
+    if (jitdump) {
+        flockfile(jitdump);
+        write_jr_code_debug_info(start, q, icount);
+        write_jr_code_load(start, tcg_ctx->gen_insn_end_off[icount - 1], q);
+        funlockfile(jitdump);
+    }
+
+    debuginfo_unlock();
+    g_free(q);
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
index 00000000000..a3170c9a054
--- /dev/null
+++ b/accel/tcg/perf.h
@@ -0,0 +1,49 @@
+/*
+ * Linux perf perf-<pid>.map and jit-<pid>.dump integration.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef ACCEL_TCG_PERF_H
+#define ACCEL_TCG_PERF_H
+
+#if defined(CONFIG_TCG) && defined(CONFIG_LINUX)
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
+void perf_report_code(unsigned long long guest_pc, size_t icount,
+                      const void *start, size_t size);
+
+/* Stop writing perf-<pid>.map and/or jit-<pid>.dump. */
+void perf_exit(void);
+#else
+static inline void perf_enable_perfmap(void)
+{
+}
+
+static inline void perf_enable_jitdump(void)
+{
+}
+
+static inline void perf_report_prologue(const void *start, size_t size)
+{
+}
+
+static inline void perf_report_code(unsigned long long guest_pc, size_t icount,
+                                    const void *start, size_t size)
+{
+}
+
+static inline void perf_exit(void)
+{
+}
+#endif
+
+#endif
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 51ac1f6c84a..211afdf6567 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -62,6 +62,7 @@
 #include "tb-hash.h"
 #include "tb-context.h"
 #include "internal.h"
+#include "perf.h"
 
 /* Make sure all possible CPU event bits fit in tb->trace_vcpu_dstate */
 QEMU_BUILD_BUG_ON(CPU_TRACE_DSTATE_MAX_EVENTS >
@@ -406,6 +407,13 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     }
     tb->tc.size = gen_code_size;
 
+    /*
+     * For TARGET_TB_PCREL, attribute all executions of the generated
+     * code to its first mapping.
+     */
+    perf_report_code(pc, tb->icount,
+                     tcg_splitwx_to_rx(gen_code_buf), gen_code_size);
+
 #ifdef CONFIG_PROFILER
     qatomic_set(&prof->code_time, prof->code_time + profile_getclock() - ti);
     qatomic_set(&prof->code_in_len, prof->code_in_len + tb->size);
diff --git a/docs/devel/tcg.rst b/docs/devel/tcg.rst
index 136a7a0d962..b4096a17dfe 100644
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
+  DEBUGINFOD_URLS= perf inject -j -i perf.data -o perf.data.jitted
+  perf report -i perf.data.jitted
+
+Note that qemu-system generates mappings only for ``-kernel`` files in ELF
+format.
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
 
diff --git a/qemu-options.hx b/qemu-options.hx
index 3aa3a2f5a35..d59d19704bc 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4838,6 +4838,26 @@ SRST
     Enable synchronization profiling.
 ERST
 
+#if defined(CONFIG_TCG) && defined(CONFIG_LINUX)
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
index 9bd0e52d016..9177d95d4ec 100644
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
+#if defined(CONFIG_TCG) && defined(CONFIG_LINUX)
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
index da91779890c..9b7df71e7a0 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -61,6 +61,7 @@
 #include "exec/log.h"
 #include "tcg/tcg-ldst.h"
 #include "tcg-internal.h"
+#include "accel/tcg/perf.h"
 
 /* Forward declarations for functions declared in tcg-target.c.inc and
    used here. */
@@ -913,6 +914,7 @@ void tcg_prologue_init(TCGContext *s)
 #endif
 
     prologue_size = tcg_current_code_size(s);
+    perf_report_prologue(s->code_gen_ptr, prologue_size);
 
 #ifndef CONFIG_TCG_INTERPRETER
     flush_idcache_range((uintptr_t)tcg_splitwx_to_rx(s->code_buf),
-- 
2.39.0


