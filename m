Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A434547BB31
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 08:38:12 +0100 (CET)
Received: from localhost ([::1]:42706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzZit-0000ey-O8
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 02:38:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZEc-0001aL-Mj
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:06:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZEb-0002TW-6Z
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:06:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640070412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rfp9+UqiAP0EZ917IhNkGUo0n5NEeCrIQK7EF5hcVeQ=;
 b=JyZntYtVHbOZcH3DJqm4TrWpg967UWTltkpwDlRBWfGn7WgFLTA9yg6KJONc7p/IpMlQYA
 llIU2/DOXZj6Ao3UfmJT9qf1adzln9UFf11HACtPzXm42r45k3bg4dKlgICCsYfksy/iIM
 ihvVvvBNYns555jLHvGqci8sKPx1KR0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-TGXtbBFyPva3pPCbmSEFxg-1; Tue, 21 Dec 2021 02:06:49 -0500
X-MC-Unique: TGXtbBFyPva3pPCbmSEFxg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2CFF1006AA3;
 Tue, 21 Dec 2021 07:06:48 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6BF17A423;
 Tue, 21 Dec 2021 07:06:44 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 27/36] tests/qtests: add qtest_qmp_add_client()
Date: Tue, 21 Dec 2021 10:58:46 +0400
Message-Id: <20211221065855.142578-28-marcandre.lureau@redhat.com>
In-Reply-To: <20211221065855.142578-1-marcandre.lureau@redhat.com>
References: <20211221065855.142578-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 tests/qtest/libqos/libqtest.h | 10 ++++++++++
 tests/qtest/libqtest.c        | 19 +++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/tests/qtest/libqos/libqtest.h b/tests/qtest/libqos/libqtest.h
index dff6b31cf0ec..a6d38d7ef7fb 100644
--- a/tests/qtest/libqos/libqtest.h
+++ b/tests/qtest/libqos/libqtest.h
@@ -744,6 +744,16 @@ void qtest_qmp_device_add_qdict(QTestState *qts, const char *drv,
 void qtest_qmp_device_add(QTestState *qts, const char *driver, const char *id,
                           const char *fmt, ...) GCC_FMT_ATTR(4, 5);
 
+/**
+ * qtest_qmp_add_client:
+ * @qts: QTestState instance to operate on
+ * @protocol: the protocol to add to
+ * @fd: the client file-descriptor
+ *
+ * Call QMP ``getfd`` followed by ``add_client`` with the given @fd.
+ */
+void qtest_qmp_add_client(QTestState *qts, const char *protocol, int fd);
+
 /**
  * qtest_qmp_device_del:
  * @qts: QTestState instance to operate on
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 65ed9496850f..a68326caae98 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -1453,6 +1453,25 @@ void qtest_qmp_device_add(QTestState *qts, const char *driver, const char *id,
     qobject_unref(args);
 }
 
+void qtest_qmp_add_client(QTestState *qts, const char *protocol, int fd)
+{
+    QDict *resp;
+
+    resp = qtest_qmp_fds(qts, &fd, 1, "{'execute': 'getfd',"
+                         "'arguments': {'fdname': 'fdname'}}");
+    g_assert(resp);
+    g_assert(!qdict_haskey(resp, "event")); /* We don't expect any events */
+    g_assert(!qdict_haskey(resp, "error"));
+    qobject_unref(resp);
+
+    resp = qtest_qmp(
+        qts, "{'execute': 'add_client',"
+        "'arguments': {'protocol': %s, 'fdname': 'fdname'}}", protocol);
+    g_assert(resp);
+    g_assert(!qdict_haskey(resp, "event")); /* We don't expect any events */
+    g_assert(!qdict_haskey(resp, "error"));
+    qobject_unref(resp);
+}
 
 /*
  * Generic hot-unplugging test via the device_del QMP command.
-- 
2.34.1.8.g35151cf07204


