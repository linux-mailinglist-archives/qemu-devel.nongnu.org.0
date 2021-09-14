Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE6940B259
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 16:58:45 +0200 (CEST)
Received: from localhost ([::1]:53554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ9tU-0001U8-D9
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 10:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9TZ-0008GO-GV
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:31:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9TU-0002Q8-CO
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:31:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u7eETvjxivMzE+Swy97bYqjXMqPqicbmd8tpwdrb6q8=;
 b=ayDky5/4cQUjZMV6YQE7RgvTUAXJQ3iTYPXe7I4CyAFpyhiMdmwZlHtAGW2I0WzKBqL54N
 I28GvlaH+hn1dZvmzjCfmFnOWTVIFfKrAG9xhymIM09rM6wLfzAVyZhsVCoWdfwH9pWm8n
 UEevQrgd4rpN+br59KF3wzUEZm7C1pQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-EOyYhwVLP9q-Q4clTf899Q-1; Tue, 14 Sep 2021 10:31:41 -0400
X-MC-Unique: EOyYhwVLP9q-Q4clTf899Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A7F91922023;
 Tue, 14 Sep 2021 14:31:37 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4119F5D9CA;
 Tue, 14 Sep 2021 14:31:29 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 34/53] qapi: introduce x-query-rdma QMP command
Date: Tue, 14 Sep 2021 15:20:23 +0100
Message-Id: <20210914142042.1655100-35-berrange@redhat.com>
In-Reply-To: <20210914142042.1655100-1-berrange@redhat.com>
References: <20210914142042.1655100-1-berrange@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eric Blake <eblake@redhat.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
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
 monitor/qmp-cmds.c        |  35 +++++++++++++
 qapi/machine.json         |  12 +++++
 7 files changed, 125 insertions(+), 90 deletions(-)

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
index e00255f7ee..d24a1683de 100644
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
index 7bae0770a9..9c2c1e4603 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -39,6 +39,7 @@
 #include "qapi/qmp/qerror.h"
 #include "hw/mem/memory-device.h"
 #include "hw/acpi/acpi_dev_interface.h"
+#include "hw/rdma/rdma.h"
 
 NameInfo *qmp_query_name(Error **errp)
 {
@@ -384,3 +385,37 @@ HumanReadableText *qmp_x_query_profile(Error **errp)
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
+    HumanReadableText *ret;
+    g_autoptr(GString) buf = g_string_new("");
+
+    object_child_foreach_recursive(object_get_root(),
+                                   qmp_x_query_rdma_foreach, buf);
+
+    ret = g_new0(HumanReadableText, 1);
+    ret->human_readable_text = g_steal_pointer(&buf->str);
+    return ret;
+}
diff --git a/qapi/machine.json b/qapi/machine.json
index 39d800c2c1..0fe962d916 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1337,6 +1337,18 @@
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
 # @x-query-registers:
 #
-- 
2.31.1


