Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A49CD665138
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 02:48:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFQD6-0001WS-Rg; Tue, 10 Jan 2023 20:47:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pFQD5-0001Vu-4D
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 20:47:23 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pFQD3-00037c-2w
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 20:47:22 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30B1XUvg021931; Wed, 11 Jan 2023 01:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=HScUmHQphzO6Zn2oQ8NNtFOb27WnwDC9xofZrknuI8M=;
 b=nPJU87BzNq3esIujIXnSbzyABoTx/o1YT7EWCx+H/Ba5hWNsm/8JcGIAT8X5tk4NXaTX
 2lN01NomkffT64v08Cmth0TUuvEIyKIKqgK2bI0E3yDfs3H4HddEdx+fHCahxnmyEvw8
 uKUlmlsUA3LtZivw4xSsLb3LDzD3sQ43WDbhXLjD9ZOJsx96jdZKXAO8WUryD0Ey9zMR
 ZV3kHTsbW99m7u3fwc2dk7Lxd/FmQ0DHT34bl8SJu92sMYbMUt0sLkR/x4LLsR9KS89f
 mPzm6re0mlZe17RbicAO8iv322XonxUnPTlriK8Ecl86/q349cvpIi7GeVmsScusGSl5 xQ== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n1kj607hh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jan 2023 01:47:19 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30AE2ch1023308;
 Wed, 11 Jan 2023 01:47:17 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3my0c6v497-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jan 2023 01:47:17 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30B1lDQV21889338
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Jan 2023 01:47:13 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A677A20043;
 Wed, 11 Jan 2023 01:47:13 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4984320040;
 Wed, 11 Jan 2023 01:47:13 +0000 (GMT)
Received: from heavy.lan (unknown [9.179.23.250])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 11 Jan 2023 01:47:13 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-devel@nongnu.org, 
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 2/3] accel/tcg: Add debuginfo support
Date: Wed, 11 Jan 2023 02:47:04 +0100
Message-Id: <20230111014705.2275040-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111014705.2275040-1-iii@linux.ibm.com>
References: <20230111014705.2275040-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: noorC3gljeIE-vPvr13dpTe-9T7ePrDG
X-Proofpoint-GUID: noorC3gljeIE-vPvr13dpTe-9T7ePrDG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-10_10,2023-01-10_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301110008
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add libdw-based functions for loading and querying debuginfo. Load
debuginfo from the system and the linux-user loaders.

This is useful for the upcoming perf support, which can then put
human-readable guest symbols instead of raw guest PCs into perfmap and
jitdump files.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 accel/tcg/debuginfo.c  | 96 ++++++++++++++++++++++++++++++++++++++++++
 accel/tcg/debuginfo.h  | 77 +++++++++++++++++++++++++++++++++
 accel/tcg/meson.build  |  1 +
 hw/core/loader.c       |  5 +++
 linux-user/elfload.c   |  3 ++
 linux-user/meson.build |  1 +
 meson.build            |  8 ++++
 7 files changed, 191 insertions(+)
 create mode 100644 accel/tcg/debuginfo.c
 create mode 100644 accel/tcg/debuginfo.h

