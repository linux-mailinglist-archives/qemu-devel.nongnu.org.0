Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 551166A1708
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 08:25:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVSRU-0002sM-1e; Fri, 24 Feb 2023 02:24:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pVSR9-0002qA-7n
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 02:24:11 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pVSR6-00061I-Gi
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 02:24:10 -0500
Received: from loongson.cn (unknown [10.20.42.238])
 by gateway (Coremail) with SMTP id _____8BxIk4TZvhjgJUEAA--.3446S3;
 Fri, 24 Feb 2023 15:24:03 +0800 (CST)
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Axfb4RZvhjGWQ6AA--.45230S3; 
 Fri, 24 Feb 2023 15:24:01 +0800 (CST)
From: gaosong <gaosong@loongson.cn>
Subject: Re: [RFC PATCH 10/43] target/loongarch: Implement vaddw/vsubw
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-11-gaosong@loongson.cn>
 <268ef762-fce5-ca47-d5f7-bd60955a3a0f@linaro.org>
 <f5c0796d-62c9-691a-c2ba-e4dd9e654831@loongson.cn>
 <e75fd2b7-9955-ad2b-62d2-30d7b85d7e7b@linaro.org>
 <f484b933-8f9f-6f0b-0d81-7202bed31d83@loongson.cn>
 <1ad204fc-8f7e-0f1c-e8f6-163d11f3880b@linaro.org>
Message-ID: <c795a157-21a8-a8d7-bbc1-ed33e7f32747@loongson.cn>
Date: Fri, 24 Feb 2023 15:24:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1ad204fc-8f7e-0f1c-e8f6-163d11f3880b@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8Axfb4RZvhjGWQ6AA--.45230S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3AFy8CrWruF48XFy7CFW3Jrb_yoW7ZFyDpr
 1rGF1xXFyDG348Jr1rKw1UGryUGr1xJw15Jr1rJan7AryYqr1qqr1UXw1j9r1UCr48Zw1U
 Zw1jvr1UZrn8XrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
 x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
 e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
 IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4U
 McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487Mx
 AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
 Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwI
 xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8
 JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
 C2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUrNtxDUUUU
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


在 2023/2/23 下午11:22, Richard Henderson 写道:
> On 2/22/23 22:23, gaosong wrote:
>> Hi, Richard
>>
>> 在 2023/2/21 上午1:21, Richard Henderson 写道:
>>> On 2/19/23 21:47, gaosong wrote:
>>>> I have some questions:
>>>> 1 Should we need implement  GVecGen*  for simple gvec instructiosn?
>>>>      such as add, sub , or , xor..
>>>
>>> No, these are done generically.
>>>
>>>> 2 Should we need implement all fni8/fni4, fniv,  fno?
>>>
>>> You need not implement them all.  Generally you will only implement 
>>> fni4 for 32-bit arithmetic operations, and only fni8 for logical 
>>> operations; there is rarely a cause for both with the same operation.
>>>
>>> You can rely on the generic cutoff of 4 integer inline operations -- 
>>> easy for your maximum vector length of 128-bits -- to avoid 
>>> implementing fno.
>>>
>>> But in extreme, you can implement only fno.  You can choose this 
>>> over directly calling a helper function, minimizing differences in 
>>> the translator code paths and letting generic code build all of the 
>>> pointers.
>>>
>> Sorry for the late reply,  and Thanks for you answers.
>>
>> But I still need more help.
>>
>> How gvec singed or unsigned extensions of vector elements?
>
> There are no generic sign-extending; that turns out to be widely 
> variable across the different hosts and guest architectures.
>
> If your architecture widens the even elements, you can implement 
> extensions as a pair of shifts in the wider element size.  E.g. 
> sign-extend is shl + sar.
>
>> I found no gvec function that implements signed and unsigned 
>> extensions of vector elements.
>> However, the result of some instructions requires the elements to be 
>> signed or unsigned extensions.
>
> You may need to implement these operations with fni[48] or out of line 
> in a helper.
> It's hard to give advice without a specific example. 
I was wrong, the instruction is to sign-extend the odd or even elements 
of the vector before the operation, not to sign-extend the result.
E.g
vaddwev_h_b  vd, vj, vk
vd->H[i] = SignExtend(vj->B[2i])  + SignExtend(vk->B[2i]);
vaddwev_w_h  vd, vj, vk
vd->W[i] = SignExtend(vj->H[2i])  + SignExtend(vk->H[2i]);
vaddwev_d_w  vd, vj, vk
vd->Q[i] = SignExtend(vj->W[2i])  + SignExtend(vk->W[2i]);
vaddwev_q_d  vd, vj, vk
vd->Q[i] = SignExtend(vj->D[2i])  + SignExtend(vk->D[2i]);


