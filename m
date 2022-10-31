Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 973F8613546
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:01:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opSe7-0000F3-Li; Mon, 31 Oct 2022 07:07:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1opSe2-0000Ek-9N
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 07:07:55 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1opSe0-00062j-9t
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 07:07:54 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29VAhnlR027071;
 Mon, 31 Oct 2022 11:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=1hq8AOzSb69BZ7kmdypNT6wp7HmTCMZ549uuWrPydjE=;
 b=ll+r7Bg52aKi/8PzBPXgUMFti4/2Yu+62mKmu6wZ8Hr79snJ0A3rleDQbA7n51lTtB/L
 2x9ohQRfsGWIB1PJVGE3+ktzQN4uqPW6zLtpMWm/Ts04WASbTfNdCNDC15mFGDGGHYl8
 ww0QCe6iyMUsmueVEtwLMrafpK0SN8N/DRWHXXqdRaYPuJzYcmdKOwvmFTQj5Ilkwpff
 oCNmbbX0hSW3wSDKmoDGEIsj6QFqn/u2kstbyz32YhfPHR6G5QbYpNS3Ps2FOVyOBrUt
 Uw74gR/meLcyoYPYQBnl8L6v2+9J2jnwxDsrSDu45sYSlUHsQPcZkgdAIO1ajH+oce+S nA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kjcuwrnw6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Oct 2022 11:07:46 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29VB6aLv018497;
 Mon, 31 Oct 2022 11:07:44 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3kgut92tjb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Oct 2022 11:07:44 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29VB7gie39256680
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Oct 2022 11:07:42 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25B1A11C050;
 Mon, 31 Oct 2022 11:07:42 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E917011C04A;
 Mon, 31 Oct 2022 11:07:41 +0000 (GMT)
Received: from heavy (unknown [9.171.39.72])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 31 Oct 2022 11:07:41 +0000 (GMT)
Date: Mon, 31 Oct 2022 12:07:36 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH] accel/tcg: Complete cpu initialization before registration
Message-ID: <20221031110736.pcao7aqhdoyxpqww@heavy>
References: <20221031054105.3552-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031054105.3552-1-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1_AV13FdLnLo7zB-SNqDpj5kY78xhr-g
X-Proofpoint-GUID: 1_AV13FdLnLo7zB-SNqDpj5kY78xhr-g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-31_06,2022-10-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210310070
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Oct 31, 2022 at 04:41:05PM +1100, Richard Henderson wrote:
> Delay cpu_list_add until realize is complete, so that cross-cpu
> interaction does not happen with incomplete cpu state.  For this,
> we must delay plugin initialization out of tcg_exec_realizefn,
> because no cpu_index has been assigned.
> 
> Fixes a problem with cross-cpu jump cache flushing, when the
> jump cache has not yet been allocated.
> 
> Fixes: a976a99a2975 ("include/hw/core: Create struct CPUJumpCache")
> Reported-by: Ilya Leoshkevich <iii@linux.ibm.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/cpu-exec.c      |  8 +++++---
>  accel/tcg/translate-all.c | 16 +++++++---------
>  cpu.c                     | 10 +++++++++-
>  3 files changed, 21 insertions(+), 13 deletions(-)

This fixes the issue, thanks!
The code looks correct to me as well.
I have one question though, see below.

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>

> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 82b06c1824..356fe348de 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -1052,23 +1052,25 @@ void tcg_exec_realizefn(CPUState *cpu, Error **errp)
>          cc->tcg_ops->initialize();
>          tcg_target_initialized = true;
>      }
> -    tlb_init(cpu);
> -    qemu_plugin_vcpu_init_hook(cpu);
>  
> +    cpu->tb_jmp_cache = g_new0(CPUJumpCache, 1);
> +    tlb_init(cpu);
>  #ifndef CONFIG_USER_ONLY
>      tcg_iommu_init_notifier_list(cpu);
>  #endif /* !CONFIG_USER_ONLY */
> +    /* qemu_plugin_vcpu_init_hook delayed until cpu_index assigned. */
>  }
>  
>  /* undo the initializations in reverse order */
>  void tcg_exec_unrealizefn(CPUState *cpu)
>  {
> +    qemu_plugin_vcpu_exit_hook(cpu);
>  #ifndef CONFIG_USER_ONLY
>      tcg_iommu_free_notifier_list(cpu);
>  #endif /* !CONFIG_USER_ONLY */
>  
> -    qemu_plugin_vcpu_exit_hook(cpu);
>      tlb_destroy(cpu);
> +    g_free(cpu->tb_jmp_cache);
>  }
>  
>  #ifndef CONFIG_USER_ONLY
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index 0089578f8f..921944a5ab 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -1580,15 +1580,13 @@ void tcg_flush_jmp_cache(CPUState *cpu)
>  {
>      CPUJumpCache *jc = cpu->tb_jmp_cache;
>  
> -    if (likely(jc)) {
> -        for (int i = 0; i < TB_JMP_CACHE_SIZE; i++) {
> -            qatomic_set(&jc->array[i].tb, NULL);
> -        }
> -    } else {
> -        /* This should happen once during realize, and thus never race. */
> -        jc = g_new0(CPUJumpCache, 1);
> -        jc = qatomic_xchg(&cpu->tb_jmp_cache, jc);
> -        assert(jc == NULL);
> +    /* During early initialization, the cache may not yet be allocated. */
> +    if (unlikely(jc == NULL)) {
> +        return;
> +    }

We can hit this condition in qemu-system with the following call
chain:

    tcg_flush_jmp_cache
    tlb_flush_by_mmuidx_async_work
    listener_add_address_space
    memory_listener_register
    cpu_address_space_init
    tcg_cpu_realizefn
    cpu_exec_realizefn
    x86_cpu_realizefn

I'm wondering if we can avoid having to think of early initialization
when dealing with tb_jmp_cache by initializing it as early as possible?
I don't think swapping accel_cpu_realizefn() and tcg_exec_realizefn()
is going to work (though I haven't tried it), but what about splitting
tcg_exec_realizefn() in two and calling the half that initializes
tb_jmp_cache before accel_cpu_realizefn()?

> +
> +    for (int i = 0; i < TB_JMP_CACHE_SIZE; i++) {
> +        qatomic_set(&jc->array[i].tb, NULL);
>      }
>  }
>  
> diff --git a/cpu.c b/cpu.c
> index 2a09b05205..4a7d865427 100644
> --- a/cpu.c
> +++ b/cpu.c
> @@ -134,15 +134,23 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
>      /* cache the cpu class for the hotpath */
>      cpu->cc = CPU_GET_CLASS(cpu);
>  
> -    cpu_list_add(cpu);
>      if (!accel_cpu_realizefn(cpu, errp)) {
>          return;
>      }
> +
>      /* NB: errp parameter is unused currently */
>      if (tcg_enabled()) {
>          tcg_exec_realizefn(cpu, errp);
>      }
>  
> +    /* Wait until cpu initialization complete before exposing cpu. */
> +    cpu_list_add(cpu);
> +
> +    /* Plugin initialization must wait until cpu_index assigned. */
> +    if (tcg_enabled()) {
> +        qemu_plugin_vcpu_init_hook(cpu);
> +    }
> +
>  #ifdef CONFIG_USER_ONLY
>      assert(qdev_get_vmsd(DEVICE(cpu)) == NULL ||
>             qdev_get_vmsd(DEVICE(cpu))->unmigratable);
> -- 
> 2.34.1
> 
> 

