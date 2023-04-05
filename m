Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2416D7932
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 12:02:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjzyS-0005Xy-Jx; Wed, 05 Apr 2023 06:02:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pjzyR-0005Xg-B0
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:02:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pjzyP-0001SO-H8
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:02:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680688956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fzroT10Iz8pTditWZ6zJs8YbKVhN6khiwPIsMlpaV9E=;
 b=Qg4tL1sOKoI/5e/SCTd5iOKRDoD0M4R+HBfsFJZGE2u14yHE3+isbvhrmT3Qm+8hsfl8HG
 9h2UC75EHf8slqWKPq4Gy6npUWVwX/fhySQZFiSfYUwme8X0KgHkkh5I7RMrggej3iGN2X
 0suOILa8mxhq0ni7MzOGm54GdFRJbbw=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-FG6OMGsOPau3ufH7KsBdtg-1; Wed, 05 Apr 2023 06:02:35 -0400
X-MC-Unique: FG6OMGsOPau3ufH7KsBdtg-1
Received: by mail-lj1-f199.google.com with SMTP id
 f16-20020a05651c03d000b0029bebfa766dso7732147ljp.11
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 03:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680688953;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fzroT10Iz8pTditWZ6zJs8YbKVhN6khiwPIsMlpaV9E=;
 b=0+kLym8nEpO5dtMnDq6Zfk9noWDn1VLxRZA8+JYxFr7fi9jsqxIjYecIsrGJw17qRs
 SzMyjYc7m9/ma2twvq1QeqKB/LdEEk9RuVSz/WGODKD3c24POded3BLddzRUlorK9Pl/
 j7GJqQnDeCAeEdZKc3PciWpkaWx/Qg2XdEawS6RDLT7aODmDPY5zf3i+nrtr0N9yZoPO
 zGPfm02+ZFrvfIogBSHS51KKOgZ2PMHCVxyghwuwBG0CU8bfaz936CmCjH4aYAFMVHz+
 o2XWTR4cMcmAhSySJK4t/J0xak6MuN2GsdudNGSRyTH43yFYZsNlRlkF7Qo6GkizR4vH
 1FeA==
X-Gm-Message-State: AAQBX9dFju7li/ZKtWfIGGdHvjeriQdEWaQX+XMgDcUeHTv0hrYQXoUt
 eUCWhyFjrdf1CPrSvKsaIueHDdPDpZG3YJJL/L9ipl4FhSkpKES9RmCTcGkT5VKBupBkloaPFij
 wO9w5e6gsARxkNDA=
X-Received: by 2002:ac2:5eda:0:b0:4e8:221f:5886 with SMTP id
 d26-20020ac25eda000000b004e8221f5886mr1676570lfq.19.1680688953606; 
 Wed, 05 Apr 2023 03:02:33 -0700 (PDT)
X-Google-Smtp-Source: AKy350bbjfB6nA1Q7kOB/NgrrIWX6DEEKTfb0QBunxyX4Z/7HlJvVo2M/Lv6hwiGkHRJh7FYhvrw4g==
X-Received: by 2002:ac2:5eda:0:b0:4e8:221f:5886 with SMTP id
 d26-20020ac25eda000000b004e8221f5886mr1676560lfq.19.1680688953205; 
 Wed, 05 Apr 2023 03:02:33 -0700 (PDT)
Received: from redhat.com ([2.52.139.22]) by smtp.gmail.com with ESMTPSA id
 i9-20020a50c3c9000000b005023a4b20dfsm7102513edf.2.2023.04.05.03.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 03:02:32 -0700 (PDT)
Date: Wed, 5 Apr 2023 06:02:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, anisinha@redhat.com, jusual@redhat.com,
 kraxel@redhat.com
Subject: Re: [PATCH v2] acpi: pcihp: make pending delete blocking action expire
Message-ID: <20230405055946-mutt-send-email-mst@kernel.org>
References: <20230405083444.1536720-1-imammedo@redhat.com>
 <20230405044231-mutt-send-email-mst@kernel.org>
 <20230405113856.72065fd0@imammedo.users.ipa.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405113856.72065fd0@imammedo.users.ipa.redhat.com>
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

