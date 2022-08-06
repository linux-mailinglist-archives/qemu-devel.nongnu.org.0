Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 798C958B4BF
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Aug 2022 11:25:41 +0200 (CEST)
Received: from localhost ([::1]:53820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKG3w-0005SY-2x
	for lists+qemu-devel@lfdr.de; Sat, 06 Aug 2022 05:25:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huqi@loongson.cn>) id 1oKG1i-0003cK-O3
 for qemu-devel@nongnu.org; Sat, 06 Aug 2022 05:23:22 -0400
Received: from mail.loongson.cn ([114.242.206.163]:43682 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huqi@loongson.cn>) id 1oKG1g-0007Io-BL
 for qemu-devel@nongnu.org; Sat, 06 Aug 2022 05:23:22 -0400
Received: from [10.90.50.23] (unknown [10.90.50.23])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Ax6sz9Mu5iAZQIAA--.15360S3; 
 Sat, 06 Aug 2022 17:23:10 +0800 (CST)
Message-ID: <000386c1-82b6-e890-3c3d-626533a44097@loongson.cn>
Date: Sat, 6 Aug 2022 17:23:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] disas: Add LoongArch support
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, 
 qemu-devel@nongnu.org
References: <20220804172939.325306-1-huqi@loongson.cn>
 <18b3de0c-593e-57c5-4277-c15ba9c2cc2f@linaro.org>
From: Qi Hu <huqi@loongson.cn>
In-Reply-To: <18b3de0c-593e-57c5-4277-c15ba9c2cc2f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Ax6sz9Mu5iAZQIAA--.15360S3
X-Coremail-Antispam: 1UD129KBjvdXoWruF1UGrWxtw4fGF1DCrWruFg_yoWDGFgEk3
 WfZ3W0yan7Way5Ga1xZ3y5XryUWrykX3sY9asrJr47Kw1UJas5Aw4DW3WfAr1FqrsFyrn8
 AwsIqFy5CF1UtjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbs8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
 0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
 IcxG8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
 IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
 6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
 IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2
 jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43
 ZEXa7VUbXdbUUUUUU==
X-CM-SenderInfo: pkxtxqxorr0wxvrqhubq/1tbiAQAKCV3QvP-JXwABsb
Received-SPF: pass client-ip=114.242.206.163; envelope-from=huqi@loongson.cn;
 helo=loongson.cn
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


On 2022/8/5 02:23, Richard Henderson wrote:
> On 8/4/22 10:29, Qi Hu wrote:
>> Signed-off-by: Qi Hu <huqi@loongson.cn>
>> ---
>>   disas.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/disas.c b/disas.c
>> index e31438f349..d44feeee46 100644
>> --- a/disas.c
>> +++ b/disas.c
>> @@ -176,6 +176,8 @@ static void initialize_debug_host(CPUDebug *s)
>>   #else
>>   #error unsupported RISC-V ABI
>>   #endif
>> +#elif defined(__loongarch__)
>> +    s->info.print_insn = print_insn_loongarch;
>
> This is very much insufficient.  Try --target-list=i386-softmmu and 
> watch it fail to link.
> You need to modify the build rules to make certain that the loongarch 
> disassembler is built for loongarch host.
>
>
> r~

I realized that "target/loongarch/disas.c" is only used for loongarch 
target . When the target is not "loongarch", the function 
"print_insn_loongarch" will not be compiled. Next I will add loongarch 
support to "disams/*".


Thanks.

Qi


