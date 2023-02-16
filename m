Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F66C699BE1
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 19:06:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSicI-0000CH-15; Thu, 16 Feb 2023 13:04:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSicE-0000A1-Me
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 13:04:18 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSicD-0005p0-1x
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 13:04:18 -0500
Received: from iva8-99b070b76c56.qloud-c.yandex.net
 (iva8-99b070b76c56.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:1099:0:640:99b0:70b7])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id C37C6600F7;
 Thu, 16 Feb 2023 21:04:12 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:8813::1:16])
 by iva8-99b070b76c56.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 u3q89J0Qp8c1-tow6Dt1V; Thu, 16 Feb 2023 21:04:12 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676570652; bh=F5Wxv5yHGahm1QgMD4KJ+e7w0s6Rljic/JUMqMdNWmE=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=azieJRY3jCblJrsSQDPDNyJWJtFrWN4QFy5PY69Z9RYPWfv024YK6UsKdf+at3gcN
 spsGwP//cPreOB2Dc/DVUkGsqwvcRpWNBFW2xJ1+tLD1sOxffRg2X6VNrVont1omp/
 yYQDT1pruxY83h4zHvZJO/sBXbBOjvjKqGcqAC+U=
Authentication-Results: iva8-99b070b76c56.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, philmd@linaro.org, vsementsov@yandex-team.ru,
 den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru
Subject: [PATCH v5 13/18] pci: introduce pci_find_the_only_child()
Date: Thu, 16 Feb 2023 21:03:51 +0300
Message-Id: <20230216180356.156832-14-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216180356.156832-1-vsementsov@yandex-team.ru>
References: <20230216180356.156832-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

To be used in further patch to identify the device hot-plugged into
pcie-root-port.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Anton Kuchin <antonkuchin@yandex-team.ru>
---
 include/hw/pci/pci.h |  1 +
 hw/pci/pci.c         | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index d5a40cd058..b6c9c44527 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -341,6 +341,7 @@ void pci_for_each_device_under_bus_reverse(PCIBus *bus,
 void pci_for_each_bus_depth_first(PCIBus *bus, pci_bus_ret_fn begin,
                                   pci_bus_fn end, void *parent_state);
 PCIDevice *pci_get_function_0(PCIDevice *pci_dev);
+PCIDevice *pci_find_the_only_child(PCIBus *bus, int bus_num, Error **errp);
 
 /* Use this wrapper when specific scan order is not required. */
 static inline
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 208c16f450..34fd1fb5b8 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1771,6 +1771,39 @@ void pci_for_each_device(PCIBus *bus, int bus_num,
     }
 }
 
+typedef struct TheOnlyChild {
+    PCIDevice *dev;
+    int count;
+} TheOnlyChild;
+
+static void the_only_child_fn(PCIBus *bus, PCIDevice *dev, void *opaque)
+{
+    TheOnlyChild *s = opaque;
+
+    s->dev = dev;
+    s->count++;
+}
+
+PCIDevice *pci_find_the_only_child(PCIBus *bus, int bus_num, Error **errp)
+{
+    TheOnlyChild res = {0};
+
+    pci_for_each_device(bus, bus_num, the_only_child_fn, &res);
+
+    if (!res.dev) {
+        assert(res.count == 0);
+        error_setg(errp, "No child devices found");
+        return NULL;
+    }
+
+    if (res.count > 1) {
+        error_setg(errp, "Several child devices found");
+        return NULL;
+    }
+
+    return res.dev;
+}
+
 const pci_class_desc *get_class_desc(int class)
 {
     const pci_class_desc *desc;
-- 
2.34.1


