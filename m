Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA6144E4E1
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 11:52:34 +0100 (CET)
Received: from localhost ([::1]:43476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlUAb-0005tP-Kw
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 05:52:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mlU9m-0005CF-2A
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 05:51:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mlU9g-0004OW-8R
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 05:51:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636714295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8FfOverAgqcG/kkt56CxhjKtOK+TC3sl4Pl1dV5GpbU=;
 b=QjRHFnGfUjBSwEwFK2712f6FQW3QboI43eYpRUWoFkZFdq8+CUvW4RPrHPGvjTSOK/gHxJ
 9IHi5TKfD1q+knyaYdOqtR3LWB50zLIXuh28tnC5hyfErUsoDig9324Xwk0jXqf3IklmCk
 o36hdnEV0fvLjV6lsL9xcT6pvcNYpEw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-t4fSegfIM1-_WxHAW1TyGg-1; Fri, 12 Nov 2021 05:51:31 -0500
X-MC-Unique: t4fSegfIM1-_WxHAW1TyGg-1
Received: by mail-ed1-f70.google.com with SMTP id
 f4-20020a50e084000000b003db585bc274so7875864edl.17
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 02:51:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8FfOverAgqcG/kkt56CxhjKtOK+TC3sl4Pl1dV5GpbU=;
 b=69wd9sVsuT8RWwBE4FT5L7ytdt9oDNo6mnpCYtLKEYVAXJgUttQhYhS4sDrmnlZJNS
 KQLfNxHPYmI7P4Wry/ub647F3zNQM1IwOwHrX6nT5SlwqL7mkcxo4aG86EJgbDeWbWvn
 cfhqRLL8eHWksrOIWHOdN+R6mYe/PzGWWSfEgPK5iqGladcgxuVvj+Bcl+hUs123CGOa
 WrDsgN23oWWyuFEFcXJnnmG2vjSy1zutJipgKY7fKU9+HBjfNjfH011c5K4zhcpUYFZx
 ouJJIFV2AkB9xDfTFAR85QR0hYExn3r46R28Bys2+KBNcZkTC/lbJp5l1vu31ErrATkk
 9tKQ==
X-Gm-Message-State: AOAM532O8PK1kAiCcTrAC362cc3YzRVQMgXu8yFwkhsx3AsPSl9wDd9+
 FE/oH8MbLKkzrB0BfV/wrljTGd4aFMryU8ayA1ezMoUjachecKSIA8X1Vd5mu89NYqZWQvwlqXR
 iGBfGXdoMfpRJr9g=
X-Received: by 2002:a17:906:7ccf:: with SMTP id
 h15mr18397310ejp.386.1636714290538; 
 Fri, 12 Nov 2021 02:51:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzLHbO4KABCe1C6UtM2+PZqsza40ceybloEnw70GorYTN3M6oYrcACReabhYcDGePEmlOPUeA==
X-Received: by 2002:a17:906:7ccf:: with SMTP id
 h15mr18397284ejp.386.1636714290351; 
 Fri, 12 Nov 2021 02:51:30 -0800 (PST)
Received: from localhost ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id cz7sm2835403edb.55.2021.11.12.02.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 02:51:29 -0800 (PST)
Date: Fri, 12 Nov 2021 11:51:28 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH for 6.2 v2 4/5] hw/i386/acpi-build: Deny control on PCIe
 Native Hot-plug in _OSC
Message-ID: <20211112115128.66230040@redhat.com>
In-Reply-To: <alpine.DEB.2.22.394.2111111104320.133428@anisinha-lenovo>
References: <20211110211140.3057199-1-imammedo@redhat.com>
 <20211110211140.3057199-5-imammedo@redhat.com>
 <alpine.DEB.2.22.394.2111111104320.133428@anisinha-lenovo>
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
Cc: mapfelba@redhat.com, kraxel@redhat.com, jusual@redhat.com,
 qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Nov 2021 11:19:30 +0530 (IST)
Ani Sinha <ani@anisinha.ca> wrote:

