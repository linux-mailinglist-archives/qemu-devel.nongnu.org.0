Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A0261F4C4
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 14:59:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os2do-0000nU-2c; Mon, 07 Nov 2022 08:58:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1os2da-0000kC-V5; Mon, 07 Nov 2022 08:58:08 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1os2dY-0006a3-Fo; Mon, 07 Nov 2022 08:58:06 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A7Cq3me016621;
 Mon, 7 Nov 2022 13:57:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=j8OI/kZE9NG/B9LHEppSpjKOHvhMjkXZRVhBgJaNTy0=;
 b=VdDjsOjgVJDiW4uqXpXDZJm4j9hYW+kwosW/DwKZhYK4wN95NRJNSgRhGgpAW9GKiR6R
 1RKGDK+KK22k9Wd//tCRMCbWdW1sZnqO8x/tY5hS1jttxAztzme+0k37Y8vEUxHeMkiV
 OfYZRfty8X3YdztGYdeX6tBMC56KWzBdpG4fmt/wWgmIndFrBxbFTHBxvulWSRqnsUOn
 6tzkheAeJOqGgxpHbpfMt1FCMSMx3qfnE2hGjqNiipDNx8zvgqExgmMnQahFwSgchi7z
 FtdcD7KSX6d82V8Wn/a8bOJSp2spNzQrTgLjvxnXW105ru/Jev2E4v0uHaAy+xn8u876 UQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kp14x4n6f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Nov 2022 13:57:53 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A7BUTTn021129;
 Mon, 7 Nov 2022 13:57:52 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kp14x4n4q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Nov 2022 13:57:52 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A7Do9Ci023822;
 Mon, 7 Nov 2022 13:57:49 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 3kngp5hx6y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Nov 2022 13:57:49 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2A7DvkC459375922
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Nov 2022 13:57:46 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 554E9AE045;
 Mon,  7 Nov 2022 13:57:46 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 501D1AE04D;
 Mon,  7 Nov 2022 13:57:45 +0000 (GMT)
Received: from [9.171.53.254] (unknown [9.171.53.254])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  7 Nov 2022 13:57:45 +0000 (GMT)
Message-ID: <621ac6ea-2513-0e78-ab3c-f8c2896ab89c@linux.ibm.com>
Date: Mon, 7 Nov 2022 14:57:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v10 2/9] s390x/cpu topology: reporting the CPU topology to
 the guest
To: Janis Schoetterl-Glausch <scgl@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20221012162107.91734-1-pmorel@linux.ibm.com>
 <20221012162107.91734-3-pmorel@linux.ibm.com>
 <4c5afcb5754cb829cd8b9ddbf4f74e610d5f6012.camel@linux.ibm.com>
 <d82372a9-581a-9544-eb6d-7b3e125926f5@linux.ibm.com>
 <ebfe8dea72adaf23913797c482377f4fd58fd097.camel@linux.ibm.com>
