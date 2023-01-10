Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1567664CE0
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 20:57:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFKk1-0002DN-EO; Tue, 10 Jan 2023 14:57:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFKjy-0002Bw-NL
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 14:56:59 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFKjw-00064n-8e
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 14:56:58 -0500
Received: by mail-pj1-x1032.google.com with SMTP id q64so13517496pjq.4
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 11:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N6fo+OvG3AYirqXj75knH0969uIfo9sUQ0UgZxbxj4A=;
 b=ZZvhXQ1bm1atE+UFqpV2ZkqRdYLPKG8hhb7PYLdVlCldiSbtqJDidk0QYM5Ll5F5K6
 QDBfG901XL/63Vc4dlRfdsUkJz4OiJy4ZcsHKJFCSKI5O4xqwbfUCIx7Lu8oZbPsvkEA
 5zAI10Ly51EGwrAXEWZtQZ34d4aWcZuD4DYmnI6ew7dAuOZh/lJXmed2rph1k57qiqp1
 LSPoLyAyE5acS5HOk6flFJOdZ9O61OSVzeKL3JYD3c65JhpPNfbX4I/dPPU9YYWiym9S
 jsvkFHsZI3pn7CYbgUQTlyd1zju6CGm2NO0s18LD4F29956nUirUbHM2WcnFeBnpYPz/
 9Yhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N6fo+OvG3AYirqXj75knH0969uIfo9sUQ0UgZxbxj4A=;
 b=wNPsxJrlNVJx22URO368l95UUebPNQEqVxx3n/vcQIoafHuufAGK4L1+7B9ZVEF/GQ
 ucnVBq4VIVgZNH9AjCwJ20A0rUpC7rVWdRJeDAUG2s1Fa4MhQDnnDdO6gvFCf1Uh45zZ
 wRRV7H0MyBu0gTl3CB4WrkogNZGrVI0EFc+IQeiQtVP1qfN13RQu+uI/m/UjoUJTcSEc
 WTCZLvXzSs27GifPgP1bcwIh1PT4KISULuU4ifB3H9McTQA0qKrS6MkiUCHFfwxgyCV/
 F/fpp8uYjs8oDpq0y0iM2srsiWWps7Tje8FT6Dl5eWkSmLaSyQ9L21zHTHy8+49oQ0qF
 QCOA==
X-Gm-Message-State: AFqh2kriWUmAufioVYRl2W50zOcuE8MSbpdj3yMUKVi2PocZ8JzE0iF/
 uOfKmcSJq4Cu1NnazqS8AT5QQw==
X-Google-Smtp-Source: AMrXdXvz7WzVBJp2TbLExOqLv8TawJRNOO/+GqOrzrmxS5V0DBIGBRphgY6UPcO/IYw21Q9/aa9ZnQ==
X-Received: by 2002:a17:90a:ac04:b0:225:ad50:3b18 with SMTP id
 o4-20020a17090aac0400b00225ad503b18mr71000321pjq.25.1673380613503; 
 Tue, 10 Jan 2023 11:56:53 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:8117:35c5:a167:7030?
 ([2602:47:d48c:8101:8117:35c5:a167:7030])
 by smtp.gmail.com with ESMTPSA id
 ml21-20020a17090b361500b002135de3013fsm7606109pjb.32.2023.01.10.11.56.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 11:56:52 -0800 (PST)
Message-ID: <ad150bbe-6a59-7b46-2e7b-bbc8441e118a@linaro.org>
Date: Tue, 10 Jan 2023 11:56:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC] Reducing NEED_CPU_H usage
Content-Language: en-US
To: Alessandro Di Federico <ale@rev.ng>, qemu-devel@nongnu.org
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20221228171617.059750c3@orange>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221228171617.059750c3@orange>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

On 12/28/22 08:16, Alessandro Di Federico wrote:
> ## `target_ulong`
> 
> `target_ulong` is `uint32_t` in 32-bit targets and `uint64_t` in 64-bit
> targets.
> 
> Problem: This is used in many many places to represent addresses in
> code that could become target-independent.
> 
> Proposed solution: we can convert it to:
> 
>      typedef uint64_t target_address;

We have other typedefs that are better for this, e.g. vaddr.

