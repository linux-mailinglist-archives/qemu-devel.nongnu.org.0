Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C844AA19A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 22:09:20 +0100 (CET)
Received: from localhost ([::1]:47378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG5pX-0002VM-Be
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 16:09:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5WB-0008Bb-AW
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:49:19 -0500
Received: from [2a00:1450:4864:20::330] (port=37629
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5W8-000896-NE
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:49:18 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso10200236wmj.2
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 12:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WxxlAQjFne43H7oMKEwUdOkD0mNmEgn9CffHZbyJIkk=;
 b=UzRVsQz9zPiMKQ6ioAnEp4PADRQH/s7ScGW0iv/6zk+siafbvjvqJ6iJVTlIbSxX8j
 V4PAv9Vt43CkasVi/HSX1oWIEb1TIuXyGpkp4cXlzfi4Y8JaRlXOTdEVBv8AjGM+kVOx
 wG45zohfpFbypSUMCE9jPDCNkFlbDnRlCWjhd0T0UGKXoP9gffK5ejAiHIIiM19RAfx2
 +BRwzv7e7xfQS20OyLmmx2N6CE24uZdSEgO10NO0hYRWfi5E+jo5TWvu5ogNrxLWEeo7
 C2C8WxHlou3pgoNc8aaWSfF67YytXeAHLb0kL0MIHFOubeWDs8QPqJ7XgL9RbFt2DBgC
 OlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WxxlAQjFne43H7oMKEwUdOkD0mNmEgn9CffHZbyJIkk=;
 b=oIwx/HLeadZWW5oAnBLK4eiqtH92V0WOSrgxe7LJ9J/5qvWozDCiTIYSli/7IkmkUf
 bUMOWcTDNv7kAEAj/9WyWSFgrBvZGm6SerA9SXG5aSnw8MvbnCJZNB0pbox0UNGm/SFT
 hemBKEEZ3mA/Gfw+x2TF9Q5tuYJiCGYXF+eQT1FP+DSSAkHCGKmAK4hIZGt7hQJkVLfr
 2WpJ8pDBvzvgt55nCwh0OS7NraqD0PzAHmeOaNmICDjS54GEhBkiQz8duwJHuDPu8/c5
 8QOf4k4Y2nXpKW89jj9Com5FcHWoe2CqT1eN4mO55wIefVZqnLQik6QkofSZV0lCq4DA
 9jyA==
X-Gm-Message-State: AOAM533Gt2jNijETp8xgZCyGs7/byUQ1L8KwrcThyENCuUajFGoLOFoJ
 I77a/rz81AI+DMUKo9CPciNqmg==
X-Google-Smtp-Source: ABdhPJzse+7S+hHQiLTONxAyYrujY8VykKXDhcKvct+T9ID/BRGUOocxM5mYYK/kA+M88p52ZlS/sQ==
X-Received: by 2002:a1c:f413:: with SMTP id z19mr3725525wma.144.1644007755476; 
 Fri, 04 Feb 2022 12:49:15 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n2sm3241338wrw.63.2022.02.04.12.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 12:49:10 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6FF0D1FFCD;
 Fri,  4 Feb 2022 20:43:37 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PATCH  v3 22/26] contrib/plugins: add a drcov plugin
Date: Fri,  4 Feb 2022 20:43:31 +0000
Message-Id: <20220204204335.1689602-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220204204335.1689602-1-alex.bennee@linaro.org>
References: <20220204204335.1689602-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, Luke.Craig@ll.mit.edu,
 kuhn.chenqun@huawei.com, f4bug@amsat.org, robhenry@microsoft.com,
 aaron@os.amperecomputing.com, mahmoudabdalghany@outlook.com, minyihh@uci.edu,
 cota@braap.org, Ivanov Arkady <arkadiy.ivanov@ispras.ru>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ivanov Arkady <arkadiy.ivanov@ispras.ru>

This patch adds the ability to generate files in drcov format. Primary
goal this script is to have coverage logfiles thatwork in Lighthouse.

Signed-off-by: Ivanov Arkady <arkadiy.ivanov@ispras.ru>
Message-Id: <163491884553.304355.13246023070235438959.stgit@pc-System-Product-Name>
[AJB: use g_ptr_array instead of slist]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220124201608.604599-19-alex.bennee@linaro.org>
---
 contrib/plugins/drcov.c  | 163 +++++++++++++++++++++++++++++++++++++++
 contrib/plugins/Makefile |   1 +
 2 files changed, 164 insertions(+)
 create mode 100644 contrib/plugins/drcov.c

diff --git a/contrib/plugins/drcov.c b/contrib/plugins/drcov.c
new file mode 100644
index 0000000000..b4a855adaf
--- /dev/null
+++ b/contrib/plugins/drcov.c
@@ -0,0 +1,163 @@
+/*
+ * Copyright (C) 2021, Ivanov Arkady <arkadiy.ivanov@ispras.ru>
+ *
+ * Drcov - a DynamoRIO-based tool that collects coverage information
+ * from a binary. Primary goal this script is to have coverage log
+ * files that work in Lighthouse.
+ *
+ * License: GNU GPL, version 2 or later.
+ *   See the COPYING file in the top-level directory.
+ */
+
+#include <inttypes.h>
+#include <assert.h>
+#include <stdlib.h>
+#include <inttypes.h>
+#include <string.h>
+#include <unistd.h>
+#include <stdio.h>
+#include <glib.h>
+
+#include <qemu-plugin.h>
+
+QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
+
+static char header[] = "DRCOV VERSION: 2\n"
+                "DRCOV FLAVOR: drcov-64\n"
+                "Module Table: version 2, count 1\n"
+                "Columns: id, base, end, entry, path\n";
+
+static FILE *fp;
+static const char *file_name = "file.drcov.trace";
+static GMutex lock;
+
+typedef struct {
+    uint32_t start;
+    uint16_t size;
+    uint16_t mod_id;
+    bool     exec;
+} bb_entry_t;
+
+/* Translated blocks */
+static GPtrArray *blocks;
+
+static void printf_header(unsigned long count)
+{
+    fprintf(fp, "%s", header);
+    const char *path = qemu_plugin_path_to_binary();
+    uint64_t start_code = qemu_plugin_start_code();
+    uint64_t end_code = qemu_plugin_end_code();
+    uint64_t entry = qemu_plugin_entry_code();
+    fprintf(fp, "0, 0x%lx, 0x%lx, 0x%lx, %s\n",
+            start_code, end_code, entry, path);
+    fprintf(fp, "BB Table: %ld bbs\n", count);
+}
+
+static void printf_char_array32(uint32_t data)
+{
+    const uint8_t *bytes = (const uint8_t *)(&data);
+    fwrite(bytes, sizeof(char), sizeof(data), fp);
+}
+
+static void printf_char_array16(uint16_t data)
+{
+    const uint8_t *bytes = (const uint8_t *)(&data);
+    fwrite(bytes, sizeof(char), sizeof(data), fp);
+}
+
+
+static void printf_el(gpointer data, gpointer user_data)
+{
+    bb_entry_t *bb = (bb_entry_t *)data;
+    if (bb->exec) {
+        printf_char_array32(bb->start);
+        printf_char_array16(bb->size);
+        printf_char_array16(bb->mod_id);
+    }
+    g_free(bb);
+}
+
+static void count_block(gpointer data, gpointer user_data)
+{
+    unsigned long *count = (unsigned long *) user_data;
+    bb_entry_t *bb = (bb_entry_t *)data;
+    if (bb->exec) {
+        *count = *count + 1;
+    }
+}
+
+static void plugin_exit(qemu_plugin_id_t id, void *p)
+{
+    unsigned long count = 0;
+    g_mutex_lock(&lock);
+    g_ptr_array_foreach(blocks, count_block, &count);
+
+    /* Print function */
+    printf_header(count);
+    g_ptr_array_foreach(blocks, printf_el, NULL);
+
+    /* Clear */
+    g_ptr_array_free(blocks, true);
+
+    fclose(fp);
+
+    g_mutex_unlock(&lock);
+}
+
+static void plugin_init(void)
+{
+    fp = fopen(file_name, "wb");
+    blocks = g_ptr_array_sized_new(128);
+}
+
+static void vcpu_tb_exec(unsigned int cpu_index, void *udata)
+{
+    bb_entry_t *bb = (bb_entry_t *) udata;
+
+    g_mutex_lock(&lock);
+    bb->exec = true;
+    g_mutex_unlock(&lock);
+}
+
+static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
+{
+    uint64_t pc = qemu_plugin_tb_vaddr(tb);
+    size_t n = qemu_plugin_tb_n_insns(tb);
+
+    g_mutex_lock(&lock);
+
+    bb_entry_t *bb = g_new0(bb_entry_t, 1);
+    for (int i = 0; i < n; i++) {
+        bb->size += qemu_plugin_insn_size(qemu_plugin_tb_get_insn(tb, i));
+    }
+
+    bb->start = pc;
+    bb->mod_id = 0;
+    bb->exec = false;
+    g_ptr_array_add(blocks, bb);
+
+    g_mutex_unlock(&lock);
+    qemu_plugin_register_vcpu_tb_exec_cb(tb, vcpu_tb_exec,
+                                         QEMU_PLUGIN_CB_NO_REGS,
+                                         (void *)bb);
+
+}
+
+QEMU_PLUGIN_EXPORT
+int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
+                        int argc, char **argv)
+{
+    for (int i = 0; i < argc; i++) {
+        g_autofree char **tokens = g_strsplit(argv[i], "=", 2);
+        if (g_strcmp0(tokens[0], "filename") == 0) {
+            file_name = g_strdup(tokens[1]);
+        }
+    }
+
+    plugin_init();
+
+    qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
+    qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
+
+    return 0;
+}
diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
index 54ac5ccd9f..df3499f4f2 100644
--- a/contrib/plugins/Makefile
+++ b/contrib/plugins/Makefile
@@ -20,6 +20,7 @@ NAMES += howvec
 NAMES += lockstep
 NAMES += hwprofile
 NAMES += cache
+NAMES += drcov
 
 SONAMES := $(addsuffix .so,$(addprefix lib,$(NAMES)))
 
-- 
2.30.2


