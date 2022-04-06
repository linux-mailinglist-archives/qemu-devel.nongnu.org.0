Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 789674F637E
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 17:36:14 +0200 (CEST)
Received: from localhost ([::1]:52030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc7hd-0006MI-EF
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 11:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nc7eM-0001lA-GA
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 11:32:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nc7eJ-0001yj-5r
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 11:32:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649259165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CHKExI11di2GNyPG4BYss8rGhwGVIi6vB1scuBmRPiQ=;
 b=hCC5jfj5bxxh/wOh413mO6PSi6M0NjXcfMoxd2NMEseB+jYzvQFXkgnM4LV8/XP4I5XGiB
 ijbcjFHmocK92oxoJI7s56oTuy+Rub0mUoCg4kevH6azvKP6ZvDnbU5rlYM7HZV7+QU1fw
 /HIOcDWdK4nJILZJV5HnxEldcEj51Qc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-youW4KnvPgu0b5hZOWtNgQ-1; Wed, 06 Apr 2022 11:32:42 -0400
X-MC-Unique: youW4KnvPgu0b5hZOWtNgQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 c19-20020a05600c4a1300b0038e6b4a104cso3104634wmp.9
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 08:32:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CHKExI11di2GNyPG4BYss8rGhwGVIi6vB1scuBmRPiQ=;
 b=OA/VexKj1OvkCmnRON75MstVNBSM3l8FhgDYnD2RS30AbFUZXMwn5Zvk17rVB+IffY
 UKedVbHIK6QEx40JFI10XBGXicyDhcpeDhX8ZmEU50DxIio0NkVURHIAv1W9CezefwTb
 cjQCjA4Qf3JOarcrtHIvjCa/wEQdn83yXcFXePrZ/qvEZ8J0KkxrMRfMYiOTbkf6hD8Q
 wFnSq/HmhMN9pTucTxcIT0sdkQhSI0od7oCbZDr6k8almquScuMYHUg5VTrgRUDmNyRH
 giSnXkuRNO3lD3xRNC4kwP9BihjnuNvd9Acj9Fths8bh7M1Z1NAX6ouFiQ+waFdY7sbZ
 G1/A==
X-Gm-Message-State: AOAM530UWt3F3N+bf+Fxhona96LrC6GFJ1BI9bLYx4ClNpyVGSXTovcQ
 S2/3QdsWazTLUIpPZMAY/kB2d7hSKy2mccxEJUrwA3lbWg20iEYaKdrDJSFcUzzkJL5VFfBySHB
 kubT0zYdePaq6+TY=
X-Received: by 2002:adf:f3cc:0:b0:206:1ae9:b7d6 with SMTP id
 g12-20020adff3cc000000b002061ae9b7d6mr7239871wrp.523.1649259161535; 
 Wed, 06 Apr 2022 08:32:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBi9m+zi5rKixEP7TaSPziku6uOxH8AShoM1PUrgMLtVHsvAYR4PhRdBzNNfjaKFNXLaIong==
X-Received: by 2002:adf:f3cc:0:b0:206:1ae9:b7d6 with SMTP id
 g12-20020adff3cc000000b002061ae9b7d6mr7239842wrp.523.1649259161200; 
 Wed, 06 Apr 2022 08:32:41 -0700 (PDT)
Received: from redhat.com ([2.55.156.253]) by smtp.gmail.com with ESMTPSA id
 u7-20020a05600c19c700b0038cc9aac1a3sm5736083wmq.23.2022.04.06.08.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 08:32:40 -0700 (PDT)
Date: Wed, 6 Apr 2022 11:32:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH] acpi: Bodge acpi_index migration
Message-ID: <20220406113213-mutt-send-email-mst@kernel.org>
References: <20220406083531.10217-1-dgilbert@redhat.com>
 <20220406113446.73ab4e1b@redhat.com> <Yk1fq+B9RD+9+4I3@work-vm>
 <Yk1g8hchG0GGVdw8@work-vm>
