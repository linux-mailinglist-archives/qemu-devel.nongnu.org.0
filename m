Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA8644ABCC
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 11:49:36 +0100 (CET)
Received: from localhost ([::1]:33442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkOh5-0003rY-IB
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 05:49:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1mkOg5-0003Cv-JO; Tue, 09 Nov 2021 05:48:33 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:39086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1mkOg3-0005rL-J4; Tue, 09 Nov 2021 05:48:33 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A99hs99026064; 
 Tue, 9 Nov 2021 10:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : to : cc : references : from : subject : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=/ag48x983Ws5nAlS7F7/wRkDy5ERwopH8RU87pA1gvM=;
 b=eluLVRWWRJ8Oj64F+zJkRxef8VGyLs62/2Js28LpnXydlNlximHz8hQ9Ee+30Q/LCvLB
 BLl+HMPo+GqfWtEOi2X2gapvvyGXCO5zji3MOJxqAr+EkQVKEzx/nMdVZ1HqyzMRGWi8
 FLSeYijZX6s48ldCtukVu0akpg8oPUzBHGPemgdpcRfJWVXbD7kG3+b67Pc/JoJJxlkt
 TkLQD5D7DZ1DPT4XmiVZxhUOa9HGhbaLzb7H0XJto+y12Q7BYPDJT5TkYfOv1xc+d3g+
 hDnL2rKBmxd2+99DhBqM9jrQPJ3Jav4LGFsBEJ9i91ct1JjmPc5g2hkb8PqrhTVMqd59 Cg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c7pkv9arp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 10:48:29 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A9AgVsV028202;
 Tue, 9 Nov 2021 10:48:28 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c7pkv9ar5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 10:48:28 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A9AdZGw022006;
 Tue, 9 Nov 2021 10:48:26 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 3c5hb9cuvu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 10:48:26 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1A9AfkR733358104
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Nov 2021 10:41:46 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2038DAE053;
 Tue,  9 Nov 2021 10:48:23 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0925AE063;
 Tue,  9 Nov 2021 10:48:22 +0000 (GMT)
Received: from [9.145.25.95] (unknown [9.145.25.95])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  9 Nov 2021 10:48:22 +0000 (GMT)
Message-ID: <548d32dd-e087-9068-26c4-5facb44392a9@linux.ibm.com>
Date: Tue, 9 Nov 2021 11:48:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 Collin Walling <walling@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20211108211311.33834-1-walling@linux.ibm.com>
 <430b5c19-73dd-a006-8999-925fd757dbe2@de.ibm.com>
From: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH v2] s390x: kvm: adjust diag318 resets to retain data
In-Reply-To: <430b5c19-73dd-a006-8999-925fd757dbe2@de.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: q2yF2p4J0w1GtMkQjUaegqANRgtv9291
X-Proofpoint-ORIG-GUID: Izm1gpZtkNtipglbFEv80nIdj1VU9KwO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-09_03,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111090063
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.364,
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
Cc: thuth@redhat.com, cohuck@redhat.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/21 08:32, Christian Borntraeger wrote:
> 
> 
> Am 08.11.21 um 22:13 schrieb Collin Walling:
>> The CPNC portion of the diag 318 data is erroneously reset during an
>> initial CPU reset caused by SIGP. Let's go ahead and relocate the
>> diag318_info field within the CPUS390XState struct such that it is
>> only zeroed during a clear reset. This way, the CPNC will be retained
>> for each VCPU in the configuration after the diag 318 instruction
>> has been invoked.
>>
>> Additionally, the diag 318 data reset is handled via the CPU reset
>> code during a clear reset. This means some of the diag 318-specific
>> reset code can now be removed.
>>
>> Signed-off-by: Collin Walling <walling@linux.ibm.com>
>> Fixes: fabdada9357b ("s390: guest support for diagnose 0x318")
>> Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
> 
> It would be good to add at least a comment in the diag308 handlers
> where the value of cpnc is resetted during the resets that Janosch
> mentioned.
>>
>> ---
>>
>> Changelog:
>>
>> 	v2
>> 	- handler uses run_on_cpu again
>> 	- reworded commit message slightly
>> 	- added fixes and reported-by tags
>>
>> ---
>>    hw/s390x/s390-virtio-ccw.c   |  3 ---
>>    target/s390x/cpu-sysemu.c    |  7 -------
>>    target/s390x/cpu.h           |  5 ++---
>>    target/s390x/kvm/kvm.c       | 14 +++++---------
>>    target/s390x/kvm/kvm_s390x.h |  1 -
>>    5 files changed, 7 insertions(+), 23 deletions(-)
>>
>> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
>> index 653587ea62..51dcb83b0c 100644
>> --- a/hw/s390x/s390-virtio-ccw.c
>> +++ b/hw/s390x/s390-virtio-ccw.c
>> @@ -489,9 +489,6 @@ static void s390_machine_reset(MachineState *machine)
>>            g_assert_not_reached();
>>        }
>>    
>> -    CPU_FOREACH(t) {
>> -        run_on_cpu(t, s390_do_cpu_set_diag318, RUN_ON_CPU_HOST_ULONG(0));
>> -    }

This needs to stay for the move to the clear reset area to work on other 
diag308 subcodes. The reset will then be done twice for the clear reset 
but that's fine.

