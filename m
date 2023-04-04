Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C78C6D5AEC
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 10:28:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjc1b-00039J-0v; Tue, 04 Apr 2023 04:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pjc1X-00038B-HN
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 04:28:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pjc1V-0004sN-C1
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 04:28:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680596891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5uAIfcEqxBfHVOc8ujsjsSuufbTEbkeMKrIe10fK93E=;
 b=bqsnfgmkTnkxDEHsM9tPy4WvCb+R3h/QR68JHl+kaVYB13jU6NygInNUaQmp/xpyUZ1f+8
 IRGZdvZciMjW/yK+XnZ8BJkIWfobQYcN/K6K5YfutGrl3t/r6j8B4fA/pkZonX5Yn7XzCU
 3mXGcQP1jxsoobg7Vf+4G+/kX31JJPY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-gGFrBVPIPLqiPYEWTDzrRg-1; Tue, 04 Apr 2023 04:28:10 -0400
X-MC-Unique: gGFrBVPIPLqiPYEWTDzrRg-1
Received: by mail-ed1-f71.google.com with SMTP id
 a27-20020a50c31b000000b0050047ecf4bfso45103064edb.19
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 01:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680596889;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5uAIfcEqxBfHVOc8ujsjsSuufbTEbkeMKrIe10fK93E=;
 b=JxSW2eRSwovlmZjlca9GDwu6uyYvkKIe3t+afkRE9skzBqbbfVu9FFpPu4ZgGYmMdt
 T22g85EmsEpGxOVqBBGeLzNcm+9q0mZBbRUrM66cgztjSCwWz+MotJnqoD2/hCgPPQyf
 HjsWdGm2gRaiUkfOPJAtn3m7W+S/E0kmctxOZFs+sw/yfqmHZTgbClIKJZg0VTApb2LN
 gh9lhvixOahu27Oo9N2Bb/49LdSanVBDPR6Pk25cLmSLp3el6u5FsrPlNh5K5KPuxct9
 lahD9z1vIMuMnXzTA/LmX7DM8MwDv5N+On4c2X+wr1wKs5yQc8B00/ZfdofxLR++aKNO
 lnJg==
X-Gm-Message-State: AAQBX9efOov08NW80oMfTSZkK8G7GFxBD5d/EJHZwSkKvIjqIi3TUvk1
 2z+1cXOa1q4xw5CXf/z+GnOGiG+e4CBygdQrLfJH2SqDDT57XHJ9asuxSrcu30xlR4rF9Fz2G4E
 x0qu4ttTIBdca7nc=
X-Received: by 2002:a05:6402:658:b0:4ab:d1f4:4b88 with SMTP id
 u24-20020a056402065800b004abd1f44b88mr1704416edx.41.1680596889044; 
 Tue, 04 Apr 2023 01:28:09 -0700 (PDT)
X-Google-Smtp-Source: AKy350bLN3BsMdHyOPZH3MOrUHvC0ufy78AiF9Nu0RGxErdqGYGDrKbJHo34NOvo5qRog3vRO9e6Wg==
X-Received: by 2002:a05:6402:658:b0:4ab:d1f4:4b88 with SMTP id
 u24-20020a056402065800b004abd1f44b88mr1704396edx.41.1680596888729; 
 Tue, 04 Apr 2023 01:28:08 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 bq18-20020a056402215200b00501c2a9e16dsm5463817edb.74.2023.04.04.01.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 01:28:08 -0700 (PDT)
Date: Tue, 4 Apr 2023 10:28:07 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, anisinha@redhat.com, jusual@redhat.com,
 kraxel@redhat.com, pbonzini@redhat.com
Subject: Re: [PATCH] acpi: pcihp: make pending delete expire in 5sec
Message-ID: <20230404102807.4626b0be@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230403131833-mutt-send-email-mst@kernel.org>
References: <20230403161618.1344414-1-imammedo@redhat.com>
 <20230403131833-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

