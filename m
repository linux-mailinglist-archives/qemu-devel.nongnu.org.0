Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D10B841DB68
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 15:45:48 +0200 (CEST)
Received: from localhost ([::1]:34054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVwNf-00068a-Po
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 09:45:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVw5S-0001kL-1p
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:26:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVw5N-000084-7m
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:26:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633008412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BKfCiVuUu4ICwzEI7rE0blmAtVeMSqA/lFjGbN/NYgk=;
 b=ZXfgD4p3nOHkWb9VIj6UcEDFeSP4vs+sgUOtr3zgRCguXUKyh7ZdAXsR4Kvgpjx2JT98mV
 CxyEcj6x91HAa/ootKz02x661E/BH7tWd3RHCb+7xFeIlHWhWzmo5TfvSyyP6Vna68a6Fn
 PPCnDia1och4UnTNi7RTxTwhW4kmeuU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-5WvxXud1NGakaRRQE47H7Q-1; Thu, 30 Sep 2021 09:26:51 -0400
X-MC-Unique: 5WvxXud1NGakaRRQE47H7Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47F7C1006AA2;
 Thu, 30 Sep 2021 13:26:49 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.195.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C30325D9C6;
 Thu, 30 Sep 2021 13:26:45 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/19] qapi: introduce x-query-rdma QMP command
Date: Thu, 30 Sep 2021 14:23:41 +0100
Message-Id: <20210930132349.3601823-12-berrange@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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

This is a counterpart to the HMP "info rdma" command. It is being
added with an "x-" prefix because this QMP command is intended as an
adhoc debugging tool and will thus not be modelled in QAPI as fully
structured data, nor will it have long term guaranteed stability.
The existing HMP command is rewritten to call the QMP command.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/rdma/rdma_rm.c         | 104 +++++++++++++++++++-------------------
 hw/rdma/rdma_rm.h         |   2 +-
 hw/rdma/vmw/pvrdma_main.c |  31 ++++++------
 include/hw/rdma/rdma.h    |   2 +-
 monitor/hmp-cmds.c        |  29 +++--------
 monitor/qmp-cmds.c        |  32 ++++++++++++
 qapi/machine.json         |  12 +++++
 7 files changed, 122 insertions(+), 90 deletions(-)

diff --git a/hw/rdma/rdma_rm.c b/hw/rdma/rdma_rm.c
index 49141d4074..cfd85de3e6 100644
--- a/hw/rdma/rdma_rm.c
+++ b/hw/rdma/rdma_rm.c
@@ -27,58 +27,58 @@
 #define PG_DIR_SZ { TARGET_PAGE_SIZE / sizeof(__u64) }
 #define PG_TBL_SZ { TARGET_PAGE_SIZE / sizeof(__u64) }
 
