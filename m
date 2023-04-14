Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F596E2807
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 18:06:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnLvC-0006qo-Mt; Fri, 14 Apr 2023 12:05:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pnLuk-0006S3-Q2
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 12:04:47 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pnLui-0007z7-Du
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 12:04:42 -0400
Received: by mail-wr1-x431.google.com with SMTP id r20so2227606wra.5
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 09:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681488277; x=1684080277;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=87Eys71a5bFDwpsmcqiXjalsGOMTQZkXpUaxljHCLjI=;
 b=Lkv7hQWdIlA2sElrxSUtHPNg4UUF+/pMmmAB5iBfBiSP6hz/+L1/iAytdkjdaALLr8
 F1GVjHMQ99qOBDE23t2pXSpoFe0kUvHQBbNg7jPSYR/BVBtOo3hRjuhRfNcd88/luB9N
 rBpCIzB1Y9tY+p72b+QRHqRtXGJC+4USvPU9TqNQZbbwJEfMPD0ivv8p/sNwonnMdH76
 2IrAaCqe7w7YVX8cHy543Q2idXIgyZZDDDlg6pxvpUQMMzbCmVhfle3Clmw7mYNcKfE5
 ANOQFG9xHDCz5+tkO6hd9ozTrgmcX9boEez6MwSvCZt4YwKcXBMe3PgChfnO+LdSdwG/
 YmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681488277; x=1684080277;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=87Eys71a5bFDwpsmcqiXjalsGOMTQZkXpUaxljHCLjI=;
 b=jpuUgpW3ZUSxFT5vC180nYckjg9G47WAOOQpsBsHvmGsyyP7Kndge6PXYLTkuO/nTC
 ZNQzULQww3/v7H3rghuz7AUUmYaSXXUOspcxj5A3ndI/Ld5A8G9JmsucMm7uygsa1sin
 HOyFXJbWejy7qa2IZP85FXjNAGM5V+6x6z/l1H/AzINLlByL6lnqAZI/xwaOCw2vH6f2
 3jPqrXyg449rNVABSO6pxYi4JV9EzCXD6q4l8hVb2fSy3T+nCtZ7vgt5s52HmhpbExyf
 o7MQ+dGxfJhqJtdKhiqcxlJmVAq8WxLT7tX+RrVELSKviYG1kMAJQFYGiTqy/pHuUw2Z
 dfZA==
X-Gm-Message-State: AAQBX9dSzAIMR/YfsiBCRWJ+K5JWkKxHth9Ytvm4NVWyU9PQsDKbOX0+
 xqafG9bx+ayVgq+ALl65GVH9vA==
X-Google-Smtp-Source: AKy350byxJ+PBV33IFiDvwwjeVrv5fTjj5ozDL9nB8qISHiD/79Sw9Bq3ynjrrvleZee23Mbd//GTQ==
X-Received: by 2002:a5d:6587:0:b0:2ce:a6f6:edca with SMTP id
 q7-20020a5d6587000000b002cea6f6edcamr4865810wru.55.1681488277527; 
 Fri, 14 Apr 2023 09:04:37 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a5d5404000000b002efb121b75fsm3830886wrv.58.2023.04.14.09.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 09:04:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BBB191FFB7;
 Fri, 14 Apr 2023 17:04:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 virtio-fs@redhat.com, Erik Schilling <erik.schilling@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 08/12] qom: allow for properties to become "fixed"
Date: Fri, 14 Apr 2023 17:04:29 +0100
Message-Id: <20230414160433.2096866-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230414160433.2096866-1-alex.bennee@linaro.org>
References: <20230414160433.2096866-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When specialising general purpose objects it is sometimes useful to
"fix" some of the properties that were configurable by the base
classes. We will use this facility when specialising
vhost-user-device.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 qapi/qom.json           |  2 ++
 include/qom/object.h    | 16 +++++++++++++++-
 qom/object.c            | 14 ++++++++++++++
 qom/object_interfaces.c |  9 ++++++---
 qom/qom-qmp-cmds.c      |  1 +
 softmmu/qdev-monitor.c  |  1 +
 6 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index a877b879b9..4cda191f00 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -33,12 +33,14 @@
 # @description: if specified, the description of the property.
 #
 # @default-value: the default value, if any (since 5.0)
+# @fixed: if specified if value has been fixed (since 8.1)
 #
 # Since: 1.2
 ##
 { 'struct': 'ObjectPropertyInfo',
   'data': { 'name': 'str',
             'type': 'str',
+            'fixed': 'bool',
             '*description': 'str',
             '*default-value': 'any' } }
 
