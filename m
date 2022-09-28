Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B55725EDFD4
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 17:11:30 +0200 (CEST)
Received: from localhost ([::1]:46018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odYif-0008TE-In
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 11:11:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1odXCi-0002AY-Mb; Wed, 28 Sep 2022 09:34:26 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:49144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1odXCg-0001gz-Ji; Wed, 28 Sep 2022 09:34:24 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28SDALkF023269;
 Wed, 28 Sep 2022 13:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=3aHf9pgWjhKE6jxMgIh/rgYf1l/wYtjr8upzwD7Vq/4=;
 b=DsJeDGydISyGwVlPwtAu0RwbOfYxQmcxsE5eOoH/ESd9gxNX/Cg2UejUgKnkubCCfY/y
 iJjX0PmwNJaoJ9hhDtcXwEUs6EozjkHjL/6i50lPa/bn9nqZU84JDBgc7oqvY6J6XvUU
 X8ygdV2slGJRBTq1oqdjqVI9z80mDgAV9SEaVS6vdum8Xm6td59OCCqOO5P8hhrZE3nZ
 gpYaXrpbJ61Lq8xmuFMVVORrx/byIh8MgUo6hve5D6ZBjO8bPWVc+PFPKh93Y+YRtx/n
 6vU8nR6ZwWYhgML4tD9Yr6/jcw3LgjaYqpakTGfJHAlvX0AKv6c4iNmVAeMeqe1L3K5z UA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jvjd122e5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Sep 2022 13:34:18 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28SDB3BO025708;
 Wed, 28 Sep 2022 13:34:18 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jvjd1227u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Sep 2022 13:34:18 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28SDLbXs032592;
 Wed, 28 Sep 2022 13:34:13 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3jss5j5afn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Sep 2022 13:34:13 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 28SDYA8g30671436
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Sep 2022 13:34:10 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0511D4C040;
 Wed, 28 Sep 2022 13:34:10 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 139BD4C044;
 Wed, 28 Sep 2022 13:34:09 +0000 (GMT)
Received: from [9.171.31.212] (unknown [9.171.31.212])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 28 Sep 2022 13:34:08 +0000 (GMT)
Message-ID: <1492220f-c62d-ffe2-b936-0327e9df37f8@linux.ibm.com>
Date: Wed, 28 Sep 2022 15:34:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v9 08/10] target/s390x: interception of PTF instruction
Content-Language: en-US
To: Janis Schoetterl-Glausch <scgl@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com
References: <20220902075531.188916-1-pmorel@linux.ibm.com>
 <20220902075531.188916-9-pmorel@linux.ibm.com>
 <b7a70243ccf9ec74525b10452bcbd2f6b9f5f050.camel@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <b7a70243ccf9ec74525b10452bcbd2f6b9f5f050.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Z3IJlNMpe6-o2_8Tu4XrWFWzYYyfjRbj
X-Proofpoint-GUID: MR68j5NTxn6n83j1VRi9bnronrTFloNS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_06,2022-09-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209280083
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/9/22 18:50, Janis Schoetterl-Glausch wrote:
> On Fri, 2022-09-02 at 09:55 +0200, Pierre Morel wrote:
>> When the host supports the CPU topology facility, the PTF
>> instruction with function code 2 is interpreted by the SIE,
>> provided that the userland hypervizor activates the interpretation
>> by using the KVM_CAP_S390_CPU_TOPOLOGY KVM extension.
>>
>> The PTF instructions with function code 0 and 1 are intercepted
>> and must be emulated by the userland hypervizor.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> 
> Reviewed-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>

Thanks

> 
> See note below.
>> ---
>>   hw/s390x/cpu-topology.c            | 52 ++++++++++++++++++++++++++++++
>>   include/hw/s390x/s390-virtio-ccw.h |  6 ++++
>>   target/s390x/kvm/kvm.c             | 13 ++++++++
>>   3 files changed, 71 insertions(+)
>>
>> diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
>> index b6bf839e40..7dcaa28ca3 100644
>> --- a/hw/s390x/cpu-topology.c
>> +++ b/hw/s390x/cpu-topology.c
>> @@ -20,6 +20,58 @@
>>   #include "hw/s390x/s390-virtio-ccw.h"
>>   #include "hw/s390x/cpu-topology.h"
>>   #include "migration/vmstate.h"
>> +#include "target/s390x/cpu.h"
>> +#include "hw/s390x/s390-virtio-ccw.h"
>> +
>> +/*
>> + * s390_handle_ptf:
>> + *
>> + * @register 1: contains the function code
>> + *
>> + * Function codes 0 and 1 handle the CPU polarization.
>> + * We assume an horizontal topology, the only one supported currently
>> + * by Linux, consequently we answer to function code 0, requesting
>> + * horizontal polarization that it is already the current polarization
>> + * and reject vertical polarization request without further explanation.
>> + *
>> + * Function code 2 is handling topology changes and is interpreted
>> + * by the SIE.
>> + */
>> +void s390_handle_ptf(S390CPU *cpu, uint8_t r1, uintptr_t ra)
>> +{
>> +    CPUS390XState *env = &cpu->env;
>> +    uint64_t reg = env->regs[r1];
>> +    uint8_t fc = reg & S390_TOPO_FC_MASK;
>> +
>> +    if (!s390_has_feat(S390_FEAT_CONFIGURATION_TOPOLOGY)) {
>> +        s390_program_interrupt(env, PGM_OPERATION, ra);
>> +        return;
> 
> I'm either expecting this function to return -1 here...
>> +    }
>> +
>> +    if (env->psw.mask & PSW_MASK_PSTATE) {
>> +        s390_program_interrupt(env, PGM_PRIVILEGED, ra);
>> +        return;
>> +    }
>> +
>> +    if (reg & ~S390_TOPO_FC_MASK) {
>> +        s390_program_interrupt(env, PGM_SPECIFICATION, ra);
>> +        return;
>> +    }
>> +
>> +    switch (fc) {
>> +    case 0:    /* Horizontal polarization is already set */
>> +        env->regs[r1] |= S390_PTF_REASON_DONE;
>> +        setcc(cpu, 2);
>> +        break;
>> +    case 1:    /* Vertical polarization is not supported */
>> +        env->regs[r1] |= S390_PTF_REASON_NONE;
>> +        setcc(cpu, 2);
>> +        break;
>> +    default:
>> +        /* Note that fc == 2 is interpreted by the SIE */
>> +        s390_program_interrupt(env, PGM_SPECIFICATION, ra);
>> +    }
>> +}
> 
> [...]
>>   
>> +static int kvm_handle_ptf(S390CPU *cpu, struct kvm_run *run)
>> +{
>> +    uint8_t r1 = (run->s390_sieic.ipb >> 20) & 0x0f;
>> +
>> +    s390_handle_ptf(cpu, r1, RA_IGNORED);
> 
> ... and this being returned here...
>> +
>> +    return 0;
> 
> ... or this function being void.
>> +}


Yes right, thanks

Regards,
Pierre


-- 
Pierre Morel
IBM Lab Boeblingen

