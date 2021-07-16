Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B141E3CB65E
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 12:48:26 +0200 (CEST)
Received: from localhost ([::1]:48152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4LOL-0005b6-PP
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 06:48:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m4LNP-00043N-DQ; Fri, 16 Jul 2021 06:47:27 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:11718
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m4LNN-0005XB-DG; Fri, 16 Jul 2021 06:47:27 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16GAaLXV103290; Fri, 16 Jul 2021 06:47:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=VL0PrKJSmiJvu99n38r3y2OZLl7I6JE5zASvoS/9Md8=;
 b=gA9y2wGwfmkQI07vpYUlHk0FJG5nUKvIf1Do1uDw1LDYPvI7eqJT4U1urGhD8j83WMGL
 3vWIpMBtoXjLP/dA2N+tiScwYWRF39sKmIY2Jl9Wv2tpXpJUxvq2WMSfw0JaYSZtJ5WJ
 kxb8bGjoF5A8CXjs142G4TsKOqgCC/E5Vl5W+9Ul9gNTE4g03wdRfdFbSQ3y/TGkS0Rv
 Z68ig1P+7FGF+WHZ2NN6HTKLazpdZyYNtexuuktKDE+Acw6nOKv8VP+EJ+4Gw0g5HO9n
 hy6S5xVyp0qF8ekhIwPsgXnTmPSkoesjP5VQE6gnLHYgyZCo2OkFQBgCXrbPaFrl6Rtq DA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39tx6vptw8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 06:47:21 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16GAauUS105156;
 Fri, 16 Jul 2021 06:47:20 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39tx6vptvd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 06:47:20 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16GAgUlt026576;
 Fri, 16 Jul 2021 10:47:19 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 39s3p78uv4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 10:47:18 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 16GAj1ow32964998
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Jul 2021 10:45:01 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 994184C076;
 Fri, 16 Jul 2021 10:47:15 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0445D4C06D;
 Fri, 16 Jul 2021 10:47:15 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.164.173])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 16 Jul 2021 10:47:14 +0000 (GMT)
Subject: Re: [PATCH v1 1/9] s390x: smp: s390x dedicated smp parsing
To: Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org
References: <1626281596-31061-1-git-send-email-pmorel@linux.ibm.com>
 <1626281596-31061-2-git-send-email-pmorel@linux.ibm.com>
 <871r7yd4gf.fsf@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <fb7beb44-4a25-8ebf-2bd9-be7e4ca15a1a@linux.ibm.com>
Date: Fri, 16 Jul 2021 12:47:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <871r7yd4gf.fsf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GAwoDqNq6GtDUas1eMjmq67D2cwFFO3D
X-Proofpoint-ORIG-GUID: bnpc6avinf7KXciZAIYZY8dr5oVDSrfJ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-16_04:2021-07-16,
 2021-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107160063
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: thuth@redhat.com, ehabkost@redhat.com, david@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, armbru@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, pbonzini@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/16/21 10:54 AM, Cornelia Huck wrote:
> On Wed, Jul 14 2021, Pierre Morel <pmorel@linux.ibm.com> wrote:
> 
>> We need a s390x dedicated SMP parsing to handle s390x specificities.
>>
>> In this patch we only handle threads, cores and sockets for
>> s390x:
>> - do not support threads, we always have 1 single thread per core
>> - the sockets are filled one after the other with the cores
>>
>> Both these handlings are different from the standard smp_parse
>> functionement and reflect the CPU topology in the simple case
>> where all CPU belong to the same book.
>>
>> Topology levels above sockets, i.e. books, drawers, are not
>> considered at this stage and will be introduced in a later patch.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
>>   hw/s390x/s390-virtio-ccw.c | 42 ++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 42 insertions(+)
>>
>> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
>> index e4b18aef49..899d3a4137 100644
>> --- a/hw/s390x/s390-virtio-ccw.c
>> +++ b/hw/s390x/s390-virtio-ccw.c
>> @@ -582,6 +582,47 @@ static ram_addr_t s390_fixup_ram_size(ram_addr_t sz)
>>       return newsz;
>>   }
>>   
>> +/*
>> + * In S390CCW machine we do not support threads for now,
>> + * only sockets and cores.
>> + */
>> +static void s390_smp_parse(MachineState *ms, QemuOpts *opts)
> 
> It seems you based this on an older version of the code? The current
> signature of this function since 1e63fe685804 ("machine: pass QAPI
> struct to mc->smp_parse") is
> 
> void (*smp_parse)(MachineState *ms, SMPConfiguration *config, Error **errp);
> 
> That affects your parsing, and also lets you get rid of the ugly exit(1)
> statements.

hum, yes, thanks

> 
>> +{
>> +    unsigned cpus    = qemu_opt_get_number(opts, "cpus", 1);
>> +    unsigned sockets = qemu_opt_get_number(opts, "sockets", 1);
>> +    unsigned cores   = qemu_opt_get_number(opts, "cores", 1);
>> +
>> +    if (opts) {
>> +        if (cpus == 0 || sockets == 0 || cores == 0) {
> 
> This behaviour looks different from what we do for other targets: if you
> specify the value as 0, a value is calculated from the other values;
> here, you error out. It's probably not a good idea to differ.

right, thanks

> 
>> +            error_report("cpu topology: "
>> +                         "sockets (%u), cores (%u) or number of CPU(%u) "
>> +                         "can not be zero", sockets, cores, cpus);
>> +            exit(1);
>> +        }
>> +    }
>> +
> 

-- 
Pierre Morel
IBM Lab Boeblingen

