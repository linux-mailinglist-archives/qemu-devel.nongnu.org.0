Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E991B2DE78C
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 17:42:20 +0100 (CET)
Received: from localhost ([::1]:37006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqIpf-0006dE-FC
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 11:42:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1kqIoR-0006CM-Oe; Fri, 18 Dec 2020 11:41:03 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:1172
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1kqIoM-0003l6-Ly; Fri, 18 Dec 2020 11:41:03 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BIGW6wP011474; Fri, 18 Dec 2020 11:40:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=L/u+tbz97S3tJ6tJa1W7M0KQDE0qPaXrt4NgvbP4jik=;
 b=f/sZkMK7I3OZhxCiiTJrWB3Dxu0ZUjZud1JA4xpy8wvKjhIqYVxRZJwOEzEMNR6O7VhD
 G9Sedx9P01X5IMMc5KkDlS+/Oa1zF76xFkQ7rDZrId696aQpS45TEjYl8xC2RyFjuOHT
 xe9WtMzIQthyMx1BH6lFQWnhMhWMQiH7gEsQlx1xcJnfRmX79/mzqvWOh4Ux35J0WhkP
 EWaQ3ukEoOIfW0ZTNo5xlqHQ5IsKsSYGzWJA6fU1vDOlR5sYk6f0jCWQ2zUj/V7wRDVM
 u9XHbSbtqY2C49OoFL09NJlC2bWBoOSXdNH/i7wzMVq5DZRWHz/crXXnQa1/LxQ5WnCc ig== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35h01287s4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Dec 2020 11:40:56 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BIGWDj9012154;
 Fri, 18 Dec 2020 11:40:55 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35h01287qr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Dec 2020 11:40:55 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BIGbl3G001409;
 Fri, 18 Dec 2020 16:40:53 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 35cng86j8c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Dec 2020 16:40:53 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BIGeoDH39125314
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Dec 2020 16:40:50 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D0DF411C050;
 Fri, 18 Dec 2020 16:40:50 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 65B2B11C04A;
 Fri, 18 Dec 2020 16:40:50 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.46.39])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 18 Dec 2020 16:40:50 +0000 (GMT)
Subject: Re: [PATCH v2 2/2] s390x/pci: Fix memory_region_access_valid call
To: Cornelia Huck <cohuck@redhat.com>
References: <1608243397-29428-1-git-send-email-mjrosato@linux.ibm.com>
 <1608243397-29428-3-git-send-email-mjrosato@linux.ibm.com>
 <72f4e03f-7208-6af0-4cd2-9715d9f9ec77@linux.ibm.com>
 <20201218120440.36b56e80.cohuck@redhat.com>
 <2c5a2ccb-dbe1-f355-3980-462be1d93942@linux.ibm.com>
 <20201218163206.7b8efa2a.cohuck@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <52c93c12-b9a4-99ba-186c-4db2e6267b9f@linux.ibm.com>
Date: Fri, 18 Dec 2020 17:40:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201218163206.7b8efa2a.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-18_10:2020-12-18,
 2020-12-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 lowpriorityscore=0 clxscore=1015
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012180111
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: thuth@redhat.com, Matthew Rosato <mjrosato@linux.ibm.com>, david@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/18/20 4:32 PM, Cornelia Huck wrote:
> On Fri, 18 Dec 2020 15:32:08 +0100
> Pierre Morel <pmorel@linux.ibm.com> wrote:
> 
>> On 12/18/20 12:04 PM, Cornelia Huck wrote:
>>> On Fri, 18 Dec 2020 10:37:38 +0100
>>> Pierre Morel <pmorel@linux.ibm.com> wrote:
>>>    
>>>> On 12/17/20 11:16 PM, Matthew Rosato wrote:
>>>>> In pcistb_service_handler, a call is made to validate that the memory
>>>>> region can be accessed.  However, the call is made using the entire length
>>>>> of the pcistb operation, which can be larger than the allowed memory
>>>>> access size (8).  Since we already know that the provided buffer is a
>>>>> multiple of 8, fix the call to memory_region_access_valid to iterate
>>>>> over the memory region in the same way as the subsequent call to
>>>>> memory_region_dispatch_write.
>>>>>
>>>>> Fixes: 863f6f52b7 ("s390: implement pci instructions")
>>>>> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
>>>>> ---
>>>>>     hw/s390x/s390-pci-inst.c | 10 ++++++----
>>>>>     1 file changed, 6 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
>>>>> index e230293..76b08a3 100644
>>>>> --- a/hw/s390x/s390-pci-inst.c
>>>>> +++ b/hw/s390x/s390-pci-inst.c
>>>>> @@ -821,10 +821,12 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, uint8_t r3, uint64_t gaddr,
>>>>>         mr = s390_get_subregion(mr, offset, len);
>>>>>         offset -= mr->addr;
>>>>>     
>>>>> -    if (!memory_region_access_valid(mr, offset, len, true,
>>>>> -                                    MEMTXATTRS_UNSPECIFIED)) {
>>>>> -        s390_program_interrupt(env, PGM_OPERAND, ra);
>>>>> -        return 0;
>>>>> +    for (i = 0; i < len; i += 8) {
>>>>> +        if (!memory_region_access_valid(mr, offset + i, 8, true,
>>>>> +                                        MEMTXATTRS_UNSPECIFIED)) {
>>>>> +            s390_program_interrupt(env, PGM_OPERAND, ra);
>>>>> +            return 0;
>>>>> +        }
>>>>>         }
>>>>>     
>>>>>         if (s390_cpu_virt_mem_read(cpu, gaddr, ar, buffer, len)) {
>>>>>       
>>>>
>>>> wouldn't it be made automatically by defining the io_region
>>>> max_access_size when reading the bars in clp_service_call?
>>>>   
>>>
>>> But that's already what is happening, isn't it? The access check is
>>> done for a size that is potentially too large, while the actual access
>>> will happen in chunks of 8? I think that this patch is correct.
>>>    
>>
>> Sorry I was too rapid and half wrong in my writing I was also not
>> specific enough.
>>
>> In MemoryRegionOps we have a field valid with a callback accepts().
>>
>> I was wondering if doing the check in the accept() callback which is
>> called by the memory_region_access_valid() function and then using
>> max_access_size would not be cleaner.
>>
>> Note that it does not change a lot but only where the check is done.
> 
> But where would we add those ops? My understanding is that pcistb acts
> on whatever region the device provided, and that differs from device to
> device?
> 
> 

The ops already exist, I thought adding a dedicated callback for s390 on 
every regions used by vfio_pci instead of the default.
But it does not add a lot, just looks cleaner to me.


-- 
Pierre Morel
IBM Lab Boeblingen

