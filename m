Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCED4455D3C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 15:03:37 +0100 (CET)
Received: from localhost ([::1]:50228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mni0m-00026L-VF
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 09:03:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mnhaI-0008I0-Cu
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 08:36:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mnhaG-0002nb-9F
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 08:36:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637242571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7B2/7pto1JIgqLKbEslmOH4VFn6TU80oluTorY46zv0=;
 b=eA4adHdZ2nt4wJ9CHbLN9lo2Tl+egLf4nZ4G+o1ISZ/EGL0gRHYgo2K41TrsCO7uC8K/yd
 DVxH9EdZ3kirxLFk/mX/dlsHDHWXVMi5Ddo0rZi9xDWmPvrKGKGjlNueOjAX8c4r2lOdvX
 HQ8dqo0AUOcO1JUwTGOFITnFm9uk7mg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-2-K_2WdmOru8xEcE_ZJzKw-1; Thu, 18 Nov 2021 08:36:10 -0500
X-MC-Unique: 2-K_2WdmOru8xEcE_ZJzKw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73FE9100E326;
 Thu, 18 Nov 2021 13:36:09 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.194.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2522726DE2;
 Thu, 18 Nov 2021 13:35:09 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/5] libqtest: add a function to use a timeout when waiting
 for an event
Date: Thu, 18 Nov 2021 14:32:24 +0100
Message-Id: <20211118133225.324937-5-lvivier@redhat.com>
In-Reply-To: <20211118133225.324937-1-lvivier@redhat.com>
References: <20211118133225.324937-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Juan Quintela <quintela@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be able to check we _don't_ receive a given event, we need to
be able to stop to wait for it after a given amount of time.

To do that, introduce a timeout value in qtest_qmp_eventwait().
The new version of the function is qtest_qmp_eventwait_timeout(),
that uses the new function qtest_qmp_receive_dict_timeout().

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 tests/qtest/libqos/libqtest.h | 26 +++++++++++++++++++++++-
 tests/qtest/libqtest.c        | 37 ++++++++++++++++++++++++++++++-----
 tests/unit/test-qga.c         |  2 +-
 3 files changed, 58 insertions(+), 7 deletions(-)

diff --git a/tests/qtest/libqos/libqtest.h b/tests/qtest/libqos/libqtest.h
index 59e927119563..3f96afa5f431 100644
--- a/tests/qtest/libqos/libqtest.h
+++ b/tests/qtest/libqos/libqtest.h
@@ -209,6 +209,17 @@ void qtest_qmp_vsend_fds(QTestState *s, int *fds, size_t fds_num,
 void qtest_qmp_vsend(QTestState *s, const char *fmt, va_list ap)
     GCC_FMT_ATTR(2, 0);
 
+/**
+ * qtest_qmp_receive_dict_timeout:
+ * @s: #QTestState instance to operate on.
+ * @timeout: time to wait before aborting read
+ *
+ * Reads a QMP message from QEMU and returns the response.
+ * If a timeout is provided, return NULL if message is
+ * not received during the given amount of time
+ */
+QDict *qtest_qmp_receive_dict_timeout(QTestState *s, struct timeval *timeout);
+
 /**
  * qtest_qmp_receive_dict:
  * @s: #QTestState instance to operate on.
@@ -236,6 +247,19 @@ QDict *qtest_qmp_receive(QTestState *s);
  */
 void qtest_qmp_eventwait(QTestState *s, const char *event);
 
+/**
+ * qtest_qmp_eventwait_timeout:
+ * @s: #QTestState instance to operate on.
+ * @timeout: time to wait before aborting wait
+ * @event: event to wait for.
+ *
+ * Continuously polls for QMP responses until it receives the desired event
+ * or the timeout exausts.
+ * Returns a copy of the event for further investigation or NULL on timeout
+ */
+QDict *qtest_qmp_eventwait_timeout(QTestState *s, struct timeval *timeout,
+                                   const char *event);
+
 /**
  * qtest_qmp_eventwait_ref:
  * @s: #QTestState instance to operate on.
@@ -690,7 +714,7 @@ void qtest_remove_abrt_handler(void *data);
 void qtest_qmp_assert_success(QTestState *qts, const char *fmt, ...)
     GCC_FMT_ATTR(2, 3);
 
-QDict *qmp_fd_receive(int fd);
+QDict *qmp_fd_receive(int fd, struct timeval *timeout);
 void qmp_fd_vsend_fds(int fd, int *fds, size_t fds_num,
                       const char *fmt, va_list ap) GCC_FMT_ATTR(4, 0);
 void qmp_fd_vsend(int fd, const char *fmt, va_list ap) GCC_FMT_ATTR(2, 0);
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 25aeea385bfa..10e05d0c7aa8 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -599,7 +599,7 @@ static void qmp_response(void *opaque, QObject *obj, Error *err)
     g_assert(qmp->response);
 }
 
-QDict *qmp_fd_receive(int fd)
+QDict *qmp_fd_receive(int fd, struct timeval *timeout)
 {
     QMPResponseParser qmp;
     bool log = getenv("QTEST_LOG") != NULL;
@@ -610,6 +610,18 @@ QDict *qmp_fd_receive(int fd)
         ssize_t len;
         char c;
 
+        if (timeout) {
+            fd_set set;
+            int ret;
+
+            FD_ZERO(&set);
+            FD_SET(fd, &set);
+            ret = select(fd + 1, &set, NULL, NULL, timeout);
+            if (ret == 0) {
+                /* timeout */
+                return NULL;
+            }
+        }
         len = read(fd, &c, 1);
         if (len == -1 && errno == EINTR) {
             continue;
@@ -643,9 +655,14 @@ QDict *qtest_qmp_receive(QTestState *s)
     }
 }
 
