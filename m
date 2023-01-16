Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 749AB66D1D5
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 23:37:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHY5x-0000Zb-QE; Mon, 16 Jan 2023 17:36:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHY5v-0000WK-CA
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 17:36:47 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHY5t-0001MR-C6
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 17:36:47 -0500
Received: by mail-pl1-x62e.google.com with SMTP id c6so31692634pls.4
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 14:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vigJ4H8I9yTvudPoDwjrtTe/cdhVD5twvfghMdTYAx8=;
 b=nv1dLGr5ZC5kAN1km/4zUaevO438QQemce4MN4yDsb5yc2vQVBd8KyiFiWGkJB1WDj
 ljvESg09j/KMeV6Fw75InjMtVGgmV5VdsYSvZ5Wu1ZUnhk8Xmm12oV1jrtjS1uVt9n9b
 BDIZtU6gQDRMt7bVzKqTdOw41wh+iJmMF2zsNmjtSNTtRYfywim4att5RCZCRpxy8Hj3
 h6/Tw7aDJPRPya4OzIH55JIuhoNbRmhOToe50DyvjtBFUPe/Y34vw6/LqEjP524Zwcah
 GJt+FdsZ4+m0rmbI04YO80S/gWs+y0xv4hwks9meHiKP5DaV0OMzqQ4LkBMzcTjFeGt6
 w47g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vigJ4H8I9yTvudPoDwjrtTe/cdhVD5twvfghMdTYAx8=;
 b=U5/E/iar8wJkrq14FZxGoGCRciPdfydtwFXqY3d+kiFz5wnweUhZmpOTlKMPcK9CiH
 964dI0+GPG+aDYTPV0ftDkRF/7YMnW7q+1XAXHnSp3mxBCcdy5JdaIpFwLI+hPweaqTR
 to7l6fsv3D1IBozuCjg17nmoIHE7JegTaB7situjQOWDTiCtX8I95NAd73d4PE1vwZGY
 UWlDRds+Jz+eYEhGsDNLJrDyDtxNJbM7fvtFfLclLHz5e0oZF7+jnQrQZfOty++Fc78Q
 GiLAVfp+I00gzooMzGbqBD3kzYcCNEPKRMolM4LDjKoDCALD+xIBIoybDFEkrFajC4I+
 3X0Q==
X-Gm-Message-State: AFqh2kpsNvbVZp1LeXpqJgK/AXvH+3dt+EP3Dm0KVAdigVaFTSmlrdOA
 gu9IBz5FhQmYbpaNENlGJmv960hPTniKZxUt
X-Google-Smtp-Source: AMrXdXs8YV+cnUNxE51HqhAUuiKb4wC2+vri5c2k4XBDTaEF62YPkJgCawh180911929AA8+Vi2dpQ==
X-Received: by 2002:a17:902:8d83:b0:193:39bd:df97 with SMTP id
 v3-20020a1709028d8300b0019339bddf97mr1185900plo.14.1673908603789; 
 Mon, 16 Jan 2023 14:36:43 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a170903110300b00189f2fdbdd0sm19742492plh.234.2023.01.16.14.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 14:36:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 2/5] accel/tcg: Add debuginfo support
Date: Mon, 16 Jan 2023 12:36:34 -1000
Message-Id: <20230116223637.3512814-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230116223637.3512814-1-richard.henderson@linaro.org>
References: <20230116223637.3512814-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

Add libdw-based functions for loading and querying debuginfo. Load
debuginfo from the system and the linux-user loaders.

This is useful for the upcoming perf support, which can then put
human-readable guest symbols instead of raw guest PCs into perfmap and
jitdump files.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20230112152013.125680-3-iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build            |  8 ++++
 accel/tcg/debuginfo.h  | 77 +++++++++++++++++++++++++++++++++
 accel/tcg/debuginfo.c  | 96 ++++++++++++++++++++++++++++++++++++++++++
 hw/core/loader.c       |  5 +++
 linux-user/elfload.c   |  3 ++
 accel/tcg/meson.build  |  1 +
 linux-user/meson.build |  1 +
 7 files changed, 191 insertions(+)
 create mode 100644 accel/tcg/debuginfo.h
 create mode 100644 accel/tcg/debuginfo.c

diff --git a/meson.build b/meson.build
index 5d68a8fd23..6d212f6c8e 100644
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
@@ -3976,6 +3983,7 @@ summary_info += {'libudev':           libudev}
 # Dummy dependency, keep .found()
 summary_info += {'FUSE lseek':        fuse_lseek.found()}
 summary_info += {'selinux':           selinux}
+summary_info += {'libdw':             libdw}
 summary(summary_info, bool_yn: true, section: 'Dependencies')
 
 if not supported_cpus.contains(cpu)
diff --git a/accel/tcg/debuginfo.h b/accel/tcg/debuginfo.h
new file mode 100644
index 0000000000..7542cfe6e0
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
+    uint64_t address;    /* Input: address. */
+    int flags;           /* Input: debuginfo subset. */
+    const char *symbol;  /* Symbol that the address is part of. */
+    uint64_t offset;     /* Offset from the symbol. */
+    const char *file;    /* Source file associated with the address. */
+    int line;            /* Line number in the source file. */
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
+void debuginfo_report_elf(const char *name, int fd, uint64_t bias);
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
+                                        uint64_t load_bias)
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
diff --git a/accel/tcg/debuginfo.c b/accel/tcg/debuginfo.c
new file mode 100644
index 0000000000..71c66d04d1
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
+void debuginfo_report_elf(const char *name, int fd, uint64_t bias)
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
diff --git a/hw/core/loader.c b/hw/core/loader.c
index 0548830733..55dbe2e199 100644
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
diff --git a/accel/tcg/meson.build b/accel/tcg/meson.build
index 75e1dffb4d..55b3b4dd7e 100644
--- a/accel/tcg/meson.build
+++ b/accel/tcg/meson.build
@@ -12,6 +12,7 @@ tcg_ss.add(files(
 tcg_ss.add(when: 'CONFIG_USER_ONLY', if_true: files('user-exec.c'))
 tcg_ss.add(when: 'CONFIG_SOFTMMU', if_false: files('user-exec-stub.c'))
 tcg_ss.add(when: 'CONFIG_PLUGIN', if_true: [files('plugin-gen.c')])
+tcg_ss.add(when: libdw, if_true: files('debuginfo.c'))
 specific_ss.add_all(when: 'CONFIG_TCG', if_true: tcg_ss)
 
 specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files(
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
-- 
2.34.1


