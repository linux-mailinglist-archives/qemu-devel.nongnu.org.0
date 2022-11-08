Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9D26219CB
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 17:51:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osRnD-0003qr-W4; Tue, 08 Nov 2022 11:49:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1osRnA-0003pe-S1
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 11:49:40 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1osRn5-0001qy-OM
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 11:49:40 -0500
Received: by mail-wr1-x430.google.com with SMTP id h9so21956111wrt.0
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 08:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uU9x535hBA9H0/7B2F4VwSab2yApwGhUC89KkuwR1vM=;
 b=KSKLZlsygk5Yl+PCADVr8HCnfmBqqR5e24ybs0ZjND0qHG+E9MSkNKbuy4eYMKhVka
 rMtBCSRR0Xhw+JLa2LGLM6rjni6d0vPg3YM7jWa+x/Lt+wSGzJYkXrPeAyhqGqvi8YRW
 Xt59mzgTF64clvvFbpJXCzBXfuAUbaDSxektUJQdjB2yVeKAM1C496URWMAgHX4W9jIk
 rA9fLCayPwWVcdPIJ50S6m+Jjlxk74pgB/CtjJB5VvtWcw8B6TgEFJuZIWXQh6jUfCFb
 P2Y+ZLXG8A4sOutAUD12cf8xkbBhRKDICX4V/QheudkSf7L4TpZIRIaCC7nYxxFlbwJD
 jjrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uU9x535hBA9H0/7B2F4VwSab2yApwGhUC89KkuwR1vM=;
 b=vKOOFM8rmwjQQC0ezeAplpYuRc2FBvlHxnfXTzeQbBcnpG4Iiu8uU1msDzZdtIq26J
 rc8rYX8cbsa8/HXm5SgIgMjVhSfcRiHw/v2zD3iyleta7uGw32z8ruuJi4AslpWW7d7Z
 tFOmKTCn5Sf3Nrnc2qiNdhTofyxkIBTv6qgKu73o+AphknIZxLdiDTcvgdAaFB1R9BBW
 fYxcs8dRgns41JqT4HTvs/8po2GHaaPXomKrIN9orOlO09gQklLwZGwhSqdEq/9ZzgVF
 0+HHMtAOKG7K0f+Ozy1in4Vvj+fokOFL2l921WA5fLRxGlUpSTMBOozsOmwfhTM9/k5E
 POWg==
X-Gm-Message-State: ACrzQf0QgXsrupeSZmWxD8M5HTtQzOqZQbHrs4K/YCqX52/2GpZhhYdT
 oglgmzKD3eWqY1oz75SuLPB5lw==
X-Google-Smtp-Source: AMsMyM5oudanyBBwFKekkYI6tn0EAnSRCwAXFZzTtOtmNk/y8RbUWnPQ5gpoR2OQQWjz7CYDbgrYMA==
X-Received: by 2002:a5d:60d1:0:b0:237:46c8:1f6d with SMTP id
 x17-20020a5d60d1000000b0023746c81f6dmr20942972wrt.232.1667926173251; 
 Tue, 08 Nov 2022 08:49:33 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e4-20020adff344000000b002364c77bc96sm11088095wrp.33.2022.11.08.08.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 08:49:32 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 000F91FFB7;
 Tue,  8 Nov 2022 16:49:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Idan Horowitz <idan.horowitz@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [RFC PATCH] tests/plugins: add a new vcpu state tracking plugin
Date: Tue,  8 Nov 2022 16:49:21 +0000
Message-Id: <20221108164921.1980508-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Although we call qemu_plugin_register_vcpu_idle_cb() in the bb test we
don't really exercise the rest of the state change callbacks. Add a
new test that tests the whole API.

[AJB: I wrote this in an attempt to flush out a reproducer for #1195
although so far now joy.]

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Idan Horowitz <idan.horowitz@gmail.com>
---
 tests/plugin/vcpu.c      | 140 +++++++++++++++++++++++++++++++++++++++
 tests/plugin/meson.build |   2 +-
 2 files changed, 141 insertions(+), 1 deletion(-)
 create mode 100644 tests/plugin/vcpu.c

