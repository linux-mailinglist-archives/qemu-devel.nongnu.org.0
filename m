Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE96B65887C
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 02:53:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAi5W-0004eS-B7; Wed, 28 Dec 2022 20:52:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pAi5T-0004e0-8f
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 20:52:03 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pAi5Q-0006rz-Ly
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 20:52:02 -0500
Received: from loongson.cn (unknown [10.20.42.238])
 by gateway (Coremail) with SMTP id _____8BxVPC28qxjsywJAA--.20437S3;
 Thu, 29 Dec 2022 09:51:50 +0800 (CST)
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxXL618qxjoAYPAA--.19681S3; 
 Thu, 29 Dec 2022 09:51:49 +0800 (CST)
Subject: Re: [RFC PATCH 01/43] target/loongarch: Add vector data type vec_t
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-2-gaosong@loongson.cn>
 <99e4fdf2-fe70-03c7-1168-f300ac7a1ead@linaro.org>
 <4852b017-1841-cf6f-fbc2-e1789a7f9496@loongson.cn>
 <d8e55869-8553-68b9-1b42-0075705dd03f@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <2544efc0-5eaa-31d3-99a1-95155d0f7859@loongson.cn>
Date: Thu, 29 Dec 2022 09:51:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d8e55869-8553-68b9-1b42-0075705dd03f@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8CxXL618qxjoAYPAA--.19681S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Jry3XFWUJFW8trW3trWrXwb_yoW8Jr4kpa
 sYya4rKF4Dta17ZF40yw4DGFWfKF97tF45urn8Jrn2kw10vwnaqFW2kryj9asrGr1rua45
 Xr45t3y7ua15ZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bxkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
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


在 2022/12/29 上午1:30, Richard Henderson 写道:
> On 12/27/22 18:34, gaosong wrote:
>> The manual says "The lower 64 bits of each vector register overlap 
>> with the floating point register of the same number.  In other words
>> When the basic floating-point instruction is executed to update the 
>> floating-point register, the low 64 bits of the corresponding LSX 
>> register
>> are also updated to the same value."
>>
>> So If we don't use the fpr_t.  we should:
>> 1 Update LSX low 64 bits after floating point instruction translation;
>> 2 Update floating-point registers after LSX instruction translation.
>>
>> Should we do this  or have I misunderstood?
>
> You should use fpr_t, you should not use cpu_fpr[].
> This is the same as aarch64, for instance.
>
> A related question though: does the manual mention whether the fpu 
> instructions only modify the lower 64 bits, or do the high 64-bits 
> become zeroed, nanboxed, or unspecified?
>
>
Only modify the lower 64bits,   the high 64-bits is unpecified.

Thanks.
Song Gao
>>> I strongly suggest that you introduce wrappers to load/store fpr 
>>> values from their env slots.  I would name them similarly to 
>>> gpr_{src,dst}, gen_set_gpr.
>>>
>> Got it.
>
>
> r~


