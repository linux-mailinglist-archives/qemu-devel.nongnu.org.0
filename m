Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5D54C4999
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 16:51:18 +0100 (CET)
Received: from localhost ([::1]:33930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNcsH-0006jE-F6
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 10:51:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nNcgr-0004hI-Cn
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 10:39:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nNcgm-00008H-Ni
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 10:39:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645803563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=udROPMp/CwWexCxMk3un6vYAJpDii8Zhi6Qiis4PHQ4=;
 b=H6804mJ/ANjO52XtPTYRbJzhbBR5sf8xtOzE4EhR10GO9Ug9jU9wuK895sL8kJMJHXNiBl
 kF+GImRKZBAI0JF9nRXdtbieuRmBOBX49egg/cLVpgizdwsO3Q96QjIpRphTZul9Ar0PxX
 XA89Y1k0wzabWPG3a0A1XUSbOaPupHo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-m2TnoACOPnuhoKUMoNFU3g-1; Fri, 25 Feb 2022 10:39:20 -0500
X-MC-Unique: m2TnoACOPnuhoKUMoNFU3g-1
Received: by mail-ed1-f70.google.com with SMTP id
 bq19-20020a056402215300b0040f276105a4so2500417edb.2
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 07:39:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=udROPMp/CwWexCxMk3un6vYAJpDii8Zhi6Qiis4PHQ4=;
 b=VJI5HQlxXa880g9EXLtDCKhNxgVH8vFlYBcE7AMNQGBJXpYhhaUnuWxA5BqfA2D1dj
 eI0E3fWReinRtL9z2fk4bj1jRLv9V7zDG/2iKZsmpa3WSmeLHo5VaW4OoY4M+ExUqMPi
 FMwQgaU9sMrUV+Vlx3yuzD69WwrDJbfLvaGKSJCLvw0ZIGhtQTjlctpI3erLNn7QQ5Zi
 cuRf4d93/FuszSHawn4jQgDq5KXpNd2MH7jdzbZyiNuPyJy9eVIBYNOwSxFKq/Mp2UXR
 4NRJIpJ6JNFJvyW5eawt5EZUnz1a/yuD2NP60qVMxP5BI3xSADz6F4/rkhART9ZmSPeK
 xveQ==
X-Gm-Message-State: AOAM532oHlOWJ6kk2RPv86zg5EouNu4QQvKTbK/9EIksso6ZT16MPAwk
 hb1xA8Nb8MQfA10MIXRJtRCm+okUm02C6Wwd3nAe3xsKVPfHQeQWXtK0SLuX4BRzTrZ7yGxvHyI
 vN8c4fktAKuNx0Pw=
X-Received: by 2002:a05:6402:3549:b0:412:b31c:5509 with SMTP id
 f9-20020a056402354900b00412b31c5509mr7836426edd.224.1645803559350; 
 Fri, 25 Feb 2022 07:39:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmL3GiZS8cy9wn8xsZluF8ayhi4dhB3g8nMcMtC0Av4+O8r1UBukQxPPvya7htKjAGVpyt0A==
X-Received: by 2002:a05:6402:3549:b0:412:b31c:5509 with SMTP id
 f9-20020a056402354900b00412b31c5509mr7836404edd.224.1645803559070; 
 Fri, 25 Feb 2022 07:39:19 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 gj7-20020a170907740700b006cf57a6648esm1111549ejc.90.2022.02.25.07.39.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 07:39:18 -0800 (PST)
Date: Fri, 25 Feb 2022 16:39:17 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 2/4] pcie: update slot power status only is power
 control is enabled
Message-ID: <20220225163917.7519454f@redhat.com>
In-Reply-To: <20220225084140-mutt-send-email-mst@kernel.org>
References: <20220224174411.3296848-1-imammedo@redhat.com>
 <20220224174411.3296848-3-imammedo@redhat.com>
 <20220225101259.begp7wy5o3jlafcf@sirius.home.kraxel.org>
 <20220225140231.16c13306@redhat.com>
 <20220225080628-mutt-send-email-mst@kernel.org>
 <20220225143528.3510dc98@redhat.com>
 <20220225084140-mutt-send-email-mst@kernel.org>
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

