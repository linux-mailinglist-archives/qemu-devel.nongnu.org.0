Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9227361A72
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 09:24:41 +0200 (CEST)
Received: from localhost ([::1]:34462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXIqG-0002bX-Pa
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 03:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lXIpQ-0002AS-8I
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 03:23:48 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:33484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lXIpO-0004M4-B5
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 03:23:47 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 q123-20020a1c43810000b029012c7d852459so4957167wma.0
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 00:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K8Lefpo8nZP0gFggoWqcmXp4/ZG5K0orSkYHqPpyME4=;
 b=o+bOXMIJggQpKNVUZ9MLFY2Ea0tGke2F/v2ET75uMSzyTEnepYooBGTYKQSQtxJ8e6
 HhLKVhFgZ3YpkkxqDfC8XO1l6Mri+OiP4ukr3OcZnaqCKAuD8jnANKN05uAxuMYjhzRv
 evVJmIEQGnkBxVrAjFAYx4TmaKdpnEO1fdBqr6coPxZfST+eBRO2eizBR7sZNdzIe1Ln
 wRN2z5Mlr0gkVUbJXjTdxGs+vxFqGq4xB10yEbWVF0UQC2SzvMC71J4c0x5ZjzpHzdaV
 hCYZ4tKKXd9EZH6UXPRpGnP1NqYDfnrhYnmSeE72479MUYTX0ZKWD09L4fUVbDu2TVQh
 Ll+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K8Lefpo8nZP0gFggoWqcmXp4/ZG5K0orSkYHqPpyME4=;
 b=npLdE0ywivId7UQHekiRteEPYfsppmcya1IPzM8KlrB7bJbQSWrxN0oaOb1tyQ2nUp
 RMvUVQZZeEkk40xvp5F1KnZEY4g8zRWGEeSna4Ux7he2vl/CX1rYF1IsITveQwbCE2Hu
 +ES8FrPjTswn3gfp+qv/Xkc2lSRJoYbfdDLC7Lh2XdBVC6+rxThlyBzTDxr9un7W7oBe
 mMgoYBurCMIUY6lyGhpFaGtBbjhLgoWxVcs739pfoWb7MpRja+ho+xaW3akhQdWCKiGr
 4m4DIgM1v/O62pQvTTb0699INNE2okKj5ishT/dCh8kVX41xvNhFrROMh0CKNLNITtVz
 shKg==
X-Gm-Message-State: AOAM530A+U0phdujHPtDLyr49wZqC6eWPeM+brugAlTJVAbF+JAGeoVF
 X/kAiL66fZKb3iuISVyzK9L1BI16x/o=
X-Google-Smtp-Source: ABdhPJx51iLS3oBZYmwvIhwSx2Yw9NipehwJgEA8myV3gCxPccORK33hnEh3HjWJDxhUp2O7OJZi5Q==
X-Received: by 2002:a05:600c:4f03:: with SMTP id
 l3mr6766006wmq.149.1618557824556; 
 Fri, 16 Apr 2021 00:23:44 -0700 (PDT)
Received: from localhost.localdomain ([41.36.15.230])
 by smtp.googlemail.com with ESMTPSA id n3sm7484674wmi.7.2021.04.16.00.23.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 00:23:44 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] plugins/syscall: Added a table-like summary output
Date: Fri, 16 Apr 2021 09:17:39 +0200
Message-Id: <20210416071740.3393-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x32f.google.com
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
v1: https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg02623.html
v1 -> v2: Removed debugging code in the on-return from syscall callback 
          that was silently existent.

 tests/plugin/syscall.c | 91 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 85 insertions(+), 6 deletions(-)

diff --git a/tests/plugin/syscall.c b/tests/plugin/syscall.c
index 53ee2ab6c4..b66a930635 100644
--- a/tests/plugin/syscall.c
+++ b/tests/plugin/syscall.c
@@ -16,32 +16,111 @@
 
 QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
 
