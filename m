Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBFA55FB74
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 11:13:15 +0200 (CEST)
Received: from localhost ([::1]:51012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Tl4-0004ez-FF
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 05:13:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o6ThC-0000k4-Ny; Wed, 29 Jun 2022 05:09:21 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:60003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o6Th9-0003Z8-8Q; Wed, 29 Jun 2022 05:09:14 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MkIEJ-1nMjji15Ev-00kdGw; Wed, 29
 Jun 2022 11:09:03 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Paul Durrant <paul@xen.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 11/11] hw/i386/xen/xen-hvm: Inline
 xen_piix_pci_write_config_client() and remove it
Date: Wed, 29 Jun 2022 11:08:49 +0200
Message-Id: <20220629090849.1350227-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629090849.1350227-1-laurent@vivier.eu>
References: <20220629090849.1350227-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qBv/7UjwxrbeNckl58IzS2rHwDjbiPxTtEFcB+M7dqM77+2Mkpk
 wM9kC20r6k7lkq/3A21YGRsnp5L5mFL30pQtFBsCvffQhXV9R5AAm5AgFskNK9kE9yy5s5M
 moG7/Q1H+P1oNSB2TFdMTmvtGv3TXB7iOQmsG1eiptSD+zz0gp897Xrf5kPAFkIV5TisL7W
 6SqLQ5cy21B2RrH6DXEtw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:s5UxDHgrId0=:4aTgmPwCC8K+pzl/8C9Zuw
 e6qVFO9I/jtzX5beSvz6BZVUg/t06DDBjk9iVDgw1nPPAL4pXMIq1r+EFjRJzbzbsxUX3dCTg
 wTTSOcGp8GFox3rWaNfp0DBn2BxGF8ooYcC4ZPsesdayqvKm+6EAin+F/xkmsWeIgOarCMuf0
 4Dr62daujhoylvH3WR8SHeNHX6dF9Q/D8BIVThNQk0bsGKLmXfQfFAUGbE+KCuZ//Oy6nje2c
 Px8ee4GR2jnSeTK3qSb1txiVe5dKhF2xmpheS7RRmvjsdMrzr6Lpv5gFx10mtHQZzH1aScBDZ
 RG3A1CExHrc7JSdddIUzWOA4r2Rg7Nr9l4V+y2oHwXSdA33UycIgULA9sV3tTn5eWgB3hxdEK
 BmBihsYJoWzxWLtRWYbOKSWbpt1aPenEZbRM2AbtqseYmWNPsaju/F0XxlKSyxsEger8IYRYc
 OjyWuQuJ+uP2fkfQ6zGqlsVRVd1dE1CbvldFciK2jhModavQ4ERaSEAjwFyM0cb+EbT/FJbCL
 ZURybfYFV2PzgujAzn75ngAGzLBPfWKFW/d8tn8kgRWtg9XRNQVfiArxHkDQEKuugdUnJxh7c
 rFHWtftKO8qMjGMlcTexITJfAnbEL+8HFiIpUH7lCZskVJxgEFsQRlX1Ft2ik7MfmTBltpOls
 9+glxXzE63eDy6D31tyyo7EpTQ0Cluvc1sQ6lIO6RXhGZOeGZMNpIef1wHoZCe4nucW9MFQ9t
 RkolODep46ZwIhhT64ms5jk04Il0+BZdW+4P/g==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bernhard Beschow <shentey@gmail.com>

xen_piix_pci_write_config_client() is implemented in the xen sub tree and
uses PIIX constants internally, thus creating a direct dependency on
PIIX. Now that xen_set_pci_link_route() is stubbable, the logic of
xen_piix_pci_write_config_client() can be moved to PIIX which resolves
the dependency.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Paul Durrant <paul@xen.org>
Message-Id: <20220626094656.15673-3-shentey@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/i386/xen/xen-hvm.c | 18 ------------------
 hw/isa/piix3.c        | 15 ++++++++++++++-
 include/hw/xen/xen.h  |  1 -
 stubs/xen-hw-stub.c   |  4 ----
 4 files changed, 14 insertions(+), 24 deletions(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 204fda7949d9..e4293d6d666a 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -15,7 +15,6 @@
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_host.h"
 #include "hw/i386/pc.h"
-#include "hw/southbridge/piix.h"
 #include "hw/irq.h"
 #include "hw/hw.h"
 #include "hw/i386/apic-msidef.h"
@@ -149,23 +148,6 @@ void xen_piix3_set_irq(void *opaque, int irq_num, int level)
                            irq_num & 3, level);
 }
 
-void xen_piix_pci_write_config_client(uint32_t address, uint32_t val, int len)
-{
-    int i;
-
-    /* Scan for updates to PCI link routes (0x60-0x63). */
-    for (i = 0; i < len; i++) {
-        uint8_t v = (val >> (8 * i)) & 0xff;
-        if (v & 0x80) {
-            v = 0;
-        }
-        v &= 0xf;
-        if (((address + i) >= PIIX_PIRQCA) && ((address + i) <= PIIX_PIRQCD)) {
-            xen_set_pci_link_route(address + i - PIIX_PIRQCA, v);
-        }
-    }
-}
-
 int xen_set_pci_link_route(uint8_t link, uint8_t irq)
 {
     return xendevicemodel_set_pci_link_route(xen_dmod, xen_domid, link, irq);
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 6388558f92d4..48f9ab109645 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -138,7 +138,20 @@ static void piix3_write_config(PCIDevice *dev,
 static void piix3_write_config_xen(PCIDevice *dev,
                                    uint32_t address, uint32_t val, int len)
 {
-    xen_piix_pci_write_config_client(address, val, len);
+    int i;
+
+    /* Scan for updates to PCI link routes (0x60-0x63). */
+    for (i = 0; i < len; i++) {
+        uint8_t v = (val >> (8 * i)) & 0xff;
+        if (v & 0x80) {
+            v = 0;
+        }
+        v &= 0xf;
+        if (((address + i) >= PIIX_PIRQCA) && ((address + i) <= PIIX_PIRQCD)) {
+            xen_set_pci_link_route(address + i - PIIX_PIRQCA, v);
+        }
+    }
+
     piix3_write_config(dev, address, val, len);
 }
 
diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
index 13bffaef531f..afdf9c436afc 100644
--- a/include/hw/xen/xen.h
+++ b/include/hw/xen/xen.h
@@ -23,7 +23,6 @@ extern bool xen_domid_restrict;
 int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num);
 int xen_set_pci_link_route(uint8_t link, uint8_t irq);
 void xen_piix3_set_irq(void *opaque, int irq_num, int level);
-void xen_piix_pci_write_config_client(uint32_t address, uint32_t val, int len);
 void xen_hvm_inject_msi(uint64_t addr, uint32_t data);
 int xen_is_pirq_msi(uint32_t msi_data);
 
diff --git a/stubs/xen-hw-stub.c b/stubs/xen-hw-stub.c
index 743967623f00..34a22f2ad72e 100644
--- a/stubs/xen-hw-stub.c
+++ b/stubs/xen-hw-stub.c
@@ -19,10 +19,6 @@ void xen_piix3_set_irq(void *opaque, int irq_num, int level)
 {
 }
 
-void xen_piix_pci_write_config_client(uint32_t address, uint32_t val, int len)
-{
-}
-
 int xen_set_pci_link_route(uint8_t link, uint8_t irq)
 {
     return -1;
-- 
2.36.1


