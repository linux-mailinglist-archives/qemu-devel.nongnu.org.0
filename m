Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFEF427DBD
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 23:39:29 +0200 (CEST)
Received: from localhost ([::1]:60468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZK40-0000pc-Q2
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 17:39:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJir-000388-0l
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:17:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJip-0002de-FW
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:17:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633814254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ylGqsmrwEbiHQ6b11M8f27Vu9LcXipQBy+MGOyWaZBI=;
 b=WsdhjfYFkLEx2kFsid/oyjtHvOhVpf4/gHMOIqbzWvmdpR7+mYqAJQ6VnXNb1p1JxpkILM
 H8dtL21qqG/sKpeXRcZ4eBQKEXSdUZQkE1/Os583wgkPIzQ9P04OcK7MwTvfm5CORVs27h
 JrWNhImoMED0V1VLhgbR9JWJYmFI5Ro=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-RtPStId6MN6jK6nTLw1Y1A-1; Sat, 09 Oct 2021 17:17:33 -0400
X-MC-Unique: RtPStId6MN6jK6nTLw1Y1A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE4C7180830F
 for <qemu-devel@nongnu.org>; Sat,  9 Oct 2021 21:17:32 +0000 (UTC)
Received: from localhost (unknown [10.39.208.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C089319729;
 Sat,  9 Oct 2021 21:17:31 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 36/37] ui/dbus: register D-Bus VC handler
Date: Sun, 10 Oct 2021 01:08:37 +0400
Message-Id: <20211009210838.2219430-37-marcandre.lureau@redhat.com>
In-Reply-To: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
References: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
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

Export the default consoles over the D-Bus chardev.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/dbus.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/ui/dbus.c b/ui/dbus.c
index 38d6ccc607..97248ceadb 100644
--- a/ui/dbus.c
+++ b/ui/dbus.c
@@ -352,6 +352,57 @@ dbus_display_class_init(ObjectClass *oc, void *data)
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
+        name = "";
+        if (g_str_has_prefix(id, "compat_monitor")) {
+            name = "org.qemu.monitor.hmp.0";
+        }
+        if (g_str_has_prefix(id, "serial")) {
+            name = "org.qemu.console.serial.0";
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
@@ -365,6 +416,8 @@ early_dbus_init(DisplayOptions *opts)
 
         display_opengl = 1;
     }
+
+    type_register(&dbus_vc_type_info);
 }
 
 static void
-- 
2.33.0.721.g106298f7f9


