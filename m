Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5B6571680
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 12:03:29 +0200 (CEST)
Received: from localhost ([::1]:39100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBCjp-0001Vp-1h
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 06:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oBCKa-0006Hu-NM
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:37:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oBCKF-0001kn-9U
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:37:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657618622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F82WnW9k098m/J58lihfvrbbt/wO0m0PQjAOnV2hk5I=;
 b=iTnvWaTkXxzIThfC50tyX2kDZceF5Il8SRzSKdel3LG2n38hHiD9aVZLU/oItCNsrOYcKq
 a8RLr2eZ29pcthNyTcsp+nYIxBEWrFHJDRNfRteGQWQ4cleiZCjUN7k2N4spDSllJFMHUK
 66I0hGKZj74mc468k7ScsDvZmT8bAsY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-nfMfF0tOPPaKRT-Cl_lLYw-1; Tue, 12 Jul 2022 05:37:00 -0400
X-MC-Unique: nfMfF0tOPPaKRT-Cl_lLYw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E26A0801231;
 Tue, 12 Jul 2022 09:36:59 +0000 (UTC)
Received: from localhost (unknown [10.39.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A33FC9D7F;
 Tue, 12 Jul 2022 09:36:58 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Xie Yongji <xieyongji@bytedance.com>, Kyle Evans <kevans@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Warner Losh <imp@bsdimp.com>,
 Kevin Wolf <kwolf@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Laurent Vivier <laurent@vivier.eu>, Fam Zheng <fam@euphon.net>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 13/15] qemu-common: move error-report
Date: Tue, 12 Jul 2022 13:35:26 +0400
Message-Id: <20220712093528.4144184-14-marcandre.lureau@redhat.com>
In-Reply-To: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
References: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 .../qemu-common/include}/qemu/error-report.h  |  2 ++
 .../qemu-common/src}/error-is-detailed.c      |  1 -
 .../qemu-common/src}/error-report.c           |  4 +++-
 .../qemu-common/src/error-vprintf.c           |  5 ++---
 stubs/meson.build                             |  2 --
 subprojects/qemu-common/meson.build           | 20 ++++++++++++++++---
 subprojects/qemu-common/src/meson.build       |  5 +++++
 util/meson.build                              |  2 +-
 8 files changed, 30 insertions(+), 11 deletions(-)
 rename {include => subprojects/qemu-common/include}/qemu/error-report.h (98%)
 rename {stubs => subprojects/qemu-common/src}/error-is-detailed.c (77%)
 rename {util => subprojects/qemu-common/src}/error-report.c (99%)
 rename stubs/error-printf.c => subprojects/qemu-common/src/error-vprintf.c (78%)
 create mode 100644 subprojects/qemu-common/src/meson.build

diff --git a/include/qemu/error-report.h b/subprojects/qemu-common/include/qemu/error-report.h
similarity index 98%
rename from include/qemu/error-report.h
rename to subprojects/qemu-common/include/qemu/error-report.h
index 6ab25d458350..c62dd1a633b8 100644
--- a/include/qemu/error-report.h
+++ b/subprojects/qemu-common/include/qemu/error-report.h
@@ -13,6 +13,8 @@
 #ifndef QEMU_ERROR_REPORT_H
 #define QEMU_ERROR_REPORT_H
 
