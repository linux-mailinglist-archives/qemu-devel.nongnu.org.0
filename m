Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBD22DD3FA
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 16:20:05 +0100 (CET)
Received: from localhost ([::1]:49656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpv4W-00044f-Vo
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 10:20:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kpuyg-0008GW-NC; Thu, 17 Dec 2020 10:14:03 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:49542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kpuye-0003th-Aw; Thu, 17 Dec 2020 10:14:02 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BHF2tBm119052; Thu, 17 Dec 2020 10:13:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=06Wh7hAT7363mpLKPm0pNRy7w9VPGrwsyPhhy0TSNzE=;
 b=DOGEbc0mgKNWDSZiW7H5ZJIsMuu6NWFlixFScKOc+6VpclXoxUE7odZNRX+CdMsnWe/h
 yuJMZTpk62Kbxkz6qQbxYq49z+6vKAAqCU3q2+IZlYurgJ8i5KaumEfRFqZ9ZyVw0jtj
 6pBGZ77UEZWyTckH34qz7cFcSCAYPbtubQpleNfjcG69YkPPVH4xdcot079c1cBAb4ph
 OD5LRew75SdhFL5KZsp6iIKm/gOQmPSWNwG3NGbVWcwfwwu5BMRkRiem9WS8/KahfrOX
 AHmOPyZYlECgdMprJnLBW/YdmuJb1CTRLEpyo/ALxLvBzeLAyvj4hq8HNUNIVWcB/S7z hQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35g99495jr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Dec 2020 10:13:57 -0500
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BHF3MGE121254;
 Thu, 17 Dec 2020 10:13:57 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35g99495hw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Dec 2020 10:13:56 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BHF9W1q024021;
 Thu, 17 Dec 2020 15:13:55 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01wdc.us.ibm.com with ESMTP id 35cng97n01-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Dec 2020 15:13:55 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BHFCder20709786
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Dec 2020 15:12:39 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B3C9813604F;
 Thu, 17 Dec 2020 15:12:39 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3CD28136053;
 Thu, 17 Dec 2020 15:12:38 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.211.143.229])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 17 Dec 2020 15:12:38 +0000 (GMT)
Subject: Re: [RFC 2/8] s390x/pci: MSI-X isn't strictly required for passthrough
To: Cornelia Huck <cohuck@redhat.com>
References: <1607546066-2240-1-git-send-email-mjrosato@linux.ibm.com>
 <1607546066-2240-3-git-send-email-mjrosato@linux.ibm.com>
 <20201210112806.61b0c854.cohuck@redhat.com>
 <9fc712d1-2350-f16f-7073-87162def13eb@linux.ibm.com>
 <20201217140817.30bae4e4.cohuck@redhat.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
Message-ID: <e4f0ddb6-b273-6bde-7463-265ed145cf1e@linux.ibm.com>
Date: Thu, 17 Dec 2020 10:12:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201217140817.30bae4e4.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-17_09:2020-12-15,
 2020-12-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 mlxscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012170103
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: thuth@redhat.com, pmorel@linux.ibm.com, david@redhat.com,
 schnelle@linux.ibm.com, richard.henderson@linaro.org, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 alex.williamson@redhat.com, mst@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/17/20 8:08 AM, Cornelia Huck wrote:
> On Thu, 10 Dec 2020 10:13:29 -0500
> Matthew Rosato <mjrosato@linux.ibm.com> wrote:
> 
>> On 12/10/20 5:28 AM, Cornelia Huck wrote:
>>> On Wed,  9 Dec 2020 15:34:20 -0500
>>> Matthew Rosato <mjrosato@linux.ibm.com> wrote:
>>>    
>>>> s390 PCI currently disallows PCI devices without the MSI-X capability.
>>>> However, this fence doesn't make sense for passthrough devices.  Move
>>>> the check to only fence emulated devices (e.g., virtio).
>>>>
>>>> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
>>>> Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
>>>> ---
>>>>    hw/s390x/s390-pci-bus.c | 14 ++++++++------
>>>>    1 file changed, 8 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
>>>> index 05f7460..afad048 100644
>>>> --- a/hw/s390x/s390-pci-bus.c
>>>> +++ b/hw/s390x/s390-pci-bus.c
>>>> @@ -1028,12 +1028,12 @@ static void s390_pcihost_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>>>>                s390_pci_get_clp_info(pbdev);
>>>>            } else {
>>>>                pbdev->fh |= FH_SHM_EMUL;
>>>> -        }
>>>>    
>>>> -        if (s390_pci_msix_init(pbdev)) {
>>>> -            error_setg(errp, "MSI-X support is mandatory "
>>>> -                       "in the S390 architecture");
>>>> -            return;
>>>> +            if (s390_pci_msix_init(pbdev)) {
>>>> +                error_setg(errp, "MSI-X support is mandatory "
>>>> +                           "in the S390 architecture");
>>>> +                return;
>>>> +            }
>>>>            }
>>>>    
>>>>            if (dev->hotplugged) {
>>>> @@ -1073,7 +1073,9 @@ static void s390_pcihost_unplug(HotplugHandler *hotplug_dev, DeviceState *dev,
>>>>            devfn = pci_dev->devfn;
>>>>            qdev_unrealize(dev);
>>>>    
>>>> -        s390_pci_msix_free(pbdev);
>>>> +        if (pbdev->fh & FH_SHM_EMUL) {
>>>> +            s390_pci_msix_free(pbdev);
>>>> +        }
>>>>            s390_pci_iommu_free(s, bus, devfn);
>>>>            pbdev->pdev = NULL;
>>>>            pbdev->state = ZPCI_FS_RESERVED;
>>>
>>> Remind me: Wasn't it only msi that was strictly required (i.e., not msi-x?)
>>>
>>> Can we generally relax this requirement, possibly with some changes in
>>> the adapter interrupt mapping? I might misremember, though.
>>>    
>>
>> Yes, but even so our current emulation support only sets up for MSI-X,
>> it does not have an msi_init() equivalent.  I do believe that this
>> requirement can be relaxed at some point for the emulation support as
>> well, but the focus on this set was to at least stop fencing passthrough
>> for no reason.
> 
> Looking back to when this was introduced, I see that 857cc71985dc
> ("s390x/pci: merge msix init functions") actually makes this mandatory
> and states that nothing changes for passthrough. Has anything changed
> regarding msi-x in the architecture in the meantime?
> 

I don't believe anything has changed from the architecture or kernel 
support perspective (Maybe I'm wrong about the latter; Niklas feel free 
to correct me in that case) -- Otherwise, as far as I can, tell the 
statement from 857cc71985dc was just incorrect and the restriction was 
placed unnecessarily for passthrough.  vfio-pci sets up for both, and 
our base s390 kernel support allows for both (and I can drive ISM 
traffic and see interrupts being routed to the guest with these patches 
applied of course); it's just our qemu emulation support that only sets 
up for MSI-X.

