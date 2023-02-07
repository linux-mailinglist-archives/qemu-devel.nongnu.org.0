Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0201A68D2B5
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 10:25:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPKDL-0002Ff-FB; Tue, 07 Feb 2023 04:24:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pPKDI-0002FO-Vr; Tue, 07 Feb 2023 04:24:33 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pPKDG-0002qD-Qh; Tue, 07 Feb 2023 04:24:32 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3178MLKM033317; Tue, 7 Feb 2023 09:24:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=j5oA2j3ygGCH1n9m8jUXpwF34OLwRxc+WmElCWzBNvc=;
 b=LWq8nZfAsa2OTBdMfdNy2g83zWRgBvLmFZ6h45BI1zc++CRJn2pCxVfLdRE0KTjNLOgw
 4UshWS5UUQKZTHHd9qRosuu/WlgJHyOsACPTUpJP7eJp9uGiCYVqFXceLiYvVUdt22Cd
 3WH1suLN2ZXLkq/klQcFs8INE2WqFQvMq5qerqaShEAI4ghhS7rDYQeg+r33Kbo/57un
 CWgzPH8CDp8yd6XbC2pIb2bQZ7EeyXTPzZOU5Cnn/qgD+9G6j7s4yKgjc2Kfg2xL6crA
 w3f6Jh5ug3O5atA9VJ9KKhx6WkJ+euWemB2LUZZ/lOGoST04dCUSHKLpyVs/cVl5nwRY ow== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nkk2xhmpw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Feb 2023 09:24:24 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3179Jhig030605;
 Tue, 7 Feb 2023 09:24:23 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nkk2xhmnw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Feb 2023 09:24:23 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3171eHG0020252;
 Tue, 7 Feb 2023 09:24:20 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3nhf06tdkj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Feb 2023 09:24:20 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3179OHRj46203374
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Feb 2023 09:24:17 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EAFB92004D;
 Tue,  7 Feb 2023 09:24:16 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A52DE2004B;
 Tue,  7 Feb 2023 09:24:16 +0000 (GMT)
Received: from [9.152.224.241] (unknown [9.152.224.241])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue,  7 Feb 2023 09:24:16 +0000 (GMT)
Message-ID: <f4732cd4-67bb-a2a3-0048-3a2118b52fc1@linux.ibm.com>
Date: Tue, 7 Feb 2023 10:24:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v15 05/11] s390x/cpu topology: resetting the
 Topology-Change-Report
Content-Language: en-US
To: Nina Schoetterl-Glausch <nsg@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230201132051.126868-1-pmorel@linux.ibm.com>
 <20230201132051.126868-6-pmorel@linux.ibm.com>
 <3215597a6916932c26fdbe1dd8daf2fc0c1c1ab5.camel@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <3215597a6916932c26fdbe1dd8daf2fc0c1c1ab5.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: E9NC7Xhl66eAfXhqbBe02yWCv06dOQuq
X-Proofpoint-ORIG-GUID: Kt6cKGVnS9qy4aXgc7H-WapJN0hid4V_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_02,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302070080
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148, SPF_HELO_NONE=0.001,
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