diff --git a/tests/plugin/vcpu.c b/tests/plugin/vcpu.c
new file mode 100644
index 0000000000..8bf9acd1df
--- /dev/null
+++ b/tests/plugin/vcpu.c
@@ -0,0 +1,140 @@
+/*
+ * Test plugin for exercising the vcpu event callbacks. These exist
+ * for when vcpus are created and destroyed (especially in linux-user
+ * where vcpu ~= thread) and when they pause and restart (generally
+ * for wfi and the like in system emulation).
+ *
+ * Copyright (c) 2022 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
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
+typedef struct {
+    uint64_t start_time_ns;
+    uint64_t idle_count;
+    uint64_t last_idle_ts;
+    uint64_t total_idle_ns;
+    uint64_t exit_time_ns;
+} VCPUData;
+
+static GMutex expand_counts_lock;
+static GArray *counts; /* array of VCPUData */
+static bool sys_emu;
+
+/*
+ * Fetch VCPU data for a given index, allocate if required.
+ */
+static VCPUData * get_vcpu_data(int cpu_index)
+{
+    if (cpu_index >= counts->len) {
+        g_mutex_lock(&expand_counts_lock);
+        counts = g_array_set_size(counts, cpu_index + 1);
+        g_mutex_unlock(&expand_counts_lock);
+    }
+    /* race if set size re-allocs? */
+    return &g_array_index(counts, VCPUData, cpu_index);
+}
+
+static uint64_t get_timestamp(void) {
+    struct timespec ts;
+    clock_gettime(CLOCK_MONOTONIC, &ts);
+    return ts.tv_sec * 1000000000LL + ts.tv_nsec;
+}
+
+static void vcpu_init(qemu_plugin_id_t id, unsigned int cpu_index)
+{
+    VCPUData *d = get_vcpu_data(cpu_index);
+    d->start_time_ns = get_timestamp();
+}
+
+static void vcpu_idle(qemu_plugin_id_t id, unsigned int cpu_index)
+{
+    VCPUData *d = get_vcpu_data(cpu_index);
+    d->last_idle_ts = get_timestamp();
+    d->idle_count++;
+}
+
+static void vcpu_resume(qemu_plugin_id_t id, unsigned int cpu_index)
+{
+    VCPUData *d = get_vcpu_data(cpu_index);
+    uint64_t now = get_timestamp();
+    d->total_idle_ns += now - d->last_idle_ts;
+}
+
+static void vcpu_exit(qemu_plugin_id_t id, unsigned int cpu_index)
+{
+    VCPUData *d = get_vcpu_data(cpu_index);
+    d->exit_time_ns = get_timestamp();
+}
+
+/*
+ * Report our final stats
+ */
+static void plugin_exit(qemu_plugin_id_t id, void *p)
+{
+    g_autoptr(GString) report = g_string_new("");
+    const char *vcpu_or_thread = sys_emu ? "vcpu" : "thread";
+    int i;
+
+    g_string_printf(report, "Exit: we had a total of %d %ss\n",
+                    counts->len, vcpu_or_thread);
+
+    for (i = 0; i < counts->len; i++) {
+        VCPUData *d = &g_array_index(counts, VCPUData, i);
+
+        /* FIXME: we never see vcpu_exit for the main thread */
+        if (!d->exit_time_ns) {
+            d->exit_time_ns = get_timestamp();
+        }
+
+        g_string_append_printf(report, "%s %d: %"PRId64" µs lifetime",
+                               vcpu_or_thread, i,
+                               (d->exit_time_ns - d->start_time_ns) / 1000);
+        if (d->idle_count) {
+            uint64_t idle_us = d->total_idle_ns / 1000;
+            uint64_t idle_avg = d->total_idle_ns / d->idle_count;
+            g_string_append_printf(report, ", %"PRId64" idles, %"
+                                   PRId64 " µs total idle time, %"
+                                   PRId64 " ns per idle",
+                                   d->idle_count, idle_us, idle_avg);
+        }
+        g_string_append_printf(report, "\n");
+    }
+    qemu_plugin_outs(report->str);
+}
+
+
+QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
+                                           const qemu_info_t *info,
+                                           int argc, char **argv)
+{
+    int entries = 2;
+
+    if (info->system_emulation) {
+        entries = info->system.max_vcpus;
+        sys_emu = true;
+    }
+
+    counts = g_array_sized_new(true, true, sizeof(VCPUData), entries);
+    g_mutex_init(&expand_counts_lock);
+
+    qemu_plugin_register_vcpu_init_cb(id, vcpu_init);
+    qemu_plugin_register_vcpu_idle_cb(id, vcpu_idle);
+    qemu_plugin_register_vcpu_resume_cb(id, vcpu_resume);
+    qemu_plugin_register_vcpu_exit_cb(id, vcpu_exit);
+
+    qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
+    return 0;
+}
diff --git a/tests/plugin/meson.build b/tests/plugin/meson.build
index 2bbfc4b19e..8c6b232183 100644
--- a/tests/plugin/meson.build
+++ b/tests/plugin/meson.build
@@ -1,5 +1,5 @@
 t = []
-foreach i : ['bb', 'empty', 'insn', 'mem', 'syscall']
+foreach i : ['bb', 'empty', 'insn', 'mem', 'syscall', 'vcpu']
   t += shared_module(i, files(i + '.c'),
                      include_directories: '../../include/qemu',
                      dependencies: glib)
-- 
2.34.1


