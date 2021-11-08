Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E82449B5D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 19:04:52 +0100 (CET)
Received: from localhost ([::1]:47948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk90l-000797-2K
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 13:04:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walling@linux.ibm.com>)
 id 1mk8zQ-0006MJ-7j; Mon, 08 Nov 2021 13:03:28 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:53584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walling@linux.ibm.com>)
 id 1mk8zN-000687-EF; Mon, 08 Nov 2021 13:03:27 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A8GVnVt014026; 
 Mon, 8 Nov 2021 18:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=TE3mv8DKP8y1ikyASSPNP66IuzAKxklkq77aPGG6E1Q=;
 b=R++gnlMZ30NcjPX8GsgkL7BUXCTGlGoRc4omnJcEfZ8CTyhDQ1zh5Q/XtKKgfRhxjjgC
 PDV2frJegTLZfbStRurdbyqlfDG3FSOEXV4mclt/w7nxU3fo5rwRlkBDiJptY0vy2jT+
 yd55SfbzCJF9WZ3dksi1gjVNMIwtfXcHQsOy4Y7/wjAziy3hqP3Y2Uupr6QCYOsG04Ci
 frTComWhpFvUBTTdjIEhnP/g5QA6VptGAvGkWMAAlGTuoVZWnSu2w1WONyrBBQeLXReJ
 TXh/OKdc1TmKRHbxihdNrWFDEhVVoi4RSkllJ6N8uW2XMwUM1ndj8oPhfSNiOkyeZzkH FQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c6aspm73f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 18:03:19 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A8I22Ok013338;
 Mon, 8 Nov 2021 18:03:19 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c6aspm737-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 18:03:19 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A8I2bXo016037;
 Mon, 8 Nov 2021 18:03:18 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01dal.us.ibm.com with ESMTP id 3c5hbb1t5s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 18:03:18 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A8I3GxW24379764
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Nov 2021 18:03:17 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B3C0B28064;
 Mon,  8 Nov 2021 18:03:16 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39BA82805E;
 Mon,  8 Nov 2021 18:03:16 +0000 (GMT)
Received: from [9.160.104.209] (unknown [9.160.104.209])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  8 Nov 2021 18:03:16 +0000 (GMT)
Message-ID: <de34b181-1a4f-1536-f305-8ab0c525d15a@linux.ibm.com>
Date: Mon, 8 Nov 2021 13:03:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] s390x: kvm: adjust diag318 resets to retain data
Content-Language: en-US
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20211105224646.803661-1-walling@linux.ibm.com>
 <055031a8-64ad-63d0-0345-69d45b760a7a@linux.ibm.com>
 <d2e2aa58-f572-ae7f-d810-848041283af4@de.ibm.com>
