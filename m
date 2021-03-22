Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FD2344CD7
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 18:09:28 +0100 (CET)
Received: from localhost ([::1]:43448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOO3T-0000G7-IN
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 13:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lONzK-0006PO-Ms
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 13:05:10 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:38750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lONzE-0002d4-2F
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 13:05:10 -0400
Received: by mail-qt1-x832.google.com with SMTP id j7so12873297qtx.5
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 10:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0hCkYXWH+byEUcHT5vkfZF5m9taaEYq8XZFSb+6EVEQ=;
 b=X20odr8IMfTHy8xv+xoN8wdLUROfPGQyG3B4Qk0afmnXd4rqOY95wmOhNf/CaL/z47
 9tw/deGN96hdpGw4+ae/LXmimOwagGwsCHYfSekWTcumuGvlMH8XO0NnuBELwxyFSiKr
 mxpfLHnRWP5TPgzv4yBS4Qw5iOowedYtYyx0NC6WUiab3mXwsMh/75QE629vPXUCaPqV
 Cc4aRbtuR8KGDOtfV3a3SOmuMXrYa/hDyFkzGUv2WVvsoYod6skwTUZAbCie5uTZZJzA
 eSmjceCKtvGk5PdZg8g5X9hm2GTY7yjJqqHklPCelynrAsBl1xc9AGuA6f2LowLObfkC
 rFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0hCkYXWH+byEUcHT5vkfZF5m9taaEYq8XZFSb+6EVEQ=;
 b=Jq9Rzdl9W+2UOj8WQkQVg9FnXmhQOyy/OuGn2WIQJMrto+MJ+DmffjP+TRKdzfBU2y
 +RtB1BDX6l9pfcgxFX9mIp03hF5VEizFP5OxXGcWiL59tLRt6+n5RyHOIp1snEUPslMh
 KEN/b4Q5EcbzRD39WloFehdppyu+VZEiRFJ0lmgQSl6I+Uiu7xX1tsxRv5t3cS6zKREJ
 RNIwLkvTvewBfO/ovj9wBjVPONTYIIOat0VVXUaDC3aeynx687BRBX0BPVIVIqrlpsjo
 JAz+Xpk0mDaldeHFjs5nswNnojPjczrfdI6c/2QIq+cL9YeKbRfoYEgp6FXh/0SGR23w
 RtgA==
X-Gm-Message-State: AOAM53013haO2l0Q2w4ySfX/sE0SSGp6hK2ACKbyHuSORhzil8PUpBI9
 BH7dDx77CxcXT9PDS07qZyHqRg==
X-Google-Smtp-Source: ABdhPJxz5y1ZlItI9s9jOMz4c40du8cTCNOS2M3Lb/aY04k1VmrB5nSoFDLGhCKIn5ZiqySAY1UERQ==
X-Received: by 2002:ac8:664a:: with SMTP id j10mr806897qtp.119.1616432702938; 
 Mon, 22 Mar 2021 10:05:02 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id j30sm9453583qtv.90.2021.03.22.10.05.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 10:05:02 -0700 (PDT)
Subject: Re: [PATCH v4 10/17] target/ppc: Create helper_scv
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
 <20210315184615.1985590-11-richard.henderson@linaro.org>
 <YFgWYQ8tPzWfwxDl@yekko.fritz.box>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2ac37568-078c-2d51-18fd-d93ed10f39af@linaro.org>
Date: Mon, 22 Mar 2021 11:05:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YFgWYQ8tPzWfwxDl@yekko.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x832.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/21/21 10:00 PM, David Gibson wrote:
> On Mon, Mar 15, 2021 at 12:46:08PM -0600, Richard Henderson wrote:
>> Perform the test against FSCR_SCV at runtime, in the helper.
>>
>> This means we can remove the incorrect set against SCV in
>> ppc_tr_init_disas_context and do not need to add an HFLAGS bit.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/ppc/helper.h      |  1 +
>>   target/ppc/excp_helper.c |  9 +++++++++
>>   target/ppc/translate.c   | 20 +++++++-------------
>>   3 files changed, 17 insertions(+), 13 deletions(-)
>>
>> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
>> index 6a4dccf70c..513066d54d 100644
>> --- a/target/ppc/helper.h
>> +++ b/target/ppc/helper.h
>> @@ -13,6 +13,7 @@ DEF_HELPER_1(rfci, void, env)
>>   DEF_HELPER_1(rfdi, void, env)
>>   DEF_HELPER_1(rfmci, void, env)
>>   #if defined(TARGET_PPC64)
>> +DEF_HELPER_2(scv, noreturn, env, i32)
>>   DEF_HELPER_2(pminsn, void, env, i32)
>>   DEF_HELPER_1(rfid, void, env)
>>   DEF_HELPER_1(rfscv, void, env)
>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> index 85de7e6c90..5c95e0c103 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -1130,6 +1130,15 @@ void helper_store_msr(CPUPPCState *env, target_ulong val)
>>   }
>>   
>>   #if defined(TARGET_PPC64)
>> +void helper_scv(CPUPPCState *env, uint32_t lev)
>> +{
>> +    if (env->spr[SPR_FSCR] & (1ull << FSCR_SCV)) {
>> +        raise_exception_err(env, POWERPC_EXCP_SYSCALL_VECTORED, lev);
>> +    } else {
>> +        raise_exception_err(env, POWERPC_EXCP_FU, FSCR_IC_SCV);
>> +    }
>> +}
>> +
>>   void helper_pminsn(CPUPPCState *env, powerpc_pm_insn_t insn)
>>   {
>>       CPUState *cs;
>> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
>> index 7912495f28..d48c554290 100644
>> --- a/target/ppc/translate.c
>> +++ b/target/ppc/translate.c
>> @@ -173,7 +173,6 @@ struct DisasContext {
>>       bool vsx_enabled;
>>       bool spe_enabled;
>>       bool tm_enabled;
>> -    bool scv_enabled;
>>       bool gtse;
>>       ppc_spr_t *spr_cb; /* Needed to check rights for mfspr/mtspr */
>>       int singlestep_enabled;
>> @@ -4081,15 +4080,16 @@ static void gen_sc(DisasContext *ctx)
>>   #if !defined(CONFIG_USER_ONLY)
>>   static void gen_scv(DisasContext *ctx)
>>   {
>> -    uint32_t lev;
>> +    uint32_t lev = (ctx->opcode >> 5) & 0x7F;
>>   
>> -    if (unlikely(!ctx->scv_enabled)) {
>> -        gen_exception_err(ctx, POWERPC_EXCP_FU, FSCR_IC_SCV);
>> -        return;
>> +    /* Set the PC back to the faulting instruction. */
>> +    if (ctx->exception == POWERPC_EXCP_NONE) {
>> +        gen_update_nip(ctx, ctx->base.pc_next - 4);
>>       }
> 
> I don't quite understand this.  Don't we need the NIP to be on the scv
> instruction itself for the case where we get a facility unavailable
> exception, but on the next instruction if we actually take the system
> call?  This appears to be unconditional.
> 
>> +    gen_helper_scv(cpu_env, tcg_constant_i32(lev));
>>   
>> -    lev = (ctx->opcode >> 5) & 0x7F;
>> -    gen_exception_err(ctx, POWERPC_SYSCALL_VECTORED, lev);

Hmm.  In the old code, both paths use gen_exception_err, without otherwise 
manipulating NIP.  That suggests to me that both exceptions receive the same 
value in NIP.

Is there an adjustment to NIP when delivering the SCV exception?  Yep:

     case POWERPC_EXCP_SYSCALL_VECTORED:
         lev = env->error_code;
         dump_syscall_vectored(env);
         env->nip += 4;
         new_msr |= env->msr & ((target_ulong)1 << MSR_EE);
         new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
         break;


r~

