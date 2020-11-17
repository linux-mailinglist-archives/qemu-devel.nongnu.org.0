Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 379082B6D5E
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 19:29:56 +0100 (CET)
Received: from localhost ([::1]:56460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf5jm-0006zh-OX
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 13:29:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kf5j1-0006XT-Po
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 13:29:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kf5ix-0000Xg-Lt
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 13:29:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605637741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PcXANBFnxBTBNedYnZGGYQ1WmhlfzixijmEKnWLfNy0=;
 b=Xv3jjsUfFsJgWt5ivM4xjaMuWbJvTsLFqlcYVQgfNW3V5QAZL/R4puQf7ycbre+/9K8qVt
 N7OmJajujgBt8Dla9EPusPB637+QsWHbVHorNQ1XwfANEZ47maUFmSYSfEURARIirZF/8B
 lG7qJ+gl/yikUGd5Z5Ndr1sY5YQn2W8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-m1vd8RnMNqOs-btFp-ud1g-1; Tue, 17 Nov 2020 13:28:59 -0500
X-MC-Unique: m1vd8RnMNqOs-btFp-ud1g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B53C80046B;
 Tue, 17 Nov 2020 18:28:58 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-138.ams2.redhat.com [10.36.113.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF1A95B4A2;
 Tue, 17 Nov 2020 18:28:49 +0000 (UTC)
Subject: Re: [RFC PATCH-for-5.2] hw/s390x/pci: Fix endianness issue
To: Matthew Rosato <mjrosato@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>
References: <20201117120115.1234994-1-philmd@redhat.com>
 <CAFEAcA-c3hw2w23OR0moKDYuvyD3O=Bqjp3fiid0byH7K+nr-Q@mail.gmail.com>
 <d945234d-4725-9928-11cb-f34606c8524c@linux.ibm.com>
 <20201117143117.4b05db78.cohuck@redhat.com>
 <c3c71d14-f891-83e4-5ecd-e5067f9e74c7@linux.ibm.com>
 <20201117151340.539d55b2.cohuck@redhat.com>
 <a62491d5-0dfa-f202-7673-9eebce2425c7@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <7b9967e9-6cfb-d3fa-c62a-ec96f0d97dec@redhat.com>
Date: Tue, 17 Nov 2020 19:28:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <a62491d5-0dfa-f202-7673-9eebce2425c7@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Pierre Morel <pmorel@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 qemu-s390x <qemu-s390x@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/11/2020 15.34, Matthew Rosato wrote:
> On 11/17/20 9:13 AM, Cornelia Huck wrote:
>> On Tue, 17 Nov 2020 09:02:37 -0500
>> Matthew Rosato <mjrosato@linux.ibm.com> wrote:
>>
>>> On 11/17/20 8:31 AM, Cornelia Huck wrote:
>>>> On Tue, 17 Nov 2020 14:23:57 +0100
>>>> Pierre Morel <pmorel@linux.ibm.com> wrote:
>>>>   
>>>>> On 11/17/20 2:00 PM, Peter Maydell wrote:
>>>>>> On Tue, 17 Nov 2020 at 12:03, Philippe Mathieu-Daudé
>>>>>> <philmd@redhat.com> wrote:
>>>>>>>
>>>>>>> Fix an endianness issue reported by Cornelia:
>>>>>>>     
>>>>>>>> s390x tcg guest on x86, virtio-pci devices are not detected. The
>>>>>>>> relevant feature bits are visible to the guest. Same breakage with
>>>>>>>> different guest kernels.
>>>>>>>> KVM guests and s390x tcg guests on s390x are fine.
>>>>>>>
>>>>>>> Fixes: 28dc86a0729 ("s390x/pci: use a PCI Group structure")
>>>>>>> Reported-by: Cornelia Huck <cohuck@redhat.com>
>>>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>>>>> ---
>>>>>>> RFC because review-only patch, untested
>>>>>>> ---
>>>>>>>     hw/s390x/s390-pci-inst.c | 2 +-
>>>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
>>>>>>> index 58cd041d17f..cfb54b4d8ec 100644
>>>>>>> --- a/hw/s390x/s390-pci-inst.c
>>>>>>> +++ b/hw/s390x/s390-pci-inst.c
>>>>>>> @@ -305,7 +305,7 @@ int clp_service_call(S390CPU *cpu, uint8_t r2,
>>>>>>> uintptr_t ra)
>>>>>>>             ClpReqQueryPciGrp *reqgrp = (ClpReqQueryPciGrp *)reqh;
>>>>>>>             S390PCIGroup *group;
>>>>>>>
>>>>>>> -        group = s390_group_find(reqgrp->g);
>>>>>>> +        group = s390_group_find(ldl_p(&reqgrp->g));
>>>>>>
>>>>>> 'g' in the ClpReqQueryPciGrp struct is a uint32_t, so
>>>>>> adding the ldl_p() will have no effect unless (a) the
>>>>>> structure is not 4-aligned and (b) the host will fault on
>>>>>> unaligned accesses, which isn't the case for x86 hosts.
>>>>>>
>>>>>> Q: is this struct really in host order, or should we
>>>>>> be using ldl_le_p() or ldl_be_p() and friends here and
>>>>>> elsewhere?
>>>>>>
>>>>>> thanks
>>>>>> -- PMM
>>>>>>       
>>>>>
>>>>> Hi, I think we better modify the structure here, g should be a byte.
>>>>>
>>>>> Connie, can you please try this if it resolves the issue?
>>>>>
>>>>> diff --git a/hw/s390x/s390-pci-inst.h b/hw/s390x/s390-pci-inst.h
>>>>> index fa3bf8b5aa..641d19c815 100644
>>>>> --- a/hw/s390x/s390-pci-inst.h
>>>>> +++ b/hw/s390x/s390-pci-inst.h
>>>>> @@ -146,7 +146,8 @@ typedef struct ClpReqQueryPciGrp {
>>>>>         uint32_t fmt;
>>>>>         uint64_t reserved1;
>>>>>     #define CLP_REQ_QPCIG_MASK_PFGID 0xff
>>>>> -    uint32_t g;
>>>>> +    uint32_t g0 :24;
>>>>> +    uint32_t g  :8;
>>>>>         uint32_t reserved2;
>>>>>         uint64_t reserved3;
>>>>>     } QEMU_PACKED ClpReqQueryPciGrp;
>>>>>   
>>>>
>>>> No, same crash... I fear there are more things broken wrt endianness.
>>>>    
>>>
>>> Sorry, just getting online now, looking at the code....  Are the 2
>>> memcpy calls added in 9670ee75 and 28dc86a0 the issue?  Won't they just
>>> present the Q PCI FN / Q PCI FN GRP results in host endianness?
>>>
>>
>> I just re-added some st?_p operations in set_pbdev_info and that fixes
>> at least the crash I was seeing with Phil's patch applied. Still, no
>> pci functions get detected, so that's not enough. Those memcpy calls
>> look like a possible culprit.
>>
> 
> OK, so if everything in set_pbdev_info and s390_pci_init_default_group() is
> handled with st?_p operations, then the memcpy should be OK...
> 
> Pierre was on to something with his recommendation, as the group id is only
> 1B of the 'g' field (see CLP_REQ_QPCIG_MASK_PFGID) - the other bits just
> happen to be unused.
> 
> Did you include his change with your st?_p changes to set_pbdev_info 
As Peter also already wrote: Bitfields are not endianess safe either. You'd
need to replace the g0:24 with "uint8_t g0[3]" to get it working that way.

 Thomas


