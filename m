Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED3136E78A
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 11:05:04 +0200 (CEST)
Received: from localhost ([::1]:59448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc2bX-0004ct-6v
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 05:05:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mahesh@linux.ibm.com>)
 id 1lc2ZG-0003oC-M9; Thu, 29 Apr 2021 05:02:42 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:36634
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mahesh@linux.ibm.com>)
 id 1lc2ZC-0002R1-Er; Thu, 29 Apr 2021 05:02:42 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13T8XnAh134799; Thu, 29 Apr 2021 05:02:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=HbeBw8NFcwDuHQSav9Ng1VgO8/uLSVOhl3vIJW3E6Lo=;
 b=WE051QZj2oJmnb88RTio0S2VNNth5PxXFJ76PIMIGYxuTUV/8cRU4knKFT1+0Ahzn9LJ
 vGe0Z4hw7OvmeDHJ/9Jn8yv22NcXNS2Q5BZFbRrIbhbr2WQeKiUAeSaBH6gGHVjhVUqF
 KDR2LLf7sPGZhuUQYdiwkR4oWXrYLRvQQ++9tSZhopNZg9IYNt2Ix5qSm9vH7wxuLhgS
 NP+tfsSDr5+W+djxxT4g18DqkiZ98ZW2iPeT9nlcTv+HUqHLQmrZbEFLJ2ISHX9FTSBf
 mtymsGpZzDTpQvHV/nRxJ5yLUhKZGlltFFMghRHoXpfAQ3oOqX4OW88hToVKHUGADlU2 FA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 387s5e97fn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Apr 2021 05:02:33 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13T8XtON135240;
 Thu, 29 Apr 2021 05:02:32 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 387s5e97eu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Apr 2021 05:02:32 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13T92P3k027351;
 Thu, 29 Apr 2021 09:02:30 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 384ay81a82-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Apr 2021 09:02:30 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13T9228d34472354
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Apr 2021 09:02:02 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3DB25A405C;
 Thu, 29 Apr 2021 09:02:27 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2BC65A405F;
 Thu, 29 Apr 2021 09:02:26 +0000 (GMT)
Received: from in.ibm.com (unknown [9.199.50.119])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 29 Apr 2021 09:02:25 +0000 (GMT)
Date: Thu, 29 Apr 2021 14:32:23 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH] spapr: Modify ibm, get-config-addr-info2 to set DEVNUM in
 PE config address.
Message-ID: <20210429090223.ywdscwrhfxam66j6@in.ibm.com>
References: <161952458744.148285.11534763593153102355.stgit@jupiter>
 <CAOSf1CGGgxX4mGhjjsVGYA391XrABEOTh2xmiafW6V7cScyG4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOSf1CGGgxX4mGhjjsVGYA391XrABEOTh2xmiafW6V7cScyG4g@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: omN65mUXegLzXQjY2yzRVtwuP5LLxAh9
X-Proofpoint-GUID: q6MIjC7fEObntBqN-V0l2clNJ63rBJ1M
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-29_05:2021-04-28,
 2021-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104290061
Received-SPF: pass client-ip=148.163.158.5; envelope-from=mahesh@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Reply-To: mahesh@linux.ibm.com
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Qemu-ppc <qemu-ppc@nongnu.org>, Qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021-04-28 22:33:45 Wed, Oliver O'Halloran wrote:
> On Tue, Apr 27, 2021 at 9:56 PM Mahesh Salgaonkar <mahesh@linux.ibm.com> wrote:
> >
> > With upstream kernel, especially after commit 98ba956f6a389
> > ("powerpc/pseries/eeh: Rework device EEH PE determination") we see that KVM
> > guest isn't able to enable EEH option for PCI pass-through devices anymore.
> 
> How are you passing the devices through to the guest?

I am using libvirt with below xml section to add pass-through:

    <hostdev mode='subsystem' type='pci' managed='yes'>
      <driver name='vfio'/>
      <source>
        <address domain='0x0033' bus='0x01' slot='0x00' function='0x0'/>
      </source>
      <address type='pci' domain='0x0000' bus='0x01' slot='0x01' function='0x0' multifunction='on'/>
    </hostdev>
    <hostdev mode='subsystem' type='pci' managed='yes'>
      <driver name='vfio'/>
      <source>
        <address domain='0x0033' bus='0x01' slot='0x00' function='0x1'/>
      </source>
      <address type='pci' domain='0x0000' bus='0x01' slot='0x01' function='0x1' multifunction='on'/>
    </hostdev>

Looks like libvirt does not allow pass through device in slot zero, and
throws following error.

error: XML error: Invalid PCI address 0000:01:00.0. slot must be >= 1
Failed. Try again? [y,n,i,f,?]:

