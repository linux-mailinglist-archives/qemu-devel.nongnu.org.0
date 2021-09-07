Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD9840254D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 10:42:11 +0200 (CEST)
Received: from localhost ([::1]:60000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNWgE-0004Im-Uv
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 04:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mNWf1-0003aF-2m; Tue, 07 Sep 2021 04:40:55 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:9656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mNWey-0002eP-Ku; Tue, 07 Sep 2021 04:40:54 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1878Xbol076520; Tue, 7 Sep 2021 04:40:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=mOLx2YpvYKHj/0hI0EJG9QVsSV+uUBObSIVBSwav8lM=;
 b=dETe2U6ayRioRNPv1/eS8oZeR60n+hMoWDxMmMZ2lE1ihIU414IAUIYMFxIu5bfI2Tfi
 2SPSkiocv4FMRxuGHXs5HPvoQR7RNrjjMed2+SRb8jmBwEFx6wUYwkoi4gh+UyFo6LTu
 vB/1ngi5qA8yvMKVnDDf4e9eD7u1KhKCtIoGWkhhVJidlR81OTxlgHpcY2HWjhDtVaGD
 XCxrAM2dFQo3DMgzjAA1B8m9i/bFo1qlJPddf6W0xEED1/WrFsIjKsPWYf2eoDroiR26
 wcdn0Jq+BYTnQPnhUr2Zzc7qq2G/09Egj+7C6LUQCwGrOI9kz2fjXOSDKWPyQTlFfOTr Dw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ax46mh2mc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 04:40:48 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1878YIVX080481;
 Tue, 7 Sep 2021 04:40:47 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ax46mh2kx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 04:40:47 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1878W3kv022286;
 Tue, 7 Sep 2021 08:40:45 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3av0e9cf21-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 08:40:45 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1878edpH31261168
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Sep 2021 08:40:39 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F821AE065;
 Tue,  7 Sep 2021 08:40:39 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF9FAAE053;
 Tue,  7 Sep 2021 08:40:38 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.9.165])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Sep 2021 08:40:38 +0000 (GMT)
Subject: Re: [PATCH v2 2/5] s390x: kvm: topology: interception of PTF
 instruction
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
References: <1626975764-22131-1-git-send-email-pmorel@linux.ibm.com>
 <1626975764-22131-3-git-send-email-pmorel@linux.ibm.com>
 <2792cefe-effa-7463-844e-5f6008e14b3d@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <ea31ab82-e165-e537-d26d-39fdd5ff24cd@linux.ibm.com>
Date: Tue, 7 Sep 2021 10:40:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <2792cefe-effa-7463-844e-5f6008e14b3d@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BhbdNey0m2etJUfgRzBcRcAo8oVTq5kH
X-Proofpoint-ORIG-GUID: _R3h6xxjpvAxiUQ51os3LmiW5-N3-bky
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-07_02:2021-09-03,
 2021-09-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 impostorscore=0 mlxscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2108310000 definitions=main-2109070056
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.332,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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