However, at some point we do want to keep some target addresses in the proper size.  For 
instance within the softmmu tlb, where CPUTLBEntry is either 16 or 32 bytes, depending.

(On the other hand, if we drop support for 32-bit hosts, as we keep threatening to do, 
then CPUTLB is always 32 bytes, and we might as well use vaddr there too.  But not until 
32-bit hosts are gone.)

> 
> The problem with this is that, if arithmetic operations are performed
> on it, we might get undesired results:
> 
>      // Was: char load_data(target_ulong address)
>      char load_data(target_address address) {
>        char *base_address = get_base_address();
>        // On a 32-bits target this would overflow, it doesn't with
>        // uint64_t
>        target_address real_address = address + 1;
>        return *(base_address + real_address);
>      }

Doesn't, or shouldn't matter, because we should never do anything like this in generic 
code.  Note that

     vaddr ptr = ...;
     cpu_ldl_le_data(env, ptr + offset)

does not have the problem you describe, because any overflow is truncated within the load 
function.


> ## `abi_ulong`
> 
> Similar to `target_ulong`, but with alignment info.

Pardon?  There's no alignment info in abi_ulong.

The difference is that 'target_ulong' is the size of the target register, and 'abi_ulong' 
is the 'unsigned long' in the target's C ABI.  Consider e.g. x32 (x86_64 with ilp32 abi), 
for which target_ulong is 64-bit but abi_ulong is 32-bit.

This only applies to user-only, and should not matter for this project.

There *is* an 'abi_ptr' type, which is shared between softmmu and user-only, which might 
be able to be replaced by 'vaddr'.  Or 'typedef vaddr abi_ptr' in softmmu mode.  I haven't 
done a survey on that to be certain.

> ## `TCGv`
> 
> `TCGv` is a macro for `TCGv_i32` for 32-bit targets and `TCGv_i64`
> for 64-bit targets.

The idea is that this macro should only be visible to target-specific code, and the macro 
provides the swizzling/encoding to the concrete type functions.

> Problem: it makes `tcg-op.h` 

This is fine.

> and, more importantly, `tcg-op.c`

This one requires some work within tcg/ to handle two target address sizes simultaneously. 
  It should not be technically difficult to solve, but it does involve adding a few TCG 
opcodes and adjusting all tcg backends.


> Solution: transform current functions using them into target-specific
> wrappers that dispatch to target-agnostic functions that accept
> `TCGv_dyn` instead of `TCGv`:
> 
>      typedef struct {
>          union {
>              TCGv_i32 i32;
>              TCGv_i64 i64;
>          };
>          bool is_64;
>      } TCGv_dyn;

This forgets that both TCGv_i32 and TCGv_i64 are represented by TCGTemp, which contains 
'TCGType type' to discriminate.  This is not exposed to target/, but it's there.

Anyway, there's no need for this.

> ## `TARGET_` macros
> 
> These are macros that provide target-specific information.
> 
> Problem: they need to be abandoned in translation units that need to
> become target agnostic.
> 
> Solution: promote them to fields of a `struct`.
> Current ideas:
> 
>      TARGET_TB_PCREL -> TranslationBlock.pc_rel

I'd been thinking a bit on the cpu, but a CF_* bit works well.
It gets initialized for each TB from CPUState.tcg_cflags.
TBD where we'd initialize the new bit for each cpu...


>      TARGET_PAGE_BITS -> TranslationBlock.page_bits
>      TARGET_PAGE_MASK -> TranslationBlock.page_mask

You need to look at how TARGET_PAGE_BITS_VARY works.  The memory subsystem needs rewriting 
if we were to support multiple page sizes.  What we can support now is one single global 
page size, selected at startup.


>      TARGET_PAGE_ALIGN -> CPUArchState.page_align
>                        -> DisasContextBase.page_align

This remains a trivial macro based on the variable TARGET_PAGE_MASK.


>      TARGET_LONG_BITS -> TCGContext.long_bits

Yes.

I've been considering how to generalize this to arbitrary address widths, in order to 
better support ARM top-byte-ignore and RISC-V J extension (pointer masking).  But in the 
short term I'm happy with this number being exactly 64 or 32.

