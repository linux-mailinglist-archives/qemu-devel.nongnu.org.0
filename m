Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CA867EDD5
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 19:48:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLTlp-0007jg-UY; Fri, 27 Jan 2023 13:48:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLTln-0007jY-CD
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 13:48:15 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLTll-0004a0-1D
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 13:48:14 -0500
Received: by mail-pl1-x633.google.com with SMTP id k18so5922799pll.5
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 10:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DvVmoKFGVem3gNGkiFjak2vfB1I9FO4dd3mD0S2ztCM=;
 b=nPvC7xRORvKQDr/cXUAua//pX2ACXVrc1AiTAGJ/1aT04/x86EKjn+YZXtigAYGGsK
 M3qbrYUUCfz7OyPC0t9vry2vFHSTeiDDqtkQNjtViR+h1yeCUV0d7o1SCcDvOP63izZj
 Ff1pY52KjGfjAN4kK90P1LBewDd9EMRXR2r5rgJE2HMQnpUnhJctYfF4PAchV+M/OLVe
 8GeunIggdzQyHR+CJ5BJnesN0SnWRhFhROL2ktJ3Ye8IrYx+JNn1x4BEfeldQOWnMx21
 14EqRA3+QVjIOtB7iSltwuUO7Qq+hi0OYj6BWzqfweRrTujMSDTUM2i/g/5mTbxHOPJW
 N5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DvVmoKFGVem3gNGkiFjak2vfB1I9FO4dd3mD0S2ztCM=;
 b=an4uLqo70P4E1dzDU4ruc7Xp/Xnp7DbttBOWrqK2zLJmEXdvwRIWr/heLPyPfp2g7q
 Xkfl+HKLpp18vBGTtD+MC/7kHiI6oiK5Nvivk84EN5y5NsOJjad0Ji0bG28Got1RXmmW
 7wsOMmWOSiHyZTw0LGJe/Ij75EFpiM90O5l4AFKDgNCSVxB17uHKW1xuVhuULCSWlARF
 7/1XK2YvrcBsi4Srj8YjwTVM0CAZzsbzpOyuVqbs5OpIjFVjQlseKwbLei7tghz0RCNX
 820cT98hF7CE5qIbFcPAyVJHvEL4meMlUZkYmi7LtPs/a9X0zAAUc9L/5jzW1ztr+txb
 BT1w==
X-Gm-Message-State: AFqh2krgtPODegMcwX8diQBetAJRB0yGbhRXTyBh7dH2hsgSRmj18/ux
 cJk/ybVvkhtEQYg3deYCdNAK4w==
X-Google-Smtp-Source: AMrXdXvndhJiuFFlMsqkrfPYVPtDKbQhd/f2MGC5UfCzl+fKcHXgs8fdcrJeQHeIdr88vpvaHXuYHQ==
X-Received: by 2002:a17:902:c401:b0:194:dbd3:f571 with SMTP id
 k1-20020a170902c40100b00194dbd3f571mr39780809plk.35.1674845290122; 
 Fri, 27 Jan 2023 10:48:10 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 iw11-20020a170903044b00b0017d97d13b18sm3204030plb.65.2023.01.27.10.48.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 10:48:09 -0800 (PST)
Message-ID: <5f904890-db81-f10a-932e-60438f35b258@linaro.org>
Date: Fri, 27 Jan 2023 08:48:06 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 05/36] tcg: Add TCG_CALL_{RET,ARG}_BY_REF
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20230126043824.54819-1-richard.henderson@linaro.org>
 <20230126043824.54819-6-richard.henderson@linaro.org>
 <87zga4npk2.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87zga4npk2.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/27/23 00:40, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> These will be used by some hosts, both 32 and 64-bit, to pass and