-void rdma_dump_device_counters(Monitor *mon, RdmaDeviceResources *dev_res)
-{
-    monitor_printf(mon, "\ttx               : %" PRId64 "\n",
-                   dev_res->stats.tx);
-    monitor_printf(mon, "\ttx_len           : %" PRId64 "\n",
-                   dev_res->stats.tx_len);
-    monitor_printf(mon, "\ttx_err           : %" PRId64 "\n",
-                   dev_res->stats.tx_err);
-    monitor_printf(mon, "\trx_bufs          : %" PRId64 "\n",
-                   dev_res->stats.rx_bufs);
-    monitor_printf(mon, "\trx_srq           : %" PRId64 "\n",
-                   dev_res->stats.rx_srq);
-    monitor_printf(mon, "\trx_bufs_len      : %" PRId64 "\n",
-                   dev_res->stats.rx_bufs_len);
-    monitor_printf(mon, "\trx_bufs_err      : %" PRId64 "\n",
-                   dev_res->stats.rx_bufs_err);
-    monitor_printf(mon, "\tcomps            : %" PRId64 "\n",
-                   dev_res->stats.completions);
-    monitor_printf(mon, "\tmissing_comps    : %" PRId32 "\n",
-                   dev_res->stats.missing_cqe);
-    monitor_printf(mon, "\tpoll_cq (bk)     : %" PRId64 "\n",
-                   dev_res->stats.poll_cq_from_bk);
-    monitor_printf(mon, "\tpoll_cq_ppoll_to : %" PRId64 "\n",
-                   dev_res->stats.poll_cq_ppoll_to);
-    monitor_printf(mon, "\tpoll_cq (fe)     : %" PRId64 "\n",
-                   dev_res->stats.poll_cq_from_guest);
-    monitor_printf(mon, "\tpoll_cq_empty    : %" PRId64 "\n",
-                   dev_res->stats.poll_cq_from_guest_empty);
-    monitor_printf(mon, "\tmad_tx           : %" PRId64 "\n",
-                   dev_res->stats.mad_tx);
-    monitor_printf(mon, "\tmad_tx_err       : %" PRId64 "\n",
-                   dev_res->stats.mad_tx_err);
-    monitor_printf(mon, "\tmad_rx           : %" PRId64 "\n",
-                   dev_res->stats.mad_rx);
-    monitor_printf(mon, "\tmad_rx_err       : %" PRId64 "\n",
-                   dev_res->stats.mad_rx_err);
-    monitor_printf(mon, "\tmad_rx_bufs      : %" PRId64 "\n",
-                   dev_res->stats.mad_rx_bufs);
-    monitor_printf(mon, "\tmad_rx_bufs_err  : %" PRId64 "\n",
-                   dev_res->stats.mad_rx_bufs_err);
-    monitor_printf(mon, "\tPDs              : %" PRId32 "\n",
-                   dev_res->pd_tbl.used);
-    monitor_printf(mon, "\tMRs              : %" PRId32 "\n",
-                   dev_res->mr_tbl.used);
-    monitor_printf(mon, "\tUCs              : %" PRId32 "\n",
-                   dev_res->uc_tbl.used);
-    monitor_printf(mon, "\tQPs              : %" PRId32 "\n",
-                   dev_res->qp_tbl.used);
-    monitor_printf(mon, "\tCQs              : %" PRId32 "\n",
-                   dev_res->cq_tbl.used);
-    monitor_printf(mon, "\tCEQ_CTXs         : %" PRId32 "\n",
-                   dev_res->cqe_ctx_tbl.used);
+void rdma_format_device_counters(RdmaDeviceResources *dev_res, GString *buf)
+{
+    g_string_append_printf(buf, "\ttx               : %" PRId64 "\n",
+                           dev_res->stats.tx);
+    g_string_append_printf(buf, "\ttx_len           : %" PRId64 "\n",
+                           dev_res->stats.tx_len);
+    g_string_append_printf(buf, "\ttx_err           : %" PRId64 "\n",
+                           dev_res->stats.tx_err);
+    g_string_append_printf(buf, "\trx_bufs          : %" PRId64 "\n",
+                           dev_res->stats.rx_bufs);
+    g_string_append_printf(buf, "\trx_srq           : %" PRId64 "\n",
+                           dev_res->stats.rx_srq);
+    g_string_append_printf(buf, "\trx_bufs_len      : %" PRId64 "\n",
+                           dev_res->stats.rx_bufs_len);
+    g_string_append_printf(buf, "\trx_bufs_err      : %" PRId64 "\n",
+                           dev_res->stats.rx_bufs_err);
+    g_string_append_printf(buf, "\tcomps            : %" PRId64 "\n",
+                           dev_res->stats.completions);
+    g_string_append_printf(buf, "\tmissing_comps    : %" PRId32 "\n",
+                           dev_res->stats.missing_cqe);
+    g_string_append_printf(buf, "\tpoll_cq (bk)     : %" PRId64 "\n",
+                           dev_res->stats.poll_cq_from_bk);
+    g_string_append_printf(buf, "\tpoll_cq_ppoll_to : %" PRId64 "\n",
+                           dev_res->stats.poll_cq_ppoll_to);
+    g_string_append_printf(buf, "\tpoll_cq (fe)     : %" PRId64 "\n",
+                           dev_res->stats.poll_cq_from_guest);
+    g_string_append_printf(buf, "\tpoll_cq_empty    : %" PRId64 "\n",
+                           dev_res->stats.poll_cq_from_guest_empty);
+    g_string_append_printf(buf, "\tmad_tx           : %" PRId64 "\n",
+                           dev_res->stats.mad_tx);
+    g_string_append_printf(buf, "\tmad_tx_err       : %" PRId64 "\n",
+                           dev_res->stats.mad_tx_err);
+    g_string_append_printf(buf, "\tmad_rx           : %" PRId64 "\n",
+                           dev_res->stats.mad_rx);
+    g_string_append_printf(buf, "\tmad_rx_err       : %" PRId64 "\n",
+                           dev_res->stats.mad_rx_err);
+    g_string_append_printf(buf, "\tmad_rx_bufs      : %" PRId64 "\n",
+                           dev_res->stats.mad_rx_bufs);
+    g_string_append_printf(buf, "\tmad_rx_bufs_err  : %" PRId64 "\n",
+                           dev_res->stats.mad_rx_bufs_err);
+    g_string_append_printf(buf, "\tPDs              : %" PRId32 "\n",
+                           dev_res->pd_tbl.used);
+    g_string_append_printf(buf, "\tMRs              : %" PRId32 "\n",
+                           dev_res->mr_tbl.used);
+    g_string_append_printf(buf, "\tUCs              : %" PRId32 "\n",
+                           dev_res->uc_tbl.used);
+    g_string_append_printf(buf, "\tQPs              : %" PRId32 "\n",
+                           dev_res->qp_tbl.used);
+    g_string_append_printf(buf, "\tCQs              : %" PRId32 "\n",
+                           dev_res->cq_tbl.used);
+    g_string_append_printf(buf, "\tCEQ_CTXs         : %" PRId32 "\n",
+                           dev_res->cqe_ctx_tbl.used);
 }
 
 static inline void res_tbl_init(const char *name, RdmaRmResTbl *tbl,
diff --git a/hw/rdma/rdma_rm.h b/hw/rdma/rdma_rm.h
index e8639909cd..d69a917795 100644
--- a/hw/rdma/rdma_rm.h
+++ b/hw/rdma/rdma_rm.h
@@ -92,6 +92,6 @@ static inline union ibv_gid *rdma_rm_get_gid(RdmaDeviceResources *dev_res,
 {
     return &dev_res->port.gid_tbl[sgid_idx].gid;
 }
-void rdma_dump_device_counters(Monitor *mon, RdmaDeviceResources *dev_res);
+void rdma_format_device_counters(RdmaDeviceResources *dev_res, GString *buf);
 
 #endif
diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
index 7c0c3551a8..91206dbb8e 100644
--- a/hw/rdma/vmw/pvrdma_main.c
+++ b/hw/rdma/vmw/pvrdma_main.c
@@ -58,24 +58,25 @@ static Property pvrdma_dev_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
-static void pvrdma_print_statistics(Monitor *mon, RdmaProvider *obj)
+static void pvrdma_format_statistics(RdmaProvider *obj, GString *buf)
 {
     PVRDMADev *dev = PVRDMA_DEV(obj);
     PCIDevice *pdev = PCI_DEVICE(dev);
 
-    monitor_printf(mon, "%s, %x.%x\n", pdev->name, PCI_SLOT(pdev->devfn),
-                   PCI_FUNC(pdev->devfn));
-    monitor_printf(mon, "\tcommands         : %" PRId64 "\n",
-                   dev->stats.commands);
-    monitor_printf(mon, "\tregs_reads       : %" PRId64 "\n",
-                   dev->stats.regs_reads);
-    monitor_printf(mon, "\tregs_writes      : %" PRId64 "\n",
-                   dev->stats.regs_writes);
-    monitor_printf(mon, "\tuar_writes       : %" PRId64 "\n",
-                   dev->stats.uar_writes);
-    monitor_printf(mon, "\tinterrupts       : %" PRId64 "\n",
-                   dev->stats.interrupts);
-    rdma_dump_device_counters(mon, &dev->rdma_dev_res);
+    g_string_append_printf(buf, "%s, %x.%x\n",
+                           pdev->name, PCI_SLOT(pdev->devfn),
+                           PCI_FUNC(pdev->devfn));
+    g_string_append_printf(buf, "\tcommands         : %" PRId64 "\n",
+                           dev->stats.commands);
+    g_string_append_printf(buf, "\tregs_reads       : %" PRId64 "\n",
+                           dev->stats.regs_reads);
+    g_string_append_printf(buf, "\tregs_writes      : %" PRId64 "\n",
+                           dev->stats.regs_writes);
+    g_string_append_printf(buf, "\tuar_writes       : %" PRId64 "\n",
+                           dev->stats.uar_writes);
+    g_string_append_printf(buf, "\tinterrupts       : %" PRId64 "\n",
+                           dev->stats.interrupts);
+    rdma_format_device_counters(&dev->rdma_dev_res, buf);
 }
 
 static void free_dev_ring(PCIDevice *pci_dev, PvrdmaRing *ring,
@@ -699,7 +700,7 @@ static void pvrdma_class_init(ObjectClass *klass, void *data)
     device_class_set_props(dc, pvrdma_dev_properties);
     set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
 
-    ir->print_statistics = pvrdma_print_statistics;
+    ir->format_statistics = pvrdma_format_statistics;
 }
 
 static const TypeInfo pvrdma_info = {
diff --git a/include/hw/rdma/rdma.h b/include/hw/rdma/rdma.h
index e77e43a170..80b2e531c4 100644
--- a/include/hw/rdma/rdma.h
+++ b/include/hw/rdma/rdma.h
@@ -31,7 +31,7 @@ typedef struct RdmaProvider RdmaProvider;
 struct RdmaProviderClass {
     InterfaceClass parent;
 
-    void (*print_statistics)(Monitor *mon, RdmaProvider *obj);
+    void (*format_statistics)(RdmaProvider *obj, GString *buf);
 };
 
 #endif
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index b5e71d9e6f..ebc093b3d9 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -54,7 +54,6 @@
 #include "qemu/error-report.h"
 #include "exec/ramlist.h"
 #include "hw/intc/intc.h"
-#include "hw/rdma/rdma.h"
 #include "migration/snapshot.h"
 #include "migration/misc.h"
 
@@ -850,30 +849,18 @@ void hmp_info_pic(Monitor *mon, const QDict *qdict)
                                    hmp_info_pic_foreach, mon);
 }
 
-static int hmp_info_rdma_foreach(Object *obj, void *opaque)
+void hmp_info_rdma(Monitor *mon, const QDict *qdict)
 {
-    RdmaProvider *rdma;
-    RdmaProviderClass *k;
-    Monitor *mon = opaque;
+    Error *err = NULL;
+    g_autoptr(HumanReadableText) info = NULL;
 
-    if (object_dynamic_cast(obj, INTERFACE_RDMA_PROVIDER)) {
-        rdma = RDMA_PROVIDER(obj);
-        k = RDMA_PROVIDER_GET_CLASS(obj);
-        if (k->print_statistics) {
-            k->print_statistics(mon, rdma);
-        } else {
-            monitor_printf(mon, "RDMA statistics not available for %s.\n",
-                           object_get_typename(obj));
-        }
+    info = qmp_x_query_rdma(&err);
+    if (err) {
+        error_report_err(err);
+        return;
     }
 
-    return 0;
-}
-
-void hmp_info_rdma(Monitor *mon, const QDict *qdict)
-{
-    object_child_foreach_recursive(object_get_root(),
-                                   hmp_info_rdma_foreach, mon);
+    monitor_printf(mon, "%s", info->human_readable_text);
 }
 
 void hmp_info_pci(Monitor *mon, const QDict *qdict)
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 6122ad18b6..0a9ba7595c 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -40,6 +40,7 @@
 #include "qapi/qmp/qerror.h"
 #include "hw/mem/memory-device.h"
 #include "hw/acpi/acpi_dev_interface.h"
+#include "hw/rdma/rdma.h"
 
 NameInfo *qmp_query_name(Error **errp)
 {
@@ -382,3 +383,34 @@ HumanReadableText *qmp_x_query_profile(Error **errp)
     return NULL;
 }
 #endif
+
+static int qmp_x_query_rdma_foreach(Object *obj, void *opaque)
+{
+    RdmaProvider *rdma;
+    RdmaProviderClass *k;
+    GString *buf = opaque;
+
+    if (object_dynamic_cast(obj, INTERFACE_RDMA_PROVIDER)) {
+        rdma = RDMA_PROVIDER(obj);
+        k = RDMA_PROVIDER_GET_CLASS(obj);
+        if (k->format_statistics) {
+            k->format_statistics(rdma, buf);
+        } else {
+            g_string_append_printf(buf,
+                                   "RDMA statistics not available for %s.\n",
+                                   object_get_typename(obj));
+        }
+    }
+
+    return 0;
+}
+
+HumanReadableText *qmp_x_query_rdma(Error **errp)
+{
+    g_autoptr(GString) buf = g_string_new("");
+
+    object_child_foreach_recursive(object_get_root(),
+                                   qmp_x_query_rdma_foreach, buf);
+
+    return human_readable_text_from_str(buf);
+}
diff --git a/qapi/machine.json b/qapi/machine.json
index 7450fa3ac1..fbe4100443 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1371,6 +1371,18 @@
 { 'command': 'x-query-profile',
   'returns': 'HumanReadableText' }
 
+##
+# @x-query-rdma:
+#
+# Query RDMA state
+#
+# Returns: RDMA state
+#
+# Since: 6.2
+##
+{ 'command': 'x-query-rdma',
+  'returns': 'HumanReadableText' }
+
 ##
 # @x-query-roms:
 #
-- 
2.31.1


