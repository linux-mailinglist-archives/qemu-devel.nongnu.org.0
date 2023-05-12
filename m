Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1346FFF2A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 05:03:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxJ2T-0005as-Bp; Thu, 11 May 2023 23:01:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pxJ2Q-0005aV-6s
 for qemu-devel@nongnu.org; Thu, 11 May 2023 23:01:46 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pxJ2N-0000tU-Gm
 for qemu-devel@nongnu.org; Thu, 11 May 2023 23:01:45 -0400
Received: from loongson.cn (unknown [10.20.42.57])
 by gateway (Coremail) with SMTP id _____8Cx_eoOrF1kLf0HAA--.13381S3;
 Fri, 12 May 2023 11:01:35 +0800 (CST)
Received: from [10.20.42.57] (unknown [10.20.42.57])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxLb8NrF1kYNhWAA--.23307S3; 
 Fri, 12 May 2023 11:01:33 +0800 (CST)
Subject: Re: [PATCH 2/3] hw/intc: Add NULL pointer check on LoongArch ipi
 device
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, maobibo@loongson.cn, yangxiaojuan@loongson.cn
References: <20230406100052.3355632-1-gaosong@loongson.cn>
 <20230406100052.3355632-2-gaosong@loongson.cn>
 <0de07b1e-1371-9bad-11e0-e57d8fb379fe@linaro.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <255a9693-3660-35b4-8213-a609018bbb2c@loongson.cn>
Date: Fri, 12 May 2023 11:01:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <0de07b1e-1371-9bad-11e0-e57d8fb379fe@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8BxLb8NrF1kYNhWAA--.23307S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Kw13CryktF1fZr45Cry3Jwb_yoW8Zryrpr
 n3Cw43CrWjyFyxJwnrJryUXFy5Gr1kWa47CrySva4rXr1DZry09r1jgryvgFy2yw4xJr1U
 tr1UJr47uF15JaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
 e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
 IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4U
 McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487Mx
 AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
 Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwI
 xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8
 JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
 C2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUzZ2-UUUUU
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.124,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,  Philippe

在 2023/5/12 上午3:03, Philippe Mathieu-Daudé 写道:
> On 6/4/23 12:00, Song Gao wrote:
>> When ipi mailbox is used, cpu index is decoded from iocsr register.
>> cpu maybe does not exist. This patch adss NULL pointer check on
>> ipi device.
>
> How can that happens from a guest vcpu context?
>
cpuid(cs->cpu_index)  is decoded from iocsr register.

     cpuid = (val >> 16) & 0x3ff;   // ipi_sned [25:16]

The value maybe invalid.  qemu only support 4 vcpu.

you can find more about ipi_send registers at:
https://github.com/loongson/LoongArch-Documentation/releases/download/2023.04.20/Loongson-3A5000-usermanual-v1.03-EN.pdf
Table 63. Processor core inter-processor communication registers

>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> ---
>>   hw/intc/loongarch_ipi.c | 31 +++++++++++++++++++------------
>>   1 file changed, 19 insertions(+), 12 deletions(-)
>>
>> diff --git a/hw/intc/loongarch_ipi.c b/hw/intc/loongarch_ipi.c
>> index 0563d83a35..39e899df46 100644
>> --- a/hw/intc/loongarch_ipi.c
>> +++ b/hw/intc/loongarch_ipi.c
>> @@ -86,11 +86,12 @@ static void ipi_send(uint64_t val)
>>       /* IPI status vector */
>>       data = 1 << (val & 0x1f);
>>       cs = qemu_get_cpu(cpuid);
>> -    cpu = LOONGARCH_CPU(cs);
>> -    env = &cpu->env;
>> -    address_space_stl(&env->address_space_iocsr, 0x1008,
>> -                      data, MEMTXATTRS_UNSPECIFIED, NULL);
>> -
>> +    if (cs) {
>> +        cpu = LOONGARCH_CPU(cs);
>> +        env = &cpu->env;
>> +        address_space_stl(&env->address_space_iocsr, 0x1008,
>> +                          data, MEMTXATTRS_UNSPECIFIED, NULL);
>> +    }
>
> Is that the hardware behavior?
>
Yes.
> Could logging the invalid cpuid request be useful?
>
Sure.

Thanks.
Song Gao


