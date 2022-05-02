Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E40516EE8
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 13:31:46 +0200 (CEST)
Received: from localhost ([::1]:44446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlUHJ-00022h-H0
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 07:31:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1nlUDE-000599-Cg; Mon, 02 May 2022 07:27:32 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:61898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1nlUDC-0006rU-7E; Mon, 02 May 2022 07:27:32 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 242BEqiu021944;
 Mon, 2 May 2022 11:27:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=23G5hD+xAVuN5BAluG6A+dlVmcKRonXuS7H6yt3tvPk=;
 b=aVS+awh+qc57mHCl7kFLdfodhowSOxvRrp51sAYYV6vcmSL3CKQvj/qY8svhtlKgisSM
 Pzsb8+cSTvvBiaJWobmhz4RB9F0RtEKbnVR5Z7WXJw70KDU91CNC58I8zs1KBOo4UFtm
 aotIzij0nhmWrL8B5ihr2clATnNtDQSPWQBokj9yiUr9SWk3GdCGN0xBZr6/0oE9n3aa
 t2zXW/vqqu3rfqKZ8fNVHLD1PqjsR5IANtx+I5yL5dKSKj+HY1pi2BAcJBFCqaaB6c8q
 DAEHci8cCsaUy4B/gfqVbEPy43uMDrY1MdwvaW1jdb3L4EnXxQHVyL8wICoRImtGYDo2 LA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fte8r06nd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 May 2022 11:27:28 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 242BJV8W004376;
 Mon, 2 May 2022 11:27:27 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fte8r06my-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 May 2022 11:27:27 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 242BKEtu029997;
 Mon, 2 May 2022 11:27:25 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 3frvr8t4t1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 May 2022 11:27:25 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 242BRMOe52101378
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 May 2022 11:27:22 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C4ADAE04D;
 Mon,  2 May 2022 11:27:22 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B9A0FAE045;
 Mon,  2 May 2022 11:27:21 +0000 (GMT)
Received: from [9.171.15.56] (unknown [9.171.15.56])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  2 May 2022 11:27:21 +0000 (GMT)
Message-ID: <eb2fde35-7b9d-a8c8-3212-ae92b2b3e754@linux.ibm.com>
Date: Mon, 2 May 2022 13:30:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 7/9] s390x/pci: enable adapter event notification for
 interpreted devices
Content-Language: en-US
To: Niklas Schnelle <schnelle@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org,
 alex.williamson@redhat.com
References: <20220404181726.60291-1-mjrosato@linux.ibm.com>
 <20220404181726.60291-8-mjrosato@linux.ibm.com>
 <31b5f911-0e1f-ba3c-94f2-1947d5b16057@linux.ibm.com>
 <9a171204-6d71-ee1d-d8bd-cd4eac91c3d5@linux.ibm.com>
 <d14625f4-d648-05d9-38aa-a5ad7e0c9cf5@linux.ibm.com>
 <2df134498bf60e4878bdb362a28c56ec32d902f8.camel@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <2df134498bf60e4878bdb362a28c56ec32d902f8.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QJRuyQT7Sb6HqkmzrUbdf4ILHwKznUcH