>      TARGET_PAGE_SIZE -> ???

Remains a trivial macro based on the variable TARGET_PAGE_MASK.

>      TCG_OVERSIZED_GUEST -> ???

Goes away if we drop support for 32-bit hosts, or restrict 32-bit hosts to 32-bit guests. 
I have no other good ideas.


>      TARGET_FMT_lx -> ???

VADDR_PRIx, mostly.  May need resolving on a case-by-case basis.

>      CPU_RESOLVING_TYPE -> ???

Would need to be part of the per-target shared library interface.

> ## `CPUState`
> 
> `CPUState` is a target-agnostic `struct` representing common information
> of `ArchCPU`.
> 
> Problem: given an (opaque) pointer to `CPU${Arch}State`,
> target-agnostic code often wants to reach `CPUState`, but this requires
> knowledge of the layout of `ArchCPU`, which is target-dependent.
> 
> Solution: have a target-specific function to obtain the pointer to
> `CPUState` given `CPU${Arch}State`. Where this function would go, and
> how it would be retrieved, needs more consideration.
> I imagine a table of target-specific function pointers.

For the most part, generic code should be converted to use CPUState as much as possible, 
and only target-specific code should deal with CPUArchState.

However, generic code and the tcg backend need to be able to find CPUNegativeOffsetState 
from CPUArchState.  This is (and must be) a per-target constant; we cannot allow full 
flexibility of function pointers.

We currently have CPUState.env_ptr; we can add 'CPUNegativeOffsetState *neg_ptr' to match, 
then the per-target constant is the difference between the two pointers.

> ## `CPUNegativeOffsetState`
> 
> `CPUNegativeOffsetState` is a `struct` placed in `ArchCPU` before
> `CPU${Arch}State`.
> 
>      struct ArchCPU {
>          /*< private >*/
>          CPUState parent_obj;
>          /*< public >*/
>      
>          CPUNegativeOffsetState neg;
>          CPUAlphaState env;
>      
>          /* This alarm doesn't exist in real hardware; we wish it did.
>      */ QEMUTimer *alarm_timer;
>      };
> 
> Problem: used in several parts of the code that need to become
> target-agnostic.
> 
> Solution: make it target-agnostic and push it into `CPUState`, which is
> the place for target-agnostic stuff.
> 
> I'm not sure why this isn't already the case. I'm probably missing
> something here, so feedback is welcome.

For code generation quality, we need small negative displacements from env to find 
icount_decr (used at the start of each TB), and CPUTLBDescFast[n].  Host specific 
addressing modes (arm32, arm64, riscv) require the maximum of these displacements to be >= 
-(1 << 11).

Thus CPUNegativeOffsetState, and the documented (but not enforced) requirement that 'neg' 
immediately precede 'env'.  The alignment requirements of env mean that there may be some 
small amount of padding between the two.

Before CPUNegativeOffsetState, we had all of those variables within CPUState, and even 
comments that they should remain at the end of the struct.  But those comments were 
ignored and one day icount_decr was too far away from env for easy addressing on arm host. 
  Luckily there was an assert that fired, but it didn't get caught right away.

As for NB_MMU_MODES, which CPUTLB depends on, we could fix this at 16.  This is larger 
than all current targets (arm, 12; ppc 10), and is also the maximum currently supported by 
the softmmu tlb api (uint16_t idxmap).

Once upon a time it was quite expensive to have many mmu modes, as we directly allocated 
their storage within CPUState.  But now we dynamically resize softmmu tlbs, so the 
overhead of an unused mmu index is fairly low (sizeof(CPUTLBDesc) + sizeof(CPUTLBDescFast)).

> # Current status
> 
> We currently have a branch where we can build (but not link nor run) a
> `x86_64-linux-user` configuration where `NEED_CPU_H` is defined only
> for translation units in `target/` and `linux-user/`.

This effort should be exclusive to system mode -- don't consider *-user at all.
Each linux-user target bakes in not just target architecture parameters, which are 
complicated enough, but also C ABI, and kernel API.  Moreover, the most common use case 
for linux-user is a statically linked binary that operates within a chroot.

All you need for *-user is to make sure you don't accidentally break them while doing 
system mode cleanup.


r~