>> return i128.  Not yet used, because allocation is not yet enabled.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/tcg-internal.h |   3 +
>>   tcg/tcg.c          | 135 ++++++++++++++++++++++++++++++++++++++++++++-
>>   2 files changed, 135 insertions(+), 3 deletions(-)
>>
>> diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
>> index 6e50aeba3a..2ec1ea01df 100644
>> --- a/tcg/tcg-internal.h
>> +++ b/tcg/tcg-internal.h
>> @@ -36,6 +36,7 @@
>>    */
>>   typedef enum {
>>       TCG_CALL_RET_NORMAL,         /* by registers */
>> +    TCG_CALL_RET_BY_REF,         /* for i128, by reference */
>>   } TCGCallReturnKind;
>>   
>>   typedef enum {
>> @@ -44,6 +45,8 @@ typedef enum {
>>       TCG_CALL_ARG_EXTEND,         /* for i32, as a sign/zero-extended i64 */
>>       TCG_CALL_ARG_EXTEND_U,       /*      ... as a zero-extended i64 */
>>       TCG_CALL_ARG_EXTEND_S,       /*      ... as a sign-extended i64 */
>> +    TCG_CALL_ARG_BY_REF,         /* for i128, by reference, first */
>> +    TCG_CALL_ARG_BY_REF_N,       /*       ... by reference, subsequent */
>>   } TCGCallArgumentKind;
>>   
>>   typedef struct TCGCallArgumentLoc {
>> diff --git a/tcg/tcg.c b/tcg/tcg.c
>> index a561ef3ced..644dc53196 100644
>> --- a/tcg/tcg.c
>> +++ b/tcg/tcg.c
>> @@ -104,8 +104,7 @@ static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg1,
>>   static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
>>   static void tcg_out_movi(TCGContext *s, TCGType type,
>>                            TCGReg ret, tcg_target_long arg);
>> -static void tcg_out_addi_ptr(TCGContext *s, TCGReg, TCGReg, tcg_target_long)
>> -    __attribute__((unused));
>> +static void tcg_out_addi_ptr(TCGContext *s, TCGReg, TCGReg, tcg_target_long);
>>   static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg);
>>   static void tcg_out_goto_tb(TCGContext *s, int which);
>>   static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>> @@ -683,6 +682,38 @@ static void layout_arg_normal_n(TCGCumulativeArgs *cum,
>>       cum->arg_slot += n;
>>   }
>>   
>> +static void layout_arg_by_ref(TCGCumulativeArgs *cum, TCGHelperInfo *info)
>> +{
>> +    TCGCallArgumentLoc *loc = &info->in[cum->info_in_idx];
>> +    int n = 128 / TCG_TARGET_REG_BITS;
>> +
>> +    /* The first subindex carries the pointer. */
>> +    layout_arg_1(cum, info, TCG_CALL_ARG_BY_REF);
>> +
>> +    /*
>> +     * The callee is allowed to clobber memory associated with
>> +     * structure pass by-reference.  Therefore we must make copies.
>> +     * Allocate space from "ref_slot", which will be adjusted to
>> +     * follow the parameters on the stack.
>> +     */
>> +    loc[0].ref_slot = cum->ref_slot;
>> +
>> +    /*
>> +     * Subsequent words also go into the reference slot, but
>> +     * do not accumulate into the regular arguments.
>> +     */
>> +    for (int i = 1; i < n; ++i) {
>> +        loc[i] = (TCGCallArgumentLoc){
>> +            .kind = TCG_CALL_ARG_BY_REF_N,
>> +            .arg_idx = cum->arg_idx,
>> +            .tmp_subindex = i,
>> +            .ref_slot = cum->ref_slot + i,
>> +        };
>> +    }
>> +    cum->info_in_idx += n;
>> +    cum->ref_slot += n;
>> +}
> 
> I'm surprised this is in the core TCG. Are the stack frames organised
> the same way across all our host architectures?

Where else would it be?  It's the core TCG that has to take care of moving the data to the 
correct place, either register or stack.  The backend can't do that because the backend 
doesn't know how other registers are allocated.

Our host architectures use the same general form -- place arguments in N integer registers 
before placing them on the stack, incrementing from some offset O.  The differences 
between the hosts is being expressed precicely by these TCG_CALL_ARG_* enumerations.

>> @@ -718,6 +749,14 @@ static void init_call_layout(TCGHelperInfo *info)
>>           case TCG_CALL_RET_NORMAL:
>>               assert(info->nr_out <= ARRAY_SIZE(tcg_target_call_oarg_regs));
>>               break;
>> +        case TCG_CALL_RET_BY_REF:
>> +            /*
>> +             * Allocate the first argument to the output.
>> +             * We don't need to store this anywhere, just make it
>> +             * unavailable for use in the input loop below.
>> +             */
>> +            cum.arg_slot = 1;
>> +            break;
> 
> It would have helped if ->typemask was documented or accessed with
> something like dh_get_typemask(0) for my understanding here.

Where?  Above this fragment?  Yes, that seems like a good cleanup.

>> +
>> +    /*
>> +     * Relocate the "ref_slot" area to the end of the parameters.
>> +     * Minimizing this stack offset helps code size for x86,
>> +     * which has a signed 8-bit offset encoding.
>> +     */
> 
> I don't quite follow this. Are we free to move parameters around in the
> stack frame? I thought the position would be directly related to the
> argument number?

This is a reference.  The actual argument is a pointer:

> +    /* The first subindex carries the pointer. */
> +    layout_arg_1(cum, info, TCG_CALL_ARG_BY_REF);

and later

>> +static void load_arg_ref(TCGContext *s, int arg_slot, TCGReg ref_base,
>> +                         intptr_t ref_off, TCGRegSet *allocated_regs)
>> +{
>> +    TCGReg reg;
>> +    int stk_slot = arg_slot - ARRAY_SIZE(tcg_target_call_iarg_regs);
>> +
>> +    if (stk_slot < 0) {
>> +        reg = tcg_target_call_iarg_regs[arg_slot];
>> +        tcg_reg_free(s, reg, *allocated_regs);
>> +        tcg_out_addi_ptr(s, reg, ref_base, ref_off);
>> +        tcg_regset_set_reg(*allocated_regs, reg);
>> +    } else {
>> +        reg = tcg_reg_alloc(s, tcg_target_available_regs[TCG_TYPE_PTR],
>> +                            *allocated_regs, 0, false);
>> +        tcg_out_addi_ptr(s, reg, ref_base, ref_off);
>> +        tcg_out_st(s, TCG_TYPE_PTR, reg, TCG_REG_CALL_STACK,
>> +                   TCG_TARGET_CALL_STACK_OFFSET
>> +                   + stk_slot * sizeof(tcg_target_long));
>> +    }
>> +}

where the pointer is computed, as stack + ref_off.
We can move ref_off anywhere we like because the pointer carries the information.

The need for a copy of the data into *some* spot on the stack was detailed near the beginning:

> +    /*
> +     * The callee is allowed to clobber memory associated with
> +     * structure pass by-reference.  Therefore we must make copies.
> +     * Allocate space from "ref_slot", which will be adjusted to
> +     * follow the parameters on the stack.
> +     */


r~

