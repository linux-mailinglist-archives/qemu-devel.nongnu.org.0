Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CF56025B2
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 09:29:30 +0200 (CEST)
Received: from localhost ([::1]:33910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okh2W-00044J-Qa
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 03:29:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okg6C-0005gW-VA
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:29:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okg65-0001Ey-Hw
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:29:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666074534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YwLsM2ycbPhHaP+a5V0lZrusyFX/Mpb43ZYseUM0fnI=;
 b=N1n/wldeIsb+9p30UDA7n+b2+EvNEGzeOtsyT8Eoimihphk22qtiTc9lClE6NuYRyEMfYd
 cPwQesVX5DJDZMfSz3F+7CndL3szPFvPDiCj7RlqJMKv7mZjQODvslHYD6wvd64qqGZNOL
 9HFhMfK6I+zvy+lJ2sq1g6xIBR9wdGY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-cggg7yaoMJWUnlLPwNaPmQ-1; Tue, 18 Oct 2022 02:28:53 -0400
X-MC-Unique: cggg7yaoMJWUnlLPwNaPmQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E410985A5B6;
 Tue, 18 Oct 2022 06:28:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B6A7D2024CCA;
 Tue, 18 Oct 2022 06:28:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 50F3F21E6617; Tue, 18 Oct 2022 08:28:49 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, jsnow@redhat.com, eblake@redhat.com,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2 17/28] qapi pci: Elide redundant has_FOO in generated C
Date: Tue, 18 Oct 2022 08:28:38 +0200
Message-Id: <20221018062849.3420573-18-armbru@redhat.com>
In-Reply-To: <20221018062849.3420573-1-armbru@redhat.com>
References: <20221018062849.3420573-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The has_FOO for pointer-valued FOO are redundant, except for arrays.
They are also a nuisance to work with.  Recent commit "qapi: Start to
elide redundant has_FOO in generated C" provided the means to elide
them step by step.  This is the step for qapi/pci.json.

Said commit explains the transformation in more detail.  The invariant
violations mentioned there do not occur here.

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/pci/pci.c           | 2 --
 monitor/hmp-cmds.c     | 6 +++---
 scripts/qapi/schema.py | 1 -
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 2f450f6a72..e6292d8060 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1879,7 +1879,6 @@ static PciDeviceInfo *qmp_query_pci_device(PCIDevice *dev, PCIBus *bus,
     info->class_info->q_class = class;
     desc = get_class_desc(class);
     if (desc->desc) {
-        info->class_info->has_desc = true;
         info->class_info->desc = g_strdup(desc->desc);
     }
 
@@ -1897,7 +1896,6 @@ static PciDeviceInfo *qmp_query_pci_device(PCIDevice *dev, PCIBus *bus,
 
     type = dev->config[PCI_HEADER_TYPE] & ~PCI_HEADER_TYPE_MULTI_FUNCTION;
     if (type == PCI_HEADER_TYPE_BRIDGE) {
-        info->has_pci_bridge = true;
         info->pci_bridge = qmp_query_pci_bridge(dev, bus, bus_num);
     } else if (type == PCI_HEADER_TYPE_NORMAL) {
         info->id->has_subsystem = info->id->has_subsystem_vendor = true;
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index fc9a0617fe..b180c6fc6b 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -730,7 +730,7 @@ static void hmp_info_pci_device(Monitor *mon, const PciDeviceInfo *dev)
                    dev->slot, dev->function);
     monitor_printf(mon, "    ");
 
-    if (dev->class_info->has_desc) {
+    if (dev->class_info->desc) {
         monitor_puts(mon, dev->class_info->desc);
     } else {
         monitor_printf(mon, "Class %04" PRId64, dev->class_info->q_class);
@@ -748,7 +748,7 @@ static void hmp_info_pci_device(Monitor *mon, const PciDeviceInfo *dev)
                        dev->irq, (char)('A' + dev->irq_pin - 1));
     }
 
-    if (dev->has_pci_bridge) {
+    if (dev->pci_bridge) {
         monitor_printf(mon, "      BUS %" PRId64 ".\n",
                        dev->pci_bridge->bus->number);
         monitor_printf(mon, "      secondary bus %" PRId64 ".\n",
@@ -794,7 +794,7 @@ static void hmp_info_pci_device(Monitor *mon, const PciDeviceInfo *dev)
 
     monitor_printf(mon, "      id \"%s\"\n", dev->qdev_id);
 
-    if (dev->has_pci_bridge) {
+    if (dev->pci_bridge) {
         if (dev->pci_bridge->has_devices) {
             PciDeviceInfoList *cdev;
             for (cdev = dev->pci_bridge->devices; cdev; cdev = cdev->next) {
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 930dffd780..388b90812b 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -759,7 +759,6 @@ def need_has(self):
         assert self.type
         # Temporary hack to support dropping the has_FOO in reviewable chunks
         opt_out = [
-            'qapi/pci.json',
             'qapi/qdev.json',
             'qapi/qom.json',
             'qapi/replay.json',
-- 
2.37.2


