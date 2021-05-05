Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2798373DF1
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 16:50:53 +0200 (CEST)
Received: from localhost ([::1]:48796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leIrU-0002Ql-NI
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 10:50:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mahesh@linux.ibm.com>)
 id 1leIpM-0001hT-Dd; Wed, 05 May 2021 10:48:40 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:3126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mahesh@linux.ibm.com>)
 id 1leIpI-0001ub-Hz; Wed, 05 May 2021 10:48:40 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 145Ei4q8015733; Wed, 5 May 2021 10:48:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=adWVY5ZbxGNLRumvOhxljzkpBK6jH4M7gsg209udRYg=;
 b=pakOx/Di9dknnoU2Dyy0S/6z4tfV4Fu2nhjXs5UDkn64RI4NIrJUEwHCyb5SHbjJrEZ+
 YC6rjyVGAngVvJXBs33370JBxbcUcAfyyCxy/xV2qwodZrk3LntkVU+9JY90tyoNTcW8
 J1Yze409Ahaz+9gi9HkHphfQ+fc7OCrolpwnA710KBzBT4Lyy4b7GBKwuDn/yF5FDqi1
 lMQNG5CzjrkZ/iIQaBerG61M2cMc2+vJwXVQn54/xty3DzGB2x/emimnQn0dnUcH2wr/
 LlQzI715HVkUXteYY5xwCECpqHhM6dNkwS+sJQGSiqX0z+Fi6WmsnBmA/2wMCeXrHuEx LA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38bum4uu29-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 May 2021 10:48:34 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 145EiJlt016894;
 Wed, 5 May 2021 10:48:34 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38bum4uu1h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 May 2021 10:48:34 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 145Em14e021742;
 Wed, 5 May 2021 14:48:32 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 38bedxrbxn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 May 2021 14:48:32 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 145EmUi731195494
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 May 2021 14:48:30 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 72B40A405B;
 Wed,  5 May 2021 14:48:30 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7BA78A4054;
 Wed,  5 May 2021 14:48:29 +0000 (GMT)
Received: from [127.0.0.1] (unknown [9.85.84.185])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  5 May 2021 14:48:29 +0000 (GMT)
Subject: [PATCH updated v2] spapr: Fix EEH capability issue on KVM guest for
 PCI passthru
From: Mahesh Salgaonkar <mahesh@linux.ibm.com>
To: Qemu-devel <qemu-devel@nongnu.org>
Date: Wed, 05 May 2021 20:18:27 +0530
Message-ID: <162022601665.118720.1424074431457537864.stgit@jupiter>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Oz9r1uU8a8dPr6KqLymC_Q4xCQSrzaGv
X-Proofpoint-GUID: p3yjc1ap3mow2IplYbhUNuz9hrUKgRiB
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-05_09:2021-05-05,
 2021-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 phishscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105050106
Received-SPF: pass client-ip=148.163.158.5; envelope-from=mahesh@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Oliver O'Halloran <oohall@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Qemu-ppc <qemu-ppc@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
This succeeds when there is a pass-through device (vfio-pci) present in
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

Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
---
Change in v2:
- Fix ibm,set-eeh-option instead of returning per-device PE config address.
- Changed patch subject line.
---
 hw/ppc/spapr_pci_vfio.c |   27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/hw/ppc/spapr_pci_vfio.c b/hw/ppc/spapr_pci_vfio.c
index e0547b1740..b30020da6a 100644
--- a/hw/ppc/spapr_pci_vfio.c
+++ b/hw/ppc/spapr_pci_vfio.c
@@ -47,6 +47,16 @@ void spapr_phb_vfio_reset(DeviceState *qdev)
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
@@ -59,17 +69,20 @@ int spapr_phb_vfio_eeh_set_option(SpaprPhbState *sphb,
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
+         * per PCI device. We just need to check the validity of the PCI
+         * pass-through devices (vfio-pci) under this sphb bus.
+         * We have already validated that all the devices under this sphb
+         * are from same iommu group (within same PE) before comming here.
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
 



