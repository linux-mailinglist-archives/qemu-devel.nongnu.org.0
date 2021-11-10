Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DEE44C25F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 14:48:22 +0100 (CET)
Received: from localhost ([::1]:34236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mknxd-0001x9-UK
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 08:48:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mknun-00075w-Tr
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 08:45:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mknuk-0004cu-8d
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 08:45:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636551920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r8Fy89rvq9DVqoNbJdTOKetA2BT3ILnOxwLnHjSfY3s=;
 b=iZCW1ei1Xcfl+P3RPOsawrQ6xSWu3kV93TwmzUP6WbHWwpWQbK21fyEzQuvBRydnqRJXaC
 Dl/rU7met2WabVHdd2V+5NbHKavPeF7P1Q6wJMfNQG3Nag8WeJ9aMcJmfX6d0H8CBsZ0zG
 3NsTSLdCaFy3xugMJcgglnNDOB+iR30=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-cvR5r_brNIq9wcC0l-Omyg-1; Wed, 10 Nov 2021 08:45:14 -0500
X-MC-Unique: cvR5r_brNIq9wcC0l-Omyg-1
Received: by mail-wm1-f69.google.com with SMTP id
 o18-20020a05600c511200b00332fa17a02eso1210151wms.5
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 05:45:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r8Fy89rvq9DVqoNbJdTOKetA2BT3ILnOxwLnHjSfY3s=;
 b=3V3My15ggbMXpu+gz9V2VN/jPofqXEk19dXWNGVTK0H+Q1uUDl/IPochsWYNOKhNhT
 QwmvpzH66axHDz84dzJFumZ36TPpKCoEsGG/PhsZttWT7gO0SutyIjRxrgVx36rZzdcS
 G9zVQAjYa7ZgzYSfkjM/rRV70JXZzGpipV8k5BvQX0TJna01WB4GFN5AqVc25uWujJO3
 q3BK4IfrnBZDCm6yRGKZ6/pimwbwyqawaR6KNoE2a+6g7cPpMljNpQFcymzju3SON/4W
 qXUy7PUyblgYD8eYOm+K+6C7NLz+xckEUSUXh6Q9Q08f0g9WC6HHK3PjZNOq6TKoKV21
 bqSQ==
X-Gm-Message-State: AOAM531z6nTkdtAPLL4FID2W+GXvqDf81fouSbyfPqdfZS3oGKL41ghK
 yFLme9h9V140sEq5cOpe/Ra/NFt6KO5DkVpJ8nO9FugwwrDlXBnTqZ0H07dOJ4e932JaSUQUGGB
 4Vt9CsOyISEUPCEo=
X-Received: by 2002:a1c:e90a:: with SMTP id q10mr16686375wmc.108.1636551913051; 
 Wed, 10 Nov 2021 05:45:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxOE54d3/5nGnIjNvsXJY5BSrszF5pkY0+qU/wKinlfbSOeO7kVaBdEg9d6EnvpBqrj8I7r5Q==
X-Received: by 2002:a1c:e90a:: with SMTP id q10mr16686326wmc.108.1636551912715; 
 Wed, 10 Nov 2021 05:45:12 -0800 (PST)
Received: from localhost ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id n32sm6619520wms.1.2021.11.10.05.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 05:45:12 -0800 (PST)
Date: Wed, 10 Nov 2021 14:45:11 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Julia Suvorova <jusual@redhat.com>
Subject: Re: [PATCH 2/5] hw/acpi/ich9: Add compatibility option for
 'native-hpc-bit'
Message-ID: <20211110144511.04e9b79c@redhat.com>
In-Reply-To: <20211110143354.0c14aef0@redhat.com>
References: <20211110053014.489591-1-jusual@redhat.com>
 <20211110053014.489591-3-jusual@redhat.com>
 <20211110143354.0c14aef0@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Marcel Apfelbaum <mapfelba@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 10 Nov 2021 14:33:54 +0100
Igor Mammedov <imammedo@redhat.com> wrote:

> On Wed, 10 Nov 2021 06:30:11 +0100
> Julia Suvorova <jusual@redhat.com> wrote:
> 
> > To solve issues [1-2] the Hot Plug Capable bit in PCIe Slots will be
> > turned on, while the switch to ACPI Hot-plug will be done in the
> > DSDT table.
> > 
> > Introducing 'x-keep-native-hpc' option disables the HPC bit only
> > in 6.1 and as a result keeps the forced 'reserve-io' on
> > pcie-root-ports in 6.1 too.  
> 
> using property from the 1st patch (native-hotplug),
> should be enough to keep 6.1 ABI, so this patch is likely
> not needed.

scratch this off, it's conditional on acpihp which
compat machinery can't handle.

> 
> > 
> > [1] https://gitlab.com/qemu-project/qemu/-/issues/641
> > [2] https://bugzilla.redhat.com/show_bug.cgi?id=2006409
> > 
> > Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > ---
> >  include/hw/acpi/ich9.h |  1 +
> >  hw/acpi/ich9.c         | 18 ++++++++++++++++++
> >  hw/i386/pc.c           |  2 ++
> >  hw/i386/pc_q35.c       |  7 ++++++-
> >  4 files changed, 27 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
> > index f04f1791bd..7ca92843c6 100644
> > --- a/include/hw/acpi/ich9.h
> > +++ b/include/hw/acpi/ich9.h
> > @@ -56,6 +56,7 @@ typedef struct ICH9LPCPMRegs {
> >      AcpiCpuHotplug gpe_cpu;
> >      CPUHotplugState cpuhp_state;
> >  
> > +    bool keep_pci_slot_hpc;
> >      bool use_acpi_hotplug_bridge;
> >      AcpiPciHpState acpi_pci_hotplug;
> >      MemHotplugState acpi_memory_hotplug;
> > diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> > index 1ee2ba2c50..ebe08ed831 100644
> > --- a/hw/acpi/ich9.c
> > +++ b/hw/acpi/ich9.c
> > @@ -419,6 +419,20 @@ static void ich9_pm_set_acpi_pci_hotplug(Object *obj, bool value, Error **errp)
> >      s->pm.use_acpi_hotplug_bridge = value;
> >  }
> >  
> > +static bool ich9_pm_get_keep_pci_slot_hpc(Object *obj, Error **errp)
> > +{
> > +    ICH9LPCState *s = ICH9_LPC_DEVICE(obj);
> > +
> > +    return s->pm.keep_pci_slot_hpc;
> > +}
> > +
> > +static void ich9_pm_set_keep_pci_slot_hpc(Object *obj, bool value, Error **errp)
> > +{
> > +    ICH9LPCState *s = ICH9_LPC_DEVICE(obj);
> > +
> > +    s->pm.keep_pci_slot_hpc = value;
> > +}
> > +
> >  void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
> >  {
> >      static const uint32_t gpe0_len = ICH9_PMIO_GPE0_LEN;
> > @@ -428,6 +442,7 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
> >      pm->disable_s4 = 0;
> >      pm->s4_val = 2;
> >      pm->use_acpi_hotplug_bridge = true;
> > +    pm->keep_pci_slot_hpc = true;
> >  
> >      object_property_add_uint32_ptr(obj, ACPI_PM_PROP_PM_IO_BASE,
> >                                     &pm->pm_io_base, OBJ_PROP_FLAG_READ);
> > @@ -454,6 +469,9 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
> >      object_property_add_bool(obj, ACPI_PM_PROP_ACPI_PCIHP_BRIDGE,
> >                               ich9_pm_get_acpi_pci_hotplug,
> >                               ich9_pm_set_acpi_pci_hotplug);
> > +    object_property_add_bool(obj, "x-keep-pci-slot-hpc",
> > +                             ich9_pm_get_keep_pci_slot_hpc,
> > +                             ich9_pm_set_keep_pci_slot_hpc);
> >  }
> >  
> >  void ich9_pm_device_pre_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
> > diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> > index 2592a82148..a2ef40ecbc 100644
> > --- a/hw/i386/pc.c
> > +++ b/hw/i386/pc.c
> > @@ -98,6 +98,7 @@ GlobalProperty pc_compat_6_1[] = {
> >      { TYPE_X86_CPU, "hv-version-id-build", "0x1bbc" },
> >      { TYPE_X86_CPU, "hv-version-id-major", "0x0006" },
> >      { TYPE_X86_CPU, "hv-version-id-minor", "0x0001" },
> > +    { "ICH9-LPC", "x-keep-pci-slot-hpc", "false" },
> >  };
> >  const size_t pc_compat_6_1_len = G_N_ELEMENTS(pc_compat_6_1);
> >  
> > @@ -107,6 +108,7 @@ GlobalProperty pc_compat_6_0[] = {
> >      { "qemu64" "-" TYPE_X86_CPU, "stepping", "3" },
> >      { TYPE_X86_CPU, "x-vendor-cpuid-only", "off" },
> >      { "ICH9-LPC", ACPI_PM_PROP_ACPI_PCIHP_BRIDGE, "off" },
> > +    { "ICH9-LPC", "x-keep-pci-slot-hpc", "true" },
> >  };
> >  const size_t pc_compat_6_0_len = G_N_ELEMENTS(pc_compat_6_0);
> >  
> > diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> > index ded61f8ef7..06f09dfcc6 100644
> > --- a/hw/i386/pc_q35.c
> > +++ b/hw/i386/pc_q35.c
> > @@ -137,6 +137,7 @@ static void pc_q35_init(MachineState *machine)
> >      DriveInfo *hd[MAX_SATA_PORTS];
> >      MachineClass *mc = MACHINE_GET_CLASS(machine);
> >      bool acpi_pcihp;
> > +    bool keep_pci_slot_hpc;
> >  
> >      /* Check whether RAM fits below 4G (leaving 1/2 GByte for IO memory
> >       * and 256 Mbytes for PCI Express Enhanced Configuration Access Mapping
> > @@ -242,7 +243,11 @@ static void pc_q35_init(MachineState *machine)
> >                                            ACPI_PM_PROP_ACPI_PCIHP_BRIDGE,
> >                                            NULL);
> >  
> > -    if (acpi_pcihp) {
> > +    keep_pci_slot_hpc = object_property_get_bool(OBJECT(lpc),
> > +                                                 "x-keep-pci-slot-hpc",
> > +                                                 NULL);
> > +
> > +    if (!keep_pci_slot_hpc && acpi_pcihp) {
> >          object_register_sugar_prop(TYPE_PCIE_SLOT, "native-hpc-bit",
> >                                     "false", true);
> >      }  
> 


