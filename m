Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 847E841108E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 09:54:57 +0200 (CEST)
Received: from localhost ([::1]:60000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSE8e-0005MW-KP
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 03:54:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mSE7D-0004Hy-4H
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 03:53:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mSE7A-0006rg-Ik
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 03:53:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632124402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RWBUWru3oWoxSKZ0VZGj+Uw+Ll7FdcOvkJ5+Mw6bZTc=;
 b=dUSG0YsZbNQDU9iDqbLWJqPTYhVNSQNuB6dqz8cCEsBMJ0nK8pb0R2cTXj2cn/rBiovE8d
 K7LRPP3Kj5vagd/bxN08+mArfWfcVsDzXfe/rQeYvDuBXSF6IH/3JsdJ1O2LW8YFSa/9o7
 X/Al/FU8bi4tuq+QMTpoZwZK1lq3SwI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-hmaOzlcTN8uDH1dEDSCjqA-1; Mon, 20 Sep 2021 03:53:20 -0400
X-MC-Unique: hmaOzlcTN8uDH1dEDSCjqA-1
Received: by mail-ed1-f72.google.com with SMTP id
 m20-20020aa7c2d4000000b003d1add00b8aso14857784edp.0
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 00:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RWBUWru3oWoxSKZ0VZGj+Uw+Ll7FdcOvkJ5+Mw6bZTc=;
 b=fxcWPjSZ1ZCbe3KRscmb1UTyLZPnJbIn5sb+k39yHBMDNSRKjxwxe3hi9XUdnMr7o1
 mn43zIVUBazi/tYWJYdLm59KnvrAQpPQMDBWLar3pRzAenJ3COhSI+h3fytGJK7VPPUk
 VnvK4eShnHFAH9dIbacMX4h1dE8gAooVaYvkcYBO6+sTYyB4Z4hjGbYdO+92taGXO6lO
 7aPsa11FVyg+8Q51X1DkGWSIYfBJGhUsbTrXxwnoFkKOrlf6P4lfjqiTTaKmr3PSmCWf
 QyfG5F+DvSLOmiWvKU7Kdo7AtJCnrUjWnp+bf59CbQtHoH9KFwC/qp52iuht30kyQnDK
 RmRw==
X-Gm-Message-State: AOAM533MwCgfnFV0cPHlJN2goiIqqLYbJc+KS43ad2v5QwnuuL78rHkw
 nJ+SGJMUHz3K9qgYz0ui04dNZ+tobvZN2y1BRRXZCqvbxOyHLocJV623QmZxwdq6+qP5RR4rVJV
 CrfLoVYylKWk3lIA=
X-Received: by 2002:a17:906:a2d4:: with SMTP id
 by20mr27201528ejb.566.1632124398878; 
 Mon, 20 Sep 2021 00:53:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQDb1fpK4AKysVimcCOkltPj9vvii8EOrQ7MNqO8JiuE752jKeNQWf4kSrn+PYoXBa985+zA==
X-Received: by 2002:a17:906:a2d4:: with SMTP id
 by20mr27201497ejb.566.1632124398568; 
 Mon, 20 Sep 2021 00:53:18 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id s11sm6558287edy.64.2021.09.20.00.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 00:53:18 -0700 (PDT)
Date: Mon, 20 Sep 2021 09:53:16 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Annie.li" <annie.li@oracle.com>
Subject: Re: [Qemu-devel] [PATCH] acpi: Add emulated sleep button
Message-ID: <20210920095316.2dd133be@redhat.com>
In-Reply-To: <1a70f9be-e3ca-7311-a078-f55fe56ad0f3@oracle.com>
References: <1500543086-26588-1-git-send-email-sf@sfritsch.de>
 <20170720165957.743ccf1a@nial.brq.redhat.com>
 <1a70f9be-e3ca-7311-a078-f55fe56ad0f3@oracle.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.476,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Fritsch <sf@sfritsch.de>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 6 Aug 2021 16:18:09 -0400
"Annie.li" <annie.li@oracle.com> wrote:

> Hello Igor,
> 
> This is an old patch, but it does what we need.
> I am getting a little bit lost about not implementing fixed hardware
> sleep button, can you please clarify? thank you!
> 
> On 7/20/2017 10:59 AM, Igor Mammedov wrote:
> > On Thu, 20 Jul 2017 11:31:26 +0200
> > Stefan Fritsch <sf@sfritsch.de> wrote:
> >  
> >> From: Stefan Fritsch <stefan_fritsch@genua.de>
> >>
> >> Add an ACPI sleep button and QMP/HMP commands to trigger it.  A sleep
> >> button is a so called "fixed hardware feature", which makes it more
> >> suitable for putting the system to sleep than a laptop lid, for example.
> >>
> >> The sleep button is disabled by default (Bit 5 in the FACP flags
> >> register set and no button "device" present in SSDT/DSDT). Clearing said
> >> bit enables it as a fixed feature device.  
> > per spec sleep button is used for both putting system into
> > sleep and for waking it up.
> >
> > Reusing system_wakeup 'button' to behave as per spec would
> > make this patch significantly smaller.  
> 
> About reusing "system_wakeup", does it mean the following?
> 
> 1. when guest is in sleep state, "system_wakeup" wakes up the guest
> 2. when guest is running, "system_wakeup" puts the guest into sleep

yes,  it could be something like this


> "system_wakeup" sets WAK_STS and then system transitions to the
> working state. Correspondingly, I suppose both SLPBTN_STS and
> SLPBTN_EN need to be set for sleeping, and this is what fixed
> hardware sleep button requires?

yep
 
> I have combined the sleep and wakeup together, share the
> code between. But Xen also registers the wakeup notifier, and
> this makes things more complicated if this notifier is shared
> between sleep and wakeup. Or this is my misunderstanding?
> please correct me if I am wrong.

you'd have to fixup xen notifier to handle that
 
> > If you like idea of separate command/button better, then
> > I'd go generic control sleep button way instead of fixed
> > hardware, it would allow us to reuse most of the code in
> > ARM target, plus I'd avoid notifiers and use acpi device
> > lookup instead (see: qmp_query_acpi_ospm_status as example)
> >  
> Do you mean the "Control Method Sleep Button" that needs to
> notify OSPM by event indication 0x80?

yes, in addition to virt-arm machine it could be reused by
microvm which also uses 'reduced hardware' acpi model
(i.e. it lacks fixed hardware registers like virt-arm does)

maybe while adding button to pc/q35 you can look into adding
it to microvm and virt-arm at the same time (should be trivial
on top of pc/q35 support).

> Thanks
> Annie
> >> Signed-off-by: Stefan Fritsch <stefan_fritsch@genua.de>
> >> ---
> >>   hmp-commands.hx         | 16 ++++++++++++++++
> >>   hmp.c                   |  5 +++++
> >>   hmp.h                   |  1 +
> >>   hw/acpi/core.c          |  8 ++++++++
> >>   hw/acpi/ich9.c          | 10 ++++++++++
> >>   hw/acpi/piix4.c         | 12 ++++++++++++
> >>   hw/i386/acpi-build.c    |  1 -
> >>   include/hw/acpi/acpi.h  |  2 ++
> >>   include/hw/acpi/ich9.h  |  1 +
> >>   include/sysemu/sysemu.h |  2 ++
> >>   qapi-schema.json        | 12 ++++++++++++
> >>   qmp.c                   |  5 +++++
> >>   tests/test-hmp.c        |  1 +
> >>   vl.c                    | 29 +++++++++++++++++++++++++++++
> >>   14 files changed, 104 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/hmp-commands.hx b/hmp-commands.hx
> >> index 1941e19932..8ba4380883 100644
> >> --- a/hmp-commands.hx
> >> +++ b/hmp-commands.hx
> >> @@ -638,6 +638,22 @@ Reset the system.
> >>   ETEXI
> >>   
> >>       {
> >> +        .name       = "system_sleep",
> >> +        .args_type  = "",
> >> +        .params     = "",
> >> +        .help       = "send ACPI sleep event",
> >> +        .cmd = hmp_system_sleep,
> >> +    },
> >> +
> >> +STEXI
> >> +@item system_sleep
> >> +@findex system_sleep
> >> +
> >> +Push the virtual sleep button; if supported the system will enter
> >> +an ACPI sleep state.
> >> +ETEXI
> >> +
> >> +    {
> >>           .name       = "system_powerdown",
> >>           .args_type  = "",
> >>           .params     = "",
> >> diff --git a/hmp.c b/hmp.c
> >> index bf1de747d5..b4b584016c 100644
> >> --- a/hmp.c
> >> +++ b/hmp.c
> >> @@ -1047,6 +1047,11 @@ void hmp_system_reset(Monitor *mon, const QDict *qdict)
> >>       qmp_system_reset(NULL);
> >>   }
> >>   
> >> +void hmp_system_sleep(Monitor *mon, const QDict *qdict)
> >> +{
> >> +    qmp_system_sleep(NULL);
> >> +}
> >> +
> >>   void hmp_system_powerdown(Monitor *mon, const QDict *qdict)
> >>   {
> >>       qmp_system_powerdown(NULL);
> >> diff --git a/hmp.h b/hmp.h
> >> index 1ff455295e..15b53de9ed 100644
> >> --- a/hmp.h
> >> +++ b/hmp.h
> >> @@ -45,6 +45,7 @@ void hmp_info_iothreads(Monitor *mon, const QDict *qdict);
> >>   void hmp_quit(Monitor *mon, const QDict *qdict);
> >>   void hmp_stop(Monitor *mon, const QDict *qdict);
> >>   void hmp_system_reset(Monitor *mon, const QDict *qdict);
> >> +void hmp_system_sleep(Monitor *mon, const QDict *qdict);
> >>   void hmp_system_powerdown(Monitor *mon, const QDict *qdict);
> >>   void hmp_cpu(Monitor *mon, const QDict *qdict);
> >>   void hmp_memsave(Monitor *mon, const QDict *qdict);
> >> diff --git a/hw/acpi/core.c b/hw/acpi/core.c
> >> index 95fcac95a2..2ee64b6878 100644
> >> --- a/hw/acpi/core.c
> >> +++ b/hw/acpi/core.c
> >> @@ -422,6 +422,14 @@ void acpi_pm1_evt_power_down(ACPIREGS *ar)
> >>       }
> >>   }
> >>   
> >> +void acpi_pm1_evt_sleep(ACPIREGS *ar)
> >> +{
> >> +    if (ar->pm1.evt.en & ACPI_BITMASK_SLEEP_BUTTON_ENABLE) {
> >> +        ar->pm1.evt.sts |= ACPI_BITMASK_SLEEP_BUTTON_STATUS;
> >> +        ar->tmr.update_sci(ar);
> >> +    }
> >> +}
> >> +
> >>   void acpi_pm1_evt_reset(ACPIREGS *ar)
> >>   {
> >>       ar->pm1.evt.sts = 0;
> >> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> >> index c5d8646abc..3faeab4d2e 100644
> >> --- a/hw/acpi/ich9.c
> >> +++ b/hw/acpi/ich9.c
> >> @@ -260,6 +260,14 @@ static void pm_reset(void *opaque)
> >>       acpi_update_sci(&pm->acpi_regs, pm->irq);
> >>   }
> >>   
> >> +static void pm_sleep_req(Notifier *n, void *opaque)
> >> +{
> >> +    ICH9LPCPMRegs *pm = container_of(n, ICH9LPCPMRegs, sleep_notifier);
> >> +
> >> +    acpi_pm1_evt_sleep(&pm->acpi_regs);
> >> +}
> >> +
> >> +
> >>   static void pm_powerdown_req(Notifier *n, void *opaque)
> >>   {
> >>       ICH9LPCPMRegs *pm = container_of(n, ICH9LPCPMRegs, powerdown_notifier);
> >> @@ -299,6 +307,8 @@ void ich9_pm_init(PCIDevice *lpc_pci, ICH9LPCPMRegs *pm,
> >>       qemu_register_reset(pm_reset, pm);
> >>       pm->powerdown_notifier.notify = pm_powerdown_req;
> >>       qemu_register_powerdown_notifier(&pm->powerdown_notifier);
> >> +    pm->sleep_notifier.notify = pm_sleep_req;
> >> +    qemu_register_sleep_notifier(&pm->sleep_notifier);
> >>   
> >>       legacy_acpi_cpu_hotplug_init(pci_address_space_io(lpc_pci),
> >>           OBJECT(lpc_pci), &pm->gpe_cpu, ICH9_CPU_HOTPLUG_IO_BASE);
> >> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> >> index f276967365..15e20976c3 100644
> >> --- a/hw/acpi/piix4.c
> >> +++ b/hw/acpi/piix4.c
> >> @@ -79,6 +79,7 @@ typedef struct PIIX4PMState {
> >>       int smm_enabled;
> >>       Notifier machine_ready;
> >>       Notifier powerdown_notifier;
> >> +    Notifier sleep_notifier;
> >>   
> >>       AcpiPciHpState acpi_pci_hotplug;
> >>       bool use_acpi_pci_hotplug;
> >> @@ -371,6 +372,15 @@ static void piix4_pm_powerdown_req(Notifier *n, void *opaque)
> >>       acpi_pm1_evt_power_down(&s->ar);
> >>   }
> >>   
> >> +static void piix4_pm_sleep_req(Notifier *n, void *opaque)
> >> +{
> >> +    PIIX4PMState *s = container_of(n, PIIX4PMState, sleep_notifier);
> >> +
> >> +    assert(s != NULL);
> >> +    acpi_pm1_evt_sleep(&s->ar);
> >> +}
> >> +
> >> +
> >>   static void piix4_device_plug_cb(HotplugHandler *hotplug_dev,
> >>                                    DeviceState *dev, Error **errp)
> >>   {
> >> @@ -535,6 +545,8 @@ static void piix4_pm_realize(PCIDevice *dev, Error **errp)
> >>   
> >>       s->powerdown_notifier.notify = piix4_pm_powerdown_req;
> >>       qemu_register_powerdown_notifier(&s->powerdown_notifier);
> >> +    s->sleep_notifier.notify = piix4_pm_sleep_req;
> >> +    qemu_register_sleep_notifier(&s->sleep_notifier);
> >>   
> >>       s->machine_ready.notify = piix4_pm_machine_ready;
> >>       qemu_add_machine_init_done_notifier(&s->machine_ready);
> >> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> >> index 6b7bade183..06b28dacfe 100644
> >> --- a/hw/i386/acpi-build.c
> >> +++ b/hw/i386/acpi-build.c
> >> @@ -294,7 +294,6 @@ static void fadt_setup(AcpiFadtDescriptorRev3 *fadt, AcpiPmInfo *pm)
> >>       fadt->plvl3_lat = cpu_to_le16(0xfff); /* C3 state not supported */
> >>       fadt->flags = cpu_to_le32((1 << ACPI_FADT_F_WBINVD) |
> >>                                 (1 << ACPI_FADT_F_PROC_C1) |
> >> -                              (1 << ACPI_FADT_F_SLP_BUTTON) |
> >>                                 (1 << ACPI_FADT_F_RTC_S4));
> >>       fadt->flags |= cpu_to_le32(1 << ACPI_FADT_F_USE_PLATFORM_CLOCK);
> >>       /* APIC destination mode ("Flat Logical") has an upper limit of 8 CPUs
> >> diff --git a/include/hw/acpi/acpi.h b/include/hw/acpi/acpi.h
> >> index 7b3d93cf0d..51cf901ef6 100644
> >> --- a/include/hw/acpi/acpi.h
> >> +++ b/include/hw/acpi/acpi.h
> >> @@ -78,6 +78,7 @@
> >>   #define ACPI_BITMASK_PM1_COMMON_ENABLED         ( \
> >>           ACPI_BITMASK_RT_CLOCK_ENABLE        | \
> >>           ACPI_BITMASK_POWER_BUTTON_ENABLE    | \
> >> +        ACPI_BITMASK_SLEEP_BUTTON_ENABLE    | \
> >>           ACPI_BITMASK_GLOBAL_LOCK_ENABLE     | \
> >>           ACPI_BITMASK_TIMER_ENABLE)
> >>   
> >> @@ -148,6 +149,7 @@ void acpi_pm_tmr_reset(ACPIREGS *ar);
> >>   /* PM1a_EVT: piix and ich9 don't implement PM1b. */
> >>   uint16_t acpi_pm1_evt_get_sts(ACPIREGS *ar);
> >>   void acpi_pm1_evt_power_down(ACPIREGS *ar);
> >> +void acpi_pm1_evt_sleep(ACPIREGS *ar);
> >>   void acpi_pm1_evt_reset(ACPIREGS *ar);
> >>   void acpi_pm1_evt_init(ACPIREGS *ar, acpi_update_sci_fn update_sci,
> >>                          MemoryRegion *parent);
> >> diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
> >> index a352c94fde..2073eec168 100644
> >> --- a/include/hw/acpi/ich9.h
> >> +++ b/include/hw/acpi/ich9.h
> >> @@ -48,6 +48,7 @@ typedef struct ICH9LPCPMRegs {
> >>   
> >>       uint32_t pm_io_base;
> >>       Notifier powerdown_notifier;
> >> +    Notifier sleep_notifier;
> >>   
> >>       bool cpu_hotplug_legacy;
> >>       AcpiCpuHotplug gpe_cpu;
> >> diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
> >> index b21369672a..00f54653dc 100644
> >> --- a/include/sysemu/sysemu.h
> >> +++ b/include/sysemu/sysemu.h
> >> @@ -75,6 +75,8 @@ void qemu_register_wakeup_notifier(Notifier *notifier);
> >>   void qemu_system_shutdown_request(ShutdownCause reason);
> >>   void qemu_system_powerdown_request(void);
> >>   void qemu_register_powerdown_notifier(Notifier *notifier);
> >> +void qemu_system_sleep_request(void);
> >> +void qemu_register_sleep_notifier(Notifier *notifier);
> >>   void qemu_system_debug_request(void);
> >>   void qemu_system_vmstop_request(RunState reason);
> >>   void qemu_system_vmstop_request_prepare(void);
> >> diff --git a/qapi-schema.json b/qapi-schema.json
> >> index 8b015bee2e..c6ccfcd70f 100644
> >> --- a/qapi-schema.json
> >> +++ b/qapi-schema.json
> >> @@ -2314,6 +2314,18 @@
> >>   { 'command': 'system_reset' }
> >>   
> >>   ##
> >> +# @system_sleep:
> >> +#
> >> +# Requests that a guest perform a ACPI sleep transition by pushing a virtual
> >> +# sleep button.
> >> +#
> >> +# Notes: A guest may or may not respond to this command.  This command
> >> +#        returning does not indicate that a guest has accepted the request or
> >> +#        that it has gone to sleep.
> >> +##
> >> +{ 'command': 'system_sleep' }
> >> +
> >> +##
> >>   # @system_powerdown:
> >>   #
> >>   # Requests that a guest perform a powerdown operation.
> >> diff --git a/qmp.c b/qmp.c
> >> index b86201e349..bc1f2e3d7f 100644
> >> --- a/qmp.c
> >> +++ b/qmp.c
> >> @@ -108,6 +108,11 @@ void qmp_system_reset(Error **errp)
> >>       qemu_system_reset_request(SHUTDOWN_CAUSE_HOST_QMP);
> >>   }
> >>   
> >> +void qmp_system_sleep(Error **erp)
> >> +{
> >> +    qemu_system_sleep_request();
> >> +}
> >> +
> >>   void qmp_system_powerdown(Error **erp)
> >>   {
> >>       qemu_system_powerdown_request();
> >> diff --git a/tests/test-hmp.c b/tests/test-hmp.c
> >> index d77b3c8710..3fa850bf1e 100644
> >> --- a/tests/test-hmp.c
> >> +++ b/tests/test-hmp.c
> >> @@ -67,6 +67,7 @@ static const char *hmp_cmds[] = {
> >>       "sum 0 512",
> >>       "x /8i 0x100",
> >>       "xp /16x 0",
> >> +    "system_sleep",
> >>       NULL
> >>   };
> >>   
> >> diff --git a/vl.c b/vl.c
> >> index fb6b2efafa..6a0f847dcf 100644
> >> --- a/vl.c
> >> +++ b/vl.c
> >> @@ -1608,6 +1608,7 @@ static ShutdownCause reset_requested;
> >>   static ShutdownCause shutdown_requested;
> >>   static int shutdown_signal;
> >>   static pid_t shutdown_pid;
> >> +static int sleep_requested;
> >>   static int powerdown_requested;
> >>   static int debug_requested;
> >>   static int suspend_requested;
> >> @@ -1618,6 +1619,8 @@ static NotifierList suspend_notifiers =
> >>       NOTIFIER_LIST_INITIALIZER(suspend_notifiers);
> >>   static NotifierList wakeup_notifiers =
> >>       NOTIFIER_LIST_INITIALIZER(wakeup_notifiers);
> >> +static NotifierList sleep_notifiers =
> >> +    NOTIFIER_LIST_INITIALIZER(sleep_notifiers);
> >>   static uint32_t wakeup_reason_mask = ~(1 << QEMU_WAKEUP_REASON_NONE);
> >>   
> >>   ShutdownCause qemu_shutdown_requested_get(void)
> >> @@ -1838,6 +1841,24 @@ static void qemu_system_powerdown(void)
> >>       notifier_list_notify(&powerdown_notifiers, NULL);
> >>   }
> >>   
> >> +static void qemu_system_sleep(void)
> >> +{
> >> +    notifier_list_notify(&sleep_notifiers, NULL);
> >> +}
> >> +
> >> +static int qemu_sleep_requested(void)
> >> +{
> >> +    int r = sleep_requested;
> >> +    sleep_requested = 0;
> >> +    return r;
> >> +}
> >> +
> >> +void qemu_system_sleep_request(void)
> >> +{
> >> +    sleep_requested = 1;
> >> +    qemu_notify_event();
> >> +}
> >> +
> >>   void qemu_system_powerdown_request(void)
> >>   {
> >>       trace_qemu_system_powerdown_request();
> >> @@ -1850,6 +1871,11 @@ void qemu_register_powerdown_notifier(Notifier *notifier)
> >>       notifier_list_add(&powerdown_notifiers, notifier);
> >>   }
> >>   
> >> +void qemu_register_sleep_notifier(Notifier *notifier)
> >> +{
> >> +    notifier_list_add(&sleep_notifiers, notifier);
> >> +}
> >> +
> >>   void qemu_system_debug_request(void)
> >>   {
> >>       debug_requested = 1;
> >> @@ -1899,6 +1925,9 @@ static bool main_loop_should_exit(void)
> >>       if (qemu_powerdown_requested()) {
> >>           qemu_system_powerdown();
> >>       }
> >> +    if (qemu_sleep_requested()) {
> >> +        qemu_system_sleep();
> >> +    }
> >>       if (qemu_vmstop_requested(&r)) {
> >>           vm_stop(r);
> >>       }  
> 


