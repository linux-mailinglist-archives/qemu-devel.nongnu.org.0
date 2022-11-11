Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA2C625D95
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 15:56:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otVRb-00074m-Hb; Fri, 11 Nov 2022 09:55:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otVRZ-00073d-EP
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 09:55:45 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otVRW-0007yI-Eq
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 09:55:44 -0500
Received: by mail-wr1-x431.google.com with SMTP id y16so6770377wrt.12
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 06:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xz/+zZudDZVBoYNxMc0z6HI0lRrD/gYGRwz0JYOqFX8=;
 b=wqB85alrjz15FAC8JVT/wxBDv23j8WuRbzxe9zLMGxDeSBmmXDT7uRts4XGwBruhLQ
 ft6gMdJK+nh/xtXIMENVeoxep2iAPqbVA0Wo2ybbejq1aEwgbYuoutwVriBSJ3Sbkm8x
 CCPCH2VqY0xz+7qxYpXSSU4OBer+aWr8CTj569ohuXuezT4oVyOxNzQitkwYmDi0xN+q
 BrojgPcASs215mUy5+2GwIBvbvgHPuSewPqVetdVXpD2bd4TZc3YAfmOJFYjZyyAhBWw
 Fl3lGOJqqp6Bl78R4RcK5lHJDEFbOP+tut3xEB6BYZrl1rZ9VhfWtW3w8PcBS5R7fy7G
 N34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xz/+zZudDZVBoYNxMc0z6HI0lRrD/gYGRwz0JYOqFX8=;
 b=WJep4GYzS2Xa3mfY35oWkcUSN377RWE2cJeMaAHbn18iRgwlRq7DRkTqhLP3ESVz/9
 PT5tT1nj4EezHXtiVVj0GRRaAH7ub50rRudOgdILVkDI62CbuI+D3i2rJ7deb6O6UdQk
 02gMqbjgQIiadpen1bgR8q5YC0heepku2FF7DKCBoygBqlNgqBO68q0yAxqgzBvrj8KA
 nFQqbpFlY+475GUR6m2tazRSihge7rSnZkRJ5srTMmqeitz3uaeA8TXqCmT12AZi2SFG
 SrFQU407TwHwCrmOJ7lWzEMKx8mHB2Zog7GrmNW8Nmy7+5uogQgS+XP9a00/+RhYiMEv
 nmoA==
X-Gm-Message-State: ANoB5pm2I38fbBR3YJmXfeyAW4de4GSLm+AKZX1Yytm0HDbpS/ugQkbm
 GcsmFyEre5004ruGdkA2DREQEA==
X-Google-Smtp-Source: AA0mqf7xDQKsjG5etjne0mle/pimD0J0pFU0JQff5P8T1OU/0Oq+rXEyh2qdFZ8DQIQDQLTwmWKQGg==
X-Received: by 2002:a05:6000:181a:b0:236:6fc5:e624 with SMTP id
 m26-20020a056000181a00b002366fc5e624mr1449175wrh.110.1668178540953; 
 Fri, 11 Nov 2022 06:55:40 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v23-20020a1cf717000000b003c6c4639ac6sm2993443wmh.34.2022.11.11.06.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 06:55:38 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D66B31FFC1;
 Fri, 11 Nov 2022 14:55:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Idan Horowitz <idan.horowitz@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [PATCH v2 09/12] tests/plugins: add a new vcpu state tracking plugin
Date: Fri, 11 Nov 2022 14:55:26 +0000
Message-Id: <20221111145529.4020801-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111145529.4020801-1-alex.bennee@linaro.org>
References: <20221111145529.4020801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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

Although we call qemu_plugin_register_vcpu_idle_cb() in the bb test we
don't really exercise the rest of the state change callbacks. Add a
new test that tests the whole API.

[AJB: I wrote this in an attempt to flush out a reproducer for #1195
although so far no joy.]

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Idan Horowitz <idan.horowitz@gmail.com>

----
v2
  - and min max tracking
  - fix { style on get_timestamp
---
 tests/plugin/vcpu.c      | 153 +++++++++++++++++++++++++++++++++++++++
 tests/plugin/meson.build |   2 +-
 2 files changed, 154 insertions(+), 1 deletion(-)
 create mode 100644 tests/plugin/vcpu.c

diff --git a/tests/plugin/vcpu.c b/tests/plugin/vcpu.c
new file mode 100644
index 0000000000..f4fa518420
--- /dev/null
+++ b/tests/plugin/vcpu.c
@@ -0,0 +1,153 @@
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
+    uint64_t min_idle_ns;
+    uint64_t max_idle_ns;
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
+static VCPUData *get_vcpu_data(int cpu_index)
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
+static uint64_t get_timestamp(void)
+{
+    struct timespec ts;
+    clock_gettime(CLOCK_MONOTONIC, &ts);
+    return ts.tv_sec * 1000000000LL + ts.tv_nsec;
+}
+
+static void vcpu_init(qemu_plugin_id_t id, unsigned int cpu_index)
+{
+    VCPUData *d = get_vcpu_data(cpu_index);
+    d->start_time_ns = get_timestamp();
+    d->min_idle_ns = UINT64_MAX;
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
+    uint64_t delta = now - d->last_idle_ts;
+    d->total_idle_ns += delta;
+    if (delta > d->max_idle_ns) {
+        d->max_idle_ns = delta;
+    } else if (delta < d->min_idle_ns) {
+        d->min_idle_ns = delta;
+    }
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
+                                   PRId64 " ns min, %"
+                                   PRId64 " ns max, %"
+                                   PRId64 " ns per idle",
+                                   d->idle_count, idle_us,
+                                   d->min_idle_ns, d->max_idle_ns, idle_avg);
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


