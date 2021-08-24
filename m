Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0463F5A5B
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 11:02:14 +0200 (CEST)
Received: from localhost ([::1]:42856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mISJo-0005U8-Hc
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 05:02:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mISEI-0000iK-BZ
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 04:56:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mISEG-0001ch-Ig
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 04:56:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629795379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QKq050WholJYNzhiKU/wKgqgmj9fHsyLFMx3WFcrVNI=;
 b=LO4TV7F4eOGaBJ6ruQAkN7U5+XBkh7yidXlpd5aDK7NJwg3xACuEUzH1ndaxRGGsSi64G5
 H7zK2mO5ujqNsl/90JOm7gHFiFtzaS7Yaex7C9WXYwOAtZ0fFVjwe4wh3l655hjecFAgNw
 0ho9SE4TyDkZjT+wMfNcT84eKX/ZwKA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-QX9hjHGgO2SHQm8RkA9C1Q-1; Tue, 24 Aug 2021 04:56:17 -0400
X-MC-Unique: QX9hjHGgO2SHQm8RkA9C1Q-1
Received: by mail-ej1-f72.google.com with SMTP id
 gg1-20020a170906e281b029053d0856c4cdso6761649ejb.15
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 01:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QKq050WholJYNzhiKU/wKgqgmj9fHsyLFMx3WFcrVNI=;
 b=Z43JRzDdkhiIE4UGVpdiUEx0AUaklGrVk1xPHPfSZGBk2cirDrSxXLf69gUb4y8LEu
 AZN8iB1AwVhMgW3FASwlm3KbUmNjUzbftrceMzld31Q5uXwFwQfkL4RipA9NCfUT2e70
 EcUsCIo3yYRpHAMwmPkKIRJg1Qkm/bCq8UHmu7Z/cadFkTYAZaxX+e3+LoKyfngQfrEB
 mwB2pc8I6PCoqsjvYd59HhO49kexI15x3toVtrOBIDRlIOlog3hXO76X+upujY6GEIGv
 1uPN+71q1TPPraMcAuHMaBQISpm5yog0DQ2b19WYJdhg6G7YY/KqJ9wjlH3Nc6H7rMHY
 6O+g==
X-Gm-Message-State: AOAM532yGpS9KqfQ0+FXVSAM49Ua8XaXOYqSnQgpAQfTqsK8wmvNTpI9
 xGA6sL2hZUy+CqDPygUivBdBSFa/2Bttp9Ix6sHz4PVS0tR2SbPcOb09glSGLsMT3JHnYN4I7o5
 rqFjJ8D2fNHrMtcc=
X-Received: by 2002:a17:907:b06:: with SMTP id
 h6mr7382810ejl.130.1629795375878; 
 Tue, 24 Aug 2021 01:56:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkS2uJGuhXHl0KIFvxNWf2sVfZUMojcq8IRqgDg9+Wet1hPhEEeb/dsrKPx69XqCoujalSiQ==
X-Received: by 2002:a17:907:b06:: with SMTP id
 h6mr7382796ejl.130.1629795375670; 
 Tue, 24 Aug 2021 01:56:15 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id ne22sm7723235ejc.113.2021.08.24.01.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 01:56:15 -0700 (PDT)
Date: Tue, 24 Aug 2021 10:56:14 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] hw/acpi/pcihp: validate bsel property of the bus before
 unplugging device
Message-ID: <20210824105614.2762541f@redhat.com>
In-Reply-To: <20210823190444-mutt-send-email-mst@kernel.org>
References: <20210821150535.763541-1-ani@anisinha.ca>
 <20210823190444-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
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
Cc: Ani Sinha <ani@anisinha.ca>, philmd@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 23 Aug 2021 19:06:47 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Sat, Aug 21, 2021 at 08:35:35PM +0530, Ani Sinha wrote:
> > Bsel property of the pci bus indicates whether the bus supports acpi hotplug.
> > We need to validate the presence of this property before performing any hotplug
> > related callback operations. Currently validation of the existence of this
> > property was absent from acpi_pcihp_device_unplug_cb() function but is present
> > in other hotplug/unplug callback functions. Hence, this change adds the missing
> > check for the above function.
> > 
> > Signed-off-by: Ani Sinha <ani@anisinha.ca>  
> 
> I queued this but I have a general question:
I convinced myself that this patch is wrong, pls drop it.

> are all these errors logged with LOG_GUEST_ERROR?
> Because if not we have a security problem.
> I also note that bsel is an internal property,
> I am not sure we should be printing this to users,
> it might just confuse them.
> 
> Same question for all the other places validating bsel.

Commit message misses reproducer/explanation about
how it could be triggered?

If it's actually reachable, from my point of view
putting checks all through out call chain is not robust
and it's easy to miss issues caused by invalid bsel.
Instead of putting check all over the code, I'd
check value on entry points (pci_read/pci_write)
if code there is broken.

> 
> > ---
> >  hw/acpi/pcihp.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> > index 0fd0c1d811..9982815a87 100644
> > --- a/hw/acpi/pcihp.c
> > +++ b/hw/acpi/pcihp.c
> > @@ -372,9 +372,15 @@ void acpi_pcihp_device_unplug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
> >                                   DeviceState *dev, Error **errp)
> >  {
> >      PCIDevice *pdev = PCI_DEVICE(dev);
> > +    int bsel = acpi_pcihp_get_bsel(pci_get_bus(pdev));
> > +
> > +    trace_acpi_pci_unplug(PCI_SLOT(pdev->devfn), bsel);
> >  
> > -    trace_acpi_pci_unplug(PCI_SLOT(pdev->devfn),
> > -                          acpi_pcihp_get_bsel(pci_get_bus(pdev)));
> > +    if (bsel < 0) {
> > +        error_setg(errp, "Unsupported bus. Bus doesn't have property '"
> > +                   ACPI_PCIHP_PROP_BSEL "' set");
> > +        return;
> > +    }

1st:
 Error here is useless. this path is triggered on guest
 MMIO write and there is no consumer for error whatsoever.
 If I recall correctly, in such cases we in PCIHP code we make
 such access a silent NOP. And tracing is there for a us
 to help figure out what's going on.

2nd:
 if it got this far, it means a device on a bus with bsel
 was found and we are completing cleanup. Error-ing out at
 this point will leak acpi_index.

> >  
> >      /*
> >       * clean up acpi-index so it could reused by another device
> > -- 
> > 2.25.1  
> 


