Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B372B679C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 15:36:09 +0100 (CET)
Received: from localhost ([::1]:42004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf25Y-0008Mz-VH
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 09:36:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kf24O-0007TN-1R; Tue, 17 Nov 2020 09:34:56 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:1546
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kf24K-0001AC-DL; Tue, 17 Nov 2020 09:34:55 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AHEWCW9150662; Tue, 17 Nov 2020 09:34:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=nJIlol30xnOHwi/Q60FDkQPjoaGJ9qVQeZoqYY40rzc=;
 b=FPghSj6v98b5yqH/lo1g18m6u78T72CycGZioX29PFn5QEw4xW3DA+ymzk4PeZP+JnSs
 p3LSwFUyOEIUulyr4fYcX6Iip7n03cRJu+CC/YcfLGcb34miHEy+woxNdGSmYcS5xMO1
 PEyWkRY4VarY1jltcxBd49i/b1QdRO+MOwcrJSSWvM6knQfAAjwcHKyZkRNEbXcPGDAy
 GuZatO78c6iKDiGmezJnpmyfX9Rs8vtZVxVtH/iBQjMHkuKtD6kGfZkdG76R9HNXkwlU
 SauzodkUC+aC6sBs9CTTPzPWWGKRFuAbCrxb++kBxuYo3F8ex+0qs95WE+nbeL+vlayT 9Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34v3yfbta0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 09:34:48 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AHEWQW9151890;
 Tue, 17 Nov 2020 09:34:47 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34v3yfbt9p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 09:34:47 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AHEWMJi029710;
 Tue, 17 Nov 2020 14:34:46 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04dal.us.ibm.com with ESMTP id 34t6v94t3t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 14:34:46 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AHEYjWd3998350
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Nov 2020 14:34:46 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4652B2066;
 Tue, 17 Nov 2020 14:34:45 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 319D4B205F;
 Tue, 17 Nov 2020 14:34:43 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.163.48.2])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 17 Nov 2020 14:34:43 +0000 (GMT)
Subject: Re: [RFC PATCH-for-5.2] hw/s390x/pci: Fix endianness issue
To: Cornelia Huck <cohuck@redhat.com>
References: <20201117120115.1234994-1-philmd@redhat.com>
 <CAFEAcA-c3hw2w23OR0moKDYuvyD3O=Bqjp3fiid0byH7K+nr-Q@mail.gmail.com>
 <d945234d-4725-9928-11cb-f34606c8524c@linux.ibm.com>
 <20201117143117.4b05db78.cohuck@redhat.com>
 <c3c71d14-f891-83e4-5ecd-e5067f9e74c7@linux.ibm.com>
 <20201117151340.539d55b2.cohuck@redhat.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
