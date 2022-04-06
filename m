Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 997224F5820
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 10:56:34 +0200 (CEST)
Received: from localhost ([::1]:44304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc1Sr-0006el-B7
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 04:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nc1QS-0005OX-3f
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 04:54:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nc1QP-0003G6-Bu
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 04:54:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649235240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4g2mSmiK8/vSR3ed+eF6gjvCTq5D9u4NDH95PxrAnqw=;
 b=XKVSF1Tlw0UrpPqasKqCKn5uBqzO6/57CoVZ/eaOtwfDsk+1T0zc4wGEUsZqOHp4fo95nR
 MzrGJoOcgv0eTvLNhUH4vXEo1qoYS9L59BsJMmwYc9DYlDar009qBSCD18hIBkU91QYv+L
 duYFRhdKmKSOj9/hQ/O98i7QkrR7bfs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313-fQs47BWzMmyBfxXTah_MwA-1; Wed, 06 Apr 2022 04:53:59 -0400
X-MC-Unique: fQs47BWzMmyBfxXTah_MwA-1
Received: by mail-wr1-f72.google.com with SMTP id
 j67-20020adf9149000000b00203e6b7d151so266631wrj.13
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 01:53:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4g2mSmiK8/vSR3ed+eF6gjvCTq5D9u4NDH95PxrAnqw=;
 b=rNp5bbQHoaEGee5vMqLP2nwlCRgIOZvjrq2/JU2mGnCP0iGLwblPkVVTB4Ddc6yBHf
 z6Co3h21rv6WUhfObIWYaE4aVIW1HLam2jHZG6EIa8gfhYMtLaYz3xkWLGwBXKsb7Twg
 YqoYTZdm7Cptr5KrwufbjLSME5QYO+hsy3cuqR4FBWFP9q5KHLEl7Mcy9qkP16oiQtv3
 EOIdFMUKOk/dY4XVSzs+wBS5rTS4iUwYQIwTai47nTozFeoZeOep/YGTKuYhyQdnN04E
 s9PMFh38iK4HuYS66K4n3lOX111YD09EWpaVexdDH2Qg1PrCi5Q+z/Ih3i2Dje50Wv+g
 phvQ==
X-Gm-Message-State: AOAM532Fjw8lFmsOiLQcYaKP44VISOkG3ldwvw9NaSpDG49OQiblsf4s
 ULIQRebUh5CK5sM9jtGG+ypQc+MQpf5ZQGQn04UDLiTdt/Q8KZ50dgD31z5kuZhshOE2qlhrJT+
 W4adTg6MuSrZ9KcA=
X-Received: by 2002:a5d:4b8e:0:b0:206:129b:3853 with SMTP id
 b14-20020a5d4b8e000000b00206129b3853mr5728491wrt.278.1649235238105; 
 Wed, 06 Apr 2022 01:53:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkJYoEwNI5A7un+ThWYX5laFAMp4bedk9Tbt0L8CKfDqMhie/t8efFg3CC/2DLGUNlvZN6ZA==
X-Received: by 2002:a5d:4b8e:0:b0:206:129b:3853 with SMTP id
 b14-20020a5d4b8e000000b00206129b3853mr5728470wrt.278.1649235237827; 
 Wed, 06 Apr 2022 01:53:57 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 o14-20020a5d47ce000000b00203e0a21c16sm17080303wrc.3.2022.04.06.01.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 01:53:57 -0700 (PDT)
Date: Wed, 6 Apr 2022 09:53:54 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH] acpi: Bodge acpi_index migration
Message-ID: <Yk1VImifUlhVFbOe@work-vm>
References: <20220405190658.65187-1-dgilbert@redhat.com>
 <20220405150242.517e9bdb.alex.williamson@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220405150242.517e9bdb.alex.williamson@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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
Cc: peter.maydell@linaro.org, quintela@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, peterx@redhat.com, leobras@redhat.com,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Alex Williamson (alex.williamson@redhat.com) wrote:
> On Tue,  5 Apr 2022 20:06:58 +0100
> "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> wrote:
> 
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > 
> > The 'acpi_index' field is a statically configured field, which for
> > some reason is migrated; this never makes much sense because it's
> > command line static.
> > 
> > However, on piix4 it's conditional, and the condition/test function
> > ends up having the wrong pointer passed to it (it gets a PIIX4PMState
> > not the AcpiPciHpState it was expecting, because VMSTATE_PCI_HOTPLUG
> > is a macro and not another struct).  This means the field is randomly
> > loaded/saved based on a random pointer.  In 6.x this random pointer
> > randomly seems to get 0 for everyone (!); in 7.0rc it's getting junk
> > and trying to load a field that the source didn't send.
> 
> FWIW, after some hunting and pecking, 6.2 (64bit):

Ah thanks for doing that.

> (gdb) p &((struct AcpiPciHpState *)0)->acpi_index
> $1 = (uint32_t *) 0xc04
> 
> (gdb) p &((struct PIIX4PMState *)0)->ar.tmr.io.addr
> $2 = (hwaddr *) 0xc00
> 
> f53faa70bb63:
> 
> (gdb) p &((struct AcpiPciHpState *)0)->acpi_index
> $1 = (uint32_t *) 0xc04
> 
> (gdb) p &((struct PIIX4PMState *)0)->io_gpe.coalesced.tqh_circ.tql_prev
> $2 = (struct QTailQLink **) 0xc00
> 
> So yeah, it seems 0xc04 will always be part of a pointer on current
> mainline.  I can't really speak to the ACPIPMTimer MemoryRegion in the
> PIIX4PMState, maybe if there's a hwaddr it's always 32bit and the upper
> dword is reliably zero?  Thanks,

I'm a bit confused by that:

    memory_region_init_io(&ar->tmr.io, memory_region_owner(parent),
                          &acpi_pm_tmr_ops, ar, "acpi-tmr", 4);
    memory_region_add_subregion(parent, 8, &ar->tmr.io);
    .write = acpi_pm_tmr_write,
static void acpi_pm_tmr_write(void *opaque, hwaddr addr, uint64_t val,
                              unsigned width)
{
    /* nothing */
}

so, hmm I don't see it writing to that?

Dave

> Alex
> 
> >  The migration
> > stream gets out of line and hits the section footer.
> > 
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


