Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 734C53F5D0C
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 13:23:22 +0200 (CEST)
Received: from localhost ([::1]:57410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIUWW-0008Ua-TU
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 07:23:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mIUVZ-0007iu-41
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 07:22:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mIUVV-0004Z2-WE
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 07:22:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629804135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0//PW/ruwid54vjIQWoZFZqcMIYYbYTUzPvqJt7Kjho=;
 b=D92ZixIWPYN6ZuZ1lWUQ3Khjb81+QjIMim0kQf4/cdtmkAMgXiwUGW7p9EQE7rHZxXY4mu
 J8rUgA0QMVbEdYElqODFHTuPVy9KUUraxzsw8L6RrIFOOu/ZISCv/WN0RKYE5G80dABMxV
 37d+aZ0Fan5E490o9Ek0VKu/bDOv+/0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-GY-slRFQP1GTKVDEaAxpfA-1; Tue, 24 Aug 2021 07:22:14 -0400
X-MC-Unique: GY-slRFQP1GTKVDEaAxpfA-1
Received: by mail-ed1-f71.google.com with SMTP id
 s25-20020a50d499000000b003c1a8573042so4666929edi.11
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 04:22:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0//PW/ruwid54vjIQWoZFZqcMIYYbYTUzPvqJt7Kjho=;
 b=QMSeVT3oBPy8QRW1vEqLXl4Xp7sXY96JdITmJcZTJH7dLgGwAZZ+XkNqr2GahmBwBL
 oINbma1pSlmR8VsgZQG6+/G3L7vQogIpDG0AiZneg1JA8mrenbxlPlxBjYqo9EaccuOV
 HwwqpBrS4mbDGgBddMrzvwUmAaUr57BsJSsD1ZX5kfQaJahQuL1xkpNLjMLBw89hCV1n
 Am34IEG1qkQd+BZ0JpVtcArK1z8zyVdtxglF9SlelVa6o5hvPS8x3xxbUjlgHwY1Nvbe
 fzEDaItTghUj+6qEPbVTThC5aHX5RCCw3uF3P+dGWrDewsgu6hKl8sca0eRP+m5OiBil
 7dTg==
X-Gm-Message-State: AOAM530x65NYW0/hLRNbxFuBDFh6jdrZfw19BFLSIf3Ox0J+OG8W7ZgX
 NjYrnhlWufj7g9qhr7xH0gi9icFyiMAMbxAlzBnH4vkKVbpMLglI4YpvoDoV0APdEkEP4MNrFaR
 FDrCMlLb7yG7OtGQ=
X-Received: by 2002:a05:6402:1d33:: with SMTP id
 dh19mr42952654edb.10.1629804132941; 
 Tue, 24 Aug 2021 04:22:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBrOnO9I9lTPGYpGb9CS5NExQ9LHOa0QC4kZT/eCjuDLbBvC0H/JkXMu27ekZ4/p1QfRdgag==
X-Received: by 2002:a05:6402:1d33:: with SMTP id
 dh19mr42952623edb.10.1629804132662; 
 Tue, 24 Aug 2021 04:22:12 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id o21sm3388426eji.29.2021.08.24.04.22.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 04:22:12 -0700 (PDT)
Date: Tue, 24 Aug 2021 13:22:11 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH] hw/acpi/pcihp: validate bsel property of the bus before
 unplugging device
Message-ID: <20210824132211.3e8414d6@redhat.com>
In-Reply-To: <alpine.DEB.2.22.394.2108241603590.891355@anisinha-lenovo>
References: <20210821150535.763541-1-ani@anisinha.ca>
 <20210823190444-mutt-send-email-mst@kernel.org>
 <20210824105614.2762541f@redhat.com>
 <alpine.DEB.2.22.394.2108241603590.891355@anisinha-lenovo>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
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
Cc: philmd@redhat.com, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 24 Aug 2021 16:07:30 +0530 (IST)
Ani Sinha <ani@anisinha.ca> wrote:

