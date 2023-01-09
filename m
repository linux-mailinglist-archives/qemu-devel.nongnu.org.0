Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1E4663475
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 23:55:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF12J-0004kU-L9; Mon, 09 Jan 2023 17:54:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF12G-0004it-Ec
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 17:54:33 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF12D-0007iY-3V
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 17:54:31 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 m26-20020a05600c3b1a00b003d9811fcaafso8467487wms.5
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 14:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YYqX/y2WSbzyv4/4voOdSyLCRImF1qkdyFcZzZnQoeE=;
 b=Dq7fc4x5FZ1XWqZnc6T4Crb+TaPfYsYP6/UfphB8+x3XH0s9JvcVR9FKqek7MH2JSB
 cmOqUUEodUX9tF55KNRortWRvrHqLjrK+o2bMsQh4xDZax9MlD5htzPtdcWpDoecrWuJ
 4xZmtNRJJh4VYg0luJfMOLDtn8BG1xGI8qwHZ0va8TJx4gySm98922rBwyInTVVRex6x
 7zp9bArJmxr3cBM7QlOJLI8LMivvntJEv1XCHgp0gFdDmUI6WLwakTl/iZYviidfGx3e
 n/iRAnuDXxWTdIrxJAnOfmyjG6+kJqemXB/ewKL13fUVvyvNqj63f6C3xZj4g2f0hbq6
 obdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YYqX/y2WSbzyv4/4voOdSyLCRImF1qkdyFcZzZnQoeE=;
 b=bmfWVylhUtTlixU5UA/XxDi4H8/E7BqtSCTu2YANKdxoFAfIpEIrTZXn0Y17K4ABrO
 9Lw54OV3VcTqTHs2y0DxGib1xs+rsUoLqOtMJro/d646MvMWM/f3eaTvJZkV1UNKrd/b
 8u9zdMDoKGtneNwO0Up9pS2Dw83z7jf+yGzIIapUB7HnMrjJ0MQsjF1QaE0c/0wZ/XXa
 MFNgVKc1gFP2Nb8NNWBZSs9HHXTefr2cvdGheeYYJeuj6ptIG42aAyqIXplqkGp4WANI
 Qy3Xpz97bn9A3hPtBKHncH5zglp783k573WBDQW+KovZ7Vge52g4WtTNC/sC/lwvF0+A
 3w3Q==
X-Gm-Message-State: AFqh2kqlEnGnCfFgDiVLWDG/WdJPUUodXOBEpA8ACCfiVwh1FxzOSV3D
 hu33zjI8dVmvXQnGkupJEOixKxoYBrXTxxWB
X-Google-Smtp-Source: AMrXdXuFsx7zPGMau2/twXFH+qCYunDa0HlXe9ougrCXYOEZVMbANU5HyuVcuZ7884JAXmN3RCktSg==
X-Received: by 2002:a05:600c:1d98:b0:3d3:3d51:7d4b with SMTP id
 p24-20020a05600c1d9800b003d33d517d4bmr48804528wms.29.1673304867632; 
 Mon, 09 Jan 2023 14:54:27 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 16-20020a05600c22d000b003b4a699ce8esm16335702wmg.6.2023.01.09.14.54.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 14:54:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: [RFC PATCH 1/4] qom: Introduce object_class_property_deprecate()
Date: Mon,  9 Jan 2023 23:54:16 +0100
Message-Id: <20230109225419.22621-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109225419.22621-1-philmd@linaro.org>
References: <20230109225419.22621-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Introduce object_class_property_deprecate() to register
a QOM property as deprecated. When this property's getter /
setter is called, a deprecation warning is displayed on the
monitor.

Inspired-by: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qom/object.h | 17 +++++++++++++++++
 qom/object.c         | 23 +++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/include/qom/object.h b/include/qom/object.h
index ef7258a5e1..b76724292c 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -97,6 +97,7 @@ struct ObjectProperty
     ObjectPropertyInit *init;
     void *opaque;
     QObject *defval;
+    const char *deprecation_reason;
 };
 
 /**
@@ -1075,6 +1076,22 @@ ObjectProperty *object_class_property_add(ObjectClass *klass, const char *name,
                                           ObjectPropertyRelease *release,
                                           void *opaque);
 
+/**
+ * object_class_property_deprecate:
+ * @klass: the class to add a property to
+ * @name: the name of the property.  This can contain any character except for
+ *  a forward slash.  In general, you should use hyphens '-' instead of
+ *  underscores '_' when naming properties.
+ * @reason: the deprecation reason.
+ * @version_major: the major version since this property is deprecated.
+ * @version_minor: the minor version since this property is deprecated.
+ *
+ * Deprecate a class property.
+ */
+void object_class_property_deprecate(ObjectClass *klass,
+                                     const char *name, const char *reason,
+                                     int version_major, int version_minor);
+
 /**
  * object_property_set_default_bool:
  * @prop: the property to set
diff --git a/qom/object.c b/qom/object.c
index e25f1e96db..05b97cd424 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -1293,6 +1293,16 @@ object_class_property_add(ObjectClass *klass,
     return prop;
 }
 
+void object_class_property_deprecate(ObjectClass *klass,
+                                     const char *name, const char *reason,
+                                     int version_major, int version_minor)
+{
+    ObjectProperty *prop = object_class_property_find(klass, name);
+
+    assert(prop);
+    prop->deprecation_reason = reason;
+}
+
 ObjectProperty *object_property_find(Object *obj, const char *name)
 {
     ObjectProperty *prop;
@@ -1382,6 +1392,17 @@ void object_property_del(Object *obj, const char *name)
     g_hash_table_remove(obj->properties, name);
 }
 
+static void object_property_check_deprecation(const Object *obj,
+                                              const char *name,
+                                              const ObjectProperty *prop)
+{
+    if (!prop->deprecation_reason) {
+        return;
+    }
+    warn_report("Property '%s.%s' is deprecated (%s).",
+                object_get_typename(obj), name, prop->deprecation_reason);
+}
+
 bool object_property_get(Object *obj, const char *name, Visitor *v,
                          Error **errp)
 {
@@ -1392,6 +1413,7 @@ bool object_property_get(Object *obj, const char *name, Visitor *v,
         return false;
     }
 
+    object_property_check_deprecation(obj, name, prop);
     if (!prop->get) {
         error_setg(errp, "Property '%s.%s' is not readable",
                    object_get_typename(obj), name);
@@ -1412,6 +1434,7 @@ bool object_property_set(Object *obj, const char *name, Visitor *v,
         return false;
     }
 
+    object_property_check_deprecation(obj, name, prop);
     if (!prop->set) {
         error_setg(errp, "Property '%s.%s' is not writable",
                    object_get_typename(obj), name);
-- 
2.38.1


