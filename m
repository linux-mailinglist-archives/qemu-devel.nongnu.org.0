Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2CD69E0CF
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 13:52:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUS4T-0005DO-9N; Tue, 21 Feb 2023 07:48:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUS4Q-0005By-Hv
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 07:48:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUS4O-0007rR-UF
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 07:48:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676983712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S2PvE1cjZP1ZciStLs3CYU472dk0qnAXOur+kOuxm+U=;
 b=ThbZJRlZsHYYfUWv/BECSUKoeN7x5tUGclOugWD06dxJsCxuPpkyPEcs3Y2/mYzSxkmueI
 RU4G+/2AqdlU5zLvx1AZaq7KhO57CcWeWlDl/Y2MHh9KCJDNJ0LUNd3oq7QaOP4zxKEB4c
 bVhy7cXyPDiDv6iStiY+Mx0NTKs+rO4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-DB-jNlbINqCWod17fAEcuw-1; Tue, 21 Feb 2023 07:48:28 -0500
X-MC-Unique: DB-jNlbINqCWod17fAEcuw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D3040381458C;
 Tue, 21 Feb 2023 12:48:27 +0000 (UTC)
Received: from localhost (unknown [10.39.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C84D140EBF6;
 Tue, 21 Feb 2023 12:48:26 +0000 (UTC)
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
Subject: [PATCH v3 05/16] error: add global &error_warn destination
Date: Tue, 21 Feb 2023 16:47:50 +0400
Message-Id: <20230221124802.4103554-6-marcandre.lureau@redhat.com>
In-Reply-To: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
References: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This can help debugging issues or develop, when error handling is
introduced.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qapi/error.h           |  6 ++++++
 tests/unit/test-error-report.c | 18 ++++++++++++++++++
 util/error.c                   | 10 +++++++---
 3 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/include/qapi/error.h b/include/qapi/error.h
index d798faeec3..f21a231bb1 100644
--- a/include/qapi/error.h
+++ b/include/qapi/error.h
@@ -519,6 +519,12 @@ static inline void error_propagator_cleanup(ErrorPropagator *prop)
 
 G_DEFINE_AUTO_CLEANUP_CLEAR_FUNC(ErrorPropagator, error_propagator_cleanup);
 
+/*
+ * Special error destination to warn on error.
+ * See error_setg() and error_propagate() for details.
+ */
+extern Error *error_warn;
+
 /*
  * Special error destination to abort on error.
  * See error_setg() and error_propagate() for details.
diff --git a/tests/unit/test-error-report.c b/tests/unit/test-error-report.c
index b09650687b..54319c86c9 100644
--- a/tests/unit/test-error-report.c
+++ b/tests/unit/test-error-report.c
@@ -12,6 +12,7 @@
 #include <locale.h>
 
 #include "qemu/error-report.h"
+#include "qapi/error.h"
 
 static void
 test_error_report_simple(void)
@@ -103,6 +104,22 @@ test_error_report_timestamp(void)
 ");
 }
 
+static void
+test_error_warn(void)
+{
+    if (g_test_subprocess()) {
+        error_setg(&error_warn, "Testing &error_warn");
+        return;
+    }
+
+    g_test_trap_subprocess(NULL, 0, 0);
+    g_test_trap_assert_passed();
+    g_test_trap_assert_stderr("\
+test-error-report: warning: Testing &error_warn*\
+");
+}
+
+
 int
 main(int argc, char *argv[])
 {
@@ -116,6 +133,7 @@ main(int argc, char *argv[])
     g_test_add_func("/error-report/glog", test_error_report_glog);
     g_test_add_func("/error-report/once", test_error_report_once);
     g_test_add_func("/error-report/timestamp", test_error_report_timestamp);
+    g_test_add_func("/error-report/warn", test_error_warn);
 
     return g_test_run();
 }
diff --git a/util/error.c b/util/error.c
index 1e7af665b8..5537245da6 100644
--- a/util/error.c
+++ b/util/error.c
@@ -27,8 +27,9 @@ struct Error
 
 Error *error_abort;
 Error *error_fatal;
+Error *error_warn;
 
-static void error_handle_fatal(Error **errp, Error *err)
+static void error_handle(Error **errp, Error *err)
 {
     if (errp == &error_abort) {
         fprintf(stderr, "Unexpected error in %s() at %s:%d:\n",
@@ -43,6 +44,9 @@ static void error_handle_fatal(Error **errp, Error *err)
         error_report_err(err);
         exit(1);
     }
+    if (errp == &error_warn) {
+        warn_report_err(err);
+    }
 }
 
 G_GNUC_PRINTF(6, 0)
@@ -71,7 +75,7 @@ static void error_setv(Error **errp,
     err->line = line;
     err->func = func;
 
-    error_handle_fatal(errp, err);
+    error_handle(errp, err);
     *errp = err;
 
     errno = saved_errno;
@@ -284,7 +288,7 @@ void error_propagate(Error **dst_errp, Error *local_err)
     if (!local_err) {
         return;
     }
-    error_handle_fatal(dst_errp, local_err);
+    error_handle(dst_errp, local_err);
     if (dst_errp && !*dst_errp) {
         *dst_errp = local_err;
     } else {
-- 
2.39.2


