Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C3A4BD9A7
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 13:24:15 +0100 (CET)
Received: from localhost ([::1]:46140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM7ji-0006Bf-PS
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 07:24:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nM7Ny-0003vv-Ui
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:01:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nM7Nw-0000rp-5j
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:01:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645444901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wzILVnORyrCUAEcq9KcRbskLTX/U0oDc7w4lvZ/PRQ0=;
 b=apTAmzF4KEcCmvsryUwZTPFoBy7tgR0R51yQg57sDs/Czh4RgZb4zn5IqYWOb0qyoqpZIa
 ClG89P+nidulmPNWNknPJ876Wa4gjCuTMugrTgt0tCahS0y1wo+e3+OiNHRopnPQ6bDKDq
 Tmxcx9S6En7mvv6Vhi42S7Uq9wYa4CA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-gbDvowx5N7GRaBIYJHtYHg-1; Mon, 21 Feb 2022 07:01:38 -0500
X-MC-Unique: gbDvowx5N7GRaBIYJHtYHg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F30271091DA2;
 Mon, 21 Feb 2022 12:01:36 +0000 (UTC)
Received: from thuth.com (unknown [10.39.195.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F260073162;
 Mon, 21 Feb 2022 12:01:35 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/25] tests/qtest: failover: use a macro for check_one_card()
Date: Mon, 21 Feb 2022 12:59:50 +0100
Message-Id: <20220221120008.600114-8-thuth@redhat.com>
In-Reply-To: <20220221120008.600114-1-thuth@redhat.com>
References: <20220221120008.600114-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

This allows g_assert() to correctly report the line number of the error
in the test case.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Message-Id: <20220203141537.972317-3-lvivier@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/virtio-net-failover.c | 47 ++++++++++++++-----------------
 1 file changed, 21 insertions(+), 26 deletions(-)

diff --git a/tests/qtest/virtio-net-failover.c b/tests/qtest/virtio-net-failover.c
index 207c133012..070e53de12 100644
--- a/tests/qtest/virtio-net-failover.c
+++ b/tests/qtest/virtio-net-failover.c
@@ -224,32 +224,27 @@ static char *get_mac(QTestState *qts, const char *name)
     return mac;
 }
 
-static void check_one_card(QTestState *qts, bool present,
-                           const char *id, const char *mac)
-{
-    QDict *device;
-    QDict *bus;
-    char *addr;
-
-    bus = get_bus(qts, 0);
-    device = find_device(bus, id);
-    if (present) {
-        char *path;
-
-        g_assert_nonnull(device);
-        qobject_unref(device);
-
-        path = g_strdup_printf("/machine/peripheral/%s", id);
-        addr = get_mac(qts, path);
-        g_free(path);
-        g_assert_cmpstr(mac, ==, addr);
-        g_free(addr);
-    } else {
-       g_assert_null(device);
-    }
-
-    qobject_unref(bus);
-}
+#define check_one_card(qts, present, id, mac)                   \
+do {                                                            \
+    QDict *device;                                              \
+    QDict *bus;                                                 \
+    char *addr;                                                 \
+    bus = get_bus(qts, 0);                                      \
+    device = find_device(bus, id);                              \
+    if (present) {                                              \
+        char *path;                                             \
+        g_assert_nonnull(device);                               \
+        qobject_unref(device);                                  \
+        path = g_strdup_printf("/machine/peripheral/%s", id);   \
+        addr = get_mac(qts, path);                              \
+        g_free(path);                                           \
+        g_assert_cmpstr(mac, ==, addr);                         \
+        g_free(addr);                                           \
+    } else {                                                    \
+       g_assert_null(device);                                   \
+    }                                                           \
+    qobject_unref(bus);                                         \
+} while (0)
 
 static void test_on(void)
 {
-- 
2.27.0


