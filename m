Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C0768C0EE
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 16:07:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP351-0004Fx-Cd; Mon, 06 Feb 2023 10:06:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pP34x-0004Bu-KG
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 10:06:47 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pP34u-0008St-LW
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 10:06:47 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 80BC5605F1;
 Mon,  6 Feb 2023 15:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675696003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iV4D1SZmdiSkiFhOYrzlFFCeUDfheBMubmsqJ6Gm/DE=;
 b=jKzqR3/oNpAKJQs9btsXp0CB2+P9mElBkolpxt2TjfUMk5jEeY0104++CqRgFjgeqMW6fQ
 gLAZN7Vy5PMoFyJSZ4ChqeEh+bwx5aYH1hHEGeQS/HgFX1As/FYMJqbPaudB8jYp5ny97e
 ZRowQvYCjEjLIGgjRpLnc5Y7ZxoSd0s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675696003;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iV4D1SZmdiSkiFhOYrzlFFCeUDfheBMubmsqJ6Gm/DE=;
 b=QWRlwW4y3sOk2RBStvfRbBeN+S7fgRxSxiHVFOQHiBxRxzbGRB5xT91zeXoZMjwbJfJ3+r
 R/g9jztUhFgPRNBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 301EE138E8;
 Mon,  6 Feb 2023 15:06:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6MtNOoEX4WPSXwAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 06 Feb 2023 15:06:41 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 12/12] [NOT FOR MERGE] tests/qtest: Introduce
 qtest_validate_args
Date: Mon,  6 Feb 2023 12:04:16 -0300
Message-Id: <20230206150416.4604-13-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230206150416.4604-1-farosas@suse.de>
References: <20230206150416.4604-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

The QEMU binary can be built with a varied set of features/devices
which are opaque to the tests. Add a centralized point for parsing and
validating the command line.

Tests can now be skipped with the following pattern:

qts = qtest_init(args);
if (!qts) {
    return;
}

For now, the only validation is that the -device options all
correspond to devices that are actually present in the build.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
Would this be better than checking for missing devices in individual
tests?
---
 tests/qtest/libqtest.c | 137 ++++++++++++++++++++++++++++++++++++++++-
 tests/qtest/libqtest.h |  12 ++++
 2 files changed, 148 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index d658222a19..7920fd1506 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -479,10 +479,145 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
     return s;
 }
 
