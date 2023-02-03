Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB2C689406
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 10:41:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNsYQ-0006y4-7b; Fri, 03 Feb 2023 04:40:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pNsYM-0006xB-JB; Fri, 03 Feb 2023 04:40:18 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pNsYK-0000LO-IZ; Fri, 03 Feb 2023 04:40:18 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3139Boqf017957; Fri, 3 Feb 2023 09:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=m4Xgu8qPHA1jXZZmOTOnQwyQORVLxdMnxTVq4ztLi8A=;
 b=eU0cFmW8XbSRtL1BzdpHdM4iSHagjqWL3OONMakI0FJbHoczmGYKpMVdKUiOlmtDT292
 M2SYzU3oa/u4Ib90g2fUWR4LVAyJsxQpW44kp3dXTqRtX8qtwc1o31lUJ+3lRodH73RL
 7S5QFPUKp1YwJFDm+e6bcvKc9c8E2DoafmKdzyqrnyHBuDtXDE8M2E3XilUcfrGDzh1D
 VqRksZ3mO11BujL3OC+4d+vVrGu2Oo+CYv7//QHQqKnWTvXBFxMUYd0v1CqX9vBt6ou2
 AeH6pWxsWzBWINVZwmIG+t2FOhIru4v+jKfSUz8SUtoGOgg+FOmG5jHZx+pkPlKJt05z 4Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ngxdfsusj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Feb 2023 09:40:06 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3139Cmcf020412;
 Fri, 3 Feb 2023 09:40:06 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ngxdfsura-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Feb 2023 09:40:06 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3135xgxe003387;
 Fri, 3 Feb 2023 09:40:04 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3ncvt7n5wa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Feb 2023 09:40:04 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3139e0ks49283414
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Feb 2023 09:40:00 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6DE8D2004E;
 Fri,  3 Feb 2023 09:40:00 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D87320040;
 Fri,  3 Feb 2023 09:39:59 +0000 (GMT)
Received: from [9.171.57.15] (unknown [9.171.57.15])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri,  3 Feb 2023 09:39:59 +0000 (GMT)
Message-ID: <4ef7d6a2-c9aa-9994-48ac-21d6ed865a45@linux.ibm.com>
Date: Fri, 3 Feb 2023 10:39:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v15 01/11] s390x/cpu topology: adding s390 specificities
 to CPU topology
Content-Language: en-US
To: Nina Schoetterl-Glausch <nsg@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230201132051.126868-1-pmorel@linux.ibm.com>
 <20230201132051.126868-2-pmorel@linux.ibm.com>
 <9fed7aba2819a6564b785e90c2284b2a83f35431.camel@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <9fed7aba2819a6564b785e90c2284b2a83f35431.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: B0hTdZhSwNOtmXfAnO7JDTD1h3-yp7Tg
X-Proofpoint-ORIG-GUID: QwymZxT3o9yCCEdaYpBLB9TayeYwABjm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-03_04,2023-02-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302030085
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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


@Thomas, these changes look good to me.
What do you think, do I make the change and keep your RB ?

On 2/2/23 17:05, Nina Schoetterl-Glausch wrote:
> Nit patch title: s390x/cpu topology: add s390 specifics to CPU topology ?
> 

OK

> On Wed, 2023-02-01 at 14:20 +0100, Pierre Morel wrote:
>> S390 adds two new SMP levels, drawers and books to the CPU
>> topology.
>> The S390 CPU have specific toplogy features like dedication
>                                  ^o

Yes thx

>> and polarity to give to the guest indications on the host
>> vCPUs scheduling and help the guest take the best decisions
>> on the scheduling of threads on the vCPUs.
>>
>> Let us provide the SMP properties with books and drawers levels
>> and S390 CPU with dedication and polarity,
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
>>   qapi/machine.json               | 14 ++++++++--
>>   include/hw/boards.h             | 10 ++++++-
>>   include/hw/s390x/cpu-topology.h | 24 +++++++++++++++++
>>   target/s390x/cpu.h              |  5 ++++
>>   hw/core/machine-smp.c           | 48 ++++++++++++++++++++++++++++-----
>>   hw/core/machine.c               |  4 +++
>>   hw/s390x/s390-virtio-ccw.c      |  2 ++
>>   softmmu/vl.c                    |  6 +++++
>>   target/s390x/cpu.c              |  7 +++++
>>   qemu-options.hx                 |  7 +++--
>>   10 files changed, 115 insertions(+), 12 deletions(-)
>>   create mode 100644 include/hw/s390x/cpu-topology.h
>>
> [...]
>>
>> diff --git a/include/hw/s390x/cpu-topology.h b/include/hw/s390x/cpu-topology.h
>> new file mode 100644
>> index 0000000000..7a84b30a21
>> --- /dev/null
>> +++ b/include/hw/s390x/cpu-topology.h
>> @@ -0,0 +1,24 @@
>> +/*
>> + * CPU Topology
>> + *
>> + * Copyright IBM Corp. 2022
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or (at
>> + * your option) any later version. See the COPYING file in the top-level
>> + * directory.
>> + */
>> +#ifndef HW_S390X_CPU_TOPOLOGY_H
>> +#define HW_S390X_CPU_TOPOLOGY_H
>> +
>> +#define S390_TOPOLOGY_CPU_IFL   0x03
>> +
>> +enum s390_topology_polarity {
>> +    POLARITY_HORIZONTAL,
>> +    POLARITY_VERTICAL,
>> +    POLARITY_VERTICAL_LOW = 1,
>> +    POLARITY_VERTICAL_MEDIUM,
>> +    POLARITY_VERTICAL_HIGH,
>> +    POLARITY_MAX,
>> +};
> 
> Probably a good idea to keep the S390 prefix.
> This works, but aliasing VERTICAL and VERTICAL_LOW is not
> entirely straight forward.
> 
> Why not have two enum?
> enum s390_topology_polarity {
> 	S390_POLARITY_HORIZONTAL,
> 	S390_POLARITY_VERTICAL,
> };
> 
> enum s390_topology_entitlement {
> 	S390_ENTITLEMENT_LOW = 1,
> 	S390_ENTITLEMENT_MEDIUM,
> 	S390_ENTITLEMENT_HIGH,
> 	S390_ENTITLEMENT_MAX,
> };
> Maybe add an ENTITLEMENT_INVALID/NONE, if you need that, as first value.
> 

If Thomas agree, I do the changes.

Regards,
Pierre


-- 
Pierre Morel
IBM Lab Boeblingen

