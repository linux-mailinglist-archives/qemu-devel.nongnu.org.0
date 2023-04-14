Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C966E1AE8
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 05:49:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnAPh-0003ln-H6; Thu, 13 Apr 2023 23:47:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pnAPd-0003lZ-Jt
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 23:47:49 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pnAPX-00064o-HT
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 23:47:49 -0400
Received: from loongson.cn (unknown [10.20.42.238])
 by gateway (Coremail) with SMTP id _____8Ax69nYzDhkcj4cAA--.43552S3;
 Fri, 14 Apr 2023 11:47:37 +0800 (CST)
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxwOTXzDhk7OkjAA--.11111S3; 
 Fri, 14 Apr 2023 11:47:35 +0800 (CST)
Subject: Re: [RFC PATCH v2 38/44] target/loongarch: Implement vbitsel vset
From: gaosong <gaosong@loongson.cn>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-39-gaosong@loongson.cn>
 <dc51342e-952c-c014-3b60-4dd751646468@linaro.org>
 <ac4562c5-ea37-d57a-b1dd-02b21af72985@loongson.cn>
 <f785b8f3-d7f3-a481-81c3-3603542a0111@linaro.org>
 <58a22259-8bf0-e3fc-720a-0d8d3872e8d3@loongson.cn>
 <a3c6560e-1d7e-1703-b71f-9fbf55871966@linaro.org>
 <5f3746d3-cb99-1300-1c4e-b3d6657c2ff1@loongson.cn>
Message-ID: <b467997b-3abd-d8d6-5933-c52d49fa518d@loongson.cn>
Date: Fri, 14 Apr 2023 11:47:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5f3746d3-cb99-1300-1c4e-b3d6657c2ff1@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8DxwOTXzDhk7OkjAA--.11111S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxZFWxCryxJrWfWFy8urWxZwb_yoW5Kw1xpr
 18JF17JryUJr18Jr1Utw1UtryUtr1UJw1UXr1UJFy8Jw4Dtr1qqr1UXr1qgr1UJr48tr1U
 Jr1UJr17Zr17JrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
 e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
 IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4U
 McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487Mx
 AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
 Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwI
 xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8
 JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
 C2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU25EfUUUUU
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, FORGED_SPF_HELO=1,
 KHOP_HELO_FCRDNS=0.001, NICE_REPLY_A=-1.083, SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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


在 2023/4/14 上午11:22, gaosong 写道:
>
> 在 2023/4/13 下午6:06, Richard Henderson 写道:
>> On 4/13/23 04:53, gaosong wrote:
>>>
>>> 在 2023/4/12 下午2:53, Richard Henderson 写道:
>>>>
>>>>>>> +#define SETANYEQZ(NAME, BIT, E) \
>>>>>>> +void HELPER(NAME)(CPULoongArchState *env, uint32_t cd, uint32_t 
>>>>>>> vj) \
>>>>>>> +{                                                                   
>>>>>>> \
>>>>>>> +    int i; \
>>>>>>> +    bool ret = 
>>>>>>> false;                                               \
>>>>>>> +    VReg *Vj = &(env->fpr[vj].vreg); \
>>>>>>> +                                                                    
>>>>>>> \
>>>>>>> +    for (i = 0; i < LSX_LEN/BIT; i++) 
>>>>>>> {                             \
>>>>>>> +        ret |= (Vj->E(i) == 
>>>>>>> 0);                                     \
>>>>>>> + } \
>>>>>>> +    env->cf[cd & 0x7] = 
>>>>>>> ret;                                        \
>>>>>>> +}
>>>>>>> +SETANYEQZ(vsetanyeqz_b, 8, B)
>>>>>>> +SETANYEQZ(vsetanyeqz_h, 16, H)
>>>>>>> +SETANYEQZ(vsetanyeqz_w, 32, W)
>>>>>>> +SETANYEQZ(vsetanyeqz_d, 64, D)
>>>>>>
>>>>>> These could be inlined, though slightly harder.
>>>>>> C.f. target/arm/sve_helper.c, do_match2 (your n == 0).
>>>>>>
>>>>> Do you mean an inline like trans_vseteqz_v or just an inline 
>>>>> helper function?
>>>>
>>>> I meant inline tcg code generation, instead of a call to a helper.
>>>> But even if we keep this in a helper, see do_match2 for avoiding 
>>>> the loop over bytes. 
>>> Ok,
>>> e.g
>>> #define SETANYEQZ(NAME, MO)                                  \
>>> void HELPER(NAME)(CPULoongArchState *env, uint32_t cd, uint32_t vj) \
>>> { \
>>>      int i;            \
>>>      bool ret = false; \
>>>      VReg *Vj = &(env->fpr[vj].vreg); \
>>> \
>>>      ret = do_match2(0, (uint64_t)Vj->D(0), (uint64_t)Vj->D(1), 
>>> MO);              \
>>>      env->cf[cd & 0x7] = ret;      \
>>> }
>>> SETANYEQZ(vsetanyeqz_b, MO_8)
>>> SETANYEQZ(vsetanyeqz_h, MO_16)
>>> SETANYEQZ(vsetanyeqz_w, MO_32)
>>> SETANYEQZ(vsetanyeqz_d, MO_64)
>>>
>>> and
>>> vsetanyeqz.b    $fcc5  $vr11
>>>    v11    : {edc0004d576eef5b, ec03ec0fec03ea47}
>>> ------------------
>>> do_match2
>>> bits is 8
>>> m1 is ec03ec0fec03ea47
>>> m0 is edc0004d576eef5b
>>> ones is 1010101
>>> sings is 80808080
>>> cmp1 is 0
>>> cmp0 is edc0004d576eef5b
>>> cmp1 is ec03ec0fec03ea47
>>> cmp0 is 10000
>>> cmp1 is 3000100
>>> ret is 0
>>>
>>> but,  the results is not correct  for vsetanyeqz.b. :-)
>>
>> Well, 'ones' as printed above is only 4 bytes instead of 8, similarly 
>> 'sings'.  That would certainly explain why it did not detect a zero 
>> in byte 5 of 'm0'.
>>
>> Some problem with your conversion of that function?
>>
> I copied do_match2  from arm.  and my host is x86 machine.
>
> ...
> uint64_t ones = dup_const(esz, 1);   // esz = MO_8
> uint64_t signs = ones << ( bits  -1 );   // bits = 8
> ...
>
>
> the dup_const() return  0x101010101010101.
>
> but set  the 'ones' is 0x1010101.
>
>
Oh, I didn't include the 'tcg/tcg.h' header file.

Thanks.
Song gao


