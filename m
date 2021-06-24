Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9663B2CC5
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 12:47:09 +0200 (CEST)
Received: from localhost ([::1]:45460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwMt2-0008GF-JX
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 06:47:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwMmZ-0001Hz-T1
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:40:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwMmX-0007XR-E3
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:40:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624531224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z1pz9k2rmmLhyDliV2lpJY1rQ+SZks4bTgvJ1TED7xA=;
 b=ctYE8bayntDl2YDmFbHqv7oE1FulcyXZi3O4Juyel6xidM1V3sayst9F8vUvqJgflzb0C0
 dCpCqljTytqmHKKOcckYKmnpOOB3iT2cOMXZoveJGhTgdjz80xIIQkaHWc0qrtt6/frO+K
 b5WpQWBIrHkcxtuZfaHeSpcBvL3mBmE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-NoMoEedIMf60XwSWj0AKIQ-1; Thu, 24 Jun 2021 06:40:23 -0400
X-MC-Unique: NoMoEedIMf60XwSWj0AKIQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4AB0106B7DB;
 Thu, 24 Jun 2021 10:40:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E631F5D9F0;
 Thu, 24 Jun 2021 10:40:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A03871800D7B; Thu, 24 Jun 2021 12:38:37 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 14/34] modules: use modinfo for dependencies
Date: Thu, 24 Jun 2021 12:38:16 +0200
Message-Id: <20210624103836.2382472-15-kraxel@redhat.com>
In-Reply-To: <20210624103836.2382472-1-kraxel@redhat.com>
References: <20210624103836.2382472-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Lieven <pl@kamp.de>,
 Greg Kurz <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-s390x@nongnu.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use module database for module dependencies.
Drop hard-coded dependency list.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/module.c | 55 ++++++++++++++++++++-------------------------------
 1 file changed, 21 insertions(+), 34 deletions(-)

diff --git a/util/module.c b/util/module.c
index 8d3e8275b9f7..7d7b69cbdaca 100644
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