> On Tue, 24 Aug 2021, Igor Mammedov wrote:
> 
> > On Mon, 23 Aug 2021 19:06:47 -0400
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >  
> > > On Sat, Aug 21, 2021 at 08:35:35PM +0530, Ani Sinha wrote:  
> > > > Bsel property of the pci bus indicates whether the bus supports acpi hotplug.
> > > > We need to validate the presence of this property before performing any hotplug
> > > > related callback operations. Currently validation of the existence of this
> > > > property was absent from acpi_pcihp_device_unplug_cb() function but is present
> > > > in other hotplug/unplug callback functions. Hence, this change adds the missing
> > > > check for the above function.
> > > >
> > > > Signed-off-by: Ani Sinha <ani@anisinha.ca>  
> > >
> > > I queued this but I have a general question:  
> > I convinced myself that this patch is wrong, pls drop it.
> >  
> > > are all these errors logged with LOG_GUEST_ERROR?
> > > Because if not we have a security problem.
> > > I also note that bsel is an internal property,
> > > I am not sure we should be printing this to users,
> > > it might just confuse them.
> > >
> > > Same question for all the other places validating bsel.  
> >
> > Commit message misses reproducer/explanation about
> > how it could be triggered?
> >
> > If it's actually reachable, from my point of view
> > putting checks all through out call chain is not robust
> > and it's easy to miss issues caused by invalid bsel.
> > Instead of putting check all over the code, I'd
> > check value on entry points (pci_read/pci_write)
> > if code there is broken.
> >  
> > >  
> > > > ---
> > > >  hw/acpi/pcihp.c | 10 ++++++++--
> > > >  1 file changed, 8 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> > > > index 0fd0c1d811..9982815a87 100644
> > > > --- a/hw/acpi/pcihp.c
> > > > +++ b/hw/acpi/pcihp.c
> > > > @@ -372,9 +372,15 @@ void acpi_pcihp_device_unplug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
> > > >                                   DeviceState *dev, Error **errp)
> > > >  {
> > > >      PCIDevice *pdev = PCI_DEVICE(dev);
> > > > +    int bsel = acpi_pcihp_get_bsel(pci_get_bus(pdev));
> > > > +
> > > > +    trace_acpi_pci_unplug(PCI_SLOT(pdev->devfn), bsel);
> > > >
> > > > -    trace_acpi_pci_unplug(PCI_SLOT(pdev->devfn),
> > > > -                          acpi_pcihp_get_bsel(pci_get_bus(pdev)));
> > > > +    if (bsel < 0) {
> > > > +        error_setg(errp, "Unsupported bus. Bus doesn't have property '"
> > > > +                   ACPI_PCIHP_PROP_BSEL "' set");
> > > > +        return;
> > > > +    }  
> >
> > 1st:
> >  Error here is useless. this path is triggered on guest
> >  MMIO write and there is no consumer for error whatsoever.
> >  If I recall correctly, in such cases we in PCIHP code we make
> >  such access a silent NOP. And tracing is there for a us
> >  to help figure out what's going on.
> >
> > 2nd:
> >  if it got this far, it means a device on a bus with bsel
> >  was found and we are completing cleanup. Error-ing out at
> >  this point will leak acpi_index.  
> 
> The above two points seems to apply in this case as well and so should we
> do this?

Please see where acpi_pcihp_device_unplug_request_cb() is called from,
that should answer your question.


> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index 0fd0c1d811..c7692f5d5f 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -400,12 +400,6 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
> 
>      trace_acpi_pci_unplug_request(bsel, slot);
> 
> -    if (bsel < 0) {
> -        error_setg(errp, "Unsupported bus. Bus doesn't have property '"
> -                   ACPI_PCIHP_PROP_BSEL "' set");
> -        return;
> -    }
> -
>      s->acpi_pcihp_pci_status[bsel].down |= (1U << slot);
>      acpi_send_event(DEVICE(hotplug_dev), ACPI_PCI_HOTPLUG_STATUS);
>  }
> 
> 
> I wanted to check before sending out a formal patch. I like symmetric
> code.



