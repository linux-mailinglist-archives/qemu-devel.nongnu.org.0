Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0991D51B8AD
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 09:24:35 +0200 (CEST)
Received: from localhost ([::1]:50886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmVqj-0006QO-EK
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 03:24:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nmVpO-0005Ym-23
 for qemu-devel@nongnu.org; Thu, 05 May 2022 03:23:10 -0400
Received: from mail.loongson.cn ([114.242.206.163]:54890 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nmVpK-00038I-Ft
 for qemu-devel@nongnu.org; Thu, 05 May 2022 03:23:09 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxmthQe3NiUJYKAA--.22794S3; 
 Thu, 05 May 2022 15:22:56 +0800 (CST)
Subject: Re: [PATCH v3 25/43] target/loongarch: Add LoongArch CSR instruction
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, mark.cave-ayland@ilande.co.uk
References: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
 <20220429100729.1572481-26-yangxiaojuan@loongson.cn>
 <22c74d5e-f0b6-dc6e-c7e8-7c28774f80e4@linaro.org>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <928f57a8-7124-e122-4129-f75fcd289647@loongson.cn>
Date: Thu, 5 May 2022 15:22:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <22c74d5e-f0b6-dc6e-c7e8-7c28774f80e4@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9AxmthQe3NiUJYKAA--.22794S3
X-Coremail-Antispam: 1UD129KBjvdXoWrZFWfKFW3Xw4UZw4xJw48Xrb_yoW3ZrX_uw
 48Ww1DuF1qg3yIyw10qr1xZr17Kr4jkr1Ut3y5AryDWF1UXasYgr13G3s5Aw1UGr45XFnF
 kr9xta1ak3WDXjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbIAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
 Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
 026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
 JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
 vEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280
 aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyT
 uYvjfU5WlkUUUUU
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 2022/5/1 上午1:22, Richard Henderson wrote:
> On 4/29/22 03:07, Xiaojuan Yang wrote:
>> +    [LOONGARCH_CSR_CPUID] = {
>> +        .offset = -1,
>> +        .flags = CSRFL_READONLY,
>> +        .readfn = gen_helper_csrrd_cpuid,
>> +        .writefn = NULL
>> +    },
>
> The offset should be
>
>     (int)offsetof(CPUState, cpu_index) - (int)offsetof(LoongArchCPU, env)
>
> at which point you don't need the readfn.
>
>> +target_ulong helper_csrrd_tval(CPULoongArchState *env)
>> +{
>> +    LoongArchCPU *cpu = LOONGARCH_CPU(env_cpu(env));
>
> cpu = env_archcpu(env).
>
> Several other instances in the file.
>
> Otherwise it looks good.
>
>
> r~ \
Sorry for the late reply,    I will correct it on v4,

Thanks.
Xiaojuan


