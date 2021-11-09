Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B94C544A7CE
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 08:46:59 +0100 (CET)
Received: from localhost ([::1]:45316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkLqM-0001hI-T0
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 02:46:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mkLcg-0003Q7-MB; Tue, 09 Nov 2021 02:32:50 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:58574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mkLcd-00013T-OB; Tue, 09 Nov 2021 02:32:50 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A96Dj6t025412; 
 Tue, 9 Nov 2021 07:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=YAXJYeSUl9J6WowR0t4CNTYPZaI+8u+jebxuMJ0dXJM=;
 b=VO8evIT76xMNhD6EiOBX3uK0wSkW7laYQusnd4JbGt64lzi/lqPlipRwHoyQzDsQAIUz
 PHwKv9xHIaRCGqmfCXiyhUQ+WBvh8Mi2njkXX/QRjwZvAVpB84f8B29WG/pTP0HuVbD+
 FpGxodXwgLl1wjVZHmUNV94aAz2xlHl2FFnSG4iijuInxYcLdUULXMUJJaJ+Ko/EPCIn
 Zul1YYfdl++6aCWMzQffcL1sFSYk4zxnAMHGTx+LJeYkKul5WOhFFuNZiCHkUsIM9fIS
 aE7npACqJ4cbk14miG0fT2A5KWZGq0IVFNPRj5kFmhyosh+gZE/V2rP+K+ZyEZ5Ojaoz 5w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c7khh1ppt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 07:32:45 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A97I9PI027752;
 Tue, 9 Nov 2021 07:32:44 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c7khh1pnw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 07:32:44 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A97WO3q017020;
 Tue, 9 Nov 2021 07:32:42 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 3c5gyju8nn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 07:32:42 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A97Wdtx24772994
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Nov 2021 07:32:39 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EC1D242045;
 Tue,  9 Nov 2021 07:32:38 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 961BF4204B;
 Tue,  9 Nov 2021 07:32:38 +0000 (GMT)
Received: from [9.171.48.35] (unknown [9.171.48.35])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  9 Nov 2021 07:32:38 +0000 (GMT)
Message-ID: <430b5c19-73dd-a006-8999-925fd757dbe2@de.ibm.com>
Date: Tue, 9 Nov 2021 08:32:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] s390x: kvm: adjust diag318 resets to retain data
Content-Language: en-US
To: Collin Walling <walling@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20211108211311.33834-1-walling@linux.ibm.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
In-Reply-To: <20211108211311.33834-1-walling@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: y2rmpz7QdILgWWQJRu2NMtqkUniiLo5L
X-Proofpoint-ORIG-GUID: rNOsmP5WseHoIXPjEjZ0yh4fgZFZF8Sk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-09_01,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111090043
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
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
Cc: thuth@redhat.com, cohuck@redhat.com, frankja@linux.ibm.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 08.11.21 um 22:13 schrieb Collin Walling:
> The CPNC portion of the diag 318 data is erroneously reset during an
> initial CPU reset caused by SIGP. Let's go ahead and relocate the
> diag318_info field within the CPUS390XState struct such that it is
> only zeroed during a clear reset. This way, the CPNC will be retained
> for each VCPU in the configuration after the diag 318 instruction
> has been invoked.
> 
> Additionally, the diag 318 data reset is handled via the CPU reset
> code during a clear reset. This means some of the diag 318-specific
> reset code can now be removed.
> 
> Signed-off-by: Collin Walling <walling@linux.ibm.com>
> Fixes: fabdada9357b ("s390: guest support for diagnose 0x318")
> Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>

