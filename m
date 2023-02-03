Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FF868929E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 09:49:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNrif-0000RG-J8; Fri, 03 Feb 2023 03:46:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrhv-0008NH-HR
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:46:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrhm-0007VY-Nn
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:46:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675413957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pV0ngyMkaJWR46MrYMc8EHrrr7K9TEVRukWDUf3i/LM=;
 b=ag9gyDoQhnZTaxzS6hrrrDJM3Yj/Ffkzz/oK3fO1zkqdUNrNHl3HTm4ERgJzh5/We2fgzL
 joKTNvAkiVzL0i51XCcosr6eDXVOYkPLK1hVndUiJyZrhFymRPkviziOFwbAP+qHo/t6tD
 NplNsbjecdVYtgN8LbTlhQp+c40Mel4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-aJoI-HScNLGT72LVZN0e1A-1; Fri, 03 Feb 2023 03:45:54 -0500
X-MC-Unique: aJoI-HScNLGT72LVZN0e1A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ECF5229AA2E3;
 Fri,  3 Feb 2023 08:45:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A44DC40ED76D;
 Fri,  3 Feb 2023 08:45:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E6C8B21E6925; Fri,  3 Feb 2023 09:45:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Stefan Berger <stefanb@linux.ibm.com>
Subject: [PULL 23/35] tpm: Move HMP commands from monitor/ to softmmu/
Date: Fri,  3 Feb 2023 09:45:37 +0100
Message-Id: <20230203084549.2622302-24-armbru@redhat.com>
In-Reply-To: <20230203084549.2622302-1-armbru@redhat.com>
References: <20230203084549.2622302-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

This moves these commands from MAINTAINERS section "Human
Monitor (HMP)" to "TPM".

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230124121946.1139465-21-armbru@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
---
 MAINTAINERS            |  2 +-
 monitor/hmp-cmds.c     | 54 -----------------------------------
 softmmu/tpm-hmp-cmds.c | 65 ++++++++++++++++++++++++++++++++++++++++++
 softmmu/meson.build    |  1 +
 4 files changed, 67 insertions(+), 55 deletions(-)
 create mode 100644 softmmu/tpm-hmp-cmds.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 3bd4d101d3..dab4def753 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3067,7 +3067,7 @@ T: git https://github.com/stefanha/qemu.git tracing
 TPM
 M: Stefan Berger <stefanb@linux.ibm.com>
 S: Maintained