On 9/6/21 7:21 PM, Thomas Huth wrote:
> On 22/07/2021 19.42, Pierre Morel wrote:
>> Interception of the PTF instruction depending on the new
>> KVM_CAP_S390_CPU_TOPOLOGY KVM extension.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
>>   hw/s390x/s390-virtio-ccw.c         | 45 ++++++++++++++++++++++++++++++
>>   include/hw/s390x/s390-virtio-ccw.h |  7 +++++
>>   target/s390x/kvm/kvm.c             | 21 ++++++++++++++
>>   3 files changed, 73 insertions(+)
>>
>> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
>> index e4b18aef49..500e856974 100644
>> --- a/hw/s390x/s390-virtio-ccw.c
>> +++ b/hw/s390x/s390-virtio-ccw.c
>> @@ -404,6 +404,49 @@ static void 
>> s390_pv_prepare_reset(S390CcwMachineState *ms)
>>       s390_pv_prep_reset();
>>   }
>> +int s390_handle_ptf(S390CPU *cpu, uint8_t r1, uintptr_t ra)
>> +{
>> +    S390CcwMachineState *ms = S390_CCW_MACHINE(qdev_get_machine());
>> +    CPUS390XState *env = &cpu->env;
>> +    uint64_t reg = env->regs[r1];
>> +    uint8_t fc = reg & S390_TOPO_FC_MASK;
>> +
>> +    if (!s390_has_feat(S390_FEAT_CONFIGURATION_TOPOLOGY)) {
>> +        s390_program_interrupt(env, PGM_OPERAND, ra);
> 
> I think that should be PGM_OPERATION instead?

Right, I thought I did do the modification since v1.
Seems I forgot or it get lost :(
I will take care of this for the next time.

> 
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
>> +        env->regs[r1] = S390_PTF_REASON_DONE; > +        return 2;
>> +    case 1:    /* Vertical polarization is not supported */
>> +        env->regs[r1] = S390_PTF_REASON_NONE;
> 
> 
> This way, you're clearing the bits in the FC field. Is this intended by 
> the architecture? If I get the PoP right, it just sets the bits in the 
> RC field, but likely it should not clear the 1 in the FC field? Did you 
> try on LPAR or z/VM to see what happens there?

You are right, the FC field is not changed on LPAR.

> 
>> +        return 2;
>> +    case 2:    /* Report if a topology change report is pending */
>> +        if (ms->topology_change_report_pending) {
>> +            ms->topology_change_report_pending = false;
>> +            return 1;
>> +        }
>> +        return 0;
>> +    default:
>> +        s390_program_interrupt(env, PGM_SPECIFICATION, ra);
>> +        break;
> 
> Just a matter of taste - but you could drop the break here.

ok

> 
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static void s390_machine_reset(MachineState *machine)
>>   {
>>       S390CcwMachineState *ms = S390_CCW_MACHINE(machine);
>> @@ -433,6 +476,8 @@ static void s390_machine_reset(MachineState *machine)
>>           run_on_cpu(cs, s390_do_cpu_ipl, RUN_ON_CPU_NULL);
>>           break;
>>       case S390_RESET_MODIFIED_CLEAR:
>> +        /* clear topology_change_report pending condition on 
>> subsystem reset */
>> +        ms->topology_change_report_pending = false;
>>           /*
>>            * Susbsystem reset needs to be done before we unshare memory
>>            * and lose access to VIRTIO structures in guest memory.
>> diff --git a/include/hw/s390x/s390-virtio-ccw.h 
>> b/include/hw/s390x/s390-virtio-ccw.h
>> index 3331990e02..fbde357332 100644
>> --- a/include/hw/s390x/s390-virtio-ccw.h
>> +++ b/include/hw/s390x/s390-virtio-ccw.h
>> @@ -27,9 +27,16 @@ struct S390CcwMachineState {
>>       bool aes_key_wrap;
>>       bool dea_key_wrap;
>>       bool pv;
>> +    bool topology_change_report_pending;
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
>> index 5b1fdb55c4..9a0c13d4ac 100644
>> --- a/target/s390x/kvm/kvm.c
>> +++ b/target/s390x/kvm/kvm.c
>> @@ -97,6 +97,7 @@
>>   #define PRIV_B9_EQBS                    0x9c
>>   #define PRIV_B9_CLP                     0xa0
>> +#define PRIV_B9_PTF                     0xa2
>>   #define PRIV_B9_PCISTG                  0xd0
>>   #define PRIV_B9_PCILG                   0xd2
>>   #define PRIV_B9_RPCIT                   0xd3
>> @@ -1452,6 +1453,16 @@ static int kvm_mpcifc_service_call(S390CPU 
>> *cpu, struct kvm_run *run)
>>       }
>>   }
>> +static int kvm_handle_ptf(S390CPU *cpu, struct kvm_run *run)
>> +{
>> +    uint8_t r1 = (run->s390_sieic.ipb >> 20) & 0x0f;
>> +    uint8_t ret;
> 
> Why is ret an uint8_t ? s390_handle_ptf() returns an "int".

No reason, I must have use the same type as the line before.
I change to int.

> 
>> +    ret = s390_handle_ptf(cpu, r1, RA_IGNORED);
>> +    setcc(cpu, ret);
>> +    return 0; > +}
> 
>   Thomas
> 

Thanks for the comments,
Pierre

-- 
Pierre Morel
IBM Lab Boeblingen

