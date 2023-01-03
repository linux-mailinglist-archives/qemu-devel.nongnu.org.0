Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6072A65BEAC
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 12:09:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCfAS-0006FF-Vj; Tue, 03 Jan 2023 06:09:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pCfAN-00061h-2r
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 06:09:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pCfAL-0005GE-4s
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 06:09:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672744148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u9ZSSTQmq45eN33CWPNOgaR1C1o4yK5Q/D6KawIPCV4=;
 b=btbtvZkjBkwXWC6ikf+9x1dV2NNPlmn5jB6hMhb+MX+XQFhnW+dsV1Gvyai7f3+DU3s7oc
 BApPmM1QJO6nqqxHhjiU87rv3I5goZ5943d3/AvKJYjDzKLBhStGRzfqoscAu05HlgV4Pj
 QIdFmklt3zxQZekQn6RrT7E+SEl1BnA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-k50zb7m1Nt2hOVRELwvlww-1; Tue, 03 Jan 2023 06:09:05 -0500
X-MC-Unique: k50zb7m1Nt2hOVRELwvlww-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 174D28F6E81;
 Tue,  3 Jan 2023 11:09:05 +0000 (UTC)
Received: from localhost (unknown [10.39.208.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B68340C2064;
 Tue,  3 Jan 2023 11:08:57 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 09/10] libqtest: make qtest_qmp_add_client work on win32
Date: Tue,  3 Jan 2023 15:08:13 +0400
Message-Id: <20230103110814.3726795-10-marcandre.lureau@redhat.com>
In-Reply-To: <20230103110814.3726795-1-marcandre.lureau@redhat.com>
References: <20230103110814.3726795-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124;
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

Use the "get-win32-socket" function to pass an opened socket to QEMU,
instead of using "getfd", which relies on socket ancillary FD message
passing.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/qtest/libqtest.h |  5 ++---
 tests/qtest/libqtest.c | 16 ++++++++++++++--
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/libqtest.h b/tests/qtest/libqtest.h
index fcf1c3c3b3..8d7d450963 100644
--- a/tests/qtest/libqtest.h
+++ b/tests/qtest/libqtest.h
@@ -758,17 +758,16 @@ void qtest_qmp_device_add_qdict(QTestState *qts, const char *drv,
 void qtest_qmp_device_add(QTestState *qts, const char *driver, const char *id,
                           const char *fmt, ...) G_GNUC_PRINTF(4, 5);
 
-#ifndef _WIN32
 /**
  * qtest_qmp_add_client:
  * @qts: QTestState instance to operate on
  * @protocol: the protocol to add to
  * @fd: the client file-descriptor
  *
- * Call QMP ``getfd`` followed by ``add_client`` with the given @fd.
+ * Call QMP ``getfd`` (on Windows ``get-win32-socket``) followed by
+ * ``add_client`` with the given @fd.
  */
 void qtest_qmp_add_client(QTestState *qts, const char *protocol, int fd);
-#endif /* _WIN32 */
 
 /**
  * qtest_qmp_device_del_send:
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 2fbc3b88f3..63ec328e27 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -1440,13 +1440,26 @@ void qtest_qmp_device_add(QTestState *qts, const char *driver, const char *id,
     qobject_unref(args);
 }
 
-#ifndef _WIN32
 void qtest_qmp_add_client(QTestState *qts, const char *protocol, int fd)
 {
     QDict *resp;
 
+#ifdef WIN32
+    WSAPROTOCOL_INFOW info;
+    g_autofree char *info64  = NULL;
+
+    assert(fd_is_socket(fd));
+    if (WSADuplicateSocketW(fd, GetProcessId((HANDLE)qts->qemu_pid), &info) == SOCKET_ERROR) {
+        g_autofree char *emsg = g_win32_error_message(WSAGetLastError());
+        g_error("WSADuplicateSocketW failed: %s", emsg);
+    }
+    info64 = g_base64_encode((guchar *)&info, sizeof(info));
+    resp = qtest_qmp(qts, "{'execute': 'get-win32-socket',"
+                     "'arguments': {'fdname': 'fdname', 'info': %s}}", info64);
+#else
     resp = qtest_qmp_fds(qts, &fd, 1, "{'execute': 'getfd',"
                          "'arguments': {'fdname': 'fdname'}}");
+#endif
     g_assert(resp);
     g_assert(!qdict_haskey(resp, "event")); /* We don't expect any events */
     g_assert(!qdict_haskey(resp, "error"));
@@ -1460,7 +1473,6 @@ void qtest_qmp_add_client(QTestState *qts, const char *protocol, int fd)
     g_assert(!qdict_haskey(resp, "error"));
     qobject_unref(resp);
 }
-#endif
 
 /*
  * Generic hot-unplugging test via the device_del QMP command.
-- 
2.39.0


