Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE3F36C5AC
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 13:59:06 +0200 (CEST)
Received: from localhost ([::1]:41740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbMMr-0001ZG-Gv
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 07:59:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mahesh@linux.ibm.com>)
 id 1lbMKv-0000zW-3g; Tue, 27 Apr 2021 07:57:05 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:16402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mahesh@linux.ibm.com>)
 id 1lbMKr-000858-D9; Tue, 27 Apr 2021 07:57:03 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13RBYhbO193646; Tue, 27 Apr 2021 07:56:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=ubxa2Wspk/PuLHB+xMQ2W9eiE8WEwfoRb5PH3B1tUDg=;
 b=rNPvNUNkaTYQtGevzAIWw298OsIOlLd/15nWSe/nNa4DTj8qvqHl++HnFPVUKijuI6qw
 1Pzn7xsqVQLNSFaKf0z4nu4bFrPoYUHcoFxagDY1oIiPCaqnwDD7fWYD+Avy2fTFzAu+
 SachYVoXXrshXeB3XTc+vUb0MzGUQ4iW1fpEnwPO3WOXZtQzybGUQ8uNTqIX3eLuRNl2
 cLVK/RNpzhy0RkKJJfCj4ubnFkG99Fu7dkOUQGteyasINDtcnFM1FImgV3BsQLiKOtJ3
 +vgqMP3dUJw7NE2q5V+WdEz0TDfdiGaWn/YHiJE7rQ70Oc673Z2xxvz0HTAyYRoG16fo fA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 386h81hq7p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Apr 2021 07:56:57 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13RBYo0d194009;
 Tue, 27 Apr 2021 07:56:57 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 386h81hq6m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Apr 2021 07:56:57 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13RBqAGd018155;
 Tue, 27 Apr 2021 11:56:55 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 384ay8ha6g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Apr 2021 11:56:54 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13RBuRFu32440830
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Apr 2021 11:56:27 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D31111C04A;
 Tue, 27 Apr 2021 11:56:51 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D0F5E11C054;
 Tue, 27 Apr 2021 11:56:50 +0000 (GMT)
Received: from [127.0.0.1] (unknown [9.199.62.190])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 27 Apr 2021 11:56:50 +0000 (GMT)
Subject: [PATCH] spapr: Modify ibm,get-config-addr-info2 to set DEVNUM in PE
 config address.
From: Mahesh Salgaonkar <mahesh@linux.ibm.com>
To: Qemu-devel <qemu-devel@nongnu.org>
Date: Tue, 27 Apr 2021 17:26:49 +0530
Message-ID: <161952458744.148285.11534763593153102355.stgit@jupiter>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Bz5VV9mGpfsprWqlqEtmWAZaDIg8UWrp
X-Proofpoint-GUID: OV-obHfSy_noI2skILG-F6OwRqWMDLxP
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-27_06:2021-04-27,
 2021-04-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 clxscore=1011 lowpriorityscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104270086
Received-SPF: pass client-ip=148.163.156.1; envelope-from=mahesh@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, HEXHASH_WORD=1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Oliver O'Halloran <oohall@gmail.com>,
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
commit 98ba956f6a389 fixed this flow. With that fixed, linux now gets the
PE config address first using the ibm,get-config-addr-info2 RTAS call, and
then uses the found address as argument to ibm,set-eeh-option RTAS call to
enable EEH on the PCI device. This works on PowerVM lpar but fails in qemu
KVM guests. This is because ibm,set-eeh-option RTAS call in qemu expects PE
config address bits 16:20 be populated with device number (DEVNUM).

The rtas call ibm,get-config-addr-info2 in qemu always returns the PE
config address in form of "00BB0001" (i.e.  <00><BUS><DEVFN><REG>) where
"BB" represents the bus number of PE's primary bus and with device number
information always set to zero. However until commit 98ba956f6a389 this
return value wasn't used to enable EEH on the PCI device.

Now in qemu guest with recent kernel the ibm,set-eeh-option RTAS call fails
with -3 return value indicating that there is no PCI device exist for the
specified pe config address. The rtas_ibm_set_eeh_option call uses
pci_find_device() to get the PC device that matches specific bus and devfn
extracted from PE config address passed as argument. Since the DEVFN part
of PE config always contains zero, pci_find_device() fails to find the
specific PCI device and hence fails to enable the EEH capability.

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

This patch fixes this issue by populating DEVNUM field (bits 16:20) of PE
config address with device number.

After this fix guest is able to find EEH capable devices and enable EEH
recovery on it.

[root@atest-guest ~]# dmesg | grep EEH
[    0.048139] EEH: pSeries platform initialized
[    0.405115] EEH: Capable adapter found: recovery enabled.
[root@atest-guest ~]#

Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
---
 hw/ppc/spapr_pci.c |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index feba18cb12..d6b0c380c8 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -538,8 +538,9 @@ static void rtas_ibm_get_config_addr_info2(PowerPCCPU *cpu,
     }
 
     /*
-     * We always have PE address of form "00BB0001". "BB"
-     * represents the bus number of PE's primary bus.
+     * Return PE address of form "00BBD001". "BB" represents the
+     * bus number of PE's primary bus and "D" represents the device number.
+     * Guest uses this PE address to enable EEH on this pci device.
      */
     option = rtas_ld(args, 3);
     switch (option) {
@@ -550,7 +551,8 @@ static void rtas_ibm_get_config_addr_info2(PowerPCCPU *cpu,
             goto param_error_exit;
         }
 
-        rtas_st(rets, 1, (pci_bus_num(pci_get_bus(pdev)) << 16) + 1);
+        rtas_st(rets, 1, (pci_bus_num(pci_get_bus(pdev)) << 16) |
+                         (PCI_DEVFN(PCI_SLOT(pdev->devfn), 0) << 8) | 1);
         break;
     case RTAS_GET_PE_MODE:
         rtas_st(rets, 1, RTAS_PE_MODE_SHARED);



