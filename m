Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CF91E7F61
	for <lists+qemu-devel@lfdr.de>; Fri, 29 May 2020 15:57:02 +0200 (CEST)
Received: from localhost ([::1]:60686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jefVN-00078V-D4
	for lists+qemu-devel@lfdr.de; Fri, 29 May 2020 09:57:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jefKT-0002vg-3q
 for qemu-devel@nongnu.org; Fri, 29 May 2020 09:45:45 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47817
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jefKM-000760-2x
 for qemu-devel@nongnu.org; Fri, 29 May 2020 09:45:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590759936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DHgoFM8sSce36Nfwds/4dWG1ljaYs6CSL20+18yJTs8=;
 b=KrqEughfRDAEAYRLCEMsncyhl/oxeC4mKm18HbLtZFkPgeJZJ6AcbbL898kBunqyR9TZt/
 AI2/y9WZ3ehTQMaXONAJEEt55I98JmdwBrfAy4Kb1gft5Bzg6apLabwq3GmpwuR7dW5xA5
 McE/4pDyLOBPD3O3dmDxokLITmxabdQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-2sAsEcZuMnGdvv8_t2qB6A-1; Fri, 29 May 2020 09:45:32 -0400
X-MC-Unique: 2sAsEcZuMnGdvv8_t2qB6A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34BD6800688;
 Fri, 29 May 2020 13:45:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D60345D9EF;
 Fri, 29 May 2020 13:45:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 07F1511358C6; Fri, 29 May 2020 15:45:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/58] pci: New pci_new(), pci_realize_and_unref() etc.
Date: Fri, 29 May 2020 15:44:38 +0200
Message-Id: <20200529134523.8477-14-armbru@redhat.com>
In-Reply-To: <20200529134523.8477-1-armbru@redhat.com>
References: <20200529134523.8477-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/29 01:34:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm converting from qdev_create()/qdev_init_nofail() to
qdev_new()/qdev_realize_and_unref(); recent commit "qdev: New
qdev_new(), qdev_realize(), etc." explains why.

PCI devices use qdev_create() through pci_create() and
pci_create_multifunction().

Provide pci_new(), pci_new_multifunction(), and
pci_realize_and_unref() for converting PCI devices.

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/hw/pci/pci.h |  5 +++++
 hw/pci/pci.c         | 21 +++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index cfedf5a995..66f8ba519b 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -712,6 +712,11 @@ pci_get_quad_by_mask(uint8_t *config, uint64_t mask)
     return (val & mask) >> ctz32(mask);
 }
 
+PCIDevice *pci_new_multifunction(int devfn, bool multifunction,
+                                    const char *name);
+PCIDevice *pci_new(int devfn, const char *name);
+bool pci_realize_and_unref(PCIDevice *dev, PCIBus *bus, Error **errp);
+
 PCIDevice *pci_create_multifunction(PCIBus *bus, int devfn, bool multifunction,
                                     const char *name);
 PCIDevice *pci_create_simple_multifunction(PCIBus *bus, int devfn,
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 6947c741c3..92f3f0f134 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2147,6 +2147,27 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
     }
 }
 
+PCIDevice *pci_new_multifunction(int devfn, bool multifunction,
+                                 const char *name)
+{
+    DeviceState *dev;
+
+    dev = qdev_new(name);
+    qdev_prop_set_int32(dev, "addr", devfn);
+    qdev_prop_set_bit(dev, "multifunction", multifunction);
+    return PCI_DEVICE(dev);
+}
+
+PCIDevice *pci_new(int devfn, const char *name)
+{
+    return pci_new_multifunction(devfn, false, name);
+}
+
+bool pci_realize_and_unref(PCIDevice *dev, PCIBus *bus, Error **errp)
+{
+    return qdev_realize_and_unref(&dev->qdev, &bus->qbus, errp);
+}
+
 PCIDevice *pci_create_multifunction(PCIBus *bus, int devfn, bool multifunction,
                                     const char *name)
 {
-- 
2.21.3


