Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F4E58ECCE
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 15:11:55 +0200 (CEST)
Received: from localhost ([::1]:33912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLlV4-0004GI-4g
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 09:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oLlAU-0001uM-VV
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:50:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oLlAM-0007tQ-VJ
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:50:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660135830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QW2JkB+lQDvso8ZSmM25soHjoDYOqnfuVmKcQmRfYOk=;
 b=CL48cim94Ubl0IpOeyH0MymYdqhhY8Uu31Jf9yBPzWUe3RX7Vh45xqKL901HClE0MEQ0yk
 I0gT7gbV+G97SFb/VQ8jFCy31ywQuZ/ATjgGbU1Illk+JZWse0MJrHpqIiCCo/ZdumT5X3
 EkyqufGZUUCS6WCPjUTpbKA7GKnjPWQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-euwjXadhOz-qM6XeYva41A-1; Wed, 10 Aug 2022 08:50:28 -0400
X-MC-Unique: euwjXadhOz-qM6XeYva41A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2CECD19711D0;
 Wed, 10 Aug 2022 12:50:23 +0000 (UTC)
Received: from localhost (unknown [10.39.208.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC9D340315E;
 Wed, 10 Aug 2022 12:50:21 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Xie Yongji <xieyongji@bytedance.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 16/16] qemu-common: add error-report test
Date: Wed, 10 Aug 2022 16:48:57 +0400
Message-Id: <20220810124857.1360211-17-marcandre.lureau@redhat.com>
In-Reply-To: <20220810124857.1360211-1-marcandre.lureau@redhat.com>
References: <20220810124857.1360211-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Add new tests to check the behaviour of error reporting functions.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 .../qemu-common/tests/test-error-report.c     | 120 ++++++++++++++++++
 subprojects/qemu-common/meson.build           |   2 +
 subprojects/qemu-common/tests/meson.build     |  12 ++
 3 files changed, 134 insertions(+)
 create mode 100644 subprojects/qemu-common/tests/test-error-report.c
 create mode 100644 subprojects/qemu-common/tests/meson.build

diff --git a/subprojects/qemu-common/tests/test-error-report.c b/subprojects/qemu-common/tests/test-error-report.c
new file mode 100644
index 0000000000..09a2d122a0
--- /dev/null
+++ b/subprojects/qemu-common/tests/test-error-report.c
@@ -0,0 +1,120 @@
+/*
+ * Error reporting test
+ *
+ * Copyright (C) 2022 Red Hat Inc.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
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
diff --git a/subprojects/qemu-common/meson.build b/subprojects/qemu-common/meson.build
index 05bca6d30d..991aaac520 100644
--- a/subprojects/qemu-common/meson.build
+++ b/subprojects/qemu-common/meson.build
@@ -22,3 +22,5 @@ qemu_common_dep = declare_dependency(
   include_directories: inc,
   dependencies: [glib_dep],
 )
+
+subdir('tests')
diff --git a/subprojects/qemu-common/tests/meson.build b/subprojects/qemu-common/tests/meson.build
new file mode 100644
index 0000000000..3dd10c180b
--- /dev/null
+++ b/subprojects/qemu-common/tests/meson.build
@@ -0,0 +1,12 @@
+env = [
+  'G_TEST_SRCDIR=@0@'.format(meson.current_source_dir()),
+  'G_TEST_BUILDDIR=@0@'.format(meson.current_build_dir()),
+]
+
+test('error-report',
+  executable('test-error-report',
+    sources: files('test-error-report.c'),
+    dependencies: qemu_common_dep,
+  ),
+  env: env,
+)
-- 
2.37.1


