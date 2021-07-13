Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABCB3C7366
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 17:39:47 +0200 (CEST)
Received: from localhost ([::1]:49942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3KVe-0003wJ-3H
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 11:39:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1m3KU5-0001qs-LH
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:38:09 -0400
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:33482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1m3KU3-0003M1-AW
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:38:09 -0400
Received: by mail-lf1-x144.google.com with SMTP id t17so51083814lfq.0
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 08:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R7FlQLytGgsIjGXRhptaQZh9z7MT5kOGjTEzDp5MOt4=;
 b=EFLwVfD0b7KrxVnnE4P3eng2bu56iHawHpbDVlrIvdms/3U+4So9vwMZOQmjpyTmMK
 CsIlZSotlxR8+l9H7M0C8TZqXA/tlZ4CcZWgQfl21EpZANpD3xPoc2FwKuRiB9g0Z9ZX
 Ecxfgt2PiANG6WFEd9iLe7D3rweI2K5O3DrRbdH5hswsDSSY/VekgEK+pl24p2BaIl6d
 e2yulj7T3cj1tbwRScsrFCetVBod/ol7X3aVyqyECHLhog5UuVLTifeA3EIWZ3EiUO40
 Tb3FVPK5n7jUH57G86G1fDVkmC2coPjYat1WPnY6oLH0RIv9GpSOITnV1kHl9bK5HQHR
 LuPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R7FlQLytGgsIjGXRhptaQZh9z7MT5kOGjTEzDp5MOt4=;
 b=M+mign2Jkf9RJyt4rtQDFmbVpCuatwUjf+o5JX394S0jEiui2wnIRLWVuzmv+dQAl5
 zBTGvEud81//29q1NLkEjbhzeEUvRONhA66URGldXf6TzqxnRHpeH0q8+Gbkw5P/Jlu3
 Hv0KdgnEE36PywAIqVkFdqQacR3bIVRBq4i7/eWvPzCOB0Pvvl0Yx5hk9fdsXvcX0MUY
 WzjP8QRN3n+j4dbkevZ7mivxQaP8hbkh+r/8cBrAVLusQ4BERwRexGrqWiN2qxEpqjbt
 OwhO9VSEX2OzxPgb2Bh3b1olv94aFwVHBzS4GTSeweTKCqaJhKiJsf/AnVtZs5k6fTWo
 qV3w==
X-Gm-Message-State: AOAM532jRJMKs8iPXwzrW+bR0apziZnFxUfpZb1HiPC1sg0QCpfhrT8F
 d/Ahv2Zn3UrWEwtwSvHBpoVmAg==
X-Google-Smtp-Source: ABdhPJxNJ0MAD1SyL0Bn4E0hobwiqNHR6JzUnyaWN6MjI8STfAW/FAxbal5b/vnEXU+YhPXeYnH5Tg==
X-Received: by 2002:a19:c312:: with SMTP id t18mr4028987lff.354.1626190685797; 
 Tue, 13 Jul 2021 08:38:05 -0700 (PDT)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id i5sm131447lfv.246.2021.07.13.08.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 08:38:05 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: mst@redhat.com, yuri.benditovich@daynix.com, jasowang@redhat.com,
 armbru@redhat.com, eblake@redhat.com, berrange@redhat.com
Subject: [PATCH 3/5] qmp: Added the helper stamp check.
Date: Tue, 13 Jul 2021 18:37:56 +0300
Message-Id: <20210713153758.323614-4-andrew@daynix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210713153758.323614-1-andrew@daynix.com>
References: <20210713153758.323614-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::144;
 envelope-from=andrew@daynix.com; helo=mail-lf1-x144.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: yan@daynix.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added function to check the stamp in the helper.
eBPF helper should have a special symbol that generates during build.
QEMU checks the helper and determinates that it fits, so the helper
will produce proper output.

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 meson.build                       |  10 +
 monitor/meson.build               |   1 +
 monitor/qemu-helper-stamp-utils.c | 297 ++++++++++++++++++++++++++++++
 monitor/qemu-helper-stamp-utils.h |  24 +++
 4 files changed, 332 insertions(+)
 create mode 100644 monitor/qemu-helper-stamp-utils.c
 create mode 100644 monitor/qemu-helper-stamp-utils.h

diff --git a/meson.build b/meson.build
index 626cf932c1..257e51d91b 100644
--- a/meson.build
+++ b/meson.build
@@ -1757,6 +1757,16 @@ foreach d : hx_headers
 endforeach
 genh += hxdep
 
+helper_stamp = custom_target(
+    'qemu-helper-stamp.h',
+    output : 'qemu-helper-stamp.h',
+    input : 'ebpf/rss.bpf.skeleton.h',
+    command : [python, '-c', 'import hashlib; print(\'#define QEMU_HELPER_STAMP qemuHelperStamp_{}\'.format(hashlib.sha1(open(\'@INPUT@\', \'rb\').read()).hexdigest()))'],
+    capture: true,
+)
+
+genh += helper_stamp
+
 ###################
 # Collect sources #
 ###################
diff --git a/monitor/meson.build b/monitor/meson.build
index 6d00985ace..2b6b39549b 100644
--- a/monitor/meson.build
+++ b/monitor/meson.build
@@ -5,5 +5,6 @@ softmmu_ss.add(files(
   'hmp.c',
 ))
 softmmu_ss.add([spice_headers, files('qmp-cmds.c')])
+softmmu_ss.add(files('qemu-helper-stamp-utils.c'))
 
 specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files('misc.c'), spice])
