Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60ECB6139BB
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 16:13:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opWSp-0003HG-4a; Mon, 31 Oct 2022 11:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opWSn-0003Gl-1f
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 11:12:33 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opWSk-0002dR-Cc
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 11:12:32 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 ja4-20020a05600c556400b003cf6e77f89cso1523836wmb.0
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 08:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PbOw8+ZWpCKOHd1+Q+niRRVt+9BiIHmeWg0I97L4LpE=;
 b=iYbbgZDXDhRggWp4V9ejn2IDQUze2Kpcyx4Rd+tdT3IBeks+XGyqGSS9BMApohXo/C
 CwJPUlcekdlv+doLaj2CQdx2uEYw56qmM+LaCiBulhBuUW9LPCRgf+V5mWiu+HDU/tWR
 jmdIplbqZqYkWpY/xm0v2+Mxq+u+iPqYTHuvvdQ2WkuJ/ZVKY7zNKac4g3R70acnqJUe
 1Oue5tfqTDMDVrenMTjQkTLAWa3emqc4wCYS5NYoZ/Yd06D8LkyaudkNR+m3wkpr2fHn
 oALSEXX+ZPrkBkPVWoUFlPNe+zBHrNvo/D1S5qkRcnJhM5OVLXwBZ3y3g+oYUWX2EDnb
 0Jqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PbOw8+ZWpCKOHd1+Q+niRRVt+9BiIHmeWg0I97L4LpE=;
 b=SDDtZK6A92VWXDHL27COICqcwfy49FindB/ugCLmSKcGEoAIsBJRirR0fyExphK62h
 xYvon4gyVA98J4YPd43FwJ9i0/pSwN9UpBG7347Sr+rWXIhVK4NrJBIlptYo3hjEQEDm
 mDrZdgMgq1gKqOH3f2AHudJm2zCR/lrtKYT1IKIwe4STQr72Ul68vioZO59xix0v5xBc
 84J3+rTyOO/Mj61lEWzOBXGDwv2NFFL6+MZuq4jIlkmcGJBTYoOKoCs60rnLKoqh1M8B
 G+aJBt/yGdZ4gOAgV10M0nsc+XxCjVFuLkaQX52e68liBglyKMGH1rWw7X877/wOMlvo
 vxVQ==
X-Gm-Message-State: ACrzQf0QCXga6T1mK/BDHrfR8whkdVbFVTPZ4OGTYpv+VXir5sao2lpK
 WxI65bcbSr46hO6xy/178JqNqccgDRoFqg==
X-Google-Smtp-Source: AMsMyM7YhJKfdnuT9yQzwx1t669aWPjUfrXBiR8V7JxZpwrTXcX0JXSeKfaP0OgdDFA2Bk8py68xfw==
X-Received: by 2002:a05:600c:4e90:b0:3c6:f1b9:3f92 with SMTP id
 f16-20020a05600c4e9000b003c6f1b93f92mr8597632wmq.26.1667229148808; 
 Mon, 31 Oct 2022 08:12:28 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k2-20020a5d6282000000b00236cb3fec8fsm4421433wru.9.2022.10.31.08.12.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 08:12:28 -0700 (PDT)
Message-ID: <3b1b2608-76c5-3376-2c15-792ccbf623dd@linaro.org>
Date: Mon, 31 Oct 2022 16:12:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v5 6/6] hw/ppc/e500: Add Freescale eSDHC to e500plat
Content-Language: en-US
To: qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
References: <20221031115402.91912-1-philmd@linaro.org>
 <20221031115402.91912-7-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221031115402.91912-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On 31/10/22 12:54, Philippe Mathieu-Daudé wrote:
> From: Bernhard Beschow <shentey@gmail.com>
> 
> Adds missing functionality to e500plat machine which increases the
> chance of given "real" firmware images to access SD cards.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Message-Id: <20221018210146.193159-8-shentey@gmail.com>
> [PMD: Simplify using create_unimplemented_device("esdhc")]
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   docs/system/ppc/ppce500.rst | 12 ++++++++++
>   hw/ppc/Kconfig              |  2 ++
>   hw/ppc/e500.c               | 48 ++++++++++++++++++++++++++++++++++++-
>   hw/ppc/e500.h               |  1 +
>   hw/ppc/e500plat.c           |  1 +
>   5 files changed, 63 insertions(+), 1 deletion(-)

> @@ -992,6 +1018,26 @@ void ppce500_init(MachineState *machine)
>       i2c = (I2CBus *)qdev_get_child_bus(dev, "i2c");
>       i2c_slave_create_simple(i2c, "ds1338", RTC_REGS_OFFSET);
>   
> +    /* eSDHC */
> +    if (pmc->has_esdhc) {
> +        uint64_t sdhci_regsize;
> +
> +        dev = qdev_new(TYPE_SYSBUS_SDHCI);
> +        /*
> +         * Compatible with:
> +         * - SD Host Controller Specification Version 2.0 Part A2
> +         */
> +        qdev_prop_set_uint8(dev, "sd-spec-version", 2);
> +        s = SYS_BUS_DEVICE(dev);
> +        sysbus_realize_and_unref(s, &error_fatal);
> +        sysbus_mmio_map(s, 0, pmc->ccsrbar_base + MPC85XX_ESDHC_REGS_OFFSET);
> +        sysbus_connect_irq(s, 0, qdev_get_gpio_in(mpicdev, MPC85XX_ESDHC_IRQ));
> +        sdhci_regsize = memory_region_size(sysbus_mmio_get_region(s, 0));
> +        create_unimplemented_device("esdhc",
> +                                    pmc->ccsrbar_base
> +                                    + MPC85XX_ESDHC_REGS_OFFSET + sdhci_regsize,
> +                                    MPC85XX_ESDHC_REGS_SIZE - sdhci_regsize);
> +    }

Since the UNIMP device has lower priority, we can simplify as:

if (pmc->has_esdhc) {
     create_unimplemented_device("esdhc",
                                 pmc->ccsrbar_base
                                 + MPC85XX_ESDHC_REGS_OFFSET,
                                 MPC85XX_ESDHC_REGS_SIZE);

     dev = qdev_new(TYPE_SYSBUS_SDHCI);
     /*
      * Compatible with:
      * - SD Host Controller Specification Version 2.0 Part A2
      */
     qdev_prop_set_uint8(dev, "sd-spec-version", 2);
     s = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(s, &error_fatal);
     sysbus_mmio_map(s, 0, pmc->ccsrbar_base + MPC85XX_ESDHC_REGS_OFFSET);
     sysbus_connect_irq(s, 0, qdev_get_gpio_in(mpicdev, MPC85XX_ESDHC_IRQ));
}

