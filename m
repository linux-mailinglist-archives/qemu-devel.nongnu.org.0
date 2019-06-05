Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 358E136512
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 22:05:32 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49104 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYcA7-00066f-DA
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 16:05:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34066)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hYc5O-000345-VK
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 16:00:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hYc5K-0005XK-9Y
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 16:00:36 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:37491)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mst@redhat.com>) id 1hYc5I-000560-D4
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 16:00:33 -0400
Received: by mail-qt1-f194.google.com with SMTP id y57so19521571qtk.4
	for <qemu-devel@nongnu.org>; Wed, 05 Jun 2019 13:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=s3n2L882ltXjPfEswBbEwB7+zfGhmxcdhpoO8/YoZaM=;
	b=pusVlMxyH38rWOqzN4my+dOAW4u341uqyhKUr4kDxtPyNlD06bndxlkRfaSK9x86DS
	HHVgFTIpmhhAKh/mzVVxi33Zso99zGxq/dPR7KXVhaSYQCpe/9ssB7RAFftTunH0z3KM
	ips9uUCzkzTLIk+/CgvTWtShVSYOVh2jf2YKwpXG7K/EQD7EgYB0jtycCNlWSd8HZw06
	KadxzkLGjx529N8wEyu31gCPek5c68iuujkaN/q+4tCK+pgPAulCo1naPARnuZbynaLX
	06fQYnC008B0FNW/rk9471Fl2ZkgNNNMo8NKTXCM4RWqt2J8bhFjvX75cwvLptm7qpTf
	d1CA==
X-Gm-Message-State: APjAAAULMSKTsUXigx4wViQciEW6YjmI4Ld0rMeIRPgJiWEWz4KFTDYj
	oF9qPAfkloliucEIusDj9Ss36jrnb30=
X-Google-Smtp-Source: APXvYqyhOSDCBf2+HUh/+LDH5GpUJFR1fUdMuCKaQ50ZS3NPvJsQohp4fyR/tdzk1ZRpEWNjOs5CFg==
X-Received: by 2002:a0c:bf4a:: with SMTP id b10mr33929800qvj.120.1559764817947;
	Wed, 05 Jun 2019 13:00:17 -0700 (PDT)
Received: from redhat.com (pool-100-0-197-103.bstnma.fios.verizon.net.
	[100.0.197.103]) by smtp.gmail.com with ESMTPSA id
	n10sm10511534qke.72.2019.06.05.13.00.16
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 05 Jun 2019 13:00:17 -0700 (PDT)
Date: Wed, 5 Jun 2019 16:00:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20190513061939.3464-6-david@gibson.dropbear.id.au>
References: <20190605195913.12243-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190605195913.12243-1-mst@redhat.com>
X-Mailer: git-send-email 2.17.1.1206.gb667731e2e.dirty
X-Mutt-Fcc: =sent
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.194
Subject: [Qemu-devel] [PULL v3 05/17] pci: Fold pci_get_bus_devfn() into its
 sole caller
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Greg Kurz <groug@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Gibson <david@gibson.dropbear.id.au>

The only remaining caller of pci_get_bus_devfn() is pci_nic_init_nofail(),
itself an old compatibility function.  Fold the two together to avoid
re-using the stale interface.

While we're there replace the explicit fprintf()s with error_report().

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20190513061939.3464-6-david@gibson.dropbear.id.au>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 hw/pci/pci.c | 60 ++++++++++++++++++++++++----------------------------
 1 file changed, 28 insertions(+), 32 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 7e5f8d001b..d3893bdfe1 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -723,37 +723,6 @@ static int pci_parse_devaddr(const char *addr, int *domp, int *busp,
     return 0;
 }
 
-static PCIBus *pci_get_bus_devfn(int *devfnp, PCIBus *root,
-                                 const char *devaddr)
-{
-    int dom, bus;
-    unsigned slot;
-
-    if (!root) {
-        fprintf(stderr, "No primary PCI bus\n");
-        return NULL;
-    }
-
-    assert(!root->parent_dev);
-
-    if (!devaddr) {
-        *devfnp = -1;
-        return pci_find_bus_nr(root, 0);
-    }
-
-    if (pci_parse_devaddr(devaddr, &dom, &bus, &slot, NULL) < 0) {
-        return NULL;
-    }
-
-    if (dom != 0) {
-        fprintf(stderr, "No support for non-zero PCI domains\n");
-        return NULL;
-    }
-
-    *devfnp = PCI_DEVFN(slot, 0);
-    return pci_find_bus_nr(root, bus);
-}
-
 static void pci_init_cmask(PCIDevice *dev)
 {
     pci_set_word(dev->cmask + PCI_VENDOR_ID, 0xffff);
@@ -1895,6 +1864,8 @@ PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
     DeviceState *dev;
     int devfn;
     int i;
+    int dom, busnr;
+    unsigned slot;
 
     if (nd->model && !strcmp(nd->model, "virtio")) {
         g_free(nd->model);
@@ -1928,7 +1899,32 @@ PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
         exit(1);
     }
 
-    bus = pci_get_bus_devfn(&devfn, rootbus, devaddr);
+    if (!rootbus) {
+        error_report("No primary PCI bus");
+        exit(1);
+    }
+
+    assert(!rootbus->parent_dev);
+
+    if (!devaddr) {
+        devfn = -1;
+        busnr = 0;
+    } else {
+        if (pci_parse_devaddr(devaddr, &dom, &busnr, &slot, NULL) < 0) {
+            error_report("Invalid PCI device address %s for device %s",
+                         devaddr, nd->model);
+            exit(1);
+        }
+
+        if (dom != 0) {
+            error_report("No support for non-zero PCI domains");
+            exit(1);
+        }
+
+        devfn = PCI_DEVFN(slot, 0);
+    }
+
+    bus = pci_find_bus_nr(rootbus, busnr);
     if (!bus) {
         error_report("Invalid PCI device address %s for device %s",
                      devaddr, nd->model);
-- 
MST


