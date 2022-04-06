Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA314F5A40
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 11:42:39 +0200 (CEST)
Received: from localhost ([::1]:50728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc2BP-00045H-UL
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 05:42:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nc27w-0002eZ-RZ
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 05:39:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nc27u-00066E-VH
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 05:39:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649237938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=27qbEuuRLIzV1GlSr7cEvfeDiGKgW4cUg1NzikXAzZo=;
 b=jQgrPvOrBNYfBLG+67RSR5EPqrRFBnsXLpsD/1chUSo6/QY697BZ+QvicR+ju0+AuH1Kha
 SO5Bu3TPt96P7Z0obxNRKhN+We5HBxEU7wdj5GkilePx7wAKYKNpbglC2MPyVQb5QgKQyG
 RbPHVxdTWABEaWAVJcI4KxnoV2lGA3Q=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-v8RikrfgO0Wcj-XZnvhVAA-1; Wed, 06 Apr 2022 05:38:56 -0400
X-MC-Unique: v8RikrfgO0Wcj-XZnvhVAA-1
Received: by mail-wr1-f70.google.com with SMTP id
 s13-20020adfa28d000000b00205e049cff2so309437wra.17
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 02:38:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=27qbEuuRLIzV1GlSr7cEvfeDiGKgW4cUg1NzikXAzZo=;
 b=SCEfye7shxnd1UCUgubHoY3hMPao0Y/74YBsuCASgv0it4HQA2UrD1KUkIZCsLHDpZ
 1EYKISIRPRuBG+2P+At8wQFX+4Bty+bVQdOlrRsmHqOnj1c4MeT6pOpHptA/XC50ZWST
 W3dmTMXm7ZOgGwR3Pj7N97K9yI3ec9YqmKuD1q62VzrKLUzTJOfGopoKAVssqarZqhbV
 QU7B5FahiafNpc85YGzjzpmQfBDzndvXiCEmrV0WnLlDF7ZEKe15nArRuopDeL8oEtwe
 KbKz3I8yAO8yTQgJEke18B3vcgqP1lO+No2oEZ663EYdXLn+7+Zb9Epvlc+chGiPGSBm
 gaEg==
X-Gm-Message-State: AOAM530HlUUgLNa0obXeEVjyi1PJ3atjnucY/y3pPbOoaEHWYWCJpK4Y
 wn+F+VnyCe3Lz0qRAAPZe1NDI9+Wj9JfECLbX6rIW9odgQBksJ3ZTdSU6eRF70aMXs332+h9vRm
 7qS/JP/LxOMuRL3k=
X-Received: by 2002:a1c:7216:0:b0:38e:7e58:8376 with SMTP id
 n22-20020a1c7216000000b0038e7e588376mr6809727wmc.35.1649237934740; 
 Wed, 06 Apr 2022 02:38:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzl+FePjV8Uo1YU5ot/HwfTheVqKWjSoj4GSrr+6tAjoK879DZ1nZodYDvn9LKhf+VnIWGZ3Q==
X-Received: by 2002:a1c:7216:0:b0:38e:7e58:8376 with SMTP id
 n22-20020a1c7216000000b0038e7e588376mr6809706wmc.35.1649237934452; 
 Wed, 06 Apr 2022 02:38:54 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 p29-20020a1c545d000000b0038e70d5217dsm6200988wmi.45.2022.04.06.02.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 02:38:53 -0700 (PDT)
Date: Wed, 6 Apr 2022 10:38:51 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH] acpi: Bodge acpi_index migration
Message-ID: <Yk1fq+B9RD+9+4I3@work-vm>
References: <20220406083531.10217-1-dgilbert@redhat.com>
 <20220406113446.73ab4e1b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220406113446.73ab4e1b@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Cc: peter.maydell@linaro.org, quintela@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, peterx@redhat.com, alex.williamson@redhat.com,
 leobras@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Igor Mammedov (imammedo@redhat.com) wrote:
> On Wed,  6 Apr 2022 09:35:31 +0100
> "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> wrote:
> 
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > 
> > The 'acpi_index' field is a statically configured field, which for
> > some reason is migrated; this never makes much sense because it's
> > command line static.
> 
> that's true only for the field that's part of PCIDEvice,
> however AcpiPciHpState::acpi_index is runtime state and _must_
> be migrated if set, otherwise guest might get wrong index
> if it's in process of querying it

So this patch only changes the piix4.c version; I'm confused, is there
a AcpiPciHpState::acpi_index that's runtime setable in there?

>  
> > However, on piix4 it's conditional, and the condition/test function
> > ends up having the wrong pointer passed to it (it gets a PIIX4PMState
> > not the AcpiPciHpState it was expecting, because VMSTATE_PCI_HOTPLUG
> > is a macro and not another struct).  This means the field is randomly
> > loaded/saved based on a random pointer.  In 6.x this random pointer
> > randomly seems to get 0 for everyone (!); in 7.0rc it's getting junk
> > and trying to load a field that the source didn't send.  The migration
> > stream gets out of line and hits the section footer.
> 
> I'm a bit confused by description,
> do you have a reproducer for me to try?

Yeh, see the linked gitlab case command line:
  https://gitlab.com/qemu-project/qemu/-/issues/932

