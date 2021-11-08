Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC75D449A82
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 18:09:47 +0100 (CET)
Received: from localhost ([::1]:54328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk89S-00065j-EK
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 12:09:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1mk82j-0007GY-3A; Mon, 08 Nov 2021 12:02:49 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:42548
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1mk82g-0001YP-Oc; Mon, 08 Nov 2021 12:02:48 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A8GVxDY012799; 
 Mon, 8 Nov 2021 17:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : to : cc : references : from : subject : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=00/8cLrvIFcMY0bf0JxpCyoJHUM0uKcY6slfQe0tX7Q=;
 b=saroT+ttjN4qUARB0PWSGbgH3Q3VQnVBL4Cz2ggNsBEPmao50a1moTX3peTNPaaIrUbx
 zG6bxpwWunkCvnwbnHnRdR3DyZUg4um7faX5iqulIXVDt9QTGOi8xY68AL0XrDN04ZDt
 kRYYOsuwZgum0Yero4fD5uGACypUKK9Oo+zUni29m10AXPNvJdhmLA3uOphceIhI47Bp
 cxqDOVeX9LrHly9hs9zRDLr1gF41VgLP1POo+H21yCUrKvYJVjPpVNtZ0PhGPALmsSk1
 Ce5eq1DB+PdHlgOqJhpU1Gk7LwaSdnBRYCv3Y5yHKb4t8Z4Kh0PM1gntfKf/FpQoJhqP Dw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c66u1e3wn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 17:02:43 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A8GWeY2019286;
 Mon, 8 Nov 2021 17:02:42 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c66u1e3vq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 17:02:42 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A8GlpOa019231;
 Mon, 8 Nov 2021 17:02:41 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma02fra.de.ibm.com with ESMTP id 3c5hb971mc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 17:02:40 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1A8Gu2p551053014
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Nov 2021 16:56:02 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 895A742049;
 Mon,  8 Nov 2021 17:02:37 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 19DDE4204C;
 Mon,  8 Nov 2021 17:02:37 +0000 (GMT)
Received: from [9.145.151.159] (unknown [9.145.151.159])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  8 Nov 2021 17:02:37 +0000 (GMT)
Message-ID: <055031a8-64ad-63d0-0345-69d45b760a7a@linux.ibm.com>
Date: Mon, 8 Nov 2021 18:02:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Collin Walling <walling@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20211105224646.803661-1-walling@linux.ibm.com>
From: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH] s390x: kvm: adjust diag318 resets to retain data
In-Reply-To: <20211105224646.803661-1-walling@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bh-aDVjMVNK_Rs1vKwDS-QL3M9vt9-ZG
X-Proofpoint-ORIG-GUID: NykAd7uu2TDxh6TqTev3B8Mhm525iUHJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-08_05,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1011 spamscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111080103
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: borntraeger@de.ibm.com, thuth@redhat.com, cohuck@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/5/21 23:46, Collin Walling wrote:
> The CPNC portion of the diag 318 data is erroneously reset during an
> initial CPU reset caused by SIGP. Let's go ahead and relocate the
> diag318_info field within the CPUS390XState struct such that it is
> only zeroed during a clear reset. This way, the CPNC will be retained
> for each VCPU in the configuration after the diag 318 instruction
> has been invoked by the kernel.
> 
> Additionally, the diag 318 data reset is handled via the CPU reset
> code. The set_diag318 code can be merged into the handler function
> and the helper functions can consequently be removed.
> 
> Signed-off-by: Collin Walling <walling@linux.ibm.com>

Fixes tag?

> ---
>   hw/s390x/s390-virtio-ccw.c   |  3 ---
>   target/s390x/cpu-sysemu.c    |  7 -------
>   target/s390x/cpu.h           |  5 ++---
>   target/s390x/kvm/kvm.c       | 19 +++++--------------
>   target/s390x/kvm/kvm_s390x.h |  1 -
>   5 files changed, 7 insertions(+), 28 deletions(-)
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

Before we brought this upstream I had a conversation with the architect 
because I was confused about this myself. He said: SIGP does not affect 
318 data but all 308 subcode resets do (0,1,3,4).

Hence I'd much rather move this out of the automatic reset areas and 
clear it by hand for diag308 resets. And then add a big comment with a 
warning to never move this into the automatic clearing areas.

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
> index 5b1fdb55c4..ed9c477b6f 100644
> --- a/target/s390x/kvm/kvm.c
> +++ b/target/s390x/kvm/kvm.c
> @@ -1576,18 +1576,6 @@ static int handle_sw_breakpoint(S390CPU *cpu, struct kvm_run *run)
>       return -ENOENT;
>   }
>   
> -void kvm_s390_set_diag318(CPUState *cs, uint64_t diag318_info)
> -{
> -    CPUS390XState *env = &S390_CPU(cs)->env;
> -
> -    /* Feat bit is set only if KVM supports sync for diag318 */
> -    if (s390_has_feat(S390_FEAT_DIAG_318)) {
> -        env->diag318_info = diag318_info;
> -        cs->kvm_run->s.regs.diag318 = diag318_info;
> -        cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_DIAG318;
> -    }
> -}
> -
>   static void handle_diag_318(S390CPU *cpu, struct kvm_run *run)
>   {
>       uint64_t reg = (run->s390_sieic.ipa & 0x00f0) >> 4;
> @@ -1604,8 +1592,11 @@ static void handle_diag_318(S390CPU *cpu, struct kvm_run *run)
>       }
>   
>       CPU_FOREACH(t) {
> -        run_on_cpu(t, s390_do_cpu_set_diag318,
> -                   RUN_ON_CPU_HOST_ULONG(diag318_info));
> +        CPUS390XState *env = &S390_CPU(t)->env;
> +
> +        env->diag318_info = diag318_info;
> +        t->kvm_run->s.regs.diag318 = diag318_info;
> +        t->kvm_run->kvm_dirty_regs |= KVM_SYNC_DIAG318;
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


