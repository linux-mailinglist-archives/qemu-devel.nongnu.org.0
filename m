Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B12C84AA18F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 22:06:46 +0100 (CET)
Received: from localhost ([::1]:40722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG5n3-0006J1-Dt
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 16:06:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5W7-00089r-Vv
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:49:17 -0500
Received: from [2a00:1450:4864:20::32a] (port=42873
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5W5-00088j-Oe
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:49:15 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 n40-20020a05600c3ba800b00353958feb16so4470276wms.1
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 12:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=da6jV7ssI57KmcBhG8Rp7dSTF6JhOxitKuzZ72qggwU=;
 b=Vztg5W6PP2KHy+hzXnhRZdknYzLw+LVJOuPFkmP5B3tgcxebSXaSS5SvVZwEOREMBA
 23Cp72kLZ6GALG3GUBokMTrhIOgUlKozAiAuA6qFZfAPcOc58ag/sZywyH4EGpknrCSh
 NhKG10xOXe8RORkLgilFg43C+Irm4eQAr/mhmW/Owlofbd7ysYlARSZgbv9nbtEZ9xr8
 AMN/xcZRQgqJw4uAVsNBWmEhGdi+8Bsd+y6jJ80b1q8T+P+DDJZ8ar7RE3/jhDoe8PoT
 ZytVZ2I2s6kCAkLxEZ0bHmcdM4rDt4tZOivoaCZsr6AZs68d9UeL65dDMLs88PrTG4hF
 2OlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=da6jV7ssI57KmcBhG8Rp7dSTF6JhOxitKuzZ72qggwU=;
 b=ZqcINl6FcKt+BeWcRGAPk/Qr9Gj9CbbZIIKhfZjLBMBOG1879Eb5Brmifuk8xhTkfp
 B76UR5Zy1QMXc5tOJ4iUZNSVnB3FmaoGxR1jfRRBVDYiqH9DH43UX1+SLfv8PlZlkZYL
 Om5QIYUc7iZ2W0KU/cz9ul7bszxrW4KI+19ggFrDgRO56R5lEXWKH+tOuXw41lOWo4uz
 UFk4JRn4la6achJr3agArsqAMMDG6gqca/I1yB+SRTewWMXfDaDw8S8EjQCQl2MY3GbT
 cJCZ5hb/wsylDN7Ip7+Sm9uT0k+e2xs8A3JD46De8LTvHZ2jl7+QO70BBh/C7bDAn3kZ
 kYxw==
X-Gm-Message-State: AOAM532XuEgubzSpXebvT4Gd1rpXkjDAjBkqDr5fpaxQiuSOEgoXnBw/
 VIljqvPyzsinqBcejX5oAKda7g==
X-Google-Smtp-Source: ABdhPJz504u1c3cjQYMGcbmnToFWRY1uzFIgKDLpZMHuUkIPQnEmqxiEzokAHzBLaArxlLoJwhlziA==
X-Received: by 2002:a7b:c148:: with SMTP id z8mr442700wmi.38.1644007752141;
 Fri, 04 Feb 2022 12:49:12 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y15sm4262941wry.36.2022.02.04.12.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 12:49:10 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5A81E1FFCC;
 Fri,  4 Feb 2022 20:43:37 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PATCH  v3 21/26] plugins: add helper functions for coverage plugins
Date: Fri,  4 Feb 2022 20:43:30 +0000
Message-Id: <20220204204335.1689602-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220204204335.1689602-1-alex.bennee@linaro.org>
References: <20220204204335.1689602-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

Which provide information about:
- start_code.
- end_code.
- entry.
- path to the executable binary.

Signed-off-by: Ivanov Arkady <arkadiy.ivanov@ispras.ru>
Message-Id: <163491883461.304355.8210754161847179432.stgit@pc-System-Product-Name>
[AJB: reword title, better descriptions, defaults, rm export, fix include]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220124201608.604599-18-alex.bennee@linaro.org>

----
v3
  - #ifdef around loader.h to avoid BSD compile fail
---
 include/qemu/qemu-plugin.h   | 34 +++++++++++++++++++++++++
 plugins/api.c                | 48 ++++++++++++++++++++++++++++++++++++
 plugins/qemu-plugins.symbols |  4 +++
 3 files changed, 86 insertions(+)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 5f1017201f..535ddbf0ae 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -590,4 +590,38 @@ void qemu_plugin_outs(const char *string);
  */
 bool qemu_plugin_bool_parse(const char *name, const char *val, bool *ret);
 
+/**
+ * qemu_plugin_path_to_binary() - path to binary file being executed
+ *
+ * Return a string representing the path to the binary. For user-mode
+ * this is the main executable. For system emulation we currently
+ * return NULL. The user should g_free() the string once no longer
+ * needed.
+ */
+const char *qemu_plugin_path_to_binary(void);
+
+/**
+ * qemu_plugin_start_code() - returns start of text segment
+ *
+ * Returns the nominal start address of the main text segment in
+ * user-mode. Currently returns 0 for system emulation.
+ */
+uint64_t qemu_plugin_start_code(void);
+
+/**
+ * qemu_plugin_end_code() - returns end of text segment
+ *
+ * Returns the nominal end address of the main text segment in
+ * user-mode. Currently returns 0 for system emulation.
+ */
+uint64_t qemu_plugin_end_code(void);
+
+/**
+ * qemu_plugin_entry_code() - returns start address for module
+ *
+ * Returns the nominal entry address of the main text segment in
+ * user-mode. Currently returns 0 for system emulation.
+ */
+uint64_t qemu_plugin_entry_code(void);
+
 #endif /* QEMU_PLUGIN_API_H */
diff --git a/plugins/api.c b/plugins/api.c
index b143b09ce9..91e0c7074c 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -44,6 +44,11 @@
 #ifndef CONFIG_USER_ONLY
 #include "qemu/plugin-memory.h"
 #include "hw/boards.h"
+#else
+#include "qemu.h"
+#ifdef CONFIG_LINUX
+#include "loader.h"
+#endif
 #endif
 
 /* Uninstall and Reset handlers */
@@ -391,3 +396,46 @@ bool qemu_plugin_bool_parse(const char *name, const char *value, bool *ret)
 {
     return name && value && qapi_bool_parse(name, value, ret, NULL);
 }
+
+/*
+ * Binary path, start and end locations
+ */
+const char *qemu_plugin_path_to_binary(void)
+{
+    char *path = NULL;
+#ifdef CONFIG_USER_ONLY
+    TaskState *ts = (TaskState *) current_cpu->opaque;
+    path = g_strdup(ts->bprm->filename);
+#endif
+    return path;
+}
+
+uint64_t qemu_plugin_start_code(void)
+{
+    uint64_t start = 0;
+#ifdef CONFIG_USER_ONLY
+    TaskState *ts = (TaskState *) current_cpu->opaque;
+    start = ts->info->start_code;
+#endif
+    return start;
+}
+
+uint64_t qemu_plugin_end_code(void)
+{
+    uint64_t end = 0;
+#ifdef CONFIG_USER_ONLY
+    TaskState *ts = (TaskState *) current_cpu->opaque;
+    end = ts->info->end_code;
+#endif
+    return end;
+}
+
+uint64_t qemu_plugin_entry_code(void)
+{
+    uint64_t entry = 0;
+#ifdef CONFIG_USER_ONLY
+    TaskState *ts = (TaskState *) current_cpu->opaque;
+    entry = ts->info->entry;
+#endif
+    return entry;
+}
diff --git a/plugins/qemu-plugins.symbols b/plugins/qemu-plugins.symbols
index 4834756ba3..71f6c90549 100644
--- a/plugins/qemu-plugins.symbols
+++ b/plugins/qemu-plugins.symbols
@@ -1,5 +1,7 @@
 {
   qemu_plugin_bool_parse;
+  qemu_plugin_end_code;
+  qemu_plugin_entry_code;
   qemu_plugin_get_hwaddr;
   qemu_plugin_hwaddr_device_name;
   qemu_plugin_hwaddr_is_io;
@@ -17,6 +19,7 @@
   qemu_plugin_n_max_vcpus;
   qemu_plugin_n_vcpus;
   qemu_plugin_outs;
+  qemu_plugin_path_to_binary;
   qemu_plugin_register_atexit_cb;
   qemu_plugin_register_flush_cb;
   qemu_plugin_register_vcpu_exit_cb;
@@ -33,6 +36,7 @@
   qemu_plugin_register_vcpu_tb_exec_inline;
   qemu_plugin_register_vcpu_tb_trans_cb;
   qemu_plugin_reset;
+  qemu_plugin_start_code;
   qemu_plugin_tb_get_insn;
   qemu_plugin_tb_n_insns;
   qemu_plugin_tb_vaddr;
-- 
2.30.2


