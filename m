Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A06E1497DC5
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 12:19:08 +0100 (CET)
Received: from localhost ([::1]:41426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBxNL-0002Es-7I
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 06:19:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <bounces+23648303-31c4-qemu-devel=nongnu.org@em7421.svin.in>)
 id 1nBxLt-00019X-O8
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 06:17:37 -0500
Received: from wrqvvpzp.outbound-mail.sendgrid.net ([149.72.131.227]:36606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <bounces+23648303-31c4-qemu-devel=nongnu.org@em7421.svin.in>)
 id 1nBxLn-00089O-Ht
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 06:17:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svin.in;
 h=from:subject:mime-version:content-transfer-encoding:to:cc:
 content-type;
 s=s1; bh=Veh8eaHfGDxpGBSXxmvhs25UyWCr8QCmzh5tQePbVhc=;
 b=lM/DwVzKLu9prwL/sNJyFskLNB6VOQLsWZ5nqB7l5fKa1yCiElmxEYS/5zv9ljZ+CqtH
 ggdl0If0DIHahdrykStJBgVkX5LM/kkQG6AgmURx2iAf0BY2okMmXCBCPQe4T2/MdUHmMA
 CCVH0PYcbV+mGsWzeiZKkTmo7szJG5VEFKU6w9npmShvxTZ2i6E/HG4qt4df7YUDRbRKc9
 UUZE/lAOVNG7HW9G2MQZ2+K0ZzjV5QVVeaJ4bGybj2ocvQ2KRFX90foZkhBXXo0QLDxRS8
 1VMZMz+wP/Z4n7VxEo8OCIGKUBXMREaR3EVGyHG6PIGSxN6rsbI1WQgOqAVXtWNQ==
Received: by filterdrecv-55446c4d49-vth2g with SMTP id
 filterdrecv-55446c4d49-vth2g-1-61EE8AAD-1C
 2022-01-24 11:17:01.462767719 +0000 UTC m=+12488213.302091489
Received: from ne2.svin.in (unknown) by geopod-ismtpd-canary-0 (SG) with ESMTP
 id -wn7Wt9oRZiQC6ybIHTX4w Mon, 24 Jan 2022 11:17:01.166 +0000 (UTC)
Received: from authenticated-user (ne2.svin.in [152.70.50.15])
 by ne2.svin.in (Postfix) with ESMTPA id CA1C517B827;
 Mon, 24 Jan 2022 11:16:57 +0000 (UTC)
From: Oleg Vasilev <me@svin.in>
Subject: [PATCH] contrib/plugins: add mask plugin
Date: Mon, 24 Jan 2022 11:17:01 +0000 (UTC)
Message-Id: <20220124111602.671654-1-me@svin.in>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Authentication-Results: ne2.svin.in;
 auth=pass smtp.auth=admin@svin.in smtp.mailfrom=me@svin.in
X-Spamd-Bar: ++++++
X-Spam: Yes
X-SG-EID: =?us-ascii?Q?vuv4bBSMv+s+sLXfbA0TX5eOZYkSPfNDFag09+IwHa3cTVRX1snJTadgqJKv5P?=
 =?us-ascii?Q?2zYnM9NUImmOg1ncEiM7psi45XpqdYh9G2X3KLg?=
 =?us-ascii?Q?WSzkAjxueNJRjm9Y9rzr9cmNF64AuEKnoCRLTI9?=
 =?us-ascii?Q?1t1CWngWicFJ177IBvYsR09wgLMzZUDHirS=2FtrR?=
 =?us-ascii?Q?JMFDA5MTuevVIie+ptB3=2FwB1zs4jcBjhbEmWx7C?=
 =?us-ascii?Q?O2hhqqS8cLT1rSFIcmhC=2FlIs+X3GPm4EkrjZz1?=
To: qemu-devel@nongnu.org
Cc: Oleg Vasilev <vasilev.oleg@huawei.com>, Oleg Vasilev <me@svin.in>,
 Alex =?iso-8859-1?q?Benn=E9e?= <alex.bennee@linaro.org>, Alexandre Iooss
 <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>
X-Entity-ID: R60PFX0ZT2z0LR3J/oF4GQ==
Content-Type: text/plain; charset=us-ascii
Received-SPF: pass client-ip=149.72.131.227;
 envelope-from=bounces+23648303-31c4-qemu-devel=nongnu.org@em7421.svin.in;
 helo=wrqvvpzp.outbound-mail.sendgrid.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Oleg Vasilev <vasilev.oleg@huawei.com>

Plugin can be used to track statistics based on virtual address mask matching.
Useful for tracking kernel vs user translation blocks.

Signed-off-by: Oleg Vasilev <vasilev.oleg@huawei.com>
Signed-off-by: Oleg Vasilev <me@svin.in>
---
 contrib/plugins/Makefile |   1 +
 contrib/plugins/mask.c   | 144 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 145 insertions(+)
 create mode 100644 contrib/plugins/mask.c

diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
index 54ac5ccd9f..7e9cb51c9d 100644
--- a/contrib/plugins/Makefile
+++ b/contrib/plugins/Makefile
@@ -20,6 +20,7 @@ NAMES += howvec
 NAMES += lockstep
 NAMES += hwprofile
 NAMES += cache
