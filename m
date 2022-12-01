Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B558963F094
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 13:32:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0iQB-0004V4-2n; Thu, 01 Dec 2022 07:12:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0iPv-0004I9-8r
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 07:11:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0iPp-0008Ez-5c
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 07:11:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669896704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Icvnjof7qTILzCzrASrlzID3IYpCq4VGLmlLsuYzzjA=;
 b=iQaNnH/yqnptRQMdNyVzBbxxGZb9ZJT1+BEnj0mnuD2tAtZtdCB6NZqo6CELPqABnWAJTL
 PXkFCHmnykIgvR/AHfKcnlpBh+0l3oOXcJnZGwgzW3yqm9VqegcWabmH8DezV7yscOuQRn
 v6XYtYJhHZefymQHPwk+3pJOLvvZdr0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-349-Fi__bA5fMsSNiVHBTEgVog-1; Thu, 01 Dec 2022 07:11:41 -0500
X-MC-Unique: Fi__bA5fMsSNiVHBTEgVog-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6199380391A;
 Thu,  1 Dec 2022 12:11:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BCCBFD48;
 Thu,  1 Dec 2022 12:11:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0697621E65CC; Thu,  1 Dec 2022 13:11:34 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com, dgilbert@redhat.com,
 philmd@linaro.org
Subject: [PATCH v2 12/13] pci: Improve do_pcie_aer_inject_error()'s error
 messages
Date: Thu,  1 Dec 2022 13:11:32 +0100
Message-Id: <20221201121133.3813857-13-armbru@redhat.com>
In-Reply-To: <20221201121133.3813857-1-armbru@redhat.com>
References: <20221201121133.3813857-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
---
 hw/pci/pci-hmp-cmds.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/hw/pci/pci-hmp-cmds.c b/hw/pci/pci-hmp-cmds.c
index 2dd65ca6ee..7a3175ab4b 100644
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


