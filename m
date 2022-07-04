Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB075658FA
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 16:53:40 +0200 (CEST)
Received: from localhost ([::1]:44226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8NSF-0004HS-21
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 10:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1o8NMM-0004tv-Gq; Mon, 04 Jul 2022 10:47:34 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:2378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1o8NMA-00029U-JJ; Mon, 04 Jul 2022 10:47:32 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 264EMVlp032693;
 Mon, 4 Jul 2022 14:47:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=e28WBeLWF0JiTHYzOCaHml82yGcqc/97wk36FS4ltFg=;
 b=Julq2ahRaGkRRFCVf7qvBj3W0ObtXWQKLJN7qbA8JZAzzjUCurqYFT+UHo5wlSnKPWnD
 cFo0xGBzP94g8/5eT77ZwM0UoL19MgOtZ6/OUeA29f4xyvrU1Vus6HG+xEWXeUf0ZYC7
 SBHJs+86nil9qwSJEu/HbvXrcx3s26xHMj128Q/NXNVAstzYCRiujqmNU2DI2CT8ZLHP
 Sx+9tyU6yjlnIMzfZMkGALddfLE3ooZfbjLaauz2jqYDFiIeXzlrfcKtcmq7fuKsE9Ws
 5gogtwBJKI0T3IYzh7twFxheaN4/Ib0tUe6fsDMBBBCkIh8qk/8EPbqf7twcg28XPtZK EA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h41wf0gqu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jul 2022 14:47:17 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 264ERmeO024130;
 Mon, 4 Jul 2022 14:47:17 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h41wf0gpy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jul 2022 14:47:17 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 264Ebm9o024064;
 Mon, 4 Jul 2022 14:47:14 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3h2dn92u0g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jul 2022 14:47:14 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 264ElKkk33358258
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Jul 2022 14:47:20 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 95FE8A4053;
 Mon,  4 Jul 2022 14:47:11 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1ED7A4040;
 Mon,  4 Jul 2022 14:47:10 +0000 (GMT)
Received: from [9.171.11.185] (unknown [9.171.11.185])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  4 Jul 2022 14:47:10 +0000 (GMT)
Message-ID: <a12e344f-29e4-8097-8510-88d74fb8bc22@linux.ibm.com>
Date: Mon, 4 Jul 2022 16:51:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v8 02/12] s390x/cpu_topology: CPU topology objects and
 structures
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com
References: <20220620140352.39398-1-pmorel@linux.ibm.com>
 <20220620140352.39398-3-pmorel@linux.ibm.com>
 <35c562e1-cdcd-41ce-1957-bd35c72a78ca@linux.ibm.com>
 <72aba814-2901-7d06-131d-8c1f660e3830@linux.ibm.com>
 <3e97dd7d-0a3f-c1ae-75d5-bef05c639038@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <3e97dd7d-0a3f-c1ae-75d5-bef05c639038@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: HAk5SN6VoNNg9uyBkBsNzK_TjCltbXDM
X-Proofpoint-GUID: eyAQVB6B5Zj-RxLe8xREaM1KLCFKmud6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-04_14,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2207040063
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
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



