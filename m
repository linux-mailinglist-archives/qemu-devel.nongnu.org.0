Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4625C6D618B
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 14:47:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjg3S-0007gV-7M; Tue, 04 Apr 2023 08:46:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pjg3M-0007g2-LF
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 08:46:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pjg3K-0003op-Uq
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 08:46:24 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-GJtXN90dNYGsBaL8kKQMiQ-1; Tue, 04 Apr 2023 08:46:20 -0400
X-MC-Unique: GJtXN90dNYGsBaL8kKQMiQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 t14-20020a056402240e00b004fb36e6d670so45645135eda.5
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 05:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680612379;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u/hL4MX8D7qF3+aqq/oVih+V1m8I1WqtawQN76J6xoo=;
 b=Ul1mzCnm8gfhfqgEjrQTjDGJ40y/vSisPf1QJ82K50L3BVrcCpiSKlZ+mHuyq9hOu+
 Zc59s2YyyIoe5+uozQFsz5qsfH9wzGJRWaq8R7bkk4rDK+e3NJciUY/VWnfF7QBhYRMM
 sB9lRKGVhHZtJdhDZNzNzq75sm+IgoMVm8c6Z/2AOyADcx5U8T2ya4ZRtSVtuWL2zjFA
 xRgMv/maR2HknakLGSjsUp4lKHVy4k98HXCcewhXVJf1xMkKJxPfOCKaNuQbGvnaBIol
 vEQvMSQXG8g5gr5OOXhOLIJs5bda0vwwJNd9FpyQgbdKaBBoG7jKqenmK9/t9Bc2X7Pl
 2Wfw==
X-Gm-Message-State: AAQBX9fPn/eMeMimVSWiQesGzpxjktaI7Orzr1jfVRggrhcJq7dt//96
 fwbhlMy8W9CfdVnYTiUc37E0+Izr1zTxWDSNQBtdXnXUBekZUh42NDkhBsIuxe5GBVL6G8fIwhQ
 zfy8DQQw5axwPMG8=
X-Received: by 2002:a05:6402:26d5:b0:4af:7bdc:188e with SMTP id
 x21-20020a05640226d500b004af7bdc188emr21363634edd.16.1680612379376; 
 Tue, 04 Apr 2023 05:46:19 -0700 (PDT)
X-Google-Smtp-Source: AKy350aeFdvedHQCteOO29W5en8qgO9CSNrO66MvO+w9fHNsRWLLvTUCz85AxFuxSJ6KjhLmF0KTxA==
X-Received: by 2002:a05:6402:26d5:b0:4af:7bdc:188e with SMTP id
 x21-20020a05640226d500b004af7bdc188emr21363623edd.16.1680612379108; 
 Tue, 04 Apr 2023 05:46:19 -0700 (PDT)
Received: from redhat.com ([2.52.129.179]) by smtp.gmail.com with ESMTPSA id
 cy8-20020a0564021c8800b00502689a06b2sm5760718edb.91.2023.04.04.05.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 05:46:18 -0700 (PDT)
Date: Tue, 4 Apr 2023 08:46:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, anisinha@redhat.com, jusual@redhat.com,
 kraxel@redhat.com, pbonzini@redhat.com
Subject: Re: [PATCH] acpi: pcihp: make pending delete expire in 5sec
Message-ID: <20230404084603-mutt-send-email-mst@kernel.org>
References: <20230403161618.1344414-1-imammedo@redhat.com>
 <20230403131833-mutt-send-email-mst@kernel.org>
 <20230404102807.4626b0be@imammedo.users.ipa.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230404102807.4626b0be@imammedo.users.ipa.redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Tue, Apr 04, 2023 at 10:28:07AM +0200, Igor Mammedov wrote:
