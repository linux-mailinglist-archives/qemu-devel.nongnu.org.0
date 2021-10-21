Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8014436D95
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 00:38:09 +0200 (CEST)
Received: from localhost ([::1]:57318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdghM-00079s-QN
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 18:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mdgaJ-0006G2-OE
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 18:30:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mdgaG-0004Mj-AQ
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 18:30:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634855446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rxMjHy2Xlp9LihoMwY7JspUaYiJ7ejKwHU72Da//tsg=;
 b=H4OWRrvo3+L0eslwBQa0OLn6BqijpmEGiTFQZ8j+nBcpH07LHpWHoyrHLOcoCULn+688DJ
 Tc5dDn5tI4P6TsxOom8MJ1kZy0D48jP9BFCEfo2c0zEVVuc6Rv7KRaL/TitwyLTNl7Mi3q
 szjAkmv23mPXGjBG2p4mKTQ4UPQH5XQ=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-aHp7AhEpPSmExMaJyF1K2A-1; Thu, 21 Oct 2021 18:30:42 -0400
X-MC-Unique: aHp7AhEpPSmExMaJyF1K2A-1
Received: by mail-oi1-f199.google.com with SMTP id
 r79-20020acaa852000000b002991da0573aso1137974oie.23
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 15:30:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rxMjHy2Xlp9LihoMwY7JspUaYiJ7ejKwHU72Da//tsg=;
 b=HCzCs+xt88eXWrvvRUFYvSY/in8dTeqdQgYwk0ewCyWgkv4AEwktCKluIWTbX7Z9Kk
 ZMKmkyH1ucDlPJYqKku9AG5e1GAuowkyUQjdNmM/eZtaYOBtHiCmGQlznaFWGxI2zfoa
 XwxvCPvxaQx+kPQ1++oQTmuDscYI27hK+75EUchti7XIaTVnFF3pjn8ZPBn7enYLUvc4
 C9vMF77NsD2po8UhwgzupT08b1V5wjfu8ueBckEYSLNzNslbRHtbnSv2MbCcwHpod2Wb
 HTBpiF2ECVB29L/YO9bn4hprP8gYpFcWjoOki0qNa8r9Plpe3zZ9905EBWzcsrQ449pb
 CcPg==
X-Gm-Message-State: AOAM533wP4xIdea/A5uZl9er/dRFiH7wmdPWx8x2UxPfjxm5PKyMrMgZ
 1vx+vXuTdsEa4XwF/L3gAwaKVTM3BKNb/HwiuT/MFBXBdFsPxjPMyTrrIFpjoH7QDADmW8iNmd2
 SXet3w7Q3KG4w83g=
X-Received: by 2002:a9d:4114:: with SMTP id o20mr7047537ote.171.1634855442197; 
 Thu, 21 Oct 2021 15:30:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwU+0U258/dV4Nw5XEb6vhBeXuW3W7sM7kZTBCfBx4s+VilyJYQrqbBZ0uWaj/jYGp6a4yxdA==
X-Received: by 2002:a9d:4114:: with SMTP id o20mr7047511ote.171.1634855441879; 
 Thu, 21 Oct 2021 15:30:41 -0700 (PDT)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id y123sm1379491oie.0.2021.10.21.15.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 15:30:41 -0700 (PDT)
Date: Thu, 21 Oct 2021 16:30:39 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 8/8] x86-iommu: Fail early if vIOMMU specified after
 vfio-pci
Message-ID: <20211021163039.324e92b1.alex.williamson@redhat.com>
In-Reply-To: <20211021104259.57754-9-peterx@redhat.com>
References: <20211021104259.57754-1-peterx@redhat.com>
 <20211021104259.57754-9-peterx@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 Oct 2021 18:42:59 +0800
Peter Xu <peterx@redhat.com> wrote:

> Scan the pci bus to make sure there's no vfio-pci device attached before vIOMMU
> is realized.

Sorry, I'm not onboard with this solution at all.

It would be really useful though if this commit log or a code comment
described exactly the incompatibility for which vfio-pci devices are
being called out here.  Otherwise I see this as a bit of magic voodoo
that gets lost in lore and copied elsewhere and we're constantly trying
to figure out specific incompatibilities when vfio-pci devices are
trying really hard to be "just another device".

I infer from the link of the previous alternate solution that this is
to do with the fact that vfio devices attach a memory listener to the
device address space.  Interestingly that previous cover letter also
discusses how vdpa devices might have a similar issue, which makes it
confusing again that we're calling out vfio-pci devices by name rather
than for a behavior.

If the behavior here is that vfio-pci devices attach a listener to the
device address space, then that provides a couple possible options.  We
could look for devices that have recorded an interest in their address
space, such as by setting a flag on PCIDevice when someone calls
pci_device_iommu_address_space(), where we could walk all devices using
the code in this series to find a device with such a flag.

Another option might be to attach owner objects to memory listeners,
walk all the listeners on the system address space (that the vIOMMU is
about to replace for some devices) and evaluate the owner objects
against TYPE_PCI_DEVICE.

Please lets not just call out arbitrary devices, especially not without
a thorough explanation of the incompatibility.  Thanks,

Alex


> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  hw/i386/x86-iommu.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/hw/i386/x86-iommu.c b/hw/i386/x86-iommu.c
> index 86ad03972e..58abce7edc 100644
> --- a/hw/i386/x86-iommu.c
> +++ b/hw/i386/x86-iommu.c
> @@ -21,6 +21,7 @@
>  #include "hw/sysbus.h"
>  #include "hw/i386/x86-iommu.h"
>  #include "hw/qdev-properties.h"
> +#include "hw/vfio/pci.h"
>  #include "hw/i386/pc.h"
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
> @@ -103,6 +104,16 @@ IommuType x86_iommu_get_type(void)
>      return x86_iommu_default->type;
>  }
>  
> +static void x86_iommu_pci_dev_hook(PCIBus *bus, PCIDevice *dev, void *opaque)
> +{
> +    Error **errp = (Error **)opaque;
> +
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_VFIO_PCI)) {
> +        error_setg(errp, "Device '%s' must be specified before vIOMMUs",
> +                   TYPE_VFIO_PCI);
> +    }
> +}
> +
>  static void x86_iommu_realize(DeviceState *dev, Error **errp)
>  {
>      X86IOMMUState *x86_iommu = X86_IOMMU_DEVICE(dev);
> @@ -120,6 +131,12 @@ static void x86_iommu_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> +    /* Make sure there's no special device plugged before vIOMMU */
> +    pci_for_each_device_all(x86_iommu_pci_dev_hook, (void *)errp);
> +    if (*errp) {
> +        return;
> +    }
> +
>      /* If the user didn't specify IR, choose a default value for it */
>      if (x86_iommu->intr_supported == ON_OFF_AUTO_AUTO) {
>          x86_iommu->intr_supported = irq_all_kernel ?
> @@ -151,6 +168,7 @@ static Property x86_iommu_properties[] = {
>  static void x86_iommu_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> +
>      dc->realize = x86_iommu_realize;
>      device_class_set_props(dc, x86_iommu_properties);
>  }


