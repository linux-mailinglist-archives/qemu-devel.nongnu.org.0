Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A23744B9950
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 07:36:28 +0100 (CET)
Received: from localhost ([::1]:37696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKaOx-0004QF-8d
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 01:36:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nKaNK-0003Dc-DZ
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 01:34:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nKaND-00021y-Tc
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 01:34:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645079673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=00nPjSwuBv4b0EeL4KnUG2TE0ne+CAKd3KoeNkyG5/8=;
 b=eUY2bcARZ/RI3RTVYrYo6hBbggcUHXXw+mTG/w430pB+xiUr2IKgMKwJEI73yEMCsDp14U
 GuL4RKfTNumhG4Uz52mUZ4eRwhsxenLYUGaH74Zk8XSjfK8soHjJnPl6A1CGcEkFuICIFS
 5nuSJ8c8BfdiuAgW9oohxJFJA9rlfsE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-183-g9ppezWwPlyNtjSO6xOl7Q-1; Thu, 17 Feb 2022 01:34:32 -0500
X-MC-Unique: g9ppezWwPlyNtjSO6xOl7Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 f26-20020a7bc8da000000b0037bd7f39dbbso893689wml.3
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 22:34:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=00nPjSwuBv4b0EeL4KnUG2TE0ne+CAKd3KoeNkyG5/8=;
 b=4dkvCnrxDTPAZ5f5wAd+OPs9JLmX2sVF98oDV9aonoXlT3LSBo69WO1kDy+fmY4rpt
 V5XsNQ/nq0YXbSPK5vhi3EPD5JxjfhaKxjXE3ChIipWwm2aMkwa/gncqVTCIeZDXM1RU
 pD6o/jXISuLbSN1owcQNH512rI2bLs2F5okiiTXxsOy0nfs4lfyhI9GSQ3uzJ/a50GDT
 kbi5CNyxNBUGu6++YluQs76G/xsoMPXmpo3AN2+M/LjbROsBXD2EZKCFZN2R4OYdq9Rh
 m+Zi2gnQAefghzuOSIUPp3UhtcHtmQ7dl3iap5mXnmPyXMxCR0ARVOtk82bN4tj966ph
 3d2A==
X-Gm-Message-State: AOAM533jgww2/k7Yb5YLoOmPeNebcaMNJCNaWMPCP+5Th2NqwH2Rv0JZ
 edPGD08uzSJXm7FXcGYJg6fVFAm1JMybAI88XddoRvpFXzXKtzty3OfvIpJ5zFCatxUi/yf7169
 nw3GY6GsotZxtL7M=
X-Received: by 2002:a05:600c:4fd6:b0:352:c2c6:8f34 with SMTP id
 o22-20020a05600c4fd600b00352c2c68f34mr4784982wmq.186.1645079670950; 
 Wed, 16 Feb 2022 22:34:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy64FjCtilxmO4+sZNdcLf64j3SK6r6uYcs0f39pBsMkHqGh0/Pih5oAGYSOo7LYNl5U0fVrg==
X-Received: by 2002:a05:600c:4fd6:b0:352:c2c6:8f34 with SMTP id
 o22-20020a05600c4fd600b00352c2c68f34mr4784964wmq.186.1645079670736; 
 Wed, 16 Feb 2022 22:34:30 -0800 (PST)
Received: from redhat.com ([2.55.139.83])
 by smtp.gmail.com with ESMTPSA id r2sm221095wmq.24.2022.02.16.22.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 22:34:28 -0800 (PST)
Date: Thu, 17 Feb 2022 01:34:24 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PATCH v3 5/7] hw/isa/piix4: Resolve global instance variable
Message-ID: <20220217013418-mutt-send-email-mst@kernel.org>
References: <20220216224519.157233-1-shentey@gmail.com>
 <20220216224519.157233-6-shentey@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220216224519.157233-6-shentey@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

On Wed, Feb 16, 2022 at 11:45:17PM +0100, Bernhard Beschow wrote:
> Now that piix4_set_irq's opaque parameter references own PIIX4State,
> piix4_dev becomes redundant.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  hw/isa/piix4.c                | 10 +++-------
>  include/hw/southbridge/piix.h |  2 --
>  2 files changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index caa2002e2c..2e9b5ccada 100644
> --- a/hw/isa/piix4.c
> +++ b/hw/isa/piix4.c
> @@ -39,8 +39,6 @@
>  #include "sysemu/runstate.h"
>  #include "qom/object.h"
>  
> -PCIDevice *piix4_dev;
> -
>  struct PIIX4State {
>      PCIDevice dev;
>      qemu_irq cpu_intr;
> @@ -58,16 +56,16 @@ static void piix4_set_irq(void *opaque, int irq_num, int level)
>  {
>      int i, pic_irq, pic_level;
>      PIIX4State *s = opaque;
> -    PCIBus *bus = pci_get_bus(piix4_dev);
> +    PCIBus *bus = pci_get_bus(&s->dev);
>  
>      /* now we change the pic irq level according to the piix irq mappings */
>      /* XXX: optimize */
> -    pic_irq = piix4_dev->config[PIIX_PIRQCA + irq_num];
> +    pic_irq = s->dev.config[PIIX_PIRQCA + irq_num];
>      if (pic_irq < 16) {
>          /* The pic level is the logical OR of all the PCI irqs mapped to it. */
>          pic_level = 0;
>          for (i = 0; i < 4; i++) {
> -            if (pic_irq == piix4_dev->config[PIIX_PIRQCA + i]) {
> +            if (pic_irq == s->dev.config[PIIX_PIRQCA + i]) {
>                  pic_level |= pci_bus_get_irq_level(bus, i);
>              }
>          }
> @@ -219,8 +217,6 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
>          return;
>      }
>      isa_init_irq(ISA_DEVICE(&s->rtc), &s->rtc.irq, RTC_ISA_IRQ);
> -
> -    piix4_dev = dev;
>  }
>  
>  static void piix4_init(Object *obj)
> diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
> index 6387f2b612..f63f83e5c6 100644
> --- a/include/hw/southbridge/piix.h
> +++ b/include/hw/southbridge/piix.h
> @@ -70,8 +70,6 @@ typedef struct PIIXState PIIX3State;
>  DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
>                           TYPE_PIIX3_PCI_DEVICE)
>  
> -extern PCIDevice *piix4_dev;
> -
>  PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus);
>  
>  DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus);
> -- 
> 2.35.1


