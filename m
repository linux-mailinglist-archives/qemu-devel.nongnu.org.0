Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F7365721D
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 03:36:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAMHW-00020l-M4; Tue, 27 Dec 2022 21:35:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pAMHT-00020P-BM
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 21:34:59 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pAMHQ-0007jC-2i
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 21:34:59 -0500
Received: from loongson.cn (unknown [10.20.42.238])
 by gateway (Coremail) with SMTP id _____8DxdPBIq6tjWu0IAA--.20102S3;
 Wed, 28 Dec 2022 10:34:48 +0800 (CST)
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxsORHq6tjL1oOAA--.48409S3; 
 Wed, 28 Dec 2022 10:34:47 +0800 (CST)
Subject: Re: [RFC PATCH 01/43] target/loongarch: Add vector data type vec_t
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-2-gaosong@loongson.cn>
 <99e4fdf2-fe70-03c7-1168-f300ac7a1ead@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <4852b017-1841-cf6f-fbc2-e1789a7f9496@loongson.cn>
Date: Wed, 28 Dec 2022 10:34:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <99e4fdf2-fe70-03c7-1168-f300ac7a1ead@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8BxsORHq6tjL1oOAA--.48409S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7AFyrWr4rWw4fXw17Gr4kJFb_yoW8Ww48pF
 ZYya4ftFyqg3Z3Wr48J3WDGryfXF18Ja1UZr1UXFyvkw47Zrn2gFWjqrWj9a13Cr4kZr15
 JF4Yq3y5uF45ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bxkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
 kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm
 72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04
 k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
 MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr4
 1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l
 IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
 A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1wL05UUUUU==
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.147,
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


在 2022/12/25 上午1:24, Richard Henderson 写道:
> On 12/24/22 00:15, Song Gao wrote:
>> +union fpr_t {
>> +    uint64_t d;
>> +    vec_t vec;
>> +};
>> +
>>   struct LoongArchTLB {
>>       uint64_t tlb_misc;
>>       /* Fields corresponding to CSR_TLBELO0/1 */
>> @@ -251,7 +267,7 @@ typedef struct CPUArchState {
>>       uint64_t gpr[32];
>>       uint64_t pc;
>>   -    uint64_t fpr[32];
>> +    fpr_t fpr[32];
>
> I didn't spot it right away, because you didn't add ".d" to the tcg 
> register allocation, 
Oh,    my mistake.
> but if you use tcg/tcg-op-gvec.h (and you really should), then you 
> will also have to remove
>
>>     for (i = 0; i < 32; i++) {
>>         int off = offsetof(CPULoongArchState, fpr[i]);
>>         cpu_fpr[i] = tcg_global_mem_new_i64(cpu_env, off, fregnames[i]);
>>     }
>
> because one cannot modify global_mem variables with gvec.
>
The manual says "The lower 64 bits of each vector register overlap with 
the floating point register of the same number.  In other words
When the basic floating-point instruction is executed to update the 
floating-point register, the low 64 bits of the corresponding LSX register
are also updated to the same value."

So If we don't use the fpr_t.  we should:
1 Update LSX low 64 bits after floating point instruction translation;
2 Update floating-point registers after LSX instruction translation.

Should we do this  or have I misunderstood?
> I strongly suggest that you introduce wrappers to load/store fpr 
> values from their env slots.  I would name them similarly to 
> gpr_{src,dst}, gen_set_gpr.
>
Got it .

Thanks.
Song Gao


