Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA812B32CD
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 08:04:40 +0100 (CET)
Received: from localhost ([::1]:44146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keC5X-00005m-I7
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 02:04:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1keC3s-0007tW-Sw
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 02:02:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1keC3o-0006Ds-Gv
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 02:02:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605423770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lsUCpeuRHZF8acA8BDnsIuSnKs7aLULMhD6CNVrKv20=;
 b=UWaScm+IA4oTFwfO73OEx185Asn1QnKREdbDVdvQf8r0/mFSwUnA4tSPG8NMEuWL7tjp6V
 61Vn6KvYYDDX2pPLBiRAPwBWQlbZIAMv9FxLxn/an5sV7fKPLNB2rw4TbNtOWG/OBzvITX
 /6IPs+42PoAzCFo1oJcL9NJmwUfDLss=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-18W5T5bvNba4cK0UNj1aEw-1; Sun, 15 Nov 2020 02:02:49 -0500
X-MC-Unique: 18W5T5bvNba4cK0UNj1aEw-1
Received: by mail-wr1-f71.google.com with SMTP id z7so7499357wrl.14
 for <qemu-devel@nongnu.org>; Sat, 14 Nov 2020 23:02:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lsUCpeuRHZF8acA8BDnsIuSnKs7aLULMhD6CNVrKv20=;
 b=JzZY7Um0kF1g0yWFULiVmnhdmVaLViVlx+WBgcO9ifVqusTo7JspFUQYW8ZRkoiz1k
 jVlSvgBHNqzSZlKZdMita+P2z34UtufcZ3Jwm4u4W2BY9V9UKQXPjCcUZ51nQivitPNC
 UdgU8hbXFXNYUt9LwKdXhSU50Caq5+8G2Vk0K/OxMd5LgSq4SQ89yitmCQpqMSjEYnug
 zRS0KbcgE6g+xbt56Ina48JquBPuQ6cVR5n4pisfII0X2/ZfxXLvtrZeF0KZ/1TTz5cT
 /hCgvy7DS0w1lCwU4UFtP7K/N9GrnU6W7J07igwb3ngxPoUC5gwTxaW/m8yZ8pEypOAb
 5duQ==
X-Gm-Message-State: AOAM533+aefFNHn+KvO9KYsIBtqiF3cHinPDHAzga/QIeCMP5ybsT/PD
 ZZfW9GragZUiVS5HsSz7+VPmIlN42qSurDS2xEccpdWIkNjSwsymPPSSRvuZwuaFjwuywYBx0sF
 a43ABNUC0zN6T0ww=
X-Received: by 2002:adf:f3d2:: with SMTP id g18mr13404020wrp.77.1605423767754; 
 Sat, 14 Nov 2020 23:02:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvPYihtBdPgbQNZ+krh4Sn8nKMZMNGOys50oY4DAIAY2jEg4CtHgyQI8ZEGee0+fCO4aGcpA==
X-Received: by 2002:adf:f3d2:: with SMTP id g18mr13403987wrp.77.1605423767410; 
 Sat, 14 Nov 2020 23:02:47 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id g131sm15996459wma.35.2020.11.14.23.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Nov 2020 23:02:46 -0800 (PST)
Date: Sun, 15 Nov 2020 02:02:43 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH] hw: add compat machines for 6.0
Message-ID: <20201115020234-mutt-send-email-mst@kernel.org>
References: <20201109173928.1001764-1-cohuck@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201109173928.1001764-1-cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 02:02:50
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 09, 2020 at 06:39:28PM +0100, Cornelia Huck wrote:
> Add 6.0 machine types for arm/i440fx/q35/s390x/spapr.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>

