Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B13DB69E0C1
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 13:49:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUS4Q-0005Bo-BS; Tue, 21 Feb 2023 07:48:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUS4N-0005Al-NW
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 07:48:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUS4M-0007qw-33
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 07:48:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676983709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nl9rYr1LeoSXQmWX/qOPZeg0gY/F/3CSnvmyxLivaDA=;
 b=bl0Azdqcii4tGoL/UidQIXLX0XSUY0nbuBeLT/9FE6kCVmb8CY+pLk4Ggcf0nK0PfRR4+0
 s2sn4r3pXHnq8MhTXQX4eVcbF6ffJ6vGte3jkL2foH2T8MBOHeB64AD3KSXL4HsSLaQXGp
 0vHfRfANRi9wrT+NyuWz8npzGvHq6kg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-Eb3fgGvAOHmrmYe7D8semA-1; Tue, 21 Feb 2023 07:48:24 -0500
X-MC-Unique: Eb3fgGvAOHmrmYe7D8semA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC1C785A588;
 Tue, 21 Feb 2023 12:48:23 +0000 (UTC)
Received: from localhost (unknown [10.39.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E40B2026D4B;
 Tue, 21 Feb 2023 12:48:22 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Roth <michael.roth@amd.com>, qemu-arm@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, armbru@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 04/16] tests: add test-error-report
Date: Tue, 21 Feb 2023 16:47:49 +0400
Message-Id: <20230221124802.4103554-5-marcandre.lureau@redhat.com>
In-Reply-To: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
References: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/unit/test-error-report.c | 121 +++++++++++++++++++++++++++++++++
 tests/unit/meson.build         |   1 +
 2 files changed, 122 insertions(+)
 create mode 100644 tests/unit/test-error-report.c

diff --git a/tests/unit/test-error-report.c b/tests/unit/test-error-report.c
new file mode 100644
index 0000000000..b09650687b
--- /dev/null
+++ b/tests/unit/test-error-report.c
@@ -0,0 +1,121 @@
+/*
+ * Error reporting test
+ *
+ * Copyright (C) 2022 Red Hat Inc.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "glib-compat.h"
+#include <locale.h>
+
+#include "qemu/error-report.h"
+
+static void
+test_error_report_simple(void)
+{
+    if (g_test_subprocess()) {
+        error_report("%s", "test error");
+        warn_report("%s", "test warn");
+        info_report("%s", "test info");
+        return;
+    }
+
+    g_test_trap_subprocess(NULL, 0, 0);
+    g_test_trap_assert_passed();
+    g_test_trap_assert_stderr("\
+test-error-report: test error*\
+test-error-report: warning: test warn*\
+test-error-report: info: test info*\
+");
+}
+
+static void
+test_error_report_loc(void)
+{
+    if (g_test_subprocess()) {
+        loc_set_file("some-file.c", 7717);
+        error_report("%s", "test error1");
+        loc_set_none();
+        error_report("%s", "test error2");
+        return;
+    }
+
+    g_test_trap_subprocess(NULL, 0, 0);
+    g_test_trap_assert_passed();
+    g_test_trap_assert_stderr("\
+test-error-report:some-file.c:7717: test error1*\
+test-error-report: test error2*\
+");
+}
+
+static void
+test_error_report_glog(void)
+{
+    if (g_test_subprocess()) {
+        g_message("gmessage");
+        return;
+    }
+
+    g_test_trap_subprocess(NULL, 0, 0);
+    g_test_trap_assert_passed();
+    g_test_trap_assert_stderr("test-error-report: info: gmessage*");
+}
+
+static void
+test_error_report_once(void)
+{
+    int i;
+
+    if (g_test_subprocess()) {
+        for (i = 0; i < 3; i++) {
+            warn_report_once("warn");
+            error_report_once("err");
+        }
+        return;
+    }
+
+    g_test_trap_subprocess(NULL, 0, 0);
+    g_test_trap_assert_passed();
+    g_test_trap_assert_stderr("\
+test-error-report: warning: warn*\
+test-error-report: err*\
+");
+}
+
+static void
+test_error_report_timestamp(void)
+{
+    if (g_test_subprocess()) {
+        message_with_timestamp = true;
+        warn_report("warn");
+        error_report("err");
+        return;
+    }
+
+    g_test_trap_subprocess(NULL, 0, 0);
+    g_test_trap_assert_passed();
+    g_test_trap_assert_stderr("\
+*-*-*:*:* test-error-report: warning: warn*\
+*-*-*:*:* test-error-report: err*\
+");
+}
+
+int
+main(int argc, char *argv[])
+{
+    setlocale(LC_ALL, "");
+
+    g_test_init(&argc, &argv, NULL);
+    error_init("test-error-report");
+
+    g_test_add_func("/error-report/simple", test_error_report_simple);
+    g_test_add_func("/error-report/loc", test_error_report_loc);
+    g_test_add_func("/error-report/glog", test_error_report_glog);
+    g_test_add_func("/error-report/once", test_error_report_once);
+    g_test_add_func("/error-report/timestamp", test_error_report_timestamp);
+
+    return g_test_run();
+}
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index ffa444f432..015e8131df 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -11,6 +11,7 @@ tests = {
   'check-qobject': [],
   'check-qjson': [],
   'check-qlit': [],
+  'test-error-report': [],
   'test-qobject-output-visitor': [testqapi],
   'test-clone-visitor': [testqapi],
   'test-qobject-input-visitor': [testqapi],
-- 
2.39.2


