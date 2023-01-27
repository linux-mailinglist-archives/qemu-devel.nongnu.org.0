Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4A967E6BC
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 14:30:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLOn3-0007Eq-Oy; Fri, 27 Jan 2023 08:29:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pLOn1-0007Ec-O9
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 08:29:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pLOn0-0005ve-0Z
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 08:29:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674826148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=av+HSaydr4im+x03GoPm3ztOM5ECsKBIq8QYi7uxOTs=;
 b=SeulGsn5v9nTo3Emk41eRbPhovXtz+RRYJCCjdj1ipY226KqmAGAtaAe7csjM2b3PSgQSf
 Dwx5jWoMQ5j3KmGaUFUFqCwqgRJdnr9iOPusHVLq5XTk9g6NulQI6hWAVvvr+2io4KBrZU
 1pq5yeBGlAwUKfgr989fn9bbrgQC4F8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-408-hAB5VEaoPc2mXJqETqXwxw-1; Fri, 27 Jan 2023 08:29:07 -0500
X-MC-Unique: hAB5VEaoPc2mXJqETqXwxw-1
Received: by mail-ej1-f72.google.com with SMTP id
 gb18-20020a170907961200b008715e951f02so3450007ejc.11
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 05:29:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=av+HSaydr4im+x03GoPm3ztOM5ECsKBIq8QYi7uxOTs=;
 b=FYka2hlVa7Qj6BVQHQMm86kSOJwf6xbN7L1Yd5Udb7rg6WEK94TblSNBdhDXtK+UXk
 2GKXdQLLgsbltyrwoEW8OooE1egiPwNEa/yNiknCT7gkdU6jccQgtXUibhGrmcaH0An4
 oK/AXt1Oe2ZpSZY5shymkxH+8HO7uwNWwrbkfXEr86keLBPg1EQZfCH3UJOkQfKieN2R
 8g3F/ZN1UxRRwSwhDhs+Zc7mW7rZZNK7QN6idtpDSrR3hiQunfHVNjyXGKRBqNwY6mh3
 T0Ya3XgITr1TEfpIXx/dOqRwdKe3PJcEzwXIbuZFpvhZX94/PzF6DePCkVoesrcEYJuK
 hpvg==
X-Gm-Message-State: AO0yUKVEsMkZVMky8noeCKpECxWDJBJoR4QI2ltEd0s/dDcg1krbsYHe
 y81nluf0Bs5vJ3z4Ab4M+EOkSZF6+drolVgwi9exG00ezTabxFBjfO4rZmVO3G9msAz0SdIxvE7
 Sd6xc9EgtMBgBORM=
X-Received: by 2002:a17:906:51ce:b0:879:9bf4:c2cd with SMTP id
 v14-20020a17090651ce00b008799bf4c2cdmr3457936ejk.68.1674826144113; 
 Fri, 27 Jan 2023 05:29:04 -0800 (PST)
X-Google-Smtp-Source: AK7set85CmilhWh6GOpUpAHbKTGuqiuiLe2Ga3Sextiar1O+18600c4lugVHpv8CiuuaJ0/L1pwY/g==
X-Received: by 2002:a17:906:51ce:b0:879:9bf4:c2cd with SMTP id
 v14-20020a17090651ce00b008799bf4c2cdmr3457927ejk.68.1674826143884; 
 Fri, 27 Jan 2023 05:29:03 -0800 (PST)
Received: from redhat.com ([2.52.137.69]) by smtp.gmail.com with ESMTPSA id
 lf16-20020a170907175000b008787134a939sm2225929ejc.18.2023.01.27.05.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 05:29:03 -0800 (PST)
Date: Fri, 27 Jan 2023 08:28:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Chuck Zmudzinski <brchuckz@aol.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH] pci: add enforce_slot_reserved_mask_manual property
Message-ID: <20230127082240-mutt-send-email-mst@kernel.org>
References: <ad5f5cf8bc4bd4a720724ed41e47565a7f27adf5.1673829387.git.brchuckz.ref@aol.com>
 <ad5f5cf8bc4bd4a720724ed41e47565a7f27adf5.1673829387.git.brchuckz@aol.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad5f5cf8bc4bd4a720724ed41e47565a7f27adf5.1673829387.git.brchuckz@aol.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, Jan 15, 2023 at 07:49:51PM -0500, Chuck Zmudzinski wrote:
> The current reserved slot check in do_pci_register_device(), added with
> commit 8b8849844fd6

add ("subject here") please

> ,is done even if the pci device being added is
> configured manually for a particular slot. The new property, when set
> to false, disables the check when the device is configured to request a
> particular slot. This allows an administrator or management tool to
> override slot_reserved_mask for a pci device by requesting a particular
> slot for the device. The new property is initialized to true which
> preserves the existing behavior of slot_reserved_mask by default.
> 
> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>

Thanks!
I'm trying to think of the best default for this.
Users is trying to configure a specific device on a reserved
slot. Should we 
CC a bunch more people for visibility. Input, anyone?


> ---
>  hw/pci/pci.c             | 9 ++++++++-
>  include/hw/pci/pci_bus.h | 1 +
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index c2fb88f9a3..5e15f08036 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -467,6 +467,7 @@ static void pci_root_bus_internal_init(PCIBus *bus, DeviceState *parent,
>      assert(PCI_FUNC(devfn_min) == 0);
>      bus->devfn_min = devfn_min;
>      bus->slot_reserved_mask = 0x0;
> +    bus->enforce_slot_reserved_mask_manual = true;
>      bus->address_space_mem = address_space_mem;
>      bus->address_space_io = address_space_io;
>      bus->flags |= PCI_BUS_IS_ROOT;
> @@ -1074,6 +1075,12 @@ static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn)
>      return bus->slot_reserved_mask & (1UL << PCI_SLOT(devfn));
>  }
>  
> +static bool pci_bus_devfn_reserved_manual(PCIBus *bus, int devfn)
> +{
> +    return bus->enforce_slot_reserved_mask_manual &&
> +            (bus->slot_reserved_mask & (1UL << PCI_SLOT(devfn)));
> +}
> +
>  /* -1 for devfn means auto assign */
>  static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
>                                           const char *name, int devfn,
> @@ -1107,7 +1114,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
>                     "or reserved", name);
>          return NULL;
>      found: ;
> -    } else if (pci_bus_devfn_reserved(bus, devfn)) {
> +    } else if (pci_bus_devfn_reserved_manual(bus, devfn)) {
>          error_setg(errp, "PCI: slot %d function %d not available for %s,"
>                     " reserved",
>                     PCI_SLOT(devfn), PCI_FUNC(devfn), name);

Should this be a device property or a bus property?
And maybe now mention the property name so users know how
to override this?

> diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
> index 5653175957..e0f15ee9be 100644
> --- a/include/hw/pci/pci_bus.h
> +++ b/include/hw/pci/pci_bus.h
> @@ -37,6 +37,7 @@ struct PCIBus {
>      void *iommu_opaque;
>      uint8_t devfn_min;
>      uint32_t slot_reserved_mask;
> +    bool enforce_slot_reserved_mask_manual;
>      pci_set_irq_fn set_irq;
>      pci_map_irq_fn map_irq;
>      pci_route_irq_fn route_intx_to_irq;
> -- 
> 2.39.0


