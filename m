Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB0B2FD95E
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 20:22:16 +0100 (CET)
Received: from localhost ([::1]:51594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2J3W-00059y-SJ
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 14:22:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1l2J0O-0004R1-Af; Wed, 20 Jan 2021 14:19:00 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:4578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1l2J0L-00007G-Ls; Wed, 20 Jan 2021 14:19:00 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10KJ0oSb079916; Wed, 20 Jan 2021 14:18:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ftR+E2pUnaXWLnTcAKsbomaW38tGCWTPWMP/JbnDO+M=;
 b=C8O433R8mD/Y6gYxfFZMzhExXTubXvBhf094s5Gt6tBFhNCxBlTdN0gK1GhDQwpzwRz4
 TbMxQ/eY+3ytx8Iv3OSxdnUrtcyh45uhcgH+Rs6T+BEiNGf+VJ6sbEpnyqMgvF53Ngfh
 OQmYds3JvE6etPsNorxpXVr5yB1DnajFNSZbC3mH6oqEE7HtO7jHQFVY74QlknQ4wd8s
 tkZIdDkbI0/F2gPdpkt6rhfQyWFqZm9StEDvdAaKQXdYXI9ygeP01Z3UGZdo/fmk0ggM
 2gFSW6XvIDfhsEtp2u6ET3Y/WjpEELYgIXVbA3MWfQvTtHXC+Et1E6wR9xbeTE/DSyAM sw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 366srk9d69-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 14:18:55 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10KJ0ut6080335;
 Wed, 20 Jan 2021 14:18:55 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 366srk9d5e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 14:18:54 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10KJCqrM003168;
 Wed, 20 Jan 2021 19:18:53 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3668p0rxn7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 19:18:52 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10KJInEB36176146
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 19:18:50 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA2A44C040;
 Wed, 20 Jan 2021 19:18:49 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 50C1D4C044;
 Wed, 20 Jan 2021 19:18:49 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.39.155])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 20 Jan 2021 19:18:49 +0000 (GMT)
Subject: Re: [PATCH 0/8] s390x/pci: Fixing s390 vfio-pci ISM support
To: Matthew Rosato <mjrosato@linux.ibm.com>, cohuck@redhat.com,
 thuth@redhat.com
References: <1611089059-6468-1-git-send-email-mjrosato@linux.ibm.com>
 <511aebd3-fc4f-d7d3-32c2-27720fb38fe8@linux.ibm.com>
 <15dbd981-7dda-2526-8f13-52ead6298ef1@linux.ibm.com>
 <a1d1df76-07df-9879-ae77-ff677efdd291@linux.ibm.com>
 <f3e074d2-4f47-d229-9002-010e91df95d1@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <914d4af3-32ee-e300-9738-92aececa81d6@linux.ibm.com>
