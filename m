Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95940673AE6
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 14:58:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIVPe-0000I4-78; Thu, 19 Jan 2023 08:57:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pIVPc-0000Ei-FD; Thu, 19 Jan 2023 08:57:04 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pIVPa-0006Bm-Vb; Thu, 19 Jan 2023 08:57:04 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8E38D5CE73;
 Thu, 19 Jan 2023 13:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674136621; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jVIAoajRUGSfIyuCmuIYwLpNRsCSx50sO+LkAUTEiBQ=;
 b=b47EtG+3hHfdBHb7Q1kuWl1Rvud7VOQIAiPSxNMZG8JpGdOxQOy5mc8Pkr1JBXNnLwoTpc
 5hhdtND/mGDtATABmWoaO13RHVbQ51wLG9cW2lE0SDcV9TOppKSSJHqqq8zQlvNpR0ErqM
 RrblfZKPI/6OlwYgtR3V4kc8XYNSC1I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674136621;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jVIAoajRUGSfIyuCmuIYwLpNRsCSx50sO+LkAUTEiBQ=;
 b=Ufvsker160jzUSC9OqfDZqBGmOVMgrlzw4DkAtb3a99EteIAGOLz4Av5fMTEEMaFy2eDdY
 j/ER5pTj5bfnU/Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CDFD3134F5;
 Thu, 19 Jan 2023 13:56:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uImKJClMyWOCFAAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 19 Jan 2023 13:56:57 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [RFC PATCH v4 08/15] tests/qtest: Adjust test-hmp to always pass -cpu
 option
Date: Thu, 19 Jan 2023 10:54:17 -0300
Message-Id: <20230119135424.5417-9-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230119135424.5417-1-farosas@suse.de>
References: <20230119135424.5417-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
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

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 tests/qtest/test-hmp.c | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/test-hmp.c b/tests/qtest/test-hmp.c
index f8b22abe4c..c367612d4a 100644
--- a/tests/qtest/test-hmp.c
+++ b/tests/qtest/test-hmp.c
@@ -121,21 +121,49 @@ static void test_info_commands(QTestState *qts)
     g_free(info_buf);
 }
 
+static const char *arch_get_cpu(const char *machine)
+{
+    const char *arch = qtest_get_arch();
+
+    if (g_str_equal(arch, "aarch64")) {
+        if (!strncmp(machine, "virt", 4)) {
+            return "cortex-a57";
+        }
+    }
+
+    return NULL;
+}
+
 static void test_machine(gconstpointer data)
 {
     const char *machine = data;
     char *args;
     QTestState *qts;
 
-    args = g_strdup_printf("-S -M %s", machine);
+    args = qtest_get_machine_args(machine, arch_get_cpu(machine), "-S");
     qts = qtest_init(args);
 
     test_info_commands(qts);
     test_commands(qts);
 
     qtest_quit(qts);
-    g_free(args);
     g_free((void *)data);
+    g_free((void *)args);
+}
+
+static void test_none_with_memory(void)
+{
+    QTestState *qts;
+    char *args;
+
+    args = qtest_get_machine_args("none", NULL, "-S -m 2");
+    qts = qtest_init(args);
+
+    test_info_commands(qts);
+    test_commands(qts);
+
+    qtest_quit(qts);
+    g_free((void *)args);
 }
 
 static void add_machine_test_case(const char *mname)
@@ -160,7 +188,7 @@ int main(int argc, char **argv)
     qtest_cb_for_every_machine(add_machine_test_case, g_test_quick());
 
     /* as none machine has no memory by default, add a test case with memory */
-    qtest_add_data_func("hmp/none+2MB", g_strdup("none -m 2"), test_machine);
+    qtest_add_func("hmp/none+2MB", test_none_with_memory);
 
     return g_test_run();
 }
-- 
2.35.3


