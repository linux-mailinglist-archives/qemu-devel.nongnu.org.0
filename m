Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DE86A3E0A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 10:14:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWZaS-0002fq-93; Mon, 27 Feb 2023 04:14:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pWZaP-0002dI-D0
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 04:14:21 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pWZaL-0003YF-CS
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 04:14:19 -0500
Received: from loongson.cn (unknown [10.20.42.238])
 by gateway (Coremail) with SMTP id _____8BxMI9bdPxjJQsGAA--.5702S3;
 Mon, 27 Feb 2023 17:14:04 +0800 (CST)
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxX+RYdPxjhrs+AA--.12777S3; 
 Mon, 27 Feb 2023 17:14:00 +0800 (CST)
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
From: gaosong <gaosong@loongson.cn>
Message-ID: <d052497f-fc2c-17ab-d455-f0a1727b422d@loongson.cn>
Date: Mon, 27 Feb 2023 17:14:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <c5913a52-e5de-4fb5-688c-6d3fb3215353@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8AxX+RYdPxjhrs+AA--.12777S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxGry3ArykJF18tw18CryUZFb_yoW5CFWxpr
 1kuryxXF9xW3s7Jr15Grn8AryUGryUJw15Jr15XF9xCFWjgF1jqr45XFyY9rnxAw4fZw47
 Zr4kXrWjvas8X3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS
 0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0V
 AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1l
 Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42
 xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
 GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI4
 8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4U
 MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I
 8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUzpBTUUUUU
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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


在 2023/2/25 上午3:24, Richard Henderson 写道:
> On 2/23/23 21:24, gaosong wrote:
>> I was wrong, the instruction is to sign-extend the odd or even 
>> elements of the vector before the operation, not to sign-extend the 
>> result.
>> E.g
>> vaddwev_h_b  vd, vj, vk
>> vd->H[i] = SignExtend(vj->B[2i])  + SignExtend(vk->B[2i]);
>> vaddwev_w_h  vd, vj, vk
>> vd->W[i] = SignExtend(vj->H[2i])  + SignExtend(vk->H[2i]);
>> vaddwev_d_w  vd, vj, vk
>> vd->Q[i] = SignExtend(vj->W[2i])  + SignExtend(vk->W[2i]);
>> vaddwev_q_d  vd, vj, vk
>> vd->Q[i] = SignExtend(vj->D[2i])  + SignExtend(vk->D[2i]);
>
> Ok, good example.
>
Sorry ,  My description is not comprehensive.

vaddwedv_w_h  vd, vj, vk

...

for i in range(4):
     vd->W[i] = SignExtend(vj->H[2i], 32)  + SignExtend(vk->H[2i]. 32);

...

>> static void gen_vaddwev_s(unsigned vece, TCGv_vec t, TCGv_vec a, 
>> TCGv_vec b)
>> {
>>      TCGv_vec t1 = tcg_temp_new_vec_matching(a);
>>      TCGv_vec t2 = tcg_temp_new_vec_matching(b);
>>
>>      int halfbits  =  4 << vece;
>>
>>      /* Sign-extend even elements from a */
>>      tcg_gen_dupi_vec(vece, t1, MAKE_64BIT_MASK(0, halfbits));
>>      tcg_gen_and_vec(vece, a, a, t1);
>
> No need to mask off these bits...
>
I am not sure.  but the result is not correct.   It's  weird.


like this:
the vece is MO_32.
static void gen_vaddwev_s(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
{
     TCGv_vec t1 = tcg_temp_new_vec_matching(a);
     TCGv_vec t2 = tcg_temp_new_vec_matching(b);
     int halfbits = 4 << vece;
     tcg_gen_shli_vec(vece, t1, a, halfbits);
     tcg_gen_shri_vec(vece, t1, t1, halfbits);

     tcg_gen_shli_vec(vece, t2, b,  halfbits);
     tcg_gen_shri_vec(vece, t2, t2, halfbits);

     tcg_gen_add_vec(vece, t, t1, t2);

     tcg_temp_free_vec(t1);
     tcg_temp_free_vec(t2);
}
...
        op[MO_16];
         {
             .fniv = gen_vaddwev_s,
             .fno = gen_helper_vaddwev_w_h,
             .opt_opc = vecop_list,
             .vece = MO_32
         },
...
TRANS(vaddwev_w_h, gvec_vvv, MO_16, gvec_vaddwev_s)

input :       0x ffff     fffe ffff     fffe   ffff    fffe ffff fffe  + 0
output :    0x 0000 fffe 0000 fffe  0000 fffe 0000 fffe
the crroect is  0xffffffffefffffffefffffffefffffffe.

Thanks.
Song Gao
>>      tcg_gen_shli_vec(vece, a, a, halfbits);
>
> ... because they shift out here anyway.
>
>>      tcg_gen_sari_vec(vece, a, a, halfbits);
>>
>>      /* Sign-extend even elements from b */
>>      tcg_gen_dupi_vec(vece, t2, MAKE_64BIT_MASK(0, halfbits));
>>      tcg_gen_and_vec(vece, b, b, t2);
>>      tcg_gen_shli_vec(vece, b, b, halfbits);
>>      tcg_gen_sari_vec(vece,  b, b, halfbits);
>>
>>      tcg_gen_add_vec(vece, t, a, b);
>>
>>      tcg_temp_free_vec(t1);
>>      tcg_temp_free_vec(t2);
>> }
>
> Otherwise this looks good.


