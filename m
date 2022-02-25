Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D10884C474C
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 15:19:06 +0100 (CET)
Received: from localhost ([::1]:48730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNbR3-0001af-FP
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 09:19:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nNaxy-0002qF-CX
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 08:49:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nNaxu-0003Wa-2s
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 08:49:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645796933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wBlQCLORiZGaVGU7jKvera87mDRNCfKWSeVnym9Ju0Q=;
 b=QLZm6ZZVu2WvqPaNgWTB1n4/I7b1fVxFdiMzERU86mvP5H6fmUC1GJzohjXXt2bLDAUVFn
 tpb97zGABuDTy+gQCJYR1Kx1ENV3ttKoJ9UukPEYeaY6zoPozC/asT14evMWtZIZLxHYnF
 UrXs0twna8vEHOfS6S0plYSB4M5pP5c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-lczKLMfZNmWGQQJs7Bjx_w-1; Fri, 25 Feb 2022 08:48:51 -0500
X-MC-Unique: lczKLMfZNmWGQQJs7Bjx_w-1
Received: by mail-wr1-f71.google.com with SMTP id
 j8-20020adfc688000000b001e3322ced69so916977wrg.13
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 05:48:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wBlQCLORiZGaVGU7jKvera87mDRNCfKWSeVnym9Ju0Q=;
 b=yHiiG0ZLbQJ9JuQ4+SZfL9rTrzvQs4YuwFUV6VxpqcSpPi3r/PRanZEnnvPaobRajb
 td/9hih6ttbTnxUCS8lZB35wXoAF/lYA/RKIyE+/X3NQAr2+3Tt1hOk+dR2J5ezXqJPx
 nTE6+8J727/VjvIcJGqHQnuYYlihgJY07c9zmZVbD6bBifXs6xOxq9pmHv9wPAkSE7XM
 gSp/CmRR/P9Pqm6Ja3gGmJPoct8UglJfgfDzFfBCWtzMGrJQVDx4QWbnBPMOk+ikzVar
 BYwaFQrAWgId7kQuWx56gD0girQYFFqH9TUnSmLoDjsKKoqCenmOgKKqy2Rk4dCo5NcA
 GGVw==
X-Gm-Message-State: AOAM530Rt22WtcWl/pT1oa4RH2b5ZPmzmjHpQr+lfZRvKCdjJaNyLYvE
 sDT5i9ecB6U1Xuj+o3bSvgV5URjx3NjvelsKsJ23zZ1pEVPTTyip9pA0Srz9NUu9Jo018Dq4R7F
 rU+HY0xnD04Osl70=
X-Received: by 2002:a05:6000:12ca:b0:1ed:fdb8:b4e9 with SMTP id
 l10-20020a05600012ca00b001edfdb8b4e9mr5627347wrx.258.1645796930074; 
 Fri, 25 Feb 2022 05:48:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzct2kpRYn5MmyBAaWi6b9fzyOdanliJRPOprxEA8YwsA0etrbIJ89rLemBiP7MpD+JSuzLtQ==
X-Received: by 2002:a05:6000:12ca:b0:1ed:fdb8:b4e9 with SMTP id
 l10-20020a05600012ca00b001edfdb8b4e9mr5627333wrx.258.1645796929836; 
 Fri, 25 Feb 2022 05:48:49 -0800 (PST)
Received: from redhat.com ([2.55.165.55]) by smtp.gmail.com with ESMTPSA id
 u14-20020adfed4e000000b001e3323611e5sm2435050wro.26.2022.02.25.05.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 05:48:33 -0800 (PST)
Date: Fri, 25 Feb 2022 08:48:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 2/4] pcie: update slot power status only is power control
 is enabled
