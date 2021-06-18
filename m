Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3130B3AC2C6
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 07:09:03 +0200 (CEST)
Received: from localhost ([::1]:53830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lu6kY-00038P-8M
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 01:09:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lu6Xh-0005Zs-3d
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 00:55:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lu6Xf-0004Yo-If
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 00:55:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623992143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XLx3/j/xE0p8BLnxDaBxHeaYVuYg+U7FzwuVjHhHLY8=;
 b=Gas6Ja2BdWwDKHfsCs6UQtgz/0y6v4nyjo4iCNau61WEiUPfbnXEzmbvaMOFortShWvdEE
 ZArxSTTgg+1Lb7P9H4y3DzH+ioCfxbNRR5lGQMeWmoO3NBLuOfAg33Zl/aULE40KRwvfrx
 s0XhApA/TESiH9ywBIW2fE1g3n5bm2s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-jw52EjvOOUaZV-wKPT3D9A-1; Fri, 18 Jun 2021 00:55:39 -0400
X-MC-Unique: jw52EjvOOUaZV-wKPT3D9A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7ECA5802575;
 Fri, 18 Jun 2021 04:55:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C65985D9CC;
 Fri, 18 Jun 2021 04:55:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C55461803549; Fri, 18 Jun 2021 06:53:54 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/24] modules: use modinfo for qemu opts load
Date: Fri, 18 Jun 2021 06:53:44 +0200
Message-Id: <20210618045353.2510174-16-kraxel@redhat.com>
In-Reply-To: <20210618045353.2510174-1-kraxel@redhat.com>
References: <20210618045353.2510174-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

Use module database to figure which module adds given QemuOpts group.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 softmmu/vl.c        | 17 -----------------
 stubs/module-opts.c |  4 ----
 util/module.c       | 19 +++++++++++++++++++
 3 files changed, 19 insertions(+), 21 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index a4857ec43ff3..c91d63e3cc02 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2675,23 +2675,6 @@ void qmp_x_exit_preconfig(Error **errp)
     }
 }
 
-#ifdef CONFIG_MODULES
-void qemu_load_module_for_opts(const char *group)
-{
-    static bool spice_tried;
-    if (g_str_equal(group, "spice") && !spice_tried) {
-        ui_module_load_one("spice-core");
-        spice_tried = true;
-    }
-
-    static bool iscsi_tried;
-    if (g_str_equal(group, "iscsi") && !iscsi_tried) {
-        block_module_load_one("iscsi");
-        iscsi_tried = true;
-    }
-}
-#endif
-
 void qemu_init(int argc, char **argv, char **envp)
 {
     QemuOpts *opts;
diff --git a/stubs/module-opts.c b/stubs/module-opts.c
index a7d0e4ad6ead..5412429ea869 100644
--- a/stubs/module-opts.c
+++ b/stubs/module-opts.c
@@ -1,6 +1,2 @@
 #include "qemu/osdep.h"
 #include "qemu/config-file.h"
-
-void qemu_load_module_for_opts(const char *group)
-{
-}
diff --git a/util/module.c b/util/module.c
index 745ae0fb20ed..a9ec2da9972e 100644
--- a/util/module.c
+++ b/util/module.c
@@ -20,6 +20,7 @@
 #include "qemu/queue.h"
 #include "qemu/module.h"
 #include "qemu/cutils.h"
+#include "qemu/config-file.h"
 #ifdef CONFIG_MODULE_UPGRADES
 #include "qemu-version.h"
 #endif
@@ -322,8 +323,26 @@ void module_load_qom_all(void)
     module_loaded_qom_all = true;
 }
 
+void qemu_load_module_for_opts(const char *group)
+{
+    const QemuModinfo *modinfo;
+    const char **sl;
+
+    for (modinfo = module_info; modinfo->name != NULL; modinfo++) {
+        if (!modinfo->opts) {
+            continue;
+        }
+        for (sl = modinfo->opts; *sl != NULL; sl++) {
+            if (strcmp(group, *sl) == 0) {
+                module_load_one("", modinfo->name, false);
+            }
+        }
+    }
+}
+
 #else
 
+void qemu_load_module_for_opts(const char *group) {}
 void module_load_qom_one(const char *type) {}
 void module_load_qom_all(void) {}
 
-- 
2.31.1


