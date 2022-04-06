Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E953D4F64C3
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 18:14:14 +0200 (CEST)
Received: from localhost ([::1]:59220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc8IQ-0006G1-2z
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 12:14:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nc8Fd-0004f9-60
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 12:11:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nc8FZ-0003lU-CW
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 12:11:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649261476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/UQxUaqHfTdbyFjs8h7JWZ0rl0OkNPRUCh8JrE5qIRA=;
 b=FRTZQkAfhME+YmaZvX/B9QMrSC71i/N+7e1cGGbRqMXLkLV2A+K7lEZDCvRz6owd32S5zH
 ucMCvRRCA+5OjAG7QsZYJkvf63F/97OT2mM0KYTixckSy8Z9dJVnrEsTQlUW6pnrK0ibbK
 dFZUxptwBnPWZXGo3Bff0TpuZcMA10o=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-DIeT6OVjOLiG_Fmyxu3KzA-1; Wed, 06 Apr 2022 12:11:15 -0400
X-MC-Unique: DIeT6OVjOLiG_Fmyxu3KzA-1
Received: by mail-wr1-f72.google.com with SMTP id
 t15-20020adfdc0f000000b001ef93643476so656753wri.2
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 09:11:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/UQxUaqHfTdbyFjs8h7JWZ0rl0OkNPRUCh8JrE5qIRA=;
 b=Nwr4TePvFxd/tPPfGzpVXxVuGGYyAPLEsMjAiTYA4XwrLa/ga1DLso2xCHV51uSBDf
 FSI3dlWR470X+/LeP7S+0CsNFi5NZViX+zWL7V913zn6CwxodIILqi84gtlN6Unvmr1n
 PFDVL64ad4uGZkhpxRyvJK0MpedBHP+FTVZdKrw5K3UnH3vqHjojZ0xpSIyyd2w/eYay
 MglEQyB0BVxvxo1WG6ydngcEahXmchFTwJ5fVPWvlMmMrfTXS1TLXZ6td/OADGhkyDBc
 bh9jvTrI+M3vuC791qA4dcUdbKt50KsDlrQct2fqanC1i7KnCgyJymuaXEDLGrXycFBq
 t2hw==
X-Gm-Message-State: AOAM5317hLddWt/G1Gh/wL9Y2OI7OHtAz/9vL9QeQ9bTc+tCurDI99gb
 cz5Bav05X4tqBLQ0AykJUPM6iOtHiyeRWTziD8HJ0+8hCROvBbf0ElExRhUIJTNJ9hQr/F3LA/6
 DEQ5XhVOOtg+nuoM=
X-Received: by 2002:a5d:5189:0:b0:205:9c7b:d374 with SMTP id
 k9-20020a5d5189000000b002059c7bd374mr7463326wrv.551.1649261473839; 
 Wed, 06 Apr 2022 09:11:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywJOG1R+hhtBxeXUh6Mi05o+kGMOwYEdudnRZiU0ozi3nQElAX4a0D0JWgWKPwJEjbu2HJiw==
X-Received: by 2002:a5d:5189:0:b0:205:9c7b:d374 with SMTP id
 k9-20020a5d5189000000b002059c7bd374mr7463299wrv.551.1649261473500; 
 Wed, 06 Apr 2022 09:11:13 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 e12-20020a5d6d0c000000b001a65e479d20sm18168159wrq.83.2022.04.06.09.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 09:11:12 -0700 (PDT)
Date: Wed, 6 Apr 2022 17:11:09 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH] acpi: Bodge acpi_index migration
Message-ID: <Yk27nQLMqm8byNpd@work-vm>
References: <20220406083531.10217-1-dgilbert@redhat.com>
 <20220406113446.73ab4e1b@redhat.com> <Yk1fq+B9RD+9+4I3@work-vm>
 <20220406175939.39d9a277@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220406175939.39d9a277@redhat.com>
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
> On Wed, 6 Apr 2022 10:38:51 +0100
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> 
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
> 
> > > >          VMSTATE_PCI_HOTPLUG(acpi_pci_hotplug, PIIX4PMState,
>                                     ^^^ AcpiPciHpState
> > > >                              vmstate_test_use_acpi_hotplug_bridge,
> > > > -                            vmstate_acpi_pcihp_use_acpi_index),
> 
> hw/acpi/pcihp.c:pci_write():
>    s->acpi_index = object_property_get_uint(o, "acpi-index", NULL);
> 
> s->acpi_index is runtime value that is supposed to be migrated if it's set
> to something other then 0
> 
> I may have botched VMSTATE_PCI_HOTPLUG, intent was to migrate
> AcpiPciHpState::acpi_index if necessary. But I'm not sure how
> if I used correct approach for to migrate an optional value
> i.e.  maybe instead of VMSTATE_UINT32_TEST(pcihp.acpi_index, state, test_acpi_index)
> I should've used subsection, because destination has no clue if
> acpi_index would be transmitted over wire or not?
>     
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
> > 
> > just migrating from a 6.2 to a head triggers this.
> 
> Over here any migration from qemu-6.2 to HEAD at 3d31fe4d662f13c7
> fails even without acpi-index, as simple as this:
> 
> qemu-system-x86_64-6.2 -M pc-i440fx-6.2  -m 512 -vnc :0 -monitor stdio
> (qemu) stop
> (qemu) migrate "exec:gzip -c > STATEFILE.gz"
> 
> qemu-system-x86_64-7.0 -M pc-i440fx-6.2  -m 512 -vnc :0 -monitor stdio -incoming "exec: gzip -c -d STATEFILE.gz"
> 
> (qemu) qemu-system-x86_64-7.0: Missing section footer for 0000:00:01.3/piix4_pm
> qemu-system-x86_64-7.0: load of migration failed: Invalid argument
> 
> 
> Like you pointed out in gitlab issue, vmstate_acpi_pcihp_use_acpi_index
> is broken. Following applied to HEAD should fix immediate issue on destination
> reading random value:
> 
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index f0b5fac44a..c97db491c8 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -269,6 +269,11 @@ static bool piix4_vmstate_need_smbus(void *opaque, int version_id)
>      return pm_smbus_vmstate_needed();
>  }
>  
> +static bool vmstate_piix4_need_acpi_index(void *opaque, int version_id)
> +{
> +    PIIX4PMState *s = PIIX4_PM(opaque);
> +    return vmstate_acpi_pcihp_use_acpi_index(&(s->acpi_pci_hotplug), version_id);
> +}

But if acpi_index was set on the source 6.2 host, it won't send the
index, but the 7.0 would expect it, and it would fail in the same way
wouldn't it?

Dave

>  /* qemu-kvm 1.2 uses version 3 but advertised as 2
>   * To support incoming qemu-kvm 1.2 migration, change version_id
>   * and minimum_version_id to 2 below (which breaks migration from
> @@ -299,7 +304,7 @@ static const VMStateDescription vmstate_acpi = {
>              struct AcpiPciHpPciStatus),
>          VMSTATE_PCI_HOTPLUG(acpi_pci_hotplug, PIIX4PMState,
>                              vmstate_test_use_acpi_hotplug_bridge,
> -                            vmstate_acpi_pcihp_use_acpi_index),
> +                            vmstate_piix4_need_acpi_index),
>          VMSTATE_END_OF_LIST()
>      },
>      .subsections = (const VMStateDescription*[]) {
> 
> 
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
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


