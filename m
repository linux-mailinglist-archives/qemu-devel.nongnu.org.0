Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87123443527
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 19:10:31 +0100 (CET)
Received: from localhost ([::1]:49502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhyEw-0004JD-Lx
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 14:10:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mhy6Z-0007kw-QT
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:01:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mhy6X-0008Fp-7o
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:01:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635876108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LE8MggeOn6ooGAuMHUYDVquh9Jr31rQZB5wr5HDbPac=;
 b=KKGTTwPhQxy+eVfBe7xCg99SKXCkl3lMvDke1u0ag4xUU03fo5JE9cj50CNaj0Zqd5kkCd
 RMBo6mFt5tpFCsks9yKO++Y3A0F7A56/GB2d6zFHoWD6DsYQR/SaxCqDh3QRHjoL2HOrzD
 m/wlgnqu7WIaffiee93XWM3cKCC8fEw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-dOZYmYcHNVWsEwadAWucDQ-1; Tue, 02 Nov 2021 14:01:45 -0400
X-MC-Unique: dOZYmYcHNVWsEwadAWucDQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACA69EC1A1;
 Tue,  2 Nov 2021 18:01:43 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0587119C59;
 Tue,  2 Nov 2021 18:00:57 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/18] qapi: introduce x-query-rdma QMP command
Date: Tue,  2 Nov 2021 17:56:56 +0000
Message-Id: <20211102175700.1175996-15-berrange@redhat.com>
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

This is a counterpart to the HMP "info rdma" command. It is being
added with an "x-" prefix because this QMP command is intended as an
adhoc debugging tool and will thus not be modelled in QAPI as fully
structured data, nor will it have long term guaranteed stability.
The existing HMP command is rewritten to call the QMP command.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hmp-commands-info.hx      |   2 +-
 hw/rdma/rdma_rm.c         | 104 +++++++++++++++++++-------------------
 hw/rdma/rdma_rm.h         |   2 +-
 hw/rdma/vmw/pvrdma_main.c |  31 ++++++------
 include/hw/rdma/rdma.h    |   2 +-
 monitor/hmp-cmds.c        |  27 ----------
 monitor/qmp-cmds.c        |  32 ++++++++++++
 qapi/machine.json         |  12 +++++
 8 files changed, 115 insertions(+), 97 deletions(-)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index ef1bfe4f5a..d9af216473 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -185,7 +185,7 @@ ERST
         .args_type  = "",
         .params     = "",
         .help       = "show RDMA state",
-        .cmd        = hmp_info_rdma,
+        .cmd_info_hrt = qmp_x_query_rdma,
     },
 
 SRST
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
index 9031cea881..9d221622d7 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -54,7 +54,6 @@
 #include "qemu/error-report.h"
 #include "exec/ramlist.h"
 #include "hw/intc/intc.h"
-#include "hw/rdma/rdma.h"
 #include "migration/snapshot.h"
 #include "migration/misc.h"
 
@@ -850,32 +849,6 @@ void hmp_info_pic(Monitor *mon, const QDict *qdict)
                                    hmp_info_pic_foreach, mon);
 }
 
-static int hmp_info_rdma_foreach(Object *obj, void *opaque)
-{
-    RdmaProvider *rdma;
-    RdmaProviderClass *k;
-    Monitor *mon = opaque;
-
-    if (object_dynamic_cast(obj, INTERFACE_RDMA_PROVIDER)) {
-        rdma = RDMA_PROVIDER(obj);
-        k = RDMA_PROVIDER_GET_CLASS(obj);
-        if (k->print_statistics) {
-            k->print_statistics(mon, rdma);
-        } else {
-            monitor_printf(mon, "RDMA statistics not available for %s.\n",
-                           object_get_typename(obj));
-        }
-    }
-
-    return 0;
-}
-
-void hmp_info_rdma(Monitor *mon, const QDict *qdict)
-{
-    object_child_foreach_recursive(object_get_root(),
-                                   hmp_info_rdma_foreach, mon);
-}
-
 void hmp_info_pci(Monitor *mon, const QDict *qdict)
 {
     PciInfoList *info_list, *info;
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
index 15b6c98597..1b2748c77a 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1436,6 +1436,18 @@
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


