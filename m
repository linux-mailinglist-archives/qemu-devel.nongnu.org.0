Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E8D1E7F4D
	for <lists+qemu-devel@lfdr.de>; Fri, 29 May 2020 15:54:42 +0200 (CEST)
Received: from localhost ([::1]:48956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jefT7-00025I-NP
	for lists+qemu-devel@lfdr.de; Fri, 29 May 2020 09:54:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jefKJ-0002YF-1o
 for qemu-devel@nongnu.org; Fri, 29 May 2020 09:45:35 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:23907
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jefKH-0006z7-3e
 for qemu-devel@nongnu.org; Fri, 29 May 2020 09:45:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590759932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=90vpPTaZ3Uz60Uu7fkSsqKHnEEwpUnE5HLSbOUW5UHg=;
 b=E5NQHxjpu4r1zk3DP/JpCIU/ZO+lG/87flqJadwvqTRCjILkfipbX3hvntf51E/qd/+oeM
 wQs1REx1MkEneABfrhkYuM3ftAJmVfQfAJmb5KaPZteZ14kDmvdhvlRKT6yNFJtkUPspkD
 BpLvVrqSezknE/p1L6ij9asEpf5eqys=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-c1JRMnvdPV2-7TxBmVnjZQ-1; Fri, 29 May 2020 09:45:30 -0400
X-MC-Unique: c1JRMnvdPV2-7TxBmVnjZQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D084D8015CF
 for <qemu-devel@nongnu.org>; Fri, 29 May 2020 13:45:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A450D6298C
 for <qemu-devel@nongnu.org>; Fri, 29 May 2020 13:45:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 04AD911358C4; Fri, 29 May 2020 15:45:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/58] qdev: Convert uses of qdev_set_parent_bus() manually
Date: Fri, 29 May 2020 15:44:37 +0200
Message-Id: <20200529134523.8477-13-armbru@redhat.com>
In-Reply-To: <20200529134523.8477-1-armbru@redhat.com>
References: <20200529134523.8477-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/29 01:27:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Same transformation as in the previous commit.  Manual, because
convincing Coccinelle to transform these cases is somewhere between
not worthwhile and infeasible (at least for me).

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/pci-host/prep.c |  3 +--
 hw/ppc/pnv.c       |  6 ++----
 hw/s390x/sclp.c    | 10 ++++------
 3 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
index c821ef889d..42c7e63a60 100644
--- a/hw/pci-host/prep.c
+++ b/hw/pci-host/prep.c
@@ -268,7 +268,7 @@ static void raven_pcihost_realizefn(DeviceState *d, Error **errp)
     memory_region_add_subregion(address_space_mem, 0xbffffff0, &s->pci_intack);
 
     /* TODO Remove once realize propagates to child devices. */
-    object_property_set_bool(OBJECT(&s->pci_dev), true, "realized", errp);
+    qdev_realize(DEVICE(&s->pci_dev), BUS(&s->pci_bus), errp);
 }
 
 static void raven_pcihost_initfn(Object *obj)
@@ -308,7 +308,6 @@ static void raven_pcihost_initfn(Object *obj)
 
     object_initialize(&s->pci_dev, sizeof(s->pci_dev), TYPE_RAVEN_PCI_DEVICE);
     pci_dev = DEVICE(&s->pci_dev);
-    qdev_set_parent_bus(pci_dev, BUS(&s->pci_bus));
     object_property_set_int(OBJECT(&s->pci_dev), PCI_DEVFN(0, 0), "addr",
                             NULL);
     qdev_prop_set_bit(pci_dev, "multifunction", false);
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 8562af3fe0..e0588285a2 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1212,12 +1212,11 @@ static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
         object_property_set_int(OBJECT(phb), i, "index", &error_fatal);
         object_property_set_int(OBJECT(phb), chip->chip_id, "chip-id",
                                 &error_fatal);
-        object_property_set_bool(OBJECT(phb), true, "realized", &local_err);
+        qdev_realize(DEVICE(phb), NULL, &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
             return;
         }
-        qdev_set_parent_bus(DEVICE(phb), sysbus_get_default());
 
         /* Populate the XSCOM address space. */
         pnv_xscom_add_subregion(chip,
@@ -1422,12 +1421,11 @@ static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
             object_property_set_int(obj, PNV_PHB4_DEVICE_ID, "device-id",
                                     &error_fatal);
             object_property_set_link(obj, OBJECT(stack), "stack", &error_abort);
-            object_property_set_bool(obj, true, "realized", &local_err);
+            qdev_realize(DEVICE(obj), NULL, &local_err);
             if (local_err) {
                 error_propagate(errp, local_err);
                 return;
             }
-            qdev_set_parent_bus(DEVICE(obj), sysbus_get_default());
 
             /* Populate the XSCOM address space. */
             pnv_xscom_add_subregion(chip,
diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
index 20aca30ac4..40e27a8cb4 100644
--- a/hw/s390x/sclp.c
+++ b/hw/s390x/sclp.c
@@ -333,17 +333,15 @@ static void sclp_realize(DeviceState *dev, Error **errp)
     uint64_t hw_limit;
     int ret;
 
-    object_property_set_bool(OBJECT(sclp->event_facility), true, "realized",
-                             &err);
-    if (err) {
-        goto out;
-    }
     /*
      * qdev_device_add searches the sysbus for TYPE_SCLP_EVENTS_BUS. As long
      * as we can't find a fitting bus via the qom tree, we have to add the
      * event facility to the sysbus, so e.g. a sclp console can be created.
      */
-    qdev_set_parent_bus(DEVICE(sclp->event_facility), sysbus_get_default());
+    qdev_realize(DEVICE(sclp->event_facility), NULL, &err);
+    if (err) {
+        goto out;
+    }
 
     ret = s390_set_memory_limit(machine->maxram_size, &hw_limit);
     if (ret == -E2BIG) {
-- 
2.21.3


