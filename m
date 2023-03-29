Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD53B6CD09F
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 05:25:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phMQI-0005BO-BG; Tue, 28 Mar 2023 23:24:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1phMQA-0005Af-Ue
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 23:24:22 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1phMPz-0001LI-Ow
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 23:24:22 -0400
Received: from loongson.cn (unknown [10.20.42.238])
 by gateway (Coremail) with SMTP id _____8DxE0xQryNkIoQTAA--.30214S3;
 Wed, 29 Mar 2023 11:24:00 +0800 (CST)
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bxab1QryNkTxAQAA--.9993S3; 
 Wed, 29 Mar 2023 11:24:00 +0800 (CST)
Subject: Re: [RFC PATCH v2 09/44] target/loongarch: Implement vhaddw/vhsubw
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-10-gaosong@loongson.cn>
 <6c587ced-fcb2-f537-94c7-9612e1499f2e@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <0536d40a-4784-809f-84fb-09416617c583@loongson.cn>
Date: Wed, 29 Mar 2023 11:24:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <6c587ced-fcb2-f537-94c7-9612e1499f2e@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8Bxab1QryNkTxAQAA--.9993S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxWw18ZFW7uw48Xw15JFWDurg_yoW5WrW7pr
 18Jr1UJryUJr18Jr1UJr1UJFyUJr1UJw1UJr18JF1UJr1UJr1jgr1UXr1jgr1UJr48Jr1U
 Jr1UXr1UZr1UJrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
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
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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


在 2023/3/29 上午4:17, Richard Henderson 写道:
> On 3/27/23 20:05, Song Gao wrote:
>> +#define DO_ODD_EVEN_S(NAME, BIT, T, E1, E2, DO_OP)                 \
>> +void HELPER(NAME)(CPULoongArchState *env,                          \
>> +                  uint32_t vd, uint32_t vj, uint32_t vk)           \
>> +{                                                                  \
>> +    int i;                                                         \
>> +    VReg *Vd = &(env->fpr[vd].vreg);                               \
>> +    VReg *Vj = &(env->fpr[vj].vreg);                               \
>> +    VReg *Vk = &(env->fpr[vk].vreg);                               \
>> +                                                                   \
>> +    for (i = 0; i < LSX_LEN/BIT; i++) {                            \
>> +        Vd->E1(i) = DO_OP((T)Vj->E2(2 * i + 1), (T)Vk->E2(2 * i)); \
>> + }                                                              \
>> +}
> ...
>> +#define DO_ODD_EVEN_U(NAME, BIT, TD, TS, E1, E2, 
>> DO_OP)                     \
>> +void HELPER(NAME)(CPULoongArchState 
>> *env,                                    \
>> +                  uint32_t vd, uint32_t vj, uint32_t 
>> vk)                     \
>> +{ \
>> +    int i; \
>> +    VReg *Vd = &(env->fpr[vd].vreg); \
>> +    VReg *Vj = &(env->fpr[vj].vreg); \
>> +    VReg *Vk = &(env->fpr[vk].vreg); \
>> + \
>> +    for (i = 0; i < LSX_LEN/BIT; i++) 
>> {                                      \
>> +        Vd->E1(i) = DO_OP((TD)(TS)Vj->E2(2 * i + 1), 
>> (TD)(TS)Vk->E2(2 * i)); \
>> + } \
>> +}
>
> In the first case we have one cast, in the second case we have two.  I 
> wonder if it would be clearer to have both signed and unsigned members 
> in the VReg union? 

I really agree this.

> Then these two macros could be combined.
>
> I also think we could make use of (__typeof(Vd->E1(0))) instead of 
> separately passing the output type?  It would appear to be less 
> error-prone.
>
I will try this on v3.

Thanks.
Song Gao