X-Proofpoint-GUID: 9QQG1pdHwGuzTdxhLl7DU5zyUG6mvzdk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-02_03,2022-05-02_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2205020086
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, kvm@vger.kernel.org, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, farman@linux.ibm.com, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, mst@redhat.com, pbonzini@redhat.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 5/2/22 11:19, Niklas Schnelle wrote:
> On Mon, 2022-05-02 at 09:48 +0200, Pierre Morel wrote:
>>
>> On 4/22/22 14:10, Matthew Rosato wrote:
>>> On 4/22/22 5:39 AM, Pierre Morel wrote:
>>>>
>>>> On 4/4/22 20:17, Matthew Rosato wrote:
>>>>> Use the associated kvm ioctl operation to enable adapter event
>>>>> notification
>>>>> and forwarding for devices when requested.  This feature will be set up
>>>>> with or without firmware assist based upon the 'forwarding_assist'
>>>>> setting.
>>>>>
>>>>> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
>>>>> ---
>>>>>    hw/s390x/s390-pci-bus.c         | 20 ++++++++++++++---
>>>>>    hw/s390x/s390-pci-inst.c        | 40 +++++++++++++++++++++++++++++++--
>>>>>    hw/s390x/s390-pci-kvm.c         | 30 +++++++++++++++++++++++++
>>>>>    include/hw/s390x/s390-pci-bus.h |  1 +
>>>>>    include/hw/s390x/s390-pci-kvm.h | 14 ++++++++++++
>>>>>    5 files changed, 100 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
>>>>> index 9c02d31250..47918d2ce9 100644
>>>>> --- a/hw/s390x/s390-pci-bus.c
>>>>> +++ b/hw/s390x/s390-pci-bus.c
>>>>> @@ -190,7 +190,10 @@ void s390_pci_sclp_deconfigure(SCCB *sccb)
>>>>>            rc = SCLP_RC_NO_ACTION_REQUIRED;
>>>>>            break;
>>>>>        default:
>>>>> -        if (pbdev->summary_ind) {
>>>>> +        if (pbdev->interp && (pbdev->fh & FH_MASK_ENABLE)) {
>>>>> +            /* Interpreted devices were using interrupt forwarding */
>>>>> +            s390_pci_kvm_aif_disable(pbdev);
>>>>
>>>> Same remark as for the kernel part.
>>>> The VFIO device is already initialized and the action is on this
>>>> device, Shouldn't we use the VFIO device interface instead of the KVM
>>>> interface?
>>>>
>>>
>>> I don't necessarily disagree, but in v3 of the kernel series I was told
>>> not to use VFIO ioctls to accomplish tasks that are unique to KVM (e.g.
>>> AEN interpretation) and to instead use a KVM ioctl.
>>>
>>> VFIO_DEVICE_SET_IRQS won't work as-is for reasons described in the
>>> kernel series (e.g. we don't see any of the config space notifiers
>>> because of instruction interpretation) -- as far as I can figure we
>>> could add our own s390 code to QEMU to issue VFIO_DEVICE_SET_IRQS
>>> directly for an interpreted device, but I think would also need
>>> s390-specific changes to VFIO_DEVICE_SET_IRQS accommodate this (e.g.
>>> maybe something like a VFIO_IRQ_SET_DATA_S390AEN where we can then
>>> specify the aen information in vfio_irq_set.data -- or something else I
>>
>> Hi,
>>
>> yes this in VFIO_DEVICE_SET_IRQS is what I think should be done.
>>
>>> haven't though of yet) -- I can try to look at this some more and see if
>>> I get a good idea.
>>
>>
>> I understood that the demand was concerning the IOMMU but I may be wrong.
>> For my opinion, the handling of AEN is not specific to KVM but specific
>> to the device, for example the code should be the same if Z ever decide
>> to use XEN or another hypervizor, except for the GISA part but this part
>> is already implemented in KVM in a way it can be used from a device like
>> in VFIO AP.
>>
>> @Alex, what do you think?
>>
>> Regards,
>> Pierre
>>
> 
> As I understand it the question isn't if it is specific to KVM but
> rather if it is specific to virtualization. As vfio-pci is also used
> for non virtualization purposes such as with DPDK/SPDK or a fully
> emulating QEMU, it should only be in VFIO if it is relevant for these
> kinds of user-space PCI accesses too. I'm not an AEN expert but as I
> understand it, this does forwarding interrupts into a SIE context which
> only makes sense for virtualization not for general user-space PCI.
> 

Being in VFIO kernel part does not mean that this part should be called 
from any user of VFIO in userland.
That is a reason why I did propose an extension and not using the 
current implementation of VFIO_DEVICE_SET_IRQS as is.

The reason behind is that the AEN hardware handling is device specific: 
we need the Function Handle to program AEN.

If the API is through KVM which is device agnostic the implementation in 
KVM has to search through the system to find the device being handled to 
apply AEN on it.

This not the logical way for me and it is a potential source of problems 
for future extensions.

Regards,
Pierre

-- 
Pierre Morel
IBM Lab Boeblingen

