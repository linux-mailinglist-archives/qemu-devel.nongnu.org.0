Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 517E460F662
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 13:42:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo1Fg-0004Wx-5E; Thu, 27 Oct 2022 07:40:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oo1EA-0007Bz-76
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 07:39:18 -0400
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oo1E3-0004wu-DM
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 07:39:13 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 39C9E1FDF8;
 Thu, 27 Oct 2022 11:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666870744; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8E1sK+IQw9ZTjQ1wMEUflPGpI0htZFiLCSaJy1U/IEE=;
 b=cFuhvi9VGhIgIf2P23W/+2DvScpb68EBOyRv1MC3YED0T9ni+ycwUVSH9IpkwiI6U7JbcL
 MLGuH2+8MZ80NEc2jQToGsLo5MyUM7YjdUxou2jPlEB+YDg5r9AKtsd8sbH3B9ZWnHjuWS
 dfKpuMvru9FObvKg7Tmh3xRngZl/KAo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666870744;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8E1sK+IQw9ZTjQ1wMEUflPGpI0htZFiLCSaJy1U/IEE=;
 b=Bm+GTdTluGu5wF8BgTTaxsAmfj5IAwoXd7ASmc37lwspbHAeEaFPuQCHntc8EshkVKXdXV
 kXXgLKNYhFpxehDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 19D6013357;
 Thu, 27 Oct 2022 11:39:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id q5gtBNhtWmO0KgAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 27 Oct 2022 11:39:04 +0000
Message-ID: <20677811-2e48-d957-f0f9-423d2fdbecdb@suse.de>
Date: Thu, 27 Oct 2022 13:39:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 1/6] accel/tcg: Introduce cpu_unwind_state_data
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221027100254.215253-1-richard.henderson@linaro.org>
 <20221027100254.215253-2-richard.henderson@linaro.org>
 <5d82d4c4-8de1-4419-19b8-b5de878c5eb3@suse.de>
 <7809009d-72c2-139b-6469-328bef3a067b@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <7809009d-72c2-139b-6469-328bef3a067b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

On 10/27/22 13:30, Richard Henderson wrote:
> On 10/27/22 20:40, Claudio Fontana wrote:
>> On 10/27/22 12:02, Richard Henderson wrote:
>>> Add a way to examine the unwind data without actually
>>> restoring the data back into env.
>>>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   accel/tcg/internal.h      |  4 +--
>>>   include/exec/exec-all.h   | 21 ++++++++---
>>>   accel/tcg/translate-all.c | 74 ++++++++++++++++++++++++++-------------
>>>   3 files changed, 68 insertions(+), 31 deletions(-)
>>>
>>> diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
>>> index 1227bb69bd..9c06b320b7 100644
>>> --- a/accel/tcg/internal.h
>>> +++ b/accel/tcg/internal.h
>>> @@ -106,8 +106,8 @@ void tb_reset_jump(TranslationBlock *tb, int n);
>>>   TranslationBlock *tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
>>>                                  tb_page_addr_t phys_page2);
>>>   bool tb_invalidate_phys_page_unwind(tb_page_addr_t addr, uintptr_t pc);
>>> -int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
>>> -                              uintptr_t searched_pc, bool reset_icount);
>>> +void cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
>>> +                               uintptr_t host_pc, bool reset_icount);
>>>   
>>>   /* Return the current PC from CPU, which may be cached in TB. */
>>>   static inline target_ulong log_pc(CPUState *cpu, const TranslationBlock *tb)
>>> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
>>> index e948992a80..7d851f5907 100644
>>> --- a/include/exec/exec-all.h
>>> +++ b/include/exec/exec-all.h
>>> @@ -39,20 +39,33 @@ typedef ram_addr_t tb_page_addr_t;
>>>   #define TB_PAGE_ADDR_FMT RAM_ADDR_FMT
>>>   #endif
>>>   
>>> +/**
>>> + * cpu_unwind_state_data:
>>> + * @cpu: the cpu context
>>> + * @host_pc: the host pc within the translation
>>> + * @data: output data
>>> + *
>>> + * Attempt to load the the unwind state for a host pc occurring in
>>> + * translated code.  If @host_pc is not in translated code, the
>>> + * function returns false; otherwise @data is loaded.
>>> + * This is the same unwind info as given to restore_state_to_opc.
>>> + */
>>> +bool cpu_unwind_state_data(CPUState *cpu, uintptr_t host_pc, uint64_t *data);
>>> +
>>>   /**
>>>    * cpu_restore_state:
>>> - * @cpu: the vCPU state is to be restore to
>>> - * @searched_pc: the host PC the fault occurred at
>>> + * @cpu: the cpu context
>>> + * @host_pc: the host pc within the translation
>>>    * @will_exit: true if the TB executed will be interrupted after some
>>>                  cpu adjustments. Required for maintaining the correct
>>>                  icount valus
>>>    * @return: true if state was restored, false otherwise
>>>    *
>>>    * Attempt to restore the state for a fault occurring in translated
>>> - * code. If the searched_pc is not in translated code no state is
>>> + * code. If @host_pc is not in translated code no state is
>>>    * restored and the function returns false.
>>>    */
>>> -bool cpu_restore_state(CPUState *cpu, uintptr_t searched_pc, bool will_exit);
>>> +bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc, bool will_exit);
>>>   
>>>   G_NORETURN void cpu_loop_exit_noexc(CPUState *cpu);
>>>   G_NORETURN void cpu_loop_exit(CPUState *cpu);
>>> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
>>> index f185356a36..319becb698 100644
>>> --- a/accel/tcg/translate-all.c
>>> +++ b/accel/tcg/translate-all.c
>>> @@ -247,52 +247,66 @@ static int encode_search(TranslationBlock *tb, uint8_t *block)
>>>       return p - block;
>>>   }
>>>   
>>> -/* The cpu state corresponding to 'searched_pc' is restored.
>>> - * When reset_icount is true, current TB will be interrupted and
>>> - * icount should be recalculated.
>>> - */
>>> -int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
>>> -                              uintptr_t searched_pc, bool reset_icount)
>>
>>
>> Maybe add a small comment about what the return value of this static function means?
>> It can be indirectly inferred from its point of use:
>>
>>   +    int insns_left = cpu_unwind_data_from_tb(tb, host_pc, data);
>>
>> But I find having the information about the meaning of a function and return value useful to be available there.
>>
>> IIUC for external functions the standard way is to document in the header files, but for the static functions I would think we can do it here.
>>
>> With that Reviewed-by: Claudio Fontana <cfontana@suse.de>
> 
> 
> I added
> 
> +/**
> + * cpu_unwind_data_from_tb: Load unwind data for TB
> + * @tb: translation block
> + * @host_pc: the host pc within translation
> + * @data: output array
> + *
> + * Within @tb, locate the guest insn whose translation contains @host_pc,
> + * then load the unwind data created by INDEX_opc_start_insn for that
> + * guest insn.  Return the number of guest insns which remain un-executed
> + * within @tb -- these must be credited back to the cpu's icount budget.
> + *
> + * If we could not determine which guest insn to which @host_pc belongs,
> + * return -1 and do not load unwind data.
> + * FIXME: Such a failure is likely to break the guest, as we were not
> + * expecting to unwind from such a location.  This may be some sort of
> + * backend code generation problem.  Consider asserting instead.
>    */
> 
> Which I think captures some of your v1 comments as well.
> 
> 
> r~
> 

Very clear thanks,

Reviewed-by: Claudio Fontana <cfontana@suse.de>