It would be good to add at least a comment in the diag308 handlers
where the value of cpnc is resetted during the resets that Janosch
mentioned.
> 
> ---
> 
> Changelog:
> 
> 	v2
> 	- handler uses run_on_cpu again
> 	- reworded commit message slightly
> 	- added fixes and reported-by tags
> 
> ---
>   hw/s390x/s390-virtio-ccw.c   |  3 ---
>   target/s390x/cpu-sysemu.c    |  7 -------
>   target/s390x/cpu.h           |  5 ++---
>   target/s390x/kvm/kvm.c       | 14 +++++---------
>   target/s390x/kvm/kvm_s390x.h |  1 -
>   5 files changed, 7 insertions(+), 23 deletions(-)
> 
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index 653587ea62..51dcb83b0c 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -489,9 +489,6 @@ static void s390_machine_reset(MachineState *machine)
>           g_assert_not_reached();
>       }
>   
> -    CPU_FOREACH(t) {
> -        run_on_cpu(t, s390_do_cpu_set_diag318, RUN_ON_CPU_HOST_ULONG(0));
> -    }
>       s390_ipl_clear_reset_request();
>   }
>   
> diff --git a/target/s390x/cpu-sysemu.c b/target/s390x/cpu-sysemu.c
> index 5471e01ee8..6d9f6d4402 100644
> --- a/target/s390x/cpu-sysemu.c
> +++ b/target/s390x/cpu-sysemu.c
> @@ -299,10 +299,3 @@ void s390_enable_css_support(S390CPU *cpu)
>           kvm_s390_enable_css_support(cpu);
>       }
>   }
> -
> -void s390_do_cpu_set_diag318(CPUState *cs, run_on_cpu_data arg)
> -{
> -    if (kvm_enabled()) {
> -        kvm_s390_set_diag318(cs, arg.host_ulong);
> -    }
> -}
> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
> index 3153d053e9..1b94b91d87 100644
> --- a/target/s390x/cpu.h
> +++ b/target/s390x/cpu.h
> @@ -63,6 +63,8 @@ struct CPUS390XState {
>       uint64_t etoken;       /* etoken */
>       uint64_t etoken_extension; /* etoken extension */
>   
> +    uint64_t diag318_info;
> +
>       /* Fields up to this point are not cleared by initial CPU reset */
>       struct {} start_initial_reset_fields;
>   
> @@ -118,8 +120,6 @@ struct CPUS390XState {
>       uint16_t external_call_addr;
>       DECLARE_BITMAP(emergency_signals, S390_MAX_CPUS);
>   
> -    uint64_t diag318_info;
> -
>   #if !defined(CONFIG_USER_ONLY)
>       uint64_t tlb_fill_tec;   /* translation exception code during tlb_fill */
>       int tlb_fill_exc;        /* exception number seen during tlb_fill */
> @@ -780,7 +780,6 @@ int s390_set_memory_limit(uint64_t new_limit, uint64_t *hw_limit);
>   void s390_set_max_pagesize(uint64_t pagesize, Error **errp);
>   void s390_cmma_reset(void);
>   void s390_enable_css_support(S390CPU *cpu);
> -void s390_do_cpu_set_diag318(CPUState *cs, run_on_cpu_data arg);
>   int s390_assign_subch_ioeventfd(EventNotifier *notifier, uint32_t sch_id,
>                                   int vq, bool assign);
>   #ifndef CONFIG_USER_ONLY
> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
> index 5b1fdb55c4..8970d9ca55 100644
> --- a/target/s390x/kvm/kvm.c
> +++ b/target/s390x/kvm/kvm.c
> @@ -1576,16 +1576,13 @@ static int handle_sw_breakpoint(S390CPU *cpu, struct kvm_run *run)
>       return -ENOENT;
>   }
>   
> -void kvm_s390_set_diag318(CPUState *cs, uint64_t diag318_info)
> +static void set_diag_318(CPUState *cs, run_on_cpu_data arg)
>   {
>       CPUS390XState *env = &S390_CPU(cs)->env;
>   
> -    /* Feat bit is set only if KVM supports sync for diag318 */
> -    if (s390_has_feat(S390_FEAT_DIAG_318)) {
> -        env->diag318_info = diag318_info;
> -        cs->kvm_run->s.regs.diag318 = diag318_info;
> -        cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_DIAG318;
> -    }
> +    env->diag318_info = arg.host_ulong;
> +    cs->kvm_run->s.regs.diag318 = arg.host_ulong;
> +    cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_DIAG318;
>   }
>   
>   static void handle_diag_318(S390CPU *cpu, struct kvm_run *run)
> @@ -1604,8 +1601,7 @@ static void handle_diag_318(S390CPU *cpu, struct kvm_run *run)
>       }
>   
>       CPU_FOREACH(t) {
> -        run_on_cpu(t, s390_do_cpu_set_diag318,
> -                   RUN_ON_CPU_HOST_ULONG(diag318_info));
> +        run_on_cpu(t, set_diag_318, RUN_ON_CPU_HOST_ULONG(diag318_info));
>       }
>   }
>   
> diff --git a/target/s390x/kvm/kvm_s390x.h b/target/s390x/kvm/kvm_s390x.h
> index 05a5e1e6f4..8c244ee84d 100644
> --- a/target/s390x/kvm/kvm_s390x.h
> +++ b/target/s390x/kvm/kvm_s390x.h
> @@ -44,6 +44,5 @@ void kvm_s390_set_max_pagesize(uint64_t pagesize, Error **errp);
>   void kvm_s390_crypto_reset(void);
>   void kvm_s390_restart_interrupt(S390CPU *cpu);
>   void kvm_s390_stop_interrupt(S390CPU *cpu);
> -void kvm_s390_set_diag318(CPUState *cs, uint64_t diag318_info);
>   
>   #endif /* KVM_S390X_H */
> 

