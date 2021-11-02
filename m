Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A0D443537
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 19:13:10 +0100 (CET)
Received: from localhost ([::1]:55928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhyHW-0000GR-0V
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 14:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mhy8J-0002io-Ka
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:03:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mhy8H-0000Ue-EN
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:03:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635876216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/BY8i40tawGg0n6BEwrj/ZgNEOXvTjfELfuq9Nb3SL4=;
 b=i5C5m5JQcsMoPf+Q1U/tgFnyewTIWQTqWxBWqJ+j4xbJ3mZnAblishvYIJWxtI1SkdE1JE
 Hmy7Il0E7F/Tie3GBWwado9bHxFO74QTzcf0gspXWHBoPxRT55d3OiCLWLdLz4ZjYeB2zm
 GLuCic6mAU+XKHSxerlkDzbogNM8cTg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-vQLHZVV9M-6AuSKk4RuRaA-1; Tue, 02 Nov 2021 14:03:35 -0400
X-MC-Unique: vQLHZVV9M-6AuSKk4RuRaA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B6B150754;
 Tue,  2 Nov 2021 18:03:34 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D573D19C59;
 Tue,  2 Nov 2021 18:02:27 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/18] qapi: introduce x-query-irq QMP command
Date: Tue,  2 Nov 2021 17:56:58 +0000
Message-Id: <20211102175700.1175996-17-berrange@redhat.com>
In-Reply-To: <20211102175700.1175996-1-berrange@redhat.com>
References: <20211102175700.1175996-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a counterpart to the HMP "info irq" command. It is being
added with an "x-" prefix because this QMP command is intended as an
adhoc debugging tool and will thus not be modelled in QAPI as fully
structured data, nor will it have long term guaranteed stability.
The existing HMP command is rewritten to call the QMP command.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hmp-commands-info.hx |  2 +-
 monitor/hmp-cmds.c   | 38 --------------------------------------
 monitor/qmp-cmds.c   | 44 ++++++++++++++++++++++++++++++++++++++++++++
 qapi/machine.json    | 12 ++++++++++++
 4 files changed, 57 insertions(+), 39 deletions(-)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index c2d7275bf5..407a1da800 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -159,7 +159,7 @@ ERST
         .args_type  = "",
         .params     = "",
         .help       = "show the interrupts statistics (if available)",
-        .cmd        = hmp_info_irq,
+        .cmd_info_hrt = qmp_x_query_irq,
     },
 
 SRST
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 90f9a64573..8ef605e29a 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -784,44 +784,6 @@ static void hmp_info_pci_device(Monitor *mon, const PciDeviceInfo *dev)
     }
 }
 
-static int hmp_info_irq_foreach(Object *obj, void *opaque)
-{
-    InterruptStatsProvider *intc;
-    InterruptStatsProviderClass *k;
-    Monitor *mon = opaque;
-
-    if (object_dynamic_cast(obj, TYPE_INTERRUPT_STATS_PROVIDER)) {
-        intc = INTERRUPT_STATS_PROVIDER(obj);
-        k = INTERRUPT_STATS_PROVIDER_GET_CLASS(obj);
-        uint64_t *irq_counts;
-        unsigned int nb_irqs, i;
-        if (k->get_statistics &&
-            k->get_statistics(intc, &irq_counts, &nb_irqs)) {
-            if (nb_irqs > 0) {
-                monitor_printf(mon, "IRQ statistics for %s:\n",
-                               object_get_typename(obj));
-                for (i = 0; i < nb_irqs; i++) {
-                    if (irq_counts[i] > 0) {
-                        monitor_printf(mon, "%2d: %" PRId64 "\n", i,
-                                       irq_counts[i]);
-                    }
-                }
-            }
-        } else {
-            monitor_printf(mon, "IRQ statistics not available for %s.\n",
-                           object_get_typename(obj));
-        }
-    }
-
-    return 0;
-}
-
-void hmp_info_irq(Monitor *mon, const QDict *qdict)
-{
-    object_child_foreach_recursive(object_get_root(),
-                                   hmp_info_irq_foreach, mon);
-}
-
 static int hmp_info_pic_foreach(Object *obj, void *opaque)
 {
     InterruptStatsProvider *intc;
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index a9766fa38d..343353e27a 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -41,6 +41,7 @@
 #include "exec/ramlist.h"
 #include "hw/mem/memory-device.h"
 #include "hw/acpi/acpi_dev_interface.h"
+#include "hw/intc/intc.h"
 #include "hw/rdma/rdma.h"
 
 NameInfo *qmp_query_name(Error **errp)
@@ -422,3 +423,46 @@ HumanReadableText *qmp_x_query_ramblock(Error **errp)
 
     return human_readable_text_from_str(buf);
 }
+
+static int qmp_x_query_irq_foreach(Object *obj, void *opaque)
+{
+    InterruptStatsProvider *intc;
+    InterruptStatsProviderClass *k;
+    GString *buf = opaque;
+
+    if (object_dynamic_cast(obj, TYPE_INTERRUPT_STATS_PROVIDER)) {
+        intc = INTERRUPT_STATS_PROVIDER(obj);
+        k = INTERRUPT_STATS_PROVIDER_GET_CLASS(obj);
+        uint64_t *irq_counts;
+        unsigned int nb_irqs, i;
+        if (k->get_statistics &&
+            k->get_statistics(intc, &irq_counts, &nb_irqs)) {
+            if (nb_irqs > 0) {
+                g_string_append_printf(buf, "IRQ statistics for %s:\n",
+                                       object_get_typename(obj));
+                for (i = 0; i < nb_irqs; i++) {
+                    if (irq_counts[i] > 0) {
+                        g_string_append_printf(buf, "%2d: %" PRId64 "\n", i,
+                                               irq_counts[i]);
+                    }
+                }
+            }
+        } else {
+            g_string_append_printf(buf,
+                                   "IRQ statistics not available for %s.\n",
+                                   object_get_typename(obj));
+        }
+    }
+
+    return 0;
+}
+
+HumanReadableText *qmp_x_query_irq(Error **errp)
+{
+    g_autoptr(GString) buf = g_string_new("");
+
+    object_child_foreach_recursive(object_get_root(),
+                                   qmp_x_query_irq_foreach, buf);
+
+    return human_readable_text_from_str(buf);
+}
diff --git a/qapi/machine.json b/qapi/machine.json
index be81170c2b..ca49358292 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1412,6 +1412,18 @@
      '*threads': 'int',
      '*maxcpus': 'int' } }
 
+##
+# @x-query-irq:
+#
+# Query interrupt statistics
+#
+# Returns: interrupt statistics
+#
+# Since: 6.2
+##
+{ 'command': 'x-query-irq',
+  'returns': 'HumanReadableText' }
+
 ##
 # @x-query-numa:
 #
-- 
2.31.1


