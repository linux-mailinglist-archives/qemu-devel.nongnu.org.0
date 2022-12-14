Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C8264C510
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 09:28:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5MUV-0003ZJ-A4; Wed, 14 Dec 2022 02:47:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5MUN-0003TV-Sy
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 02:47:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5MUI-0003fI-Sx
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 02:47:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671004053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uhh7gPrjEJrFMJbhRY5+1ha+REazY+zDAFyYt8Ww3UI=;
 b=WIkZVlLdRmNCNW6rMx8dBkBhdrMytLU9jOFClxZHyKGCDTVtUc2H8ipZeU023Nzo9TrPw7
 JXKVWDtZW2lDj6o+ZsStns2v1WECkCeMjL56wZUrd+J2Z6UANOUgEJOhES4qCj2Ld6/K4m
 oSEawDqroy+JH8+pigvA2Up2SRrTnfo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-J8S_hjpTOd2JAnTuoSnNiA-1; Wed, 14 Dec 2022 02:47:32 -0500
X-MC-Unique: J8S_hjpTOd2JAnTuoSnNiA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A27FD1C02D3F;
 Wed, 14 Dec 2022 07:47:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 76E7D14171C1;
 Wed, 14 Dec 2022 07:47:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7DA6221E61AF; Wed, 14 Dec 2022 08:47:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 19/30] qapi pci: Elide redundant has_FOO in generated C
Date: Wed, 14 Dec 2022 08:47:10 +0100
Message-Id: <20221214074721.731441-22-armbru@redhat.com>
In-Reply-To: <20221214074721.731441-1-armbru@redhat.com>
References: <20221214074721.731441-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

The has_FOO for pointer-valued FOO are redundant, except for arrays.
They are also a nuisance to work with.  Recent commit "qapi: Start to
elide redundant has_FOO in generated C" provided the means to elide
them step by step.  This is the step for qapi/pci.json.

Said commit explains the transformation in more detail.  The invariant
violations mentioned there do not occur here.

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221104160712.3005652-20-armbru@redhat.com>
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
index 45d78ba257..ae5ebe765a 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -709,7 +709,7 @@ static void hmp_info_pci_device(Monitor *mon, const PciDeviceInfo *dev)
                    dev->slot, dev->function);
     monitor_printf(mon, "    ");
 
-    if (dev->class_info->has_desc) {
+    if (dev->class_info->desc) {
         monitor_puts(mon, dev->class_info->desc);
     } else {
         monitor_printf(mon, "Class %04" PRId64, dev->class_info->q_class);
@@ -727,7 +727,7 @@ static void hmp_info_pci_device(Monitor *mon, const PciDeviceInfo *dev)
                        dev->irq, (char)('A' + dev->irq_pin - 1));
     }
 
-    if (dev->has_pci_bridge) {
+    if (dev->pci_bridge) {
         monitor_printf(mon, "      BUS %" PRId64 ".\n",
                        dev->pci_bridge->bus->number);
         monitor_printf(mon, "      secondary bus %" PRId64 ".\n",
@@ -773,7 +773,7 @@ static void hmp_info_pci_device(Monitor *mon, const PciDeviceInfo *dev)
 
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
2.37.3