diff --git a/monitor/qemu-helper-stamp-utils.c b/monitor/qemu-helper-stamp-utils.c
new file mode 100644
index 0000000000..d34c3b94c5
--- /dev/null
+++ b/monitor/qemu-helper-stamp-utils.c
@@ -0,0 +1,297 @@
+/*
+ * QEMU helper stamp check utils.
+ *
+ * Developed by Daynix Computing LTD (http://www.daynix.com)
+ *
+ * Authors:
+ *  Andrew Melnychenko <andrew@daynix.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Description: This file mostly implements helper stamp checking.
+ *              The stamp is implemented in a similar way as in qemu modules.
+ *              The helper should contain a specific symbol.
+ *              Not in a similar way is symbol checking - here we parse
+ *              the ELF file. For now(10.07.2021), only eBPF helper contains
+ *              the stamp, and the stamp is generated from
+ *              sha1 ebpf/rss.bpf.skeleton.h (see meson.build).
+ */
+
+#include "qemu/osdep.h"
+#include "elf.h"
+#include "qemu-helper-stamp-utils.h"
+
+#include <glib/gstdio.h>
+
+#ifdef CONFIG_LINUX
+
+static void *file_allocate_and_read(int fd, off_t off, size_t size)
+{
+    void *data;
+    int err;
+
+    if (fd < 0) {
+        return NULL;
+    }
+
+    err = lseek(fd, off, SEEK_SET);
+    if (err < 0) {
+        return NULL;
+    }
+
+    data = g_new0(char, size);
+    if (data == NULL) {
+        return NULL;
+    }
+
+    err = read(fd, data, size);
+    if (err < 0) {
+        g_free(data);
+        return NULL;
+    }
+
+    return data;
+}
+
+static Elf64_Shdr *elf64_get_section_table(int fd, Elf64_Ehdr *elf_header)
+{
+    if (elf_header == NULL) {
+        return NULL;
+    }
+    return (Elf64_Shdr *)file_allocate_and_read(fd, elf_header->e_shoff,
+                             elf_header->e_shnum * elf_header->e_shentsize);
+}
+
+static Elf32_Shdr *elf32_get_section_table(int fd, Elf32_Ehdr *elf_header)
+{
+    if (elf_header == NULL) {
+        return NULL;
+    }
+    return (Elf32_Shdr *)file_allocate_and_read(fd, elf_header->e_shoff,
+                             elf_header->e_shnum * elf_header->e_shentsize);
+}
+
+static void *elf64_get_section_data(int fd, const Elf64_Shdr* section_header)
+{
+    if (fd < 0 || section_header == NULL) {
+        return NULL;
+    }
+    return file_allocate_and_read(fd, section_header->sh_offset,
+                                  section_header->sh_size);
+}
+
+static void *elf32_get_section_data(int fd, const Elf32_Shdr* section_header)
+{
+    if (fd < 0 || section_header == NULL) {
+        return NULL;
+    }
+    return file_allocate_and_read(fd, section_header->sh_offset,
+                                  section_header->sh_size);
+}
+
+static bool elf64_check_symbol_in_symbol_table(int fd,
+                                               Elf64_Shdr *section_table,
+                                               Elf64_Shdr *symbol_section,
+                                               const char *symbol)
+{
+    Elf64_Sym *symbol_table;
+    char *string_table;
+    uint32_t i;
+    bool ret = false;
+
+    symbol_table = (Elf64_Sym *) elf64_get_section_data(fd, symbol_section);
+    if (symbol_table == NULL) {
+        return false;
+    }
+
+    string_table = (char *) elf64_get_section_data(
+            fd, section_table + symbol_section->sh_link);
+    if (string_table == NULL) {
+        g_free(symbol_table);
+        return false;
+    }
+
+    for (i = 0; i < (symbol_section->sh_size / sizeof(Elf64_Sym)); ++i) {
+        if (strncmp((string_table + symbol_table[i].st_name),
+                     symbol, strlen(symbol)) == 0)
+        {
+            ret = true;
+            break;
+        }
+    }
+
+    g_free(string_table);
+    g_free(symbol_table);
+    return ret;
+}
+
+static bool elf32_check_symbol_in_symbol_table(int fd,
+                                               Elf32_Shdr *section_table,
+                                               Elf32_Shdr *symbol_section,
+                                               const char *symbol)
+{
+    Elf32_Sym *symbol_table;
+    char *string_table;
+    uint32_t i;
+    bool ret = false;
+
+    symbol_table = (Elf32_Sym *) elf32_get_section_data(fd, symbol_section);
+    if (symbol_table == NULL) {
+        return false;
+    }
+
+    string_table = (char *) elf32_get_section_data(fd,
+                                       section_table + symbol_section->sh_link);
+    if (string_table == NULL) {
+        g_free(symbol_table);
+        return false;
+    }
+
+    for (i = 0; i < (symbol_section->sh_size / sizeof(Elf32_Sym)); ++i) {
+        if (strncmp((string_table + symbol_table[i].st_name),
+                     symbol, strlen(symbol)) == 0)
+        {
+            ret = true;
+            break;
+        }
+    }
+
+    g_free(string_table);
+    g_free(symbol_table);
+    return ret;
+}
+
+static bool elf64_check_stamp(int fd, Elf64_Ehdr *elf_header, const char *stamp)
+{
+    Elf64_Shdr *section_table;
+    size_t i;
+    bool ret = false;
+
+    section_table = elf64_get_section_table(fd, elf_header);
+    if (section_table == NULL) {
+        return false;
+    }
+
+    for (i = 0; i < elf_header->e_shnum; ++i) {
+        if ((section_table[i].sh_type == SHT_SYMTAB)
+             || (section_table[i].sh_type == SHT_DYNSYM)) {
+            if (elf64_check_symbol_in_symbol_table(fd, section_table,
+                                                   section_table + i, stamp)) {
+                ret = true;
+                break;
+            }
+        }
+    }
+
+    g_free(section_table);
+    return ret;
+}
+
+static bool elf32_check_stamp(int fd, Elf32_Ehdr *elf_header, const char *stamp)
+{
+    Elf32_Shdr *section_table;
+    size_t i;
+    bool ret = false;
+
+    section_table = elf32_get_section_table(fd, elf_header);
+    if (section_table == NULL) {
+        return false;
+    }
+
+    for (i = 0; i < elf_header->e_shnum; ++i) {
+        if ((section_table[i].sh_type == SHT_SYMTAB)
+             || (section_table[i].sh_type == SHT_DYNSYM)) {
+            if (elf32_check_symbol_in_symbol_table(fd, section_table,
+                                                   section_table + i, stamp)) {
+                ret = true;
+                break;
+            }
+        }
+    }
+
+    g_free(section_table);
+    return ret;
+}
+
+bool qemu_check_helper_stamp(const char *path, const char *stamp)
+{
+    int fd;
+    bool ret = false;
+    Elf64_Ehdr *elf_header;
+
+    fd = open(path, O_RDONLY | O_SYNC);
+    if (fd < 0) {
+        return false;
+    }
+
+    elf_header = (Elf64_Ehdr *)file_allocate_and_read(
+            fd, 0, sizeof(Elf64_Ehdr));
+    if (elf_header == NULL) {
+        goto error;
+    }
+
+    if (strncmp((char *)elf_header->e_ident, ELFMAG, SELFMAG)) {
+        g_free(elf_header);
+        goto error;
+    }
+
+    if (elf_header->e_ident[EI_CLASS] == ELFCLASS64) {
+        ret = elf64_check_stamp(fd, elf_header, stamp);
+    } else if (elf_header->e_ident[EI_CLASS] == ELFCLASS32) {
+        ret = elf32_check_stamp(fd, (Elf32_Ehdr *)elf_header, stamp);
+    }
+
+    g_free(elf_header);
+error:
+    close(fd);
+    return ret;
+}
+
+#else
+
+bool qemu_check_helper_stamp(const char *path, const char *stamp)
+{
+    return false;
+}
+
+#endif
+
+char *qemu_find_helper(const char *name, bool check_stamp)
+{
+    char *qemu_exec = NULL;
+    char *qemu_dir = NULL;
+    char *helper = NULL;
+
+    if (name == NULL) {
+        return NULL;
+    }
+
+    helper = g_build_filename(CONFIG_QEMU_HELPERDIR, name, NULL);
+    if (g_access(helper, F_OK) == 0
+        && (!check_stamp
+            || qemu_check_helper_stamp(helper, QEMU_HELPER_STAMP_STR))) {
+        return helper;
+    }
+    g_free(helper);
+
+#ifdef CONFIG_LINUX
+    qemu_exec = g_file_read_link("/proc/self/exe", NULL);
+#else
+    qemu_exec = NULL;
+#endif
+    if (qemu_exec != NULL) {
+        qemu_dir = g_path_get_dirname(qemu_exec);
+        g_free(qemu_exec);
+        helper = g_build_filename(qemu_dir, name, NULL);
+        g_free(qemu_dir);
+        if (g_access(helper, F_OK) == 0
+           && (!check_stamp
+               || qemu_check_helper_stamp(helper, QEMU_HELPER_STAMP_STR))) {
+            return helper;
+        }
+        g_free(helper);
+    }
+
+    return NULL;
+}
diff --git a/monitor/qemu-helper-stamp-utils.h b/monitor/qemu-helper-stamp-utils.h
new file mode 100644
index 0000000000..e64cf96aa6
--- /dev/null
+++ b/monitor/qemu-helper-stamp-utils.h
@@ -0,0 +1,24 @@
+/*
+ * QEMU helper stamp check utils.
+ *
+ * Developed by Daynix Computing LTD (http://www.daynix.com)
+ *
+ * Authors:
+ *  Andrew Melnychenko <andrew@daynix.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#ifndef QEMU_QEMU_HELPER_STAMP_UTILS_H
+#define QEMU_QEMU_HELPER_STAMP_UTILS_H
+
+#include "qemu-helper-stamp.h" /* generated stamp per build */
+
+#define QEMU_HELPER_STAMP_STR     stringify(QEMU_HELPER_STAMP)
+
+bool qemu_check_helper_stamp(const char *path, const char *stamp);
+
+char *qemu_find_helper(const char *name, bool check_stamp);
+
+#endif /* QEMU_QEMU_HELPER_STAMP_UTILS_H */
-- 
2.31.1


