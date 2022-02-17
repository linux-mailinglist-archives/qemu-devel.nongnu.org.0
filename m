Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 042CB4B9953
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 07:37:12 +0100 (CET)
Received: from localhost ([::1]:38730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKaPe-00059p-RB
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 01:37:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nKaNe-0003g0-HF
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 01:35:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nKaNa-00027d-Rd
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 01:35:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645079702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HIIxW03Itzows/dKwEZzQIalCuxF7XRm6lPHX/0A80c=;
 b=eGZssmJfy3WIt9XwhcfUR7om+V3eCAm2SskIopIj31Zu2n96+87D89HmtgXSCQYcpPlDgG
 sLNisu/j87+MPt0cFLssrkIR2lJewnBsLsQYKjGUrIQHmqfKFMhXA9kLMcnv5d2J8uSOXc
 4Q2fchVziXrLdyHfUG+XzPsV7xGJ+fQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-5N-JXDTMMHKRtzBMyIX_5g-1; Thu, 17 Feb 2022 01:35:00 -0500
X-MC-Unique: 5N-JXDTMMHKRtzBMyIX_5g-1
Received: by mail-wm1-f70.google.com with SMTP id
 l9-20020a05600c1d0900b0037be9e5f7e8so892249wms.7
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 22:35:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HIIxW03Itzows/dKwEZzQIalCuxF7XRm6lPHX/0A80c=;
 b=7QNpeXNdgNfQDOSJlNfzGbwFpd9Fbp6hoATeUKiL+ieSVaKCXmXWwIDfBuruzpRTaF
 wmGkOdGTzUaYxdWUohkMluovqZp98d1vYCfBLyVjFv9F3lBxZDnvumE4hbcf7VBtskbQ
 r4LkFk/mqUKJ9aMJP5BdBiPohJ7DsdCvtyOqYjNDCSicxs86UP5GhqUllpre5dLnHN2+
 QbC4W1fie/EWM07FQWRNYcAueVmA9seXJrbPJWisSupZVCHjqSdR5K6kUGqbeRp2ubkh
 M2XUfiPz0kvo56joyw1Za35A9BzF7Irwb6076G2oPe9lOqbVVcBFEOTmc7jUfT2vQwJk
 rFoA==
X-Gm-Message-State: AOAM533GkGlbXLPIL7BIkJiJ54sBC55F2+1RGexUjretxhA7phZh/KrP
 QkYabeYUHDLNNwl1zZv1PGqhxMsSxeL5ULVWj9meGYovD6VVAl7hGTLCTtLifV48VlzMSVVaLHN
 s2ed2Xz4AWwRFleY=
X-Received: by 2002:a05:600c:284a:b0:37e:9244:abea with SMTP id
 r10-20020a05600c284a00b0037e9244abeamr48860wmb.2.1645079699759; 
 Wed, 16 Feb 2022 22:34:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwCTfuNx7HpI5vD/Nl0z0ZYVluNBtNtOd8VjJuVs7IBjrkicfJ+gyaexudIexb1IONWeRavQg==
X-Received: by 2002:a05:600c:284a:b0:37e:9244:abea with SMTP id
 r10-20020a05600c284a00b0037e9244abeamr48847wmb.2.1645079699583; 
 Wed, 16 Feb 2022 22:34:59 -0800 (PST)
Received: from redhat.com ([2.55.139.83])
 by smtp.gmail.com with ESMTPSA id p27sm656169wms.1.2022.02.16.22.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 22:34:59 -0800 (PST)
Date: Thu, 17 Feb 2022 01:34:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PATCH v3 3/7] hw/isa/piix4: Resolve redundant i8259[] attribute
Message-ID: <20220217013448-mutt-send-email-mst@kernel.org>
References: <20220216224519.157233-1-shentey@gmail.com>
 <20220216224519.157233-4-shentey@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220216224519.157233-4-shentey@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 16, 2022 at 11:45:15PM +0100, Bernhard Beschow wrote:
> This is a follow-up on patch "malta: Move PCI interrupt handling from
> gt64xxx_pci to piix4" where i8259[] was moved from MaltaState to
> PIIX4State to make the code movement more obvious. However, i8259[]
> seems redundant to *isa, so remove it.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  hw/isa/piix4.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index 196b56e69c..179968b18e 100644
> --- a/hw/isa/piix4.c
> +++ b/hw/isa/piix4.c
> @@ -45,7 +45,6 @@ struct PIIX4State {
>      PCIDevice dev;
>      qemu_irq cpu_intr;
>      qemu_irq *isa;
> -    qemu_irq i8259[ISA_NUM_IRQS];
>  
>      RTCState rtc;
>      /* Reset Control Register */
> @@ -320,11 +319,7 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
>                                 NULL, 0, NULL);
>      }
>  
> -    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s->i8259, 4);
> -
> -    for (int i = 0; i < ISA_NUM_IRQS; i++) {
> -        s->i8259[i] = qdev_get_gpio_in_named(dev, "isa", i);
> -    }
> +    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s->isa, 4);
>  
>      return dev;
>  }
> -- 
> 2.35.1
> 
> 
> 


