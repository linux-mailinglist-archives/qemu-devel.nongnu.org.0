Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 145DC6EEBF7
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 03:39:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prU6c-0007j6-O0; Tue, 25 Apr 2023 21:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1prU6a-0007ix-UN
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 21:38:00 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1prU6Y-0001JX-TN
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 21:38:00 -0400
Received: from loongson.cn (unknown [10.20.42.57])
 by gateway (Coremail) with SMTP id _____8CxE_BzgEhkKs8AAA--.1421S3;
 Wed, 26 Apr 2023 09:37:55 +0800 (CST)
Received: from [10.20.42.57] (unknown [10.20.42.57])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxKLJzgEhk0t47AA--.15582S3; 
 Wed, 26 Apr 2023 09:37:55 +0800 (CST)
Subject: Re: [PATCH 2/3] hw/intc: Add NULL pointer check on LoongArch ipi
 device
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, philmd@linaro.org, maobibo@loongson.cn,
 yangxiaojuan@loongson.cn
References: <20230406100052.3355632-1-gaosong@loongson.cn>
 <20230406100052.3355632-2-gaosong@loongson.cn>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <0390ecf5-6251-6312-1001-2d8574de1a0d@loongson.cn>
Date: Wed, 26 Apr 2023 09:37:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20230406100052.3355632-2-gaosong@loongson.cn>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8CxKLJzgEhk0t47AA--.15582S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Zr48uF1rWr1xWr4DZr17trb_yoW8ZF43pr
 ZF9w43C348tFZrWanxta4Uur1UArn7W3yY9Fsrtay09r1kuryvg34DK3s7JFn0v34F9r1Y
 vrnakrW2qF42ga7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bxAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
 kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm
 72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04
 k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
 MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr4
 1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l
 IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
 A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UNvtZUUUUU=
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, MIME_CHARSET_FARAWAY=2.45,
 NICE_REPLY_A=-1.422, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

ping ~

ÔÚ 2023/4/6 ÏÂÎç6:00, Song Gao Ð´µÀ:
> When ipi mailbox is used, cpu index is decoded from iocsr register.
> cpu maybe does not exist. This patch adss NULL pointer check on
> ipi device.
>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   hw/intc/loongarch_ipi.c | 31 +++++++++++++++++++------------
>   1 file changed, 19 insertions(+), 12 deletions(-)
>
> diff --git a/hw/intc/loongarch_ipi.c b/hw/intc/loongarch_ipi.c
> index 0563d83a35..39e899df46 100644
> --- a/hw/intc/loongarch_ipi.c
> +++ b/hw/intc/loongarch_ipi.c
> @@ -86,11 +86,12 @@ static void ipi_send(uint64_t val)
>       /* IPI status vector */
>       data = 1 << (val & 0x1f);
>       cs = qemu_get_cpu(cpuid);
> -    cpu = LOONGARCH_CPU(cs);
> -    env = &cpu->env;
> -    address_space_stl(&env->address_space_iocsr, 0x1008,
> -                      data, MEMTXATTRS_UNSPECIFIED, NULL);
> -
> +    if (cs) {
> +        cpu = LOONGARCH_CPU(cs);
> +        env = &cpu->env;
> +        address_space_stl(&env->address_space_iocsr, 0x1008,
> +                          data, MEMTXATTRS_UNSPECIFIED, NULL);
> +    }
>   }
>   
>   static void mail_send(uint64_t val)
> @@ -104,9 +105,11 @@ static void mail_send(uint64_t val)
>       cpuid = (val >> 16) & 0x3ff;
>       addr = 0x1020 + (val & 0x1c);
>       cs = qemu_get_cpu(cpuid);
> -    cpu = LOONGARCH_CPU(cs);
> -    env = &cpu->env;
> -    send_ipi_data(env, val, addr);
> +    if (cs) {
> +        cpu = LOONGARCH_CPU(cs);
> +        env = &cpu->env;
> +        send_ipi_data(env, val, addr);
> +    }
>   }
>   
>   static void any_send(uint64_t val)
> @@ -114,13 +117,17 @@ static void any_send(uint64_t val)
>       int cpuid;
>       hwaddr addr;
>       CPULoongArchState *env;
> +    CPUState *cs;
> +    LoongArchCPU *cpu;
>   
>       cpuid = (val >> 16) & 0x3ff;
>       addr = val & 0xffff;
> -    CPUState *cs = qemu_get_cpu(cpuid);
> -    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
> -    env = &cpu->env;
> -    send_ipi_data(env, val, addr);
> +    cs = qemu_get_cpu(cpuid);
> +    if (cs) {
> +        cpu = LOONGARCH_CPU(cs);
> +        env = &cpu->env;
> +        send_ipi_data(env, val, addr);
> +    }
>   }
>   
>   static void loongarch_ipi_writel(void *opaque, hwaddr addr, uint64_t val,


