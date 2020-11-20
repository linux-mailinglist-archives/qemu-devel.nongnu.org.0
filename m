Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 320982BB1B8
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 18:50:27 +0100 (CET)
Received: from localhost ([::1]:41082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgAYE-0002wy-0x
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 12:50:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgASv-0006pk-Ro
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 12:44:57 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:39212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgASt-0004lg-Vd
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 12:44:57 -0500
Received: by mail-wm1-x341.google.com with SMTP id s13so10533826wmh.4
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 09:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=c/EW1RXRz1khehkRjCCnOumAKovwVWN7cA3YjV3qonM=;
 b=chNdYMYlPevZk/MD6RiGgUQVCZzbj7Edu2p9hAoM0l4cOpFma2kcZ4MZf/TXEmGHIQ
 G75YUrbCilWlScX5x6QdG+MCBfWWRmqqZ3lQAjfh1Y5MohTDXV9xa62XzO5jVDuLZgVA
 /KPB2WcB9WT8GgKWpuXzBwzMo0TER3A9RqhnK8vpQQASgwiUVOT/Dx40w7/7vWF7um0o
 0prlWLt4n28mvjacJirYyje+pSkJ7H3mAjdWuSVCp0RR74nejj+nMiUyNcJ9ggI6dC+7
 wLVLd+Z/0znYRAtkP5Pj14or0UD8bQMjcd/BHImRMcCjm/N66AlGdWdkcPNYqIrsiTDk
 FAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c/EW1RXRz1khehkRjCCnOumAKovwVWN7cA3YjV3qonM=;
 b=HAg6sEd8zYv9ZlU966x08awkrKtC7mI6wFliI34hiHwVM3Wt5L4aZo3QmvY2uayLU+
 HZ/0y2hmTPhd9TNrUV8i8kgfPFsUMH43RgWY/UrdTvB19LqXpujPubaSYs1E0LCTQEB7
 SBCiVEfj5CG1qSChZ/NOnZ0Ca6N2m/ZALGtoJx4untPWkA7sV6iaa/G0Z0eBtcO3v6i5
 qgBtU5wpquccBQLUV47JiHFqi/yZxbMqAapnktsO6gtwMiLqohuLR8z3xIM4zAvZtkh1
 bZkA6M58gd2HtzrvUPOY5JDDu8Bd9+2JK97/Xod6x6WVoWFrJogNLqKpjxVU3akqyNQ/
 NcpQ==
X-Gm-Message-State: AOAM533yUnvAmWwnw71zR6geHXFMf4jBrl7YEsdfUX/RM0PoyXus0DEa
 kJhcUFnWxdj+yZupsXY4y3g=
X-Google-Smtp-Source: ABdhPJwAY6vt6lCh9CdyK1SJ4LQR123I0VjunInpuzWgdfax28jmCWgFYyqm0N63eaczNpJ2Ise0ig==
X-Received: by 2002:a7b:ce0e:: with SMTP id m14mr11625271wmc.17.1605894294502; 
 Fri, 20 Nov 2020 09:44:54 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id k3sm5773711wrn.81.2020.11.20.09.44.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 09:44:53 -0800 (PST)
Subject: Re: [PATCH] hw/m68k/mcf5206: Don't leak IRQs in mcf5206_mbar_realize()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201120172314.14725-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <56e585c1-8797-d77b-689f-da1c92e6edfd@amsat.org>
Date: Fri, 20 Nov 2020 18:44:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201120172314.14725-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <huth@tuxfamily.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/20 6:23 PM, Peter Maydell wrote:
> Coverity points out that the realize function for the TYPE_MCF5206_MBAR
> device leaks the IRQ array it allocates with qemu_allocate_irqs().
> Keep a pointer to it in the device state struct to avoid the leak.
> (Since it needs to stay around for the life of the simulation there
> is no need to actually free it, and the leak was harmless.)
> 
> Fixes: Coverity CID 1432412
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> 
> We don't need to put this in 5.2, I'm just slowly working through
> some of the Coverity issues that are various kinds of harmless leak
> involving qemu_allocate_irqs().

As you said, harmless, so this could go for 5.2 IMO.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> 
> A more thorough overhaul of this code would probably split the
> current MBAR device into multiple individual devices:
>  * timers
>  * uarts
>  * interrupt controller proper
>  * a container device that wires up all the above
> In that design instead of using qemu_allocate_irqs(), the
> interrupt-controller device would create gpio_in lines and the
> container would wire them up to the timers and uarts.

Agreed, but this only makes sense if there is activity in this
model, else your patch is sufficient (else, what about the
OMAP1/2?).

> ---
>  hw/m68k/mcf5206.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/m68k/mcf5206.c b/hw/m68k/mcf5206.c
> index 51d2e0da1c9..92a194dbc46 100644
> --- a/hw/m68k/mcf5206.c
> +++ b/hw/m68k/mcf5206.c
> @@ -164,6 +164,7 @@ typedef struct {
>  
>      M68kCPU *cpu;
>      MemoryRegion iomem;
> +    qemu_irq *pic;
>      m5206_timer_state *timer[2];
>      void *uart[2];
>      uint8_t scr;
> @@ -588,17 +589,16 @@ static const MemoryRegionOps m5206_mbar_ops = {
>  static void mcf5206_mbar_realize(DeviceState *dev, Error **errp)
>  {
>      m5206_mbar_state *s = MCF5206_MBAR(dev);
> -    qemu_irq *pic;
>  
>      memory_region_init_io(&s->iomem, NULL, &m5206_mbar_ops, s,
>                            "mbar", 0x00001000);
>      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
>  
> -    pic = qemu_allocate_irqs(m5206_mbar_set_irq, s, 14);
> -    s->timer[0] = m5206_timer_init(pic[9]);
> -    s->timer[1] = m5206_timer_init(pic[10]);
> -    s->uart[0] = mcf_uart_init(pic[12], serial_hd(0));
> -    s->uart[1] = mcf_uart_init(pic[13], serial_hd(1));
> +    s->pic = qemu_allocate_irqs(m5206_mbar_set_irq, s, 14);
> +    s->timer[0] = m5206_timer_init(s->pic[9]);
> +    s->timer[1] = m5206_timer_init(s->pic[10]);
> +    s->uart[0] = mcf_uart_init(s->pic[12], serial_hd(0));
> +    s->uart[1] = mcf_uart_init(s->pic[13], serial_hd(1));
>      s->cpu = M68K_CPU(qemu_get_cpu(0));
>  }
>  
> 


