Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B29CB42B9C7
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 09:57:26 +0200 (CEST)
Received: from localhost ([::1]:38000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maZ8f-0003kQ-6h
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 03:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1maZ6x-0002yV-6I; Wed, 13 Oct 2021 03:55:40 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:63324
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1maZ6p-0005E8-BG; Wed, 13 Oct 2021 03:55:35 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19D62s17006425; 
 Wed, 13 Oct 2021 03:55:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=jTewVfZT3szx4JTlQ5gtkbw8oFIS/Jr405WHHaM9vbA=;
 b=XkRiqsa+XbhddzR3srzH6AZo+O+e/lvFmAA7MsM4yMFHbC97bpS5D53WWUpn/REiFyuH
 9QD+/I3ygLwAap84iH9P5XVinaU8zhMgccgkg4CVOxAydkcGfJoF92UF9tDVS0xlvyRH
 42Y8bV2xnxkYX/opX9qBVLPMvFoe0jwMSzJMugQ/ALM5XasifRIOsp8R5ivvxao4l8PX
 pnMxmK6uGxJWxG0pwwp2fVGScT+5lLvwc36oe+EuVlGkaYcnbnrfx1ueBdHvmyqEa4Tp
 NoMBRPUjW/AY7VoCYSdoPcrbTXfx9dTaQ0P/c86WIEo66UpqSA2R9cYK6Yex9Kw0oPYF Zg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bnprj5m0p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Oct 2021 03:55:29 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19D7oHWD014241;
 Wed, 13 Oct 2021 03:55:28 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bnprj5m08-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Oct 2021 03:55:28 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19D7rUFY025598;
 Wed, 13 Oct 2021 07:55:26 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3bk2qa871y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Oct 2021 07:55:26 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19D7tKtq3605044
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Oct 2021 07:55:20 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B303AA407D;
 Wed, 13 Oct 2021 07:55:20 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 588E5A4057;
 Wed, 13 Oct 2021 07:55:18 +0000 (GMT)
Received: from [9.171.19.130] (unknown [9.171.19.130])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 13 Oct 2021 07:55:18 +0000 (GMT)
Message-ID: <80eeffd4-25cf-c2ac-e74b-c8d5301fa98a@linux.ibm.com>
Date: Wed, 13 Oct 2021 09:55:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 2/4] s390x: kvm: topology: interception of PTF
 instruction
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
References: <1631800254-25762-1-git-send-email-pmorel@linux.ibm.com>
 <1631800254-25762-3-git-send-email-pmorel@linux.ibm.com>
 <ae0cf5c1-b0b8-0758-7c38-35c1845201ba@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <ae0cf5c1-b0b8-0758-7c38-35c1845201ba@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4IHcXjeCE0y5SD2AGXqmgvUKULkeEBrl
