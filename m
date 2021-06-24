Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DFF3B2CE2
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 12:49:27 +0200 (CEST)
Received: from localhost ([::1]:54248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwMvG-0005eC-G6
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 06:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwMmh-0001hF-8R
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:40:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwMmf-0007eh-8M
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:40:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624531232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=upufv3ee/3vKBjf7VZFCoBl3nYBb7SBkOzTa1s1mn0o=;
 b=ivQECWXRKzHmQva2YsrUIubs/kutA4GabtSUtT2DELLfds2FE56kN3YXAkP8dlR95/LStG
 eGP646R/Hh1if4mqCOd7j+s+UYvbvoW7OLL1r1Jwt09Rz13zqvylXmrHLplqzfEpoCFpk8
 Exu4CO9IFZst2+id9tW8Zn6V+IvRD28=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-oHyH_RPnPIOZRujbQOQwoA-1; Thu, 24 Jun 2021 06:40:29 -0400
X-MC-Unique: oHyH_RPnPIOZRujbQOQwoA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9B55804145;
 Thu, 24 Jun 2021 10:40:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B77935D6A1;
 Thu, 24 Jun 2021 10:40:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AB5231803545; Thu, 24 Jun 2021 12:38:37 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 15/34] modules: use modinfo for qom load
Date: Thu, 24 Jun 2021 12:38:17 +0200
Message-Id: <20210624103836.2382472-16-kraxel@redhat.com>
In-Reply-To: <20210624103836.2382472-1-kraxel@redhat.com>
References: <20210624103836.2382472-1-kraxel@redhat.com>
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

Use module database to figure which module implements a given QOM type.
Drop hard-coded object list.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/module.c | 77 ++++++++++++++++-----------------------------------
 1 file changed, 24 insertions(+), 53 deletions(-)

diff --git a/util/module.c b/util/module.c
index 7d7b69cbdaca..745ae0fb20ed 100644
--- a/util/module.c
+++ b/util/module.c
@@ -280,80 +280,51 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
     return success;
 }
 
-/*
- * Building devices and other qom objects modular is mostly useful in
- * case they have dependencies to external shared libraries, so we can
- * cut down the core qemu library dependencies.  Which is the case for
- * only a very few devices & objects.
- *
- * So with the expectation that this will be rather the exception than
- * the rule and the list will not gain that many entries, go with a
- * simple manually maintained list for now.
- *
- * The list must be sorted by module (module_load_qom_all() needs this).
- */
-static struct {
-    const char *type;
-    const char *prefix;
-    const char *module;
-} const qom_modules[] = {
-    { "ccid-card-passthru",    "hw-", "usb-smartcard"         },
-    { "ccid-card-emulated",    "hw-", "usb-smartcard"         },
-    { "usb-redir",             "hw-", "usb-redirect"          },
-    { "qxl-vga",               "hw-", "display-qxl"           },
-    { "qxl",                   "hw-", "display-qxl"           },
-    { "virtio-gpu-device",     "hw-", "display-virtio-gpu"    },
-    { "virtio-gpu-gl-device",  "hw-", "display-virtio-gpu-gl" },
-    { "vhost-user-gpu",        "hw-", "display-virtio-gpu"    },
-    { "virtio-gpu-pci-base",   "hw-", "display-virtio-gpu-pci" },
-    { "virtio-gpu-pci",        "hw-", "display-virtio-gpu-pci" },
-    { "virtio-gpu-gl-pci",     "hw-", "display-virtio-gpu-pci-gl" },
-    { "vhost-user-gpu-pci",    "hw-", "display-virtio-gpu-pci" },
-    { "virtio-gpu-ccw",        "hw-", "s390x-virtio-gpu-ccw"   },
-    { "virtio-vga-base",       "hw-", "display-virtio-vga"    },
-    { "virtio-vga",            "hw-", "display-virtio-vga"    },
-    { "virtio-vga-gl",         "hw-", "display-virtio-vga-gl" },
-    { "vhost-user-vga",        "hw-", "display-virtio-vga"    },
-    { "chardev-braille",       "chardev-", "baum"             },
-    { "chardev-spicevmc",      "chardev-", "spice"            },
-    { "chardev-spiceport",     "chardev-", "spice"            },
-};
+#ifdef CONFIG_MODULES
 
 static bool module_loaded_qom_all;
 
 void module_load_qom_one(const char *type)
 {
-    int i;
+    const QemuModinfo *modinfo;
+    const char **sl;
 
     if (!type) {
         return;
     }
-    for (i = 0; i < ARRAY_SIZE(qom_modules); i++) {
-        if (strcmp(qom_modules[i].type, type) == 0) {
-            module_load_one(qom_modules[i].prefix,
-                            qom_modules[i].module,
-                            false);
-            return;
+
+    for (modinfo = module_info; modinfo->name != NULL; modinfo++) {
+        if (!modinfo->objs) {
+            continue;
+        }
+        for (sl = modinfo->objs; *sl != NULL; sl++) {
+            if (strcmp(type, *sl) == 0) {
+                module_load_one("", modinfo->name, false);
+            }
         }
     }
 }
 
 void module_load_qom_all(void)
 {
-    int i;
+    const QemuModinfo *modinfo;
 
     if (module_loaded_qom_all) {
         return;
     }
-    for (i = 0; i < ARRAY_SIZE(qom_modules); i++) {
-        if (i > 0 && (strcmp(qom_modules[i - 1].module,
-                             qom_modules[i].module) == 0 &&
-                      strcmp(qom_modules[i - 1].prefix,
-                             qom_modules[i].prefix) == 0)) {
-            /* one module implementing multiple types -> load only once */
+
+    for (modinfo = module_info; modinfo->name != NULL; modinfo++) {
+        if (!modinfo->objs) {
             continue;
         }
-        module_load_one(qom_modules[i].prefix, qom_modules[i].module, true);
+        module_load_one("", modinfo->name, false);
     }
     module_loaded_qom_all = true;
 }
+
+#else
+
+void module_load_qom_one(const char *type) {}
+void module_load_qom_all(void) {}
+
+#endif
-- 
2.31.1