Message-ID: <20220225084140-mutt-send-email-mst@kernel.org>
References: <20220224174411.3296848-1-imammedo@redhat.com>
 <20220224174411.3296848-3-imammedo@redhat.com>
 <20220225101259.begp7wy5o3jlafcf@sirius.home.kraxel.org>
 <20220225140231.16c13306@redhat.com>
 <20220225080628-mutt-send-email-mst@kernel.org>
 <20220225143528.3510dc98@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220225143528.3510dc98@redhat.com>
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 25, 2022 at 02:35:28PM +0100, Igor Mammedov wrote:
> On Fri, 25 Feb 2022 08:08:57 -0500
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Fri, Feb 25, 2022 at 02:02:31PM +0100, Igor Mammedov wrote:
> > > On Fri, 25 Feb 2022 11:12:59 +0100
> > > Gerd Hoffmann <kraxel@redhat.com> wrote:
> > >   
> > > >   Hi,
> > > >   
> > > > >    pcie_cap_slot_post_load()    
> > > > >        -> pcie_cap_update_power()
> > > > >            -> pcie_set_power_device()
> > > > >                -> pci_set_power()
> > > > >                    -> pci_update_mappings()    
> > > >   
> > > > > Fix it by honoring PCI_EXP_SLTCAP_PCP and updating power status
> > > > > only if capability is enabled.    
> > > >   
> > > > > diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> > > > > index d7d73a31e4..2339729a7c 100644
> > > > > --- a/hw/pci/pcie.c
> > > > > +++ b/hw/pci/pcie.c
> > > > > @@ -383,10 +383,9 @@ static void pcie_cap_update_power(PCIDevice *hotplug_dev)
> > > > >  
> > > > >      if (sltcap & PCI_EXP_SLTCAP_PCP) {
> > > > >          power = (sltctl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_ON;
> > > > > +        pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
> > > > > +                            pcie_set_power_device, &power);
> > > > >      }
> > > > > -
> > > > > -    pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
> > > > > -                        pcie_set_power_device, &power);
> > > > >  }    
> > > > 
> > > > The change makes sense, although I don't see how that changes qemu
> > > > behavior.  
> > > 
> > > looks like I need to fix commit message
> > >   
> > > > 
> > > > 'power' defaults to true, so when SLTCAP_PCP is off it should never
> > > > ever try to power off the devices.  And pci_set_power() should figure
> > > > the state didn't change and instantly return without touching the
> > > > device.  
> > > 
> > > 
> > > SLTCAP_PCP is on by default as well, so empty slot ends up with
> > > power disabled PCC state [1]:
> > > 
> > >   sltctl & SLTCTL_PCC == 0x400
> > > 
> > > by the time machine is initialized.
> > > 
> > > Then ACPI pcihp callbacks override native hotplug ones
> > > so PCC remains stuck in this state since all power control
> > > is out of picture in case of ACPI based hotplug. Guest OS
> > > doesn't use/or ignore native PCC.  
> > 
> > So how about when ACPI pcihp overrides native with its callbacks we also
> > set PCC power to on?
> 
> with some reworks it should work (i.e. adding an extra knob that will tell
> PCI core not to power off when it should, looks fragile and very hacky).
> It has the same migration implications as this patch, so I'd rather go
> after disabling whole SLTCAP_PCP thing to be correct and keeping PCI
> code free from ACPI hacks.

Hmm I don't get it.  I literally mean this:


diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index d7d73a31e4..72de72ce7a 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -389,6 +389,17 @@ static void pcie_cap_update_power(PCIDevice *hotplug_dev)
                         pcie_set_power_device, &power);
 }
 
+void pcie_cap_enable_power(PCIDevice *hotplug_dev)
+{
+    uint8_t *exp_cap = hotplug_dev->config + hotplug_dev->exp.exp_cap;
+    uint32_t sltcap = pci_get_long(exp_cap + PCI_EXP_SLTCAP);
+
+    if (sltcap & PCI_EXP_SLTCAP_PCP) {
+        pci_set_word_by_mask(exp_cap + PCI_EXP_SLTCTL,
+                             PCI_EXP_SLTCTL_PCC, PCI_EXP_SLTCTL_PWR_ON);
+    }
+}
+
 /*
  * A PCI Express Hot-Plug Event has occurred, so update slot status register
  * and notify OS of the event if necessary.

Then call this from ACPI.  How would this have any migration
implications at all?  And why do we need a knob not to power off then?
Power will just stay on since there's nothing turning it off.

-- 
MST