./x86_64-softmmu/qemu-system-x86_64 -M pc-q35-6.2 -m 512 -device virtio-scsi-pci,id=scsihw0,bus=pcie.0,addr=0x5,acpi-index=3 -drive if=none,my.qcow2,format=qcow2,id=drive-scsi0,node-name=scsi0 -device 'scsi-hd,bus=scsihw0.0,channel=0,scsi-id=0,lun=0,drive=drive-scsi0,id=scsi0'  -nographic

just migrating from a 6.2 to a head triggers this.

Dave

> > The bodge is on piix4 never to load the field:
> >   a) Most 6.x builds never send it, so most of the time the migration
> >     will work.
> >   b) We can backport this fix to 6.x to remove the boobytrap.
> >   c) It should never have made a difference anyway since the acpi-index
> >     is command line configured and should be correct on the destination
> >     anyway
> >   d) ich9 is still sending/receiving this (unconditionally all the time)
> >     but due to (c) should never notice.  We could follow up to make it
> >     skip.
> > 
> > It worries me just when (a) actually happens.
> > 
> > Fixes: b32bd76 ("pci: introduce acpi-index property for PCI device")
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/932
> > 
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > ---
> >  hw/acpi/acpi-pci-hotplug-stub.c |  4 ----
> >  hw/acpi/pcihp.c                 |  6 ------
> >  hw/acpi/piix4.c                 | 11 ++++++++++-
> >  include/hw/acpi/pcihp.h         |  2 --
> >  4 files changed, 10 insertions(+), 13 deletions(-)
> > 
> > diff --git a/hw/acpi/acpi-pci-hotplug-stub.c b/hw/acpi/acpi-pci-hotplug-stub.c
> > index 734e4c5986..a43f6dafc9 100644
> > --- a/hw/acpi/acpi-pci-hotplug-stub.c
> > +++ b/hw/acpi/acpi-pci-hotplug-stub.c
> > @@ -41,7 +41,3 @@ void acpi_pcihp_reset(AcpiPciHpState *s, bool acpihp_root_off)
> >      return;
> >  }
> >  
> > -bool vmstate_acpi_pcihp_use_acpi_index(void *opaque, int version_id)
> > -{
> > -    return false;
> > -}
> > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> > index 6351bd3424..bf65bbea49 100644
> > --- a/hw/acpi/pcihp.c
> > +++ b/hw/acpi/pcihp.c
> > @@ -554,12 +554,6 @@ void acpi_pcihp_init(Object *owner, AcpiPciHpState *s, PCIBus *root_bus,
> >                                     OBJ_PROP_FLAG_READ);
> >  }
> >  
> > -bool vmstate_acpi_pcihp_use_acpi_index(void *opaque, int version_id)
> > -{
> > -     AcpiPciHpState *s = opaque;
> > -     return s->acpi_index;
> > -}
> > -
> >  const VMStateDescription vmstate_acpi_pcihp_pci_status = {
> >      .name = "acpi_pcihp_pci_status",
> >      .version_id = 1,
> > diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> > index cc37fa3416..48aeedd5f0 100644
> > --- a/hw/acpi/piix4.c
> > +++ b/hw/acpi/piix4.c
> > @@ -267,6 +267,15 @@ static bool piix4_vmstate_need_smbus(void *opaque, int version_id)
> >      return pm_smbus_vmstate_needed();
> >  }
> >  
> > +/*
> > + * This is a fudge to turn off the acpi_index field, whose
> > + * test was always broken on piix4.
> > + */
> > +static bool vmstate_test_never(void *opaque, int version_id)
> > +{
> > +    return false;
> > +}
> > +
> >  /* qemu-kvm 1.2 uses version 3 but advertised as 2
> >   * To support incoming qemu-kvm 1.2 migration, change version_id
> >   * and minimum_version_id to 2 below (which breaks migration from
> > @@ -297,7 +306,7 @@ static const VMStateDescription vmstate_acpi = {
> >              struct AcpiPciHpPciStatus),
> >          VMSTATE_PCI_HOTPLUG(acpi_pci_hotplug, PIIX4PMState,
> >                              vmstate_test_use_acpi_hotplug_bridge,
> > -                            vmstate_acpi_pcihp_use_acpi_index),
> > +                            vmstate_test_never),
> >          VMSTATE_END_OF_LIST()
> >      },
> >      .subsections = (const VMStateDescription*[]) {
> > diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
> > index af1a169fc3..7e268c2c9c 100644
> > --- a/include/hw/acpi/pcihp.h
> > +++ b/include/hw/acpi/pcihp.h
> > @@ -73,8 +73,6 @@ void acpi_pcihp_reset(AcpiPciHpState *s, bool acpihp_root_off);
> >  
> >  extern const VMStateDescription vmstate_acpi_pcihp_pci_status;
> >  
> > -bool vmstate_acpi_pcihp_use_acpi_index(void *opaque, int version_id);
> > -
> >  #define VMSTATE_PCI_HOTPLUG(pcihp, state, test_pcihp, test_acpi_index) \
> >          VMSTATE_UINT32_TEST(pcihp.hotplug_select, state, \
> >                              test_pcihp), \
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


