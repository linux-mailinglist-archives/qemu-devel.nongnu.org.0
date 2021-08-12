Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C58783EA1DF
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 11:21:35 +0200 (CEST)
Received: from localhost ([::1]:35612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE6u6-00016c-TR
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 05:21:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mE6tM-0000Rs-UQ
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:20:48 -0400
Received: from mail.loongson.cn ([114.242.206.163]:60718 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mE6tK-0004eC-8B
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:20:48 -0400
Received: from localhost.localdomain (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL+Pi5xRhtCovAA--.14032S3; 
 Thu, 12 Aug 2021 17:20:35 +0800 (CST)
Subject: Re: [PATCH v2 16/22] target/loongarch: Add floating point move
 instruction translation
To: Richard Henderson <richard.henderson@linaro.org>
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-17-git-send-email-gaosong@loongson.cn>
 <643a7954-cf1c-78dd-2d08-f0969ea6127e@linaro.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <c5c30589-9373-03b7-2a53-8f91117aefd6@loongson.cn>
Date: Thu, 12 Aug 2021 17:20:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <643a7954-cf1c-78dd-2d08-f0969ea6127e@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxL+Pi5xRhtCovAA--.14032S3
X-Coremail-Antispam: 1UD129KBjvJXoW7AFW8tF4DJF1UCFyDtrW7CFg_yoW8Gr43pr
 18Jr4UJryUJws5Jr17Jr1UXFyUAr1UJ3WDJr18XF13JF4UAr1Igr15Wr1qgF1UJrW8Jr1U
 Aw1UXr1kZry7JrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBa1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E
 87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
 8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_
 Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
 ACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7I2V7IY0VAS
 07AlzVAYIcxG8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8V
 W5Wr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
 6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
 vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
 42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
 IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHUDUUUUU=
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 philmd@redhat.com, yangxiaojuan@loongson.cn, qemu-devel@nongnu.org,
 maobibo@loongson.cn, laurent@vivier.eu, alistair.francis@wdc.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 07/23/2021 02:29 PM, Richard Henderson wrote:
> 
>> +void helper_movgr2fcsr(CPULoongArchState *env, target_ulong arg1,
>> +                       uint32_t fcsr)
>> +{
>> +    switch (fcsr) {
>> +    case 0:
>> +        env->active_fpu.fcsr0 = arg1;
>> +        break;
>> +    case 1:
>> +        env->active_fpu.fcsr0 = (arg1 & FCSR0_M1) |
>> +                                (env->active_fpu.fcsr0 & ~FCSR0_M1);
>> +        break;
>> +    case 2:
>> +        env->active_fpu.fcsr0 = (arg1 & FCSR0_M2) |
>> +                                (env->active_fpu.fcsr0 & ~FCSR0_M2);
>> +        break;
>> +    case 3:
>> +        env->active_fpu.fcsr0 = (arg1 & FCSR0_M3) |
>> +                                (env->active_fpu.fcsr0 & ~FCSR0_M3);
>> +        break;
> 
> This is easily implemented inline, followed by a single helper call to re-load the rounding mode (if required by the mask).

Hi, Richard, 

Sorry to bother you， When I was revising this patch, I found that I didn't seem to understand your opinion. 
Could you explain it in detail?  thank you very much.

Thanks
Song Gao.


