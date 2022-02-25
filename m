Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 137614C4707
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 15:02:21 +0100 (CET)
Received: from localhost ([::1]:51130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNbAn-0007z4-Le
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 09:02:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nNal2-00041W-9N
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 08:35:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nNakw-0004Xt-Ne
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 08:35:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645796133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+fwUMKNC3SWKXSPBWjjQqzd2p0d67sTlcWKKx9gkRpY=;
 b=Iw80sHnIESQQ0KMx9p9DIHOD6iA9V+dnzhp/bgEPCe8WkXwqdaanAKP5OVdU4icqI46Kus
 Aw8IWxuY6QIw9Qij5D5zrXjf6XfNfxORR1J9eJmbu7bk/Pm8d46GJM0VAr4uTNt9JBtAiW
 tq+wQiYWQO1p71dIKq0HNYWnRM+WmG8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-NMC49j6_NLGVVTah7QadMA-1; Fri, 25 Feb 2022 08:35:32 -0500
X-MC-Unique: NMC49j6_NLGVVTah7QadMA-1
Received: by mail-ed1-f70.google.com with SMTP id
 cm27-20020a0564020c9b00b004137effc24bso504912edb.10
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 05:35:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+fwUMKNC3SWKXSPBWjjQqzd2p0d67sTlcWKKx9gkRpY=;
 b=gd9CYvKE7V87jHJzfodOLgId2HgfhlS6jmp13+FoD1eVccEyDhF6wJ6kygSTlrXtBS
 j9x5C8BNJXPw2/L2NzRzlVuHMMVZDVK6eNxkZmjEHmmIV68yNgRccePIDtrHvbo6dcBg
 uPXBX9gQuH4wN0niy6r0cOKTB9w2Hp9nzW7aS9M2mDJipSk6ehJguaaZaeWooiFQkA5c
 zJJv3TgoACCyAwgkUfl5RLbsc/aeqchf8Wt9cKfhiUAHo3h/VWZlEGKox4AwenF2WVgD
 1x4hqesXT/nyzdNzME6KtIxqvLsJMMnHLpnl7FdtYVS82l7Iq8rTNjiBygO0BgvrSu1+
 nChA==
X-Gm-Message-State: AOAM532OkHBUPTErx0aat5gftIly73RnMiWEfBAdo+35XmJDB87uxpv5
 L5t0zfEb/ihFvtRjolEUpM330UyQ+Iir1yrWnw+zL/hle2imC7Fya7wPxebadAknbN5NLmO2/5r
 du+rodRz8pNj4fxs=
X-Received: by 2002:aa7:d999:0:b0:40e:fdf0:38c with SMTP id
 u25-20020aa7d999000000b0040efdf0038cmr7166959eds.419.1645796130890; 
 Fri, 25 Feb 2022 05:35:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzzcTeB8yz16O3/Juj4wmvCJSOhFD0DFb5nzx0BoEILrSSsn35Wa9VnMw4dnavn+0LfBL6Q+Q==
X-Received: by 2002:aa7:d999:0:b0:40e:fdf0:38c with SMTP id
 u25-20020aa7d999000000b0040efdf0038cmr7166941eds.419.1645796130613; 
 Fri, 25 Feb 2022 05:35:30 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 bw26-20020a170906c1da00b006c8aeca8febsm1035171ejb.47.2022.02.25.05.35.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 05:35:29 -0800 (PST)
Date: Fri, 25 Feb 2022 14:35:28 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 2/4] pcie: update slot power status only is power
 control is enabled
Message-ID: <20220225143528.3510dc98@redhat.com>
In-Reply-To: <20220225080628-mutt-send-email-mst@kernel.org>
References: <20220224174411.3296848-1-imammedo@redhat.com>
 <20220224174411.3296848-3-imammedo@redhat.com>
 <20220225101259.begp7wy5o3jlafcf@sirius.home.kraxel.org>
 <20220225140231.16c13306@redhat.com>
 <20220225080628-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Feb 2022 08:08:57 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Fri, Feb 25, 2022 at 02:02:31PM +0100, Igor Mammedov wrote:
> > On Fri, 25 Feb 2022 11:12:59 +0100
> > Gerd Hoffmann <kraxel@redhat.com> wrote:
> >   
> > >   Hi,
> > >   
> > > >    pcie_cap_slot_post_load()    
> > > >        -> pcie_cap_update_power()
> > > >            -> pcie_set_power_device()
> > > >                -> pci_set_power()
> > > >                    -> pci_update_mappings()    
> > >   
> > > > Fix it by honoring PCI_EXP_SLTCAP_PCP and updating power status
> > > > only if capability is enabled.    
> > >   
> > > > diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> > > > index d7d73a31e4..2339729a7c 100644
> > > > --- a/hw/pci/pcie.c
> > > > +++ b/hw/pci/pcie.c
> > > > @@ -383,10 +383,9 @@ static void pcie_cap_update_power(PCIDevice *hotplug_dev)
> > > >  
> > > >      if (sltcap & PCI_EXP_SLTCAP_PCP) {
> > > >          power = (sltctl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_ON;
> > > > +        pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
> > > > +                            pcie_set_power_device, &power);
> > > >      }
> > > > -
> > > > -    pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
> > > > -                        pcie_set_power_device, &power);
> > > >  }    
> > > 
> > > The change makes sense, although I don't see how that changes qemu
> > > behavior.  
> > 
> > looks like I need to fix commit message
> >   
> > > 
> > > 'power' defaults to true, so when SLTCAP_PCP is off it should never
> > > ever try to power off the devices.  And pci_set_power() should figure
> > > the state didn't change and instantly return without touching the
> > > device.  
> > 
> > 
> > SLTCAP_PCP is on by default as well, so empty slot ends up with
> > power disabled PCC state [1]:
> > 
> >   sltctl & SLTCTL_PCC == 0x400
> > 
> > by the time machine is initialized.
> > 
> > Then ACPI pcihp callbacks override native hotplug ones
> > so PCC remains stuck in this state since all power control
> > is out of picture in case of ACPI based hotplug. Guest OS
> > doesn't use/or ignore native PCC.  
> 
> So how about when ACPI pcihp overrides native with its callbacks we also
> set PCC power to on?

with some reworks it should work (i.e. adding an extra knob that will tell
PCI core not to power off when it should, looks fragile and very hacky).
It has the same migration implications as this patch, so I'd rather go
after disabling whole SLTCAP_PCP thing to be correct and keeping PCI
code free from ACPI hacks.

> 
> > 
> > After device hotplug, the device stays in has_power=on default
> > state as pci_qdev_realize() initialized it. [2]
> > 
> > However when migrated SLTCTL_PCC is also migrated, and kick in
> > as described in commit message and turns power off [3]
> >   
> > > 
> > > take care,
> > >   Gerd
> > >   
> > 
> > 1)
> > pci_qdev_realize
> > pci_set_power: extra_root0, d->has_power: 0,  new power state: 1
> > pci_set_power: extra_root0, set has_power to: 1
> > pcie_cap_slot_reset
> > pcie_cap_update_power(extra_root0): sltcap & PCI_EXP_SLTCAP_PCP: 2,  sltctl & SLTCTL_PCC: 400
> > pcie_cap_update_power(extra_root0): updated power: 0  <== has no effect on children since there is none
> > 
> > 2)
> > pci_qdev_realize
> > pci_set_power: nic, d->has_power: 0,  new power state: 1
> > pci_set_power: nic, set has_power to: 1
> > 
> > 
> > 3)
> > pci_qdev_realize
> > pci_set_power: extra_root0, d->has_power: 0,  new power state: 1
> > pci_set_power: extra_root0, set has_power to: 1
> > pci_qdev_realize
> > pci_set_power: nic, d->has_power: 0,  new power state: 1
> > pci_set_power: nic, set has_power to: 1
> > pcie_cap_slot_reset
> > pcie_cap_update_power(extra_root0): sltcap & PCI_EXP_SLTCAP_PCP: 2,  sltctl & SLTCTL_PCC: 0
> > pcie_cap_update_power(extra_root0): updated power: 1
> > pci_set_power: nic, d->has_power: 1,  new power state: 1
> > pcie_cap_slot_post_load(extra_root0)
> > pcie_cap_update_power(extra_root0): sltcap & PCI_EXP_SLTCAP_PCP: 2,  sltctl & SLTCTL_PCC: 400
> > pcie_cap_update_power(extra_root0): updated power: 0
> > pci_set_power: nic, d->has_power: 1,  new power state: 0
> > pci_set_power: nic, set has_power to: 0  
> 