From: Collin Walling <walling@linux.ibm.com>
In-Reply-To: <d2e2aa58-f572-ae7f-d810-848041283af4@de.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4XyaroABaODp2XbS55TdNP5dB57V2M0K
X-Proofpoint-GUID: ynTeX1nCgv-XAvVcvBs9xMrIzkkt__mG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-08_06,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 mlxscore=0 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 spamscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111080109
Received-SPF: pass client-ip=148.163.158.5; envelope-from=walling@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.06,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: thuth@redhat.com, cohuck@redhat.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/8/21 12:40, Christian Borntraeger wrote:
> 
> 
> Am 08.11.21 um 18:02 schrieb Janosch Frank:
>> On 11/5/21 23:46, Collin Walling wrote:
>>> The CPNC portion of the diag 318 data is erroneously reset during an
>>> initial CPU reset caused by SIGP. Let's go ahead and relocate the
>>> diag318_info field within the CPUS390XState struct such that it is
>>> only zeroed during a clear reset. This way, the CPNC will be retained
>>> for each VCPU in the configuration after the diag 318 instruction
>>> has been invoked by the kernel.
>>>
>>> Additionally, the diag 318 data reset is handled via the CPU reset
>>> code. The set_diag318 code can be merged into the handler function
>>> and the helper functions can consequently be removed.
>>>
>>> Signed-off-by: Collin Walling <walling@linux.ibm.com>
>>
>> Fixes tag?
>>
>>> ---
>>>   hw/s390x/s390-virtio-ccw.c   |  3 ---
>>>   target/s390x/cpu-sysemu.c    |  7 -------
>>>   target/s390x/cpu.h           |  5 ++---
>>>   target/s390x/kvm/kvm.c       | 19 +++++--------------
>>>   target/s390x/kvm/kvm_s390x.h |  1 -
>>>   5 files changed, 7 insertions(+), 28 deletions(-)
>>>
>>> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
>>> index 653587ea62..51dcb83b0c 100644
>>> --- a/hw/s390x/s390-virtio-ccw.c
>>> +++ b/hw/s390x/s390-virtio-ccw.c
>>> @@ -489,9 +489,6 @@ static void s390_machine_reset(MachineState
>>> *machine)
>>>           g_assert_not_reached();
>>>       }
>>> -    CPU_FOREACH(t) {
>>> -        run_on_cpu(t, s390_do_cpu_set_diag318,
>>> RUN_ON_CPU_HOST_ULONG(0));
>>> -    }
>>>       s390_ipl_clear_reset_request();
>>>   }
>>> diff --git a/target/s390x/cpu-sysemu.c b/target/s390x/cpu-sysemu.c
>>> index 5471e01ee8..6d9f6d4402 100644
>>> --- a/target/s390x/cpu-sysemu.c
>>> +++ b/target/s390x/cpu-sysemu.c
>>> @@ -299,10 +299,3 @@ void s390_enable_css_support(S390CPU *cpu)
>>>           kvm_s390_enable_css_support(cpu);
>>>       }
>>>   }
>>> -
>>> -void s390_do_cpu_set_diag318(CPUState *cs, run_on_cpu_data arg)
>>> -{
>>> -    if (kvm_enabled()) {
>>> -        kvm_s390_set_diag318(cs, arg.host_ulong);
>>> -    }
>>> -}
>>> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
>>> index 3153d053e9..1b94b91d87 100644
>>> --- a/target/s390x/cpu.h
>>> +++ b/target/s390x/cpu.h
>>> @@ -63,6 +63,8 @@ struct CPUS390XState {
>>>       uint64_t etoken;       /* etoken */
>>>       uint64_t etoken_extension; /* etoken extension */
>>> +    uint64_t diag318_info;
>>
>> Before we brought this upstream I had a conversation with the
>> architect because I was confused about this myself. He said: SIGP does
>> not affect 318 data but all 308 subcode resets do (0,1,3,4).
>>
>> Hence I'd much rather move this out of the automatic reset areas and
>> clear it by hand for diag308 resets. And then add a big comment with a
>> warning to never move this into the automatic clearing areas.
> 
> the automatic cleaning areas are also used for the big hammer
> system_reset in QEMU which acts like a power cycle. And those fields are
> initialized always on such events.
>  So you cannot avoid clearing this for the big hammer things anyway.

The data needs to be reset during a clear reset as well. Correct me if
I'm wrong here: the 308 resets will invoke the qemu reset, which will
eventually invoke the machine reset. The s390_machine_reset code ends
with a clear reset request. I believe having the 318 field in the struct
accomplishes what we need: it is reset on clear and 308 subcodes and
avoids being tampered by SIGP.

>>
>>> +
>>>       /* Fields up to this point are not cleared by initial CPU reset */
>>>       struct {} start_initial_reset_fields;
>>> @@ -118,8 +120,6 @@ struct CPUS390XState {
>>>       uint16_t external_call_addr;
>>>       DECLARE_BITMAP(emergency_signals, S390_MAX_CPUS);
>>> -    uint64_t diag318_info;
>>> -
>>>   #if !defined(CONFIG_USER_ONLY)
>>>       uint64_t tlb_fill_tec;   /* translation exception code during
>>> tlb_fill */
>>>       int tlb_fill_exc;        /* exception number seen during
>>> tlb_fill */
>>> @@ -780,7 +780,6 @@ int s390_set_memory_limit(uint64_t new_limit,
>>> uint64_t *hw_limit);
>>>   void s390_set_max_pagesize(uint64_t pagesize, Error **errp);
>>>   void s390_cmma_reset(void);
>>>   void s390_enable_css_support(S390CPU *cpu);
>>> -void s390_do_cpu_set_diag318(CPUState *cs, run_on_cpu_data arg);
>>>   int s390_assign_subch_ioeventfd(EventNotifier *notifier, uint32_t
>>> sch_id,
>>>                                   int vq, bool assign);
>>>   #ifndef CONFIG_USER_ONLY
>>> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
>>> index 5b1fdb55c4..ed9c477b6f 100644
>>> --- a/target/s390x/kvm/kvm.c
>>> +++ b/target/s390x/kvm/kvm.c
>>> @@ -1576,18 +1576,6 @@ static int handle_sw_breakpoint(S390CPU *cpu,
>>> struct kvm_run *run)
>>>       return -ENOENT;
>>>   }
>>> -void kvm_s390_set_diag318(CPUState *cs, uint64_t diag318_info)
>>> -{
>>> -    CPUS390XState *env = &S390_CPU(cs)->env;
>>> -
>>> -    /* Feat bit is set only if KVM supports sync for diag318 */
>>> -    if (s390_has_feat(S390_FEAT_DIAG_318)) {
>>> -        env->diag318_info = diag318_info;
>>> -        cs->kvm_run->s.regs.diag318 = diag318_info;
>>> -        cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_DIAG318;
>>> -    }
>>> -}
>>> -
>>>   static void handle_diag_318(S390CPU *cpu, struct kvm_run *run)
>>>   {
>>>       uint64_t reg = (run->s390_sieic.ipa & 0x00f0) >> 4;
>>> @@ -1604,8 +1592,11 @@ static void handle_diag_318(S390CPU *cpu,
>>> struct kvm_run *run)
>>>       }
>>>       CPU_FOREACH(t) {
>>> -        run_on_cpu(t, s390_do_cpu_set_diag318,
>>> -                   RUN_ON_CPU_HOST_ULONG(diag318_info));
>>> +        CPUS390XState *env = &S390_CPU(t)->env;
>>> +
>>> +        env->diag318_info = diag318_info;
>>> +        t->kvm_run->s.regs.diag318 = diag318_info;
>>> +        t->kvm_run->kvm_dirty_regs |= KVM_SYNC_DIAG318;
>>>       }
>>>   }
>>> diff --git a/target/s390x/kvm/kvm_s390x.h b/target/s390x/kvm/kvm_s390x.h
>>> index 05a5e1e6f4..8c244ee84d 100644
>>> --- a/target/s390x/kvm/kvm_s390x.h
>>> +++ b/target/s390x/kvm/kvm_s390x.h
>>> @@ -44,6 +44,5 @@ void kvm_s390_set_max_pagesize(uint64_t pagesize,
>>> Error **errp);
>>>   void kvm_s390_crypto_reset(void);
>>>   void kvm_s390_restart_interrupt(S390CPU *cpu);
>>>   void kvm_s390_stop_interrupt(S390CPU *cpu);
>>> -void kvm_s390_set_diag318(CPUState *cs, uint64_t diag318_info);
>>>   #endif /* KVM_S390X_H */
>>>
>>
> 


-- 
Regards,
Collin

Stay safe and stay healthy

