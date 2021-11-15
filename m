Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D02450777
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 15:48:09 +0100 (CET)
Received: from localhost ([::1]:34168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmdHD-0002zV-NP
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 09:48:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmdG2-0001rg-4z
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:46:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmdFy-0006iH-O2
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:46:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636987609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AG8XNnOTziPicwd1s6UQSycFZadJZCfVum/ger8nTGE=;
 b=HkQPEznPi76++6zU/kHZfQr3ywmbxnkke17T4ueT6/7e749wRxifze7A8r/VSbg6yjgQiM
 MJTcRGHckIHxrJ5SIADRqbiwRGtL0u6ZGMDsmFrT67q+OLVFbTb7oiduvQwx1FFIkYhrPh
 fF5Bh7a62lLPTwtJNj0Yqyai1go61LA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-pK-dPTGLO8OWN5fF9wTP0g-1; Mon, 15 Nov 2021 09:46:48 -0500
X-MC-Unique: pK-dPTGLO8OWN5fF9wTP0g-1
Received: by mail-wr1-f72.google.com with SMTP id
 b1-20020a5d6341000000b001901ddd352eso2861695wrw.7
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 06:46:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AG8XNnOTziPicwd1s6UQSycFZadJZCfVum/ger8nTGE=;
 b=Qyk9qAof/XPIH+LIy+fAneXaUSKAZcVf4pXm6oNEsg8G7QvICCtxHZSNPY4cuBAzmA
 GfaqPtH+YbGMiJBCMSb/d51L7W0LgOBctQuKdDieHtqAS1IcQEj/oj5R0PQqZ7TBluNo
 JFUeY5hyio+3kmTFg3/L1oYQi9Nntx/x2Q6JCcZbjMrn+hCmEu5kb1bqOCBqyvdmgiWP
 UUVGh3skC7gdcLZ4msY9OjuXmFFiE8bRnsBgj5zf1ZnIt5XBwL3NjvVURdhKpNHLkdjS
 zTyU3XyDZJT+Vw5n6/LYwJYJlNBGMLmbVjG25MPtd8YsDRUqElAriRDiZ9/0CUHzEBtQ
 MvbQ==
X-Gm-Message-State: AOAM530bkw8kvng7cRdj177SRLWWy6Kzdneui1eaFqXO0Xbn6XAReRBG
 dthPcbJ48uyzYYto3hSakfDwVb8/pjayln+WkOsmiqVAKFiJMkr3Jnb0N/y/Yic+ZCxsilYPTMc
 ykGBTEWDg6SjnABE=
X-Received: by 2002:a1c:cc19:: with SMTP id h25mr61329969wmb.57.1636987606686; 
 Mon, 15 Nov 2021 06:46:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJysdsfojYOO85MULtcxx8vC/WuKIcW1+ljsxL1aK5YI3ybvkcV8CtsXBYp22/NM53RE4/k7bQ==
X-Received: by 2002:a1c:cc19:: with SMTP id h25mr61329929wmb.57.1636987606422; 
 Mon, 15 Nov 2021 06:46:46 -0800 (PST)
Received: from redhat.com ([2.55.28.59])
 by smtp.gmail.com with ESMTPSA id az4sm12397743wmb.20.2021.11.15.06.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 06:46:45 -0800 (PST)
Date: Mon, 15 Nov 2021 09:46:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 1/6] pci: implement power state
Message-ID: <20211115094503-mutt-send-email-mst@kernel.org>
References: <20211111130859.1171890-1-kraxel@redhat.com>
 <20211111130859.1171890-2-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211111130859.1171890-2-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 11, 2021 at 02:08:54PM +0100, Gerd Hoffmann wrote:
> This allows to power off pci devices.  In "off" state the devices will
> not be visible.  No pci config space access, no pci bar access, no dma.
> 
> Default state is "on", so this patch (alone) should not change behavior.
> 
> Use case:  Allows hotplug controllers implement slot power.  Hotplug
> controllers doing so should set the inital power state for devices in
> the ->plug callback.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/hw/pci/pci.h |  2 ++
>  hw/pci/pci.c         | 25 +++++++++++++++++++++++--
>  hw/pci/pci_host.c    |  6 ++++--
>  3 files changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 5c4016b9954a..e7cdf2d5ec5d 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -268,6 +268,7 @@ typedef struct PCIReqIDCache PCIReqIDCache;
>  struct PCIDevice {
>      DeviceState qdev;
>      bool partially_hotplugged;
> +    bool has_power;
>  
>      /* PCI config space */
>      uint8_t *config;
> @@ -908,5 +909,6 @@ extern const VMStateDescription vmstate_pci_device;
>  }
>  
>  MSIMessage pci_get_msi_message(PCIDevice *dev, int vector);
> +void pci_set_power(PCIDevice *pci_dev, bool state);
>  
>  #endif
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 4a84e478cef5..e5993c1ef52b 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -1380,6 +1380,9 @@ static void pci_update_mappings(PCIDevice *d)
>              continue;
>  
>          new_addr = pci_bar_address(d, i, r->type, r->size);
> +        if (!d->has_power) {
> +            new_addr = PCI_BAR_UNMAPPED;
> +        }
>  
>          /* This bar isn't changed */
>          if (new_addr == r->addr)

I am a bit confused about why this is necessary.
When power is removed device is reset, does not
this disable device memory automatically?


> @@ -1464,8 +1467,8 @@ void pci_default_write_config(PCIDevice *d, uint32_t addr, uint32_t val_in, int
>      if (range_covers_byte(addr, l, PCI_COMMAND)) {
>          pci_update_irq_disabled(d, was_irq_disabled);
>          memory_region_set_enabled(&d->bus_master_enable_region,
> -                                  pci_get_word(d->config + PCI_COMMAND)
> -                                    & PCI_COMMAND_MASTER);
> +                                  (pci_get_word(d->config + PCI_COMMAND)
> +                                   & PCI_COMMAND_MASTER) && d->has_power);
>      }
>  
>      msi_write_config(d, addr, val_in, l);
> @@ -2182,6 +2185,8 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
>          pci_qdev_unrealize(DEVICE(pci_dev));
>          return;
>      }
> +
> +    pci_set_power(pci_dev, true);
>  }
>  
>  PCIDevice *pci_new_multifunction(int devfn, bool multifunction,
> @@ -2853,6 +2858,22 @@ MSIMessage pci_get_msi_message(PCIDevice *dev, int vector)
>      return msg;
>  }
>  
> +void pci_set_power(PCIDevice *d, bool state)
> +{
> +    if (d->has_power == state) {
> +        return;
> +    }
> +
> +    d->has_power = state;
> +    pci_update_mappings(d);
> +    memory_region_set_enabled(&d->bus_master_enable_region,
> +                              (pci_get_word(d->config + PCI_COMMAND)
> +                               & PCI_COMMAND_MASTER) && d->has_power);
> +    if (!d->has_power) {
> +        pci_device_reset(d);
> +    }
> +}
> +
>  static const TypeInfo pci_device_type_info = {
>      .name = TYPE_PCI_DEVICE,
>      .parent = TYPE_DEVICE,
> diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
> index cf02f0d6a501..7beafd40a8e9 100644
> --- a/hw/pci/pci_host.c
> +++ b/hw/pci/pci_host.c
> @@ -74,7 +74,8 @@ void pci_host_config_write_common(PCIDevice *pci_dev, uint32_t addr,
>      /* non-zero functions are only exposed when function 0 is present,
>       * allowing direct removal of unexposed functions.
>       */
> -    if (pci_dev->qdev.hotplugged && !pci_get_function_0(pci_dev)) {
> +    if ((pci_dev->qdev.hotplugged && !pci_get_function_0(pci_dev)) ||
> +        !pci_dev->has_power) {
>          return;
>      }
>  
> @@ -97,7 +98,8 @@ uint32_t pci_host_config_read_common(PCIDevice *pci_dev, uint32_t addr,
>      /* non-zero functions are only exposed when function 0 is present,
>       * allowing direct removal of unexposed functions.
>       */
> -    if (pci_dev->qdev.hotplugged && !pci_get_function_0(pci_dev)) {
> +    if ((pci_dev->qdev.hotplugged && !pci_get_function_0(pci_dev)) ||
> +        !pci_dev->has_power) {
>          return ~0x0;
>      }
>  
> -- 
> 2.33.1


