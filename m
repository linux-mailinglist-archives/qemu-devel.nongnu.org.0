Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A9B3A2448
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 08:11:00 +0200 (CEST)
Received: from localhost ([::1]:51836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrDu7-0000aF-Ni
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 02:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrDjg-0006KP-5Z
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 02:00:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrDjc-0002jf-1u
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 02:00:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623304807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tG1SibfhZXrEPT8UmEuDwzDuqqlJOstcdT6uPuEc/Gc=;
 b=f8wxIA7P/JtFHupueoj9rQ+TEIfubJmZVT08EWqB6RI4mHisyEBy771/0E93sly0X+GgF+
 aRLdYXj6mj3V5Eua9Ks6S8MS7e0V6KL6TdwlBG9FK+Vgi6rO1LObrlkEzOs7aCIu36pjfL
 KNPtfPydoqLRtawYTIS4QWvceQo0C98=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-qJLHKetPNgi3HSU4tdADkw-1; Thu, 10 Jun 2021 02:00:04 -0400
X-MC-Unique: qJLHKetPNgi3HSU4tdADkw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 767A8802939;
 Thu, 10 Jun 2021 06:00:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-69.ams2.redhat.com
 [10.36.113.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BCF2D5D6BA;
 Thu, 10 Jun 2021 05:59:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1A58218017FE; Thu, 10 Jun 2021 07:57:56 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/18] modules: use modinfo for qom load
Date: Thu, 10 Jun 2021 07:57:52 +0200
Message-Id: <20210610055755.538119-16-kraxel@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
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

Use module database to figure which module implements a given QOM type.
Drop hard-coded object list.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 util/module.c | 83 +++++++++++++++++++--------------------------------
 1 file changed, 30 insertions(+), 53 deletions(-)

diff --git a/util/module.c b/util/module.c
index fd5fc059e14a..46bec1cfbec7 100644
--- a/util/module.c
+++ b/util/module.c
@@ -333,80 +333,57 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
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
+    ModuleInfoList *modlist;
+    strList *sl;
 
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
+    module_load_path_init();
+    module_load_modinfo();
+
+    for (modlist = modinfo->list; modlist != NULL; modlist = modlist->next) {
+        if (!modlist->value->has_objs) {
+            continue;
+        }
+        for (sl = modlist->value->objs; sl != NULL; sl = sl->next) {
+            if (strcmp(type, sl->value) == 0) {
+                module_load_one("", modlist->value->name, false);
+            }
         }
     }
 }
 
 void module_load_qom_all(void)
 {
-    int i;
+    ModuleInfoList *modlist;
 
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
+    module_load_path_init();
+    module_load_modinfo();
+
+    for (modlist = modinfo->list; modlist != NULL; modlist = modlist->next) {
+        if (!modlist->value->has_objs) {
             continue;
         }
-        module_load_one(qom_modules[i].prefix, qom_modules[i].module, true);
+        module_load_one("", modlist->value->name, false);
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