> 
> > [root@atest-guest ~]# dmesg | grep EEH
> > [    0.032337] EEH: pSeries platform initialized
> > [    0.298207] EEH: No capable adapters found: recovery disabled.
> > [root@atest-guest ~]#
> >
> > So far the linux kernel was assuming pe_config_addr equal to device's
> > config_addr and using it to enable EEH on the PE through ibm,set-eeh-option
> > RTAS call. Which wasn't the correct way as per PAPR. The linux kernel
> > commit 98ba956f6a389 fixed this flow. With that fixed, linux now gets the
> > PE config address first using the ibm,get-config-addr-info2 RTAS call, and
> > then uses the found address as argument to ibm,set-eeh-option RTAS call to
> > enable EEH on the PCI device.
> 
> That's not really correct. EEH being enabled or disabled is a per-PE
> setting rather than a per-device setting. The fact there's not a 1-1
> correspondence between devices and PEs is a large part of why the
> get-config-addr-info2 RTAS call exists in the first place.
> Unfortunately, the initial implementation of EEH support in linux
> conflated the two because in the past there was typically a single
> device within a PE. However, that assumption was never really correct
> and it has long outlived its usefulness.
> 
> > This works on PowerVM lpar but fails in qemu
> > KVM guests. This is because ibm,set-eeh-option RTAS call in qemu expects PE
> > config address bits 16:20 be populated with device number (DEVNUM).
> >
> > The rtas call ibm,get-config-addr-info2 in qemu always returns the PE
> > config address in form of "00BB0001" (i.e.  <00><BUS><DEVFN><REG>) where
> > "BB" represents the bus number of PE's primary bus and with device number
> > information always set to zero. However until commit 98ba956f6a389 this
> > return value wasn't used to enable EEH on the PCI device.
> >
> > Now in qemu guest with recent kernel the ibm,set-eeh-option RTAS call fails
> > with -3 return value indicating that there is no PCI device exist for the
> > specified pe config address. The rtas_ibm_set_eeh_option call uses
> > pci_find_device() to get the PC device that matches specific bus and devfn
> > extracted from PE config address passed as argument. Since the DEVFN part
> > of PE config always contains zero, pci_find_device() fails to find the
> > specific PCI device and hence fails to enable the EEH capability.
> >
> > hw/ppc/spapr_pci_vfio.c: spapr_phb_vfio_eeh_set_option()
> >    case RTAS_EEH_ENABLE: {
> >         PCIHostState *phb;
> >         PCIDevice *pdev;
> >
> >         /*
> >          * The EEH functionality is enabled on basis of PCI device,
> >          * instead of PE. We need check the validity of the PCI
> >          * device address.
> >          */
> >         phb = PCI_HOST_BRIDGE(sphb);
> >         pdev = pci_find_device(phb->bus,
> >                                (addr >> 16) & 0xFF, (addr >> 8) & 0xFF);
> >         if (!pdev || !object_dynamic_cast(OBJECT(pdev), "vfio-pci")) {
> >             return RTAS_OUT_PARAM_ERROR;
> >         }
> >
> > This patch fixes this issue by populating DEVNUM field (bits 16:20) of PE
> > config address with device number.
> 
> I don't think this is a good idea and I'm fairly sure you're
> introducing some subtle breakage here. As an example, say that on the
> host side you have two devices on the same bus:
> 
> 0000:00:00.0 - card 1
> 0000:00:01.0 - card 2
> 
> On PowerNV (i.e. the hypervisor) these would be placed into the same
> hardware PE since they're on the same bus. Now, if I take both devices
> and pass them through to the guest on the same PHB and bus (use
> 0005:ff) we'll have:
> 
> 0005:ff:00.0 - card 1
> 0005:ff:01.0 - card 2

It looks like libvirt does not support pass through device in slot zero.
Hence these appears as below in guest:

 0005:ff:01.0 - card 1
 0005:ff:02.0 - card 2

And with get-config-addr-info2 returning 00BB0001, ibm,set-eeh-option
RTAS call tries to check if device is present on the bus of spapr_phb at
bus->devices[devfn] where devfn is 0. And since qemu does not support
pass through device on slot zero bus->devices[0] is always NULL. And
hence it fails to enable EEH.

> 
> With this patch applied get-config-addr-info2 returns 00BBD001, so the
> PE we get for each device will be:
> 
> card 1 - 00ff0001
> card 2 - 00ff1001
> 
> Which implies the two are in different PEs. As a result, if the guest
> requests a reset of card 1's PE then the guest will see an unexpected
> reset of card 2 as well. From the hypervisor's point of view the two
> are in the same PE so this is a legitimate thing to do, but due to
> this patch the guest doesn't know that.

Agree. I realize my fix is not correctly handling this. The current code
under ibm,set-eeh-option is checking for individual PCI device presence.
Better fix should be to check if there is any PCI device (vfio-pci)
present under specified bus and enable the EEH if found. And no change
in return value of get-config-addr-info2. What do you say ?

-- 
Mahesh J Salgaonkar