-F: softmmu/tpm.c
+F: softmmu/tpm*
 F: hw/tpm/*
 F: include/hw/acpi/tpm.h
 F: include/sysemu/tpm*
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 6b1d5358f7..81f63fa8ec 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -22,7 +22,6 @@
 #include "qapi/qapi-commands-misc.h"
 #include "qapi/qapi-commands-run-state.h"
 #include "qapi/qapi-commands-stats.h"
-#include "qapi/qapi-commands-tpm.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
 #include "qemu/cutils.h"
@@ -126,59 +125,6 @@ void hmp_info_pic(Monitor *mon, const QDict *qdict)
                                    hmp_info_pic_foreach, mon);
 }
 
-void hmp_info_tpm(Monitor *mon, const QDict *qdict)
-{
-#ifdef CONFIG_TPM
-    TPMInfoList *info_list, *info;
-    Error *err = NULL;
-    unsigned int c = 0;
-    TPMPassthroughOptions *tpo;
-    TPMEmulatorOptions *teo;
-
-    info_list = qmp_query_tpm(&err);
-    if (err) {
-        monitor_printf(mon, "TPM device not supported\n");
-        error_free(err);
-        return;
-    }
-
-    if (info_list) {
-        monitor_printf(mon, "TPM device:\n");
-    }
-
-    for (info = info_list; info; info = info->next) {
-        TPMInfo *ti = info->value;
-        monitor_printf(mon, " tpm%d: model=%s\n",
-                       c, TpmModel_str(ti->model));
-
-        monitor_printf(mon, "  \\ %s: type=%s",
-                       ti->id, TpmType_str(ti->options->type));
-
-        switch (ti->options->type) {
-        case TPM_TYPE_PASSTHROUGH:
-            tpo = ti->options->u.passthrough.data;
-            monitor_printf(mon, "%s%s%s%s",
-                           tpo->path ? ",path=" : "",
-                           tpo->path ?: "",
-                           tpo->cancel_path ? ",cancel-path=" : "",
-                           tpo->cancel_path ?: "");
-            break;
-        case TPM_TYPE_EMULATOR:
-            teo = ti->options->u.emulator.data;
-            monitor_printf(mon, ",chardev=%s", teo->chardev);
-            break;
-        case TPM_TYPE__MAX:
-            break;
-        }
-        monitor_printf(mon, "\n");
-        c++;
-    }
-    qapi_free_TPMInfoList(info_list);
-#else
-    monitor_printf(mon, "TPM device not supported\n");
-#endif /* CONFIG_TPM */
-}
-
 void hmp_quit(Monitor *mon, const QDict *qdict)
 {
     monitor_suspend(mon);
diff --git a/softmmu/tpm-hmp-cmds.c b/softmmu/tpm-hmp-cmds.c
new file mode 100644
index 0000000000..9ed6ad6c4d
--- /dev/null
+++ b/softmmu/tpm-hmp-cmds.c
@@ -0,0 +1,65 @@
+/*
+ * HMP commands related to TPM
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * (at your option) any later version.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/qapi-commands-tpm.h"
+#include "monitor/monitor.h"
+#include "monitor/hmp.h"
+#include "qapi/error.h"
+
+void hmp_info_tpm(Monitor *mon, const QDict *qdict)
+{
+#ifdef CONFIG_TPM
+    TPMInfoList *info_list, *info;
+    Error *err = NULL;
+    unsigned int c = 0;
+    TPMPassthroughOptions *tpo;
+    TPMEmulatorOptions *teo;
+
+    info_list = qmp_query_tpm(&err);
+    if (err) {
+        monitor_printf(mon, "TPM device not supported\n");
+        error_free(err);
+        return;
+    }
+
+    if (info_list) {
+        monitor_printf(mon, "TPM device:\n");
+    }
+
+    for (info = info_list; info; info = info->next) {
+        TPMInfo *ti = info->value;
+        monitor_printf(mon, " tpm%d: model=%s\n",
+                       c, TpmModel_str(ti->model));
+
+        monitor_printf(mon, "  \\ %s: type=%s",
+                       ti->id, TpmType_str(ti->options->type));
+
+        switch (ti->options->type) {
+        case TPM_TYPE_PASSTHROUGH:
+            tpo = ti->options->u.passthrough.data;
+            monitor_printf(mon, "%s%s%s%s",
+                           tpo->path ? ",path=" : "",
+                           tpo->path ?: "",
+                           tpo->cancel_path ? ",cancel-path=" : "",
+                           tpo->cancel_path ?: "");
+            break;
+        case TPM_TYPE_EMULATOR:
+            teo = ti->options->u.emulator.data;
+            monitor_printf(mon, ",chardev=%s", teo->chardev);
+            break;
+        case TPM_TYPE__MAX:
+            break;
+        }
+        monitor_printf(mon, "\n");
+        c++;
+    }
+    qapi_free_TPMInfoList(info_list);
+#else
+    monitor_printf(mon, "TPM device not supported\n");
+#endif /* CONFIG_TPM */
+}
diff --git a/softmmu/meson.build b/softmmu/meson.build
index 3272af1f31..efbf4ec029 100644
--- a/softmmu/meson.build
+++ b/softmmu/meson.build
@@ -25,6 +25,7 @@ softmmu_ss.add(files(
   'rtc.c',
   'runstate-action.c',
   'runstate.c',
+  'tpm-hmp-cmds.c',
   'vl.c',
 ), sdl, libpmem, libdaxctl)
 
-- 
2.39.0


