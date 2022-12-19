Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E40BC650F58
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 16:53:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7IQZ-0002oM-Mf; Mon, 19 Dec 2022 10:51:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7IQO-0002eJ-UY
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:51:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7IQL-0000aa-0c
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:51:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671465088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uS90jy8ft6i1uGrq+YPqKALWmyX7WwZtYcMdDpscchA=;
 b=Ygv64lsVfWYhGqw7JCr/KjV3/WOqQ2dCYWaXskWIcJyg4+IROOOvCuMuIBavmXQTuza1Z1
 v7Tf20Mq1ZgpTrJ31GX5dM0u53T1t9w/EeCutMnMvvtetM0uLTDefcWydkrKp3aITE+79K
 EG1+FDSnaqaW5Uobem9DoxnNZlhHIbA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-327-kkYIWYSJPPm6YA4XW3Csvw-1; Mon, 19 Dec 2022 10:51:23 -0500
X-MC-Unique: kkYIWYSJPPm6YA4XW3Csvw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 346673813F53;
 Mon, 19 Dec 2022 15:51:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 057032166B26;
 Mon, 19 Dec 2022 15:51:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6A22621E65C2; Mon, 19 Dec 2022 16:51:20 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, "Michael S . Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PULL 10/13] pci: Inline do_pcie_aer_inject_error() into its only
 caller
Date: Mon, 19 Dec 2022 16:51:17 +0100
Message-Id: <20221219155120.2273041-11-armbru@redhat.com>
In-Reply-To: <20221219155120.2273041-1-armbru@redhat.com>
References: <20221219155120.2273041-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20221201121133.3813857-11-armbru@redhat.com>
---
 hw/pci/pci-hmp-cmds.c | 41 ++++++-----------------------------------
 1 file changed, 6 insertions(+), 35 deletions(-)

diff --git a/hw/pci/pci-hmp-cmds.c b/hw/pci/pci-hmp-cmds.c
index a7c96f156c..52c86323e5 100644
--- a/hw/pci/pci-hmp-cmds.c
+++ b/hw/pci/pci-hmp-cmds.c
@@ -159,21 +159,7 @@ void pcibus_dev_print(Monitor *mon, DeviceState *dev, int indent)
     }
 }
 
-typedef struct PCIEErrorDetails {
-    const char *id;
-    const char *root_bus;
-    int bus;
-    int devfn;
-} PCIEErrorDetails;
-
-/*
- * Inject an error described by @qdict.
- * On success, set @details to show where error was sent.
- * Return negative errno if injection failed and a message was emitted.
- */
-static int do_pcie_aer_inject_error(Monitor *mon,
-                                    const QDict *qdict,
-                                    PCIEErrorDetails *details)
+void hmp_pcie_aer_inject_error(Monitor *mon, const QDict *qdict)
 {
     const char *id = qdict_get_str(qdict, "id");
     const char *error_name;
@@ -189,12 +175,12 @@ static int do_pcie_aer_inject_error(Monitor *mon,
         monitor_printf(mon,
                        "id or pci device path is invalid or device not "
                        "found. %s\n", id);
-        return ret;
+        return;
     }
     if (!pci_is_express(dev)) {
         monitor_printf(mon, "the device doesn't support pci express. %s\n",
                        id);
-        return -ENOSYS;
+        return;
     }
 
     error_name = qdict_get_str(qdict, "error_status");
@@ -202,7 +188,7 @@ static int do_pcie_aer_inject_error(Monitor *mon,
         if (qemu_strtoui(error_name, NULL, 0, &num) < 0) {
             monitor_printf(mon, "invalid error status value. \"%s\"",
                            error_name);
-            return -EINVAL;
+            return;
         }
         error_status = num;
         correctable = qdict_get_try_bool(qdict, "correctable", false);
@@ -238,25 +224,10 @@ static int do_pcie_aer_inject_error(Monitor *mon,
     if (ret < 0) {
         monitor_printf(mon, "failed to inject error: %s\n",
                        strerror(-ret));
-        return ret;
-    }
-    details->id = id;
-    details->root_bus = pci_root_bus_path(dev);
-    details->bus = pci_dev_bus_num(dev);
-    details->devfn = dev->devfn;
-
-    return 0;
-}
-
-void hmp_pcie_aer_inject_error(Monitor *mon, const QDict *qdict)
-{
-    PCIEErrorDetails data;
-
-    if (do_pcie_aer_inject_error(mon, qdict, &data) < 0) {
         return;
     }
 
     monitor_printf(mon, "OK id: %s root bus: %s, bus: %x devfn: %x.%x\n",
-                   data.id, data.root_bus, data.bus,
-                   PCI_SLOT(data.devfn), PCI_FUNC(data.devfn));
+                   id, pci_root_bus_path(dev), pci_dev_bus_num(dev),
+                   PCI_SLOT(dev->devfn), PCI_FUNC(dev->devfn));
 }
-- 
2.37.3


