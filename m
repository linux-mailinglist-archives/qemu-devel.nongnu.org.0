Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA696D3FBC
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 11:10:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjGBs-0002Gt-8w; Mon, 03 Apr 2023 05:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pjGBp-0002Gk-Kt
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 05:09:25 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>) id 1pjGBm-0003D0-Og
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 05:09:25 -0400
Received: from [192.168.0.120] (unknown [180.175.29.170])
 by APP-05 (Coremail) with SMTP id zQCowADX32eylypk0U2WDQ--.58135S2;
 Mon, 03 Apr 2023 17:09:09 +0800 (CST)
Message-ID: <3212ace5-a35d-ac74-c786-29c3e124065e@iscas.ac.cn>
Date: Mon, 3 Apr 2023 17:09:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Cc: liweiwei@iscas.ac.cn, alex.bennee@linaro.org,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>, Anton Johansson <anjo@rev.ng>
Subject: Re: [PATCH 2/3] accel/tcg: Fix overwrite problems of tcg_cflags
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230401045106.3885562-1-richard.henderson@linaro.org>
 <20230401045106.3885562-3-richard.henderson@linaro.org>
 <c91e5f52-32db-c381-3286-1d22e15a2141@linaro.org>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <c91e5f52-32db-c381-3286-1d22e15a2141@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowADX32eylypk0U2WDQ--.58135S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw1fAry3uw45GFWDWrWktFb_yoW8KFykpr
 97Ka15tFyrJwn5Kayqqry3Way7Xrn5Aa17Jw1UA3W5ZryqqF1jqwsYgan8WrW7WayxCr10
 yrs0gr1UuFy3AaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
 IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUU
 U==
X-Originating-IP: [180.175.29.170]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.37,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


On 2023/4/3 16:09, Philippe Mathieu-Daudé wrote:
> On 1/4/23 06:51, Richard Henderson wrote:
>> From: Weiwei Li <liweiwei@iscas.ac.cn>
>>
>> CPUs often set CF_PCREL in tcg_cflags before qemu_init_vcpu(), in which
>> tcg_cflags will be overwrited by tcg_cpu_init_cflags().
>
> The description makes sense, but I couldn't reproduce using:
>
> -- >8 --
> diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
> index af35e0d092..23ebf7de21 100644
> --- a/accel/tcg/tcg-accel-ops.c
> +++ b/accel/tcg/tcg-accel-ops.c
> @@ -59,6 +59,7 @@ void tcg_cpu_init_cflags(CPUState *cpu, bool parallel)
>
>      cflags |= parallel ? CF_PARALLEL : 0;
>      cflags |= icount_enabled() ? CF_USE_ICOUNT : 0;
> +    tcg_debug_assert(!cpu->tcg_cflags);
>      cpu->tcg_cflags = cflags;
>  }
> ---
>
> Li and Junqiang, what is your use case?

Only few CPUs support CF_PCREL currently. I found this problem when I 
tried to introduce PC-relative translation into RISC-V.

Maybe It also can be reproduced in system mode for ARM and X86.

Regards,

Weiwei Li


>
>> Fixes: 4be790263ffc ("accel/tcg: Replace `TARGET_TB_PCREL` with 
>> `CF_PCREL`")
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> Message-Id: <20230331150609.114401-6-liweiwei@iscas.ac.cn>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   accel/tcg/tcg-accel-ops.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
>> index af35e0d092..58c8e64096 100644
>> --- a/accel/tcg/tcg-accel-ops.c
>> +++ b/accel/tcg/tcg-accel-ops.c
>> @@ -59,7 +59,7 @@ void tcg_cpu_init_cflags(CPUState *cpu, bool parallel)
>>         cflags |= parallel ? CF_PARALLEL : 0;
>>       cflags |= icount_enabled() ? CF_USE_ICOUNT : 0;
>> -    cpu->tcg_cflags = cflags;
>> +    cpu->tcg_cflags |= cflags;
>
> This could be acceptable as a release kludge, but semantically
> tcg_cpu_init_cflags() is meant to *initialize* all flags, not
> set few of them. Either we aren't calling it from the proper place,
> or we need to rename it.
>
>>   }
>>     void tcg_cpus_destroy(CPUState *cpu)


