Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F6653099D
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 08:42:52 +0200 (CEST)
Received: from localhost ([::1]:41320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt1mF-0004hG-EP
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 02:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hpoussin@reactos.org>)
 id 1nt1en-0002Uz-Mo; Mon, 23 May 2022 02:35:09 -0400
Received: from iserv.reactos.org ([2a01:4f8:1c17:5ae1::1]:57840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hpoussin@reactos.org>)
 id 1nt1el-0004M6-6h; Mon, 23 May 2022 02:35:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=reactos.org
 ; s=25047;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9gYwZS6POoaYLlQM8yoEU+gr8lDSqMuby92ZC1ONZJE=; b=cI1G7BFZKZE+Rk0UKj1lEQ3ztL
 o5VlJbZttnkTdkuXiwH0JBACcaEuQRtWG5wt2gwTcNF0XKR5MQPmtp7tjJdg9jpYPktRHL7/pC1gI
 ddrgp8rjK03VQ8/r9KpSygZov1Wd4d0W8OswGUJiP5fzqv5nXyYAA4xblb2QI+U+DdsU=;
Received: by iserv.reactos.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <hpoussin@reactos.org>)
 id 1nt1eP-0005Iv-TH; Mon, 23 May 2022 06:34:45 +0000
Message-ID: <adb1830e-8b71-a889-7a2e-416f9f76d714@reactos.org>
Date: Mon, 23 May 2022 08:34:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 29/50] pckbd: more vmstate_register() from i8042_mm_init()
 to i8042_mmio_realize()
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, aleksandar.rikalo@syrmia.com,
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-30-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
In-Reply-To: <20220522181836.864-30-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a01:4f8:1c17:5ae1::1;
 envelope-from=hpoussin@reactos.org; helo=iserv.reactos.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

If you want, you can break migration compatibility. I don't see it as a problem.

Hervé

Le 22/05/2022 à 20:18, Mark Cave-Ayland a écrit :
> Note in this case it is not possible to register a (new) VMStateDescription in
> the DeviceClass without breaking migration compatibility for the MIPS magnum
> machine.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/input/pckbd.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
> index eb77ad193e..7f3578aa4d 100644
> --- a/hw/input/pckbd.c
> +++ b/hw/input/pckbd.c
> @@ -681,6 +681,9 @@ static void i8042_mmio_realize(DeviceState *dev, Error **errp)
>   
>       memory_region_init_io(&s->region, OBJECT(dev), &i8042_mmio_ops, ks,
>                             "i8042", s->size);
> +
> +    /* Note we can't use dc->vmsd without breaking migration compatibility */
> +    vmstate_register(NULL, 0, &vmstate_kbd, ks);
>   }
>   
>   static void i8042_mmio_init(Object *obj)
> @@ -721,8 +724,6 @@ MMIOKBDState *i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
>       s->irq_kbd = kbd_irq;
>       s->irq_mouse = mouse_irq;
>   
> -    vmstate_register(NULL, 0, &vmstate_kbd, s);
> -
>       s->kbd = ps2_kbd_init(kbd_update_kbd_irq, s);
>       s->mouse = ps2_mouse_init(kbd_update_aux_irq, s);
>   