Content-Language: en-US
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <ebfe8dea72adaf23913797c482377f4fd58fd097.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ld0loP4o6t3JhFA2aUhUxiEurNRGBHzg
X-Proofpoint-GUID: UKrIfHiyK32TwhwQgm16kfJmRzS6YTBf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_06,2022-11-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211070110
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 11/7/22 14:20, Janis Schoetterl-Glausch wrote:
> On Fri, 2022-10-28 at 12:00 +0200, Pierre Morel wrote:
>>
>> On 10/27/22 22:42, Janis Schoetterl-Glausch wrote:
>>> On Wed, 2022-10-12 at 18:21 +0200, Pierre Morel wrote:
>>>> The guest can use the STSI instruction to get a buffer filled
>>>> with the CPU topology description.
>>>>
>>>> Let us implement the STSI instruction for the basis CPU topology
>>>> level, level 2.
>>>>
>>>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>>>> ---
>>>>    include/hw/s390x/cpu-topology.h |   3 +
>>>>    target/s390x/cpu.h              |  48 ++++++++++++++
>>>>    hw/s390x/cpu-topology.c         |   8 ++-
>>>>    target/s390x/cpu_topology.c     | 109 ++++++++++++++++++++++++++++++++
>>>>    target/s390x/kvm/kvm.c          |   6 +-
>>>>    target/s390x/meson.build        |   1 +
>>>>    6 files changed, 172 insertions(+), 3 deletions(-)
>>>>    create mode 100644 target/s390x/cpu_topology.c
>>>>
>>>> diff --git a/include/hw/s390x/cpu-topology.h b/include/hw/s390x/cpu-topology.h
>>>> index 66c171d0bc..61c11db017 100644
>>>> --- a/include/hw/s390x/cpu-topology.h
>>>> +++ b/include/hw/s390x/cpu-topology.h
>>>> @@ -13,6 +13,8 @@
>>>>    #include "hw/qdev-core.h"
>>>>    #include "qom/object.h"
>>>>    
>>>> +#define S390_TOPOLOGY_POLARITY_H  0x00
>>>> +
>>>>    typedef struct S390TopoContainer {
>>>>        int active_count;
>>>>    } S390TopoContainer;
>>>> @@ -29,6 +31,7 @@ struct S390Topology {
>>>>        S390TopoContainer *socket;
>>>>        S390TopoTLE *tle;
>>>>        MachineState *ms;
>>>> +    QemuMutex topo_mutex;
>>>>    };
>>>>    
>>>>    #define TYPE_S390_CPU_TOPOLOGY "s390-topology"
>>>> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
>>>> index 7d6d01325b..d604aa9c78 100644
>>>> --- a/target/s390x/cpu.h
>>>> +++ b/target/s390x/cpu.h
>>>>
>>> [...]
>>>> +
>>>> +/* Maxi size of a SYSIB structure is when all CPU are alone in a container */
>>>
>>> Max or Maximum.
>>>
>>>> +#define S390_TOPOLOGY_SYSIB_SIZE (sizeof(SysIB_151x) +                         \
>>>> +                                  S390_MAX_CPUS * (sizeof(SysIBTl_container) + \
>>>> +                                                   sizeof(SysIBTl_cpu)))
>>>
>>> Currently this is 16+248*3*8 == 5968 and will grow with books, drawer support to
>>> 16+248*5*8 == 9936 ...
>>>
>>> [...]
>>>>
>>>> +
>>>> +void insert_stsi_15_1_x(S390CPU *cpu, int sel2, __u64 addr, uint8_t ar)
>>>> +{
>>>> +    uint64_t page[S390_TOPOLOGY_SYSIB_SIZE / sizeof(uint64_t)] = {};
>>>
>>> ... so calling this page is a bit misleading. Also why not make it a char[]?
>>> And maybe use a union for type punning.
>>
>> OK, what about:
>>
>>       union {
>>           char place_holder[S390_TOPOLOGY_SYSIB_SIZE];
>>           SysIB_151x sysib;
>>       } buffer QEMU_ALIGNED(8);
>>
> I don't think you need the QEMU_ALIGNED since SysIB_151x already has it. Not that it hurts to be
> explicit. If you declared the tle member as uint64_t[], you should get the correct alignment
> automatically and can then drop the explicit one.

I find the explicit statement better. Why make it non explicit?

> Btw, [] seems to be preferred over [0], at least there is a commit doing a conversion:
> f7795e4096 ("misc: Replace zero-length arrays with flexible array member (automatic)")

OK

>>
>>>
>>>> +    SysIB_151x *sysib = (SysIB_151x *) page;
>>>> +    int len;
>>>> +
>>>> +    if (s390_is_pv() || !s390_has_topology() ||
>>>> +        sel2 < 2 || sel2 > S390_TOPOLOGY_MAX_MNEST) {
>>>> +        setcc(cpu, 3);
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    len = setup_stsi(sysib, sel2);
>>>
>>> This should now be memory safe, but might be larger than 4k,
>>> the maximum size of the SYSIB. I guess you want to set cc code 3
>>> in this case and return.
>>
>> I do not find why the SYSIB can not be larger than 4k.
>> Can you point me to this restriction?
> 
> Says so at the top of the description of STSI:
> 
> The SYSIB is 4K bytes and must begin at a 4 K-byte
> boundary; otherwise, a specification exception may
> be recognized.

Right, I guess I can not read.

So I will return CC=3 in case the length is greater than 4K


thanks,
Regards,

Pierre


-- 
Pierre Morel
IBM Lab Boeblingen

