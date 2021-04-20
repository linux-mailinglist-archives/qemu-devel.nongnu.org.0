Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F8036583B
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 13:57:49 +0200 (CEST)
Received: from localhost ([::1]:45472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYp0m-0006sQ-Ig
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 07:57:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lYoyI-0004ez-5q
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 07:55:14 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:33516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lYoyG-0007s6-41
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 07:55:13 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 q123-20020a1c43810000b029012c7d852459so984496wma.0
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 04:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6Zswqg/DPPjP7WK8h0lEiepIzXbXIZn7hEfxlod0OEE=;
 b=R/LLn6+Aw15kfJcKOTlEBeyWF18JyMec2pseyhGDjPde2zKVBJ1h1op/aGGEzOrTPL
 qgdduStcV6ZoeVGJjHASvmFlAG4ULtN0Hxt+om0DQ3tESl5gI+ihWdtSYt3O4JDs0k47
 pFDXrtxqlhSZgov5zTjpg79FV4RG0PkWNoYNRhM1YN0ek3vWX/EJDRHCvJWM6gj8ZIRt
 07kCSP+NDZudUahODYJTcIGNiDDU/c8vqKJWov1tqyuMfvpmsD7H+beghzwP6UdFP4+i
 awkm5wKHt2+Zddx7S+Rc/CmAZhTVxqWWmr5lQY/ye9ovmOh5ib+KX8oN1iu+loIEHesm
 1l8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6Zswqg/DPPjP7WK8h0lEiepIzXbXIZn7hEfxlod0OEE=;
 b=V27CWHz4eBiFpIs/uFZBPDqByMatRJ3/Ab/4Kw2ZB4L0lE3j8/I9nSnRTr1c+MNiAa
 BP65X0G5d/Y0Azh04d1OO5TFBKpAoM8F3QQ8atTgm9GQ/LfqBOsl1zYVCKgrHEA2iJmi
 SUzYzpkVwiyeqAONG+Nc/WXOSAMzKJx2KIZ9Dqhoi4P0A9m9DV1dPavUK2yp3i2uodwH
 gIubfySZDem//fJBSr2qK99AlqQeqs9zwvhqbeYFv5yDP/Xver2FwF5+I3OsoBHMxvYG
 DDUFFLpe9MKy486TN0ZTgxLVFDQ3JWwANfDwJ1HCMt4wTl9220FRDBYFRZA94SecgXg1
 ZhzQ==
X-Gm-Message-State: AOAM5318R0aJWOO0NGoMPMiFx3a33Lj+J/6A5OFK4KTjAGgqoHQ8XIQ8
 dVEEBYsgBSk68c0s68eoGG4bEKnqzEE=
X-Google-Smtp-Source: ABdhPJx3hJk4BKyiKa0xdrx+eZp+sSw06D3pVX8yl7EvO4WthefsoTf5X3njFKJPxvW5w1izREo1ig==
X-Received: by 2002:a1c:65c2:: with SMTP id z185mr4143724wmb.2.1618919709669; 
 Tue, 20 Apr 2021 04:55:09 -0700 (PDT)
Received: from localhost.localdomain ([197.61.162.183])
 by smtp.googlemail.com with ESMTPSA id i133sm3080407wmi.40.2021.04.20.04.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 04:55:08 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] plugins/syscall: Added a table-like summary output
Date: Tue, 20 Apr 2021 13:54:33 +0200
Message-Id: <20210420115433.12148-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added a table-like output which contains the total number of calls
for each used syscall along with the number of errors that occurred.

Per-call tracing is still available through supplying the argument
``print`` to the plugin.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
v2 -> v3: * Locked shared hash-table to protect access across multiple
          callback invocations.
          * Used better variable names for the hash table and entries.
          * Factored the creation and looking-up for hash table entries.
          * Eliminated the usage of a global boolean and checked against
          the existence of the ``statistics`` hash-table. (it's allocated
          only if the plugin in the summary(default) mode.
          * Removed the function ``free_entry`` and passed ``g_free``
          directly to ``g_hash_table_new_full()``.

 tests/plugin/syscall.c | 98 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 93 insertions(+), 5 deletions(-)

diff --git a/tests/plugin/syscall.c b/tests/plugin/syscall.c
index 53ee2ab6c4..7b856f2fe2 100644
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
+void print_entry(gpointer val, gpointer user_data)
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
2.25.1