On Fri, 25 Feb 2022 08:48:13 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Fri, Feb 25, 2022 at 02:35:28PM +0100, Igor Mammedov wrote:
> > On Fri, 25 Feb 2022 08:08:57 -0500
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >   
> > > On Fri, Feb 25, 2022 at 02:02:31PM +0100, Igor Mammedov wrote:  
> > > > On Fri, 25 Feb 2022 11:12:59 +0100
> > > > Gerd Hoffmann <kraxel@redhat.com> wrote:
> > > >     
> > > > >   Hi,
> > > > >     
> > > > > >    pcie_cap_slot_post_load()      
> > > > > >        -> pcie_cap_update_power()
> > > > > >            -> pcie_set_power_device()
> > > > > >                -> pci_set_power()
> > > > > >                    -> pci_update_mappings()      
> > > > >     
> > > > > > Fix it by honoring PCI_EXP_SLTCAP_PCP and updating power status
> > > > > > only if capability is enabled.      
> > > > >     
> > > > > > diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> > > > > > index d7d73a31e4..2339729a7c 100644
> > > > > > --- a/hw/pci/pcie.c
> > > > > > +++ b/hw/pci/pcie.c
> > > > > > @@ -383,10 +383,9 @@ static void pcie_cap_update_power(PCIDevice *hotplug_dev)
> > > > > >  
> > > > > >      if (sltcap & PCI_EXP_SLTCAP_PCP) {
> > > > > >          power = (sltctl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_ON;
> > > > > > +        pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
> > > > > > +                            pcie_set_power_device, &power);
> > > > > >      }
> > > > > > -
> > > > > > -    pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
> > > > > > -                        pcie_set_power_device, &power);
> > > > > >  }      
> > > > > 
> > > > > The change makes sense, although I don't see how that changes qemu
> > > > > behavior.    
> > > > 
> > > > looks like I need to fix commit message
> > > >     
> > > > > 
> > > > > 'power' defaults to true, so when SLTCAP_PCP is off it should never
> > > > > ever try to power off the devices.  And pci_set_power() should figure
> > > > > the state didn't change and instantly return without touching the
> > > > > device.    
> > > > 
> > > > 
> > > > SLTCAP_PCP is on by default as well, so empty slot ends up with
> > > > power disabled PCC state [1]:
> > > > 
> > > >   sltctl & SLTCTL_PCC == 0x400
> > > > 
> > > > by the time machine is initialized.
> > > > 
> > > > Then ACPI pcihp callbacks override native hotplug ones
> > > > so PCC remains stuck in this state since all power control
> > > > is out of picture in case of ACPI based hotplug. Guest OS
> > > > doesn't use/or ignore native PCC.    
> > > 
> > > So how about when ACPI pcihp overrides native with its callbacks we also
> > > set PCC power to on?  
> > 
> > with some reworks it should work (i.e. adding an extra knob that will tell
> > PCI core not to power off when it should, looks fragile and very hacky).
> > It has the same migration implications as this patch, so I'd rather go
> > after disabling whole SLTCAP_PCP thing to be correct and keeping PCI
> > code free from ACPI hacks.  
> 
> Hmm I don't get it.  I literally mean this:

I was thinking about the time when we do override native callbacks.
which happens for every root port at its realize time. Start up sequence on src:

acpi_pcihp_device_pre_plug_cb(dev: extra_root0)                     
pci_qdev_realize(extra_root0)
pci_set_power: extra_root0, d->has_power: 0,  new power state: 1
pci_set_power: extra_root0, set has_power to: 1

acpi_pcihp_device_plug_cb(dev: extra_root0)    <== lets assume we call pcie_cap_enable_power(dev) here
                                                   it's all good wrt layering as we are rewiring being
                                                   initialized root port to another hp controller from
                                                   context of its parent device

pcie_cap_slot_reset        <== then here we hit "if (populated) {} else {}"
                               which kills whatever above has done since slot is not populated
                               and a knob would be needed to prevent reset
                               (i.e. don't touch power state as it's 'managed' by ACPI)

   pcie_cap_update_power(extra_root0): sltcap & PCI_EXP_SLTCAP_PCP: 2,  sltctl & SLTCTL_PCC: 400
   pcie_cap_update_power(extra_root0): updated power: 0


Though I haven't thought about end-device hotplug time:

(qemu) device_add e1000e,bus=extra_root0,id=nic
acpi_pcihp_device_pre_plug_cb(dev: nic)
pci_qdev_realize(nic)
pci_set_power: nic, d->has_power: 0,  new power state: 1
pci_set_power: nic, set has_power to: 1
acpi_pcihp_device_plug_cb(dev: nic)                         <== here we have a chance to power on
                                                                no longer empty slot pcie_cap_enable_power(hotplug_dev)
                                                                then when target loads state it will see SLTCTL_PCC: 0
                                                                and keep slot powered on.
pci_set_power: nic, d->has_power: 1,  new power state: 1

This where I wasn't comfortable with idea of calling random PCIe code
chunks and thought about chaining callbacks so that
pcie_cap_slot_[pre_]plug_cb() would do necessary PCIe steps
and acpi_pcihp_device_[pre_]plug_cb() do ACPI specific things not
intruding on each other, but that requires telling PCIe code that
it should not issue native hotplug event to guest.


> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> index d7d73a31e4..72de72ce7a 100644
> --- a/hw/pci/pcie.c
> +++ b/hw/pci/pcie.c
> @@ -389,6 +389,17 @@ static void pcie_cap_update_power(PCIDevice *hotplug_dev)
>                          pcie_set_power_device, &power);
>  }
>  
> +void pcie_cap_enable_power(PCIDevice *hotplug_dev)
> +{
> +    uint8_t *exp_cap = hotplug_dev->config + hotplug_dev->exp.exp_cap;
> +    uint32_t sltcap = pci_get_long(exp_cap + PCI_EXP_SLTCAP);
> +
> +    if (sltcap & PCI_EXP_SLTCAP_PCP) {
> +        pci_set_word_by_mask(exp_cap + PCI_EXP_SLTCTL,
> +                             PCI_EXP_SLTCTL_PCC, PCI_EXP_SLTCTL_PWR_ON);
> +    }
> +}
> +
>  /*
>   * A PCI Express Hot-Plug Event has occurred, so update slot status register
>   * and notify OS of the event if necessary.
> 
> Then call this from ACPI.  How would this have any migration
> implications at all?  And why do we need a knob not to power off then?
> Power will just stay on since there's nothing turning it off.

It still changes pci_config, the similar to disabling SLTCAP_PCP,
so I think we still need migration compat knob to have the same
device state in cross version migration case.