+QDict *qtest_qmp_receive_dict_timeout(QTestState *s, struct timeval *timeout)
+{
+    return qmp_fd_receive(s->qmp_fd, timeout);
+}
+
 QDict *qtest_qmp_receive_dict(QTestState *s)
 {
-    return qmp_fd_receive(s->qmp_fd);
+    return qtest_qmp_receive_dict_timeout(s, NULL);
 }
 
 int qtest_socket_server(const char *socket_path)
@@ -729,7 +746,7 @@ QDict *qmp_fdv(int fd, const char *fmt, va_list ap)
 {
     qmp_fd_vsend_fds(fd, NULL, 0, fmt, ap);
 
-    return qmp_fd_receive(fd);
+    return qmp_fd_receive(fd, NULL);
 }
 
 QDict *qtest_vqmp_fds(QTestState *s, int *fds, size_t fds_num,
@@ -848,7 +865,8 @@ QDict *qtest_qmp_event_ref(QTestState *s, const char *event)
     return NULL;
 }
 
-QDict *qtest_qmp_eventwait_ref(QTestState *s, const char *event)
+QDict *qtest_qmp_eventwait_timeout(QTestState *s, struct timeval *timeout,
+                                   const char *event)
 {
     QDict *response = qtest_qmp_event_ref(s, event);
 
@@ -857,7 +875,11 @@ QDict *qtest_qmp_eventwait_ref(QTestState *s, const char *event)
     }
 
     for (;;) {
-        response = qtest_qmp_receive_dict(s);
+        response = qtest_qmp_receive_dict_timeout(s, timeout);
+        if (timeout != NULL && response == NULL) {
+            /* exit on timeout */
+            return NULL;
+        }
         if ((qdict_haskey(response, "event")) &&
             (strcmp(qdict_get_str(response, "event"), event) == 0)) {
             return response;
@@ -866,6 +888,11 @@ QDict *qtest_qmp_eventwait_ref(QTestState *s, const char *event)
     }
 }
 
+QDict *qtest_qmp_eventwait_ref(QTestState *s, const char *event)
+{
+    return qtest_qmp_eventwait_timeout(s, NULL, event);
+}
+
 void qtest_qmp_eventwait(QTestState *s, const char *event)
 {
     QDict *response;
diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
index 5cb140d1b53d..22aa6405aaec 100644
--- a/tests/unit/test-qga.c
+++ b/tests/unit/test-qga.c
@@ -174,7 +174,7 @@ static void test_qga_sync_delimited(gconstpointer fix)
         g_assert_cmpint(v, ==, 1);
     } while (c != 0xff);
 
-    ret = qmp_fd_receive(fixture->fd);
+    ret = qmp_fd_receive(fixture->fd, NULL);
     g_assert_nonnull(ret);
     qmp_assert_no_error(ret);
 
-- 
2.33.1


