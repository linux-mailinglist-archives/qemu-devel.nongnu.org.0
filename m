Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D5F2E2952
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Dec 2020 01:40:08 +0100 (CET)
Received: from localhost ([::1]:34782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksb9J-0001sY-Fe
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 19:40:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1ksb6s-00019U-9L
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 19:37:35 -0500
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:34706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1ksb6q-0002tr-9Y
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 19:37:34 -0500
Received: by mail-oi1-x22e.google.com with SMTP id s75so3758911oih.1
 for <qemu-devel@nongnu.org>; Thu, 24 Dec 2020 16:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=RJdsAJeUzsOQB5ZrSJa/HG8YaPheJTnBWwLIWd7PtUY=;
 b=O7OBIrqEkaZhB8nil3CfOUUZiLaZ6yUlDAi0VFCPj58IU6zaP6+NCwGGqGVAauXTDI
 JcAif+hudI8FbUD3zu7+y6nynrMx4ntkFXhXxWoKlHkz7ztkHnaswXFbfUK78UYHnMIh
 +LkGKCNQu5ueGxBmAbumB8kSm3od3WyUH433yl75C+BdWTv5oEvvHFY9ABtx/Z51hEmr
 Dkrbx2ASTOe9BI9+HskrPbpLY+BGa15eErnMrHbKLLYDN3SUUgtRdZ0yHpU9ZBWgDUEd
 VELjdl5QBBb7jqwbvXdGYgMIPj5BwNT6sohdWJqRhrrEziuZ8jtCad0lQXQ+hOeAYBiC
 +Y3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mime-version:content-disposition:user-agent;
 bh=RJdsAJeUzsOQB5ZrSJa/HG8YaPheJTnBWwLIWd7PtUY=;
 b=jlYXMMzp3C8yOebkprWFgSWmxGzT2ItesdxypmLxuuSj0WabAfzHvJH/oCrFvijWDU
 mOOiTUtcuFC98l/Fgx5XSziman35E+K59MRwHY8YGh2DHDddIYihaLM5aaBVZxEBj2lv
 gpQI7F/EE7XRN4Wzuwrwb8ClTZmF4vqTVvtqhaoLVj616m8vpuG70EO9CNH8kdS7eFUi
 3qP7goA2EH4b59PflY69ZyVX91AAVC+Xm9UOspYRvBq7PngNVfyjo3JCDT2rGFPgdpCs
 SnUk0KKS8wUixOaS5/PoK/tXiwMHGhthiRQRTHLR1TRH0ndWsXwBmKQKryTu+SDzSsXJ
 S58Q==
X-Gm-Message-State: AOAM5337OZ61RKS1smeAIi2GIUXC/3e9EV0oUr97QyZ45RiXZUmIpVE6
 Edyuzoec+lPawxbULKqXOu4=
X-Google-Smtp-Source: ABdhPJxK+Q97n4amKEsjsMhkX8ph0pT0CTv4aVBUOVEc7wf6JFUe0cSPbfXcqRTosfsL7WtrsLY11Q==
X-Received: by 2002:aca:2301:: with SMTP id e1mr4232495oie.22.1608856650259;
 Thu, 24 Dec 2020 16:37:30 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id x72sm7023573oia.16.2020.12.24.16.37.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 24 Dec 2020 16:37:29 -0800 (PST)
Date: Thu, 24 Dec 2020 16:37:28 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 1/2] ide: Make room for flags in PCIIDEState and add one
 for legacy mode
Message-ID: <20201225003728.GA34067@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=groeck7@gmail.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FAKE_REPLY_C=1.486, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: philmd@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 25, 2020 at 12:23:37AM +0100, BALATON Zoltan wrote:
> We'll need a flag for implementing some device specific behaviour in
> via-ide but we already have a currently CMD646 specific field that can
> be repurposed for this and leave room for furhter flags if needed in

further

> the future. This patch changes the "secondary" field to "flags" and
> change CMD646 and its users accordingly and define a new flag for
> forcing legacy mode that will be used by via-ide for now.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

Reviewed-and-tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  hw/ide/cmd646.c      | 4 ++--
>  hw/sparc64/sun4u.c   | 2 +-
>  include/hw/ide/pci.h | 7 ++++++-
>  3 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
> index c254631485..7a96016116 100644
> --- a/hw/ide/cmd646.c
> +++ b/hw/ide/cmd646.c
> @@ -256,7 +256,7 @@ static void pci_cmd646_ide_realize(PCIDevice *dev, Error **errp)
>      pci_conf[PCI_CLASS_PROG] = 0x8f;
>  
>      pci_conf[CNTRL] = CNTRL_EN_CH0; // enable IDE0
> -    if (d->secondary) {
> +    if (d->flags & BIT(PCI_IDE_SECONDARY)) {
>          /* XXX: if not enabled, really disable the seconday IDE controller */
>          pci_conf[CNTRL] |= CNTRL_EN_CH1; /* enable IDE1 */
>      }
> @@ -314,7 +314,7 @@ static void pci_cmd646_ide_exitfn(PCIDevice *dev)
>  }
>  
>  static Property cmd646_ide_properties[] = {
> -    DEFINE_PROP_UINT32("secondary", PCIIDEState, secondary, 0),
> +    DEFINE_PROP_BIT("secondary", PCIIDEState, flags, PCI_IDE_SECONDARY, false),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
> index 0fa13a7330..c46baa9f48 100644
> --- a/hw/sparc64/sun4u.c
> +++ b/hw/sparc64/sun4u.c
> @@ -674,7 +674,7 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
>      }
>  
>      pci_dev = pci_new(PCI_DEVFN(3, 0), "cmd646-ide");
> -    qdev_prop_set_uint32(&pci_dev->qdev, "secondary", 1);
> +    qdev_prop_set_bit(&pci_dev->qdev, "secondary", true);
>      pci_realize_and_unref(pci_dev, pci_busA, &error_fatal);
>      pci_ide_create_devs(pci_dev);
>  
> diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
> index d8384e1c42..75d1a32f6d 100644
> --- a/include/hw/ide/pci.h
> +++ b/include/hw/ide/pci.h
> @@ -42,6 +42,11 @@ typedef struct BMDMAState {
>  #define TYPE_PCI_IDE "pci-ide"
>  OBJECT_DECLARE_SIMPLE_TYPE(PCIIDEState, PCI_IDE)
>  
> +enum {
> +    PCI_IDE_SECONDARY, /* used only for cmd646 */
> +    PCI_IDE_LEGACY_MODE
> +};
> +
>  struct PCIIDEState {
>      /*< private >*/
>      PCIDevice parent_obj;
> @@ -49,7 +54,7 @@ struct PCIIDEState {
>  
>      IDEBus bus[2];
>      BMDMAState bmdma[2];
> -    uint32_t secondary; /* used only for cmd646 */
> +    uint32_t flags;
>      MemoryRegion bmdma_bar;
>      MemoryRegion cmd_bar[2];
>      MemoryRegion data_bar[2];
> -- 
> 2.21.3
> 

