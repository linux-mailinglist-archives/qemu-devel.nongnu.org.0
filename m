Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 411D144C48F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 16:40:01 +0100 (CET)
Received: from localhost ([::1]:49576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkphg-0006mU-Du
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 10:40:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mkpfC-0004YG-BI
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 10:37:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mkpf9-0005zS-DC
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 10:37:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636558642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bq6jmpcFHXMG+nKml4hfNe0qaUZNJHYxhCcAY358yaE=;
 b=eUSQM9fxDkr/jeaNUiQFcztzGTNz+OqTTPW5RSAHU6bLyBCfJEMKoSK+X3QrMwggFEMKun
 bvFOC+TnQe09FTvWoeC77puTcWEss9PCWQdvyYo8x4mxyM0i7EWCGRnWfFrPGcFMiIFPUC
 pXhrpY9z3EXzxLgco2NX+RTZ0A2YPNw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-LY3Gi5ORPlO6azcL3w6Kpg-1; Wed, 10 Nov 2021 10:37:21 -0500
X-MC-Unique: LY3Gi5ORPlO6azcL3w6Kpg-1
Received: by mail-wm1-f70.google.com with SMTP id
 m1-20020a1ca301000000b003231d5b3c4cso3264998wme.5
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 07:37:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bq6jmpcFHXMG+nKml4hfNe0qaUZNJHYxhCcAY358yaE=;
 b=722Nmjkqm1vqdhMdiHPiuOb80jGZez4WFNhhzKorE7KFcOUwYHRXx8c/keY47/9Yz4
 00wqKcBgLE0h1TDQyQ9IWkPd56640jJSQ5wcyCCGlkCtF/US1SJxGqQs4Rmnpxi6A0j5
 Iy16D1dD+gVI7pRvmoAKpYxWXwIunAbxaOUPgZzEJYpTXcHMDfu+ECKE2JgTsa1Ml7L8
 hrKq8IVYBGNtwAspIR/T5ETy0n58rsE0Zi2VbnbBXvkygL7Vt1nACaDj/f4eOVSOmZxP
 jd02x+eh2kW21QsKD+NZLazrbbf5s4BymYa1Hk7gU+C5d3qC9aDWMKUJB2O/f9KASfb8
 Edag==
X-Gm-Message-State: AOAM531nTxTCQ8O34F1N+UgbckpWv+EVBM18uXQ2GuFfGSJoc+mmvwyw
 vYD34mwpE3MVS5KOKH4dVOaFtv7HTNbDErUkfL/BbAbSmvS4gIFODsLqHw6Ozibgan2T6l+1D9J
 IU6e82f4A+Du/yiA=
X-Received: by 2002:a05:600c:b41:: with SMTP id
 k1mr18265096wmr.4.1636558639863; 
 Wed, 10 Nov 2021 07:37:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxwand2jfNGmL0xDpxts2T2L882Qah+aMUN4OiMK7E/9vgpbwYCqQ8j8AAdmlNyN9nhADGGAw==
X-Received: by 2002:a05:600c:b41:: with SMTP id
 k1mr18265051wmr.4.1636558639544; 
 Wed, 10 Nov 2021 07:37:19 -0800 (PST)
Received: from redhat.com ([2.55.133.41])
 by smtp.gmail.com with ESMTPSA id h204sm94918wmh.33.2021.11.10.07.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 07:37:18 -0800 (PST)
Date: Wed, 10 Nov 2021 10:37:15 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Julia Suvorova <jusual@redhat.com>
Subject: Re: [PATCH 4/5] hw/i386/acpi-build: Deny control on PCIe Native
 Hot-plug in _OSC
Message-ID: <20211110103612-mutt-send-email-mst@kernel.org>
References: <20211110053014.489591-1-jusual@redhat.com>
 <20211110053014.489591-5-jusual@redhat.com>
 <20211110011557-mutt-send-email-mst@kernel.org>
 <20211110145759.6570170e@redhat.com>
 <CAMDeoFXyZffTgcckpfZ8HLKZGVWROnBxteh2G5LcZP7RoSNO-A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMDeoFXyZffTgcckpfZ8HLKZGVWROnBxteh2G5LcZP7RoSNO-A@mail.gmail.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <mapfelba@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 10, 2021 at 04:25:40PM +0100, Julia Suvorova wrote:
> On Wed, Nov 10, 2021 at 2:58 PM Igor Mammedov <imammedo@redhat.com> wrote:
> >
> > On Wed, 10 Nov 2021 02:21:34 -0500
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >
> > > On Wed, Nov 10, 2021 at 06:30:13AM +0100, Julia Suvorova wrote:
> > > > There are two ways to enable ACPI PCI Hot-plug:
> > > >
> > > >         * Disable the Hot-plug Capable bit on PCIe slots.
> > > >
> > > > This was the first approach which led to regression [1-2], as
> > > > I/O space for a port is allocated only when it is hot-pluggable,
> > > > which is determined by HPC bit.
> > > >
> > > >         * Leave the HPC bit on and disable PCIe Native Hot-plug in _OSC
> > > >           method.
> > > >
> > > > This removes the (future) ability of hot-plugging switches with PCIe
> > > > Native hotplug since ACPI PCI Hot-plug only works with cold-plugged
> > > > bridges. If the user wants to explicitely use this feature, they can
> > > > disable ACPI PCI Hot-plug with:
> > > >         --global ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off
> > > >
> > > > Change the bit in _OSC method so that the OS selects ACPI PCI Hot-plug
> > > > instead of PCIe Native.
> > > >
> > > > [1] https://gitlab.com/qemu-project/qemu/-/issues/641
> > > > [2] https://bugzilla.redhat.com/show_bug.cgi?id=2006409
> > > >
> > > > Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > > > ---
> > > >  hw/i386/acpi-build.c | 12 ++++++++----
> > > >  1 file changed, 8 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > > > index a3ad6abd33..a2f92ab32b 100644
> > > > --- a/hw/i386/acpi-build.c
> > > > +++ b/hw/i386/acpi-build.c
> > > > @@ -1337,7 +1337,7 @@ static void build_x86_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr)
> > > >      aml_append(table, scope);
> > > >  }
> > > >
> > > > -static Aml *build_q35_osc_method(void)
> > > > +static Aml *build_q35_osc_method(bool acpi_pcihp)
> > > >  {
> > > >      Aml *if_ctx;
> > > >      Aml *if_ctx2;
> > > > @@ -1345,6 +1345,7 @@ static Aml *build_q35_osc_method(void)
> > > >      Aml *method;
> > > >      Aml *a_cwd1 = aml_name("CDW1");
> > > >      Aml *a_ctrl = aml_local(0);
> > > > +    const uint64_t hotplug = acpi_pcihp ? 0x1E : 0x1F;
> > >
> > > drop this variable and open-code at use point below.
> > > As it is the comment is misplaced.
> > > Also a slightly better way to write this:
> > > 0x1E | (acpi_pcihp ? 0x0 : 0x1)
> > >
> > >
> > >
> > > >
> > > >      method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
> > > >      aml_append(method, aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
> > >
> > > So what acpi_pcihp does is enable/disable native pcie hotplug.
> > > How about we call the option exactly that?
> > >
> > >
> > > > @@ -1359,8 +1360,9 @@ static Aml *build_q35_osc_method(void)
> > > >      /*
> > > >       * Always allow native PME, AER (no dependencies)
> > > >       * Allow SHPC (PCI bridges can have SHPC controller)
> > > > +     * Disable PCIe Native Hot-plug if ACPI PCI Hot-plug is enabled.
> > > >       */
> > > > -    aml_append(if_ctx, aml_and(a_ctrl, aml_int(0x1F), a_ctrl));
> > > > +    aml_append(if_ctx, aml_and(a_ctrl, aml_int(hotplug), a_ctrl));
> > > >
> > >
> > > using the variable hotplug just made things confusing,
> > > open-coding will be clearer.
> > >
> > >
> > > >      if_ctx2 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(1))));
> > > >      /* Unknown revision */
> > > > @@ -1449,7 +1451,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> > > >          aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
> > > >          aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
> > > >          aml_append(dev, aml_name_decl("_UID", aml_int(pcmc->pci_root_uid)));
> > > > -        aml_append(dev, build_q35_osc_method());
> > > > +        aml_append(dev, build_q35_osc_method(pm->pcihp_bridge_en));
> > > >          aml_append(sb_scope, dev);
> > > >          if (mcfg_valid) {
> > > >              aml_append(sb_scope, build_q35_dram_controller(&mcfg));
> > >
> > > One of the complaints of libvirt people was that the
> > > name is confusing. It seems to say whether to describe bridges
> > > in ACPI but it also disables native hotplug, but only for PCIe.
> > >
> > > Maybe we should address this with flags saying whether to enable each of
> > > acpi,pcie,shpc hotplug separately...
> >
> > yep, mask with field defines would be better,
> > but I'd hold off such change to post 6.2 time.
> >
> > >
> > > > @@ -1565,7 +1567,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> > > >              if (pci_bus_is_express(bus)) {
> > > >                  aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
> > > >                  aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
> > > > -                aml_append(dev, build_q35_osc_method());
> >
> >
> > > > +                /* Expander bridges do not have ACPI PCI Hot-plug enabled */
> > > > +                aml_append(dev, build_q35_osc_method(false));
> >
> > this's it not obvious, why PXBs aren't capable of ACPI PCI Hot-plug?
> 
> Lack of support from the original patchset.

Hmm. So PXB will keep using native hotplug. Looks like a good reason
to pick up Gerd's patches to fix it up ... 

> > > >              } else {
> > > >                  aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
> > > >              }
> > > > --
> > > > 2.31.1
> > >
> >


