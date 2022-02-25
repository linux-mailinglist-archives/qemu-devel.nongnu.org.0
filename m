Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4094C46C4
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 14:40:56 +0100 (CET)
Received: from localhost ([::1]:35202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNaq6-00045y-Vd
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 08:40:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nNaLP-000534-RK
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 08:09:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nNaLJ-0002rW-9p
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 08:09:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645794543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T7tqo5Zo1/2EwqlDq23dVLi/ZwBawdlYfiQTjefX288=;
 b=iYgJEGtr40un8PhSjdUuP2MweD9CwoEfbHdXnYLhO7w/y2pcp5mVgARujnBnOHwFPUDU3A
 Imejj3p1ZP2CVZTqoOxJKI+hJCZbhngKWYQZyxkzoImq6GWeENKaniEo3R+PFQCsDYNgQs
 XPEbI2LqLjLrbvxcVY/oVLDcPeaRgzg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-bZVhiRaLMDWn5pCgsW4Z5w-1; Fri, 25 Feb 2022 08:09:02 -0500
X-MC-Unique: bZVhiRaLMDWn5pCgsW4Z5w-1
Received: by mail-wr1-f71.google.com with SMTP id
 x15-20020a5d6b4f000000b001ee6c0aa287so885400wrw.9
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 05:09:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=T7tqo5Zo1/2EwqlDq23dVLi/ZwBawdlYfiQTjefX288=;
 b=zuKiM2GUqEJ9UjDi0SvOr83dB/WRSla2RmycEnL2l16aa1k4mBppZsVGoUBInwdfYW
 bRWlBJMHJY3RgmpmX9o3sA3SgS/E0xBuX5yFwUFJaSDRy5BIy6dwpE+PB0x/BZ8kN2Ls
 n+CfI96r3nszz7e8cRPQt5qU5eMcacxZICArpt9rNgHdvJh+FUV182ol6WGH3Fiij+Bu
 OU7p0bAEi4iEyb9ENfyLnTnfWtJIQr1DOhD0XAgOlsixiO+NY2nEfTUwK4PiSlWAb224
 n8DvXdcYMn28Wsw9p5F17qb0nj9KSpGCYix0rf4+7eyUBybYNdR3xvp7Wk/+ADDM9Tdb
 pW1Q==
X-Gm-Message-State: AOAM532HDGhI/oCWE+t0zKXiGSgEKb82k7o2VTdWTxFIuEZ+mDHUml0G
 43vyUaaLzjUyljHn4PZLZFEzUvu4q2hzx/O7lKbHFVK0hnVBCrpU3H81rYRj0jGaAFBR+6RhSed
 vuxMYwWYHQW6VGCg=
X-Received: by 2002:a05:600c:3acc:b0:381:1fae:d1b3 with SMTP id
 d12-20020a05600c3acc00b003811faed1b3mr2649177wms.112.1645794541480; 
 Fri, 25 Feb 2022 05:09:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcgySXKdXJLeMfchQv/GOp7OeZjpT2yVPSjnaOqWxsshgsCJ/hWJKsUr9z6/PPWfbr3PrjpA==
X-Received: by 2002:a05:600c:3acc:b0:381:1fae:d1b3 with SMTP id
 d12-20020a05600c3acc00b003811faed1b3mr2649165wms.112.1645794541183; 
 Fri, 25 Feb 2022 05:09:01 -0800 (PST)
Received: from redhat.com ([2.55.145.157]) by smtp.gmail.com with ESMTPSA id
 f13-20020a05600c4e8d00b0037bc5ce6042sm9793291wmq.27.2022.02.25.05.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 05:09:00 -0800 (PST)
Date: Fri, 25 Feb 2022 08:08:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 2/4] pcie: update slot power status only is power control
 is enabled
Message-ID: <20220225080628-mutt-send-email-mst@kernel.org>
References: <20220224174411.3296848-1-imammedo@redhat.com>
 <20220224174411.3296848-3-imammedo@redhat.com>
 <20220225101259.begp7wy5o3jlafcf@sirius.home.kraxel.org>
 <20220225140231.16c13306@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220225140231.16c13306@redhat.com>
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
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 25, 2022 at 02:02:31PM +0100, Igor Mammedov wrote:
> On Fri, 25 Feb 2022 11:12:59 +0100
> Gerd Hoffmann <kraxel@redhat.com> wrote:
> 
> >   Hi,
> > 
> > >    pcie_cap_slot_post_load()  
> > >        -> pcie_cap_update_power()
> > >            -> pcie_set_power_device()
> > >                -> pci_set_power()
> > >                    -> pci_update_mappings()  
> > 
> > > Fix it by honoring PCI_EXP_SLTCAP_PCP and updating power status
> > > only if capability is enabled.  
> > 
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
> > >  }  
> > 
> > The change makes sense, although I don't see how that changes qemu
> > behavior.
> 
> looks like I need to fix commit message
> 
> > 
> > 'power' defaults to true, so when SLTCAP_PCP is off it should never
> > ever try to power off the devices.  And pci_set_power() should figure
> > the state didn't change and instantly return without touching the
> > device.
> 
> 
> SLTCAP_PCP is on by default as well, so empty slot ends up with
> power disabled PCC state [1]:
> 
>   sltctl & SLTCTL_PCC == 0x400
> 
> by the time machine is initialized.
> 
> Then ACPI pcihp callbacks override native hotplug ones
> so PCC remains stuck in this state since all power control
> is out of picture in case of ACPI based hotplug. Guest OS
> doesn't use/or ignore native PCC.

So how about when ACPI pcihp overrides native with its callbacks we also
set PCC power to on?

> 
> After device hotplug, the device stays in has_power=on default
> state as pci_qdev_realize() initialized it. [2]
> 
> However when migrated SLTCTL_PCC is also migrated, and kick in
> as described in commit message and turns power off [3]
> 
> > 
> > take care,
> >   Gerd
> > 
> 
> 1)
> pci_qdev_realize
> pci_set_power: extra_root0, d->has_power: 0,  new power state: 1
> pci_set_power: extra_root0, set has_power to: 1
> pcie_cap_slot_reset
> pcie_cap_update_power(extra_root0): sltcap & PCI_EXP_SLTCAP_PCP: 2,  sltctl & SLTCTL_PCC: 400
> pcie_cap_update_power(extra_root0): updated power: 0  <== has no effect on children since there is none
> 
> 2)
> pci_qdev_realize
> pci_set_power: nic, d->has_power: 0,  new power state: 1
> pci_set_power: nic, set has_power to: 1
> 
> 
> 3)
> pci_qdev_realize
> pci_set_power: extra_root0, d->has_power: 0,  new power state: 1
> pci_set_power: extra_root0, set has_power to: 1
> pci_qdev_realize
> pci_set_power: nic, d->has_power: 0,  new power state: 1
> pci_set_power: nic, set has_power to: 1
> pcie_cap_slot_reset
> pcie_cap_update_power(extra_root0): sltcap & PCI_EXP_SLTCAP_PCP: 2,  sltctl & SLTCTL_PCC: 0
> pcie_cap_update_power(extra_root0): updated power: 1
> pci_set_power: nic, d->has_power: 1,  new power state: 1
> pcie_cap_slot_post_load(extra_root0)
> pcie_cap_update_power(extra_root0): sltcap & PCI_EXP_SLTCAP_PCP: 2,  sltctl & SLTCTL_PCC: 400
> pcie_cap_update_power(extra_root0): updated power: 0
> pci_set_power: nic, d->has_power: 1,  new power state: 0
> pci_set_power: nic, set has_power to: 0


