Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3451841DB88
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 15:54:05 +0200 (CEST)
Received: from localhost ([::1]:54830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVwVg-0003hR-9N
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 09:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVw7i-0004Ge-AD
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:29:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVw7f-00021h-Oj
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:29:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633008553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x43wtmkQpWumqPtqsm4rGiESHyMuVQe0wNghsiB1Yf4=;
 b=LaNhoZNn9Q/SOkvAmMuQr0Vj2MF5VNlzsTk/yNDUKRRlI7AMLz5Nbgt7EZXn3PAyfpZXhu
 bMHNjFRDwX0OKcsaBCTAVVQIAqn8G2PGXZ23cjUbrrSF/mKxIpOFE5zZijTzDGhEgD9oRv
 k+JQ7akuvXqbX3OHQchlBJC3Y4bYA1g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-FFwt7h0_OaK4kDU7F8V8tQ-1; Thu, 30 Sep 2021 09:29:12 -0400
X-MC-Unique: FFwt7h0_OaK4kDU7F8V8tQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB7208015C7;
 Thu, 30 Sep 2021 13:29:10 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.195.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D08055D9C6;
 Thu, 30 Sep 2021 13:28:19 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 17/19] qapi: introduce x-query-irq QMP command
Date: Thu, 30 Sep 2021 14:23:47 +0100
Message-Id: <20210930132349.3601823-18-berrange@redhat.com>
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
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a counterpart to the HMP "info irq" command. It is being
added with an "x-" prefix because this QMP command is intended as an
adhoc debugging tool and will thus not be modelled in QAPI as fully
structured data, nor will it have long term guaranteed stability.
The existing HMP command is rewritten to call the QMP command.

This command is unable to use the pre-existing HumanReadableText,
because if 'common.json' is included into 'machine-target.json'
the static marshalling method for HumanReadableText will be reported
as unused by the compiler on all architectures except s390x.

Possible options were

 1 Support 'if' conditionals on 'include' statements in QAPI
 2 Add further commands to 'machine-target.json' that use
   HumanReadableText, such that it has at least one usage
   on all architecture targets.
 3 Duplicate HumanReadableText as TargetHumanReadableText
   adding conditions

This patch takes option (3) in the belief that we will eventually
get to a point where option (2) happens, and TargetHumanReadableText
can be removed again.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 monitor/hmp-cmds.c | 40 ++++++++--------------------------------
 monitor/qmp-cmds.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 qapi/machine.json  | 12 ++++++++++++
 3 files changed, 64 insertions(+), 32 deletions(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 2d09a01599..2df1136e21 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -784,42 +784,18 @@ static void hmp_info_pci_device(Monitor *mon, const PciDeviceInfo *dev)
     }
 }
 
-static int hmp_info_irq_foreach(Object *obj, void *opaque)
+void hmp_info_irq(Monitor *mon, const QDict *qdict)
 {
-    InterruptStatsProvider *intc;
-    InterruptStatsProviderClass *k;
-    Monitor *mon = opaque;
+    Error *err = NULL;
+    g_autoptr(HumanReadableText) info = NULL;
 
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
+    info = qmp_x_query_irq(&err);
+    if (err) {
+        error_report_err(err);
+        return;
     }
 
-    return 0;
-}
-
-void hmp_info_irq(Monitor *mon, const QDict *qdict)
-{
-    object_child_foreach_recursive(object_get_root(),
-                                   hmp_info_irq_foreach, mon);
+    monitor_printf(mon, "%s", info->human_readable_text);
 }
 
 static int hmp_info_pic_foreach(Object *obj, void *opaque)
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
index 340ab57f60..31eafe2fc4 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1347,6 +1347,18 @@
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


