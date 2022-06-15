Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A9954C294
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 09:24:14 +0200 (CEST)
Received: from localhost ([::1]:50224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1NNt-0004sH-3J
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 03:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o1NHn-0002LR-6a; Wed, 15 Jun 2022 03:17:55 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:41940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o1NHl-0002sk-3y; Wed, 15 Jun 2022 03:17:54 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25F6HIT9019866;
 Wed, 15 Jun 2022 07:17:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=RiRRQR+KVri3dPrsKUtuViQM8jasf5cL0e7SzVCOw9o=;
 b=mPk+dGe5Ac8WFfmbYqBSBHidDCyrHgiFnSVyeg05SufESGkkNv1UHW9FMCUR0Ce6Wuy+
 L3zaNiYxS0NRAeRO4OG23AF4BLvicrDqQrJxKzy8JetyzietJL7R77Bbxbkq0P1yLcUK
 2lJyH9nVyUpgUGobwR+2WFNiRpzUeKg68Taz27hzAACZulu3ZAt61WRIq+w7DfZzqw82
 FTumVz5SuvFn4A510zBhhjOt5v0LLahw8KmUoDQXY9LFEJbFMv8UilMRzp/AP33/X5kB
 e8CN0lWR+29Rx3zTU4MtUzn+HWyv7Ca1zO78jD+hobiKJUc4uBgXlRwC/3aBmBImoJP+ dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gpr32mh7t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jun 2022 07:17:47 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25F7H5eO012482;
 Wed, 15 Jun 2022 07:17:46 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gpr32mh6p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jun 2022 07:17:46 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25F76oaU003666;
 Wed, 15 Jun 2022 07:17:44 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 3gmjp8v749-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jun 2022 07:17:43 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 25F7Hje625493818
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 07:17:45 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4CA8942045;
 Wed, 15 Jun 2022 07:17:41 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E82364203F;
 Wed, 15 Jun 2022 07:17:40 +0000 (GMT)
Received: from [9.145.94.108] (unknown [9.145.94.108])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 15 Jun 2022 07:17:40 +0000 (GMT)
Message-ID: <3da1094b-b200-49ad-3a7c-dae31a7e7658@linux.ibm.com>
Date: Wed, 15 Jun 2022 09:17:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] target/ppc: cpu_init: Clean up stop state on cpu reset
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, danielhb413@gmail.com,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
References: <20220614082912.378355-1-fbarrat@linux.ibm.com>
 <64d1330c-1996-622c-fc1a-ed81fd56cdda@kaod.org>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <64d1330c-1996-622c-fc1a-ed81fd56cdda@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KAm9kFc_ValF3RpnL-6XL-GFAVyB645Z
X-Proofpoint-ORIG-GUID: ygR0Xe8_Cin3ogEO634EX55584gomTbs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-15_02,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206150024
Received-SPF: pass client-ip=148.163.156.1; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 15/06/2022 07:23, Cédric Le Goater wrote:
> On 6/14/22 10:29, Frederic Barrat wrote:
>> The 'resume_as_sreset' attribute of a cpu can be set when a thread is
>> entering a stop state on ppc books. It causes the thread to be
>> re-routed to vector 0x100 when woken up by an exception. So it must be
>> cleaned on reset or a thread might be re-routed unexpectedly after a
>> reset, when it was not in a stop state and/or when the appropriate
>> exception handler isn't set up yet.
> 
> What is the test scenario ? and what are the symptoms ?


I was hitting it because of another bug in skiboot: if you have many 
chips, we spend way too much time in add_opal_interrupts(), especially 
on powernv10 (I'm working on a separate patch in skiboot to fix that). 
Sufficiently so that the watchdog timer resets the system. When it 
happens, all the secondary threads are in stopped state, only the main 
thread is working. That's how I was reproducing.

What happens after the reset can vary a bit due to timing, but the most 
likely scenario is that we go through another primary thread election in 
skiboot. If the primary thread is the same as before, then there's no 
problem. If it's a different primary, then it will enter 
main_cpu_entry() while the other threads wait as secondaries. At some 
point, the primary thread (which still carries the wrong 
resume_as_sreset value from before reset) will enable the decrementer 
interrupt. The vector for the decrementer exception 0x900 is defined, so 
that shouldn't be a problem. However, because of the wrong 
resume_as_sreset value, it is re-routed to vector 0x100, which is still 
defined as the default boot-time handler, which is the entry point for 
BML. So the thread restarts as new, but this time it will be elected 
secondary. And we end up with all threads waiting as secondaries and a 
system stuck. All that happen before we've init the uart, so there's not 
a single trace on the console. Fun :-)

   Fred


> 
> 
>> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> 
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> 
> 
>> ---
>>
>> I didn't find an appropriate commit to add a "Fixes:". It originates
>> when adding support for power management states but the code looked
>> quite different in 2016 and it's not clear whether we were supporting
>> reset then.
> 
> It was added when we needed some support for the POWER8 stop states.
> About that time.
> 
> Thanks,
> 
> C.
> 
>>
>> target/ppc/cpu_init.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
>> index 0f891afa04..c16cb8dbe7 100644
>> --- a/target/ppc/cpu_init.c
>> +++ b/target/ppc/cpu_init.c
>> @@ -7186,6 +7186,9 @@ static void ppc_cpu_reset(DeviceState *dev)
>>           }
>>           pmu_update_summaries(env);
>>       }
>> +
>> +    /* clean any pending stop state */
>> +    env->resume_as_sreset = 0;
>>   #endif
>>       hreg_compute_hflags(env);
>>       env->reserve_addr = (target_ulong)-1ULL;
> 
> 

