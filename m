Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AACD94C42B6
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 11:48:44 +0100 (CET)
Received: from localhost ([::1]:39208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNY9T-0002nD-8r
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 05:48:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nNXGL-0002wV-Sl
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 04:51:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nNXG5-0004Ye-TQ
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 04:51:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645782688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AGwlkfbCkZUlAPqyRXWAgTo8EXYtPFNRnBtNgEPyVn0=;
 b=APiTZXDIvc2eg6tbPoxSnvz9ZSWBlIRKbKEsBnauH9QfZulWFH/7HPZFJyS+ZKoZwRieng
 UZXaBPhd3qnkUqEU97fXEWw37FTPi9VokhwwYn3/c363wkiNJv43zvT/jIKB8ePiGk+wTo
 6VU4upCdMjavvuJdNVcL+F8AXyDHr0I=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-kpjv_hRcO-aVQME5UzSlcA-1; Fri, 25 Feb 2022 04:51:26 -0500
X-MC-Unique: kpjv_hRcO-aVQME5UzSlcA-1
Received: by mail-wr1-f71.google.com with SMTP id
 p9-20020adf9589000000b001e333885ac1so691701wrp.10
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 01:51:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AGwlkfbCkZUlAPqyRXWAgTo8EXYtPFNRnBtNgEPyVn0=;
 b=4CcTFoxIliSQaPALHCXMMtJDTmDKaxE3VHmQ7vgx0vju5oklXmHrbfC2bOePEAjIoh
 k3GYqQh31gE6bDqMaK4RwsZHPICypiszpBjgdc8bGbnzsOvfIu7g7sDju+YPzZ9pAzCB
 TaFmMAUL+70a8l/8AVZh+s7quwFvRqEDLmQGQUe3292e7e1/D/aRowtmQ60jzqFqUaF9
 TWVVMr1sZ5wHSTfh995iuCGoYlbt9lyWGV8pokg4B1Mx2wrx4gxdlp5Eu0XhLznoKR4c
 GR43zdhS1YijMWZyAebsrjujGFKok3Iens7AUB7MS0QTOIGENFyJ7nBvZgIm5NlQSN3k
 a34g==
X-Gm-Message-State: AOAM532w9QHV4MpVwSLAmhz/oTvzNTSorN2ia4xz+wC/YpdwyJnKHt8F
 zQGj1Ang1hD95xTUFeHu8QKhC2X8srayGRShVJIezR8OwDW9mJdWHbqHcgRKOb7De4CLcFHT98N
 vFfoTc3/RbQbp71c=
X-Received: by 2002:adf:d089:0:b0:1ed:9e86:2144 with SMTP id
 y9-20020adfd089000000b001ed9e862144mr5333430wrh.363.1645782685170; 
 Fri, 25 Feb 2022 01:51:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzz+V8+rjmCymbSHtxSjdVDGYA3T2Z0fGlJwPO2B35rcsKJTTaoGvlhzpb9gmWchsWNIXKzrg==
X-Received: by 2002:adf:d089:0:b0:1ed:9e86:2144 with SMTP id
 y9-20020adfd089000000b001ed9e862144mr5333413wrh.363.1645782684822; 
 Fri, 25 Feb 2022 01:51:24 -0800 (PST)
Received: from redhat.com ([2.55.145.157]) by smtp.gmail.com with ESMTPSA id
 11-20020a05600c26cb00b0037ff53511f2sm4988249wmv.31.2022.02.25.01.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 01:51:24 -0800 (PST)
Date: Fri, 25 Feb 2022 04:51:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 2/4] pcie: update slot power status only is power control
 is enabled
Message-ID: <20220225044907-mutt-send-email-mst@kernel.org>
References: <20220224174411.3296848-1-imammedo@redhat.com>
 <20220224174411.3296848-3-imammedo@redhat.com>
 <20220224125928-mutt-send-email-mst@kernel.org>
 <20220225091830.2f684997@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220225091830.2f684997@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 25, 2022 at 09:18:30AM +0100, Igor Mammedov wrote:
