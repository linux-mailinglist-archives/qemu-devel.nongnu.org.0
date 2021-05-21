Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CB338C104
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 09:52:26 +0200 (CEST)
Received: from localhost ([::1]:34358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljzxI-000561-Ip
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 03:52:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ljzuw-0004Fg-Ll
 for qemu-devel@nongnu.org; Fri, 21 May 2021 03:49:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ljzut-0006NK-LK
 for qemu-devel@nongnu.org; Fri, 21 May 2021 03:49:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621583394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ODT1FLItyQ5szsUMFDfQqLpAS3f66a7uH7cs7MOwAPM=;
 b=GqnivDYdMK6u28tnXYSqIdssze1ct6z6wxDLnqmea3VGHGBjRG9B7if+PcEVFm05EKVAQJ
 TPaEM2oaGj1ONE64B0G/h8OCJUHQyYMkuJppYWw588EsPIvBQ21TFZkiH3MOFo5lvuMD0v
 OvS9q15wa00qHKjzxmFUy2CpPKOXUIo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-C2uNESWEN6Gr0H1JiIKlFQ-1; Fri, 21 May 2021 03:49:53 -0400
X-MC-Unique: C2uNESWEN6Gr0H1JiIKlFQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 k124-20020a1ca1820000b0290175dd5429afso3497779wme.7
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 00:49:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ODT1FLItyQ5szsUMFDfQqLpAS3f66a7uH7cs7MOwAPM=;
 b=GoUR1vnCWCGrmnk8pwTrn19kCrHXkr1jAfO57R7JlRcW2A0gweXOVms1zR75VRHOOb
 BvuE7vF7WwopGRoOzaILGsPnFRY4vN0WjaVWVwe868EJD9MC6jB1IQ0ifPnttKyK59nS
 FddLnlCKOtVRHNthzcTyTWwWooTmmkLyu1oDFlOmOxQq0wS2kveebAShjiXuArgpKk+C
 nvRrWBD+fnW/ORqAf0T5ph6glyMpthQamYJnwp9AagfSjZ17LWcxzEV+a7/sPy93Woc5
 aMmc8U7fj3EyxzBhPqFoeHqe5CE5vbZxQXtRHpoIKjcijO/BQGE9gOXRAsdXhDu/4/VO
 Ckww==
X-Gm-Message-State: AOAM530lQSP4uV6smcf6TZlrBGrKeQ7PAe/Xh9I1J9unpZACBQwiihcK
 CGX1Mb9V/wMd2l6mhMmM+3w0mJFRNkIsTVAEG0cMKg92zrAbdWvgv7vFQd7zfgl9NwTgMsXEuMc
 Of4L3sL30kiOoOMQ=
X-Received: by 2002:a5d:6e04:: with SMTP id h4mr7930975wrz.256.1621583392226; 
 Fri, 21 May 2021 00:49:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIG46o/m7G9r80Ikc8pJMMFm6xJoPb5QvnZ+0xrEUj3q+ru2YVZPWhR/YMZJ4kRXcvWfcD5w==
X-Received: by 2002:a5d:6e04:: with SMTP id h4mr7930941wrz.256.1621583391918; 
 Fri, 21 May 2021 00:49:51 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6502.dip0.t-ipconnect.de. [91.12.101.2])
 by smtp.gmail.com with ESMTPSA id
 y14sm1116886wrr.82.2021.05.21.00.49.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 00:49:51 -0700 (PDT)
Subject: Re: [PATCH 1/2] target/s390x: Fix SIGILL psw.addr reporting
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
References: <20210521030146.2831663-1-iii@linux.ibm.com>
 <20210521030146.2831663-2-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <11d439f2-a14e-4a77-ebea-f9440b02be7a@redhat.com>