On 2/6/23 18:52, Nina Schoetterl-Glausch wrote:
> On Wed, 2023-02-01 at 14:20 +0100, Pierre Morel wrote:
>> During a subsystem reset the Topology-Change-Report is cleared
>> by the machine.
>> Let's ask KVM to clear the Modified Topology Change Report (MTCR)
>> bit of the SCA in the case of a subsystem reset.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
>>   include/hw/s390x/cpu-topology.h |  1 +
>>   target/s390x/cpu.h              |  1 +
>>   target/s390x/kvm/kvm_s390x.h    |  1 +
>>   hw/s390x/cpu-topology.c         | 12 ++++++++++++
>>   hw/s390x/s390-virtio-ccw.c      |  3 +++
>>   target/s390x/cpu-sysemu.c       | 13 +++++++++++++
>>   target/s390x/kvm/kvm.c          | 17 +++++++++++++++++
>>   7 files changed, 48 insertions(+)
>>
>> diff --git a/include/hw/s390x/cpu-topology.h b/include/hw/s390x/cpu-topology.h
>> index 1ae7e7c5e3..60e0b9fbfa 100644
>> --- a/include/hw/s390x/cpu-topology.h
>> +++ b/include/hw/s390x/cpu-topology.h
>> @@ -66,5 +66,6 @@ static inline void s390_topology_set_cpu(MachineState *ms,
>>   
>>   extern S390Topology s390_topology;
>>   int s390_socket_nb(S390CPU *cpu);
>> +void s390_topology_reset(void);
>>   
>>   #endif
>> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
>> index e1f6925856..848314d2a9 100644
>> --- a/target/s390x/cpu.h
>> +++ b/target/s390x/cpu.h
>> @@ -641,6 +641,7 @@ typedef struct SysIBTl_cpu {
>>   QEMU_BUILD_BUG_ON(sizeof(SysIBTl_cpu) != 16);
>>   
>>   void insert_stsi_15_1_x(S390CPU *cpu, int sel2, __u64 addr, uint8_t ar);
>> +void s390_cpu_topology_reset(void);
> 
> How about you call this s390_cpu_topology_reset_modified, so it's symmetric
> with the function you define in the next patch. You could also drop the "cpu"
> from the name.

I am not sure about this, Thomas already gave his R-B on this patch so I 
prefer to stay on the original name, unless he says it is a good idea to 
change.
Also in cpu-sysemu.c most of the function are tagged with _cpu_

> 
> Or maybe even better, you only define a function for setting the modified state,
> but make it take a bool argument. This way you also get rid of some code duplication
> and it wouldn't harm readability IMO.

There is already a single function kvm_s390_topology_set_mtcr(attr) to 
set the "modified state"

> 
>>   
>>   /* MMU defines */
>>   #define ASCE_ORIGIN           (~0xfffULL) /* segment table origin             */
>> diff --git a/target/s390x/kvm/kvm_s390x.h b/target/s390x/kvm/kvm_s390x.h
>> index f9785564d0..649dae5948 100644
>> --- a/target/s390x/kvm/kvm_s390x.h
>> +++ b/target/s390x/kvm/kvm_s390x.h
>> @@ -47,5 +47,6 @@ void kvm_s390_crypto_reset(void);
>>   void kvm_s390_restart_interrupt(S390CPU *cpu);
>>   void kvm_s390_stop_interrupt(S390CPU *cpu);
>>   void kvm_s390_set_diag318(CPUState *cs, uint64_t diag318_info);
>> +int kvm_s390_topology_set_mtcr(uint64_t attr);
>>   
>>   #endif /* KVM_S390X_H */
>> diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
>> index a80a1ebf22..cf63f3dd01 100644
>> --- a/hw/s390x/cpu-topology.c
>> +++ b/hw/s390x/cpu-topology.c
>> @@ -85,6 +85,18 @@ static void s390_topology_init(MachineState *ms)
>>       QTAILQ_INSERT_HEAD(&s390_topology.list, entry, next);
>>   }
>>   
>> +/**
>> + * s390_topology_reset:
>> + *
>> + * Generic reset for CPU topology, calls s390_topology_reset()
>> + * s390_topology_reset() to reset the kernel Modified Topology
>> + * change record.
>> + */
>> +void s390_topology_reset(void)
>> +{
> 
> I'm wondering if you shouldn't move the reset changes you do in the next patch
> into this one. I don't see what they have to do with PTF emulation.

Here in this patch we do not intercept PTF and we have only an 
horizontal polarity.
So we do not need to reset the polarity for all the vCPUs, we only need 
it when we have vertical polarity.

Regards,
Pierre

-- 
Pierre Morel
IBM Lab Boeblingen

