Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CF466871F
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 23:41:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG6Ff-0002Yr-0K; Thu, 12 Jan 2023 17:40:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pG6Fc-0002X0-FE
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 17:40:48 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pG6Fa-00010a-Fn
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 17:40:48 -0500
Received: by mail-pg1-x52b.google.com with SMTP id b12so13788117pgj.6
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 14:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XztbSnwPLQCxmG57NAmic9tDH/k5zT1KX3CXhEtZNZw=;
 b=wmJbtq0w/PzZz99Mwon9WPSC4cSt8GOLWzHTH2KoOE60v675ih0a5zZS2tSZgVvScM
 5lGMe8iiqvjNOa2XK7B9CbSDZu47Pa4o6dg7BTJDINcajiBy3swT5ad2nWVtU9uJJYbv
 qQVJqXE7PolPqqLCpcF7ezQidz6zE1i49s9/Y4MhqHvXZMYoiKHBpAZZ7OcaNxldtpsh
 h3cQr02vpAbH36EOl/dMqVxYLWxtpfuBXqbud/+bqh2SO6AL2g1I5bcCnm2Kv7CKvX/2
 ZT/aL4LbDseEKZf1VLL2wwsdrsPNzDbhKsLCXfizjJtK/etHY/Ad2PXsYs6QPrZPYHci
 dA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XztbSnwPLQCxmG57NAmic9tDH/k5zT1KX3CXhEtZNZw=;
 b=bbvO7NhYEm+vJBCDlpka8gBW9BtGDP/92/8iHVoCpRxjH7T9k4km/erNTrr3gOIbh5
 YPJ3EBqyYSjknJ/aGAoDCKvjewuRcmg1v0SiILmYoUoxasvkWOSjNfdHyzYaI0vWIG0p
 jIvh2L4wT3OL8QwDQVePL0v5kEihqODo5wntXWdaL4zmRAev3J7zR7J9FDMeO2VUmfvw
 EVJ3snwm0Isb3WdGPmyii51SaKjP0Ewob5vrpGZm2EJ9zKdGJr22t207PZbHnq7zuqpQ
 +PnNvJ/16YFw5JMbmMrvYIB8J/BIUZpquBi1CvYBN8rwEqUqyvo54iw3FodwDJ0Fooj0
 p4Lg==
X-Gm-Message-State: AFqh2kq7pwqStb2Gj5AwlsVnsd7EdrY8vyu+UNrSHkJOMW0lrvRujAKG
 wbeDstyjGpBJK3v+BO1JYDM12AoiviXfqz+0
X-Google-Smtp-Source: AMrXdXubROw6sF6G3F0bNelekPUWoX3BDSWRcydvueg6RKMjrTCkeEF1q6xrwm+1ihH0Jqv5yEeZmg==
X-Received: by 2002:aa7:9526:0:b0:587:405a:421c with SMTP id
 c6-20020aa79526000000b00587405a421cmr21759032pfp.7.1673563244551; 
 Thu, 12 Jan 2023 14:40:44 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 i15-20020a62870f000000b005890c5ed925sm7865971pfe.198.2023.01.12.14.40.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 14:40:43 -0800 (PST)
Message-ID: <736c79a6-643d-360d-90ea-20f3508293fe@linaro.org>
Date: Thu, 12 Jan 2023 12:40:40 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC] Reducing NEED_CPU_H usage
Content-Language: en-US
To: Alessandro Di Federico <ale@rev.ng>
Cc: qemu-devel@nongnu.org, Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20221228171617.059750c3@orange>
 <ad150bbe-6a59-7b46-2e7b-bbc8441e118a@linaro.org>
 <20230112162821.21ae8d7a@orange>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230112162821.21ae8d7a@orange>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/12/23 07:28, Alessandro Di Federico wrote:
> On Tue, 10 Jan 2023 11:56:50 -0800
> Richard Henderson <richard.henderson@linaro.org> wrote:
> 
>> However, at some point we do want to keep some target addresses in
>> the proper size.  For instance within the softmmu tlb, where
>> CPUTLBEntry is either 16 or 32 bytes, depending.
> 
> So that would be an optimization if `HOST_LONG_BITS == 32 &&
> TARGET_LONG_BITS == 32`, correct?

At present, not an 'optimization' but 'natural fallout of type sizes'.
But, yeah.

>>> ## `abi_ulong`
>>>
>>> Similar to `target_ulong`, but with alignment info.
>>
>> Pardon?  There's no alignment info in abi_ulong.
> 
>  From include/exec/user/abitypes.h:
> 
>      typedef uint32_t abi_ulong __attribute__((aligned(ABI_LONG_ALIGNMENT)));
>      typedef target_ulong abi_ulong __attribute__((aligned(ABI_LONG_ALIGNMENT)));
> 
> I thought that was the difference. Thanks for the clarification.

