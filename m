Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1632B60F646
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 13:33:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo15v-0007oY-DT; Thu, 27 Oct 2022 07:30:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oo15b-0007Rc-Lw
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 07:30:24 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oo15Z-00039n-FO
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 07:30:23 -0400
Received: by mail-pl1-x62e.google.com with SMTP id d24so1136697pls.4
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 04:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Czkx8jVudvN8i3MngWDp53Vjdn1G8IyMGXiWOl6yJus=;
 b=jqXXCzzpO1FIYGMbE4fgdiu9L5pV84zXIQ9FMKS4IPWqkjecb22t0kiOI5zIju95Bg
 cCZIwumARfLASZQ9nRSzDd2wG8pkQi7HmBiQxFYyL8ywk6nCQ6ZI9n3dz/TfwTAFh4bG
 03u3z6MzP+rkkuaBWfEgMx/djF8gh7helB+sg3yh1EhGNoOSuRMkutcSswGXeQqrbjfO
 1s+OvdByASR6L4ukmkqqmnlvc1B8y6HQQ6+uv8WEbNfwIeifk/532JO32+eELUx57zGx
 KQVU5FplTT4bgt4BEu6TmGz6WDr8Td9akKUV11n97iDUrlgbx4vD8qkXPihqtSQAS7I9
 G1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Czkx8jVudvN8i3MngWDp53Vjdn1G8IyMGXiWOl6yJus=;
 b=CYCQ1tg/6V+H1VE93BGrHFpMXyel2wGS45UxIM5PEOAvj1+j8z4QVX+APqZA8b7z5t
 Cc6ahjCjAQqzjZGDkCykpvBVySxSE6dVkhAxLlaSudUzNGYwfmWph2ctJFqe8EHK+HBA
 616R/OmQ7ks5A/7wQORLRM6PB6Rkxdpb3EGPZELR04NvXDb9k5x6uHnFZMYeMKng97JN
 SzajIzM4ADadnZYsi6inls7C1dhVyLJbk8IVQm4C/LWIPxknypW9OzMR6jDLmklvpP1C
 O+6r1wRUxPvOwsuimbpWee1IZIL5RUzQfGoJolaHYKEJB93L+MRvjpM0uUgC3iVx4c/P
 CNuA==
X-Gm-Message-State: ACrzQf0BYSCNY5dBDthhov1SNCVJFx9F3t0BkU7yPdfTmsF5h0ZhLA/t
 RJJowOGnZEACOFJd+/VRH+DL1A==
X-Google-Smtp-Source: AMsMyM5P5EP63IEfFpmX962L1VnlAnTNMRTnO8eeRIjWNcAL/Rm/e41U5u13ey7NO14RbKwFWNsi5A==
X-Received: by 2002:a17:90b:17c5:b0:20d:3520:2e2a with SMTP id
 me5-20020a17090b17c500b0020d35202e2amr9842902pjb.7.1666870219141; 
 Thu, 27 Oct 2022 04:30:19 -0700 (PDT)
Received: from ?IPV6:2001:8003:501a:d301:3a91:9408:3918:55a?
 ([2001:8003:501a:d301:3a91:9408:3918:55a])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a17090a488200b00205db4ff6dfsm831534pjh.46.2022.10.27.04.30.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 04:30:18 -0700 (PDT)
Message-ID: <7809009d-72c2-139b-6469-328bef3a067b@linaro.org>
Date: Thu, 27 Oct 2022 21:30:12 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 1/6] accel/tcg: Introduce cpu_unwind_state_data
Content-Language: en-US
To: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org
References: <20221027100254.215253-1-richard.henderson@linaro.org>
 <20221027100254.215253-2-richard.henderson@linaro.org>
 <5d82d4c4-8de1-4419-19b8-b5de878c5eb3@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <5d82d4c4-8de1-4419-19b8-b5de878c5eb3@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/27/22 20:40, Claudio Fontana wrote:
> On 10/27/22 12:02, Richard Henderson wrote:
>> Add a way to examine the unwind data without actually
>> restoring the data back into env.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   accel/tcg/internal.h      |  4 +--
>>   include/exec/exec-all.h   | 21 ++++++++---
>>   accel/tcg/translate-all.c | 74 ++++++++++++++++++++++++++-------------
>>   3 files changed, 68 insertions(+), 31 deletions(-)
>>
>> diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
>> index 1227bb69bd..9c06b320b7 100644
>> --- a/accel/tcg/internal.h
>> +++ b/accel/tcg/internal.h
>> @@ -106,8 +106,8 @@ void tb_reset_jump(TranslationBlock *tb, int n);
>>   TranslationBlock *tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
>>                                  tb_page_addr_t phys_page2);
>>   bool tb_invalidate_phys_page_unwind(tb_page_addr_t addr, uintptr_t pc);
>> -int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
>> -                              uintptr_t searched_pc, bool reset_icount);
>> +void cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
>> +                               uintptr_t host_pc, bool reset_icount);
>>   
>>   /* Return the current PC from CPU, which may be cached in TB. */
>>   static inline target_ulong log_pc(CPUState *cpu, const TranslationBlock *tb)
>> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
>> index e948992a80..7d851f5907 100644
>> --- a/include/exec/exec-all.h
>> +++ b/include/exec/exec-all.h
>> @@ -39,20 +39,33 @@ typedef ram_addr_t tb_page_addr_t;
>>   #define TB_PAGE_ADDR_FMT RAM_ADDR_FMT
>>   #endif
>>   
>> +/**
>> + * cpu_unwind_state_data:
>> + * @cpu: the cpu context
>> + * @host_pc: the host pc within the translation
>> + * @data: output data
>> + *
>> + * Attempt to load the the unwind state for a host pc occurring in
>> + * translated code.  If @host_pc is not in translated code, the
>> + * function returns false; otherwise @data is loaded.
>> + * This is the same unwind info as given to restore_state_to_opc.
>> + */
>> +bool cpu_unwind_state_data(CPUState *cpu, uintptr_t host_pc, uint64_t *data);
>> +
>>   /**
>>    * cpu_restore_state:
>> - * @cpu: the vCPU state is to be restore to
>> - * @searched_pc: the host PC the fault occurred at
>> + * @cpu: the cpu context
>> + * @host_pc: the host pc within the translation
>>    * @will_exit: true if the TB executed will be interrupted after some
>>                  cpu adjustments. Required for maintaining the correct
>>                  icount valus
>>    * @return: true if state was restored, false otherwise
>>    *
>>    * Attempt to restore the state for a fault occurring in translated
>> - * code. If the searched_pc is not in translated code no state is
>> + * code. If @host_pc is not in translated code no state is
>>    * restored and the function returns false.
>>    */
>> -bool cpu_restore_state(CPUState *cpu, uintptr_t searched_pc, bool will_exit);
>> +bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc, bool will_exit);
>>   
>>   G_NORETURN void cpu_loop_exit_noexc(CPUState *cpu);
>>   G_NORETURN void cpu_loop_exit(CPUState *cpu);
>> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
>> index f185356a36..319becb698 100644
>> --- a/accel/tcg/translate-all.c
>> +++ b/accel/tcg/translate-all.c
>> @@ -247,52 +247,66 @@ static int encode_search(TranslationBlock *tb, uint8_t *block)
>>       return p - block;
>>   }
>>   
>> -/* The cpu state corresponding to 'searched_pc' is restored.
>> - * When reset_icount is true, current TB will be interrupted and
>> - * icount should be recalculated.
>> - */
>> -int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
>> -                              uintptr_t searched_pc, bool reset_icount)
> 
> 
> Maybe add a small comment about what the return value of this static function means?
> It can be indirectly inferred from its point of use:
> 
>   +    int insns_left = cpu_unwind_data_from_tb(tb, host_pc, data);
> 
> But I find having the information about the meaning of a function and return value useful to be available there.
> 
> IIUC for external functions the standard way is to document in the header files, but for the static functions I would think we can do it here.
> 
> With that Reviewed-by: Claudio Fontana <cfontana@suse.de>


I added

+/**
+ * cpu_unwind_data_from_tb: Load unwind data for TB
+ * @tb: translation block
+ * @host_pc: the host pc within translation
+ * @data: output array
+ *
+ * Within @tb, locate the guest insn whose translation contains @host_pc,
+ * then load the unwind data created by INDEX_opc_start_insn for that
+ * guest insn.  Return the number of guest insns which remain un-executed
+ * within @tb -- these must be credited back to the cpu's icount budget.
+ *
+ * If we could not determine which guest insn to which @host_pc belongs,
+ * return -1 and do not load unwind data.
+ * FIXME: Such a failure is likely to break the guest, as we were not
+ * expecting to unwind from such a location.  This may be some sort of
+ * backend code generation problem.  Consider asserting instead.
   */

Which I think captures some of your v1 comments as well.


r~

