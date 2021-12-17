Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF07478F62
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 16:21:10 +0100 (CET)
Received: from localhost ([::1]:39444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myF2j-0007UQ-Bk
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 10:21:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1myEUd-0007SB-4g
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:45:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1myEUb-0002qm-J7
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:45:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639752353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/I9K6kD8hofZ3E5tucSZC0k9jpSA/jYzjNFhe+WbYHs=;
 b=Q9N+pupiuX17hrjjvnu0i/FtSgNZ7GEQrvO7LSDIPHViSDGjQNjiXI6YoIr1xiD7ht6SR3
 KRHVOhbBqZZFU7Tdwra6e/osMsln57jNJedpTT7fYQpBeG/U+wBAV4oPC3PhUutYrS/nMa
 Ui0twFKYwl4CVWA5Eja1/lKeQRZK+KU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-IRwTR05oNW6fJqdGY4mOAw-1; Fri, 17 Dec 2021 09:45:47 -0500
X-MC-Unique: IRwTR05oNW6fJqdGY4mOAw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7435344DD;
 Fri, 17 Dec 2021 14:45:46 +0000 (UTC)
Received: from localhost (unknown [10.39.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 516525E493;
 Fri, 17 Dec 2021 14:45:13 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 35/36] ui/dbus: register D-Bus VC handler
Date: Fri, 17 Dec 2021 18:37:55 +0400
Message-Id: <20211217143756.1831099-36-marcandre.lureau@redhat.com>
In-Reply-To: <20211217143756.1831099-1-marcandre.lureau@redhat.com>
References: <20211217143756.1831099-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org, kraxel@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Export the default consoles over the D-Bus chardev.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/dbus.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/ui/dbus.c b/ui/dbus.c
index 41f1716f255a..b2c1c9fb522c 100644
--- a/ui/dbus.c
+++ b/ui/dbus.c
@@ -357,6 +357,57 @@ dbus_display_class_init(ObjectClass *oc, void *data)
                                    get_gl_mode, set_gl_mode);
 }
 
+#define TYPE_CHARDEV_VC "chardev-vc"
+
+typedef struct DBusVCClass {
+    DBusChardevClass parent_class;
+
+    void (*parent_parse)(QemuOpts *opts, ChardevBackend *b, Error **errp);
+} DBusVCClass;
+
+DECLARE_CLASS_CHECKERS(DBusVCClass, DBUS_VC,
+                       TYPE_CHARDEV_VC)
+
+static void
+dbus_vc_parse(QemuOpts *opts, ChardevBackend *backend,
+              Error **errp)
+{
+    DBusVCClass *klass = DBUS_VC_CLASS(object_class_by_name(TYPE_CHARDEV_VC));
+    const char *name = qemu_opt_get(opts, "name");
+    const char *id = qemu_opts_id(opts);
+
+    if (name == NULL) {
+        if (g_str_has_prefix(id, "compat_monitor")) {
+            name = "org.qemu.monitor.hmp.0";
+        } else if (g_str_has_prefix(id, "serial")) {
+            name = "org.qemu.console.serial.0";
+        } else {
+            name = "";
+        }
+        if (!qemu_opt_set(opts, "name", name, errp)) {
+            return;
+        }
+    }
+
+    klass->parent_parse(opts, backend, errp);
+}
+
+static void
+dbus_vc_class_init(ObjectClass *oc, void *data)
+{
+    DBusVCClass *klass = DBUS_VC_CLASS(oc);
+    ChardevClass *cc = CHARDEV_CLASS(oc);
+
+    klass->parent_parse = cc->parse;
+    cc->parse = dbus_vc_parse;
+}
+
+static const TypeInfo dbus_vc_type_info = {
+    .name = TYPE_CHARDEV_VC,
+    .parent = TYPE_CHARDEV_DBUS,
+    .class_init = dbus_vc_class_init,
+};
+
 static void
 early_dbus_init(DisplayOptions *opts)
 {
@@ -370,6 +421,8 @@ early_dbus_init(DisplayOptions *opts)
 
         display_opengl = 1;
     }
+
+    type_register(&dbus_vc_type_info);
 }
 
 static void
-- 
2.34.1.8.g35151cf07204