Moving the diag318 data into the clear area means we only reset it on a 
full cpu reset which is only done for diagnose 308 subcode 0 and maybe a 
QEMU reset, I didn't fully follow the code there.

The other subcodes do an initial reset on the calling cpu and normal 
resets on the others or just normal resets which don't touch the 318 
data if we move it into the clear reset area.

Or did I miss something fundamental here?


>>        s390_ipl_clear_reset_request();
>>    }
>>    
>> diff --git a/target/s390x/cpu-sysemu.c b/target/s390x/cpu-sysemu.c
>> index 5471e01ee8..6d9f6d4402 100644
>> --- a/target/s390x/cpu-sysemu.c
>> +++ b/target/s390x/cpu-sysemu.c
>> @@ -299,10 +299,3 @@ void s390_enable_css_support(S390CPU *cpu)
>>            kvm_s390_enable_css_support(cpu);
>>        }
>>    }
>> -
>> -void s390_do_cpu_set_diag318(CPUState *cs, run_on_cpu_data arg)
>> -{
>> -    if (kvm_enabled()) {
>> -        kvm_s390_set_diag318(cs, arg.host_ulong);
>> -    }
>> -}
>> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
>> index 3153d053e9..1b94b91d87 100644
>> --- a/target/s390x/cpu.h
>> +++ b/target/s390x/cpu.h
>> @@ -63,6 +63,8 @@ struct CPUS390XState {
>>        uint64_t etoken;       /* etoken */
>>        uint64_t etoken_extension; /* etoken extension */
>>    
>> +    uint64_t diag318_info;
>> +
>>        /* Fields up to this point are not cleared by initial CPU reset */
>>        struct {} start_initial_reset_fields;
>>    
>> @@ -118,8 +120,6 @@ struct CPUS390XState {
>>        uint16_t external_call_addr;
>>        DECLARE_BITMAP(emergency_signals, S390_MAX_CPUS);
>>    
>> -    uint64_t diag318_info;
>> -
>>    #if !defined(CONFIG_USER_ONLY)
>>        uint64_t tlb_fill_tec;   /* translation exception code during tlb_fill */
>>        int tlb_fill_exc;        /* exception number seen during tlb_fill */
>> @@ -780,7 +780,6 @@ int s390_set_memory_limit(uint64_t new_limit, uint64_t *hw_limit);
>>    void s390_set_max_pagesize(uint64_t pagesize, Error **errp);
>>    void s390_cmma_reset(void);
>>    void s390_enable_css_support(S390CPU *cpu);
>> -void s390_do_cpu_set_diag318(CPUState *cs, run_on_cpu_data arg);
>>    int s390_assign_subch_ioeventfd(EventNotifier *notifier, uint32_t sch_id,
>>                                    int vq, bool assign);
>>    #ifndef CONFIG_USER_ONLY
>> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
>> index 5b1fdb55c4..8970d9ca55 100644
>> --- a/target/s390x/kvm/kvm.c
>> +++ b/target/s390x/kvm/kvm.c
>> @@ -1576,16 +1576,13 @@ static int handle_sw_breakpoint(S390CPU *cpu, struct kvm_run *run)
>>        return -ENOENT;
>>    }
>>    
>> -void kvm_s390_set_diag318(CPUState *cs, uint64_t diag318_info)
>> +static void set_diag_318(CPUState *cs, run_on_cpu_data arg)
>>    {
>>        CPUS390XState *env = &S390_CPU(cs)->env;
>>    
>> -    /* Feat bit is set only if KVM supports sync for diag318 */
>> -    if (s390_has_feat(S390_FEAT_DIAG_318)) {
>> -        env->diag318_info = diag318_info;
>> -        cs->kvm_run->s.regs.diag318 = diag318_info;
>> -        cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_DIAG318;
>> -    }
>> +    env->diag318_info = arg.host_ulong;
>> +    cs->kvm_run->s.regs.diag318 = arg.host_ulong;
>> +    cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_DIAG318;
>>    }
>>    
>>    static void handle_diag_318(S390CPU *cpu, struct kvm_run *run)
>> @@ -1604,8 +1601,7 @@ static void handle_diag_318(S390CPU *cpu, struct kvm_run *run)
>>        }
>>    
>>        CPU_FOREACH(t) {
>> -        run_on_cpu(t, s390_do_cpu_set_diag318,
>> -                   RUN_ON_CPU_HOST_ULONG(diag318_info));
>> +        run_on_cpu(t, set_diag_318, RUN_ON_CPU_HOST_ULONG(diag318_info));
>>        }
>>    }
>>    
>> diff --git a/target/s390x/kvm/kvm_s390x.h b/target/s390x/kvm/kvm_s390x.h
>> index 05a5e1e6f4..8c244ee84d 100644
>> --- a/target/s390x/kvm/kvm_s390x.h
>> +++ b/target/s390x/kvm/kvm_s390x.h
>> @@ -44,6 +44,5 @@ void kvm_s390_set_max_pagesize(uint64_t pagesize, Error **errp);
>>    void kvm_s390_crypto_reset(void);
>>    void kvm_s390_restart_interrupt(S390CPU *cpu);
>>    void kvm_s390_stop_interrupt(S390CPU *cpu);
>> -void kvm_s390_set_diag318(CPUState *cs, uint64_t diag318_info);
>>    
>>    #endif /* KVM_S390X_H */
>>


