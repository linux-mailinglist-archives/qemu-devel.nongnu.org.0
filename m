Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FBD6612A1
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 00:48:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEIuq-0002tA-9W; Sat, 07 Jan 2023 18:47:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pEIuV-0002qA-Sf; Sat, 07 Jan 2023 18:47:38 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pEIu3-0005uy-FY; Sat, 07 Jan 2023 18:47:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QuTqyLvmVhhRHvg1MigPTlDcUawPKmf+05tA9DkGgoE=; b=xzFEzbgk+ozIIs7CLCUfjaJ/EB
 HVNUfcvcaw7wkFDV6kHcq7aKtJCOfGkAmlz20u9OeyWPbq0R+XNoH7Sb2AJ0kpISrSyVzQdt4YOu9
 /xSYtAzef1Tw7uJiAU3uFlHhGcfP+LcqAJOZuXP1/0RYwnboqHVYog4If/ObVuBN+zM8pfIVwiV2z
 qWuOvGGjVomin5hQ4WpzCdQJjYiIVdHKTY5Nf/owznXBleMDCcyRiJFhQRdYZ3/oFTy9nvTV9MXgg
 tlNqRdVcl07SWpPmCF2UUWM2AdvcwthSjTLQpjJ8HAoFNnEQpAwWY5GGqZaOaNrl7XAt0kltvFmcW
 DTxJkhNUcQSjWquDyCH/AdmXet/WXjoU7fhpClPx7Wo2ZiQdcwG4cJQXhYgNXgrbeTAzpB4zVEvZr
 Zmcy36G+l0xt574zGwL4iFPf7BXCKP+BNXHIVPx4A1JESUXpETHf39JaoLMCSC9cd51Q/nLQ+k6/r
 95CROSA8HwLIab43QZD1uoe3rpZq0fczoYcn6YsmZM6c2orGZBGJzLCA/RHV0Hkcqysr0zrHDp8cq
 +Sspl0TUDcEuIvdp3um+pgMCq8D34PFz+wkXmzqgoHVIF7+Y8OiNjgnhhhfVTthH5EFE/opI6/CA9
 cSdpkSlNTaHsmqKEnqaCnlwYdyyqZSA/vo2DfITdE=;
Received: from [2a00:23c4:8baa:1d00:e655:fde:753f:696a]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pEItf-000BJQ-IK; Sat, 07 Jan 2023 23:46:43 +0000
Message-ID: <fc64b407-4fd4-0952-21ad-ad483e82fa4c@ilande.co.uk>
Date: Sat, 7 Jan 2023 23:47:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Ani Sinha <ani@anisinha.ca>, Richard Henderson
 <richard.henderson@linaro.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, John Snow <jsnow@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20230105143228.244965-1-shentey@gmail.com>
 <20230105143228.244965-23-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230105143228.244965-23-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:1d00:e655:fde:753f:696a
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v5 22/31] hw/isa/piix4: Remove unused inbound ISA
 interrupt lines
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.114,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 05/01/2023 14:32, Bernhard Beschow wrote:

> The Malta board, which is the only user of PIIX4, doesn't connect to the
> exported interrupt lines. PIIX3 doesn't expose such intterupt lines

typo here: s/intterupt/interrupt/

> either, so remove them for PIIX4 for simplicity and consistency.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Message-Id: <20221022150508.26830-32-shentey@gmail.com>
> ---
>   hw/isa/piix4.c | 8 --------
>   1 file changed, 8 deletions(-)
> 
> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index de4133f573..9edaa5de3e 100644
> --- a/hw/isa/piix4.c
> +++ b/hw/isa/piix4.c
> @@ -155,12 +155,6 @@ static void piix4_request_i8259_irq(void *opaque, int irq, int level)
>       qemu_set_irq(s->cpu_intr, level);
>   }
>   
> -static void piix4_set_i8259_irq(void *opaque, int irq, int level)
> -{
> -    PIIX4State *s = opaque;
> -    qemu_set_irq(s->isa[irq], level);
> -}
> -
>   static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,
>                               unsigned int len)
>   {
> @@ -204,8 +198,6 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
>           return;
>       }
>   
> -    qdev_init_gpio_in_named(DEVICE(dev), piix4_set_i8259_irq,
> -                            "isa", ISA_NUM_IRQS);
>       qdev_init_gpio_out_named(DEVICE(dev), &s->cpu_intr,
>                                "intr", 1);
>   


ATB,

Mark.

