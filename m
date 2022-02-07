Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0D34AC9C5
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 20:43:04 +0100 (CET)
Received: from localhost ([::1]:59364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH9ug-0005Wy-Vm
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 14:43:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH9iL-0006WY-Ni
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 14:30:17 -0500
Received: from [2a00:1450:4864:20::432] (port=35788
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH9iH-0001xP-U6
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 14:30:17 -0500
Received: by mail-wr1-x432.google.com with SMTP id m5so9405206wrb.2
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 11:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nLYroprcAmJdsFssGXcidqEJXsJ7B+4S13FmDkEquwY=;
 b=Mj//GA6anw5wa1+Kv2MscJtuSBA3XG6hKPdc0fC5GvfDdP8ne8WSiITgpG1ZKJl98X
 RKA8wP+6tZUmZoa/yKAR8EIBXGetDY/F0+SHOZUx6GGLErQulVgWjYdAf31TJbOCG9qT
 kfPlpd64SGW39dA1jHY2F2+gKhcSLT2vHk5qFvrIQjPBMZ9AMRpHc1mSFFOL2qVTBv6e
 Dk9D0mv4PCAbXQ9Y8jXkM7X6Dyxc7cHXnVr2YGbuXCB7VRc7ZUszDy2kK9RWznagxa3w
 qpxMp5ivVKmmiWSleDklx0GQcOdTPWJwVa83MT0mFb6H6ap+K+vYfi4jVCjcnS7rdaoc
 KaAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nLYroprcAmJdsFssGXcidqEJXsJ7B+4S13FmDkEquwY=;
 b=ps5Wp52M0whuEf3aO8nz3lOZbqM+MbfKyke9iNQ1VeEioc5gwL+J5M1QQhI+JjUBp8
 sRpY1Fvt6RhfFoPAnxxUU27JANiIBBav6kQzpCKuf2dPlXTR75sFid0+znIAlaSznoWj
 xqbu6xQE19LQE8FWmLCLSpsVRpCXisZEoQ9R67jbVpfOdK7GWiDwYUN0JCo0oywgKtnE
 3Eh4kviRaAEMr9hN1i/ZhFZLwjrBdv0yzrafZhCSUbwFQRUJAQD+FqX1IswGOb80w2dH
 KYU1yZlLPI4qrRwHuiJO6wJgwMVV85qmLL9jIAD7rh10JM2fSjs4fPIbcwviv23DxFNF
 mLgw==
X-Gm-Message-State: AOAM532reF11cwwuigs9Xx5h+yMnaHXAQxNrR4XR5xx5YQ2X8AGM1gpo
 zSuCRY0gxzgo7+qXRrKOk8TMqLN893SLsz1UeLe0XQ==
X-Google-Smtp-Source: ABdhPJxK2nR+4c7C5a2X/vjRZeEzgPHrmBxDWKO61zK8qy+BrHozpdTc9B6fHGu2Kb9i0PzcIYMOhLmbKClHO+899ck=
X-Received: by 2002:a05:6000:15c7:: with SMTP id
 y7mr761330wry.319.1644262210109; 
 Mon, 07 Feb 2022 11:30:10 -0800 (PST)
MIME-Version: 1.0
References: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
 <20220127205405.23499-5-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220127205405.23499-5-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Feb 2022 19:29:59 +0000
Message-ID: <CAFEAcA-GdkktHZpU0018d70xbB0JqKn1=-5xRbKF7aC3Hpiftw@mail.gmail.com>
Subject: Re: [PATCH 04/11] mos6522: switch over to use qdev gpios for IRQs
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Laurent@vivier.eu, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 27 Jan 2022 at 21:01, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> For historical reasons each mos6522 instance implements its own setting and
> update of the IFR flag bits using methods exposed by MOS6522DeviceClass. As
> of today this is no longer required, and it is now possible to implement
> the mos6522 IRQs as standard qdev gpios.
>
> Switch over to use qdev gpios for the mos6522 device and update all instances
> accordingly.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/misc/mac_via.c         | 56 +++++++--------------------------------
>  hw/misc/macio/cuda.c      |  5 ++--
>  hw/misc/macio/pmu.c       |  4 +--
>  hw/misc/mos6522.c         | 15 +++++++++++
>  include/hw/misc/mac_via.h |  6 +----
>  include/hw/misc/mos6522.h |  2 ++
>  6 files changed, 32 insertions(+), 56 deletions(-)


> -static void via2_nubus_irq_request(void *opaque, int irq, int level)
> +static void via2_nubus_irq_request(void *opaque, int n, int level)
>  {
>      MOS6522Q800VIA2State *v2s = opaque;
>      MOS6522State *s = MOS6522(v2s);
> -    MOS6522DeviceClass *mdc = MOS6522_GET_CLASS(s);
> +    qemu_irq irq = qdev_get_gpio_in(DEVICE(s), VIA2_IRQ_NUBUS_BIT);
>
>      if (level) {
>          /* Port A nubus IRQ inputs are active LOW */
> -        s->a &= ~(1 << irq);
> -        s->ifr |= 1 << VIA2_IRQ_NUBUS_BIT;
> +        s->a &= ~(1 << n);
>      } else {
> -        s->a |= (1 << irq);
> -        s->ifr &= ~(1 << VIA2_IRQ_NUBUS_BIT);
> +        s->a |= (1 << n);
>      }
>
> -    mdc->update_irq(s);
> +    qemu_set_irq(irq, level);
>  }

It feels a bit inconsistent here that we're still reaching into
the MOS6522State to set s->a, but I guess this is still
better than what we had before.

> -#define VIA1_IRQ_NB             8
> -
>  #define VIA1_IRQ_ONE_SECOND     (1 << VIA1_IRQ_ONE_SECOND_BIT)
>  #define VIA1_IRQ_60HZ           (1 << VIA1_IRQ_60HZ_BIT)
>  #define VIA1_IRQ_ADB_READY      (1 << VIA1_IRQ_ADB_READY_BIT)
> @@ -42,7 +40,7 @@ struct MOS6522Q800VIA1State {
>
>      MemoryRegion via_mem;
>
> -    qemu_irq irqs[VIA1_IRQ_NB];
> +    qemu_irq irqs[VIA_NUM_INTS];

This irqs[] array appears to be entirely unused. You could
delete it as a separate patch before this one.

>      qemu_irq auxmode_irq;
>      uint8_t last_b;
>
> @@ -85,8 +83,6 @@ struct MOS6522Q800VIA1State {
>  #define VIA2_IRQ_SCSI_BIT       CB2_INT_BIT
>  #define VIA2_IRQ_ASC_BIT        CB1_INT_BIT
>
> -#define VIA2_IRQ_NB             8
> -
>  #define VIA2_IRQ_SCSI_DATA      (1 << VIA2_IRQ_SCSI_DATA_BIT)
>  #define VIA2_IRQ_NUBUS          (1 << VIA2_IRQ_NUBUS_BIT)
>  #define VIA2_IRQ_UNUSED         (1 << VIA2_IRQ_SCSI_BIT)
> diff --git a/include/hw/misc/mos6522.h b/include/hw/misc/mos6522.h
> index 12abd8b8d2..ced8a670bf 100644
> --- a/include/hw/misc/mos6522.h
> +++ b/include/hw/misc/mos6522.h
> @@ -57,6 +57,8 @@
>  #define T2_INT             (1 << T2_INT_BIT)
>  #define T1_INT             (1 << T1_INT_BIT)
>
> +#define VIA_NUM_INTS       5

Were we not using 5,6,7 previously ?

Anyway,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

