Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C326A51D1
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 04:31:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWqhe-00025x-H6; Mon, 27 Feb 2023 22:30:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pWqhc-00025j-WF
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 22:30:57 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pWqha-00042S-Hi
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 22:30:56 -0500
Received: from loongson.cn (unknown [10.20.42.238])
 by gateway (Coremail) with SMTP id _____8CxMk5ldf1jfVYGAA--.6383S3;
 Tue, 28 Feb 2023 11:30:45 +0800 (CST)
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cxg+Vjdf1jQ0VAAA--.15563S3; 
 Tue, 28 Feb 2023 11:30:43 +0800 (CST)
Subject: Re: [RFC PATCH 10/43] target/loongarch: Implement vaddw/vsubw
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-11-gaosong@loongson.cn>
 <268ef762-fce5-ca47-d5f7-bd60955a3a0f@linaro.org>
 <f5c0796d-62c9-691a-c2ba-e4dd9e654831@loongson.cn>
 <e75fd2b7-9955-ad2b-62d2-30d7b85d7e7b@linaro.org>
 <f484b933-8f9f-6f0b-0d81-7202bed31d83@loongson.cn>
 <1ad204fc-8f7e-0f1c-e8f6-163d11f3880b@linaro.org>
 <c795a157-21a8-a8d7-bbc1-ed33e7f32747@loongson.cn>
 <c5913a52-e5de-4fb5-688c-6d3fb3215353@linaro.org>
 <5ce46e81-b2c3-8b45-1bd9-9705520f4557@loongson.cn>
 <5b3120cd-ddfb-770b-3216-0f02e89c9c24@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <0ba7a544-347d-0a07-5f73-dff7fd347cc4@loongson.cn>
Date: Tue, 28 Feb 2023 11:30:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5b3120cd-ddfb-770b-3216-0f02e89c9c24@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8Cxg+Vjdf1jQ0VAAA--.15563S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxWFWDWr48ur1rCrWfZFW3trb_yoW5tw48pr
 1ktF17AryDGr1kZryUCw1DWryUtw1UJw1UJrn8Ga4rJrWUtF1qqr1UZr1Y9ryUAr48Zr15
 AryYq347urnrJ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
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
X-Spam_score_int: 13
X-Spam_score: 1.3
X-Spam_bar: +
X-Spam_report: (1.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.089,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


在 2023/2/28 上午2:40, Richard Henderson 写道:
> On 2/27/23 02:55, gaosong wrote:
>>
>> 在 2023/2/25 上午3:24, Richard Henderson 写道:
>>>>          {
>>>>              .fniv = gen_vaddwev_s,
>>>>              .fno = gen_helper_vaddwev_q_d,
>>>>              .opt_opc = vecop_list,
>>>>              .vece = MO_128
>>>>          },
>>>
>>> There are no 128-bit vector operations; you'll need to do this one 
>>> differently.
>>>
>>> Presumably just load the two 64-bit elements, sign-extend into 
>>> 128-bits, add with tcg_gen_add2_i64, and store the two 64-bit 
>>> elements as output.  But that won't fit into the tcg_gen_gvec_3 
>>> interface.
>>>
>> 'sign-extend into 128-bits,'   Could you give a example?
>
> Well, for vadd, as the example we have been using:
>
>     tcg_gen_ld_i64(lo1, cpu_env, offsetof(vector_reg[A].lo));
>     tcg_gen_ld_i64(lo2, cpu_env, offsetof(vector_reg[B].lo));
>     tcg_gen_sari_i64(hi1, lo1, 63);
>     tcg_gen_sari_i64(hi2, lo2, 63);
>     tcg_gen_add2_i64(lo1, hi1, lo1, hi1, lo2, hi2);
>     tcg_gen_st_i64(lo1, cpu_env, offsetof(vector_reg[R].lo));
>     tcg_gen_st_i64(hi1, cpu_env, offsetof(vector_reg[R].hi));
>
> The middle two sari operations replicate the sign bit across the 
> entire high word, so the pair of variables constitute a sign-extended 
> 128-bit value.
>
Thank you .

This is a way  to translate:

static trans_vaddwev_q_d( DisasContext *ctx, arg_vvv *a)
{
     ...
     tcg_gen_ld_i64(lo1, cpu_env, offsetof(vector_reg[A].lo));
     tcg_gen_ld_i64(lo2, cpu_env, offsetof(vector_reg[B].lo));
     tcg_gen_sari_i64(hi1, lo1, 63);
     tcg_gen_sari_i64(hi2, lo2, 63);
     tcg_gen_add2_i64(lo1, hi1, lo1, hi1, lo2, hi2);
     tcg_gen_st_i64(lo1, cpu_env, offsetof(vector_reg[R].lo));
     tcg_gen_st_i64(hi1, cpu_env, offsetof(vector_reg[R].hi));
     ...
}
>> I see a example at target/ppc/translate/vmx-impl.c.inc
>>      static bool do_vx_vprtyb(DisasContext *ctx, arg_VX_tb *a, 
>> unsigned vece)
>>      {
>>              ...
>>              {
>>              .fno = gen_helper_VPRTYBQ,
>>              .vece = MO_128
>>              },
>>              tcg_gen_gvec_2(avr_full_offset(a->vrt), 
>> avr_full_offset(a->vrb),
>>                                 16, 16, &op[vece - MO_32]);
>>          return true;
>>      }
>> TRANS(VPRTYBQ, do_vx_vprtyb, MO_128)
>> ...
>>
>> do_vx_vprtyb  fit the fno into the tcg_gen_gvec_2.
>> I am not sure this  example is right.
>
> Ah, well.  When .fno is the only callback, the implementation is 
> entirely out-of-line, and the .vece member is not used.  I see that is 
> confusing.
>
and This is another way to translate:
     ...
          {
              .fno = gen_helper_vaddwev_q_d,
              .vece = MO_128
          },
     ...
     void HELPER(vaddwev_q_d)(void *vd, void *vj, void *vk, uint32_t v)
     {
         VReg *Vd = (VReg *)vd;
         VReg *Vj = (VReg *)vj;
         VReg *Vk = (VReg *)vk;

         Vd->Q(0) = int128_add((Int128)Vj->D(0), (Int128)Vk->D(0));
     }

These ways are can be chosen?

Thanks.
Song Gao


