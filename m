Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D9C5EEC04
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 04:40:23 +0200 (CEST)
Received: from localhost ([::1]:47622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odjTK-0005Fz-3U
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 22:40:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odjRx-0003pF-L0
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 22:38:57 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:45916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odjRv-0003yf-DS
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 22:38:57 -0400
Received: by mail-pf1-x431.google.com with SMTP id 9so208629pfz.12
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 19:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=FlP/TDdWpU8PcedDPcjK6WPCzYwcy8X/JO2FjYTlaPc=;
 b=Z6gIWZqHBTMCxpNBn1MOCUi1mJETHHWBBmhCIyY8xXkI/LpbBK7oUgmtq5vFQTGmtD
 t6bGXEV4gujztKXAhRywH3WhMmlSg4TISxWSpMIut2GNEkK+1x4tR9yBGPrj0p+UC6FG
 Fs/KZzi7SPUns3stLWc9nSu2zcDxmrAoY8W4OlJmMWUcY6BVgAYDVf013cHCMCPkzGMF
 Ah5Xhf63ysLDgBsHdS1ipUMK6eGk8UfXtF/AFJctVPyaIFA94Gq70jbTPD7p5kCd10dY
 GBe5+Uy0DsTYu47gn1zsYD2m1wxaZCYvJ+xR6M2V/sWz+0Jq/rIxl892Uh7tw54QsxvY
 KvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=FlP/TDdWpU8PcedDPcjK6WPCzYwcy8X/JO2FjYTlaPc=;
 b=L+upEO1JgIiswCchtz7PNSutIq811MYmbdqF8VwoPUvNKiFErvCVvNKt88r/469kZw
 O61AtXRe5a+AA+5SUD6QVUSHM4wlZLDvz2x14A6UsFFqBjpohdWa7Fym8goINfupUDpe
 GtZvTqytnqQ1SJMxYIxoIwotziPkY1I6z+DgSjcYrHmVg4ocPhoT9IpgNUdZdvH/Fa69
 4btO6zd9wwUQKqgmTDawoKoyuR/g4mkCnQtl3ie809GSFbJD47gAGytpzPo84iaM9HMY
 WI3kiVl6eF3g2oqrysgtjUIJyNjVTeUt9CZgN4z1V/C5TgQkmZkoLCr4IT08YN5xvjvq
 c6LQ==
X-Gm-Message-State: ACrzQf0UhnQ7MvLt6nBset2u6elWVoDU1EH/zOaR/JEwCS5TCRdCVK9S
 ltLvXT8TXkC7rmV9Qr+nEVOhjg==
X-Google-Smtp-Source: AMsMyM5DG8QnFmYd8OScpR5DOg03brg8mJNIAMrW/JDDD0okQS9J2ptSO4gxqKMPPB4C0fOKFoWjUA==
X-Received: by 2002:a05:6a00:d60:b0:53e:576e:bd8c with SMTP id
 n32-20020a056a000d6000b0053e576ebd8cmr1237430pfv.4.1664419133773; 
 Wed, 28 Sep 2022 19:38:53 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a17090a428200b002001c9bf22esm2280841pjg.8.2022.09.28.19.38.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 19:38:53 -0700 (PDT)
Message-ID: <7c449174-f07a-79e8-d280-ac7cd869d064@linaro.org>
Date: Wed, 28 Sep 2022 19:38:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/3] hw/intc: Fix LoongArch extioi function
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 f4bug@amsat.org, peter.maydell@linaro.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220927061225.3566554-1-yangxiaojuan@loongson.cn>
 <20220927061225.3566554-3-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220927061225.3566554-3-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/26/22 23:12, Xiaojuan Yang wrote:
> 1.When cpu read or write extioi COREISR reg, it should access
> the reg belonged to itself, so the index of 's->coreisr' is
> current cpu number.
> 2.Remove the unused extioi system memory region and we only
> support the extioi iocsr memory region now.
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---
>   hw/intc/loongarch_extioi.c | 17 ++++++++++-------
>   1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/intc/loongarch_extioi.c b/hw/intc/loongarch_extioi.c
> index 22803969bc..b89ec2e2a6 100644
> --- a/hw/intc/loongarch_extioi.c
> +++ b/hw/intc/loongarch_extioi.c
> @@ -17,6 +17,12 @@
>   #include "migration/vmstate.h"
>   #include "trace.h"
>   
> +static inline int get_current_cpu(void)
> +{
> +    int cpu_id = current_cpu ? current_cpu->cpu_index : 0;
> +
> +    return cpu_id;
> +}

I wouldn't want to introduce another instance of current_cpu right now.  Please see Alex's 
work to remove this from Arm hardware.

https://lore.kernel.org/qemu-devel/20220927141504.3886314-1-alex.bennee@linaro.org/


r~

>   
>   static void extioi_update_irq(LoongArchExtIOI *s, int irq, int level)
>   {
> @@ -92,8 +98,8 @@ static uint64_t extioi_readw(void *opaque, hwaddr addr, unsigned size)
>           ret = s->bounce[index];
>           break;
>       case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
> -        index = ((offset - EXTIOI_COREISR_START) & 0x1f) >> 2;
> -        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
> +        index = (offset - EXTIOI_COREISR_START) >> 2;
> +        cpu = get_current_cpu();
>           ret = s->coreisr[cpu][index];
>           break;
>       case EXTIOI_COREMAP_START ... EXTIOI_COREMAP_END - 1:
> @@ -183,8 +189,8 @@ static void extioi_writew(void *opaque, hwaddr addr,
>           s->bounce[index] = val;
>           break;
>       case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
> -        index = ((offset - EXTIOI_COREISR_START) & 0x1f) >> 2;
> -        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
> +        index = (offset - EXTIOI_COREISR_START) >> 2;
> +        cpu = get_current_cpu();
>           old_data = s->coreisr[cpu][index];
>           s->coreisr[cpu][index] = old_data & ~val;
>           /* write 1 to clear interrrupt */
> @@ -284,9 +290,6 @@ static void loongarch_extioi_instance_init(Object *obj)
>               qdev_init_gpio_out(DEVICE(obj), &s->parent_irq[cpu][pin], 1);
>           }
>       }
> -    memory_region_init_io(&s->extioi_system_mem, OBJECT(s), &extioi_ops,
> -                          s, "extioi_system_mem", 0x900);
> -    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->extioi_system_mem);
>   }
>   
>   static void loongarch_extioi_class_init(ObjectClass *klass, void *data)