> On Mon, 3 Apr 2023 13:23:45 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Mon, Apr 03, 2023 at 06:16:18PM +0200, Igor Mammedov wrote:
> > > with Q35 using ACPI PCI hotplug by default, user's request to unplug
> > > device is ignored when it's issued before guest OS has been booted.
> > > And any additional attempt to request device hot-unplug afterwards
> > > results in following error:
> > > 
> > >   "Device XYZ is already in the process of unplug"
> > > 
> > > arguably it can be considered as a regression introduced by [2],
> > > before which it was possible to issue unplug request multiple
> > > times.
> > > 
> > > Allowing pending delete expire brings ACPI PCI hotplug on par
> > > with native PCIe unplug behavior [1] which in its turn refers
> > > back to ACPI PCI hotplug ability to repeat unplug requests.
> > > 
> > > PS:  
> > > >From ACPI point of view, unplug request sets PCI hotplug status  
> > > bit in GPE0 block. However depending on OSPM, status bits may
> > > be retained (Windows) or cleared (Linux) during guest's ACPI
> > > subsystem initialization, and as result Linux guest looses
> > > plug/unplug event (no SCI generated) if plug/unplug has
> > > happend before guest OS initialized GPE registers handling.
> > > I couldn't find any restrictions wrt OPM clearing GPE status
> > > bits ACPI spec.
> > > Hence a fallback approach is to let user repeat unplug request
> > > later at the time when guest OS has booted.
> > > 
> > > 1) 18416c62e3 ("pcie: expire pending delete")
> > > 2)
> > > Fixes: cce8944cc9ef ("qdev-monitor: Forbid repeated device_del")
> > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>  
> > 
> > A bit concerned about how this interacts with failover,
> > and 5sec is a lot of time that I hoped we'd avoid with acpi.
> > Any better ideas of catching such misbehaving guests?
> 
> It shouldn't affect affect failover, pending_delete is not
> cleared after all (only device removal should do that).
> So all patch does is allowing to reissue unplug request
> in case it was lost, delay here doesn't mean much
> (do you have any preference wrt specific value)?

I'd prefer immediately.

> As for 'misbehaving' - I tried to find justification
> for it in spec, but I couldn't.
> Essentially it's upto OSPM to clear or not GPE status
> bits at startup (linux was doing it since forever),
> depending on guest's ability to handle hotplug events
> at boot time.
> 
> It's more a user error, ACPI hotplug does imply booted
> guest for it to function properly. So it's fine to
> loose unplug event at boot time. What QEMU does wrong is
> preventing follow up unplug requests.  
> 
> > 
> > Also at this point I do not know why we deny hotplug
> > pending_deleted_event in qdev core.  
> > Commit log says:
> > 
> >     Device unplug can be done asynchronously. Thus, sending the second
> >     device_del before the previous unplug is complete may lead to
> >     unexpected results. On PCIe devices, this cancels the hot-unplug
> >     process.
> > 
> > so it's a work around for an issue in pcie hotplug (and maybe shpc
> > too?). Maybe we should have put that check in pcie/shpc and
> > leave acpi along?
> > 
> > 
> > 
> > 
> > > ---
> > > CC: mst@redhat.com
> > > CC: anisinha@redhat.com
> > > CC: jusual@redhat.com
> > > CC: kraxel@redhat.com
> > > ---
> > >  hw/acpi/pcihp.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> > > index dcfb779a7a..cd4f9fee0a 100644
> > > --- a/hw/acpi/pcihp.c
> > > +++ b/hw/acpi/pcihp.c
> > > @@ -357,6 +357,8 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
> > >       * acpi_pcihp_eject_slot() when the operation is completed.
> > >       */
> > >      pdev->qdev.pending_deleted_event = true;
> > > +    pdev->qdev.pending_deleted_expires_ms =
> > > +        qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + 5000; /* 5 secs */
> > >      s->acpi_pcihp_pci_status[bsel].down |= (1U << slot);
> > >      acpi_send_event(DEVICE(hotplug_dev), ACPI_PCI_HOTPLUG_STATUS);
> > >  }
> > > -- 
> > > 2.39.1  
> > 


