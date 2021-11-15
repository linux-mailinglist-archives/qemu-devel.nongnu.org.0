Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1B3450796
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 15:54:42 +0100 (CET)
Received: from localhost ([::1]:45610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmdNZ-0002Mz-FW
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 09:54:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmdM0-0000uk-FG
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:53:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmdLx-0007dc-9l
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:53:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636987980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Hgzw0Tv1IT02+IyQo/Xj1+rWGdlP9h3PyIjVoW4Xx14=;
 b=dUbHcHImjz7oIdCE7hSwfXeUJn48+LO1l1oZWVEzeRQRCPfP/E3EXgJUpqjrE2KfbDALK5
 n60nNIEJptTCyYwygB9dCVEm88H4UxwJYKQ7mjjJRUGRrSQRKTHXIoCi+HAn1t+Fo/o6sW
 173BZ83/avWgbn3SHD7JgYNdHgKs+l0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-oPOrfzdUPbSLVTvH_F9XfA-1; Mon, 15 Nov 2021 09:52:59 -0500
X-MC-Unique: oPOrfzdUPbSLVTvH_F9XfA-1
Received: by mail-wm1-f69.google.com with SMTP id
 v10-20020a1cf70a000000b00318203a6bd1so8010582wmh.6
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 06:52:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Hgzw0Tv1IT02+IyQo/Xj1+rWGdlP9h3PyIjVoW4Xx14=;
 b=bW6L9b1K3aULjjOWp78D6dzQnqGc1R3TsM4jcEJmNJadHWOS5+XxvUQ8DHAw/7UoP5
 wrH+nUF4iBAWgZ6v0SJko5bdqBYsuMQvUGaZsUhy4/WDDiQaLeLwTz+EwzmW0LSiKxgQ
 MVUGCAur+7UUy9pg8qyYG1+B1FVMYEHrOMhsDZ+rj53HVGBkbMdRkgWOrVHxfQvIqWys
 PDGrX8P2S25qm7ntH5QOrWvNOYDLHGpYoluqG/yG/Y/aDy/cA86XQpYvVvdqk8CbRFRC
 +QgGL5cRLwcelY+xVYB35YnPewZ9vvwTb1Yov9+0C6K8KSfkmZzTG/vXuFPObvuMfq8W
 o7Qw==
X-Gm-Message-State: AOAM532syKo8SJkDmN4Ncvv5ekdfL60g6CYx7nTLDDbinpT2ZQxF1wK5
 YpSZPLz6wQodWHzlbEjIxKgvhwkWKlZwax23eAdc8icZqtpaiiP563UG5nGWmgO8e2COUbCWX97
 iLky4LS9liVspPyw=
X-Received: by 2002:a05:600c:4ec7:: with SMTP id
 g7mr43299845wmq.138.1636987978147; 
 Mon, 15 Nov 2021 06:52:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzT1XLWnM6nhq9Jn0DkoWdRL4ecuDUEtI2trPIeVMev3+6BHy/OTNKcywoad+25/87RqWxUgw==
X-Received: by 2002:a05:600c:4ec7:: with SMTP id
 g7mr43299803wmq.138.1636987977888; 
 Mon, 15 Nov 2021 06:52:57 -0800 (PST)
Received: from redhat.com ([2.55.28.59])
 by smtp.gmail.com with ESMTPSA id m125sm20110462wmm.39.2021.11.15.06.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 06:52:57 -0800 (PST)
Date: Mon, 15 Nov 2021 09:52:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 1/6] pci: implement power state
Message-ID: <20211115095109-mutt-send-email-mst@kernel.org>
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

Here, too - reset will clear bus master enable. Why do we need to
special-case has_power?


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


