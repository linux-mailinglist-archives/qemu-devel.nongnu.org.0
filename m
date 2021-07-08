Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC67E3C1609
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:32:29 +0200 (CEST)
Received: from localhost ([::1]:35694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1W0q-00031V-OA
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:32:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmx-0000Pg-FK
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:07 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:43816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmt-0008C2-TL
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:06 -0400
Received: by mail-ed1-x533.google.com with SMTP id l26so696228eda.10
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yS67txh20muTm4sOoJL0IyygbCMlYYIPs+l1vf+oto0=;
 b=D0IuXa9PwoIgHrhZEJ7YXCRWHuqLJbmxvCuzqTi1OBhL2FBMerCYos9SD6Vou4FzDK
 pQyMVpYS0GGyTRGWsFDWYHXoaQ1kmdHqlnbEF4cWZgeuqjDPHmeaRUkLAW3QDEpyEoUW
 n5oREzzOIZ+LT5q94eIsYNup0+nFEHTjbZForz1Trn7ALVwrU6kGtDCxlEao1ZNduDnQ
 L9xNgzbgcmxjPXdoHLJVc1s2FffHSnzbdr0PCibF2dTLL0RLnbjDJ3xyYzlmSwEJXnm4
 fIXuXfbhLi93CaNifc5VmQnr6UCnkiLWXhfOKutm7G9cZGhTKILt8x1UjqwK6NoRPSax
 G8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yS67txh20muTm4sOoJL0IyygbCMlYYIPs+l1vf+oto0=;
 b=pOVmrzD5YbvieQKChmk0I1GsO2eVrXnO4zNpU7czvD1VpItMlBrk937GYwYx4SU3Eo
 GwwFbiFim7U8LFq6W6RPQd9ZQiiOpNOBOXeN2AtDor1MYxIFKgL9PK2hIM1cdT9LYODM
 7myJ/rWNWbKow45p2B5EzbxSblVFGa+EexqdeF4L6DrzJpF3wf5x5FK0LtuDPwKVLarl
 raEWGOtXWIPfQWO7PqSGCKwWK2PZgv6wtCIHH4Hq9wH2rOo2y8ORmLFHO91Url3k5DPY
 WXUqo5ZhSbT6vsnAMV10L9Ti338PmHXJ4OwaYoSyPTBVegOiQjq7CqxMhCaIG0ElddPX
 9NbQ==
X-Gm-Message-State: AOAM531FiPYwsF/4LMQNmQy2NCQZPAnzxsKyNJzU/D57Hm44xwZ+bcwA
 7zEcmQS/n6yQpp19DozUqzyw96jR784=
X-Google-Smtp-Source: ABdhPJw/iroLC2KBTj0HKgcr6TwFE9D8WEyQnLVNNVRiSl9QCFK6lM73DsRVFJ88RNiGUc/fnz8/Kw==
X-Received: by 2002:a05:6402:1103:: with SMTP id
 u3mr39144544edv.342.1625757482498; 
 Thu, 08 Jul 2021 08:18:02 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:18:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/48] modules: use modinfo for dependencies
Date: Thu,  8 Jul 2021 17:17:18 +0200
Message-Id: <20210708151748.408754-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Jose R . Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Use module database for module dependencies.
Drop hard-coded dependency list.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Jose R. Ziviani <jziviani@suse.de>
Message-Id: <20210624103836.2382472-15-kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/module.c | 55 ++++++++++++++++++++-------------------------------
 1 file changed, 21 insertions(+), 34 deletions(-)

diff --git a/util/module.c b/util/module.c
index 8d3e8275b9..7d7b69cbda 100644
--- a/util/module.c
+++ b/util/module.c
@@ -182,28 +182,6 @@ static int module_load_file(const char *fname, bool mayfail, bool export_symbols
 out:
     return ret;
 }
-
-static const struct {
-    const char *name;
-    const char *dep;
-} module_deps[] = {
-    { "audio-spice",    "ui-spice-core" },
-    { "chardev-spice",  "ui-spice-core" },
-    { "hw-display-qxl", "ui-spice-core" },
-    { "ui-spice-app",   "ui-spice-core" },
-    { "ui-spice-app",   "chardev-spice" },
-
-    { "hw-display-virtio-gpu-gl", "hw-display-virtio-gpu" },
-    { "hw-display-virtio-gpu-pci-gl", "hw-display-virtio-gpu-pci" },
-    { "hw-display-virtio-vga-gl", "hw-display-virtio-vga" },
-
-#ifdef CONFIG_OPENGL
-    { "ui-egl-headless", "ui-opengl"    },
-    { "ui-gtk",          "ui-opengl"    },
-    { "ui-sdl",          "ui-opengl"    },
-    { "ui-spice-core",   "ui-opengl"    },
-#endif
-};
 #endif
 
 bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
@@ -219,9 +197,11 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
     char *dirs[5];
     char *module_name;
     int i = 0, n_dirs = 0;
-    int ret, dep;
+    int ret;
     bool export_symbols = false;
     static GHashTable *loaded_modules;
+    const QemuModinfo *modinfo;
+    const char **sl;
 
     if (!g_module_supported()) {
         fprintf(stderr, "Module is not supported by system.\n");
@@ -234,23 +214,30 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
 
     module_name = g_strdup_printf("%s%s", prefix, lib_name);
 
-    for (dep = 0; dep < ARRAY_SIZE(module_deps); dep++) {
-        if (strcmp(module_name, module_deps[dep].name) == 0) {
-            /* we depend on another module */
-            module_load_one("", module_deps[dep].dep, false);
-        }
-        if (strcmp(module_name, module_deps[dep].dep) == 0) {
-            /* another module depends on us */
-            export_symbols = true;
-        }
-    }
-
     if (g_hash_table_contains(loaded_modules, module_name)) {
         g_free(module_name);
         return true;
     }
     g_hash_table_add(loaded_modules, module_name);
 
+    for (modinfo = module_info; modinfo->name != NULL; modinfo++) {
+        if (modinfo->deps) {
+            if (strcmp(modinfo->name, module_name) == 0) {
+                /* we depend on other module(s) */
+                for (sl = modinfo->deps; *sl != NULL; sl++) {
+                    module_load_one("", *sl, false);
+                }
+            } else {
+                for (sl = modinfo->deps; *sl != NULL; sl++) {
+                    if (strcmp(module_name, *sl) == 0) {
+                        /* another module depends on us */
+                        export_symbols = true;
+                    }
+                }
+            }
+        }
+    }
+
     search_dir = getenv("QEMU_MODULE_DIR");
     if (search_dir != NULL) {
         dirs[n_dirs++] = g_strdup_printf("%s", search_dir);
-- 
2.31.1