On 7/4/22 13:47, Janosch Frank wrote:
> On 6/29/22 17:25, Pierre Morel wrote:
>>
>>
>> On 6/27/22 15:31, Janosch Frank wrote:
>>> On 6/20/22 16:03, Pierre Morel wrote:
>>>> We use new objects to have a dynamic administration of the CPU 
>>>> topology.
>>>> The highest level object in this implementation is the s390 book and
>>>> in this first implementation of CPU topology for S390 we have a single
>>>> book.
>>>> The book is built as a SYSBUS bridge during the CPU initialization.
>>>> Other objects, sockets and core will be built after the parsing
>>>> of the QEMU -smp argument.
>>>>
>>>> Every object under this single book will be build dynamically
>>>> immediately after a CPU has be realized if it is needed.
>>>> The CPU will fill the sockets once after the other, according to the
>>>> number of core per socket defined during the smp parsing.
>>>>
>>>> Each CPU inside a socket will be represented by a bit in a 64bit
>>>> unsigned long. Set on plug and clear on unplug of a CPU.
>>>>
>>>> For the S390 CPU topology, thread and cores are merged into
>>>> topology cores and the number of topology cores is the multiplication
>>>> of cores by the numbers of threads.
>>>>
>>>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>>>
>>> [...]
>>>
>>>> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
>>>> index 7d6d01325b..216adfde26 100644
>>>> --- a/target/s390x/cpu.h
>>>> +++ b/target/s390x/cpu.h
>>>> @@ -565,6 +565,53 @@ typedef union SysIB {
>>>>    } SysIB;
>>>>    QEMU_BUILD_BUG_ON(sizeof(SysIB) != 4096);
>>>> +/* CPU type Topology List Entry */
>>>> +typedef struct SysIBTl_cpu {
>>>> +        uint8_t nl;
>>>> +        uint8_t reserved0[3];
>>>> +        uint8_t reserved1:5;
>>>> +        uint8_t dedicated:1;
>>>> +        uint8_t polarity:2;
>>>> +        uint8_t type;
>>>> +        uint16_t origin;
>>>> +        uint64_t mask;
>>>> +} SysIBTl_cpu;
>>>> +QEMU_BUILD_BUG_ON(sizeof(SysIBTl_cpu) != 16);
>>>> +
>>>> +/* Container type Topology List Entry */
>>>> +typedef struct SysIBTl_container {
>>>> +        uint8_t nl;
>>>> +        uint8_t reserved[6];
>>>> +        uint8_t id;
>>>> +} QEMU_PACKED SysIBTl_container;
>>>> +QEMU_BUILD_BUG_ON(sizeof(SysIBTl_container) != 8);
>>>> +
>>>> +/* Generic Topology List Entry */
>>>> +typedef union SysIBTl_entry {
>>>> +        uint8_t nl;
>>>
>>> This union member is unused, isn't it?
>>>
>>>> +        SysIBTl_container container;
>>>> +        SysIBTl_cpu cpu;
>>>> +} SysIBTl_entry;
>>>> +
>>>> +#define TOPOLOGY_NR_MAG  6
>>>
>>> TOPOLOGY_TOTAL_NR_MAGS ?
>>>
>>>> +#define TOPOLOGY_NR_MAG6 0
>>>
>>> TOPOLOGY_NR_TLES_MAG6 ?
>>>
>>> I'm open to other suggestions but we need to differentiate between the
>>> number of mag array entries and the number of TLEs in the MAGs.
>>
>>
>> typedef enum {
>>           TOPOLOGY_MAG6 = 0,
>>           TOPOLOGY_MAG5 = 1,
>>           TOPOLOGY_MAG4 = 2,
>>           TOPOLOGY_MAG3 = 3,
>>           TOPOLOGY_MAG2 = 4,
>>           TOPOLOGY_MAG1 = 5,
>>           TOPOLOGY_TOTAL_MAGS = 6,
>> };
>>
>>
>> oder enum with TOPOLOGY_NR_TLES_MAGx ?
> 
> I'd stick with the shorter first variant.


OK, thanks

> 
>>
>>>
>>>> +#define TOPOLOGY_NR_MAG5 1
>>>> +#define TOPOLOGY_NR_MAG4 2
>>>> +#define TOPOLOGY_NR_MAG3 3
>>>> +#define TOPOLOGY_NR_MAG2 4
>>>> +#define TOPOLOGY_NR_MAG1 5
>>>
>>> I'd appreciate a \n here.
>>
>> OK
>>
>>>
>>>> +/* Configuration topology */
>>>> +typedef struct SysIB_151x {
>>>> +    uint8_t  res0[2];
>>>
>>> You're using "reserved" everywhere but now it's "rev"?
>>
>> OK I will keep reserved
>>
>>>
>>>> +    uint16_t length;
>>>> +    uint8_t  mag[TOPOLOGY_NR_MAG];
>>>> +    uint8_t  res1;
>>>> +    uint8_t  mnest;
>>>> +    uint32_t res2;
>>>> +    SysIBTl_entry tle[0];
>>>> +} SysIB_151x;
>>>> +QEMU_BUILD_BUG_ON(sizeof(SysIB_151x) != 16);
>>>> +
>>>>    /* MMU defines */
>>>>    #define ASCE_ORIGIN           (~0xfffULL) /* segment table
>>>> origin             */
>>>>    #define ASCE_SUBSPACE         0x200       /* subspace group
>>>> control           */
>>>
>>>
>>
> 

-- 
Pierre Morel
IBM Lab Boeblingen

