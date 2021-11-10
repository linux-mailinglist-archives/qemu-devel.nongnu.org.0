Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9C844C2B1
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 15:03:59 +0100 (CET)
Received: from localhost ([::1]:40186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkoCj-0001K2-Up
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 09:03:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mko76-0001km-3D
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 08:58:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mko73-0007Rp-Op
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 08:58:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636552685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rlklEYnq5aXOWPWC24ZVE+J2xncWIZY0bymgCLCCRTk=;
 b=Pv3euuSzjwhqEvHZMi8FU57pqdWI9I2UzWpPXFxE/QgUtib4cecv49gKo7XEYHwD9x+SUI
 kYFGJFO2c9/9YFUjDl1pvtW5S/zDil83N9MGq6zfB1lTsuS2oFhaW07kFUW0S3e8Rh1SBf
 FO8Gm/bzV6CYjSnz9dAMbSreGe1FexA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-uJGM_vEYM5i8nCtcbSyZ_Q-1; Wed, 10 Nov 2021 08:58:03 -0500
X-MC-Unique: uJGM_vEYM5i8nCtcbSyZ_Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 g80-20020a1c2053000000b003331a764709so3146638wmg.2
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 05:58:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rlklEYnq5aXOWPWC24ZVE+J2xncWIZY0bymgCLCCRTk=;
 b=Z5emQxeBIcPJeOofpKXumEHxerQiV6PyuEW4WI7zIf7EgJPbh6TLTf4ZUA+nNiXRRH
 figt2MW+wuKAWboqh1ukgmBWnjlIc+LNTHyDj+zGIKPc8KvAD5TtqjTCoNwcbup3I03F
 W7xm5aRYrdAnpONJnhUKxZseVwjdXlorSmXSglz1c4p996eP6kWKWm2lbZR70g5/AjxU
 zt6XJF1ZizsXFD25C0ftsWf5Fm6t645rZQxa7LJ33+AYjVoH5z5LMPgmzKuD1nX3FqrS
 NR0K+R1yTG8ffiGnlClZ7lIbJFJK7HOOp2bzfPQu/YekrEZL0bghXAhRjHC+TxvZlyyV
 yoCg==
X-Gm-Message-State: AOAM533gz9Dz2qrKZpkRcXCxXx+gFY/O09NDdWPc0ooBxUb1CVyXawtY
 iYjWNvwFLy5m4F2OJRDyMjGHgyH5JEPW11PjhucVPLi4cbmpAhFeEf2ecEcAAiP9vJXmSjSX9iF
 Lf4aO0Fx3v3iMXgE=
X-Received: by 2002:a5d:69ce:: with SMTP id s14mr19684881wrw.25.1636552682594; 
 Wed, 10 Nov 2021 05:58:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyY0PfDKuExVMSeZ7lphA6ZW2CZuHu76jnggbKdOeea7fPGewVBVN4Zb4f86fGK2Ptm0wjCAQ==
X-Received: by 2002:a5d:69ce:: with SMTP id s14mr19684852wrw.25.1636552682349; 
 Wed, 10 Nov 2021 05:58:02 -0800 (PST)
Received: from localhost ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id u2sm22117867wrr.35.2021.11.10.05.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 05:58:01 -0800 (PST)
Date: Wed, 10 Nov 2021 14:57:59 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 4/5] hw/i386/acpi-build: Deny control on PCIe Native
 Hot-plug in _OSC
Message-ID: <20211110145759.6570170e@redhat.com>
In-Reply-To: <20211110011557-mutt-send-email-mst@kernel.org>
References: <20211110053014.489591-1-jusual@redhat.com>
 <20211110053014.489591-5-jusual@redhat.com>
 <20211110011557-mutt-send-email-mst@kernel.org>
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
Cc: Ani Sinha <ani@anisinha.ca>, Marcel Apfelbaum <mapfelba@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 10 Nov 2021 02:21:34 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Wed, Nov 10, 2021 at 06:30:13AM +0100, Julia Suvorova wrote:
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
> > ---
> >  hw/i386/acpi-build.c | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> > 
> > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > index a3ad6abd33..a2f92ab32b 100644
> > --- a/hw/i386/acpi-build.c
> > +++ b/hw/i386/acpi-build.c
> > @@ -1337,7 +1337,7 @@ static void build_x86_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr)
> >      aml_append(table, scope);
> >  }
> >  
> > -static Aml *build_q35_osc_method(void)
> > +static Aml *build_q35_osc_method(bool acpi_pcihp)
> >  {
> >      Aml *if_ctx;
> >      Aml *if_ctx2;
> > @@ -1345,6 +1345,7 @@ static Aml *build_q35_osc_method(void)
> >      Aml *method;
> >      Aml *a_cwd1 = aml_name("CDW1");
> >      Aml *a_ctrl = aml_local(0);
> > +    const uint64_t hotplug = acpi_pcihp ? 0x1E : 0x1F;  
> 
> drop this variable and open-code at use point below.
> As it is the comment is misplaced.
> Also a slightly better way to write this:
> 0x1E | (acpi_pcihp ? 0x0 : 0x1)
> 
> 
> 
> >  
> >      method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
> >      aml_append(method, aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));  
> 
> So what acpi_pcihp does is enable/disable native pcie hotplug.
> How about we call the option exactly that?
> 
> 
> > @@ -1359,8 +1360,9 @@ static Aml *build_q35_osc_method(void)
> >      /*
> >       * Always allow native PME, AER (no dependencies)
> >       * Allow SHPC (PCI bridges can have SHPC controller)
> > +     * Disable PCIe Native Hot-plug if ACPI PCI Hot-plug is enabled.
> >       */
> > -    aml_append(if_ctx, aml_and(a_ctrl, aml_int(0x1F), a_ctrl));
> > +    aml_append(if_ctx, aml_and(a_ctrl, aml_int(hotplug), a_ctrl));
> >    
> 
> using the variable hotplug just made things confusing,
> open-coding will be clearer.
> 
> 
> >      if_ctx2 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(1))));
> >      /* Unknown revision */
> > @@ -1449,7 +1451,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> >          aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
> >          aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
> >          aml_append(dev, aml_name_decl("_UID", aml_int(pcmc->pci_root_uid)));
> > -        aml_append(dev, build_q35_osc_method());
> > +        aml_append(dev, build_q35_osc_method(pm->pcihp_bridge_en));
> >          aml_append(sb_scope, dev);
> >          if (mcfg_valid) {
> >              aml_append(sb_scope, build_q35_dram_controller(&mcfg));  
> 
> One of the complaints of libvirt people was that the
> name is confusing. It seems to say whether to describe bridges
> in ACPI but it also disables native hotplug, but only for PCIe.
> 
> Maybe we should address this with flags saying whether to enable each of
> acpi,pcie,shpc hotplug separately...

yep, mask with field defines would be better,
but I'd hold off such change to post 6.2 time.
 
> 
> > @@ -1565,7 +1567,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> >              if (pci_bus_is_express(bus)) {
> >                  aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
> >                  aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
> > -                aml_append(dev, build_q35_osc_method());


> > +                /* Expander bridges do not have ACPI PCI Hot-plug enabled */
> > +                aml_append(dev, build_q35_osc_method(false));

this's it not obvious, why PXBs aren't capable of ACPI PCI Hot-plug?

> >              } else {
> >                  aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
> >              }
> > -- 
> > 2.31.1  
> 


