Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE182BAC06
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 15:39:26 +0100 (CET)
Received: from localhost ([::1]:54106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg7ZN-0008Ro-OQ
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 09:39:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1kg7YN-0007x8-Ch; Fri, 20 Nov 2020 09:38:23 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:35570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1kg7YL-00035w-E1; Fri, 20 Nov 2020 09:38:23 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AKE3TbO040363; Fri, 20 Nov 2020 09:38:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=eLCdr15wfNztPOJpt/dUkoz0SY/z7TITbx54iD8M/d0=;
 b=gzsLWDcrs00lVeG/kKTJhH0lbbb0ljS1yChsZnI996EWR129Bl3g5AwqAaWqhXlHB7yv
 EgCi4Z5jezMtOJq0AhSa+uSU4IBzrpljbbzyQMRLB4Y6OjU44DSlEFeMXv70maaMCClm
 6KwQY8P9IbJHe45Ays2ufb3k0lelJGzrvt6f33fDYGjzFcXsaGu2uBwd1boa0efTpP2F
 AlKOv7vcK6aXv9e6ktUhspjl/iLnKEJbfWfMZ/U9nH9SyO3ZXEL39QTg0LAmlyaKFswM
 AuIzjfa+AfnbeITq/CpBS672OWupH01/QSgVT+JMg2AYk5AiC9psOUjsf4lfb7WB7rcA iQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34xe6b3hkk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Nov 2020 09:38:19 -0500
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AKEYau9186283;
 Fri, 20 Nov 2020 09:38:18 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34xe6b3hjn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Nov 2020 09:38:18 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AKEbRvU029752;
 Fri, 20 Nov 2020 14:38:17 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02wdc.us.ibm.com with ESMTP id 34w5w8r0r5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Nov 2020 14:38:17 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AKEcFI11049164
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Nov 2020 14:38:15 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B151B2067;
 Fri, 20 Nov 2020 14:38:15 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C921AB2064;
 Fri, 20 Nov 2020 14:38:13 +0000 (GMT)
Received: from [9.163.28.108] (unknown [9.163.28.108])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 20 Nov 2020 14:38:13 +0000 (GMT)
Subject: Re: [PATCH 2/2] pc-bios: s390x: Give precedence to reset PSW
To: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>
References: <20201119165729.63351-1-farman@linux.ibm.com>
 <20201119165729.63351-3-farman@linux.ibm.com>
 <8595991c-5776-3021-ca16-deebba287be1@redhat.com>
 <7f99cc7c-f74d-0721-3749-515208526bb0@linux.ibm.com>
 <ba74a91a-b9a9-111f-e94a-31c81a883ef0@redhat.com>
From: Eric Farman <farman@linux.ibm.com>
Message-ID: <45632b15-81da-ba5f-a4ae-8cff7efaba4a@linux.ibm.com>
Date: Fri, 20 Nov 2020 09:38:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <ba74a91a-b9a9-111f-e94a-31c81a883ef0@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-20_07:2020-11-20,
 2020-11-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011200096
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: Jason Herne <jjherne@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Jared Rossi <jrossi@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/20/20 1:02 AM, Thomas Huth wrote:
> On 19/11/2020 22.11, Eric Farman wrote:
>>
>>
>> On 11/19/20 3:20 PM, Thomas Huth wrote:
>>> On 19/11/2020 17.57, Eric Farman wrote:
>>>> Let's look at the Reset PSW first instead of the contents of memory.
>>>> It might be leftover from an earlier system boot when processing
>>>> a chreipl.
>>>>
>>>> Signed-off-by: Eric Farman <farman@linux.ibm.com>
>>>> ---
>>>>    pc-bios/s390-ccw/jump2ipl.c | 20 ++++++++++----------
>>>>    1 file changed, 10 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/pc-bios/s390-ccw/jump2ipl.c b/pc-bios/s390-ccw/jump2ipl.c
>>>> index fbae45b03c..67b4afb6a0 100644
>>>> --- a/pc-bios/s390-ccw/jump2ipl.c
>>>> +++ b/pc-bios/s390-ccw/jump2ipl.c
>>>> @@ -72,16 +72,6 @@ void jump_to_IPL_code(uint64_t address)
>>>>      void jump_to_low_kernel(void)
>>>>    {
>>>> -    /*
>>>> -     * If it looks like a Linux binary, i.e. there is the "S390EP" magic
>>>> from
>>>> -     * arch/s390/kernel/head.S here, then let's jump to the well-known
>>>> Linux
>>>> -     * kernel start address (when jumping to the PSW-at-zero address
>>>> instead,
>>>> -     * the kernel startup code fails when we booted from a network device).
>>>> -     */
>>>> -    if (!memcmp((char *)0x10008, "S390EP", 6)) {
>>>> -        jump_to_IPL_code(KERN_IMAGE_START);
>>>> -    }
>>>> -
>>>>        /* Trying to get PSW at zero address */
>>>>        if (*((uint64_t *)0) & RESET_PSW_MASK) {
>>>>            /*
>>>> @@ -92,6 +82,16 @@ void jump_to_low_kernel(void)
>>>>            jump_to_IPL_code(0);
>>>>        }
>>>>    +    /*
>>>> +     * If it looks like a Linux binary, i.e. there is the "S390EP" magic
>>>> from
>>>> +     * arch/s390/kernel/head.S here, then let's jump to the well-known
>>>> Linux
>>>> +     * kernel start address (when jumping to the PSW-at-zero address
>>>> instead,
>>>> +     * the kernel startup code fails when we booted from a network device).
>>>> +     */
>>>> +    if (!memcmp((char *)0x10008, "S390EP", 6)) {
>>>> +        jump_to_IPL_code(KERN_IMAGE_START);
>>>> +    }
>>>
>>> That feels a little bit dangerous ... I assume the order has been that way
>>> for a reason, e.g. I think we had to jump to KERN_IMAGE_START for some older
>>> versions of the Linux kernel since the startup code that was referenced by
>>> the PSW at address zero was not working in KVM...
>>
>> Makes sense.  It does seem like a precarious piece of code.
>>
>>>
>>> What do you think about this alternate idea instead: Clear the memory at
>>> location 0x10008 at the very beginning of the main() function (or maybe in
>>> boot_setup())?
>>
>> This seems to work too (I put it in boot_setup(), prior to call to
>> store_iplb()).
> 
> Great, can you send the patch before your holidays next week? (If you don't
> have enough time, that's ok, too, it's trivial enough, so I think I could
> write such a patch, too)

Will do.  I have it written up, just didn't want to send it last night 
and have surprises when I came in this morning. :)

> 
>   Thomas
> 

