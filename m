Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2682E01CC
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 22:08:23 +0100 (CET)
Received: from localhost ([::1]:56438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krSPm-0002qV-7D
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 16:08:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1krSOK-0001yx-Ha
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 16:06:52 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1krSOI-0005n8-RS
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 16:06:52 -0500
Received: by mail-wr1-x435.google.com with SMTP id y17so12502177wrr.10
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 13:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hdbRcC/G6biE4Q1TDRQct6++ZypV3OKjemFkz6p2z3Q=;
 b=D50Xclesrt3wZSZu90ZkIJWGkQsJmrSPKbvpIwgEOSg7zZtu6s7Lok20AFunZHHBzR
 n6Jln4uf57dzTwlOV5xLpMZC5DQLDgNsVmcz5+Po/zFQgoWEMu6z3ouZKpMYUe7KXpy+
 7rB3GUaBLFBWFPFOEWp8+K9DGiJNOcWvk9HVqf4o06cq3KrXB9ukCw+ZdWcRUSx/4GP9
 S8tAu4yRB1mE/WhUdcT9JyfrVXlrg3v5nJOzY7UGCNQcuGJ8GptZUQacpFN9k6OnjHnP
 5i4TEvgk4EVFaJV19ODD6Oe9VuYeo+TegR2spHvPwevMUqjpn7Sm/rp/nhyesUkfJhe2
 GL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hdbRcC/G6biE4Q1TDRQct6++ZypV3OKjemFkz6p2z3Q=;
 b=dlELyq1AHoLACpzVpYSpUqoUqqMpv8aY4W5QKuCqwUW3vWyJ5ev7aSnWvUGA0Fz6N8
 CZM2c+uHbf4mBQIpiBn9OFk+DpiRtvOaL7NZUbT6I3E5WZnrohzHEj5sx0ATtZO/7osU
 17PPLrfAN+lGQc+uUJHJ8eoo58GfRCZDULnuOSrVEcnySHoaaPZ7/P3n65PfvVs+QY75
 zZKEF30vFQBkgzaIX26Ac7q13C0fhe1/skL07hkUIppjYSOh50vn8i3EqqCb5XC+5Dct
 ztIZ2FxwIMn5LjYliauz4h5KSp5+JBwUITOeB3PYfPpL2iJHsiQsqisc+BdjB4Y0H0hd
 ehAA==
X-Gm-Message-State: AOAM531DcGlOrBSTKEovhGC3AXTCovq9E8EDIwZSzAHzFTZ71Yz4deMC
 oeHpkwAjGSY/0r0VGjcCeWo=
X-Google-Smtp-Source: ABdhPJx1JOO6+WhxcDe44aSGza4noZtUFPaGbaH8a+6NQkVntnhr8K0XJTY03S/BUzVBu0f6rEdivw==
X-Received: by 2002:adf:fb05:: with SMTP id c5mr20273506wrr.69.1608584809373; 
 Mon, 21 Dec 2020 13:06:49 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id u3sm31883244wre.54.2020.12.21.13.06.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Dec 2020 13:06:48 -0800 (PST)
Subject: Re: [PATCH v2 3/8] hw/pci-host/bonito: Fixup IRQ mapping
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201219071235.35040-1-jiaxun.yang@flygoat.com>
 <20201219071816.37963-1-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <724cdbc4-b8ea-40aa-0cd6-38bf2257c34b@amsat.org>
Date: Mon, 21 Dec 2020 22:06:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201219071816.37963-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.233,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: chenhuacai@kernel.org, wainersm@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/19/20 8:18 AM, Jiaxun Yang wrote:
> Accroading to arch/mips/pci/fixup-fuloong2e.c in kernel,
> despites south bridge IRQs needs special care, all other
> IRQ pins are mapped by 'LOONGSON_IRQ_BASE + 25 + pin'.
> 
> As south bridge IRQs are all handled by ISA bus, we can simply
> remove BONITO_IRQ_BASE and direct map IRQs here.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  hw/pci-host/bonito.c | 28 +++++-----------------------
>  1 file changed, 5 insertions(+), 23 deletions(-)
> 
> diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
> index a99eced065..43b79448a9 100644
> --- a/hw/pci-host/bonito.c
> +++ b/hw/pci-host/bonito.c
> @@ -546,19 +546,16 @@ static const MemoryRegionOps bonito_spciconf_ops = {
>      .endianness = DEVICE_NATIVE_ENDIAN,
>  };
>  
> -#define BONITO_IRQ_BASE 32
> -
>  static void pci_bonito_set_irq(void *opaque, int irq_num, int level)
>  {
>      BonitoState *s = opaque;
>      qemu_irq *pic = s->pic;
>      PCIBonitoState *bonito_state = s->pci_dev;
> -    int internal_irq = irq_num - BONITO_IRQ_BASE;
>  
> -    if (bonito_state->regs[BONITO_INTEDGE] & (1 << internal_irq)) {
> +    if (bonito_state->regs[BONITO_INTEDGE] & (1 << irq_num)) {
>          qemu_irq_pulse(*pic);
>      } else {   /* level triggered */
> -        if (bonito_state->regs[BONITO_INTPOL] & (1 << internal_irq)) {
> +        if (bonito_state->regs[BONITO_INTPOL] & (1 << irq_num)) {
>              qemu_irq_raise(*pic);
>          } else {
>              qemu_irq_lower(*pic);
> @@ -566,25 +563,10 @@ static void pci_bonito_set_irq(void *opaque, int irq_num, int level)
>      }
>  }
>  
> -/* map the original irq (0~3) to bonito irq (16~47, but 16~31 are unused) */
> -static int pci_bonito_map_irq(PCIDevice *pci_dev, int irq_num)
> +/* PCI slots IRQ pins started from 25 */

#define BONITO_IRQ_BASE 25 ? :)

> +static int pci_bonito_map_irq(PCIDevice *pci_dev, int pin)
>  {
> -    int slot;
> -
> -    slot = (pci_dev->devfn >> 3);
> -
> -    switch (slot) {
> -    case 5:   /* FULOONG2E_VIA_SLOT, SouthBridge, IDE, USB, ACPI, AC97, MC97 */
> -        return irq_num % 4 + BONITO_IRQ_BASE;
> -    case 6:   /* FULOONG2E_ATI_SLOT, VGA */
> -        return 4 + BONITO_IRQ_BASE;
> -    case 7:   /* FULOONG2E_RTL_SLOT, RTL8139 */
> -        return 5 + BONITO_IRQ_BASE;
> -    case 8 ... 12: /* PCI slot 1 to 4 */
> -        return (slot - 8 + irq_num) + 6 + BONITO_IRQ_BASE;
> -    default:  /* Unknown device, don't do any translation */
> -        return irq_num;
> -    }
> +    return 25 + pin;
>  }
>  
>  static void bonito_reset(void *opaque)
> 