+NAMES += mask
 
 SONAMES := $(addsuffix .so,$(addprefix lib,$(NAMES)))
 
diff --git a/contrib/plugins/mask.c b/contrib/plugins/mask.c
new file mode 100644
index 0000000000..c6d2bd2386
--- /dev/null
+++ b/contrib/plugins/mask.c
@@ -0,0 +1,144 @@
+/*
+ * Copyright (C) 2022, Oleg Vasilev <vasilev.oleg@huawei.com>
+ *
+ * Track statistics based on virtual address mask matching.
+ * Useful for tracking kernel vs user translation blocks.
+ *
+ * License: GNU GPL, version 2 or later.
+ *   See the COPYING file in the top-level directory.
+ */
+
+#include <assert.h>
+#include <compiler.h>
+#include <glib.h>
+#include <inttypes.h>
+#include <qemu-plugin.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+
+#include <atomic.h>
+
+QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
+
+typedef struct {
+    GMutex lock;
+    const char *hint;
+    uint64_t mask;
+    uint64_t bits;
+    uint64_t tb_exec;
+    uint64_t tb_trans;
+    uint64_t isins;
+} MaskCounter;
+
+static GPtrArray *counters;
+
+static uint64_t report_every = 1 << 28;
+static uint64_t tb_exec_every = 1 << 10;
+static uint64_t total_tb_exec;
+
+static void gen_one_report(MaskCounter *counter, GString *report)
+{
+    g_mutex_lock(&counter->lock);
+    uint64_t tb_exec = counter->tb_exec * tb_exec_every;
+
+    double hit_rate = (double)counter->tb_trans / tb_exec;
+    hit_rate = 1 - hit_rate;
+
+    double mask_freq = (double) counter->tb_exec * tb_exec_every / report_every;
+
+    g_string_append_printf(report,
+                           "hint: %s, mask: 0x%016lx, bits: 0x%016lx, hit_rate: %f, "
+                           "mask_freq: %f, tb_exec: %ld, tb_trans: %ld\n",
+                           counter->hint, counter->mask, counter->bits, hit_rate,
+                           mask_freq, tb_exec, counter->tb_trans);
+
+    counter->tb_exec = 0;
+    counter->tb_trans = 0;
+    counter->isins = 0;
+
+    g_mutex_unlock(&counter->lock);
+}
+
+static void report_all(void)
+{
+    g_autoptr(GString) report = g_string_new("");
+    g_ptr_array_foreach(counters, (GFunc)gen_one_report, report);
+    qemu_plugin_outs(report->str);
+}
+
+static void plugin_exit(qemu_plugin_id_t id, void *p)
+{
+    report_all();
+}
+
+static bool match(MaskCounter *counter, struct qemu_plugin_tb *tb)
+{
+    return (counter->mask & qemu_plugin_tb_vaddr(tb)) == counter->bits;
+}
+
+static void tb_exec(MaskCounter *counter, struct qemu_plugin_tb *tb)
+{
+    if (!match(counter, tb)) {
+        return;
+    }
+    g_mutex_lock(&counter->lock);
+    counter->tb_exec++;
+    g_mutex_unlock(&counter->lock);
+}
+
+static void vcpu_tb_exec(unsigned int cpu_index, void *tb)
+{
+    uint64_t cur_tb_exec = qatomic_fetch_inc(&total_tb_exec);
+    if ((cur_tb_exec & (tb_exec_every - 1)) == 0) {
+        g_ptr_array_foreach(counters, (GFunc)tb_exec, tb);
+    }
+
+    if ((cur_tb_exec & (report_every - 1)) == 0) {
+        report_all();
+    }
+}
+
+static void tb_trans(MaskCounter *counter, struct qemu_plugin_tb *tb)
+{
+    if (!match(counter, tb)) {
+        return;
+    }
+    g_mutex_lock(&counter->lock);
+    counter->tb_trans++;
+    g_mutex_unlock(&counter->lock);
+}
+
+static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
+{
+    qemu_plugin_register_vcpu_tb_exec_cb(tb, vcpu_tb_exec,
+                                         QEMU_PLUGIN_CB_NO_REGS, tb);
+    g_ptr_array_foreach(counters, (GFunc)tb_trans, tb);
+}
+
+static void add_counter(const char *hint, uint64_t mask, uint64_t bits)
+{
+    MaskCounter *counter = g_new0(MaskCounter, 1);
+    counter->hint = hint;
+    counter->mask = mask;
+    counter->bits = bits;
+    g_mutex_init(&counter->lock);
+    g_ptr_array_add(counters, counter);
+}
+
+QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
+                                           const qemu_info_t *info, int argc,
+                                           char **argv)
+{
+    counters = g_ptr_array_new();
+
+    // Update for a different mask
+    add_counter("all", 0, 0);
+    add_counter("kernel", 0x1ll << 63, 0x1ll << 63);
+    add_counter("user", 0x1ll << 63, 0);
+
+    qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
+    qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
+    return 0;
+}
-- 
2.33.1


