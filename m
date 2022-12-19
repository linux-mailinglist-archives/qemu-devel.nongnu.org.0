Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EA6650F42
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 16:52:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7IQY-0002m7-UN; Mon, 19 Dec 2022 10:51:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7IQN-0002as-3E
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:51:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7IQJ-0000aA-MH
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:51:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671465086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GHNKr3NXLHilA68zUnAww/MjADXAGpnep9DTuvX3Xpo=;
 b=BMa1JFd36o1fdArFEpCJ9J0bhRxu/twFeMM62s8OXO8zBcVerOIfZ4leVArJu4gz0E18JO
 1AzDu7y9U5Fhfv/XZmuuqZzoJZSOPooz9AJIeJxgTLkcXn8ZgpQ7ZP2M/zzJV56y+NwP7c
 xlRBgnxJugAYpCMM0e0bjcDJX2IGPsA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-_dYuXw7HMdyv4KfacQBsjQ-1; Mon, 19 Dec 2022 10:51:23 -0500
X-MC-Unique: _dYuXw7HMdyv4KfacQBsjQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33EB8293248B;
 Mon, 19 Dec 2022 15:51:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 053DD40C2004;
 Mon, 19 Dec 2022 15:51:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6C76921E65CB; Mon, 19 Dec 2022 16:51:20 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 11/13] pci: Rename hmp_pcie_aer_inject_error()'s local variable
 @err
Date: Mon, 19 Dec 2022 16:51:18 +0100
Message-Id: <20221219155120.2273041-12-armbru@redhat.com>
In-Reply-To: <20221219155120.2273041-1-armbru@redhat.com>
References: <20221219155120.2273041-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

I'd like to use @err for an Error *err.  Rename PCIEAERErr err to
aer_err.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221201121133.3813857-12-armbru@redhat.com>
---
 hw/pci/pci-hmp-cmds.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/hw/pci/pci-hmp-cmds.c b/hw/pci/pci-hmp-cmds.c
index 52c86323e5..6f0bb95ee4 100644
--- a/hw/pci/pci-hmp-cmds.c
+++ b/hw/pci/pci-hmp-cmds.c
@@ -167,7 +167,7 @@ void hmp_pcie_aer_inject_error(Monitor *mon, const QDict *qdict)
     unsigned int num;
     bool correctable;
     PCIDevice *dev;
-    PCIEAERErr err;
+    PCIEAERErr aer_err;
     int ret;
 
     ret = pci_qdev_find_device(id, &dev);
@@ -193,34 +193,34 @@ void hmp_pcie_aer_inject_error(Monitor *mon, const QDict *qdict)
         error_status = num;
         correctable = qdict_get_try_bool(qdict, "correctable", false);
     }
-    err.status = error_status;
-    err.source_id = pci_requester_id(dev);
+    aer_err.status = error_status;
+    aer_err.source_id = pci_requester_id(dev);
 
-    err.flags = 0;
+    aer_err.flags = 0;
     if (correctable) {
-        err.flags |= PCIE_AER_ERR_IS_CORRECTABLE;
+        aer_err.flags |= PCIE_AER_ERR_IS_CORRECTABLE;
     }
     if (qdict_get_try_bool(qdict, "advisory_non_fatal", false)) {
-        err.flags |= PCIE_AER_ERR_MAYBE_ADVISORY;
+        aer_err.flags |= PCIE_AER_ERR_MAYBE_ADVISORY;
     }
     if (qdict_haskey(qdict, "header0")) {
-        err.flags |= PCIE_AER_ERR_HEADER_VALID;
+        aer_err.flags |= PCIE_AER_ERR_HEADER_VALID;
     }
     if (qdict_haskey(qdict, "prefix0")) {
-        err.flags |= PCIE_AER_ERR_TLP_PREFIX_PRESENT;
+        aer_err.flags |= PCIE_AER_ERR_TLP_PREFIX_PRESENT;
     }
 
-    err.header[0] = qdict_get_try_int(qdict, "header0", 0);
-    err.header[1] = qdict_get_try_int(qdict, "header1", 0);
-    err.header[2] = qdict_get_try_int(qdict, "header2", 0);
-    err.header[3] = qdict_get_try_int(qdict, "header3", 0);
+    aer_err.header[0] = qdict_get_try_int(qdict, "header0", 0);
+    aer_err.header[1] = qdict_get_try_int(qdict, "header1", 0);
+    aer_err.header[2] = qdict_get_try_int(qdict, "header2", 0);
+    aer_err.header[3] = qdict_get_try_int(qdict, "header3", 0);
 
-    err.prefix[0] = qdict_get_try_int(qdict, "prefix0", 0);
-    err.prefix[1] = qdict_get_try_int(qdict, "prefix1", 0);
-    err.prefix[2] = qdict_get_try_int(qdict, "prefix2", 0);
-    err.prefix[3] = qdict_get_try_int(qdict, "prefix3", 0);
+    aer_err.prefix[0] = qdict_get_try_int(qdict, "prefix0", 0);
+    aer_err.prefix[1] = qdict_get_try_int(qdict, "prefix1", 0);
+    aer_err.prefix[2] = qdict_get_try_int(qdict, "prefix2", 0);
+    aer_err.prefix[3] = qdict_get_try_int(qdict, "prefix3", 0);
 
-    ret = pcie_aer_inject_error(dev, &err);
+    ret = pcie_aer_inject_error(dev, &aer_err);
     if (ret < 0) {
         monitor_printf(mon, "failed to inject error: %s\n",
                        strerror(-ret));
-- 
2.37.3


