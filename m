Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C8F662416
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 12:22:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqDD-0006Te-VY; Mon, 09 Jan 2023 06:21:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqD8-0006Qb-Km
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:21:02 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqD6-0001Be-K3
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:21:02 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 ay12-20020a05600c1e0c00b003d9ea12bafcso3328637wmb.3
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 03:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HjztAYhnpGeZaH9bHabVbRF7j7Z+gMhwa5mewUvtJyA=;
 b=Iy2VCGYUkhHBuxlW2PjsE51x0C3kayMvxrP/vzrsMoCpS+wVH/iWdw48n1XehMtjr4
 8/nb3A/IQpazu5lbhbjl8dUrxJVHK9BkU8pxVQM3ESaI2ngAmJOkKOWA0tDqnQh+JqzS
 rXlmQb/P2XHTsH7sTX2sW2fnrJVx+wn/HFHn/FbIuKpE/JP4/GQOrOm9cD9gAUhbBAvh
 Rq88Sw8QGIYf+EzMiL9csuPShILVefZvt0lyhn5/yNGMmxeVfdxX1G4oIKua1zovv38d
 cFYaTdylVPiAi7p0O6/7zgY8k3C3QTyPf1193UvMxyRH7wj9hN9I7eml8hyw5i8KcnJC
 ehiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HjztAYhnpGeZaH9bHabVbRF7j7Z+gMhwa5mewUvtJyA=;
 b=tHtTAHQnKPqxGYoQlDHTOGgi99PsUqUE66VBaKc6g8sYP4xisZciS3b3mH1b8NFdGa
 s2aSitoXVUXRU3+yvI4LjvrslmujNlrKzS9KXOUQ83izv/RPewAC8y4qyjfFuybTqxvh
 QCFG2fhuUNnblpriUf1nRGateYFPLpk6JofgIFZ8Ef8vAlE4ZhdK+xdh7n1DLjeJzZCj
 wc9l7VpuXD2OfDp4oS96uKFO+SmJo1zSDBGOBEFjVWD2Ob1Siv0AEMCHB1WKvvFkoXTZ
 nO/+zxePvJHOPEHY7hY9uVIg/gSwDGALS1dKe7aGrD8HLFl2CNId2+mv1qoz/ckMbZm2
 OcIg==
X-Gm-Message-State: AFqh2ko6USCStC5iReN/B2D6Kb+z23mlyGHqTb9DT4e/sAlaTYypVbYN
 Pc1e88iClgnk2IbggqzdKHzZyn7XgrU6w2sq
X-Google-Smtp-Source: AMrXdXvqudVznXCQR602NgX1Ez5b5rSV2ULfcjwe+wdOrVzUxYcTQDIiP37d8dTCxnA3vbqoOI1n9Q==
X-Received: by 2002:a1c:4c12:0:b0:3c6:e63e:89a6 with SMTP id
 z18-20020a1c4c12000000b003c6e63e89a6mr45934917wmf.2.1673263258353; 
 Mon, 09 Jan 2023 03:20:58 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a5d6686000000b002bb3229a03csm7298328wru.34.2023.01.09.03.20.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 03:20:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH] qom: Extract object_try_new() from qdev_new()
Date: Mon,  9 Jan 2023 12:20:56 +0100
Message-Id: <20230109112056.94385-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
 qom/object.c         | 23 +++++++++++++++++++++++
 3 files changed, 37 insertions(+), 21 deletions(-)

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
index ef7258a5e1..9cc5bf30ec 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -565,6 +565,18 @@ Object *object_new_with_class(ObjectClass *klass);
  */
 Object *object_new(const char *typename);
 
+/**
+ * object_try_new: Try to create an object on the heap
+ * @name: The name of the type of the object to instantiate.
+ * @errp: pointer to Error object.
+ *
+ * This is like object_new(), except it returns %NULL when type @name
+ * does not exist, rather than asserting.
+ *
+ * Returns: The newly allocated and instantiated object, or %NULL.
+ */
+Object *object_try_new(const char *name, Error **errp);
+
 /**
  * object_new_with_props:
  * @typename:  The name of the type of the object to instantiate.
diff --git a/qom/object.c b/qom/object.c
index e25f1e96db..6d3faaeb6e 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -755,6 +755,29 @@ Object *object_new(const char *typename)
 }
 
 
+Object *object_try_new(const char *name, Error **errp)
+{
+    TypeImpl *ti = type_get_by_name(name);
+
+    if (!ti) {
+#ifdef CONFIG_MODULES
+        int rv = module_load_qom(name, errp);
+        if (rv <= 0) {
+            error_report("could not find a module for type '%s'", name);
+            exit(1);
+        }
+        ti = type_get_by_name(name);
+#endif
+    }
+    if (!ti) {
+        error_setg(errp, "unknown type '%s'", name);
+        return NULL;
+    }
+
+    return object_new_with_type(ti);
+}
+
+
 Object *object_new_with_props(const char *typename,
                               Object *parent,
                               const char *id,
-- 
2.38.1