MIME-Version: 1.0
In-Reply-To: <Yk1g8hchG0GGVdw8@work-vm>
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, quintela@redhat.com, qemu-devel@nongnu.org,
 peterx@redhat.com, alex.williamson@redhat.com, leobras@redhat.com,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 06, 2022 at 10:44:18AM +0100, Dr. David Alan Gilbert wrote:
> * Dr. David Alan Gilbert (dgilbert@redhat.com) wrote:
> > * Igor Mammedov (imammedo@redhat.com) wrote:
> > > On Wed,  6 Apr 2022 09:35:31 +0100
> > > "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> wrote:
> > > 
> > > > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > > > 
> > > > The 'acpi_index' field is a statically configured field, which for
> > > > some reason is migrated; this never makes much sense because it's
> > > > command line static.
> > > 
> > > that's true only for the field that's part of PCIDEvice,
> > > however AcpiPciHpState::acpi_index is runtime state and _must_
> > > be migrated if set, otherwise guest might get wrong index
> > > if it's in process of querying it
> > 
> > So this patch only changes the piix4.c version; I'm confused, is there
> > a AcpiPciHpState::acpi_index that's runtime setable in there?
> > 
> > >  
> > > > However, on piix4 it's conditional, and the condition/test function
> > > > ends up having the wrong pointer passed to it (it gets a PIIX4PMState
> > > > not the AcpiPciHpState it was expecting, because VMSTATE_PCI_HOTPLUG
> > > > is a macro and not another struct).  This means the field is randomly
> > > > loaded/saved based on a random pointer.  In 6.x this random pointer
> > > > randomly seems to get 0 for everyone (!); in 7.0rc it's getting junk
> > > > and trying to load a field that the source didn't send.  The migration
> > > > stream gets out of line and hits the section footer.
> > > 
> > > I'm a bit confused by description,
> > > do you have a reproducer for me to try?
> > 
> > Yeh, see the linked gitlab case command line:
> >   https://gitlab.com/qemu-project/qemu/-/issues/932
> > 
> > ./x86_64-softmmu/qemu-system-x86_64 -M pc-q35-6.2 -m 512 -device virtio-scsi-pci,id=scsihw0,bus=pcie.0,addr=0x5,acpi-index=3 -drive if=none,my.qcow2,format=qcow2,id=drive-scsi0,node-name=scsi0 -device 'scsi-hd,bus=scsihw0.0,channel=0,scsi-id=0,lun=0,drive=drive-scsi0,id=scsi0'  -nographic
> 
> Oops no, wrong line; -M pc-i440fx-6.2  triggers this; q35 doesn't.
> 
> Dave


Igor were you able to reproduce?

