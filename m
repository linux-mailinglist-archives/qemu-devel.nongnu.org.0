Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2696669479F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 15:05:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRZPL-00073d-Pm; Mon, 13 Feb 2023 09:02:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRZOr-0006ee-6p
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:01:50 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRZOm-0005vb-A7
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:01:44 -0500
Received: from myt6-23a5e62c0090.qloud-c.yandex.net
 (myt6-23a5e62c0090.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:1da3:0:640:23a5:e62c])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id AF0AD618B1;
 Mon, 13 Feb 2023 17:01:25 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:6527::1:3a])
 by myt6-23a5e62c0090.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 51j9w00QYCg1-sWblxHjh; Mon, 13 Feb 2023 17:01:24 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676296884; bh=wtLpRKD+34nSNrWfdyB3ApaJ12n1OZ5huD/Mn1RffKM=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=b6wW/RDjTQjOtmH50xaiQ32boSMYcSto6/Z1Ftj2WXLOgc+uyRqc26MAOMY1Ifqpa
 461Jb5ckcbyI5NrQrZ3dVnY5ElJC9EW8eHrYY7HpmEKy2k0IpsMIOhirEEeP2C/toD
 y5UaNhK1qPBlFXaDDs86AkOuZ/KOPXx2y4ETnaJg=
Authentication-Results: myt6-23a5e62c0090.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, philmd@linaro.org, vsementsov@yandex-team.ru,
 den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru
Subject: [PATCH v4 13/16] pci: introduce pci_find_the_only_child()
Date: Mon, 13 Feb 2023 17:01:00 +0300
Message-Id: <20230213140103.1518173-14-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
References: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
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


