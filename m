Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D69D76892B2
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 09:51:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNriM-00006Z-5r; Fri, 03 Feb 2023 03:46:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrhu-0008N4-Ca
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:46:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrhm-0007VS-Mi
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:46:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675413957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lpTRzbI+59H1GvAVKMDQR5w/SMmf5xiI5er1znedqMM=;
 b=XTiALimgFSCpnKEEItUI9T1Fc4VU8QkPD1wEorAPeq1brfGzSV6pX0PPXhfX+xpIWGE2k+
 fcJ3UBUECjV7n5ndnRJXHFGd0w9zGdIB2R+9lFRH+CGYR4OG+n4agHkDfll+SnA80qHSgS
 iZCO/O//5qp56BriVsIN1DLXlHLBO8k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-hW-w0hWLO6-XwbHAAa_rUQ-1; Fri, 03 Feb 2023 03:45:54 -0500
X-MC-Unique: hW-w0hWLO6-XwbHAAa_rUQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D6CC196EF8B;
 Fri,  3 Feb 2023 08:45:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E03FD400DFA1;
 Fri,  3 Feb 2023 08:45:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0928521E6886; Fri,  3 Feb 2023 09:45:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 33/35] monitor: Move remaining QMP stuff from misc.c to
 qmp-cmds.c
Date: Fri,  3 Feb 2023 09:45:47 +0100
Message-Id: <20230203084549.2622302-34-armbru@redhat.com>
In-Reply-To: <20230203084549.2622302-1-armbru@redhat.com>
References: <20230203084549.2622302-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230124121946.1139465-31-armbru@redhat.com>
---
 monitor/misc.c     | 51 --------------------------------------------
 monitor/qmp-cmds.c | 53 +++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 52 insertions(+), 52 deletions(-)

diff --git a/monitor/misc.c b/monitor/misc.c
index 52a7d7686e..9ddf32da97 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -27,14 +27,12 @@
 #include "monitor/qdev.h"
 #include "net/slirp.h"
 #include "sysemu/device_tree.h"
-#include "qapi/qmp/qerror.h"
 #include "monitor/hmp-target.h"
 #include "monitor/hmp.h"
 #include "block/block-hmp-cmds.h"
 #include "qapi/qapi-commands-control.h"
 #include "qapi/qapi-commands-misc.h"
 #include "qapi/qapi-commands-machine.h"
-#include "qapi/qapi-init-commands.h"
 #include "qapi/error.h"
 #include "qemu/cutils.h"
 
@@ -48,34 +46,6 @@
 
 static HMPCommand hmp_info_cmds[];
 
-char *qmp_human_monitor_command(const char *command_line, bool has_cpu_index,
-                                int64_t cpu_index, Error **errp)
-{
-    char *output = NULL;
-    MonitorHMP hmp = {};
-
-    monitor_data_init(&hmp.common, false, true, false);
-
-    if (has_cpu_index) {
-        int ret = monitor_set_cpu(&hmp.common, cpu_index);
-        if (ret < 0) {
-            error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "cpu-index",
-                       "a CPU number");
-            goto out;
-        }
-    }
-
-    handle_hmp_command(&hmp, command_line);
-
-    WITH_QEMU_LOCK_GUARD(&hmp.common.mon_lock) {
-        output = g_strdup(hmp.common.outbuf->str);
-    }
-
-out:
-    monitor_data_destroy(&hmp.common);
-    return output;
-}
-
 /**
  * Is @name in the '|' separated list of names @list?
  */
@@ -99,26 +69,6 @@ int hmp_compare_cmd(const char *name, const char *list)
     return 0;
 }
 
-static void monitor_init_qmp_commands(void)
-{
-    /*
-     * Two command lists:
-     * - qmp_commands contains all QMP commands
-     * - qmp_cap_negotiation_commands contains just
-     *   "qmp_capabilities", to enforce capability negotiation
-     */
-
-    qmp_init_marshal(&qmp_commands);
-
-    qmp_register_command(&qmp_commands, "device_add",
-                         qmp_device_add, 0, 0);
-
-    QTAILQ_INIT(&qmp_cap_negotiation_commands);
-    qmp_register_command(&qmp_cap_negotiation_commands, "qmp_capabilities",
-                         qmp_marshal_qmp_capabilities,
-                         QCO_ALLOW_PRECONFIG, 0);
-}
-
 /* Please update hmp-commands.hx when adding or changing commands */
 static HMPCommand hmp_info_cmds[] = {
 #include "hmp-commands-info.h"
@@ -230,6 +180,5 @@ void monitor_register_hmp_info_hrt(const char *name,
 void monitor_init_globals(void)
 {
     monitor_init_globals_core();
-    monitor_init_qmp_commands();
     sortcmdlist();
 }
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index cc22f3fcc7..859012aef4 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -14,7 +14,8 @@
  */
 
 #include "qemu/osdep.h"
-#include "monitor/monitor.h"
+#include "monitor-internal.h"
+#include "monitor/qdev.h"
 #include "monitor/qmp-helpers.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/kvm.h"
@@ -22,8 +23,10 @@
 #include "sysemu/runstate-action.h"
 #include "sysemu/block-backend.h"
 #include "qapi/error.h"
+#include "qapi/qapi-init-commands.h"
 #include "qapi/qapi-commands-control.h"
 #include "qapi/qapi-commands-misc.h"
+#include "qapi/qmp/qerror.h"
 #include "qapi/type-helpers.h"
 #include "hw/mem/memory-device.h"
 #include "hw/intc/intc.h"
@@ -151,3 +154,51 @@ void qmp_add_client(const char *protocol, const char *fdname,
         close(fd);
     }
 }
+
+char *qmp_human_monitor_command(const char *command_line, bool has_cpu_index,
+                                int64_t cpu_index, Error **errp)
+{
+    char *output = NULL;
+    MonitorHMP hmp = {};
+
+    monitor_data_init(&hmp.common, false, true, false);
+
+    if (has_cpu_index) {
+        int ret = monitor_set_cpu(&hmp.common, cpu_index);
+        if (ret < 0) {
+            error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "cpu-index",
+                       "a CPU number");
+            goto out;
+        }
+    }
+
+    handle_hmp_command(&hmp, command_line);
+
+    WITH_QEMU_LOCK_GUARD(&hmp.common.mon_lock) {
+        output = g_strdup(hmp.common.outbuf->str);
+    }
+
+out:
+    monitor_data_destroy(&hmp.common);
+    return output;
+}
+
+static void __attribute__((__constructor__)) monitor_init_qmp_commands(void)
+{
+    /*
+     * Two command lists:
+     * - qmp_commands contains all QMP commands
+     * - qmp_cap_negotiation_commands contains just
+     *   "qmp_capabilities", to enforce capability negotiation
+     */
+
+    qmp_init_marshal(&qmp_commands);
+
+    qmp_register_command(&qmp_commands, "device_add",
+                         qmp_device_add, 0, 0);
+
+    QTAILQ_INIT(&qmp_cap_negotiation_commands);
+    qmp_register_command(&qmp_cap_negotiation_commands, "qmp_capabilities",
+                         qmp_marshal_qmp_capabilities,
+                         QCO_ALLOW_PRECONFIG, 0);
+}
-- 
2.39.0


