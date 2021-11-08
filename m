Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08448447B97
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 09:10:19 +0100 (CET)
Received: from localhost ([::1]:44718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjzjO-0001ZD-5V
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 03:10:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mjzgw-0007Vl-8O; Mon, 08 Nov 2021 03:07:46 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:34122
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mjzgu-0002tb-6O; Mon, 08 Nov 2021 03:07:46 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A87cxOf026078; 
 Mon, 8 Nov 2021 08:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=2kfj/GoF29jYFVRyvxtAM6ZVxEhU/x0nMEnJ4ZNklHA=;
 b=QvgrD2a4NHY75SDDCHzCU+xsjA6F1gz7VEaiUfaV4gQK3JZnHavG7TXV4L3lH0sMoQ3Z
 bTg43OZ8o8b3HJ6ETjppgWSYDAKn5b7pvbod78j3zBXvimOKKK0fSJSWATeEiOc5bX6p
 WI4BQPivuFWBP9MutI7VLHUJFHFF8WBn4pjdLTPx1b9+d60jVY2ShDl7ahwBUwmuUpQM
 I6vYs25ICSuXLqmGutlcf14AsKKirqzHtT+DsKZ9TRp7/v+QE2+mewSb3taJrDjLwnDp
 aUoUDuQFsR/55ucVV6STKfCirHrrkshgODgr4ecQsJRAARcxRHNhxWSm6XOlLetnN8FG zg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c6b7jmemj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 08:07:33 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A87jD1i005455;
 Mon, 8 Nov 2021 08:07:32 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c6b7jmekw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 08:07:32 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A887Ogw022497;
 Mon, 8 Nov 2021 08:07:30 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3c5gyj3b5d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 08:07:30 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1A880pML56361308
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Nov 2021 08:00:51 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 133994C040;
 Mon,  8 Nov 2021 08:07:28 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C35A24C058;
 Mon,  8 Nov 2021 08:07:27 +0000 (GMT)
Received: from [9.171.16.13] (unknown [9.171.16.13])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  8 Nov 2021 08:07:27 +0000 (GMT)
Message-ID: <d552f5df-2a1f-21d2-2a02-5df512a0d77d@de.ibm.com>
Date: Mon, 8 Nov 2021 09:07:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] s390x: kvm: adjust diag318 resets to retain data
Content-Language: en-US
To: Collin Walling <walling@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20211105224646.803661-1-walling@linux.ibm.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
In-Reply-To: <20211105224646.803661-1-walling@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _d67COlXCloxx7Ocbpo6lWJigyHlJUWq
X-Proofpoint-ORIG-GUID: O4JpRDD--Y8XHFcXeGJHQTGWzQE0uIDs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-08_03,2021-11-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011
 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111080049
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
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



Am 05.11.21 um 23:46 schrieb Collin Walling:
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
[..]
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

The move makes perfect sense.


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

I am not sure if this part works fine. What happens if
another CPU is currently in SIE (not stopped).
Then this change will be not visible in that CPU and in
fact this change will be overwritten when the CPU exits to QEMU.