> On Thu, 24 Feb 2022 13:05:07 -0500
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Thu, Feb 24, 2022 at 12:44:09PM -0500, Igor Mammedov wrote:
> > > on creation a PCIDevice has power turned on at the end of pci_qdev_realize()
> > > however later on if PCIe slot isn't populated with any children
> > > it's power is turned off. It's fine if native hotplug is used
> > > as plug callback will power slot on among other things.
> > > However when ACPI hotplug is enabled it replaces native PCIe plug
> > > callbacks with ACPI specific ones (acpi_pcihp_device_*plug_cb) and
> > > as result slot stays powered off. It works fine as ACPI hotplug
> > > on guest side takes care of enumerating/initializing hotplugged
> > > device. But when later guest is migrated, call chain introduced by [1]
> > > 
> > >    pcie_cap_slot_post_load()  
> > >        -> pcie_cap_update_power()
> > >            -> pcie_set_power_device()
> > >                -> pci_set_power()
> > >                    -> pci_update_mappings()  
> > > 
> > > will disable earlier initialized BARs for the hotplugged device
> > > in powered off slot due to commit [2] which disables BARs if
> > > power is off. As result guest OS after migration will be very
> > > much confused [3], still thinking that it has working device,
> > > which isn't true anymore due to disabled BARs.
> > > 
> > > Fix it by honoring PCI_EXP_SLTCAP_PCP and updating power status
> > > only if capability is enabled. Follow up patch will disable
> > > PCI_EXP_SLTCAP_PCP overriding COMPAT_PROP_PCP property when
> > > PCIe slot is under ACPI PCI hotplug control.
> > > 
> > > See [3] for reproducer.
> > > 
> > > 1)
> > > Fixes: commit d5daff7d312 (pcie: implement slot power control for pcie root ports)
> > > 2)
> > >        commit 23786d13441 (pci: implement power state)
> > > 3)
> > > Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=2053584
> > >   
> > 
> > 
> > Correct format for the last paragraph:
> > 
> > 
> > Fixes: d5daff7d312 ("pcie: implement slot power control for pcie root ports")
> > Fixes: 23786d13441 ("pci: implement power state")
> > Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=2053584
> 
> ok, will fix it up on respin like this to have references:
> 
> 1)
> Fixes: d5daff7d312 ("pcie: implement slot power control for pcie root ports")
> 2)
> Fixes: 23786d13441 ("pci: implement power state")
> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=2053584

Just drop references, a bit of duplication is not a problem.  E.g.

in powered off slot due to commit 23786d13441 ("pci: implement power state") which disables BARs if

Trailer tags belong in a group at the end with no interruptions, not all
tools handle them otherwise.


> > 
> > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > > ---
> > >  hw/pci/pcie.c | 5 ++---
> > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> > > index d7d73a31e4..2339729a7c 100644
> > > --- a/hw/pci/pcie.c
> > > +++ b/hw/pci/pcie.c
> > > @@ -383,10 +383,9 @@ static void pcie_cap_update_power(PCIDevice *hotplug_dev)
> > >  
> > >      if (sltcap & PCI_EXP_SLTCAP_PCP) {
> > >          power = (sltctl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_ON;
> > > +        pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
> > > +                            pcie_set_power_device, &power);
> > >      }
> > > -
> > > -    pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
> > > -                        pcie_set_power_device, &power);  
> > 
> > I think this is correct. However, I wonder whether for 6.2 compatiblity
> > as a hack we should sometimes skip the power update even when
> > PCI_EXP_SLTCAP_PCP exists. Will that not work around the issue for
> > these machine types?
> 
> pc-q35-6.2 is broken utterly.
> With pc-q35-6.1, it's a mess. Here is a ping-pong migration matrix for it
>             
>       v6.1   |  v6.2   | Fix
> v6.1   ok    | broken  | ok (#1)
> v6.2         | broken  | broken (#2)
> 
> [1] has PCI_EXP_SLTCAP_PCP due to x-pcihp-enable-pcie-pcp-cap=on
>     i.e. pci_config is exactly the same as in qemu-v6.1
> [2] PCI_EXP_SLTCAP_PCP is enabled + empty slot is powered off
>     (+ state is migrated)
> 
> there are some invariants that might work in one direction,
> but it won't survive ping-pong migration. And more importantly
> for upstream we care mostly care for old -> new working,
> and it's direction that is broken in v6.2.
> 
> > And assuming we want bug for bug compat anyway, why not just put
> > it here? It seems easier to reason about frankly ...
> 
> It should be possible hack PCI core to fixup broken power state
> on incoming migration at (at postload time), but that would just
> create more confusion, where in some cases migration would work
> and in some would not (depending on used qemu versions).
> 
> Lets just declare v6.2 qemu broken, with upgrade/downgrade to
> (7.0/6.1) as suggested solution.
> 
> PS:
> I'd very much prefer avoid adding hacks for ACPI pcihp sake to
> PCI core, and let PCI code behave as it's supposed to per spec.
> It's already bad enough with pcihp layered on top of PCI,
> making PCI code depend on pcihp will just make it more fragile.
>  
> > >  }
> > >  
> > >  /*
> > > -- 
> > > 2.31.1  
> > 


