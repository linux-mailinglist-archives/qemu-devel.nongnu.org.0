Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5797038B568
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 19:45:23 +0200 (CEST)
Received: from localhost ([::1]:47154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljmja-0006Gz-DP
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 13:45:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ljmha-0003Ya-Rj
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:43:18 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ljmhZ-0001Ay-0C
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:43:18 -0400
Received: by mail-wr1-x435.google.com with SMTP id n2so18597822wrm.0
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 10:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AMEc95i31AY77+bT+r3OtP0SO6eeuibPTNGNNWAs+D0=;
 b=bKXtC5cLcTmq1F9vbjI+y9SXz2J16eIUOO009GcodDmX1BeY9Zp856KHOIzpHtJJC3
 NqBKRh4XEWYx9mJqELAGBt8QlOyux4w+SkCvUIp/mwwKbC2yatIuJG7EKS0k6nk8qh2h
 yKCNhxNFoaijlp/ahqSUr5+vVIn29liFUb9di1C5ukrfRNxrSpTNNjA1RTNpyYJS8iCf
 5sAh55I6nVx86iGc8RlIfkvdFEdU53Z4S8c3TtLPvwWTXhauYTvz+HofM8+euYQFLBW+
 vykQnVOQxeqE1C3DBLgqLwGGE3hPGWa+94hdAxhD8jWqgErhXmG4bvzUgaTN+5StWUlS
 mYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AMEc95i31AY77+bT+r3OtP0SO6eeuibPTNGNNWAs+D0=;
 b=Cd4TAQUaZk6c1I8tw+Ic9c2X9d9TvCiu7hsu5bRRzFhi4yLDY98kac3dWz1VC9m/bv
 AD/CuAqQnknVWIyVByVfGKEVNyrbnuYBbNjRYJcc9r8H9r+IQPWq3WnapDH5jWeAHOeD
 92RrZBwe84BuX1egK8BQGgefxP+IFg7pnSR/lcKKJztpnLI7IycUQ8x7XK4SVffD+Ky+
 0K5H5ii/5In0h1CWqqTn3gprRhiBLLAO77lDJ7lKDU284Q6RxB2kl21bzLMlg1E6NB+y
 b61J7CVrJijNcLOE6LaH7bJIO89ybTZwIvhtIflw+KXhWLlu9FqLCpngiZnEzU4xV83F
 ujVg==
X-Gm-Message-State: AOAM530COG80noApBKpFw3liXop/0no7yVaMLJfao5FAMEG236kKZNYT
 lr/YJLP7n3QoWyBfbwPJV2+Q2w==
X-Google-Smtp-Source: ABdhPJySeKT5m08yAD0pHil519FXWIFEpbzKeLSLU4/dgnmJI1nvcXRygPHQ2IOWxK7ZiCpseDrMHg==
X-Received: by 2002:adf:f20b:: with SMTP id p11mr1389889wro.190.1621532595683; 
 Thu, 20 May 2021 10:43:15 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e26sm3281333wmh.39.2021.05.20.10.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 10:43:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C19461FF96;
 Thu, 20 May 2021 18:43:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 8/8] plugins/syscall: Added a table-like summary output
Date: Thu, 20 May 2021 18:43:03 +0100
Message-Id: <20210520174303.12310-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210520174303.12310-1-alex.bennee@linaro.org>
References: <20210520174303.12310-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Added a table-like output which contains the total number of calls
for each used syscall along with the number of errors that occurred.

Per-call tracing is still available through supplying the argument
``print`` to the plugin.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210519032409.3041-1-ma.mandourr@gmail.com>
---
 tests/plugin/syscall.c | 98 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 93 insertions(+), 5 deletions(-)

diff --git a/tests/plugin/syscall.c b/tests/plugin/syscall.c
index 53ee2ab6c4..6dd71092e1 100644
--- a/tests/plugin/syscall.c
+++ b/tests/plugin/syscall.c
@@ -16,32 +16,120 @@
 
 QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
 