pc part

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  hw/arm/virt.c              |  9 ++++++++-
>  hw/core/machine.c          |  3 +++
>  hw/i386/pc.c               |  3 +++
>  hw/i386/pc_piix.c          | 14 +++++++++++++-
>  hw/i386/pc_q35.c           | 13 ++++++++++++-
>  hw/ppc/spapr.c             | 15 +++++++++++++--
>  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>  include/hw/boards.h        |  3 +++
>  include/hw/i386/pc.h       |  3 +++
>  9 files changed, 71 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 27dbeb549ef1..d21dad4491c4 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2587,10 +2587,17 @@ static void machvirt_machine_init(void)
>  }
>  type_init(machvirt_machine_init);
>  
> +static void virt_machine_6_0_options(MachineClass *mc)
> +{
> +}
> +DEFINE_VIRT_MACHINE_AS_LATEST(6, 0)
> +
>  static void virt_machine_5_2_options(MachineClass *mc)
>  {
> +    virt_machine_6_0_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
>  }
> -DEFINE_VIRT_MACHINE_AS_LATEST(5, 2)
> +DEFINE_VIRT_MACHINE(5, 2)
>  
>  static void virt_machine_5_1_options(MachineClass *mc)
>  {
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 98b87f76cbbe..c5a6c517bb9d 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -28,6 +28,9 @@
>  #include "hw/mem/nvdimm.h"
>  #include "migration/vmstate.h"
>  
> +GlobalProperty hw_compat_5_2[] = {};
> +const size_t hw_compat_5_2_len = G_N_ELEMENTS(hw_compat_5_2);
> +
>  GlobalProperty hw_compat_5_1[] = {
>      { "vhost-scsi", "num_queues", "1"},
>      { "vhost-user-blk", "num-queues", "1"},
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 5e6c0023e0c7..d386c5662698 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -97,6 +97,9 @@
>  #include "trace.h"
>  #include CONFIG_DEVICES
>  
> +GlobalProperty pc_compat_5_2[] = {};
> +const size_t pc_compat_5_2_len = G_N_ELEMENTS(pc_compat_5_2);
> +
>  GlobalProperty pc_compat_5_1[] = {
>      { "ICH9-LPC", "x-smi-cpu-hotplug", "off" },
>  };
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 13d1628f13bf..6188c3e97eaf 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -426,7 +426,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
>      machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
>  }
>  
> -static void pc_i440fx_5_2_machine_options(MachineClass *m)
> +static void pc_i440fx_6_0_machine_options(MachineClass *m)
>  {
>      PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>      pc_i440fx_machine_options(m);
> @@ -435,6 +435,18 @@ static void pc_i440fx_5_2_machine_options(MachineClass *m)
>      pcmc->default_cpu_version = 1;
>  }
>  
> +DEFINE_I440FX_MACHINE(v6_0, "pc-i440fx-6.0", NULL,
> +                      pc_i440fx_6_0_machine_options);
> +
> +static void pc_i440fx_5_2_machine_options(MachineClass *m)
> +{
> +    pc_i440fx_6_0_machine_options(m);
> +    m->alias = NULL;
> +    m->is_default = false;
> +    compat_props_add(m->compat_props, hw_compat_5_2, hw_compat_5_2_len);
> +    compat_props_add(m->compat_props, pc_compat_5_2, pc_compat_5_2_len);
> +}
> +
>  DEFINE_I440FX_MACHINE(v5_2, "pc-i440fx-5.2", NULL,
>                        pc_i440fx_5_2_machine_options);
>  
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index a3f4959c4357..0a212443aa84 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -344,7 +344,7 @@ static void pc_q35_machine_options(MachineClass *m)
>      m->max_cpus = 288;
>  }
>  
> -static void pc_q35_5_2_machine_options(MachineClass *m)
> +static void pc_q35_6_0_machine_options(MachineClass *m)
>  {
>      PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>      pc_q35_machine_options(m);
> @@ -352,6 +352,17 @@ static void pc_q35_5_2_machine_options(MachineClass *m)
>      pcmc->default_cpu_version = 1;
>  }
>  
> +DEFINE_Q35_MACHINE(v6_0, "pc-q35-6.0", NULL,
> +                   pc_q35_6_0_machine_options);
> +
> +static void pc_q35_5_2_machine_options(MachineClass *m)
> +{
> +    pc_q35_6_0_machine_options(m);
> +    m->alias = NULL;
> +    compat_props_add(m->compat_props, hw_compat_5_2, hw_compat_5_2_len);
> +    compat_props_add(m->compat_props, pc_compat_5_2, pc_compat_5_2_len);
> +}
> +
>  DEFINE_Q35_MACHINE(v5_2, "pc-q35-5.2", NULL,
>                     pc_q35_5_2_machine_options);
>  
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 227075103e9a..45e0afbeba49 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4515,15 +4515,26 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
>      }                                                                \
>      type_init(spapr_machine_register_##suffix)
>  
> +/*
> + * pseries-6.0
> + */
> +static void spapr_machine_6_0_class_options(MachineClass *mc)
> +{
> +    /* Defaults for the latest behaviour inherited from the base class */
> +}
> +
> +DEFINE_SPAPR_MACHINE(6_0, "6.0", true);
> +
>  /*
>   * pseries-5.2
>   */
>  static void spapr_machine_5_2_class_options(MachineClass *mc)
>  {
> -    /* Defaults for the latest behaviour inherited from the base class */
> +    spapr_machine_6_0_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
>  }
>  
> -DEFINE_SPAPR_MACHINE(5_2, "5.2", true);
> +DEFINE_SPAPR_MACHINE(5_2, "5.2", false);
>  
>  /*
>   * pseries-5.1
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index 22222c4fd5ad..b1229abc3134 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -785,14 +785,26 @@ bool css_migration_enabled(void)
>      }                                                                         \
>      type_init(ccw_machine_register_##suffix)
>  
> +static void ccw_machine_6_0_instance_options(MachineState *machine)
> +{
> +}
> +
> +static void ccw_machine_6_0_class_options(MachineClass *mc)
> +{
> +}
> +DEFINE_CCW_MACHINE(6_0, "6.0", true);
> +
>  static void ccw_machine_5_2_instance_options(MachineState *machine)
>  {
> +    ccw_machine_6_0_instance_options(machine);
>  }
>  
>  static void ccw_machine_5_2_class_options(MachineClass *mc)
>  {
> +    ccw_machine_6_0_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
>  }
> -DEFINE_CCW_MACHINE(5_2, "5.2", true);
> +DEFINE_CCW_MACHINE(5_2, "5.2", false);
>  
>  static void ccw_machine_5_1_instance_options(MachineState *machine)
>  {
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index a49e3a6b4481..f94f4ad5d83c 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -310,6 +310,9 @@ struct MachineState {
>      } \
>      type_init(machine_initfn##_register_types)
>  
> +extern GlobalProperty hw_compat_5_2[];
> +extern const size_t hw_compat_5_2_len;
> +
>  extern GlobalProperty hw_compat_5_1[];
>  extern const size_t hw_compat_5_1_len;
>  
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 911e4600970c..49dfa667de09 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -191,6 +191,9 @@ void pc_system_firmware_init(PCMachineState *pcms, MemoryRegion *rom_memory);
>  void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
>                         const CPUArchIdList *apic_ids, GArray *entry);
>  
> +extern GlobalProperty pc_compat_5_2[];
> +extern const size_t pc_compat_5_2_len;
> +
>  extern GlobalProperty pc_compat_5_1[];
>  extern const size_t pc_compat_5_1_len;
>  
> -- 
> 2.26.2


