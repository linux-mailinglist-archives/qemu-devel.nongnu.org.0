Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3C8454306
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 09:55:08 +0100 (CET)
Received: from localhost ([::1]:55632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnGii-00076p-2u
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 03:55:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mnGhk-0006Om-48
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 03:54:08 -0500
Received: from mail.loongson.cn ([114.242.206.163]:37934 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mnGhf-0005xx-Uo
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 03:54:07 -0500
Received: from localhost.localdomain (unknown [10.20.42.11])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxSLInw5RhvdMAAA--.1821S3;
 Wed, 17 Nov 2021 16:53:59 +0800 (CST)
Subject: Re: [RFC PATCH v2 09/30] target/loongarch: Add TLB instruction support
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
 <1636594528-8175-10-git-send-email-yangxiaojuan@loongson.cn>
 <f1059243-06e9-d9d8-673a-55fc6e31b5cc@linaro.org>
 <a268c269-7a3d-b8c6-5e69-786fbd238b05@loongson.cn>
 <22096fc3-859c-a795-16f4-e5c7dbe00e8d@linaro.org>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <4d7643ed-e52b-401f-b091-934fa252a399@loongson.cn>
Date: Wed, 17 Nov 2021 16:53:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <22096fc3-859c-a795-16f4-e5c7dbe00e8d@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9DxSLInw5RhvdMAAA--.1821S3
X-Coremail-Antispam: 1UD129KBjvJXoW7KFWfAryrtr1kXFWxWw4fGrg_yoW8try3p3
 4rGFWUKa1Uuw1vqwnFqw1qkw13tw4rKr4rGw1rt395ArsrWFZa9rn3K3429Fy8ursrXa1a
 vr4Yvayv9ay3tFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBj14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
 xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 64x0Y40En7xvr7AKxVWUJVW8JwAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI
 0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8v
 x2IErcIFxwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrw
 CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
 14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
 IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxK
 x2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
 AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUsJ5rUUUUU=
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.009,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/17/2021 04:22 PM, Richard Henderson wrote:
> On 11/17/21 8:29 AM, yangxiaojuan wrote:
>> On 11/12/2021 02:14 AM, Richard Henderson wrote:
>>> On 11/11/21 2:35 AM, Xiaojuan Yang wrote:
>>>> +static bool trans_tlbwr(DisasContext *ctx, arg_tlbwr *a)
>>>> +{
>>>> +    gen_helper_check_plv(cpu_env);
>>>> +    gen_helper_tlbwr(cpu_env);
>>>> +    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next + 4);
>>>> +    ctx->base.is_jmp = DISAS_EXIT;
>>>> +    return true;
>>>> +}
>>>
>>> I think you can skip the EXIT if paging is disabled, which it usually will be in the software tlb handler.  You'd be able to tell with the mmu_idx being the one you use for paging disabled.
>>
>> The paging disabled only enabled at the bios startup, we can get the phys address directly, tlbwr instruction will not be used when paging enabled.
> 
> Paging is also disabled during TLBRENTRY exception (see section 6.2.4 Hardware Exception Handling of TLB Refil Exception).  It is this routine that will usually use tlbwr most often (although the kernel at PRV 0 is not prevented from doing so).

Sorry, I forgot this situation.

> 
>>>> +    default:
>>>> +        do_raise_exception(env, EXCP_INE, GETPC());
>>>
>>> You can detect this during translation, and dispatch to the appropriate invtlb sub-function.
>>>
>> oh, sorry, I don't quiet understand this. detect during the translation sees more complicated.
> 
> It is not more complex at all.  Less complex, I would say.
> 
> static bool trans_invtlb(DisasContext *ctx, arg_invtlb *a)
> {
>     TCGv rj = gpr_src(ctx, a->rj, EXT_NONE);
>     TCGv rk = gpr_src(ctx, a->rk, EXT_NONE);
> 
>     if (check_plv(ctx)) {
>         return false;
>     }
> 
>     switch (a->invop) {
>     case 0:
>     case 1:
>         gen_helper_invtlb_all(cpu_env);
>         break;
>     case 2:
>         gen_helper_invtlb_all_g(cpu_env, tcg_constant_i32(1));
>         break;
>     case 3:
>         gen_helper_invtlb_all_g(cpu_env, tcg_constant_i32(0));
>         break;
>     case 4:
>         gen_helper_invtlb_all_asid(cpu_env, rj);
>         break;
>     case 5:
>         gen_helper_invtlb_page_asid(cpu_env, rj, rk);
>         break;
>     case 6:
>         gen_helper_invtlb_page_asid_or_g(cpu_env, rj, rk);
>         break;
>     default:
>         return false;
>     }
>     ctx->base.is_jmp = DISAS_STOP;
>     return true;
> }
> 
Thank you. I get it.
> 
> r~