On Wed, Apr 05, 2023 at 11:38:56AM +0200, Igor Mammedov wrote:
> On Wed, 5 Apr 2023 04:47:48 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Wed, Apr 05, 2023 at 10:34:44AM +0200, Igor Mammedov wrote:
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
> > > Allowing pending delete blocking expire brings ACPI PCI hotplug
> > > on par with native PCIe unplug behavior [1] and allows user
> > > to repeat unplug requests at propper times.
> > > Set expire timeout to arbitrary 1msec so user won't be able to
> > > flood guest with SCI interrupts by calling device_del in tight loop.
> > > 
> > > PS:
> > > ACPI spec doesn't mandate what OSPM can do with GPEx.status
> > > bits set before it's booted => it's impl. depended.
> > > Status bits may be retained (I tested with one Windows version)
> > > or cleared (Linux since 2.6 kernel times) during guest's ACPI
> > > subsystem initialization.
> > > Clearing status bits (though not wrong per se) hides the unplug
> > > event from guest, and it's upto user to repeat device_del later
> > > when guest is able to handle unplug requests.
> > > 
> > > 1) 18416c62e3 ("pcie: expire pending delete")
> > > 2)
> > > Fixes: cce8944cc9ef ("qdev-monitor: Forbid repeated device_del")
> > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>  
> > 
> > I feel a real solution is to detect guest handling the
> > event such as clearing GPE and allowing resending
> > the interrupt then.
> 
> I did consider preserving(masking clearing attempt) of GPE0.sts[]
> IF en[] hasn't been enabled ever (i.e. should help with unplug at
> the 1st boot). But that won't work across reboots (depends on
> reboot kind) and it's twisting rules wrt spec (platform(QEMU/fw)
> may set status bits, but it's upto OSPM to decide what to do with
> them (when and how clear or ignore them). 
> 
> > A similar strategy should be possible with the attention
> > button.
> > 
> 
> > This patch is more of a band-aid - it is possible that guest
> > rebooted and so user knows a new device_del is required,
> > and we arbitrarily reject that. Right?
> You lost me here. Can you elaborate?

I request device deletion but guest was rebooting losing state.
I want to request deletion again but the request will fail
until 1ms passes. 1ms is not a lot but I really don't want
management to learn weird tricks like waiting for 1ms.



> > 
> > This is arguably a regression but not in this release yes?
> > So I don't think it needs to block qemu release.
> > 
> > 
> > > ---
> > > v2:
> > >    * change timeout to 1ms
> > >    * add comment to expire usage
> > >    * massage commit message to be a bit more clear
> > > 
> > > CC: mst@redhat.com
> > > CC: anisinha@redhat.com
> > > CC: jusual@redhat.com
> > > CC: kraxel@redhat.com  
> > 
> > It's helpful to have CC before --- so backporters know whom to CC, too.
> 
> ok, I'll fix it up and respin
> 
> > 
> > > ---
> > >  hw/acpi/pcihp.c | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > > 
> > > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> > > index dcfb779a7a..5daa732a33 100644
> > > --- a/hw/acpi/pcihp.c
> > > +++ b/hw/acpi/pcihp.c
> > > @@ -357,6 +357,16 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
> > >       * acpi_pcihp_eject_slot() when the operation is completed.
> > >       */
> > >      pdev->qdev.pending_deleted_event = true;
> > > +    /* if unplug was requested before OSPM is initialized,
> > > +     * linux kernel will clear GPE0.sts[] bits during boot, which effectively
> > > +     * hides unplug event. BAnd than followup qmp_device_del() calls remain  
> > 
> > BAnd?
> > 
> > > +     * blocked by above flag permanently.
> > > +     * Unblock qmp_device_del() by setting expire limit, so user can
> > > +     * repeat unplug request later when OSPM has been booted.
> > > +     */
> > > +    pdev->qdev.pending_deleted_expires_ms =
> > > +        qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL); /* 1 msec */
> > > +
> > >      s->acpi_pcihp_pci_status[bsel].down |= (1U << slot);
> > >      acpi_send_event(DEVICE(hotplug_dev), ACPI_PCI_HOTPLUG_STATUS);
> > >  }
> > > -- 
> > > 2.39.1  
> > 