Use  shl + sar  to sign-extend  vj/vk  even element.

static bool gvec_vvv(DisasContext *ctx, arg_vvv *a, MemOp mop,
                      void (*func)(unsigned, uint32_t, uint32_t,
                                   uint32_t, uint32_t, uint32_t))
{
     uint32_t vd_ofs, vj_ofs, vk_ofs;

     CHECK_SXE;

     vd_ofs = vreg_full_offset(a->vd);
     vj_ofs = vreg_full_offset(a->vj);
     vk_ofs = vreg_full_offset(a->vk);

     func(mop, vd_ofs, vj_ofs, vk_ofs, 16, 16);
     return true;
}
static void gen_vaddwev_s(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
{
     TCGv_vec t1 = tcg_temp_new_vec_matching(a);
     TCGv_vec t2 = tcg_temp_new_vec_matching(b);

     int halfbits  =  4 << vece;

     /* Sign-extend even elements from a */
     tcg_gen_dupi_vec(vece, t1, MAKE_64BIT_MASK(0, halfbits));
     tcg_gen_and_vec(vece, a, a, t1);
     tcg_gen_shli_vec(vece, a, a, halfbits);
     tcg_gen_sari_vec(vece, a, a, halfbits);

     /* Sign-extend even elements from b */
     tcg_gen_dupi_vec(vece, t2, MAKE_64BIT_MASK(0, halfbits));
     tcg_gen_and_vec(vece, b, b, t2);
     tcg_gen_shli_vec(vece, b, b, halfbits);
     tcg_gen_sari_vec(vece,  b, b, halfbits);

     tcg_gen_add_vec(vece, t, a, b);

     tcg_temp_free_vec(t1);
     tcg_temp_free_vec(t2);
}

static void gvec_vaddwev_s(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
                            uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
{
     static const TCGOpcode vecop_list[] = {
         INDEX_op_shli_vec, INDEX_op_shri_vec, INDEX_op_add_vec, 
INDEX_op_sari_vec, 0
         };
     static const GVecGen3 op[4] = {
         {
             .fniv = gen_vaddwev_s,
             .fno = gen_helper_vaddwev_h_b,
             .opt_opc = vecop_list,
             .vece = MO_16
         },
         {
             .fniv = gen_vaddwev_s,
             .fno = gen_helper_vaddwev_w_h,
             .opt_opc = vecop_list,
             .vece = MO_32
         },
         {
             .fniv = gen_vaddwev_s,
             .fno = gen_helper_vaddwev_d_w,
             .opt_opc = vecop_list,
             .vece = MO_64
         },
         {
             .fniv = gen_vaddwev_s,
             .fno = gen_helper_vaddwev_q_d,
             .opt_opc = vecop_list,
             .vece = MO_128
         },
     };

     tcg_gen_gvec_3(vd_ofs, vj_ofs, vk_ofs, oprsz, maxsz, &op[vece]);
}

TRANS(vaddwev_h_b, gvec_vvv, MO_8,  gvec_vaddwev_s)
TRANS(vaddwev_w_h, gvec_vvv, MO_16, gvec_vaddwev_s)
TRANS(vaddwev_d_w, gvec_vvv, MO_32, gvec_vaddwev_s)
TRANS(vaddwev_q_d, gvec_vvv, MO_64, gvec_vaddwev_s)

and I also implement  gen_helper_vaddwev_x_x.     Is this example correct?

Thanks.
Song Gao


