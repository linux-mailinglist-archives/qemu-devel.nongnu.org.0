Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27684461A2A
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 15:43:48 +0100 (CET)
Received: from localhost ([::1]:34546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrhsg-0005uB-SH
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 09:43:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1mrhq2-0003DB-IR; Mon, 29 Nov 2021 09:41:02 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48640
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1mrhpx-0003fq-1T; Mon, 29 Nov 2021 09:41:01 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ATEHZ79004447; 
 Mon, 29 Nov 2021 14:40:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=JNKjmjoscPIxPqDfZkYZ35glXUXhIvlSjV1/T9iABNY=;
 b=QpNxSoZu3QJMVcanD2a6/ILo+hte8ZbIqZfc3+8ewr4WZcdUndT/hWn2IqdRte60uKlc
 pWbu80CMVGXppK6omcyDawvXd6JN+nWPuLQqowEYA5wfPjudjfnyUAC+L0vXm2aZjgBx
 bkZ3NTMblhq9XwRF0gX8M22+lRLIuaPcZ+BcixAC9DwxIV8pRCNZJ+YnvVR5ZRPylwmn
 0O5FYrABTbxC9X4dXM8vb8y7kSkvL/MgDGZ8BxJFh5gFqF3PIjG/Pd2VR18oa0CADVZb
 VzBApvJmJAxk9em//SQBeNIzVR9v2BpZyAq7SaYcxUB+DQ87YrpMtrTdz+gq8i+RPFjX Kw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cn0gf0k0n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 14:40:44 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1ATEHaOM004490;
 Mon, 29 Nov 2021 14:40:44 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cn0gf0k01-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 14:40:44 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1ATESWYO029137;
 Mon, 29 Nov 2021 14:40:42 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 3ckca9n0ee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 14:40:42 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1ATEed9229688146
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Nov 2021 14:40:40 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC748AE057;
 Mon, 29 Nov 2021 14:40:39 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B324AE051;
 Mon, 29 Nov 2021 14:40:39 +0000 (GMT)
Received: from [9.145.176.47] (unknown [9.145.176.47])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 29 Nov 2021 14:40:39 +0000 (GMT)
Message-ID: <3756d9ac-f455-23ca-eb5b-083320627b6d@linux.ibm.com>
Date: Mon, 29 Nov 2021 15:40:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/3] ppc/pnv: Tune the POWER9 PCIe Host bridge model
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, mst@redhat.com,
 marcel.apfelbaum@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Leandro Lupori <leandro.lupori@eldorado.org.br>,
 alfredo.junior@eldorado.org.br
References: <20211116170133.724751-1-fbarrat@linux.ibm.com>
 <20211116170133.724751-2-fbarrat@linux.ibm.com>
 <427ef2ee-6871-0d27-f485-90ad142f6266@kaod.org>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <427ef2ee-6871-0d27-f485-90ad142f6266@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: icZX4vysCKgYroWtAGoIEN281W2_k-fx
