Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8BC65C641
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:28:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClrb-00007I-43; Tue, 03 Jan 2023 13:18:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClqO-0008Fh-Re
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:22 -0500
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClqN-00057M-0l
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:00 -0500
Received: by mail-vs1-xe30.google.com with SMTP id l184so3937022vsc.0
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J7OuKp2SIiYS9GaSHXxTFNZ32lT6tsgO1dGcaZ2HR4g=;
 b=b871uOS6Xkw8z3HcmEedVNBPFlwD9FEUsYwcASN2ZtFtj/vjdRftO4kH84IjPXp3BP
 27XZIxu9qLVkhWk6c/CiGibZHHCqjcHAQaiTKHPyxaf6Hmp+OozZ52ouDL4Ka7IygXzX
 EfZdip7SfMh5Qr9ErhoAVE/tHzNUwis16P8MpU5hqlRyp3c4/CXZCPEvPtwoK/Dzgb5k
 ffhAt0iYXk5Vwlpn5XYaI3KgY4ab6Kj64Dj0SiIum40b5rs1u6FoePfZYsmASQZ0OldG
 3Us8A1zzKKAqUOcrku+r5zATMIuaak2kAeeraeR4tTqmdeFxuOsBB2gsgFeMUVKEeafN
 dhwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J7OuKp2SIiYS9GaSHXxTFNZ32lT6tsgO1dGcaZ2HR4g=;
 b=R43fS63V3FcQESZufkswddkOiVnhkyuvG+vMRNC5Q+3aardDdDwAektGT/v/EHGtLk
 OjD30j51EVonGyqPILP9NhKCOp5PeQGzQXS5vZukzFm4VSSD6q+Erk7QJMZG8ZJVDTqD
 5MJYhGkWvyNIAoM35svOOAHp3HdCegBen1BtdqejO2bsXqGPHEZx7yBOKw8SDggd6MaW
 Pmtr5zcQl1RYvFBDTnAaRnae7LNGoDvWX/sWeAxxWeW2Bq+cwI0eJ5Di/GqHrLoLBH+L
 /Kxdf968CYU03w5QMP7taUYjabdzFKxKEkS5CZptsjXwd53yyULUDqu3M8TOmce3XA7i
 LH7w==
X-Gm-Message-State: AFqh2kq3RXdmKhsmZ/ztGCdsOkk4+dOdb+QO2/44iXa35TEUslDt1Ec9
 uL0pee+g9RBgkXKiYSNEP5BGkoN4cpk7ay3Td64=
X-Google-Smtp-Source: AMrXdXvDWvKm6K+MTUG8Ilkg+5tnNyDqD04NIEWu3pxa5d8qkJ7ll5uIiPWquq/yrUkkFX2xpAqJUw==
X-Received: by 2002:a05:6102:3d26:b0:3b2:d3f2:63bd with SMTP id
 i38-20020a0561023d2600b003b2d3f263bdmr23125449vsv.29.1672769817811; 
 Tue, 03 Jan 2023 10:16:57 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006fed2788751sm23042354qkp.76.2023.01.03.10.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:16:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 02/40] qom: Introduce class_late_init
Date: Tue,  3 Jan 2023 10:16:08 -0800
Message-Id: <20230103181646.55711-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=richard.henderson@linaro.org; helo=mail-vs1-xe30.google.com
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

Create a new class initialization hook, to be called immediately
before creation of the first instance.  Most class initialization
happens quite early, which makes interaction between classes
difficult.  E.g. cpu objects often depend on the accellerator,
or the global properties coming from the command-line.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qom/object.h |  4 ++++
 qom/object.c         | 55 +++++++++++++++++++++++++++++++++++++-------
 2 files changed, 51 insertions(+), 8 deletions(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index ef7258a5e1..86958abe15 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -402,6 +402,9 @@ struct Object
  *   parent class initialization has occurred, but before the class itself
  *   is initialized.  This is the function to use to undo the effects of
  *   memcpy from the parent class to the descendants.
+ * @class_late_init: This function is called for all base classes just
+ *   before the first object is created.  This is the function to use to
+ *   apply properties (which are interpreted quite late).
  * @class_data: Data to pass to the @class_init,
  *   @class_base_init. This can be useful when building dynamic
  *   classes.
@@ -425,6 +428,7 @@ struct TypeInfo
 
     void (*class_init)(ObjectClass *klass, void *data);
     void (*class_base_init)(ObjectClass *klass, void *data);
+    bool (*class_late_init)(ObjectClass *klass, Error **errp);
     void *class_data;
 
     InterfaceInfo *interfaces;
diff --git a/qom/object.c b/qom/object.c
index e25f1e96db..82a5c7d36e 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -56,6 +56,7 @@ struct TypeImpl
 
     void (*class_init)(ObjectClass *klass, void *data);
     void (*class_base_init)(ObjectClass *klass, void *data);
+    bool (*class_late_init)(ObjectClass *klass, Error **errp);
 
     void *class_data;
 
@@ -64,6 +65,7 @@ struct TypeImpl
     void (*instance_finalize)(Object *obj);
 
     bool abstract;
+    bool object_created;
 
     const char *parent;
     TypeImpl *parent_type;
@@ -121,6 +123,7 @@ static TypeImpl *type_new(const TypeInfo *info)
 
     ti->class_init = info->class_init;
     ti->class_base_init = info->class_base_init;
+    ti->class_late_init = info->class_late_init;
     ti->class_data = info->class_data;
 
     ti->instance_init = info->instance_init;
@@ -367,6 +370,26 @@ static void type_initialize(TypeImpl *ti)
     }
 }
 
