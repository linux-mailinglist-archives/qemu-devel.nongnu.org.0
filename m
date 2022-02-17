Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 050CE4B9959
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 07:43:03 +0100 (CET)
Received: from localhost ([::1]:43184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKaVF-0008Hy-3T
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 01:42:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nKaO6-0004jp-Tt
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 01:35:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nKaO4-00029U-PO
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 01:35:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645079732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kN8VXWG4c5e2v+R1vCZhvxt1KmyiyuArd6nbATp+DYo=;
 b=F4Ix7dWQo/KwIXl1R2D6tUXiS9MpJ7fQWrh1b3FbxmdQNs37WYCXnLWBGvexg2kFKfzjMA
 wlKV1oBQf0pnJClk51Z6nvdpwrM5ltxJ5b2Z14bGXGnKxHhdgM5+bVuEiVrV6GevmOTvfy
 Wi8eTmJHPYoyxrW3gbVNHwaoATfZ+G4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-5Q74u8LMP6C8g5VVAs0oRg-1; Thu, 17 Feb 2022 01:35:31 -0500
X-MC-Unique: 5Q74u8LMP6C8g5VVAs0oRg-1
Received: by mail-wr1-f71.google.com with SMTP id
 u9-20020adfae49000000b001e89793bcb0so384712wrd.17
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 22:35:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kN8VXWG4c5e2v+R1vCZhvxt1KmyiyuArd6nbATp+DYo=;
 b=aJ0LqmL5xA+doAtVQbM7bXxcgnRT6jUGvnTgLxh3jtKFCtXoDzgKYA0Hp++lpPbLKn
 AxK5tUt00UqV2ZwLiSvRvrnuI4dy2DdhaYP3ZkJO+4nNjNLHeQrdZS8aMSgfgp4A5gKn
 42x33QGOTYXtg6Dkb/dtA+OD53Et04ujpb+qSKpiXBKMnRVraXIaqn/k2hxtMJ+q9fvM
 xha76exdRAWq4K5GqV4E43lkkS3HAVdblycmo98Ldb8Aol0maMfEQd43UG+adTQndjEd
 jR9VhPVdqCwa1TyhkMYNqktvr4n04Mt4cgqG92DmQwadJ/wIMbQR7NPQ4jZ9rVAoJAwZ
 WRoQ==
X-Gm-Message-State: AOAM5315tmFaVGo1QqmavyFB+s0hM1yKUlmqRTMKck7UUsEhWZC4RLVt
 g2a3M3w3mdkWsfXgQlhwWPh2lypldjxMO3hiC9kOQRu2QIW5CO8p2M0TaKO2cJVQ41/JqMisSmu
 MepnFEuPjYSjMxV8=
X-Received: by 2002:a05:6000:144b:b0:1e8:50cb:f8f5 with SMTP id
 v11-20020a056000144b00b001e850cbf8f5mr1089439wrx.236.1645079729589; 
 Wed, 16 Feb 2022 22:35:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyYrYT2E++4E28KTM18lA6+mg+YmlXbefOdcZxJxQnOED2lOwPDxOqsGojhkEavAp/O8H7CBw==
X-Received: by 2002:a05:6000:144b:b0:1e8:50cb:f8f5 with SMTP id
 v11-20020a056000144b00b001e850cbf8f5mr1089423wrx.236.1645079729326; 
 Wed, 16 Feb 2022 22:35:29 -0800 (PST)
Received: from redhat.com ([2.55.139.83])
 by smtp.gmail.com with ESMTPSA id v5sm17714609wrr.7.2022.02.16.22.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 22:35:28 -0800 (PST)
Date: Thu, 17 Feb 2022 01:35:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PATCH v3 6/7] hw/isa/piix4: Replace some magic IRQ constants
Message-ID: <20220217013520-mutt-send-email-mst@kernel.org>
References: <20220216224519.157233-1-shentey@gmail.com>
 <20220216224519.157233-7-shentey@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220216224519.157233-7-shentey@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Wed, Feb 16, 2022 at 11:45:18PM +0100, Bernhard Beschow wrote:
> This is a follow-up on patch "malta: Move PCI interrupt handling from
> gt64xxx_pci to piix4". gt64xxx_pci used magic constants, and probably
> didn't want to use piix4-specific constants. Now that the interrupt
> handing resides in piix4, its constants can be used.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  hw/isa/piix4.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index 2e9b5ccada..f876c71750 100644
> --- a/hw/isa/piix4.c
> +++ b/hw/isa/piix4.c
> @@ -61,10 +61,10 @@ static void piix4_set_irq(void *opaque, int irq_num, int level)
>      /* now we change the pic irq level according to the piix irq mappings */
>      /* XXX: optimize */
>      pic_irq = s->dev.config[PIIX_PIRQCA + irq_num];
> -    if (pic_irq < 16) {
> +    if (pic_irq < ISA_NUM_IRQS) {
>          /* The pic level is the logical OR of all the PCI irqs mapped to it. */
>          pic_level = 0;
> -        for (i = 0; i < 4; i++) {
> +        for (i = 0; i < PIIX_NUM_PIRQS; i++) {
>              if (pic_irq == s->dev.config[PIIX_PIRQCA + i]) {
>                  pic_level |= pci_bus_get_irq_level(bus, i);
>              }
> @@ -315,7 +315,7 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
>                                 NULL, 0, NULL);
>      }
>  
> -    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, 4);
> +    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM_PIRQS);
>  
>      return dev;
>  }
> -- 
> 2.35.1
> 
> 
> 


