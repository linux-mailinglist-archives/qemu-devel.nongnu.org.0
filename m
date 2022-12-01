Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 982C663F0E3
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 13:51:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0iPz-0004Ia-EC; Thu, 01 Dec 2022 07:11:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0iPs-0004Fq-Sd
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 07:11:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0iPp-0008Ex-17
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 07:11:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669896704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FuoaHqgZPopfGjoLRo1usA7dSB1m6YAgnROu6BuKS8Y=;
 b=cKFawZJ8udAmwTQgywcnJWa9anfMPjjrGrn7lALItuI4kK91U5OHA2TkV9Sd4efgHoTvxV
 nE7rY0p3Cv8KMFdI9BRL86pGr8O3sbSG7IYV+ZJSVws3j6n0oO0gvEpwODZF/GUYEBMaGT
 chpV/7VaV9STiFR7W91AD8Jk+1cAqLE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42-XXJgwFNFPV-6kxLzenAT0w-1; Thu, 01 Dec 2022 07:11:41 -0500
X-MC-Unique: XXJgwFNFPV-6kxLzenAT0w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA75E811E84;
 Thu,  1 Dec 2022 12:11:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C2482024CBE;
 Thu,  1 Dec 2022 12:11:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 007D021E65CA; Thu,  1 Dec 2022 13:11:33 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com, dgilbert@redhat.com,
 philmd@linaro.org
Subject: [PATCH v2 10/13] pci: Inline do_pcie_aer_inject_error() into its only
 caller
Date: Thu,  1 Dec 2022 13:11:30 +0100
Message-Id: <20221201121133.3813857-11-armbru@redhat.com>
In-Reply-To: <20221201121133.3813857-1-armbru@redhat.com>
References: <20221201121133.3813857-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 hw/pci/pci-hmp-cmds.c | 41 ++++++-----------------------------------
 1 file changed, 6 insertions(+), 35 deletions(-)

diff --git a/hw/pci/pci-hmp-cmds.c b/hw/pci/pci-hmp-cmds.c
index ae75b920aa..a9a5bbb930 100644
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


