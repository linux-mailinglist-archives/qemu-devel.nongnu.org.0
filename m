Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E23913B2D07
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 12:55:37 +0200 (CEST)
Received: from localhost ([::1]:49612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwN1E-0004TC-VJ
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 06:55:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwMmr-0002HQ-Bk
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:40:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwMmn-0007lH-HV
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:40:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624531240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D/bXIG09hYZhS65KPP0cOBUtgVTWw6OXVodp3CnFZz0=;
 b=QLIkdO5zlLq0XzzxiUmtttZatl1An5ZCa53+Tr/+FOxqkVDmPUfnRALtkw4TRcQsIbDBvR
 r9E9XODYUO2Um5cN/tb6nmyaeANYMCKxJb+NbqEA41WTwBH7zOJccOij6k69CVk1+1cMP6
 JMQ4Q9KMxbM0SXugYWc+O2Or7PAbOTs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-G2f7xLolOwiHXsDYW76f1Q-1; Thu, 24 Jun 2021 06:40:39 -0400
X-MC-Unique: G2f7xLolOwiHXsDYW76f1Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59A6F100C609;
 Thu, 24 Jun 2021 10:40:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 53EA060CCC;
 Thu, 24 Jun 2021 10:40:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BA29D1803546; Thu, 24 Jun 2021 12:38:37 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 16/34] modules: use modinfo for qemu opts load
Date: Thu, 24 Jun 2021 12:38:18 +0200
Message-Id: <20210624103836.2382472-17-kraxel@redhat.com>
In-Reply-To: <20210624103836.2382472-1-kraxel@redhat.com>
References: <20210624103836.2382472-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Use module database to figure which module adds given QemuOpts group.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c        | 17 -----------------
 stubs/module-opts.c |  4 ----
 util/module.c       | 19 +++++++++++++++++++
 3 files changed, 19 insertions(+), 21 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index e001505d79f7..5c26e80126db 100644
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


