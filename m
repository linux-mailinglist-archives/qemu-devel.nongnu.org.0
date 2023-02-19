Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D45869C156
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Feb 2023 17:39:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTmhc-0006Ou-9g; Sun, 19 Feb 2023 11:38:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pTmhY-0006O8-2Z
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 11:38:12 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pTmhV-0006ls-J4
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 11:38:11 -0500
Received: by mail-ed1-x533.google.com with SMTP id et7so3541527edb.9
 for <qemu-devel@nongnu.org>; Sun, 19 Feb 2023 08:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KXeG5Lesc64lZ0N6XEF8MFMqxfZtfauyqXJNBxusQSk=;
 b=CENDdJfF+n5gfZ2VCmcN0R1euN0Hz8NHHSlqhJDKaLm7OoxRUyESBqLJz580eObnrf
 i4vVOlBV2Gv4KSFTPbl40cK7jTliFt4N77bh6zKvfKRI5FE+vI+/c7wpNv0JW5U1MIzG
 OZ7EEC87oFoSpoIC8cpG4uYZVYTVAyj8dk1bAGV7JT1hlBLrIoL3pvQZobQEJNztwmrJ
 0XQ0G/d3p5uVBNvdmfto2t09BIRa2Sr2FMLx2EjaP7gfEyKa17NP0qdy60AYi0slFzbB
 w/hLxAC70UDh9DXMaxoUNBQ2xmWcLLZDpp52hAtSbYbWrzKjDFQ/RwgpxLAmPRacCyCn
 QQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KXeG5Lesc64lZ0N6XEF8MFMqxfZtfauyqXJNBxusQSk=;
 b=rkIuJQtuA8L2RkWVBr72iGlnNKBl0Bt1OU1S0sytRHcSYFV871Hm5banDzmCFsUdTL
 fPJsraj+DfXW8Mf25e9ID5Z4z6q40CRRn66bW5Y0fRb2LRZzkEvcH49hop7lc+25VYwZ
 B+VaAuwS/Qos+2rfP2Be9FALeHLSIR2gnhak772A107Ckj4/DdHNyD3rsTp6hvGc5A7V
 dHHKIvhmm5Fty+Zia67QIXAGyxulMTDPW1z1XRXKWNNH+2CAQp5wvZZFBkW+WvxQztia
 RyKLmJQNFlb+djj63f2lUG2eXrmr3ukQbygnPzcZXZh+PkLEgj7SaX6Ae7txme1ewNt/
 K8Wg==
X-Gm-Message-State: AO0yUKV4WRIFB/6Q5MrAgYWNDDwPVaQbA2YjJlcLyuMthtXhCw0wnuXF
 OmxyLmEi8dBrcHC0cc9lqRMGCw==
X-Google-Smtp-Source: AK7set9s4MXAAJmrgwBqr+6oiKKIvMwU00sGIFlja7GM6psL9y70F6av4PpmerfAgnXvEC1Wt+RSYw==
X-Received: by 2002:a17:907:97c3:b0:8af:ef00:b853 with SMTP id
 js3-20020a17090797c300b008afef00b853mr7098218ejc.73.1676824688208; 
 Sun, 19 Feb 2023 08:38:08 -0800 (PST)
Received: from localhost.localdomain ([193.33.38.48])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a1709066b8d00b008cdb0628991sm647516ejr.57.2023.02.19.08.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Feb 2023 08:38:06 -0800 (PST)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, armbru@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org, toke@redhat.com, mprivozn@redhat.com
Cc: yuri.benditovich@daynix.com,
	yan@daynix.com
Subject: [PATCH 3/5] qmp: Added the helper stamp check.
Date: Sun, 19 Feb 2023 18:20:58 +0200
Message-Id: <20230219162100.174318-4-andrew@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230219162100.174318-1-andrew@daynix.com>
References: <20230219162100.174318-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::533;
 envelope-from=andrew@daynix.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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

Added a function to check the stamp in the helper.
eBPF helper should have a special symbol that generates during the build.
QEMU checks the helper and determines that it fits, so the helper
will produce proper output.

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 meson.build                                |  10 +
 monitor/meson.build                        |   1 +
 monitor/qemu-ebpf-rss-helper-stamp-utils.c | 322 +++++++++++++++++++++
 monitor/qemu-ebpf-rss-helper-stamp-utils.h |  39 +++
 4 files changed, 372 insertions(+)
 create mode 100644 monitor/qemu-ebpf-rss-helper-stamp-utils.c
 create mode 100644 monitor/qemu-ebpf-rss-helper-stamp-utils.h

diff --git a/meson.build b/meson.build
index a76c855312..b409912aed 100644
--- a/meson.build
+++ b/meson.build
@@ -2868,6 +2868,16 @@ foreach d : hx_headers
 endforeach
 genh += hxdep
 
+ebpf_rss_helper_stamp = custom_target(
+    'qemu-ebpf-rss-helper-stamp.h',
+    output : 'qemu-ebpf-rss-helper-stamp.h',
+    input : 'ebpf/rss.bpf.skeleton.h',
+    command : [python, '-c', 'import hashlib; print(\'#define QEMU_EBPF_RSS_HELPER_STAMP qemuEbpfRssHelperStamp_{}\'.format(hashlib.sha1(open(\'@INPUT@\', \'rb\').read()).hexdigest()))'],
+    capture: true,
+)
+
+genh += ebpf_rss_helper_stamp
+
 ###################
 # Collect sources #
 ###################