+typedef struct {
+    int64_t calls;
+    int64_t errors;
+} SyscallStats;
+
+static GHashTable *syscalls_statistics;
+
+static bool percall_print;
+
 static void vcpu_syscall(qemu_plugin_id_t id, unsigned int vcpu_index,
                          int64_t num, uint64_t a1, uint64_t a2,
                          uint64_t a3, uint64_t a4, uint64_t a5,
                          uint64_t a6, uint64_t a7, uint64_t a8)
 {
-    g_autofree gchar *out = g_strdup_printf("syscall #%" PRIi64 "\n", num);
-    qemu_plugin_outs(out);
+    if (!percall_print) {
+        SyscallStats *syscall_entry;
+
+        syscall_entry =
+            (SyscallStats *) g_hash_table_lookup(syscalls_statistics,
+                                                  GINT_TO_POINTER(num));
+
+        if (!syscall_entry) {
+            syscall_entry = g_new(SyscallStats, 1);
+            syscall_entry->calls = 1;
+            syscall_entry->errors = 0;
+
+            g_hash_table_insert(syscalls_statistics, GINT_TO_POINTER(num),
+                                (gpointer) syscall_entry);
+        } else {
+            syscall_entry->calls++;
+        }
+    } else {
+        g_autofree gchar *out = g_strdup_printf("syscall #%" PRIi64 "\n", num);
+        qemu_plugin_outs(out);
+    }
 }
 
 static void vcpu_syscall_ret(qemu_plugin_id_t id, unsigned int vcpu_idx,
                              int64_t num, int64_t ret)
+{
+    if (!percall_print) {
+        SyscallStats *syscall_entry;
+
+        syscall_entry =
+            (SyscallStats *) g_hash_table_lookup(syscalls_statistics,
+                                                  GINT_TO_POINTER(num));
+        if (ret < 0) {
+            syscall_entry->errors++;
+        }
+    } else {
+        g_autofree gchar *out;
+        out = g_strdup_printf("syscall #%" PRIi64 " returned -> %" PRIi64 "\n",
+                num, ret);
+        qemu_plugin_outs(out);
+    }
+}
+
+/* ************************************************************************* */
+
+void print_entry(gpointer key, gpointer val, gpointer user_data)
 {
     g_autofree gchar *out;
-    out = g_strdup_printf("syscall #%" PRIi64 " returned -> %" PRIi64 "\n",
-            num, ret);
+    int64_t syscall_num = (int64_t) key;
+    SyscallStats *syscall_entry = (SyscallStats *) val;
+    out = g_strdup_printf(
+        "%-13" PRIi64 "%-6" PRIi64 " %" PRIi64 "\n",
+        syscall_num, syscall_entry->calls, syscall_entry->errors);
     qemu_plugin_outs(out);
 }
 
-/* ************************************************************************* */
+static void plugin_exit(qemu_plugin_id_t id, void *p)
+{
+    if (!percall_print) {
+        qemu_plugin_outs("syscall no.  calls  errors\n");
+        g_hash_table_foreach(syscalls_statistics, &print_entry, NULL);
+    }
+}
 
-static void plugin_exit(qemu_plugin_id_t id, void *p) {}
+void free_entry(gpointer entry)
+{
+    g_free(entry);
+}
 
 QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
                                            const qemu_info_t *info,
                                            int argc, char **argv)
 {
+    int i;
+
+    for (i = 0; i < argc; i++) {
+        char *opt = argv[i];
+        if (g_strcmp0(opt, "print") == 0) {
+            percall_print = true;
+        } else {
+            fprintf(stderr, "unsupported argument: %s\n", opt);
+            return -1;
+        }
+    }
+
+    if (!percall_print) {
+        syscalls_statistics =
+            g_hash_table_new_full(g_direct_hash, g_direct_equal,
+                    NULL, &free_entry);
+    }
+
     qemu_plugin_register_vcpu_syscall_cb(id, vcpu_syscall);
     qemu_plugin_register_vcpu_syscall_ret_cb(id, vcpu_syscall_ret);
     qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
-- 
2.25.1