X-Proofpoint-ORIG-GUID: z03MWMcxIUIduQ-ebTn8cC7JLrFWWuRb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-13_02,2021-10-13_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1011 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110130049
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: david@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/13/21 09:25, Thomas Huth wrote:
> On 16/09/2021 15.50, Pierre Morel wrote:
>> When the host supports the CPU topology facility, the PTF
>> instruction with function code 2 is interpreted by the SIE,
>> provided that the userland hypervizor activates the interpretation
>> by using the KVM_CAP_S390_CPU_TOPOLOGY KVM extension.
>>
>> The PTF instructions with function code 0 and 1 are intercepted
>> and must be emulated by the userland hypervizor.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
>>   hw/s390x/s390-virtio-ccw.c         | 36 ++++++++++++++++++++++++++++++
>>   include/hw/s390x/s390-virtio-ccw.h |  6 +++++
>>   target/s390x/kvm/kvm.c             | 15 +++++++++++++
>>   3 files changed, 57 insertions(+)
>>
>> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
>> index 61aeccb163..894f013139 100644
>> --- a/hw/s390x/s390-virtio-ccw.c
>> +++ b/hw/s390x/s390-virtio-ccw.c
>> @@ -404,6 +404,42 @@ static void 
>> s390_pv_prepare_reset(S390CcwMachineState *ms)
>>       s390_pv_prep_reset();
>>   }
> 
> Could you please add a comment in front of this function, with some 
> explanations? If I've got that right, it's currently rather only a 
> "dummy" function, rejecting FC 0 and 1, and FC 2 is always handled by 
> the SIE, right?
> 
>> +int s390_handle_ptf(S390CPU *cpu, uint8_t r1, uintptr_t ra)
>> +{
>> +    CPUS390XState *env = &cpu->env;
>> +    uint64_t reg = env->regs[r1];
>> +    uint8_t fc = reg & S390_TOPO_FC_MASK;
>> +
>> +    if (!s390_has_feat(S390_FEAT_CONFIGURATION_TOPOLOGY)) {
>> +        s390_program_interrupt(env, PGM_OPERATION, ra);
>> +        return 0;
>> +    }
>> +
>> +    if (env->psw.mask & PSW_MASK_PSTATE) {
>> +        s390_program_interrupt(env, PGM_PRIVILEGED, ra);
>> +        return 0;
>> +    }
>> +
>> +    if (reg & ~S390_TOPO_FC_MASK) {
>> +        s390_program_interrupt(env, PGM_SPECIFICATION, ra);
>> +        return 0;
>> +    }
>> +
>> +    switch (fc) {
>> +    case 0:    /* Horizontal polarization is already set */
>> +        env->regs[r1] |= S390_PTF_REASON_DONE;
>> +        return 2;
>> +    case 1:    /* Vertical polarization is not supported */
>> +        env->regs[r1] |= S390_PTF_REASON_NONE;
>> +        return 2;
>> +    default:
>> +        /* Note that fc == 2 is interpreted by the SIE */
>> +        s390_program_interrupt(env, PGM_SPECIFICATION, ra);
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static void s390_machine_reset(MachineState *machine)
>>   {
>>       S390CcwMachineState *ms = S390_CCW_MACHINE(machine);
>> diff --git a/include/hw/s390x/s390-virtio-ccw.h 
>> b/include/hw/s390x/s390-virtio-ccw.h
>> index 3331990e02..ac4b4a92e7 100644
>> --- a/include/hw/s390x/s390-virtio-ccw.h
>> +++ b/include/hw/s390x/s390-virtio-ccw.h
>> @@ -30,6 +30,12 @@ struct S390CcwMachineState {
>>       uint8_t loadparm[8];
>>   };
>> +#define S390_PTF_REASON_NONE (0x00 << 8)
>> +#define S390_PTF_REASON_DONE (0x01 << 8)
>> +#define S390_PTF_REASON_BUSY (0x02 << 8)
>> +#define S390_TOPO_FC_MASK 0xffUL
>> +int s390_handle_ptf(S390CPU *cpu, uint8_t r1, uintptr_t ra);
>> +
>>   struct S390CcwMachineClass {
>>       /*< private >*/
>>       MachineClass parent_class;
>> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
>> index 5b1fdb55c4..dd036961fe 100644
>> --- a/target/s390x/kvm/kvm.c
>> +++ b/target/s390x/kvm/kvm.c
>> @@ -97,6 +97,7 @@
>>   #define PRIV_B9_EQBS                    0x9c
>>   #define PRIV_B9_CLP                     0xa0
>> +#define PRIV_B9_PTF                     0xa2
>>   #define PRIV_B9_PCISTG                  0xd0
>>   #define PRIV_B9_PCILG                   0xd2
>>   #define PRIV_B9_RPCIT                   0xd3
>> @@ -362,6 +363,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>>       kvm_vm_enable_cap(s, KVM_CAP_S390_USER_SIGP, 0);
>>       kvm_vm_enable_cap(s, KVM_CAP_S390_VECTOR_REGISTERS, 0);
>>       kvm_vm_enable_cap(s, KVM_CAP_S390_USER_STSI, 0);
>> +    kvm_vm_enable_cap(s, KVM_CAP_S390_CPU_TOPOLOGY, 0);
> 
> Should this maybe rather be done in the last patch, to avoid a state 
> where PTF is available, but STSI 15 is not implemented yet (when 
> bisecting through these commits later)?
> 
>   Thomas
> 

Yes you are right, thanks.
Pierre

-- 
Pierre Morel
IBM Lab Boeblingen