+static bool type_late_initialize(TypeImpl *ti, ObjectClass *cls, Error **errp)
+{
+    TypeImpl *pi = type_get_parent(ti);
+    if (pi && !type_late_initialize(pi, cls, errp)) {
+        return false;
+    }
+
+    for (GSList *e = ti->class->interfaces; e ; e = e->next) {
+        InterfaceClass *ic = e->data;
+        if (!type_late_initialize(ic->interface_type, cls, errp)) {
+            return false;
+        }
+    }
+
+    if (ti->class_late_init) {
+        return ti->class_late_init(cls, errp);
+    }
+    return true;
+}
+
 static void object_init_with_type(Object *obj, TypeImpl *ti)
 {
     if (type_has_parent(ti)) {
@@ -502,7 +525,8 @@ static void object_class_property_init_all(Object *obj)
     }
 }
 
-static void object_initialize_with_type(Object *obj, size_t size, TypeImpl *type)
+static bool object_initialize_with_type(Object *obj, size_t size,
+                                        TypeImpl *type, Error **errp)
 {
     type_initialize(type);
 
@@ -510,6 +534,13 @@ static void object_initialize_with_type(Object *obj, size_t size, TypeImpl *type
     g_assert(type->abstract == false);
     g_assert(size >= type->instance_size);
 
+    if (!type->object_created) {
+        type->object_created = true;
+        if (!type_late_initialize(type, type->class, errp)) {
+            return false;
+        }
+    }
+
     memset(obj, 0, type->instance_size);
     obj->class = type->class;
     object_ref(obj);
@@ -518,6 +549,7 @@ static void object_initialize_with_type(Object *obj, size_t size, TypeImpl *type
                                             NULL, object_property_free);
     object_init_with_type(obj, type);
     object_post_init_with_type(obj, type);
+    return true;
 }
 
 void object_initialize(void *data, size_t size, const char *typename)
@@ -540,7 +572,7 @@ void object_initialize(void *data, size_t size, const char *typename)
         abort();
     }
 
-    object_initialize_with_type(data, size, type);
+    object_initialize_with_type(data, size, type, &error_fatal);
 }
 
 bool object_initialize_child_with_props(Object *parentobj,
@@ -712,7 +744,7 @@ typedef union {
 } qemu_max_align_t;
 #endif
 
-static Object *object_new_with_type(Type type)
+static Object *object_new_with_type(Type type, Error **errp)
 {
     Object *obj;
     size_t size, align;
@@ -736,22 +768,25 @@ static Object *object_new_with_type(Type type)
         obj_free = qemu_vfree;
     }
 
-    object_initialize_with_type(obj, size, type);
-    obj->free = obj_free;
+    if (!object_initialize_with_type(obj, size, type, errp)) {
+        obj_free(obj);
+        return NULL;
+    }
 
+    obj->free = obj_free;
     return obj;
 }
 
 Object *object_new_with_class(ObjectClass *klass)
 {
-    return object_new_with_type(klass->type);
+    return object_new_with_type(klass->type, &error_fatal);
 }
 
 Object *object_new(const char *typename)
 {
     TypeImpl *ti = type_get_by_name(typename);
 
-    return object_new_with_type(ti);
+    return object_new_with_type(ti, &error_fatal);
 }
 
 
@@ -792,7 +827,11 @@ Object *object_new_with_propv(const char *typename,
         error_setg(errp, "object type '%s' is abstract", typename);
         return NULL;
     }
-    obj = object_new_with_type(klass->type);
+
+    obj = object_new_with_type(klass->type, errp);
+    if (!obj) {
+        return NULL;
+    }
 
     if (!object_set_propv(obj, errp, vargs)) {
         goto error;
-- 
2.34.1


