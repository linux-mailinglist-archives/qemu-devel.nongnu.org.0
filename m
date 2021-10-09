Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A89427DAC
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 23:32:11 +0200 (CEST)
Received: from localhost ([::1]:44394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZJwv-0006Hr-Qv
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 17:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJgy-0008FR-2o
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:15:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJgw-0000er-Hu
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:15:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633814138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PRkXeSP6ETCUdxwQfTaFba7yDVJU9soHf1hHPoFa6yg=;
 b=DJa109zitw+aD18ePkE/3BE55Gf/gYEo0Is5yLsHpkO+aevvOWlo0jMk9hnS6wBI/mDVny
 PEM1paZn7LlSKYj8Qu1dw+YKAZkccMRC6VAP3+y33VTkPISlqWxQOCwuVSjiK4Z9J3esm4
 9E+8VwSs1UVwDyplF6PJs6mB8ljJWog=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-k9HYE73KM16Qd4Q-M4zqNQ-1; Sat, 09 Oct 2021 17:15:36 -0400
X-MC-Unique: k9HYE73KM16Qd4Q-M4zqNQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07B5F1005E68
 for <qemu-devel@nongnu.org>; Sat,  9 Oct 2021 21:15:36 +0000 (UTC)
Received: from localhost (unknown [10.39.208.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E15D5C1B4;
 Sat,  9 Oct 2021 21:15:06 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 28/37] tests/qtests: add qtest_qmp_add_client()
Date: Sun, 10 Oct 2021 01:08:29 +0400
Message-Id: <20211009210838.2219430-29-marcandre.lureau@redhat.com>
In-Reply-To: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
References: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/qtest/libqos/libqtest.h | 10 ++++++++++
 tests/qtest/libqtest.c        | 19 +++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/tests/qtest/libqos/libqtest.h b/tests/qtest/libqos/libqtest.h
index a68dcd79d4..9e5f9118f3 100644
--- a/tests/qtest/libqos/libqtest.h
+++ b/tests/qtest/libqos/libqtest.h
@@ -728,6 +728,16 @@ void qtest_qmp_device_add_qdict(QTestState *qts, const char *drv,
 void qtest_qmp_device_add(QTestState *qts, const char *driver, const char *id,
                           const char *fmt, ...) GCC_FMT_ATTR(4, 5);
 
+/**
+ * qtest_qmp_add_client:
+ * @qts: QTestState instance to operate on
+ * @protocol: the protocol to add to
+ * @fd: the client file-descriptor
+ *
+ * Call QMP `getfd` followed by `add_client` with the given @fd.
+ */
+void qtest_qmp_add_client(QTestState *qts, const char *protocol, int fd);
+
 /**
  * qtest_qmp_device_del:
  * @qts: QTestState instance to operate on
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 73f6b977a6..c8ea5499a0 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -1367,6 +1367,25 @@ void qtest_qmp_device_add(QTestState *qts, const char *driver, const char *id,
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
2.33.0.721.g106298f7f9