diff --git a/accel/tcg/debuginfo.c b/accel/tcg/debuginfo.c
new file mode 100644
index 00000000000..fee98a8e867
--- /dev/null
+++ b/accel/tcg/debuginfo.c
@@ -0,0 +1,96 @@
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
+void debuginfo_report_elf(const char *name, int fd, unsigned long long bias)
+{
+    QEMU_LOCK_GUARD(&lock);
+
+    if (dwfl) {
+        dwfl_report_begin_add(dwfl);
+    } else {
+        dwfl = dwfl_begin(&dwfl_callbacks);
+    }
+
+    if (dwfl) {
+        dwfl_report_elf(dwfl, name, name, fd, bias, true);
+        dwfl_report_end(dwfl, NULL, NULL);
+    }
+}
+
+void debuginfo_lock(void)
+{
+    qemu_mutex_lock(&lock);
+}
+
+void debuginfo_query(struct debuginfo_query *q, size_t n)
+{
+    const char *symbol, *file;
+    Dwfl_Module *dwfl_module;
+    Dwfl_Line *dwfl_line;
+    GElf_Off dwfl_offset;
+    GElf_Sym dwfl_sym;
+    size_t i;
+    int line;
+
+    if (!dwfl) {
+        return;
+    }
+
+    for (i = 0; i < n; i++) {
+        dwfl_module = dwfl_addrmodule(dwfl, q[i].address);
+        if (!dwfl_module) {
+            continue;
+        }
+
+        if (q[i].flags & DEBUGINFO_SYMBOL) {
+            symbol = dwfl_module_addrinfo(dwfl_module, q[i].address,
+                                          &dwfl_offset, &dwfl_sym,
+                                          NULL, NULL, NULL);
+            if (symbol) {
+                q[i].symbol = symbol;
+                q[i].offset = dwfl_offset;
+            }
+        }
+
+        if (q[i].flags & DEBUGINFO_LINE) {
+            dwfl_line = dwfl_module_getsrc(dwfl_module, q[i].address);
+            if (dwfl_line) {
+                file = dwfl_lineinfo(dwfl_line, NULL, &line, 0, NULL, NULL);
+                if (file) {
+                    q[i].file = file;
+                    q[i].line = line;
+                }
+            }
+        }
+    }
+}
+
+void debuginfo_unlock(void)
+{
+    qemu_mutex_unlock(&lock);
+}
diff --git a/accel/tcg/debuginfo.h b/accel/tcg/debuginfo.h
new file mode 100644
index 00000000000..50b7a0f8471
--- /dev/null
+++ b/accel/tcg/debuginfo.h
@@ -0,0 +1,77 @@
+/*
+ * Debug information support.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef ACCEL_TCG_DEBUGINFO_H
+#define ACCEL_TCG_DEBUGINFO_H
+
+/*
+ * Debuginfo describing a certain address.
+ */
+struct debuginfo_query {
+    unsigned long long address;  /* Input: address. */
+    int flags;                   /* Input: debuginfo subset. */
+    const char *symbol;          /* Symbol that the address is part of. */
+    unsigned long long offset;   /* Offset from the symbol. */
+    const char *file;            /* Source file associated with the address. */
+    int line;                    /* Line number in the source file. */
+};
+
+/*
+ * Debuginfo subsets.
+ */
+#define DEBUGINFO_SYMBOL BIT(1)
+#define DEBUGINFO_LINE   BIT(2)
+
+#if defined(CONFIG_TCG) && defined(CONFIG_LIBDW)
+/*
+ * Load debuginfo for the specified guest ELF image.
+ * Return true on success, false on failure.
+ */
+void debuginfo_report_elf(const char *name, int fd, unsigned long long bias);
+
+/*
+ * Take the debuginfo lock.
+ */
+void debuginfo_lock(void);
+
+/*
+ * Fill each on N Qs with the debuginfo about Q->ADDRESS as specified by
+ * Q->FLAGS:
+ *
+ * - DEBUGINFO_SYMBOL: update Q->SYMBOL and Q->OFFSET. If symbol debuginfo is
+ *                     missing, then leave them as is.
+ * - DEBUINFO_LINE: update Q->FILE and Q->LINE. If line debuginfo is missing,
+ *                  then leave them as is.
+ *
+ * This function must be called under the debuginfo lock. The results can be
+ * accessed only until the debuginfo lock is released.
+ */
+void debuginfo_query(struct debuginfo_query *q, size_t n);
+
+/*
+ * Release the debuginfo lock.
+ */
+void debuginfo_unlock(void);
+#else
+static inline void debuginfo_report_elf(const char *image_name, int image_fd,
+                                        unsigned long long load_bias)
+{
+}
+
+static inline void debuginfo_lock(void)
+{
+}
+
+static inline void debuginfo_query(struct debuginfo_query *q, size_t n)
+{
+}
+
+static inline void debuginfo_unlock(void)
+{
+}
+#endif
+
+#endif
diff --git a/accel/tcg/meson.build b/accel/tcg/meson.build
index 75e1dffb4df..55b3b4dd7e3 100644
--- a/accel/tcg/meson.build
+++ b/accel/tcg/meson.build
@@ -12,6 +12,7 @@ tcg_ss.add(files(
 tcg_ss.add(when: 'CONFIG_USER_ONLY', if_true: files('user-exec.c'))
 tcg_ss.add(when: 'CONFIG_SOFTMMU', if_false: files('user-exec-stub.c'))
 tcg_ss.add(when: 'CONFIG_PLUGIN', if_true: [files('plugin-gen.c')])
+tcg_ss.add(when: libdw, if_true: files('debuginfo.c'))
 specific_ss.add_all(when: 'CONFIG_TCG', if_true: tcg_ss)
 
 specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files(
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
index 175517eafde..cab8c67d961 100644
--- a/meson.build
+++ b/meson.build
@@ -1648,6 +1648,12 @@ if libbpf.found() and not cc.links('''
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
@@ -1923,6 +1929,7 @@ config_host_data.set('CONFIG_DBUS_DISPLAY', dbus_display)
 config_host_data.set('CONFIG_CFI', get_option('cfi'))
 config_host_data.set('CONFIG_SELINUX', selinux.found())
 config_host_data.set('CONFIG_XEN_BACKEND', xen.found())
+config_host_data.set('CONFIG_LIBDW', libdw.found())
 if xen.found()
   # protect from xen.version() having less than three components
   xen_version = xen.version().split('.') + ['0', '0']
@@ -3981,6 +3988,7 @@ summary_info += {'libudev':           libudev}
 # Dummy dependency, keep .found()
 summary_info += {'FUSE lseek':        fuse_lseek.found()}
 summary_info += {'selinux':           selinux}
+summary_info += {'libdw':             libdw}
 summary(summary_info, bool_yn: true, section: 'Dependencies')
 
 if not supported_cpus.contains(cpu)
-- 
2.39.0