X-Proofpoint-GUID: sqNDNVG3TWvpQzLjMSde0kfcQhRW9-jX
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-29_08,2021-11-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1011
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111290073
Received-SPF: pass client-ip=148.163.158.5; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.317,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 26/11/2021 10:09, Cédric Le Goater wrote:
> On 11/16/21 18:01, Frederic Barrat wrote:
>> The PHB v4 found on POWER9 doesn't request any LSI, so let's clear the
>> Interrupt Pin register in the config space so that the model matches
>> the hardware.
>>
>> If we don't, then we inherit from the default pcie root bridge, which
>> requests a LSI. And because we don't map it correctly in the device
>> tree, all PHBs allocate the same bogus hw interrupt. We end up with
>> inconsistent interrupt controller (xive) data. The problem goes away
>> if we don't allocate the LSI in the first place.
>>
>> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
>> ---
>>   hw/pci-host/pnv_phb4.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
>> index 5c375a9f28..1659d55b4f 100644
>> --- a/hw/pci-host/pnv_phb4.c
>> +++ b/hw/pci-host/pnv_phb4.c
>> @@ -1234,10 +1234,13 @@ static void pnv_phb4_reset(DeviceState *dev)
>>       PCIDevice *root_dev = PCI_DEVICE(&phb->root);
>>       /*
>> -     * Configure PCI device id at reset using a property.
>> +     * Configure the PCI device at reset:
>> +     *   - set the Vendor and Device ID to for the root bridge
>> +     *   - no LSI
>>        */
>>       pci_config_set_vendor_id(root_dev->config, PCI_VENDOR_ID_IBM);
>>       pci_config_set_device_id(root_dev->config, phb->device_id);
>> +    pci_config_set_interrupt_pin(root_dev->config, 0);
>>   }
>>   static const char *pnv_phb4_root_bus_path(PCIHostState *host_bridge,
>>
> 
> FYI, I am seeing an issue with FreeBSD when booting from iso :
> 
>    
> https://download.freebsd.org/ftp/snapshots/powerpc/powerpc64/ISO-IMAGES/14.0/FreeBSD-14.0-CURRENT-powerpc-powerpc64-20211028-4827bf76bce-250301-disc1.iso.xz 
> 
> 


I see what's going on... Since the phb4 model borrows most of its code 
from the pcie_root bridge, there are several instances of code such as:

     if (msix_enabled(dev)) {
         do something;
     } else if (msi_enabled(dev)) {
         do something else;
     } else {
         yet something else which assumes a LSI;
     }

With this series, I removed the LSI from the phb4 root port to match the 
hardware and fixed one such code pattern in patch 3. But there are 
others, and we hit one of those when installing from the free bsd iso.

So this is going to need more work.

   Fred



> Thanks,
> 
> C.
> 
> SIGTERM received, booting...
> KDB: debugger backends: ddb
> KDB: current backend: ddb
> ---<<BOOT>>---
> Copyright (c) 1992-2021 The FreeBSD Project.
> Copyright (c) 1979, 1980, 1983, 1986, 1988, 1989, 1991, 1992, 1993, 1994
>      The Regents of the University of California. All rights reserved.
> FreeBSD is a registered trademark of The FreeBSD Foundation.
> FreeBSD 14.0-CURRENT #0 main-n250301-4827bf76bce: Thu Oct 28 06:53:58 
> UTC 2021
>      
> root@releng1.nyi.freebsd.org:/usr/obj/usr/src/powerpc.powerpc64/sys/GENERIC64 
> powerpc
> FreeBSD clang version 12.0.1 (git@github.com:llvm/llvm-project.git 
> llvmorg-12.0.1-0-gfed41342a82f)
> WARNING: WITNESS option enabled, expect reduced performance.
> VT: init without driver.
> ofw_initrd: initrd loaded at 0x28000000-0x28c7928c
> cpu0: IBM POWER9 revision 2.0, 1000.00 MHz
> cpu0: Features 
> dc007182<PPC32,PPC64,ALTIVEC,FPU,MMU,SMT,ISNOOP,ARCH205,ARCH206,VSX,TRUELE>
> cpu0: Features2 
> bee00000<ARCH207,DSCR,ISEL,TAR,VCRYPTO,ARCH300,IEEE128,DARN>
> real memory  = 1014484992 (967 MB)
> avail memory = 117903360 (112 MB)
> random: registering fast source PowerISA DARN random number generator
> random: fast provider: "PowerISA DARN random number generator"
> arc4random: WARNING: initial seeding bypassed the cryptographic random 
> device because it was not yet seeded and the knob 
> 'bypass_before_seeding' was enabled.
> random: entropy device external interface
> kbd0 at kbdmux0
> ofwbus0: <Open Firmware Device Tree> on nexus0
> opal0: <OPAL Abstraction Firmware> irq 
> 1048560,1048561,1048562,1048563,1048564,1048565,1048566,1048567,1048568,1048569,1048570,1048571,1048572,1048573 
> on ofwbus0
> opal0: registered as a time-of-day clock, resolution 0.002000s
> simplebus0: <Flattened device tree simple bus> mem 
> 0x6030000000000-0x60300ffffffff on ofwbus0
> pcib0: <OPAL Host-PCI bridge> mem 
> 0x600c3c0000000-0x600c3c0000fff,0x600c300000000-0x600c30fffffff on ofwbus0
> pci0: <OFW PCI bus> numa-domain 0 on pcib0
> qemu-system-ppc64: ../hw/pci/pci.c:1487: pci_irq_handler: Assertion `0 
> <= irq_num && irq_num < PCI_NUM_PINS' failed.
> 
> 
> 

