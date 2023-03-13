Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4726B7695
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 12:50:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbgfq-0000at-AT; Mon, 13 Mar 2023 07:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbgfW-000888-07
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:48:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbgfU-0004xV-Bb
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:48:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678708123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tCU3J7ltYDOiuEpkcpay2NUMcN9Mmty6BEjJzeBEQCg=;
 b=HVTRaHvODSh24iX8KKHICvrbWo/Z9rG+B1pjRybemraxfwBvXdi88A0y0aL7mUPvIRnAxQ
 2GzzXxp2HYsZqcb6JrO2qYOl8o0bkO6vUiLYIYuFsSN54zui7OLz3eYmDIDWf94vr5wAgW
 4ewJBOEie8cA5bRQ8upl9/EY56dQgQQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-ixd7Dxo1PMy90rE0Ajr1Fg-1; Mon, 13 Mar 2023 07:48:39 -0400
X-MC-Unique: ixd7Dxo1PMy90rE0Ajr1Fg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24A6B1C05EAC;
 Mon, 13 Mar 2023 11:48:39 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C535C158C2;
 Mon, 13 Mar 2023 11:48:38 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Thomas Huth <thuth@redhat.com>, Fam Zheng <fam@euphon.net>,
 Beraldo Leal <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PULL v2 23/25] libqtest: make qtest_qmp_add_client work on win32
Date: Mon, 13 Mar 2023 15:46:46 +0400
Message-Id: <20230313114648.426607-24-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114648.426607-1-marcandre.lureau@redhat.com>
References: <20230313114648.426607-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

Use the "get-win32-socket" function to pass an opened socket to QEMU,
instead of using "getfd", which relies on socket ancillary FD message
passing.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20230306122751.2355515-10-marcandre.lureau@redhat.com>
---
 tests/qtest/libqtest.h |  5 ++---
 tests/qtest/libqtest.c | 18 ++++++++++++++++--
 2 files changed, 18 insertions(+), 5 deletions(-)

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
index dee2032331..c3a0ef5bb4 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -1478,13 +1478,28 @@ void qtest_qmp_device_add(QTestState *qts, const char *driver, const char *id,
     qobject_unref(args);
 }
 
-#ifndef _WIN32
 void qtest_qmp_add_client(QTestState *qts, const char *protocol, int fd)
 {
     QDict *resp;
 
+#ifdef WIN32
+    WSAPROTOCOL_INFOW info;
+    g_autofree char *info64  = NULL;
+    SOCKET s;
+
+    assert(fd_is_socket(fd));
+    s = _get_osfhandle(fd);
+    if (WSADuplicateSocketW(s, GetProcessId((HANDLE)qts->qemu_pid), &info) == SOCKET_ERROR) {
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
@@ -1498,7 +1513,6 @@ void qtest_qmp_add_client(QTestState *qts, const char *protocol, int fd)
     g_assert(!qdict_haskey(resp, "error"));
     qobject_unref(resp);
 }
-#endif
 
 /*
  * Generic hot-unplugging test via the device_del QMP command.
-- 
2.39.2