+#include "glib-compat.h"
+
 typedef struct Location {
     /* all members are private to qemu-error.c */
     enum { LOC_NONE, LOC_CMDLINE, LOC_FILE } kind;
diff --git a/stubs/error-is-detailed.c b/subprojects/qemu-common/src/error-is-detailed.c
similarity index 77%
rename from stubs/error-is-detailed.c
rename to subprojects/qemu-common/src/error-is-detailed.c
index c47cd236932f..c3d9c3454d84 100644
--- a/stubs/error-is-detailed.c
+++ b/subprojects/qemu-common/src/error-is-detailed.c
@@ -1,4 +1,3 @@
-#include "qemu/osdep.h"
 #include "qemu/error-report.h"
 
 bool error_is_detailed(void)
diff --git a/util/error-report.c b/subprojects/qemu-common/src/error-report.c
similarity index 99%
rename from util/error-report.c
rename to subprojects/qemu-common/src/error-report.c
index 4d1d66fc0650..616428fe9579 100644
--- a/util/error-report.c
+++ b/subprojects/qemu-common/src/error-report.c
@@ -10,7 +10,9 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include "qemu/osdep.h"
+#include <stdio.h>
+#include <assert.h>
+
 #include "qemu/error-report.h"
 
 /*
diff --git a/stubs/error-printf.c b/subprojects/qemu-common/src/error-vprintf.c
similarity index 78%
rename from stubs/error-printf.c
rename to subprojects/qemu-common/src/error-vprintf.c
index 1afa0f62ca26..b815d88dfe65 100644
--- a/stubs/error-printf.c
+++ b/subprojects/qemu-common/src/error-vprintf.c
@@ -1,13 +1,12 @@
-#include "qemu/osdep.h"
+#include <stdio.h>
 #include "qemu/error-report.h"
-#include "monitor/monitor.h"
 
 int error_vprintf(const char *fmt, va_list ap)
 {
     int ret;
 
     if (g_test_initialized() && !g_test_subprocess() &&
-        getenv("QTEST_SILENT_ERRORS")) {
+        g_getenv("QTEST_SILENT_ERRORS")) {
         char *msg = g_strdup_vprintf(fmt, ap);
         g_test_message("%s", msg);
         ret = strlen(msg);
diff --git a/stubs/meson.build b/stubs/meson.build
index 0f3a782824f9..498b6ee0466e 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -9,8 +9,6 @@ stub_ss.add(files('cpus-get-virtual-clock.c'))
 stub_ss.add(files('qemu-timer-notify-cb.c'))
 stub_ss.add(files('icount.c'))
 stub_ss.add(files('dump.c'))
-stub_ss.add(files('error-is-detailed.c'))
-stub_ss.add(files('error-printf.c'))
 stub_ss.add(files('fdset.c'))
 stub_ss.add(files('gdbstub.c'))
 stub_ss.add(files('get-vm-name.c'))
diff --git a/subprojects/qemu-common/meson.build b/subprojects/qemu-common/meson.build
index 207e53991061..05bca6d30d49 100644
--- a/subprojects/qemu-common/meson.build
+++ b/subprojects/qemu-common/meson.build
@@ -3,8 +3,22 @@ project('qemu-common', 'c',
   default_options: ['c_std=gnu11']
 )
 
-qemu_common_dep = declare_dependency(
-  include_directories: include_directories('include'),
-)
+glib_dep = dependency('glib-2.0')
+inc = include_directories('include')
+
+sources = []
 
 subdir('scripts')
+subdir('src')
+
+lib = static_library(
+  'qemu-common', sources,
+  dependencies: [glib_dep],
+  include_directories: inc,
+)
+
+qemu_common_dep = declare_dependency(
+  link_with: lib,
+  include_directories: inc,
+  dependencies: [glib_dep],
+)
diff --git a/subprojects/qemu-common/src/meson.build b/subprojects/qemu-common/src/meson.build
new file mode 100644
index 000000000000..d85a314065e5
--- /dev/null
+++ b/subprojects/qemu-common/src/meson.build
@@ -0,0 +1,5 @@
+sources += files(
+  'error-is-detailed.c',
+  'error-report.c',
+  'error-vprintf.c',
+)
diff --git a/util/meson.build b/util/meson.build
index 8cce8f8968f6..4dae6f815e31 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -28,7 +28,7 @@ util_ss.add(files('host-utils.c'))
 util_ss.add(files('bitmap.c', 'bitops.c'))
 util_ss.add(files('fifo8.c'))
 util_ss.add(files('cacheflush.c'))
-util_ss.add(files('error.c', 'error-report.c'))
+util_ss.add(files('error.c'))
 util_ss.add(files('qemu-print.c'))
 util_ss.add(files('id.c'))
 util_ss.add(files('qemu-config.c', 'notify.c'))
-- 
2.37.0.rc0