diff --git a/include/qom/object.h b/include/qom/object.h
index ef7258a5e1..f18d1a8254 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -97,6 +97,8 @@ struct ObjectProperty
     ObjectPropertyInit *init;
     void *opaque;
     QObject *defval;
+    /** @fixed: if the property has been fixed at its default */
+    bool fixed;
 };
 
 /**
@@ -1111,6 +1113,17 @@ void object_property_set_default_int(ObjectProperty *prop, int64_t value);
  */
 void object_property_set_default_uint(ObjectProperty *prop, uint64_t value);
 
+/**
+ * object_property_fix_default_uint:
+ * @prop: the property to be fixed
+ * @value: the fixed value to be written to the property
+ *
+ * When specialising an object it may make send to fix some values and
+ * not allow them to be changed. This can only be applied to
+ * properties that previously had a default and now cannot be changed.
+ */
+void object_property_fix_default_uint(ObjectProperty *prop, uint64_t value);
+
 /**
  * object_property_find:
  * @obj: the object
@@ -1961,13 +1974,14 @@ size_t object_type_get_instance_size(const char *typename);
  * object_property_help:
  * @name: the name of the property
  * @type: the type of the property
+ * @fixed: has the value been fixed
  * @defval: the default value
  * @description: description of the property
  *
  * Returns: a user-friendly formatted string describing the property
  * for help purposes.
  */
-char *object_property_help(const char *name, const char *type,
+char *object_property_help(const char *name, const char *type, bool fixed,
                            QObject *defval, const char *description);
 
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(Object, object_unref)
diff --git a/qom/object.c b/qom/object.c
index e25f1e96db..b5aba3ffc8 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -1584,6 +1584,20 @@ void object_property_set_default_uint(ObjectProperty *prop, uint64_t value)
     object_property_set_default(prop, QOBJECT(qnum_from_uint(value)));
 }
 
+static void object_property_fix_default(ObjectProperty *prop, QObject *defval)
+{
+    g_assert(prop->init == object_property_init_defval);
+    g_assert(!prop->fixed);
+
+    prop->defval = defval;
+    prop->fixed = true;
+}
+
+void object_property_fix_default_uint(ObjectProperty *prop, uint64_t value)
+{
+    object_property_fix_default(prop, QOBJECT(qnum_from_uint(value)));
+}
+
 bool object_property_set_uint(Object *obj, const char *name,
                               uint64_t value, Error **errp)
 {
diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index 7d31589b04..e351938f8f 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -161,7 +161,7 @@ void user_creatable_add_qapi(ObjectOptions *options, Error **errp)
     visit_free(v);
 }
 
-char *object_property_help(const char *name, const char *type,
+char *object_property_help(const char *name, const char *type, bool fixed,
                            QObject *defval, const char *description)
 {
     GString *str = g_string_new(NULL);
@@ -179,7 +179,9 @@ char *object_property_help(const char *name, const char *type,
     if (defval) {
         g_autofree char *def_json = g_string_free(qobject_to_json(defval),
                                                   false);
-        g_string_append_printf(str, " (default: %s)", def_json);
+        g_string_append_printf(str, " (%s: %s)",
+                               fixed ? "fixed" : "default",
+                               def_json);
     }
 
     return g_string_free(str, false);
@@ -220,7 +222,8 @@ bool type_print_class_properties(const char *type)
 
         g_ptr_array_add(array,
                         object_property_help(prop->name, prop->type,
-                                             prop->defval, prop->description));
+                                             prop->fixed, prop->defval,
+                                             prop->description));
     }
     g_ptr_array_sort(array, (GCompareFunc)qemu_pstrcmp0);
     if (array->len > 0) {
diff --git a/qom/qom-qmp-cmds.c b/qom/qom-qmp-cmds.c
index 7c087299de..f4cdf4ddde 100644
--- a/qom/qom-qmp-cmds.c
+++ b/qom/qom-qmp-cmds.c
@@ -55,6 +55,7 @@ ObjectPropertyInfoList *qmp_qom_list(const char *path, Error **errp)
 
         value->name = g_strdup(prop->name);
         value->type = g_strdup(prop->type);
+        value->fixed = prop->fixed;
     }
 
     return props;
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index b8d2c4dadd..b56b2af2f2 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -315,6 +315,7 @@ int qdev_device_help(QemuOpts *opts)
         g_ptr_array_add(array,
                         object_property_help(prop->value->name,
                                              prop->value->type,
+                                             prop->value->fixed,
                                              prop->value->default_value,
                                              prop->value->description));
     }
-- 
2.39.2


