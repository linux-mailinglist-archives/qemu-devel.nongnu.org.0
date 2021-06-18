Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 449A33AC2C5
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 07:08:53 +0200 (CEST)
Received: from localhost ([::1]:53290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lu6kO-0002mc-8S
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 01:08:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lu6XV-0005Se-7u
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 00:55:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lu6XR-0004OU-PQ
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 00:55:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623992129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O2xcXu7/WxZd+2SLYEP4NHfXOgGjpI8y92uLWdyo4TM=;
 b=Z4YT7BmA2ykroaMaW6X2hiyKEUx1KI3Szn6O3pRor/jnUfHeCkz2JesKo4M1WSXiNXm8UU
 jJvveqQRM+o5DApXPVQeToZ3M9KuQIHmuKfe/bLLIBzANqf/QSxgOd/ZZupdrAQ2SgNgkg
 zgC8zZ7rW4jcNOtlMt18pcvCGDc/HZU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-GndOKKGuNMyFpmEluhiMJw-1; Fri, 18 Jun 2021 00:55:27 -0400
X-MC-Unique: GndOKKGuNMyFpmEluhiMJw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00A81818412;
 Fri, 18 Jun 2021 04:55:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C4795D6AC;
 Fri, 18 Jun 2021 04:55:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B67CA1803548; Fri, 18 Jun 2021 06:53:54 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/24] modules: use modinfo for qom load
Date: Fri, 18 Jun 2021 06:53:43 +0200
Message-Id: <20210618045353.2510174-15-kraxel@redhat.com>
In-Reply-To: <20210618045353.2510174-1-kraxel@redhat.com>
References: <20210618045353.2510174-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Peter Lieven <pl@kamp.de>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Reitz <mreitz@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use module database to figure which module implements a given QOM type.
Drop hard-coded object list.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
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