diff --git a/monitor/meson.build b/monitor/meson.build
index ccb4d1a8e6..36de73414b 100644
--- a/monitor/meson.build
+++ b/monitor/meson.build
@@ -6,6 +6,7 @@ softmmu_ss.add(files(
   'hmp.c',
 ))
 softmmu_ss.add([spice_headers, files('qmp-cmds.c')])
+softmmu_ss.add(files('qemu-ebpf-rss-helper-stamp-utils.c'))
 
 specific_ss.add(when: 'CONFIG_SOFTMMU',
 		if_true: [files( 'hmp-cmds-target.c', 'hmp-target.c'), spice])
diff --git a/monitor/qemu-ebpf-rss-helper-stamp-utils.c b/monitor/qemu-ebpf-rss-helper-stamp-utils.c
new file mode 100644
index 0000000000..23efc36ef0
--- /dev/null
+++ b/monitor/qemu-ebpf-rss-helper-stamp-utils.c
@@ -0,0 +1,322 @@
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
+ *              the ELF file. For now, only eBPF helper contains
+ *              the stamp, and the stamp is generated from
+ *              sha1 ebpf/rss.bpf.skeleton.h (see meson.build).
+ */
+
+#include "qemu/osdep.h"
+#include "elf.h"
+#include "qemu-ebpf-rss-helper-stamp-utils.h"
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
+static bool qemu_check_helper_stamp(const char *path, const char *stamp)
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
+static bool qemu_check_helper_stamp(const char *path, const char *stamp)
+{
+    return false;
+}
+
+#endif
+
+char *qemu_find_default_ebpf_rss_helper(void)
+{
+    char *qemu_exec = NULL;
+    char *qemu_dir = NULL;
+    char *helper = NULL;
+
+    helper = g_build_filename(CONFIG_QEMU_HELPERDIR,
+            QEMU_DEFAULT_EBPF_RSS_HELPER_BIN_NAME, NULL);
+    if (g_access(helper, X_OK) == 0
+        && qemu_check_helper_stamp(helper, QEMU_EBPF_RSS_HELPER_STAMP_STR)) {
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
+        helper = g_build_filename(qemu_dir,
+                QEMU_DEFAULT_EBPF_RSS_HELPER_BIN_NAME, NULL);
+        g_free(qemu_dir);
+        if (g_access(helper, X_OK) == 0
+           && qemu_check_helper_stamp(helper, QEMU_EBPF_RSS_HELPER_STAMP_STR)) {
+            return helper;
+        }
+        g_free(helper);
+    }
+
+    return NULL;
+}
+
+char *qemu_check_suggested_ebpf_rss_helper(const char *path)
+{
+    char *helperbin = NULL;
+    struct stat statbuf; /* NOTE: use GStatBuf? */
+
+    /* check is dir or file */
+    if (g_stat(path, &statbuf) < 0) {
+        return NULL;
+    }
+
+    if (statbuf.st_mode & S_IFDIR) {
+        /* is dir */
+        helperbin = g_build_filename(path,
+                QEMU_DEFAULT_EBPF_RSS_HELPER_BIN_NAME, NULL);
+
+    } else if (statbuf.st_mode & S_IFREG) {
+        /* is file */
+        helperbin = g_strdup(path);
+    }
+
+    if (qemu_check_helper_stamp(helperbin, QEMU_EBPF_RSS_HELPER_STAMP_STR)) {
+        return helperbin;
+    }
+
+    g_free(helperbin);
+
+    return NULL;
+}
diff --git a/monitor/qemu-ebpf-rss-helper-stamp-utils.h b/monitor/qemu-ebpf-rss-helper-stamp-utils.h
new file mode 100644
index 0000000000..7490568aa1
--- /dev/null
+++ b/monitor/qemu-ebpf-rss-helper-stamp-utils.h
@@ -0,0 +1,39 @@
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
+#include "qemu-ebpf-rss-helper-stamp.h" /* generated stamp per build */
+
+#define QEMU_EBPF_RSS_HELPER_STAMP_STR     stringify(QEMU_EBPF_RSS_HELPER_STAMP)
+
+#define QEMU_DEFAULT_EBPF_RSS_HELPER_BIN_NAME "qemu-ebpf-rss-helper"
+
+/**
+ * Trying to find the helper with a valid stamp in HELPERDIR
+ * or next to the QEMU binary.
+ * @return path to the eBPF RSS helper bin or NULL(helper not found).
+ */
+char *qemu_find_default_ebpf_rss_helper(void);
+
+/**
+ * Check the helper by the suggested path. The helper should have a valid stamp.
+ * @param path - it can be either a file or directory path.
+ * For the file - checks the stamp of the file.
+ * For the directory - looks for QEMU_DEFAULT_EBPF_RSS_HELPER_BIN_NAME
+ * and checks the stamp of that file.
+ * @return path to valid eBPF RSS helper bin or NULL.
+ */
+char *qemu_check_suggested_ebpf_rss_helper(const char *path);
+
+#endif /* QEMU_QEMU_HELPER_STAMP_UTILS_H */
-- 
2.39.1


