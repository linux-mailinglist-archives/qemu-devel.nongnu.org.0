Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEB23D2BBD
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 20:09:06 +0200 (CEST)
Received: from localhost ([::1]:45830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6d85-0004MA-7b
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 14:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m6cvu-0007OH-5c
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:56:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m6cvs-0004T1-7S
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:56:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626976587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0mL74EgPUZopJn8hM3zMacQpc6dZpPxecGsdJpyPCos=;
 b=T8Yvq+76t/ahgm9Pvsd3hvvyPsZwO/p4XxgLFFV6NeygAjrpRkIT09EfmH4AjpgOYfPWlt
 aMiopw6KaQWpKQjoN9URkeN+/bJ0/tdaQ+ucLxPiJCjfhjF3pibfz0que3V2YSWpDAKjW5
 KzKKPFjVOmjm6NReC89JMZJedWix8yI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-nyJo9h7GMyy89lvTeZ9RUQ-1; Thu, 22 Jul 2021 13:56:25 -0400
X-MC-Unique: nyJo9h7GMyy89lvTeZ9RUQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 g6-20020a1709063b06b029051a448bab28so2074700ejf.17
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 10:56:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0mL74EgPUZopJn8hM3zMacQpc6dZpPxecGsdJpyPCos=;
 b=j14biddIzOfx0PFdYp50I5Tz94DU6PNOuqxrakGrcnUm+yX+vdARt7JtHFTF0qy9zC
 KZh5mqZ4aoOF9KPhl+lQdwPQX7W0vzZw+XhC7vaymw+2/4gAzF3uqCSjfSFyIvqcdkJ1
 ZYC9u6XS7z/6vUJVDmF8cySWEjNFT30M+vXy8PspxW6RGNtZgzlRq9U++YH0aqkofL4M
 hNWUrdphoT24D1UPQBkIfHx/zyry7qI01ZeW2Fub2kwLztbXIlgKYTHa3l0wInWmIWtt
 KJe896VNz+LesbzRqIedMAJ1Y4VbdFZCK98ZIPgowL9qVenDIyDUMEPx1lUUxH1dar4z
 TPyw==
X-Gm-Message-State: AOAM530hpfpyX6ofo9fJJNfeZZHwqm9I2UYk1ADnnCYmopo/bxazMttL
 7R7InTxTntwROI1B1Lg7KepBwvzwc0yr7HcGtcQjSuQPSzfD/ZvAXuxqa5QrNKWVkhz+rbgbfyC
 PhLEwsu478yR4GOI=
X-Received: by 2002:a17:906:8618:: with SMTP id
 o24mr1006204ejx.175.1626976583525; 
 Thu, 22 Jul 2021 10:56:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3+LKp7NU4mL6YfnLQD19icQYemefOjQ4lXl0Ku8yzU6CRtvlnR3lI3hovkZwEVPc78kurpw==
X-Received: by 2002:a17:906:8618:: with SMTP id
 o24mr1006194ejx.175.1626976583396; 
 Thu, 22 Jul 2021 10:56:23 -0700 (PDT)
Received: from redhat.com ([2.55.134.65])
 by smtp.gmail.com with ESMTPSA id g11sm12806735edt.85.2021.07.22.10.56.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 10:56:21 -0700 (PDT)
Date: Thu, 22 Jul 2021 13:56:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 1/2] acpi: x86: pcihp: cleanup devfn usage in
 build_append_pci_bus_devices()
Message-ID: <20210722135030-mutt-send-email-mst@kernel.org>
References: <20210722105945.2080428-1-imammedo@redhat.com>
 <20210722105945.2080428-2-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210722105945.2080428-2-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, jusual@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I would add a description: we want to scan all functions
not just function 0 to describe hotplug into bridges
at function != 0. in preparation for this, refactor code to not
skip functions != 0.

On Thu, Jul 22, 2021 at 06:59:44AM -0400, Igor Mammedov wrote:
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/i386/acpi-build.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 17836149fe..b40e284b72 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -374,7 +374,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
>      Aml *dev, *notify_method = NULL, *method;
>      QObject *bsel;
>      PCIBus *sec;
> -    int i;
> +    int devfn;
>  
>      bsel = object_property_get_qobject(OBJECT(bus), ACPI_PCIHP_PROP_BSEL, NULL);
>      if (bsel) {
> @@ -384,11 +384,11 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
>          notify_method = aml_method("DVNT", 2, AML_NOTSERIALIZED);
>      }
>  
> -    for (i = 0; i < ARRAY_SIZE(bus->devices); i += PCI_FUNC_MAX) {
> +    for (devfn = 0; devfn < ARRAY_SIZE(bus->devices); devfn++) {
>          DeviceClass *dc;
>          PCIDeviceClass *pc;
> -        PCIDevice *pdev = bus->devices[i];
> -        int slot = PCI_SLOT(i);
> +        PCIDevice *pdev = bus->devices[devfn];
> +        int slot = PCI_SLOT(devfn);
>          bool hotplug_enabled_dev;
>          bool bridge_in_acpi;
>          bool cold_plugged_bridge;

I am a bit puzzled about why this is equivalent. so we used to scan just
function 0 on each slot. now we are scanning them all.
won't this generate a different AML code? in fact duplicate
descriptions?
I suspect you need to move the check for slot == 0 from the next patch
to this one otherwise bisect will be broken.

Or just squash this part into next patch. up to you.


> @@ -525,13 +525,12 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
>          /* Notify about child bus events in any case */
>          if (pcihp_bridge_en) {
>              QLIST_FOREACH(sec, &bus->child, sibling) {
> -                int32_t devfn = sec->parent_dev->devfn;
> -
>                  if (pci_bus_is_root(sec)) {
>                      continue;
>                  }
>  
> -                aml_append(method, aml_name("^S%.02X.PCNT", devfn));
> +                aml_append(method, aml_name("^S%.02X.PCNT",
> +                                            sec->parent_dev->devfn));
>              }
>          }
>  


this is a refactor, sure.

> -- 
> 2.27.0