> > just migrating from a 6.2 to a head triggers this.
> > 
> > Dave
> > 
> > > > The bodge is on piix4 never to load the field:
> > > >   a) Most 6.x builds never send it, so most of the time the migration
> > > >     will work.
> > > >   b) We can backport this fix to 6.x to remove the boobytrap.
> > > >   c) It should never have made a difference anyway since the acpi-index
> > > >     is command line configured and should be correct on the destination
> > > >     anyway
> > > >   d) ich9 is still sending/receiving this (unconditionally all the time)
> > > >     but due to (c) should never notice.  We could follow up to make it
> > > >     skip.
> > > > 
> > > > It worries me just when (a) actually happens.
> > > > 
> > > > Fixes: b32bd76 ("pci: introduce acpi-index property for PCI device")
> > > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/932
> > > > 
> > > > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > > > ---
> > > >  hw/acpi/acpi-pci-hotplug-stub.c |  4 ----
> > > >  hw/acpi/pcihp.c                 |  6 ------
> > > >  hw/acpi/piix4.c                 | 11 ++++++++++-
> > > >  include/hw/acpi/pcihp.h         |  2 --
> > > >  4 files changed, 10 insertions(+), 13 deletions(-)
> > > > 
> > > > diff --git a/hw/acpi/acpi-pci-hotplug-stub.c b/hw/acpi/acpi-pci-hotplug-stub.c
> > > > index 734e4c5986..a43f6dafc9 100644
> > > > --- a/hw/acpi/acpi-pci-hotplug-stub.c
> > > > +++ b/hw/acpi/acpi-pci-hotplug-stub.c
> > > > @@ -41,7 +41,3 @@ void acpi_pcihp_reset(AcpiPciHpState *s, bool acpihp_root_off)
> > > >      return;
> > > >  }
> > > >  
> > > > -bool vmstate_acpi_pcihp_use_acpi_index(void *opaque, int version_id)
> > > > -{
> > > > -    return false;
> > > > -}
> > > > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> > > > index 6351bd3424..bf65bbea49 100644
> > > > --- a/hw/acpi/pcihp.c
> > > > +++ b/hw/acpi/pcihp.c
> > > > @@ -554,12 +554,6 @@ void acpi_pcihp_init(Object *owner, AcpiPciHpState *s, PCIBus *root_bus,
> > > >                                     OBJ_PROP_FLAG_READ);
> > > >  }
> > > >  
> > > > -bool vmstate_acpi_pcihp_use_acpi_index(void *opaque, int version_id)
> > > > -{
> > > > -     AcpiPciHpState *s = opaque;
> > > > -     return s->acpi_index;
> > > > -}
> > > > -
> > > >  const VMStateDescription vmstate_acpi_pcihp_pci_status = {
> > > >      .name = "acpi_pcihp_pci_status",
> > > >      .version_id = 1,
> > > > diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> > > > index cc37fa3416..48aeedd5f0 100644
> > > > --- a/hw/acpi/piix4.c
> > > > +++ b/hw/acpi/piix4.c
> > > > @@ -267,6 +267,15 @@ static bool piix4_vmstate_need_smbus(void *opaque, int version_id)
> > > >      return pm_smbus_vmstate_needed();
> > > >  }
> > > >  
> > > > +/*
> > > > + * This is a fudge to turn off the acpi_index field, whose
> > > > + * test was always broken on piix4.
> > > > + */
> > > > +static bool vmstate_test_never(void *opaque, int version_id)
> > > > +{
> > > > +    return false;
> > > > +}
> > > > +
> > > >  /* qemu-kvm 1.2 uses version 3 but advertised as 2
> > > >   * To support incoming qemu-kvm 1.2 migration, change version_id
> > > >   * and minimum_version_id to 2 below (which breaks migration from
> > > > @@ -297,7 +306,7 @@ static const VMStateDescription vmstate_acpi = {
> > > >              struct AcpiPciHpPciStatus),
> > > >          VMSTATE_PCI_HOTPLUG(acpi_pci_hotplug, PIIX4PMState,
> > > >                              vmstate_test_use_acpi_hotplug_bridge,
> > > > -                            vmstate_acpi_pcihp_use_acpi_index),
> > > > +                            vmstate_test_never),
> > > >          VMSTATE_END_OF_LIST()
> > > >      },
> > > >      .subsections = (const VMStateDescription*[]) {
> > > > diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
> > > > index af1a169fc3..7e268c2c9c 100644
> > > > --- a/include/hw/acpi/pcihp.h
> > > > +++ b/include/hw/acpi/pcihp.h
> > > > @@ -73,8 +73,6 @@ void acpi_pcihp_reset(AcpiPciHpState *s, bool acpihp_root_off);
> > > >  
> > > >  extern const VMStateDescription vmstate_acpi_pcihp_pci_status;
> > > >  
> > > > -bool vmstate_acpi_pcihp_use_acpi_index(void *opaque, int version_id);
> > > > -
> > > >  #define VMSTATE_PCI_HOTPLUG(pcihp, state, test_pcihp, test_acpi_index) \
> > > >          VMSTATE_UINT32_TEST(pcihp.hotplug_select, state, \
> > > >                              test_pcihp), \
> > > 
> > -- 
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> -- 
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


