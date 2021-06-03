Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DADFD399C90
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:28:51 +0200 (CEST)
Received: from localhost ([::1]:34448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loiig-0003uY-Uj
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:28:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loicz-00068n-2T; Thu, 03 Jun 2021 04:22:57 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:46133 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loicw-0008Sj-7n; Thu, 03 Jun 2021 04:22:56 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fwf5l4fp1z9sXL; Thu,  3 Jun 2021 18:22:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622708555;
 bh=75gmhdPh1Ts1Ji0rGcd3DmonXE08Siyfkhm45iErutE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G9SIYIxNlYJDH6pJJeRARZEZOjFkn2enjKpPedsGi4UpMynWZecRLV8XDdSUb5eaP
 1jBY6pZyb08USz7YHUUErE1pSJ/KDcYwCGTMghAOzr0OAwCABeMnRZQYUULBl/VR0E
 a4e2Yx8iH8g1LGG1Y1zZmtb0wWGTYfl8vC0sRAjU=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 06/42] spapr: Fix EEH capability issue on KVM guest for PCI
 passthru
Date: Thu,  3 Jun 2021 18:21:55 +1000
Message-Id: <20210603082231.601214-7-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603082231.601214-1-david@gibson.dropbear.id.au>
References: <20210603082231.601214-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahesh Salgaonkar <mahesh@linux.ibm.com>

With upstream kernel, especially after commit 98ba956f6a389
("powerpc/pseries/eeh: Rework device EEH PE determination") we see that KVM
guest isn't able to enable EEH option for PCI pass-through devices anymore.

[root@atest-guest ~]# dmesg | grep EEH
[    0.032337] EEH: pSeries platform initialized
[    0.298207] EEH: No capable adapters found: recovery disabled.
[root@atest-guest ~]#

So far the linux kernel was assuming pe_config_addr equal to device's
config_addr and using it to enable EEH on the PE through ibm,set-eeh-option
RTAS call. Which wasn't the correct way as per PAPR. The linux kernel
commit 98ba956f6a389 fixed this flow. With that fixed, linux now uses PE
config address returned by ibm,get-config-addr-info2 RTAS call to enable
EEH option per-PE basis instead of per-device basis. However this has
uncovered a bug in qemu where ibm,set-eeh-option is treating PE config
address as per-device config address.

Hence in qemu guest with recent kernel the ibm,set-eeh-option RTAS call
fails with -3 return value indicating that there is no PCI device exist for
the specified PE config address. The rtas_ibm_set_eeh_option call uses
pci_find_device() to get the PC device that matches specific bus and devfn
extracted from PE config address passed as argument. Thus it tries to map
the PE config address to a single specific PCI device 'bus->devices[devfn]'
which always results into checking device on slot 0 'bus->devices[0]'.
This succeeds when there is a pass-through device (vfio-pci) present on
slot 0. But in cases where there is no pass-through device present in slot
0, but present in non-zero slots, ibm,set-eeh-option call fails to enable
the EEH capability.

hw/ppc/spapr_pci_vfio.c: spapr_phb_vfio_eeh_set_option()
   case RTAS_EEH_ENABLE: {
        PCIHostState *phb;
        PCIDevice *pdev;

        /*
         * The EEH functionality is enabled on basis of PCI device,
         * instead of PE. We need check the validity of the PCI
         * device address.
         */
        phb = PCI_HOST_BRIDGE(sphb);
        pdev = pci_find_device(phb->bus,
                               (addr >> 16) & 0xFF, (addr >> 8) & 0xFF);
        if (!pdev || !object_dynamic_cast(OBJECT(pdev), "vfio-pci")) {
            return RTAS_OUT_PARAM_ERROR;
        }

hw/pci/pci.c:pci_find_device()

PCIDevice *pci_find_device(PCIBus *bus, int bus_num, uint8_t devfn)
{
    bus = pci_find_bus_nr(bus, bus_num);

    if (!bus)
        return NULL;

    return bus->devices[devfn];
}

This patch fixes ibm,set-eeh-option to check for presence of any PCI device
(vfio-pci) under specified bus and enable the EEH if found. The current
code already makes sure that all the devices on that bus are from same
iommu group (within same PE) and fail very early if it does not.

After this fix guest is able to find EEH capable devices and enable EEH
recovery on it.

[root@atest-guest ~]# dmesg | grep EEH
[    0.048139] EEH: pSeries platform initialized
[    0.405115] EEH: Capable adapter found: recovery enabled.
[root@atest-guest ~]#

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Message-Id: <162158429107.145117.5843504911924013125.stgit@jupiter>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_pci_vfio.c | 40 +++++++++++++++++++++++++++++++++-------
 1 file changed, 33 insertions(+), 7 deletions(-)

diff --git a/hw/ppc/spapr_pci_vfio.c b/hw/ppc/spapr_pci_vfio.c
index 7817cf72ee..f3b37df8ea 100644
--- a/hw/ppc/spapr_pci_vfio.c
+++ b/hw/ppc/spapr_pci_vfio.c
@@ -46,6 +46,16 @@ void spapr_phb_vfio_reset(DeviceState *qdev)
     spapr_phb_vfio_eeh_reenable(SPAPR_PCI_HOST_BRIDGE(qdev));
 }
 
+static void spapr_eeh_pci_find_device(PCIBus *bus, PCIDevice *pdev,
+                                      void *opaque)
+{
+    bool *found = opaque;
+
+    if (object_dynamic_cast(OBJECT(pdev), "vfio-pci")) {
+        *found = true;
+    }
+}
+
 int spapr_phb_vfio_eeh_set_option(SpaprPhbState *sphb,
                                   unsigned int addr, int option)
 {
@@ -58,17 +68,33 @@ int spapr_phb_vfio_eeh_set_option(SpaprPhbState *sphb,
         break;
     case RTAS_EEH_ENABLE: {
         PCIHostState *phb;
-        PCIDevice *pdev;
+        bool found = false;
 
         /*
-         * The EEH functionality is enabled on basis of PCI device,
-         * instead of PE. We need check the validity of the PCI
-         * device address.
+         * The EEH functionality is enabled per sphb level instead of
+         * per PCI device. We have already identified this specific sphb
+         * based on buid passed as argument to ibm,set-eeh-option rtas
+         * call. Now we just need to check the validity of the PCI
+         * pass-through devices (vfio-pci) under this sphb bus.
+         * We have already validated that all the devices under this sphb
+         * are from same iommu group (within same PE) before comming here.
+         *
+         * Prior to linux commit 98ba956f6a389 ("powerpc/pseries/eeh:
+         * Rework device EEH PE determination") kernel would call
+         * eeh-set-option for each device in the PE using the device's
+         * config_address as the argument rather than the PE address.
+         * Hence if we check validity of supplied config_addr whether
+         * it matches to this PHB will cause issues with older kernel
+         * versions v5.9 and older. If we return an error from
+         * eeh-set-option when the argument isn't a valid PE address
+         * then older kernels (v5.9 and older) will interpret that as
+         * EEH not being supported.
          */
         phb = PCI_HOST_BRIDGE(sphb);
-        pdev = pci_find_device(phb->bus,
-                               (addr >> 16) & 0xFF, (addr >> 8) & 0xFF);
-        if (!pdev || !object_dynamic_cast(OBJECT(pdev), "vfio-pci")) {
+        pci_for_each_device(phb->bus, (addr >> 16) & 0xFF,
+                            spapr_eeh_pci_find_device, &found);
+
+        if (!found) {
             return RTAS_OUT_PARAM_ERROR;
         }
 
-- 
2.31.1


