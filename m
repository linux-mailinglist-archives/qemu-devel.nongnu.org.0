Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9A6339658
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 19:25:28 +0100 (CET)
Received: from localhost ([::1]:34242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKmTX-00070J-0H
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 13:25:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKlac-0003z0-W9
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:28:43 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:41367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKlaL-0002Bk-05
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:28:42 -0500
Received: by mail-ej1-x632.google.com with SMTP id lr13so54869686ejb.8
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 09:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eRIYBL/UvBDgTYdklYBnpFFW+jkrI6mIBJA/5FnNiwo=;
 b=YWbyXKQ6eh1gJcyKn99m5zZV50Vycpt4cCKLP88F4S48R4HCyo3MDzUgmwhWaqd01G
 emsa6zI4vpnWYV/bfur/ceSGJ8pg9dyoWECAxhs8Fzik9OJTEbxA7seQOZw1s51hhqVt
 Dq7ASdQSamBMEho82c3Zp+qNV8KIlb+lxjotnNlNVcZkU3BuY7e0fk1LVyno/b1JQQMV
 AB/RqTbJjA7OGfu058qvWy2Sdt40u1dLNRvmx414ib091xAkSgwdn2+5u5ag6rF0rgOi
 8Oofaqdf3aCPotiKSTygVOkH0cKU+ypNkXFgEqrwQfHn3M5IzxuK325BaYA1SscPO/x+
 ZFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eRIYBL/UvBDgTYdklYBnpFFW+jkrI6mIBJA/5FnNiwo=;
 b=e7HdJgGIgLMg++XvcFjcabNwC3Wp6qjU0GBsH1irhhqq5ZfIjsH/DRPJjbv8e1jxzC
 zBZIO0ewiX17mZiS1FwwBqOiDVcFuXVKFYQIcRjAedUTrdOGm+4qyz1a58esLDO4x9ut
 o4YZOszM+xPsYwYwnSO4MKZ4zS2+l65dGBSL2f3xRmUKeNvj3l9PCtftYRglZ3dI8UAr
 rth80bVt95rpM7l1NQ5WRYEg79HnF4z8SNyxBPMlesK3p8OryyiFdEinxpmftNra0jHm
 eFVKn9HhF8bIq8WmZ0182a2S1G1y+vL7fkbU8/qaxnlPJwGV0LnoTA4/GfQHcW1KHVyn
 orTw==
X-Gm-Message-State: AOAM530Ij1qy0b31Mz29H1TRV49sls/AKQdMWU72EQKFofEd/LATnksL
 O5TVBdtA7Ej4XEXliDluuLpa8Q==
X-Google-Smtp-Source: ABdhPJzLVTKlmQuuSG+AgsaoKv2GP/VEEag/7HA47dpuBg5JzbmZ26DWnzB41isvGivP0tz9bl/xsA==
X-Received: by 2002:a17:906:1ecc:: with SMTP id
 m12mr9678705ejj.4.1615570103330; 
 Fri, 12 Mar 2021 09:28:23 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id qo25sm3065199ejb.93.2021.03.12.09.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 09:28:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C1DD01FF87;
 Fri, 12 Mar 2021 17:28:21 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 01/14] plugins: new syscalls plugin
Date: Fri, 12 Mar 2021 17:28:08 +0000
Message-Id: <20210312172821.31647-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312172821.31647-1-alex.bennee@linaro.org>
References: <20210312172821.31647-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Matthias Weckbecker <matthias@weckbecker.name>, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matthias Weckbecker <matthias@weckbecker.name>

This commit adds a new syscalls plugin that displays the syscalls
as they are executed and returned. This plugin outputs the number
of the syscall as well as the syscall return value.

Works in *-user only.

Essentially, this commit restores:

  https://lists.gnu.org/archive/html/qemu-devel/2018-06/msg00846.html

by using the new QEMU plugin API.

Signed-off-by: Matthias Weckbecker <matthias@weckbecker.name>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200812115816.4454-1-matthias@weckbecker.name>
---
 tests/plugin/syscall.c   | 49 ++++++++++++++++++++++++++++++++++++++++
 tests/plugin/meson.build |  2 +-
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 tests/plugin/syscall.c

diff --git a/tests/plugin/syscall.c b/tests/plugin/syscall.c
new file mode 100644
index 0000000000..53ee2ab6c4
--- /dev/null
+++ b/tests/plugin/syscall.c
@@ -0,0 +1,49 @@
+/*
+ * Copyright (C) 2020, Matthias Weckbecker <matthias@weckbecker.name>
+ *
+ * License: GNU GPL, version 2 or later.
+ *   See the COPYING file in the top-level directory.
+ */
+#include <inttypes.h>
+#include <assert.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <stdio.h>
+#include <glib.h>
+
+#include <qemu-plugin.h>
+
+QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
+
+static void vcpu_syscall(qemu_plugin_id_t id, unsigned int vcpu_index,
+                         int64_t num, uint64_t a1, uint64_t a2,
+                         uint64_t a3, uint64_t a4, uint64_t a5,
+                         uint64_t a6, uint64_t a7, uint64_t a8)
+{
+    g_autofree gchar *out = g_strdup_printf("syscall #%" PRIi64 "\n", num);
+    qemu_plugin_outs(out);
+}
+
+static void vcpu_syscall_ret(qemu_plugin_id_t id, unsigned int vcpu_idx,
+                             int64_t num, int64_t ret)
+{
+    g_autofree gchar *out;
+    out = g_strdup_printf("syscall #%" PRIi64 " returned -> %" PRIi64 "\n",
+            num, ret);
+    qemu_plugin_outs(out);
+}
+
+/* ************************************************************************* */
+
+static void plugin_exit(qemu_plugin_id_t id, void *p) {}
+
+QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
+                                           const qemu_info_t *info,
+                                           int argc, char **argv)
+{
+    qemu_plugin_register_vcpu_syscall_cb(id, vcpu_syscall);
+    qemu_plugin_register_vcpu_syscall_ret_cb(id, vcpu_syscall_ret);
+    qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
+    return 0;
+}
diff --git a/tests/plugin/meson.build b/tests/plugin/meson.build
index 1eacfa6e35..2bbfc4b19e 100644
--- a/tests/plugin/meson.build
+++ b/tests/plugin/meson.build
@@ -1,5 +1,5 @@
 t = []
-foreach i : ['bb', 'empty', 'insn', 'mem']
+foreach i : ['bb', 'empty', 'insn', 'mem', 'syscall']
   t += shared_module(i, files(i + '.c'),
                      include_directories: '../../include/qemu',
                      dependencies: glib)
-- 
2.20.1