Ah, I see what you mean.  I *believe* that use of target_ulong could actually be uint64_t, 
since all TARGET_LONG_BITS == 32 ought to have TARGET_ABI32 set too (which brings us to 
that first definition with uint32_t.)

There is a target alignment difference, for the benefit of e.g. m68k, which has 
sizeof(long) == 4 and __alignof(long) == 2, which may differ by the host.

In any case, all of "exec/abitypes.h" is (or should be) user-only related, so out of scope 
for this project.

>> This one requires some work within tcg/ to handle two target address
>> sizes simultaneously. It should not be technically difficult to
>> solve, but it does involve adding a few TCG opcodes and adjusting all
>> tcg backends.
> 
> I'm a bit confused by this, do backends for some reason have
> expectations about the address size?
> Wouldn't this be enough?

Yes, this affects the tcg backend as well:

static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
{
...
     datalo = *args++;
     datahi = (TCG_TARGET_REG_BITS == 32 && is64 ? *args++ : 0);
     addrlo = *args++;
     addrhi = (TARGET_LONG_BITS > TCG_TARGET_REG_BITS ? *args++ : 0);
     oi = *args++;

and further code generation changes especially for 64-bit guest pointer comparisons on 
32-bit hosts.  (There's that nasty combination again.)

There's also code generation changes for 32-bit guest pointer comparisons on 64-bit hosts, 
e.g.

static inline void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
                                     int mem_index, MemOp opc,
                                     tcg_insn_unit **label_ptr, int which)
{
...
     TCGType tlbtype = TCG_TYPE_I32;
     int trexw = 0, hrexw = 0, tlbrexw = 0;
...
     if (TCG_TARGET_REG_BITS == 64) {
         if (TARGET_LONG_BITS == 64) {
             ttype = TCG_TYPE_I64;
             trexw = P_REXW;
         }
         if (TCG_TYPE_PTR == TCG_TYPE_I64) {
             hrexw = P_REXW;
             if (TARGET_PAGE_BITS + CPU_TLB_DYN_MAX_BITS > 32) {
                 tlbtype = TCG_TYPE_I64;
                 tlbrexw = P_REXW;
             }
         }
     }
...
     /* cmp 0(r0), r1 */
     tcg_out_modrm_offset(s, OPC_CMP_GvEv + trexw, r1, r0, which);

which generates either 'cmpl' or 'cmpq' depending on the guest address size.

>> Anyway, there's no need for this.
> 
> So, if I got it right, we could just make TCGv become a new opaque
> type, propagate it down until the spot where we actually need to know
> its size and then just have some `TCGTemp *tcgv_temp(TCGv v)` function
> to inspect the actual size?

No, leave TCGv as a macro, but we need changes to "tcg/tcg-op*.h", so that all of the 
above tcg backend stuff *also* gets disconnected from TARGET_LONG_BITS.

> Makes sense!
> 
>> Before CPUNegativeOffsetState, we had all of those variables within
>> CPUState, and even comments that they should remain at the end of the
>> struct.  But those comments were ignored and one day icount_decr was
>> too far away from env for easy addressing on arm host. Luckily there
>> was an assert that fired, but it didn't get caught right away.
> 
> How comes it wasn't caught immediately?
> We could have something like:
> 
>      QEMU_BUILD_BUG_MSG(&ArchCPU.env - &ArchCPU.neg.tlb
>                         < DESIRED_THRESHOLD)

We probably should.

But it didn't affect x86, and cross-build testing wasn't sufficient, so we didn't find out 
later when someone did runtime testing on the affected hosts.

> Our current goal is to get the following compilation unit to build
> without NEED_CPU_H:
> 
>      trace/control-target.c
>      gdbstub/gdbstub.c
>      cpu.c
>      disas.c
>      page-vary.c
>      tcg/optimize.c
>      tcg/region.c
>      tcg/tcg.c
>      tcg/tcg-common.c
>      tcg/tcg-op.c
>      tcg/tcg-op-gvec.c
>      tcg/tcg-op-vec.c
>      fpu/softfloat.c
>      accel/accel-common.c
>      accel/tcg/tcg-all.c
>      accel/tcg/cpu-exec-common.c
>      accel/tcg/cpu-exec.c
>      accel/tcg/tb-maint.c
>      accel/tcg/tcg-runtime-gvec.c
>      accel/tcg/tcg-runtime.c
>      accel/tcg/translate-all.c
>      accel/tcg/translator.c
>      accel/tcg/user-exec.c
>      accel/tcg/user-exec-stub.c
>      accel/tcg/plugin-gen.c
>      plugins/loader.c
>      plugins/core.c
>      plugins/api.c
> 
> They are subset of `arch_srcs` from `meson.build`.

Reasonable.  I think accel/tcg/user-exec.c is the only one that isn't also required for 
system mode, and completing accel/tcg/ would be less confusing than not.


r~

