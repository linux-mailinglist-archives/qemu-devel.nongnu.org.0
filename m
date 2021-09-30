Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B84841DB46
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 15:40:56 +0200 (CEST)
Received: from localhost ([::1]:47740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVwIx-0004NF-3C
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 09:40:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVw51-00019A-W0
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:26:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVw4z-0008I1-IQ
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:26:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633008389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IV9ayM3oqqG2UpgUQ5wM7k37ea3Elk60iMb+R1fKFRk=;
 b=OL1qXxfMI9RMz0uHyF9cuhPdd8Qi1ZT6fl6yRBN/tbbsrzhryVzYUktSwTaLSEbNhiAYYy
 1pPf2HNwxUXV/db4Rdmuv49v05qk0SLx1CrpAx5OeQuYmfBfUgoZ0Dd94Z0t2rVLmr1/DE
 FeqmfWJxRCKA4r8prdYTXyJk1L5z8HQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128--81qAR6cMN6exnL6W_G5Lw-1; Thu, 30 Sep 2021 09:26:27 -0400
X-MC-Unique: -81qAR6cMN6exnL6W_G5Lw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58E259F92A;
 Thu, 30 Sep 2021 13:26:26 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.195.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE6965D9C6;
 Thu, 30 Sep 2021 13:26:03 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/19] qapi: introduce x-query-profile QMP command
Date: Thu, 30 Sep 2021 14:23:38 +0100
Message-Id: <20210930132349.3601823-9-berrange@redhat.com>
In-Reply-To: <20210930132349.3601823-1-berrange@redhat.com>
References: <20210930132349.3601823-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a counterpart to the HMP "info profile" command. It is being
added with an "x-" prefix because this QMP command is intended as an
adhoc debugging tool and will thus not be modelled in QAPI as fully
structured data, nor will it have long term guaranteed stability.
The existing HMP command is rewritten to call the QMP command.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 monitor/misc.c             | 30 ++++++++----------------------
 monitor/qmp-cmds.c         | 32 ++++++++++++++++++++++++++++++++
 qapi/machine.json          | 12 ++++++++++++
 tests/qtest/qmp-cmd-test.c |  3 +++
 4 files changed, 55 insertions(+), 22 deletions(-)

diff --git a/monitor/misc.c b/monitor/misc.c
index ffe7966870..5aebfaa986 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -67,6 +67,7 @@
 #include "block/block-hmp-cmds.h"
 #include "qapi/qapi-commands-char.h"
 #include "qapi/qapi-commands-control.h"
+#include "qapi/qapi-commands-machine.h"
 #include "qapi/qapi-commands-migration.h"
 #include "qapi/qapi-commands-misc.h"
 #include "qapi/qapi-commands-qom.h"
@@ -929,32 +930,17 @@ static void hmp_info_mtree(Monitor *mon, const QDict *qdict)
     mtree_info(flatview, dispatch_tree, owner, disabled);
 }
 
-#ifdef CONFIG_PROFILER
-
-int64_t dev_time;
-
 static void hmp_info_profile(Monitor *mon, const QDict *qdict)
 {
-    static int64_t last_cpu_exec_time;
-    int64_t cpu_exec_time;
-    int64_t delta;
-
-    cpu_exec_time = tcg_cpu_exec_time();
-    delta = cpu_exec_time - last_cpu_exec_time;
+    Error *err = NULL;
+    g_autoptr(HumanReadableText) info = qmp_x_query_profile(&err);
 
-    monitor_printf(mon, "async time  %" PRId64 " (%0.3f)\n",
-                   dev_time, dev_time / (double)NANOSECONDS_PER_SECOND);
-    monitor_printf(mon, "qemu time   %" PRId64 " (%0.3f)\n",
-                   delta, delta / (double)NANOSECONDS_PER_SECOND);
-    last_cpu_exec_time = cpu_exec_time;
-    dev_time = 0;
-}
-#else
-static void hmp_info_profile(Monitor *mon, const QDict *qdict)
-{
-    monitor_printf(mon, "Internal profiler not compiled\n");
+    if (err) {
+        error_report_err(err);
+        return;
+    }
+    monitor_printf(mon, "%s", info->human_readable_text);
 }
-#endif
 
 /* Capture support */
 static QLIST_HEAD (capture_list_head, CaptureState) capture_head;
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 5c0d5e116b..6122ad18b6 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -36,6 +36,7 @@
 #include "qapi/qapi-commands-machine.h"
 #include "qapi/qapi-commands-misc.h"
 #include "qapi/qapi-commands-ui.h"
+#include "qapi/type-helpers.h"
 #include "qapi/qmp/qerror.h"
 #include "hw/mem/memory-device.h"
 #include "hw/acpi/acpi_dev_interface.h"
@@ -350,3 +351,34 @@ void qmp_display_reload(DisplayReloadOptions *arg, Error **errp)
         abort();
     }
 }
+
+#ifdef CONFIG_PROFILER
+
+int64_t dev_time;
+
+HumanReadableText *qmp_x_query_profile(Error **errp)
+{
+    g_autoptr(GString) buf = g_string_new("");
+    static int64_t last_cpu_exec_time;
+    int64_t cpu_exec_time;
+    int64_t delta;
+
+    cpu_exec_time = tcg_cpu_exec_time();
+    delta = cpu_exec_time - last_cpu_exec_time;
+
+    g_string_append_printf(buf, "async time  %" PRId64 " (%0.3f)\n",
+                           dev_time, dev_time / (double)NANOSECONDS_PER_SECOND);
+    g_string_append_printf(buf, "qemu time   %" PRId64 " (%0.3f)\n",
+                           delta, delta / (double)NANOSECONDS_PER_SECOND);
+    last_cpu_exec_time = cpu_exec_time;
+    dev_time = 0;
+
+    return human_readable_text_from_str(buf);
+}
+#else
+HumanReadableText *qmp_x_query_profile(Error **errp)
+{
+    error_setg(errp, "Internal profiler not compiled");
+    return NULL;
+}
+#endif
diff --git a/qapi/machine.json b/qapi/machine.json
index 4c18904521..db1bb9454e 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1347,6 +1347,18 @@
      '*threads': 'int',
      '*maxcpus': 'int' } }
 
+##
+# @x-query-profile:
+#
+# Query TCG profiling information
+#
+# Returns: profile information
+#
+# Since: 6.2
+##
+{ 'command': 'x-query-profile',
+  'returns': 'HumanReadableText' }
+
 ##
 # @x-query-roms:
 #
diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index c98b78d033..fbd7ac10fb 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -46,6 +46,9 @@ static int query_error_class(const char *cmd)
         { "query-balloon", ERROR_CLASS_DEVICE_NOT_ACTIVE },
         { "query-hotpluggable-cpus", ERROR_CLASS_GENERIC_ERROR },
         { "query-vm-generation-id", ERROR_CLASS_GENERIC_ERROR },
+#ifndef CONFIG_PROFILER
+        { "x-query-profile", ERROR_CLASS_GENERIC_ERROR },
+#endif
         { NULL, -1 }
     };
     int i;
-- 
2.31.1


