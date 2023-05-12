Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9B56FFF82
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 06:02:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxJxN-0006VN-K5; Fri, 12 May 2023 00:00:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pxJxJ-0006Uf-Ib
 for qemu-devel@nongnu.org; Fri, 12 May 2023 00:00:34 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pxJxH-0002te-IB
 for qemu-devel@nongnu.org; Fri, 12 May 2023 00:00:33 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f315735514so306083785e9.1
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 21:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683864030; x=1686456030;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PMkAISeKfeZmlX05O6QAQtQ/X4/lGBBlkslZHo8wJNE=;
 b=nhzb/DkG2yZ9eU8UDCVIK+8r1wJo3fpYL+Fg9YOBXDBBhhj5iNsgmesWGXepOZ1B+E
 OjdjdSbEnC86rkl9/yguXnoIctRutvpWlUp/0cPfdj+Ua1MjRgKC/Pi475BhsMKmJMqF
 m4sJuYabPoR+WZGNvqD2iVXl9yX+HyYEIrrYDS4oUGaZ7FH71uw+U6wR/SV4BYwWRs/j
 FBwnl4sFEQ2HtVeFaK0SfbY+Q1mxXW7Lqqqf4j1VPtN9XW2xpv/ZkhOOM+Wm5xkUbViU
 UYreE3qXTfkI40LjbeDO3lmKD6LEgbE0AfotBR59D8nb5OPv/sl01M56YV1hzGjLg/aJ
 EDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683864030; x=1686456030;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PMkAISeKfeZmlX05O6QAQtQ/X4/lGBBlkslZHo8wJNE=;
 b=QyzfXoSqeuwosWOXegcsv6MCZFdq4I2NZEegJ4rlcBOr6U7LlEkmxIW1rfom8IeFKT
 STsRs4BiiKVD1hK74E5n9nuWqyj0nVNE0N/ekmVtXTZtUJ0Gp6uS9Z/7vS1lrJkCzz8d
 WHHsChZXuTeNtw8/rOkcFaTCJzx7v7mqrxYryNji6N5SyZbGcQM8Yst1uroo+QvSXbY1
 YHhSijeX+QOjMpEEgAB7ZocxvkEtb+L1OszEI1H69Y6oHvOYqe9stTw4zjEtR8AQrYl2
 TWwrDxXxUlZymrWZDHbrBhXz2Fw6Zpv45+JrlOEq9+rHXCzoO9nWq/fFT9uP2ZhIvbr1
 l70g==
X-Gm-Message-State: AC+VfDwk8j2gETEoxVTjq8pDutV7OMcpBkOZQ7evIeWU8iLPeNg8O6if
 KOU0sYiP7G5AA1xtX3xfwKAtuw==
X-Google-Smtp-Source: ACHHUZ5RbOYsGDXjJ36MuoRkyJVqrFfp0GHpLXSFXRlMrCtOiRNVk9cVuhfjkPeJyrJBwM0tX2Y40g==
X-Received: by 2002:a05:600c:4f16:b0:3f1:939e:2e3b with SMTP id
 l22-20020a05600c4f1600b003f1939e2e3bmr16488070wmq.19.1683864029741; 
 Thu, 11 May 2023 21:00:29 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.152.186])
 by smtp.gmail.com with ESMTPSA id
 d6-20020a056000114600b00306344eaebfsm22135624wrx.28.2023.05.11.21.00.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 21:00:29 -0700 (PDT)
Message-ID: <93d8146b-1490-a0ae-29b3-3b36d89ed64a@linaro.org>
Date: Fri, 12 May 2023 06:00:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PULL 04/16] aspeed/smc: Cache AspeedSMCClass
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20221025152042.278287-1-clg@kaod.org>
 <20221025152042.278287-5-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221025152042.278287-5-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.124,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hi Cédric,

On 25/10/22 17:20, Cédric Le Goater wrote:
> Store a reference on the AspeedSMC class under the flash object and
> use it when accessing the flash contents. Avoiding the class cast
> checkers in these hot paths improves performance by 10% when running
> the aspeed avocado tests.

I doubt you still have your benchmark number, but do you remember
if you were using --enable-qom-cast-debug ?

> Message-Id: <20220923084803.498337-7-clg@kaod.org>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   include/hw/ssi/aspeed_smc.h | 2 ++
>   hw/ssi/aspeed_smc.c         | 9 ++++-----
>   2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
> index 2d5f8f3d8f68..8e1dda556b91 100644
> --- a/include/hw/ssi/aspeed_smc.h
> +++ b/include/hw/ssi/aspeed_smc.h
> @@ -30,6 +30,7 @@
>   #include "qom/object.h"
>   
>   struct AspeedSMCState;
> +struct AspeedSMCClass;
>   
>   #define TYPE_ASPEED_SMC_FLASH "aspeed.smc.flash"
>   OBJECT_DECLARE_SIMPLE_TYPE(AspeedSMCFlash, ASPEED_SMC_FLASH)
> @@ -37,6 +38,7 @@ struct AspeedSMCFlash {
>       SysBusDevice parent_obj;
>   
>       struct AspeedSMCState *controller;
> +    struct AspeedSMCClass *asc;
>       uint8_t cs;
>   
>       MemoryRegion mmio;
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index faed7e0cbe17..22df4be528a7 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -388,7 +388,7 @@ static inline int aspeed_smc_flash_cmd(const AspeedSMCFlash *fl)
>   static inline int aspeed_smc_flash_addr_width(const AspeedSMCFlash *fl)
>   {
>       const AspeedSMCState *s = fl->controller;
> -    AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
> +    AspeedSMCClass *asc = fl->asc;
>   
>       if (asc->addr_width) {
>           return asc->addr_width(s);
> @@ -420,7 +420,7 @@ static uint32_t aspeed_smc_check_segment_addr(const AspeedSMCFlash *fl,
>                                                 uint32_t addr)
>   {
>       const AspeedSMCState *s = fl->controller;
> -    AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
> +    AspeedSMCClass *asc = fl->asc;
>       AspeedSegments seg;
>   
>       asc->reg_to_segment(s, s->regs[R_SEG_ADDR0 + fl->cs], &seg);
> @@ -1234,7 +1234,6 @@ static const TypeInfo aspeed_smc_info = {
>   static void aspeed_smc_flash_realize(DeviceState *dev, Error **errp)
>   {
>       AspeedSMCFlash *s = ASPEED_SMC_FLASH(dev);
> -    AspeedSMCClass *asc;
>       g_autofree char *name = g_strdup_printf(TYPE_ASPEED_SMC_FLASH ".%d", s->cs);
>   
>       if (!s->controller) {
> @@ -1242,14 +1241,14 @@ static void aspeed_smc_flash_realize(DeviceState *dev, Error **errp)
>           return;
>       }
>   
> -    asc = ASPEED_SMC_GET_CLASS(s->controller);
> +    s->asc = ASPEED_SMC_GET_CLASS(s->controller);
>   
>       /*
>        * Use the default segment value to size the memory region. This
>        * can be changed by FW at runtime.
>        */
>       memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_smc_flash_ops,
> -                          s, name, asc->segments[s->cs].size);
> +                          s, name, s->asc->segments[s->cs].size);
>       sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
>   }
>   


