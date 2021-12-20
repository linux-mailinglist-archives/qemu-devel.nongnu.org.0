Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F9447B2BA
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 19:18:14 +0100 (CET)
Received: from localhost ([::1]:38924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzNEi-0006Z3-VO
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 13:18:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzKmk-0006C2-Tf
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:41:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzKmg-0008Fr-Sc
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:41:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640014856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eGOiI6DWDn2n29JHORgKBF09JJJxcDoMUuEs2RnEKy0=;
 b=W///LkfBDIG8Y4F+3nr+um7qzAZRlLCrD8p4Xi0l/yUrykMjnUrop9nFcqb1N68SXWidOC
 QXV7hemsUH8dPh7d0pbxiqG8LjeLD9IN8ikRsl6SQugPq5Nn7ZZO9A+T9/IDKxwBfsMekn
 skto52Pv8I4nyu1P3bby3Kff/Sd9k4k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-MbykiSgiNZSzAxm6Snnl5Q-1; Mon, 20 Dec 2021 03:11:06 -0500
X-MC-Unique: MbykiSgiNZSzAxm6Snnl5Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73B261006AA2
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 08:11:05 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B7785BD0B;
 Mon, 20 Dec 2021 08:11:04 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH 1/4] tests/qtest: Add a function that checks whether a device
 is available
Date: Mon, 20 Dec 2021 09:10:51 +0100
Message-Id: <20211220081054.151515-2-thuth@redhat.com>
In-Reply-To: <20211220081054.151515-1-thuth@redhat.com>
References: <20211220081054.151515-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Devices might not always be compiled into the QEMU target binaries.
We already have the libqos framework that is good for handling such
situations, but some of the qtests are not a real good fit for the
libqos framework. Let's add a qtest_has_device() function for such
tests instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/libqos/libqtest.h |  8 +++++++
 tests/qtest/libqtest.c        | 44 +++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/tests/qtest/libqos/libqtest.h b/tests/qtest/libqos/libqtest.h
index dff6b31cf0..2df9397519 100644
--- a/tests/qtest/libqos/libqtest.h
+++ b/tests/qtest/libqos/libqtest.h
@@ -718,6 +718,14 @@ void qtest_cb_for_every_machine(void (*cb)(const char *machine),
  */
 bool qtest_has_machine(const char *machine);
 
+/**
+ * qtest_has_device:
+ * @device: The device to look for
+ *
+ * Returns: true if the device is available in the target binary.
+ */
+bool qtest_has_device(const char *device);
+
 /**
  * qtest_qmp_device_add_qdict:
  * @qts: QTestState instance to operate on
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 65ed949685..9e845002a1 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -1418,6 +1418,50 @@ bool qtest_has_machine(const char *machine)
     return false;
 }
 
+bool qtest_has_device(const char *device)
+{
+    static QList *list;
+    const QListEntry *p;
+    QObject *qobj;
+    QString *qstr;
+    QDict *devinfo;
+    int idx;
+
+    if (!list) {
+        QDict *resp;
+        QDict *args;
+        QTestState *qts = qtest_init("-machine none");
+
+        args = qdict_new();
+        qdict_put_bool(args, "abstract", false);
+        qdict_put_str(args, "implements", "device");
+
+        resp = qtest_qmp(qts, "{'execute': 'qom-list-types', 'arguments': %p }",
+                         args);
+        g_assert(qdict_haskey(resp, "return"));
+        list = qdict_get_qlist(resp, "return");
+        qobject_ref(list);
+        qobject_unref(resp);
+
+        qtest_quit(qts);
+    }
+
+    for (p = qlist_first(list), idx = 0; p; p = qlist_next(p), idx++) {
+        devinfo = qobject_to(QDict, qlist_entry_obj(p));
+        g_assert(devinfo);
+
+        qobj = qdict_get(devinfo, "name");
+        g_assert(qobj);
+        qstr = qobject_to(QString, qobj);
+        g_assert(qstr);
+        if (g_str_equal(qstring_get_str(qstr), device)) {
+            return true;
+        }
+    }
+
+    return false;
+}
+
 /*
  * Generic hot-plugging test via the device_add QMP commands.
  */
-- 
2.27.0


