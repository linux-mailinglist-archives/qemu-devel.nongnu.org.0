Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEE56CB4C6
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 05:20:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgzt2-0003X9-1W; Mon, 27 Mar 2023 23:20:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pgzsz-0003X1-Ns
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 23:20:37 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pgzsx-000649-LD
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 23:20:37 -0400
Received: from loongson.cn (unknown [10.20.42.238])
 by gateway (Coremail) with SMTP id _____8DxXNoAXSJkyNwSAA--.17462S3;
 Tue, 28 Mar 2023 11:20:32 +0800 (CST)
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cxtrz_XCJkUOwOAA--.8332S3; 
 Tue, 28 Mar 2023 11:20:31 +0800 (CST)
Subject: Re: [PATCH] hw/loongarch/virt: Fix virt_to_phys_addr function
To: Richard Henderson <richard.henderson@linaro.org>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, qemu-devel@nongnu.org
Cc: maobibo@loongson.cn, f4bug@amsat.org, philmd@linaro.org
References: <20230327112313.3042829-1-zhaotianrui@loongson.cn>
 <63c805b9-f006-cdfb-4d07-5dbae84b7039@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <dd1c55f5-d2c2-fd30-2541-b4be8e90d4f4@loongson.cn>
Date: Tue, 28 Mar 2023 11:20:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <63c805b9-f006-cdfb-4d07-5dbae84b7039@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8Cxtrz_XCJkUOwOAA--.8332S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvdXoWrZrWDuw4kXrWrtFWkCw1xXwb_yoWkWwc_Za
 yUAw1Ikws5XayIkan3J34rJF17J3WkAF98A3Z8Xwsaga4UJr43JFsagw4fuwnaqr4UGFsx
 G3yrCr98Cr9IgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
 xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
 37kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
 AFIxvE14AKwVWUGVWUXwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
 6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4
 x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
 e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
 IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4U
 McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487Mx
 AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
 Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwI
 xGrwCI42IY6xIIjxv20xvE14v26w1j6s0DMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8
 Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42
 IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUzZ2-UUUUU
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


在 2023/3/28 上午1:44, Richard Henderson 写道:
> On 3/27/23 04:23, Tianrui Zhao wrote:
>> The virt addr should mask TARGET_PHYS_ADDR_SPACE_BITS to
>> get the phys addr, and this is used by loading kernel elf.
>>
>> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
>> ---
>>   hw/loongarch/virt.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
>> index b702c3f51e..f4bf14c1c8 100644
>> --- a/hw/loongarch/virt.c
>> +++ b/hw/loongarch/virt.c
>> @@ -399,7 +399,7 @@ static struct _loaderparams {
>>     static uint64_t cpu_loongarch_virt_to_phys(void *opaque, uint64_t 
>> addr)
>>   {
>> -    return addr & 0x1fffffffll;
>> +    return addr & MAKE_64BIT_MASK(0, TARGET_PHYS_ADDR_SPACE_BITS);
>>   }
>>     static int64_t load_kernel_info(void)
>
> Looks correct.  Any idea where this 29-bit value originated?
We just considered using  256M low-memory to load the kernel and did not 
consider using the high-memory.

Thanks.
Song Gao
>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
>
> r~