+typedef struct {
+    int64_t num;
+    int64_t calls;
+    int64_t errors;
+} SyscallStats;
+
+static GMutex lock;
+static GHashTable *statistics;
+
+static SyscallStats *get_or_create_entry(int64_t num)
+{
+    SyscallStats *entry =
+        (SyscallStats *) g_hash_table_lookup(statistics, GINT_TO_POINTER(num));
+
+    if (!entry) {
+        entry = g_new0(SyscallStats, 1);
+        entry->num = num;
+        g_hash_table_insert(statistics, GINT_TO_POINTER(num), (gpointer) entry);
+    }
+
+    return entry;
+}
+
 static void vcpu_syscall(qemu_plugin_id_t id, unsigned int vcpu_index,
                          int64_t num, uint64_t a1, uint64_t a2,
                          uint64_t a3, uint64_t a4, uint64_t a5,
                          uint64_t a6, uint64_t a7, uint64_t a8)
 {
-    g_autofree gchar *out = g_strdup_printf("syscall #%" PRIi64 "\n", num);
-    qemu_plugin_outs(out);
+    if (statistics) {
+        SyscallStats *entry;
+        g_mutex_lock(&lock);
+        entry = get_or_create_entry(num);
+        entry->calls++;
+        g_mutex_unlock(&lock);
+    } else {
+        g_autofree gchar *out = g_strdup_printf("syscall #%" PRIi64 "\n", num);
+        qemu_plugin_outs(out);
+    }
 }
 
 static void vcpu_syscall_ret(qemu_plugin_id_t id, unsigned int vcpu_idx,
                              int64_t num, int64_t ret)
+{
+    if (statistics) {
+        SyscallStats *entry;
+
+        g_mutex_lock(&lock);
+        /* Should always return an existent entry. */
+        entry = get_or_create_entry(num);
+        if (ret < 0) {
+            entry->errors++;
+        }
+        g_mutex_unlock(&lock);
+    } else {
+        g_autofree gchar *out;
+        out = g_strdup_printf("syscall #%" PRIi64 " returned -> %" PRIi64 "\n",
+                num, ret);
+        qemu_plugin_outs(out);
+    }
+}
+
+static void print_entry(gpointer val, gpointer user_data)
 {
     g_autofree gchar *out;
-    out = g_strdup_printf("syscall #%" PRIi64 " returned -> %" PRIi64 "\n",
-            num, ret);
+    SyscallStats *entry = (SyscallStats *) val;
+    int64_t syscall_num = entry->num;
+    out = g_strdup_printf(
+        "%-13" PRIi64 "%-6" PRIi64 " %" PRIi64 "\n",
+        syscall_num, entry->calls, entry->errors);
     qemu_plugin_outs(out);
 }
 
+static gint comp_func(gconstpointer ea, gconstpointer eb)
+{
+    SyscallStats *ent_a = (SyscallStats *) ea;
+    SyscallStats *ent_b = (SyscallStats *) eb;
+
+    return ent_a->calls > ent_b->calls ? -1 : 1;
+}
+
 /* ************************************************************************* */
+static void plugin_exit(qemu_plugin_id_t id, void *p)
+{
+    if (!statistics) {
+        return;
+    }
+
+    g_mutex_lock(&lock);
+    GList *entries = g_hash_table_get_values(statistics);
+    entries = g_list_sort(entries, comp_func);
+    qemu_plugin_outs("syscall no.  calls  errors\n");
 
-static void plugin_exit(qemu_plugin_id_t id, void *p) {}
+    g_list_foreach(entries, print_entry, NULL);
+
+    g_list_free(entries);
+    g_hash_table_destroy(statistics);
+    g_mutex_unlock(&lock);
+}
 
 QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
                                            const qemu_info_t *info,
                                            int argc, char **argv)
 {
+    if (argc == 0) {
+        statistics = g_hash_table_new_full(NULL, g_direct_equal, NULL, g_free);
+    } else {
+        for (int i = 0; i < argc; i++) {
+            if (g_strcmp0(argv[i], "print") != 0) {
+                fprintf(stderr, "unsupported argument: %s\n", argv[i]);
+                return -1;
+            }
+        }
+    }
+
     qemu_plugin_register_vcpu_syscall_cb(id, vcpu_syscall);
     qemu_plugin_register_vcpu_syscall_ret_cb(id, vcpu_syscall_ret);
     qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
-- 
2.20.1