Date: Fri, 21 May 2021 09:49:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210521030146.2831663-2-iii@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.05.21 05:01, Ilya Leoshkevich wrote:
> When a s390x CPU attempts to execute an illegal instruction, an
> operation exception is recognized. This is a suppressing exception,
> which means that the PSW is advanced by the length of the illegal
> instruction.
> 
> On the real hardware or in qemu-system-s390x the kernel then raises
> SIGILL with si_addr pointing to the suppressed instruction and
> psw.addr containing the updated PSW.
> 
> Unfortunately qemu-s390x sets both to the address of the suppressed
> instruction at the moment. Fix by sharing the PSW advancement logic
> with qemu-system-s390x and setting si_addr to the address of the
> instruction that raised the exception.
> 
> Buglink: https://bugs.launchpad.net/qemu/+bug/1920913
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   linux-user/s390x/cpu_loop.c |  6 +++-
>   target/s390x/excp_helper.c  | 69 ++++++++++++++++++++-----------------
>   target/s390x/internal.h     |  1 +
>   3 files changed, 43 insertions(+), 33 deletions(-)
> 
> diff --git a/linux-user/s390x/cpu_loop.c b/linux-user/s390x/cpu_loop.c
> index f2d1215fb1..6f5462d4f8 100644
> --- a/linux-user/s390x/cpu_loop.c
> +++ b/linux-user/s390x/cpu_loop.c
> @@ -21,6 +21,7 @@
>   #include "qemu-common.h"
>   #include "qemu.h"
>   #include "cpu_loop-common.h"
> +#include "internal.h"
>   
>   /* s390x masks the fault address it reports in si_addr for SIGSEGV and SIGBUS */
>   #define S390X_FAIL_ADDR_MASK -4096LL
> @@ -29,6 +30,7 @@ void cpu_loop(CPUS390XState *env)
>   {
>       CPUState *cs = env_cpu(env);
>       int trapnr, n, sig;
> +    target_ulong excp_psw_addr;
>       target_siginfo_t info;
>       target_ulong addr;
>       abi_long ret;
> @@ -38,6 +40,7 @@ void cpu_loop(CPUS390XState *env)
>           trapnr = cpu_exec(cs);
>           cpu_exec_end(cs);
>           process_queued_cpu_work(cs);
> +        excp_psw_addr = env->psw.addr;
>   
>           switch (trapnr) {
>           case EXCP_INTERRUPT:
> @@ -66,6 +69,7 @@ void cpu_loop(CPUS390XState *env)
>               n = TARGET_TRAP_BRKPT;
>               goto do_signal_pc;
>           case EXCP_PGM:
> +            s390_cpu_program_interrupt_advance_psw(env);
>               n = env->int_pgm_code;
>               switch (n) {
>               case PGM_OPERATION:
> @@ -131,7 +135,7 @@ void cpu_loop(CPUS390XState *env)
>               break;
>   
>           do_signal_pc:
> -            addr = env->psw.addr;
> +            addr = excp_psw_addr;
>           do_signal:
>               info.si_signo = sig;
>               info.si_errno = 0;
> diff --git a/target/s390x/excp_helper.c b/target/s390x/excp_helper.c
> index 20625c2c8f..0a323967ae 100644
> --- a/target/s390x/excp_helper.c
> +++ b/target/s390x/excp_helper.c
> @@ -82,6 +82,42 @@ void HELPER(data_exception)(CPUS390XState *env, uint32_t dxc)
>       tcg_s390_data_exception(env, dxc, GETPC());
>   }
>   
> +void s390_cpu_program_interrupt_advance_psw(CPUS390XState *env)
> +{
> +    switch (env->int_pgm_code) {
> +    case PGM_PER:
> +        if (env->per_perc_atmid & PER_CODE_EVENT_NULLIFICATION) {
> +            break;
> +        }
> +        /* FALL THROUGH */
> +    case PGM_OPERATION:
> +    case PGM_PRIVILEGED:
> +    case PGM_EXECUTE:
> +    case PGM_PROTECTION:
> +    case PGM_ADDRESSING:
> +    case PGM_SPECIFICATION:
> +    case PGM_DATA:
> +    case PGM_FIXPT_OVERFLOW:
> +    case PGM_FIXPT_DIVIDE:
> +    case PGM_DEC_OVERFLOW:
> +    case PGM_DEC_DIVIDE:
> +    case PGM_HFP_EXP_OVERFLOW:
> +    case PGM_HFP_EXP_UNDERFLOW:
> +    case PGM_HFP_SIGNIFICANCE:
> +    case PGM_HFP_DIVIDE:
> +    case PGM_TRANS_SPEC:
> +    case PGM_SPECIAL_OP:
> +    case PGM_OPERAND:
> +    case PGM_HFP_SQRT:
> +    case PGM_PC_TRANS_SPEC:
> +    case PGM_ALET_SPEC:
> +    case PGM_MONITOR:
> +        /* advance the PSW if our exception is not nullifying */
> +        env->psw.addr += env->int_pgm_ilen;
> +        break;
> +    }
> +}
> +
>   #if defined(CONFIG_USER_ONLY)
>   
>   void s390_cpu_do_interrupt(CPUState *cs)
> @@ -202,38 +238,7 @@ static void do_program_interrupt(CPUS390XState *env)
>   
>       assert(ilen == 2 || ilen == 4 || ilen == 6);
>   
> -    switch (env->int_pgm_code) {
> -    case PGM_PER:
> -        if (env->per_perc_atmid & PER_CODE_EVENT_NULLIFICATION) {
> -            break;
> -        }
> -        /* FALL THROUGH */
> -    case PGM_OPERATION:
> -    case PGM_PRIVILEGED:
> -    case PGM_EXECUTE:
> -    case PGM_PROTECTION:
> -    case PGM_ADDRESSING:
> -    case PGM_SPECIFICATION:
> -    case PGM_DATA:
> -    case PGM_FIXPT_OVERFLOW:
> -    case PGM_FIXPT_DIVIDE:
> -    case PGM_DEC_OVERFLOW:
> -    case PGM_DEC_DIVIDE:
> -    case PGM_HFP_EXP_OVERFLOW:
> -    case PGM_HFP_EXP_UNDERFLOW:
> -    case PGM_HFP_SIGNIFICANCE:
> -    case PGM_HFP_DIVIDE:
> -    case PGM_TRANS_SPEC:
> -    case PGM_SPECIAL_OP:
> -    case PGM_OPERAND:
> -    case PGM_HFP_SQRT:
> -    case PGM_PC_TRANS_SPEC:
> -    case PGM_ALET_SPEC:
> -    case PGM_MONITOR:
> -        /* advance the PSW if our exception is not nullifying */
> -        env->psw.addr += ilen;
> -        break;
> -    }
> +    s390_cpu_program_interrupt_advance_psw(env);
>   
>       qemu_log_mask(CPU_LOG_INT,
>                     "%s: code=0x%x ilen=%d psw: %" PRIx64 " %" PRIx64 "\n",
> diff --git a/target/s390x/internal.h b/target/s390x/internal.h
> index 11515bb617..9f1665ccbf 100644
> --- a/target/s390x/internal.h
> +++ b/target/s390x/internal.h
> @@ -272,6 +272,7 @@ bool s390_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>   void s390x_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
>                                      MMUAccessType access_type,
>                                      int mmu_idx, uintptr_t retaddr);
> +void s390_cpu_program_interrupt_advance_psw(CPUS390XState *cpu);
>   
>   
>   /* fpu_helper.c */
> 


LGTM, thanks

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