Date: Wed, 20 Jan 2021 20:18:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <f3e074d2-4f47-d229-9002-010e91df95d1@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-20_10:2021-01-20,
 2021-01-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 adultscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200108
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: schnelle@linux.ibm.com, david@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, alex.williamson@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/20/21 4:59 PM, Matthew Rosato wrote:
> On 1/20/21 9:45 AM, Pierre Morel wrote:
>>
>>
>> On 1/20/21 3:03 PM, Matthew Rosato wrote:
>>> On 1/20/21 4:12 AM, Pierre Morel wrote:
>>>>
>>>>
>>>> On 1/19/21 9:44 PM, Matthew Rosato wrote:
>>>>> Today, ISM devices are completely disallowed for vfio-pci 
>>>>> passthrough as
>>>>> QEMU rejects the device due to an (inappropriate) MSI-X check. 
>>>>> Removing
>>>>> this fence, however, reveals additional deficiencies in the s390x PCI
>>>>> interception layer that prevent ISM devices from working correctly.
>>>>> Namely, ISM block write operations have particular requirements in 
>>>>> regards
>>>>> to the alignment, size and order of writes performed that cannot be
>>>>> guaranteed when breaking up write operations through the typical
>>>>> vfio_pci_bar_rw paths. Furthermore, ISM requires that legacy/non-MIO
>>>>> s390 PCI instructions are used, which is also not guaranteed when 
>>>>> the I/O
>>>>> is passed through the typical userspace channels.
>>>>>
>>>>> This patchset provides a set of fixes related to enabling ISM device
>>>>> passthrough and includes patches to enable use of a new vfio region 
>>>>> that
>>>>> will allow s390x PCI pass-through devices to perform s390 PCI 
>>>>> instructions
>>>>> in such a way that the same instruction issued on the guest is 
>>>>> re-issued
>>>>> on the host.
>>>>>
>>>>> Associated kernel patchset:
>>>>> https://lkml.org/lkml/2021/1/19/874
>>>>>
>>>>> Changes from RFC -> v1:
>>>>> - Refresh the header sync (built using Eric's 'update-linux-headers:
>>>>> Include const.h' + manually removed pvrdma_ring.h again)
>>>>> - Remove s390x/pci: fix pcistb length (already merged)
>>>>> - Remove s390x/pci: Fix memory_region_access_valid call (already 
>>>>> merged)
>>>>> - Fix bug: s390_pci_vfio_pcistb should use the pre-allocated PCISTB
>>>>> buffer pcistb_buf rather than allocating/freeing its own.
>>>>> - New patch: track the PFT (PCI Function Type) separately from 
>>>>> guest CLP
>>>>> response data -- we tell the guest '0' for now due to limitations in
>>>>> measurement block support, but we can still use the real value 
>>>>> provided via
>>>>> the vfio CLP capabilities to make decisions.
>>>>> - Use the PFT (pci function type) to determine when to use the region
>>>>> for PCISTB/PCILG (only for ISM), rather than using the relaxed 
>>>>> alignment
>>>>> bit.
>>>>> - As a result, the pcistb_default is now updated to also handle the
>>>>> possibility of relaxed alignment via 2 new functions, 
>>>>> pcistb_validate_write
>>>>> and pcistb_write, which serve as wrappers to the memory_region calls.
>>>>> - New patch, which partially restores the MSI-X fence for passthrough
>>>>> devices...  Could potentially be squashed with 's390x/pci: MSI-X isn't
>>>>> strictly required for passthrough' but left separately for now as I 
>>>>> felt it
>>>>> needed a clear commit description of why we should still fence this 
>>>>> case.
>>>>>
>>>> Hi,
>>>>
>>>> The choice of using the new VFIO region is made on the ISM PCI 
>>>> function type (PFT), which makes the patch ISM specific, why don't 
>>>> we use here the MIO bit common to any zPCI function and present in 
>>>> kernel to make the choice?
>>>>
>>>
>>> As discussed during the RFC (and see my reply also to the kernel 
>>> set), the use of this region only works for devices that do not rely 
>>> on MSI-X interrupts.  If we did as you suggest, other device types 
>>> like mlx would not receive MSI-X interrupts in the guest (And I did 
>>> indeed try variations where I used the special VFIO region for all 
>>> PCISTG/PCILG/PCISTB for various device types)
>>>
>>> So the idea for now was to solve the specific problem at hand 
>>> (getting ISM devices working).
>>>
>>>
>>
>> Sorry, if I missed or forgot some discussions, but I understood that 
>> we are using this region to handle PCISTB instructions when the device 
>> do not support MIO.
>> Don't we?
> 
> Sure thing - It's probably good to refresh the issue/rationale anyway as 
> we've had the holidays in between.
> 
> You are correct, a primary reason we need to resort to a separate VFIO 
> region for PCISTB (and PCILG) instructions for ISM devices is that they 
> do not support the MIO instruction set, yet the host kernel will 
> translate everything coming through the PCI I/O layer to MIO 
> instructions whenever that facility is available to the host (and not 
> purposely disabled).  This issue is unique to vfio-pci/passthrough - in 
> the host, the ISM driver directly invokes functions in s390 pci code to 
> ensure that MIO instructions are not used.


QEMU intercepts and differentiates PCISTG and PCISTB.
The new hardware support both MIO and legacy PCISTB/PCISTG.

QEMU does not support MIO

My first interrogation is why should we translate legacy to MIO?

But OK, say we do need this for some obscure reason.

> 
> But this is not the only reason.  There are additional reasons for using 
> this VFIO region:
> 1) ISM devices also don't support PCISTG instructions to certain address 
> spaces and PCISTB must be used regardless of operation length.  However 
> the standard s390 PCI I/O path always uses PCISTG for anything <=8B. 
> Trying to determine whether a given I/O is intended for an ISM device at 
> that point in kernel code so as to use PCISTB instead of PCISTG is the 

OK, this is clear.

> same problem as attempting to decide whether to use MIO vs non-MIO 
> instructions at that point.

humm, this is not exactly the same problem for me, but OK to choose to 
handle it the same way.



> 2) It allows for much larger PCISTB operations (4K) than allowed via the 
> memory regions (loop of 8B operations).

OK

> 3) The above also has the added benefit of eliminating certain write 
> pattern requirements that are unique to ISM that would be introduced if 
> we split up the I/O into 8B chunks (if we can't write the whole PCISTB 
> in one go, ISM requires data written in a certain order for some address 
> spaces, or with certain bits on/off on the PCISTB instruction to signify 
> the state of the larger operation)

Yes, I suppose that the driver in the guest does it right and we need to 
do the same.


> 
>>
>> I do not understand the relation between MSI-X and MIO.
>> Can you please explain?
>>
> 
> There is not a relation between MSI-X and MIO really.  Rather, this is a 
> case of the solution that is being offered here ONLY works for devices 
> that use MSI -- and ISM is a device that only supports MSI.  If you try 
> to use this new VFIO region to pass I/O for an MSI-X enabled device, the 
> notifiers set up via vfio_msix_setup won't be triggered because we are 
> writing to the new VFIO region, not the virtual bar regions that may 
> have had notifiers setup as part of vfio_msix_setup.  This results in 
> missing interrupts on MSI-X-enabled vfio-pci devices.
> 
> These notifiers aren't a factor when the device is using MSI.

I find this strange but we do not need to discuss it.

> 

So we have:
devices supporting MIO and MSIX
devices not supporting MIO nor MSIX
devices not supporting the use of PCISTG to emulate PCISTB

The first two are two different things indicated by two different 
entries in the clp query PCI function response.

The last one, we do not have an indicator as if the relaxed alignment 
and length is set, PCISTB can not be emulated with PCISTG

What I mean with this is that considering the proposed implementation 
and considering:
MIO MSIX RELAX

0 0 1  -> must use the new region (ISM)
1 1 0  -> must use the standard VFIO region (MLX)

we can discuss other 6 possibilities

0 0 0 -> must use the new region
0 1 0 -> NOOP
0 1 1 -> NOOP
1 0 0 -> can use any region
1 0 1 -> can use any region
1 1 1 -> NOOP

In my opinion the test for using one region or another should be done on 
these indicator instead of using the PFT.
This may offer us more compatibility with other hardware we may not be 
aware of as today.


Regards,
Pierre








-- 
Pierre Morel
IBM Lab Boeblingen