> On Wed, 10 Nov 2021, Igor Mammedov wrote:
> 
> > From: Julia Suvorova <jusual@redhat.com>
> >
> > There are two ways to enable ACPI PCI Hot-plug:
> >
> >         * Disable the Hot-plug Capable bit on PCIe slots.
> >
> > This was the first approach which led to regression [1-2], as
> > I/O space for a port is allocated only when it is hot-pluggable,
> > which is determined by HPC bit.
> >
> >         * Leave the HPC bit on and disable PCIe Native Hot-plug in _OSC
> >           method.
> >
> > This removes the (future) ability of hot-plugging switches with PCIe
> > Native hotplug since ACPI PCI Hot-plug only works with cold-plugged
> > bridges. If the user wants to explicitely use this feature, they can
> > disable ACPI PCI Hot-plug with:
> >         --global ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off
> >
> > Change the bit in _OSC method so that the OS selects ACPI PCI Hot-plug
> > instead of PCIe Native.
> >
> > [1] https://gitlab.com/qemu-project/qemu/-/issues/641
> > [2] https://bugzilla.redhat.com/show_bug.cgi?id=2006409
> >
> > Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> > v2:
> >   - (mst)
> >       * drop local hotplug var and opencode it
> >       * rename acpi_pcihp parameter to enable_native_pcie_hotplug
> >         to reflect what it actually does
> >
> > tested:
> >   with hotplugging nic into 1 root port with seabios/ovmf/Fedora34
> >   Windows tested only with seabios (using exiting images)
> >   (installer fails to install regardless on bios)
> > ---
> >  hw/i386/acpi-build.c | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > index a3ad6abd33..a99c6e4fe3 100644
> > --- a/hw/i386/acpi-build.c
> > +++ b/hw/i386/acpi-build.c
> > @@ -1337,7 +1337,7 @@ static void build_x86_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr)
> >      aml_append(table, scope);
> >  }
> >
> > -static Aml *build_q35_osc_method(void)
> > +static Aml *build_q35_osc_method(bool enable_native_pcie_hotplug)
> >  {
> >      Aml *if_ctx;
> >      Aml *if_ctx2;
> > @@ -1359,8 +1359,10 @@ static Aml *build_q35_osc_method(void)
> >      /*
> >       * Always allow native PME, AER (no dependencies)
> >       * Allow SHPC (PCI bridges can have SHPC controller)
> > +     * Disable PCIe Native Hot-plug if ACPI PCI Hot-plug is enabled.
> >       */  
> 
> Based on v2, I think its more useful to have this comment where the
> function is called.
I'd leave it as is, which is consistent with other bits described here

> 
> > -    aml_append(if_ctx, aml_and(a_ctrl, aml_int(0x1F), a_ctrl));
> > +    aml_append(if_ctx, aml_and(a_ctrl,
> > +        aml_int(0x1E | (enable_native_pcie_hotplug ? 0x1 : 0x0)), a_ctrl));
> >
> >      if_ctx2 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(1))));
> >      /* Unknown revision */
> > @@ -1449,7 +1451,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> >          aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
> >          aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
> >          aml_append(dev, aml_name_decl("_UID", aml_int(pcmc->pci_root_uid)));
> > -        aml_append(dev, build_q35_osc_method());
> > +        aml_append(dev, build_q35_osc_method(!pm->pcihp_bridge_en));  
> 
> See above. I think it helps to add a comment here saying native hotplug is
> enabled when acpi hotplug is disabled for cold plugged bridges.
> 
> 
> >          aml_append(sb_scope, dev);
> >          if (mcfg_valid) {
> >              aml_append(sb_scope, build_q35_dram_controller(&mcfg));
> > @@ -1565,7 +1567,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> >              if (pci_bus_is_express(bus)) {
> >                  aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
> >                  aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
> > -                aml_append(dev, build_q35_osc_method());
> > +
> > +                /* Expander bridges do not have ACPI PCI Hot-plug enabled */
> > +                aml_append(dev, build_q35_osc_method(true));
> >              } else {
> >                  aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
> >              }
> > --
> > 2.27.0
> >
> >  
> 


