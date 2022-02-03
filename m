Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE524A86D1
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 15:45:51 +0100 (CET)
Received: from localhost ([::1]:33072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFdMr-0004OM-Rz
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 09:45:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1nFcvV-0005al-09
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 09:17:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1nFcvM-00068y-Ql
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 09:17:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643897747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wtm1moNUp0Y/PzBiO/jjq6Zvsj5+zV+lje5Cpnu/7aw=;
 b=PLwh8oHo4JxQTfTuWjOWpzk9FIZJZ0EHn2JNEPTTUm0suNEi/PIeOoQeohs062lbEj7hAg
 23rjHYoJgXPZASHBQ4s5cx+dMx14krHZI5pwyeOaazHathCnoz/FYmol37FGBGpQSFwXXS
 yo0mrSbbmvBG97aYxCCv5uc8p2htwkk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-d28GMLCXPtiXKmbsASyfgA-1; Thu, 03 Feb 2022 09:15:45 -0500
X-MC-Unique: d28GMLCXPtiXKmbsASyfgA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0235D1006AA8
 for <qemu-devel@nongnu.org>; Thu,  3 Feb 2022 14:15:45 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.193.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB7EF108648E;
 Thu,  3 Feb 2022 14:15:42 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/7] tests/qtest: failover: use a macro for check_one_card()
Date: Thu,  3 Feb 2022 15:15:32 +0100
Message-Id: <20220203141537.972317-3-lvivier@redhat.com>
In-Reply-To: <20220203141537.972317-1-lvivier@redhat.com>
References: <20220203141537.972317-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows g_assert() to correctly report the line number of the error
in the test case.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 tests/qtest/virtio-net-failover.c | 47 ++++++++++++++-----------------
 1 file changed, 21 insertions(+), 26 deletions(-)

diff --git a/tests/qtest/virtio-net-failover.c b/tests/qtest/virtio-net-failover.c
index 207c1330125b..070e53de1292 100644
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
2.34.1


