Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3454A67DB
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 23:24:37 +0100 (CET)
Received: from localhost ([::1]:54956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF1Zk-0008Ue-QM
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 17:24:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExtw-0002hz-Pe
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:29:13 -0500
Received: from [2a00:1450:4864:20::329] (port=46663
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExtv-0001gm-0l
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:29:12 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 m13-20020a05600c3b0d00b00353951c3f62so2117602wms.5
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 10:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WxxlAQjFne43H7oMKEwUdOkD0mNmEgn9CffHZbyJIkk=;
 b=nd8QUAMnm+0zrxX0OSCClF36hE6wFpaUH1E69YhCdbUc3rEQcnFFgL12cgMmOv8VYB
 +y+hZ9zzazLr0dR6V4QRRWNEAFpdvlvAJBdnPW3codauR5K/pB7stLk56dyIaJWcH1ML
 uKL9rwL+c0ws9vARtlaYSzmfelA2FdNbc+AH37RoEh848cgboCx/oiXLTXTpNIPWvfM3
 XdOxDBguOSrjaMjn7ucBNQg4yzbvp/nouS+giQfaOU0JZM1ppyW8c587taLaj9nsnIHg
 rinDToXFqvlGf2l4P+Z8ko8b2PyYGU/HazEzJHyjwEe7rElYJGxEOeKJnpEUoPGrd/Xr
 Rq8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WxxlAQjFne43H7oMKEwUdOkD0mNmEgn9CffHZbyJIkk=;
 b=tiDoqx59+8wMiwvwoqHs3zUeH5NspMOrzvAu/E6yD6wHXZQZpbb88AYB91ooUn7YET
 Ginbs+JkGbYbvCFdQb0QQNU2c4jC2bP3dYhO8Cxshn0J+3ffkwWKVGiFQ/AkNTNBt7SV
 GsMq08QAGG7Z9iulTzr8PxSGSj55JZTJzy/uart0dAQThcfGX2mZf84pFO0WIlmmOW81
 i8VdXboFI3qnaTrt224bObqnFvifoAm6uDxzkPe5K57NGnOi7ikMe8Cw2c8zlbZgrOWB
 upgUnyW3T6OoVJffgclFwMsQfptZxiJgnLiUbMGOvA+iDujQ5MCJxfL1VBCzFuuK0viQ
 umxw==
X-Gm-Message-State: AOAM531080XqRzIb+KNDMiM93xk+3QBhuIlgVcHYkffSvgB2nFzyrAxi
 H+dNfr1T83P0clSQQSE0NCYpmw==
X-Google-Smtp-Source: ABdhPJw7Ktkdh8AuoQXan2xWZ4IyrFiA+svUyuYHGFuf5JNhS+1ow3fhhdF1/X2qHmcAucPccA1FSQ==
X-Received: by 2002:a05:600c:4f4e:: with SMTP id
 m14mr2871591wmq.155.1643740149666; 
 Tue, 01 Feb 2022 10:29:09 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m187sm2638932wme.25.2022.02.01.10.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 10:29:05 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C77521FFCC;
 Tue,  1 Feb 2022 18:20:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 21/25] contrib/plugins: add a drcov plugin
Date: Tue,  1 Feb 2022 18:20:46 +0000
Message-Id: <20220201182050.15087-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220201182050.15087-1-alex.bennee@linaro.org>
References: <20220201182050.15087-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 aaron@os.amperecomputing.com, robhenry@microsoft.com, f4bug@amsat.org,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Ivanov Arkady <arkadiy.ivanov@ispras.ru>, Luke.Craig@ll.mit.edu,
 pbonzini@redhat.com, kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
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


