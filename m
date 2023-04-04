Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E32806D6595
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 16:40:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjhpj-00036W-TO; Tue, 04 Apr 2023 10:40:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pjhph-00034P-En
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:40:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pjhpf-0007Vt-E8
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:40:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680619222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wUUHHSUP/YRbicKm8dUXGbDQ0wHKd7XBQivwQT70oQQ=;
 b=S5sYrZK5edBd8Ee+mmnBq/3uRoYjaOTpZiaAN/qsQ12NDkRI9Uk8+3NGY9+lhdAnPjBwwx
 s/WVeDxTlVpjCF3LIHCHjrVb8MUzyUjjIgvD35+4mKHe3+sM0+Si6m8G1AAp6LrvqKq7z7
 8E+hRYuWSeBrPfFpaPKcEOefY0Z6aBk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-399-gN9WT0sFMEWPtqjn0TXB9w-1; Tue, 04 Apr 2023 10:40:21 -0400
X-MC-Unique: gN9WT0sFMEWPtqjn0TXB9w-1
Received: by mail-ed1-f70.google.com with SMTP id
 v1-20020a50d581000000b0050291cda08aso12874349edi.15
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 07:40:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680619220;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wUUHHSUP/YRbicKm8dUXGbDQ0wHKd7XBQivwQT70oQQ=;
 b=tSxUwmA7hfIQ1LY9+8kx5xbXZxYxYl3IaWlSyTWQePGGfWgeAOV7y17Vy+uWQggvy0
 MH4/x/539WZm19rrp9U5PWO4ntVCBt8WI2mdJxk1k3+v6wKZpiMbLXRc0oZhfPjOGzcZ
 eO14AS2tRu7xb6z+jDT6RH4CVtEWeu6bxRapZcneoMpzx7uO8cecVEiEUPpMWYjoULrV
 +2hj6F9ZslYhseWr4yyQ7pZORwI4RviM50YlopTXOW3kAKiqr8x9LXrgqHeXmA9930wX
 h02O7bbiMO7aZp/PDRQEfBU1j0wA4fzmN98GN82SOJ8E4TZlbAw9G9jBD6EI9ZCfMmcf
 TOdw==
X-Gm-Message-State: AAQBX9f/Ncdd0VnUgl2v/Xi8bYgLiQUxITHi09UlWtxEsMpdxYmOxtSg
 UJC59gKl8WGIlbe0Eoy3f15Jl0iNvTOJYUboDvOo0frS00eJ2emmOSPdJQKcO75TX3eibZMejyg
 0a7deax5qNcTgtPA=
X-Received: by 2002:a17:906:5659:b0:931:99b5:6791 with SMTP id
 v25-20020a170906565900b0093199b56791mr2035324ejr.72.1680619220355; 
 Tue, 04 Apr 2023 07:40:20 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y2bgWG98rrLi4v5CRxpPJF5eWnfvztcWGHKHesDHkvA0BZLLxGVkDs+q9F0GUXjl+BKDOg5A==
X-Received: by 2002:a17:906:5659:b0:931:99b5:6791 with SMTP id
 v25-20020a170906565900b0093199b56791mr2035313ejr.72.1680619220078; 
 Tue, 04 Apr 2023 07:40:20 -0700 (PDT)
Received: from redhat.com ([2.52.129.179]) by smtp.gmail.com with ESMTPSA id
 be6-20020a1709070a4600b00949173c1dcfsm892479ejc.18.2023.04.04.07.40.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:40:19 -0700 (PDT)
Date: Tue, 4 Apr 2023 10:40:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <anisinha@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 jusual@redhat.com, kraxel@redhat.com, pbonzini@redhat.com
Subject: Re: [PATCH] acpi: pcihp: make pending delete expire in 5sec
Message-ID: <20230404103953-mutt-send-email-mst@kernel.org>
References: <20230403161618.1344414-1-imammedo@redhat.com>
 <20230403131833-mutt-send-email-mst@kernel.org>
 <20230404102807.4626b0be@imammedo.users.ipa.redhat.com>
 <20230404084603-mutt-send-email-mst@kernel.org>
 <20230404160435.45c2513d@imammedo.users.ipa.redhat.com>
 <CAK3XEhMSt5fWZV+AF6nT5yMxFP+PQNfEyCK0yVpCvJSxRwVoug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK3XEhMSt5fWZV+AF6nT5yMxFP+PQNfEyCK0yVpCvJSxRwVoug@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Tue, Apr 04, 2023 at 07:40:40PM +0530, Ani Sinha wrote:
> 
> 
> On Tue, Apr 4, 2023 at 7:34 PM Igor Mammedov <imammedo@redhat.com> wrote:
> 
>     On Tue, 4 Apr 2023 08:46:15 -0400
>     "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
>     > On Tue, Apr 04, 2023 at 10:28:07AM +0200, Igor Mammedov wrote:
>     > > On Mon, 3 Apr 2023 13:23:45 -0400
>     > > "Michael S. Tsirkin" <mst@redhat.com> wrote:
>     > >   
>     > > > On Mon, Apr 03, 2023 at 06:16:18PM +0200, Igor Mammedov wrote: 
>     > > > > with Q35 using ACPI PCI hotplug by default, user's request to
>     unplug
>     > > > > device is ignored when it's issued before guest OS has been booted.
>     > > > > And any additional attempt to request device hot-unplug afterwards
>     > > > > results in following error:
>     > > > >
>     > > > >   "Device XYZ is already in the process of unplug"
>     > > > >
>     > > > > arguably it can be considered as a regression introduced by [2],
>     > > > > before which it was possible to issue unplug request multiple
>     > > > > times.
>     > > > >
>     > > > > Allowing pending delete expire brings ACPI PCI hotplug on par
>     > > > > with native PCIe unplug behavior [1] which in its turn refers
>     > > > > back to ACPI PCI hotplug ability to repeat unplug requests.
>     > > > >
>     > > > > PS:   
>     > > > > >From ACPI point of view, unplug request sets PCI hotplug status   
>     > > > > bit in GPE0 block. However depending on OSPM, status bits may
>     > > > > be retained (Windows) or cleared (Linux) during guest's ACPI
>     > > > > subsystem initialization, and as result Linux guest looses
>     > > > > plug/unplug event (no SCI generated) if plug/unplug has
>     > > > > happend before guest OS initialized GPE registers handling.
>     > > > > I couldn't find any restrictions wrt OPM clearing GPE status
>     > > > > bits ACPI spec.
>     > > > > Hence a fallback approach is to let user repeat unplug request
>     > > > > later at the time when guest OS has booted.
>     > > > >
>     > > > > 1) 18416c62e3 ("pcie: expire pending delete")
>     > > > > 2)
>     > > > > Fixes: cce8944cc9ef ("qdev-monitor: Forbid repeated device_del")
>     > > > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>   
>     > > >
>     > > > A bit concerned about how this interacts with failover,
>     > > > and 5sec is a lot of time that I hoped we'd avoid with acpi.
>     > > > Any better ideas of catching such misbehaving guests? 
>     > >
>     > > It shouldn't affect affect failover, pending_delete is not
>     > > cleared after all (only device removal should do that).
>     > > So all patch does is allowing to reissue unplug request
>     > > in case it was lost, delay here doesn't mean much
>     > > (do you have any preference wrt specific value)? 
>     >
>     > I'd prefer immediately.
> 
>     ok, lets use 1ms then, I'd rather reuse the preexisting
>     pending_deleted_expires_ms machinery instead of
>     special-casing immediate repeat.
> 
> 
> Sounds good to me.
>  

OK but please add a comment explaining what's going on.


> 
>     >
>     > > As for 'misbehaving' - I tried to find justification
>     > > for it in spec, but I couldn't.
>     > > Essentially it's upto OSPM to clear or not GPE status
>     > > bits at startup (linux was doing it since forever),
>     > > depending on guest's ability to handle hotplug events
>     > > at boot time.
>     > >
>     > > It's more a user error, ACPI hotplug does imply booted
>     > > guest for it to function properly. So it's fine to
>     > > loose unplug event at boot time. What QEMU does wrong is
>     > > preventing follow up unplug requests. 
>     > >   
>     > > >
>     > > > Also at this point I do not know why we deny hotplug
>     > > > pending_deleted_event in qdev core. 
>     > > > Commit log says:
>     > > >
>     > > >     Device unplug can be done asynchronously. Thus, sending the
>     second
>     > > >     device_del before the previous unplug is complete may lead to
>     > > >     unexpected results. On PCIe devices, this cancels the hot-unplug
>     > > >     process.
>     > > >
>     > > > so it's a work around for an issue in pcie hotplug (and maybe shpc
>     > > > too?). Maybe we should have put that check in pcie/shpc and
>     > > > leave acpi along?
>     > > >
>     > > >
>     > > >
>     > > >   
>     > > > > ---
>     > > > > CC: mst@redhat.com
>     > > > > CC: anisinha@redhat.com
>     > > > > CC: jusual@redhat.com
>     > > > > CC: kraxel@redhat.com
>     > > > > ---
>     > > > >  hw/acpi/pcihp.c | 2 ++
>     > > > >  1 file changed, 2 insertions(+)
>     > > > >
>     > > > > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
>     > > > > index dcfb779a7a..cd4f9fee0a 100644
>     > > > > --- a/hw/acpi/pcihp.c
>     > > > > +++ b/hw/acpi/pcihp.c
>     > > > > @@ -357,6 +357,8 @@ void acpi_pcihp_device_unplug_request_cb
>     (HotplugHandler *hotplug_dev,
>     > > > >       * acpi_pcihp_eject_slot() when the operation is completed.
>     > > > >       */
>     > > > >      pdev->qdev.pending_deleted_event = true;
>     > > > > +    pdev->qdev.pending_deleted_expires_ms =
>     > > > > +        qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + 5000; /* 5 secs */
>     > > > >      s->acpi_pcihp_pci_status[bsel].down |= (1U << slot);
>     > > > >      acpi_send_event(DEVICE(hotplug_dev), ACPI_PCI_HOTPLUG_STATUS);
>     > > > >  }
>     > > > > --
>     > > > > 2.39.1   
>     > > >   
>     >
> 
> 


