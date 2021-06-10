Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5EA3A2446
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 08:09:40 +0200 (CEST)
Received: from localhost ([::1]:47106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrDsp-0005ly-It
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 02:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrDjf-0006JQ-SW
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 02:00:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrDjb-0002jP-LY
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 02:00:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623304806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ilWJmIOmzE/tV2g6nq5IRz80ZumBraLMUpE9F1YopUI=;
 b=NTo8nDIwyTvy1wNrSMPUlC1ki4tCQJJ+Q+vxszS526IkbmTJt8NFKfb9MqIPI1617GtnOg
 fvtikSY/jbBd88gXJvXZ5WFwKgLUrCzYFiJoWCgPxk0PrLMBW2orXqfJFK3DAXenqyCGXa
 5jPxPIOAuob3zioDtnfFQ0y2pSG62UM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-FR7mNNLmNhidZYaLE01l9g-1; Thu, 10 Jun 2021 02:00:03 -0400
X-MC-Unique: FR7mNNLmNhidZYaLE01l9g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57125107ACF6;
 Thu, 10 Jun 2021 06:00:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-69.ams2.redhat.com
 [10.36.113.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 72F255D6AD;
 Thu, 10 Jun 2021 05:59:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0F33918017FD; Thu, 10 Jun 2021 07:57:56 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/18] modules: use modinfo for dependencies
Date: Thu, 10 Jun 2021 07:57:51 +0200
Message-Id: <20210610055755.538119-15-kraxel@redhat.com>
In-Reply-To: <20210610055755.538119-1-kraxel@redhat.com>
References: <20210610055755.538119-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 berrange@redhat.com, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Lieven <pl@kamp.de>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use module database for module dependencies.
Drop hard-coded dependency list.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 util/module.c | 55 ++++++++++++++++++++-------------------------------
 1 file changed, 21 insertions(+), 34 deletions(-)

diff --git a/util/module.c b/util/module.c
index b0ea8c57d438..fd5fc059e14a 100644
--- a/util/module.c
+++ b/util/module.c
@@ -254,28 +254,6 @@ static int module_load_file(const char *fname, bool mayfail, bool export_symbols
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
@@ -289,9 +267,11 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
 #endif
     char *module_name;
     int i = 0;
-    int ret, dep;
+    int ret;
     bool export_symbols = false;
     static GHashTable *loaded_modules;
+    ModuleInfoList *modlist;
+    strList *sl;
 
     if (!g_module_supported()) {
         fprintf(stderr, "Module is not supported by system.\n");
@@ -304,17 +284,6 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
 
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
@@ -324,6 +293,24 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
     module_load_path_init();
     module_load_modinfo();
 
+    for (modlist = modinfo->list; modlist != NULL; modlist = modlist->next) {
+        if (modlist->value->has_deps) {
+            if (strcmp(modlist->value->name, module_name) == 0) {
+                /* we depend on other module(s) */
+                for (sl = modlist->value->deps; sl != NULL; sl = sl->next) {
+                    module_load_one("", sl->value, false);
+                }
+            } else {
+                for (sl = modlist->value->deps; sl != NULL; sl = sl->next) {
+                    if (strcmp(module_name, sl->value) == 0) {
+                        /* another module depends on us */
+                        export_symbols = true;
+                    }
+                }
+            }
+        }
+    }
+
     for (i = 0; i < module_ndirs; i++) {
         fname = g_strdup_printf("%s/%s%s",
                 module_dirs[i], module_name, CONFIG_HOST_DSOSUF);
-- 
2.31.1