+enum qemu_options {
+    DEVICE = G_TOKEN_LAST + 1,
+    DRIVER = G_TOKEN_LAST + 2,
+};
+
+static void _add_option(GHashTable *ht, const char *key, const char *val)
+{
+    GList *list = g_hash_table_lookup(ht, key);
+
+    if (!list) {
+        list = g_list_append(list, g_strdup(val));
+        g_hash_table_insert(ht, g_strdup(key), list);
+    } else {
+        list = g_list_append(list, g_strdup(val));
+    }
+}
+
+static void _parse_device_json(GHashTable *opts, GScanner *top_scanner)
+{
+    GScanner *scanner = g_scanner_new(top_scanner->config);
+    gchar *text;
+
+    assert(top_scanner->token == G_TOKEN_STRING);
+    text = g_strdup(top_scanner->value.v_string);
+
+    g_scanner_scope_add_symbol(scanner, 0, "driver", GINT_TO_POINTER(DRIVER));
+    g_scanner_input_text(scanner, text, strlen(text));
+
+    do {
+        g_scanner_get_next_token(scanner);
+        switch ((enum qemu_options)scanner->token) {
+        case DRIVER:
+            /* -device "{'driver':'dev' */
+            g_scanner_get_next_token(scanner);
+
+            switch (scanner->token) {
+            case G_TOKEN_IDENTIFIER:
+                _add_option(opts, "devices", scanner->value.v_string);
+                break;
+
+            default: /* invalid */
+                _add_option(opts, "devices", NULL);
+            }
+            break;
+        default:
+            break;
+        }
+        g_scanner_peek_next_token(scanner);
+    } while (scanner->next_token != G_TOKEN_EOF &&
+             scanner->next_token != G_TOKEN_ERROR);
+
+    g_scanner_destroy(scanner);
+    g_free(text);
+}
+
+static void qtest_parse_args(GHashTable *opts, const char *args)
+{
+    GScanner *scanner = g_scanner_new(NULL);
+
+    scanner->input_name = "qtest args";
+    scanner->config->symbol_2_token = 1;
+    scanner->config->scan_float = 0;
+    scanner->config->scan_string_sq = 0;
+    scanner->config->cset_skip_characters = g_strdup(" \t\n':");
+    scanner->config->cset_identifier_first = g_strdup("-" G_CSET_a_2_z
+                                                      G_CSET_A_2_Z
+                                                      G_CSET_DIGITS),
+    scanner->config->cset_identifier_nth = g_strdup("-_." G_CSET_a_2_z
+                                                    G_CSET_A_2_Z G_CSET_DIGITS),
+
+    g_scanner_scope_add_symbol(scanner, 0, "-device", GINT_TO_POINTER(DEVICE));
+
+    g_scanner_input_text(scanner, args, strlen(args));
+
+    do {
+        g_scanner_get_next_token(scanner);
+
+        switch ((enum qemu_options)scanner->token) {
+        case DEVICE:
+            g_scanner_get_next_token(scanner);
+
+            switch (scanner->token) {
+            case G_TOKEN_IDENTIFIER: /* -device dev */
+                _add_option(opts, "devices", scanner->value.v_string);
+                break;
+
+            case G_TOKEN_STRING: /* -device "{'driver':'dev' */
+                _parse_device_json(opts, scanner);
+                break;
+
+            default: /* invalid */
+                _add_option(opts, "devices", NULL);
+            }
+            break;
+        default:
+            break;
+        }
+        g_scanner_peek_next_token(scanner);
+    } while (scanner->next_token != G_TOKEN_EOF &&
+             scanner->next_token != G_TOKEN_ERROR);
+
+    g_scanner_destroy(scanner);
+}
+
+bool qtest_validate_args(const char *args, char **msg)
+{
+    GHashTable *opts = g_hash_table_new(g_str_hash, g_str_equal);
+    GList *l;
+    bool rc = true;
+
+    qtest_parse_args(opts, args);
+
+    for (l = g_hash_table_lookup(opts, "devices"); l != NULL; l = l->next) {
+        if (!l->data || !qtest_has_device(l->data)) {
+            *msg = g_strdup_printf("Device %s is not available",
+                                   (char *)l->data);
+            rc = false;
+            break;
+        }
+    }
+    g_hash_table_unref(opts);
+    return rc;
+}
+
 QTestState *qtest_init(const char *extra_args)
 {
-    QTestState *s = qtest_init_without_qmp_handshake(extra_args);
+    QTestState *s;
     QDict *greeting;
+/*
+ *   char *err_msg;
+ *
+ *    if (!qtest_validate_args(extra_args, &err_msg)) {
+ *        g_test_skip(err_msg);
+ *        g_free(err_msg);
+ *
+ *        return NULL;
+ *    }
+ */
+    s = qtest_init_without_qmp_handshake(extra_args);
 
     /* Read the QMP greeting and then do the handshake */
     greeting = qtest_qmp_receive(s);
diff --git a/tests/qtest/libqtest.h b/tests/qtest/libqtest.h
index fcf1c3c3b3..01a07c448a 100644
--- a/tests/qtest/libqtest.h
+++ b/tests/qtest/libqtest.h
@@ -832,4 +832,16 @@ void qtest_qom_set_bool(QTestState *s, const char *path, const char *property,
  * Returns: Value retrieved from property.
  */
 bool qtest_qom_get_bool(QTestState *s, const char *path, const char *property);
+
+/**
+ * qtest_validate_args:
+ * @args: arguments to validate, exactly as they would be passed
+ * into qtest_init.
+ * @err_msg: String with the reason for the failure, if any.
+ *
+ * Validates the command line (args) for options that are incompatible
+ * with the current QEMU build.
+ */
+bool qtest_validate_args(const char *args, char **err_msg);
+
 #endif
-- 
2.35.3