On Mon, 3 Apr 2023 13:23:45 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Mon, Apr 03, 2023 at 06:16:18PM +0200, Igor Mammedov wrote:
> > with Q35 using ACPI PCI hotplug by default, user's request to unplug
> > device is ignored when it's issued before guest OS has been booted.
> > And any additional attempt to request device hot-unplug afterwards
> > results in following error:
> > 
> >   "Device XYZ is already in the process of unplug"
> > 
> > arguably it can be considered as a regression introduced by [2],
> > before which it was possible to issue unplug request multiple
> > times.
> > 
> > Allowing pending delete expire brings ACPI PCI hotplug on par
> > with native PCIe unplug behavior [1] which in its turn refers
> > back to ACPI PCI hotplug ability to repeat unplug requests.
> > 
> > PS:  
> > >From ACPI point of view, unplug request sets PCI hotplug status  
> > bit in GPE0 block. However depending on OSPM, status bits may
> > be retained (Windows) or cleared (Linux) during guest's ACPI
> > subsystem initialization, and as result Linux guest looses
> > plug/unplug event (no SCI generated) if plug/unplug has
> > happend before guest OS initialized GPE registers handling.
> > I couldn't find any restrictions wrt OPM clearing GPE status
> > bits ACPI spec.
> > Hence a fallback approach is to let user repeat unplug request
> > later at the time when guest OS has booted.
> > 
> > 1) 18416c62e3 ("pcie: expire pending delete")
> > 2)
> > Fixes: cce8944cc9ef ("qdev-monitor: Forbid repeated device_del")
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>  
> 
> A bit concerned about how this interacts with failover,
> and 5sec is a lot of time that I hoped we'd avoid with acpi.
> Any better ideas of catching such misbehaving guests?

It shouldn't affect affect failover, pending_delete is not
cleared after all (only device removal should do that).
So all patch does is allowing to reissue unplug request
in case it was lost, delay here doesn't mean much
(do you have any preference wrt specific value)?

As for 'misbehaving' - I tried to find justification
for it in spec, but I couldn't.
Essentially it's upto OSPM to clear or not GPE status
bits at startup (linux was doing it since forever),
depending on guest's ability to handle hotplug events
at boot time.

It's more a user error, ACPI hotplug does imply booted
guest for it to function properly. So it's fine to
loose unplug event at boot time. What QEMU does wrong is
preventing follow up unplug requests.  

> 
> Also at this point I do not know why we deny hotplug
> pending_deleted_event in qdev core.  
> Commit log says:
> 
>     Device unplug can be done asynchronously. Thus, sending the second
>     device_del before the previous unplug is complete may lead to
>     unexpected results. On PCIe devices, this cancels the hot-unplug
>     process.
> 
> so it's a work around for an issue in pcie hotplug (and maybe shpc
> too?). Maybe we should have put that check in pcie/shpc and
> leave acpi along?
> 
> 
> 
> 
> > ---
> > CC: mst@redhat.com
> > CC: anisinha@redhat.com
> > CC: jusual@redhat.com
> > CC: kraxel@redhat.com
> > ---
> >  hw/acpi/pcihp.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> > index dcfb779a7a..cd4f9fee0a 100644
> > --- a/hw/acpi/pcihp.c
> > +++ b/hw/acpi/pcihp.c
> > @@ -357,6 +357,8 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
> >       * acpi_pcihp_eject_slot() when the operation is completed.
> >       */
> >      pdev->qdev.pending_deleted_event = true;
> > +    pdev->qdev.pending_deleted_expires_ms =
> > +        qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + 5000; /* 5 secs */
> >      s->acpi_pcihp_pci_status[bsel].down |= (1U << slot);
> >      acpi_send_event(DEVICE(hotplug_dev), ACPI_PCI_HOTPLUG_STATUS);
> >  }
> > -- 
> > 2.39.1  
> 


