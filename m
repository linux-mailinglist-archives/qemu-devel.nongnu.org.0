Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7ACA43E60C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 18:24:02 +0200 (CEST)
Received: from localhost ([::1]:58424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg8CA-0005UQ-04
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 12:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mg7mx-0005IN-Gd
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:58:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mg7mv-0004Y5-Rx
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:57:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635436677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tFp6wR6Hh3gv/eS0nrDHvOxlzeVApi6HP2O6tIIjQk4=;
 b=bVfJuwoWYDq2FxEcLYdnXMBsucq9E6RV1qx1SQ9Gu+p0bVXhrZiguuaF7Y2sXDnXyrHVfE
 oBbR4MTEdV9CaTKNqqba4ABtpntm/CvIqcm745FJj3zgRlsSglZyLM4KSM6sazdUykoE+I
 Bm6XqiP3aas1V+frTbiy8NPjMQp1+dQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-bBUmh5iSNeecCHBhv4lUeA-1; Thu, 28 Oct 2021 11:57:54 -0400
X-MC-Unique: bBUmh5iSNeecCHBhv4lUeA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCA058066F4;
 Thu, 28 Oct 2021 15:57:52 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.195.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC0646F920;
 Thu, 28 Oct 2021 15:57:44 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/22] qapi: introduce x-query-numa QMP command
Date: Thu, 28 Oct 2021 16:54:47 +0100
Message-Id: <20211028155457.967291-13-berrange@redhat.com>
In-Reply-To: <20211028155457.967291-1-berrange@redhat.com>
References: <20211028155457.967291-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a counterpart to the HMP "info numa" command. It is being
added with an "x-" prefix because this QMP command is intended as an
adhoc debugging tool and will thus not be modelled in QAPI as fully
structured data, nor will it have long term guaranteed stability.
The existing HMP command is rewritten to call the QMP command.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hmp-commands-info.hx       |  2 +-
 hw/core/machine-hmp-cmds.c | 35 ---------------------------------
 hw/core/machine-qmp-cmds.c | 40 ++++++++++++++++++++++++++++++++++++++
 qapi/machine.json          | 12 ++++++++++++
 4 files changed, 53 insertions(+), 36 deletions(-)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 84c5e0da10..f66b1ca986 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -325,7 +325,7 @@ ERST
         .args_type  = "",
         .params     = "",
         .help       = "show NUMA information",
-        .cmd        = hmp_info_numa,
+        .cmd_info_hrt = qmp_x_query_numa,
     },
 
 SRST
diff --git a/hw/core/machine-hmp-cmds.c b/hw/core/machine-hmp-cmds.c
index c356783ab9..4e2f319aeb 100644
--- a/hw/core/machine-hmp-cmds.c
+++ b/hw/core/machine-hmp-cmds.c
@@ -130,38 +130,3 @@ void hmp_info_memdev(Monitor *mon, const QDict *qdict)
     qapi_free_MemdevList(memdev_list);
     hmp_handle_error(mon, err);
 }
-
-void hmp_info_numa(Monitor *mon, const QDict *qdict)
-{
-    int i, nb_numa_nodes;
-    NumaNodeMem *node_mem;
-    CpuInfoFastList *cpu_list, *cpu;
-    MachineState *ms = MACHINE(qdev_get_machine());
-
-    nb_numa_nodes = ms->numa_state ? ms->numa_state->num_nodes : 0;
-    monitor_printf(mon, "%d nodes\n", nb_numa_nodes);
-    if (!nb_numa_nodes) {
-        return;
-    }
-
-    cpu_list = qmp_query_cpus_fast(&error_abort);
-    node_mem = g_new0(NumaNodeMem, nb_numa_nodes);
-
-    query_numa_node_mem(node_mem, ms);
-    for (i = 0; i < nb_numa_nodes; i++) {
-        monitor_printf(mon, "node %d cpus:", i);
-        for (cpu = cpu_list; cpu; cpu = cpu->next) {
-            if (cpu->value->has_props && cpu->value->props->has_node_id &&
-                cpu->value->props->node_id == i) {
-                monitor_printf(mon, " %" PRIi64, cpu->value->cpu_index);
-            }
-        }
-        monitor_printf(mon, "\n");
-        monitor_printf(mon, "node %d size: %" PRId64 " MB\n", i,
-                       node_mem[i].node_mem >> 20);
-        monitor_printf(mon, "node %d plugged: %" PRId64 " MB\n", i,
-                       node_mem[i].node_plugged_mem >> 20);
-    }
-    qapi_free_CpuInfoFastList(cpu_list);
-    g_free(node_mem);
-}
diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index 216fdfaf3a..4f4ab30f8c 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -15,6 +15,7 @@
 #include "qapi/qmp/qerror.h"
 #include "qapi/qmp/qobject.h"
 #include "qapi/qobject-input-visitor.h"
+#include "qapi/type-helpers.h"
 #include "qemu/main-loop.h"
 #include "qom/qom-qobject.h"
 #include "sysemu/hostmem.h"
@@ -204,3 +205,42 @@ MemdevList *qmp_query_memdev(Error **errp)
     object_child_foreach(obj, query_memdev, &list);
     return list;
 }
+
+HumanReadableText *qmp_x_query_numa(Error **errp)
+{
+    g_autoptr(GString) buf = g_string_new("");
+    int i, nb_numa_nodes;
+    NumaNodeMem *node_mem;
+    CpuInfoFastList *cpu_list, *cpu;
+    MachineState *ms = MACHINE(qdev_get_machine());
+
+    nb_numa_nodes = ms->numa_state ? ms->numa_state->num_nodes : 0;
+    g_string_append_printf(buf, "%d nodes\n", nb_numa_nodes);
+    if (!nb_numa_nodes) {
+        goto done;
+    }
+
+    cpu_list = qmp_query_cpus_fast(&error_abort);
+    node_mem = g_new0(NumaNodeMem, nb_numa_nodes);
+
+    query_numa_node_mem(node_mem, ms);
+    for (i = 0; i < nb_numa_nodes; i++) {
+        g_string_append_printf(buf, "node %d cpus:", i);
+        for (cpu = cpu_list; cpu; cpu = cpu->next) {
+            if (cpu->value->has_props && cpu->value->props->has_node_id &&
+                cpu->value->props->node_id == i) {
+                g_string_append_printf(buf, " %" PRIi64, cpu->value->cpu_index);
+            }
+        }
+        g_string_append_printf(buf, "\n");
+        g_string_append_printf(buf, "node %d size: %" PRId64 " MB\n", i,
+                               node_mem[i].node_mem >> 20);
+        g_string_append_printf(buf, "node %d plugged: %" PRId64 " MB\n", i,
+                               node_mem[i].node_plugged_mem >> 20);
+    }
+    qapi_free_CpuInfoFastList(cpu_list);
+    g_free(node_mem);
+
+ done:
+    return human_readable_text_from_str(buf);
+}
diff --git a/qapi/machine.json b/qapi/machine.json
index 73ff4bc168..3732f80a82 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1412,6 +1412,18 @@
      '*threads': 'int',
      '*maxcpus': 'int' } }
 
+##
+# @x-query-numa:
+#
+# Query NUMA topology information
+#
+# Returns: topology information
+#
+# Since: 6.2
+##
+{ 'command': 'x-query-numa',
+  'returns': 'HumanReadableText' }
+
 ##
 # @x-query-profile:
 #
-- 
2.31.1