Message-ID: <a62491d5-0dfa-f202-7673-9eebce2425c7@linux.ibm.com>
Date: Tue, 17 Nov 2020 09:34:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201117151340.539d55b2.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-17_03:2020-11-17,
 2020-11-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 suspectscore=0 mlxscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011170104
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 08:24:07
X-ACL-Warn: Detected OS   = Linux 3.x [generic]
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Pierre Morel <pmorel@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 qemu-s390x <qemu-s390x@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/20 9:13 AM, Cornelia Huck wrote:
> On Tue, 17 Nov 2020 09:02:37 -0500
> Matthew Rosato <mjrosato@linux.ibm.com> wrote:
> 
>> On 11/17/20 8:31 AM, Cornelia Huck wrote:
>>> On Tue, 17 Nov 2020 14:23:57 +0100
>>> Pierre Morel <pmorel@linux.ibm.com> wrote:
>>>    
>>>> On 11/17/20 2:00 PM, Peter Maydell wrote:
>>>>> On Tue, 17 Nov 2020 at 12:03, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>>>>>
>>>>>> Fix an endianness issue reported by Cornelia:
>>>>>>      
>>>>>>> s390x tcg guest on x86, virtio-pci devices are not detected. The
>>>>>>> relevant feature bits are visible to the guest. Same breakage with
>>>>>>> different guest kernels.
>>>>>>> KVM guests and s390x tcg guests on s390x are fine.
>>>>>>
>>>>>> Fixes: 28dc86a0729 ("s390x/pci: use a PCI Group structure")
>>>>>> Reported-by: Cornelia Huck <cohuck@redhat.com>
>>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>>>> ---
>>>>>> RFC because review-only patch, untested
>>>>>> ---
>>>>>>     hw/s390x/s390-pci-inst.c | 2 +-
>>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
>>>>>> index 58cd041d17f..cfb54b4d8ec 100644
>>>>>> --- a/hw/s390x/s390-pci-inst.c
>>>>>> +++ b/hw/s390x/s390-pci-inst.c
>>>>>> @@ -305,7 +305,7 @@ int clp_service_call(S390CPU *cpu, uint8_t r2, uintptr_t ra)
>>>>>>             ClpReqQueryPciGrp *reqgrp = (ClpReqQueryPciGrp *)reqh;
>>>>>>             S390PCIGroup *group;
>>>>>>
>>>>>> -        group = s390_group_find(reqgrp->g);
>>>>>> +        group = s390_group_find(ldl_p(&reqgrp->g));
>>>>>
>>>>> 'g' in the ClpReqQueryPciGrp struct is a uint32_t, so
>>>>> adding the ldl_p() will have no effect unless (a) the
>>>>> structure is not 4-aligned and (b) the host will fault on
>>>>> unaligned accesses, which isn't the case for x86 hosts.
>>>>>
>>>>> Q: is this struct really in host order, or should we
>>>>> be using ldl_le_p() or ldl_be_p() and friends here and
>>>>> elsewhere?
>>>>>
>>>>> thanks
>>>>> -- PMM
>>>>>       
>>>>
>>>> Hi, I think we better modify the structure here, g should be a byte.
>>>>
>>>> Connie, can you please try this if it resolves the issue?
>>>>
>>>> diff --git a/hw/s390x/s390-pci-inst.h b/hw/s390x/s390-pci-inst.h
>>>> index fa3bf8b5aa..641d19c815 100644
>>>> --- a/hw/s390x/s390-pci-inst.h
>>>> +++ b/hw/s390x/s390-pci-inst.h
>>>> @@ -146,7 +146,8 @@ typedef struct ClpReqQueryPciGrp {
>>>>         uint32_t fmt;
>>>>         uint64_t reserved1;
>>>>     #define CLP_REQ_QPCIG_MASK_PFGID 0xff
>>>> -    uint32_t g;
>>>> +    uint32_t g0 :24;
>>>> +    uint32_t g  :8;
>>>>         uint32_t reserved2;
>>>>         uint64_t reserved3;
>>>>     } QEMU_PACKED ClpReqQueryPciGrp;
>>>>   
>>>
>>> No, same crash... I fear there are more things broken wrt endianness.
>>>    
>>
>> Sorry, just getting online now, looking at the code....  Are the 2
>> memcpy calls added in 9670ee75 and 28dc86a0 the issue?  Won't they just
>> present the Q PCI FN / Q PCI FN GRP results in host endianness?
>>
> 
> I just re-added some st?_p operations in set_pbdev_info and that fixes
> at least the crash I was seeing with Phil's patch applied. Still, no
> pci functions get detected, so that's not enough. Those memcpy calls
> look like a possible culprit.
> 

OK, so if everything in set_pbdev_info and s390_pci_init_default_group() 
is handled with st?_p operations, then the memcpy should be OK...

Pierre was on to something with his recommendation, as the group id is 
only 1B of the 'g' field (see CLP_REQ_QPCIG_MASK_PFGID) - the other bits 
just happen to be unused.

Did you include his change with your st?_p changes to set_pbdev_info 
(sorry, I don't have this environment set up but clearly need to do so 
for future testing)

