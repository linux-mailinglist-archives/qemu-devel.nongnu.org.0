Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 639DD2B9CC4
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 22:12:53 +0100 (CET)
Received: from localhost ([::1]:52024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfrEa-00070C-G0
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 16:12:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1kfrCy-0005ur-EB; Thu, 19 Nov 2020 16:11:12 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:57304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1kfrCv-00057a-O7; Thu, 19 Nov 2020 16:11:12 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AJL1osA083710; Thu, 19 Nov 2020 16:11:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=s/24j2jMjFFrAfON7/IzTNiYEyYJOlsxSQFaiEzvgkU=;
 b=S4CjVhBOQL4nb93GpBbXtchCZk6ccx9C+Z5te0nOITfIBBAZDfgunlRNgT13LghJIzEo
 k17Mae2UwBBb9C5c5Zg+Nm5xrywP8JVPTsSJdOslpX9v6XDnYxMIwZa0iD46CVRx8wx3
 eguCz945spp2b88NWEsigysr5rAu6bFPSV5G/M3qawQygEE4Kvh+KPO+ia5u2joXrGqQ
 IYGO0G68GQctkGcpQO8Qt8+VVswkTHGjP3uskl9MwJfXAUEX6mzhJOtFuh0EgQBg01J5
 xhB5AbjyB+AHii3BZwOHJ2fTp2u7vTkqZTJh0vibNDxA52eynK8qn6s6On0BPB8BHe8M pw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34wy6e20ar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 16:11:07 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AJL1uTJ084502;
 Thu, 19 Nov 2020 16:11:07 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34wy6e20ag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 16:11:07 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AJL7KL7029838;
 Thu, 19 Nov 2020 21:11:06 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma05wdc.us.ibm.com with ESMTP id 34t6v9h1rv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 21:11:06 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AJLB4o89110078
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Nov 2020 21:11:04 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 655D0B2068;
 Thu, 19 Nov 2020 21:11:04 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5FAE8B205F;
 Thu, 19 Nov 2020 21:11:02 +0000 (GMT)
Received: from [9.163.28.108] (unknown [9.163.28.108])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 19 Nov 2020 21:11:02 +0000 (GMT)
Subject: Re: [PATCH 2/2] pc-bios: s390x: Give precedence to reset PSW
To: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>
References: <20201119165729.63351-1-farman@linux.ibm.com>
 <20201119165729.63351-3-farman@linux.ibm.com>
 <8595991c-5776-3021-ca16-deebba287be1@redhat.com>
From: Eric Farman <farman@linux.ibm.com>
Message-ID: <7f99cc7c-f74d-0721-3749-515208526bb0@linux.ibm.com>
Date: Thu, 19 Nov 2020 16:11:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <8595991c-5776-3021-ca16-deebba287be1@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-19_10:2020-11-19,
 2020-11-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011190140
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



On 11/19/20 3:20 PM, Thomas Huth wrote:
> On 19/11/2020 17.57, Eric Farman wrote:
>> Let's look at the Reset PSW first instead of the contents of memory.
>> It might be leftover from an earlier system boot when processing
>> a chreipl.
>>
>> Signed-off-by: Eric Farman <farman@linux.ibm.com>
>> ---
>>   pc-bios/s390-ccw/jump2ipl.c | 20 ++++++++++----------
>>   1 file changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/pc-bios/s390-ccw/jump2ipl.c b/pc-bios/s390-ccw/jump2ipl.c
>> index fbae45b03c..67b4afb6a0 100644
>> --- a/pc-bios/s390-ccw/jump2ipl.c
>> +++ b/pc-bios/s390-ccw/jump2ipl.c
>> @@ -72,16 +72,6 @@ void jump_to_IPL_code(uint64_t address)
>>   
>>   void jump_to_low_kernel(void)
>>   {
>> -    /*
>> -     * If it looks like a Linux binary, i.e. there is the "S390EP" magic from
>> -     * arch/s390/kernel/head.S here, then let's jump to the well-known Linux
>> -     * kernel start address (when jumping to the PSW-at-zero address instead,
>> -     * the kernel startup code fails when we booted from a network device).
>> -     */
>> -    if (!memcmp((char *)0x10008, "S390EP", 6)) {
>> -        jump_to_IPL_code(KERN_IMAGE_START);
>> -    }
>> -
>>       /* Trying to get PSW at zero address */
>>       if (*((uint64_t *)0) & RESET_PSW_MASK) {
>>           /*
>> @@ -92,6 +82,16 @@ void jump_to_low_kernel(void)
>>           jump_to_IPL_code(0);
>>       }
>>   
>> +    /*
>> +     * If it looks like a Linux binary, i.e. there is the "S390EP" magic from
>> +     * arch/s390/kernel/head.S here, then let's jump to the well-known Linux
>> +     * kernel start address (when jumping to the PSW-at-zero address instead,
>> +     * the kernel startup code fails when we booted from a network device).
>> +     */
>> +    if (!memcmp((char *)0x10008, "S390EP", 6)) {
>> +        jump_to_IPL_code(KERN_IMAGE_START);
>> +    }
> 
> That feels a little bit dangerous ... I assume the order has been that way
> for a reason, e.g. I think we had to jump to KERN_IMAGE_START for some older
> versions of the Linux kernel since the startup code that was referenced by
> the PSW at address zero was not working in KVM...

Makes sense.  It does seem like a precarious piece of code.

> 
> What do you think about this alternate idea instead: Clear the memory at
> location 0x10008 at the very beginning of the main() function (or maybe in
> boot_setup())? 

This seems to work too (I put it in boot_setup(), prior to call to 
store_iplb()).

Then we can be sure that there is no stale S390EP magic
> dangling around anymore once we've loaded the new kernel...
> 
>   Thomas
> 

