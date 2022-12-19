Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AD0650F48
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 16:53:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7IQZ-0002nW-EB; Mon, 19 Dec 2022 10:51:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7IQN-0002aw-45
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:51:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7IQK-0000aV-SU
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:51:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671465088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=92ObYhpSfUlQQaC3UvSunnbX2eEX78YfTFndTt8VRGs=;
 b=QGGDROz1jiLe+Xt1axBcpphkEtyZmRnNBwhxQQNLt6ppb85TKoj801736ULoaiyGV/knqz
 n9vsTSKi0OS3YVfn7yvDoPhIPhr8Y3VVsjzKsJhj8ok+oap3nHNA4+FFdSBFfCX/TVZ+L8
 Rs3UoWzDyfQDkO0aES/p4wWJ0mfpXWU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-VuabuuvEM8-eGG48qyi9aQ-1; Mon, 19 Dec 2022 10:51:23 -0500
X-MC-Unique: VuabuuvEM8-eGG48qyi9aQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FC3F3813F46;
 Mon, 19 Dec 2022 15:51:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 037C51121315;
 Mon, 19 Dec 2022 15:51:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6E8AC21E65CC; Mon, 19 Dec 2022 16:51:20 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, "Michael S . Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PULL 12/13] pci: Improve do_pcie_aer_inject_error()'s error messages
Date: Mon, 19 Dec 2022 16:51:19 +0100
Message-Id: <20221219155120.2273041-13-armbru@redhat.com>
In-Reply-To: <20221219155120.2273041-1-armbru@redhat.com>
References: <20221219155120.2273041-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
Message-Id: <20221201121133.3813857-13-armbru@redhat.com>
---
 hw/pci/pci-hmp-cmds.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/hw/pci/pci-hmp-cmds.c b/hw/pci/pci-hmp-cmds.c
index 6f0bb95ee4..a292d06ea0 100644
--- a/hw/pci/pci-hmp-cmds.c
+++ b/hw/pci/pci-hmp-cmds.c
@@ -161,6 +161,7 @@ void pcibus_dev_print(Monitor *mon, DeviceState *dev, int indent)
 
 void hmp_pcie_aer_inject_error(Monitor *mon, const QDict *qdict)
 {
+    Error *err = NULL;
     const char *id = qdict_get_str(qdict, "id");
     const char *error_name;
     uint32_t error_status;
@@ -171,24 +172,20 @@ void hmp_pcie_aer_inject_error(Monitor *mon, const QDict *qdict)
     int ret;
 
     ret = pci_qdev_find_device(id, &dev);
-    if (ret < 0) {
-        monitor_printf(mon,
-                       "id or pci device path is invalid or device not "
-                       "found. %s\n", id);
-        return;
+    if (ret == -ENODEV) {
+        error_setg(&err, "device '%s' not found", id);
+        goto out;
     }
-    if (!pci_is_express(dev)) {
-        monitor_printf(mon, "the device doesn't support pci express. %s\n",
-                       id);
-        return;
+    if (ret < 0 || !pci_is_express(dev)) {
+        error_setg(&err, "device '%s' is not a PCIe device", id);
+        goto out;
     }
 
     error_name = qdict_get_str(qdict, "error_status");
     if (pcie_aer_parse_error_string(error_name, &error_status, &correctable)) {
         if (qemu_strtoui(error_name, NULL, 0, &num) < 0) {
-            monitor_printf(mon, "invalid error status value. \"%s\"",
-                           error_name);
-            return;
+            error_setg(&err, "invalid error status value '%s'", error_name);
+            goto out;
         }
         error_status = num;
         correctable = qdict_get_try_bool(qdict, "correctable", false);
@@ -222,12 +219,15 @@ void hmp_pcie_aer_inject_error(Monitor *mon, const QDict *qdict)
 
     ret = pcie_aer_inject_error(dev, &aer_err);
     if (ret < 0) {
-        monitor_printf(mon, "failed to inject error: %s\n",
-                       strerror(-ret));
-        return;
+        error_setg_errno(&err, -ret, "failed to inject error");
+        goto out;
     }
 
+
     monitor_printf(mon, "OK id: %s root bus: %s, bus: %x devfn: %x.%x\n",
                    id, pci_root_bus_path(dev), pci_dev_bus_num(dev),
                    PCI_SLOT(dev->devfn), PCI_FUNC(dev->devfn));
+
+out:
+    hmp_handle_error(mon, err);
 }
-- 
2.37.3


