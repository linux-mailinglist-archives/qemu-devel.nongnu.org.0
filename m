Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDA666243B
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 12:32:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqNu-0004aP-Bl; Mon, 09 Jan 2023 06:32:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqNo-0004ZW-L5
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:32:05 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqNm-00065w-TY
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:32:04 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 m8-20020a05600c3b0800b003d96f801c48so8745692wms.0
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 03:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=r1rdYLNqkSX2qdeXqI2te/tUCXyJShbNsUR5EfdPyEs=;
 b=kz5wjsiUN8nzijZp9YjXYAyL98/6EkAvwmLzJazHAOAt1vWhFEzkr9UCxNkASmmUx6
 A0dxaWU5S3TbbWqSVrUV3QELMmiNcvvrERXuTVYTP2cu2woHwcZHxgtH7KmL6xjc/kc6
 +j6Rc/w7N42pMrDvrZuN4wNKvHWZZRdvnLapUn5SSwSmC6ah2wqs/L5wsgTyD1zP29b2
 6hbEvz7qa02sI5MPsaT44hywCNii8tB01ew549GpI+VIg+5GgHw3ho629D+E2FW79Vne
 TAFnxO9rUusni9dsuNMhp/u8aGfRnWtA4b6crbL9XROqvI4WlpoTgVRtCvcduBddjAMk
 CMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r1rdYLNqkSX2qdeXqI2te/tUCXyJShbNsUR5EfdPyEs=;
 b=ZgCUysGw5xbuHgYZiKga4NZqMvGWp9s22skQvMEUn+YYVFfdp4yn1yE4AUVoeV47I5
 yR1iwpkgF4ij0f2bSN1Fmgo2x9gsXoxB0RNQO/6ngfDKrmttheCVDoUZHcJdT3GFSiOm
 SAGVaXyoR7qRLG6D0oz95Pykyv034LSZ2EA+s3otZ2bWGZl+uyEG9+zLN1KtSd2k3NzZ
 Q7X1kZgGc1/xE/wNoRtoWNKlxyvo9MFyOGUKWiOpl/aa1mHk8g9KmP6uU6aIW2vge576
 aypxT3uMrWndt6xUkAYqafmb0wNo3AaixNNRIGy1y9L5TwPt/Jgurr40lozdwUYpv3gy
 8YYw==
X-Gm-Message-State: AFqh2kobLbqyT0PFoIr7gHZ3XW0P2ELcoLBIuRGlEb+Jdcf9BJsBiEYX
 61PmrVzkuBFj7Tgf4N545ZD4f8MB2fmf3D+6
X-Google-Smtp-Source: AMrXdXvDNmuBtsRGEabP0LhQPNDeSF8iS8tYzFntRQ6JMGySngM0IbFFCXHWMc49oZDGVA6dGkcIIw==
X-Received: by 2002:a7b:c39a:0:b0:3d2:640:c4e5 with SMTP id
 s26-20020a7bc39a000000b003d20640c4e5mr44428292wmj.8.1673263920057; 
 Mon, 09 Jan 2023 03:32:00 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a05600c4f8700b003c6bd12ac27sm12575498wmq.37.2023.01.09.03.31.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 03:31:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH v2] qom: Extract object_try_new() from qdev_new()
Date: Mon,  9 Jan 2023 12:31:58 +0100
Message-Id: <20230109113158.1500-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

The module resolving in qdev_new() is specific to QOM, not to
QDev. Extract the code as a new QOM object_try_new() helper so
it can be reused by non-QDev code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
RFC because I'm wonder if we can't find a better name...

Also, should we refactor object_initialize() similarly,
having object_try_initialize(..., Error *)?
---
 hw/core/qdev.c       | 23 ++---------------------
 include/qom/object.h | 12 ++++++++++++
 qom/object.c         | 25 ++++++++++++++++++++++++-
 3 files changed, 38 insertions(+), 22 deletions(-)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index d759c4602c..3a076dcc7f 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -147,31 +147,12 @@ bool qdev_set_parent_bus(DeviceState *dev, BusState *bus, Error **errp)
 
 DeviceState *qdev_new(const char *name)
 {
-    ObjectClass *oc = object_class_by_name(name);
-#ifdef CONFIG_MODULES
-    if (!oc) {
-        int rv = module_load_qom(name, &error_fatal);
-        if (rv > 0) {
-            oc = object_class_by_name(name);
-        } else {
-            error_report("could not find a module for type '%s'", name);
-            exit(1);
-        }
-    }
-#endif
-    if (!oc) {
-        error_report("unknown type '%s'", name);
-        abort();
-    }
-    return DEVICE(object_new(name));
+    return DEVICE(object_try_new(name, &error_fatal));
 }
 
 DeviceState *qdev_try_new(const char *name)
 {
-    if (!module_object_class_by_name(name)) {
-        return NULL;
-    }
-    return DEVICE(object_new(name));
+    return DEVICE(object_try_new(name, NULL));
 }
 
 static QTAILQ_HEAD(, DeviceListener) device_listeners
diff --git a/include/qom/object.h b/include/qom/object.h
index ef7258a5e1..27059cafb7 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -565,6 +565,18 @@ Object *object_new_with_class(ObjectClass *klass);
  */
 Object *object_new(const char *typename);
 
+/**
+ * object_try_new: Try to create an object on the heap
+ * @typename: The name of the type of the object to instantiate.
+ * @errp: pointer to Error object.
+ *
+ * This is like object_new(), except it returns %NULL when type @typename
+ * does not exist, rather than asserting.
+ *
+ * Returns: The newly allocated and instantiated object, or %NULL.
+ */
+Object *object_try_new(const char *typename, Error **errp);
+
 /**
  * object_new_with_props:
  * @typename:  The name of the type of the object to instantiate.
diff --git a/qom/object.c b/qom/object.c
index e25f1e96db..13070393ef 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -747,14 +747,37 @@ Object *object_new_with_class(ObjectClass *klass)
     return object_new_with_type(klass->type);
 }
 
-Object *object_new(const char *typename)
+
+Object *object_try_new(const char *typename, Error **errp)
 {
     TypeImpl *ti = type_get_by_name(typename);
 
+#ifdef CONFIG_MODULES
+    if (!ti) {
+        int rv = module_load_qom(typename, errp);
+        if (rv) {
+            error_prepend(errp, "could not find a module for type '%s': ",
+                          typename);
+            return NULL;
+        }
+        ti = type_get_by_name(typename);
+    }
+#endif
+    if (!ti) {
+        error_setg(errp, "unknown type '%s'", typename);
+        return NULL;
+    }
+
     return object_new_with_type(ti);
 }
 
 
+Object *object_new(const char *typename)
+{
+    return object_try_new(typename, &error_fatal);
+}
+
+
 Object *object_new_with_props(const char *typename,
                               Object *parent,
                               const char *id,
-- 
2.38.1


