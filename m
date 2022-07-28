Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA8B584084
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 16:04:46 +0200 (CEST)
Received: from localhost ([::1]:36564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH485-0004Oz-94
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 10:04:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oH3ki-0006al-Si
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:40:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oH3kd-0004bb-Ne
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:40:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659015631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kxj4JLTufXMOW7MF/TTSGWnGvlpT5sG8ft83+erZ6f0=;
 b=BT8xOi8OpCur4xpjCiqr+Vxbqzog2lb+q0eR/HcJAgiAs8trUlp6MvDP2siSSsscMBZfVA
 gRQq5elKZISr+wOceUbW8EGXRJzLU9SKEsQJ2FhYrrgWZwTOCLbF/l/tqDjzfBePxRp91h
 s11vhoweaZbApT4oNeHd5+2fRz+Zfvc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-VZnSKLlIPbq_VwvIhQLpeQ-1; Thu, 28 Jul 2022 09:40:28 -0400
X-MC-Unique: VZnSKLlIPbq_VwvIhQLpeQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 hb41-20020a170907162900b0072f044ca263so639180ejc.15
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 06:40:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=kxj4JLTufXMOW7MF/TTSGWnGvlpT5sG8ft83+erZ6f0=;
 b=pUAQu1yazUdFPbrMlA+DCtQqDS5gL35LVfOmtYKZ0CI+0AEdTR6SY9QEg9N8Gvs/gR
 2J6TvCPrRAM/HHfGSr9AiZkZ72lFeGYXDr0y8NxSmVOdOv+srKYKyIuwwi7hEZ9/Z5EK
 lMpcAm0okimcqWg0qJteq1fsWdfoySWUepluK+Kq6GvhXRrFCF51UKt4N1l3r7+ZrlBD
 lIL2qBS/ktu8cbwEART2LF8IBmb6oza517ncM4ISFm3UObf44AQcNK5HFTeAO8/Jmjjz
 yual21yI8sW8is8Ixfl59+60z6Lu2D4qVhBar7wodXDC2jYOj90g5oEDvq/iDghGgUve
 e0bw==
X-Gm-Message-State: AJIora927Xg6wzbaSF6gqYOXdMSffRN6lgRCP0UMVr9eA+cDb3pG3qC6
 Q2coJ/b5o1zwJ0O6JsJwfkLcXO2u5amOwt1hKFwF7maCODALe1gP1nqe8ouCBe9w91mTFq7RmEV
 Q0qalirgg3toVIPo=
X-Received: by 2002:a05:6402:538a:b0:43a:298e:bc2b with SMTP id
 ew10-20020a056402538a00b0043a298ebc2bmr27290344edb.125.1659015627015; 
 Thu, 28 Jul 2022 06:40:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uqahCf3tywrCvvDxwVjsM5Y/HWf+mi1HpxjCkVmFF+qcq1z6pwTW2mnnVMp54ifZT3Y5r5lw==
X-Received: by 2002:a05:6402:538a:b0:43a:298e:bc2b with SMTP id
 ew10-20020a056402538a00b0043a298ebc2bmr27290309edb.125.1659015626468; 
 Thu, 28 Jul 2022 06:40:26 -0700 (PDT)
Received: from redhat.com ([2.54.183.236]) by smtp.gmail.com with ESMTPSA id
 fl19-20020a1709072a9300b007052b183d51sm425045ejc.132.2022.07.28.06.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 06:40:25 -0700 (PDT)
Date: Thu, 28 Jul 2022 09:40:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Greg Kurz <groug@kaod.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
Subject: Re: [PATCH for-7.2] hw: Add compat machines for 7.2
Message-ID: <20220728094004-mutt-send-email-mst@kernel.org>
References: <20220727121755.395894-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727121755.395894-1-cohuck@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 27, 2022 at 02:17:55PM +0200, Cornelia Huck wrote:
> Add 7.2 machine types for arm/i440fx/m68k/q35/s390x/spapr.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

whoever needs this first, feel free to merge.

> ---
>  hw/arm/virt.c              |  9 ++++++++-
>  hw/core/machine.c          |  3 +++
>  hw/i386/pc.c               |  3 +++
>  hw/i386/pc_piix.c          | 14 +++++++++++++-
>  hw/i386/pc_q35.c           | 13 ++++++++++++-
>  hw/m68k/virt.c             |  9 ++++++++-
>  hw/ppc/spapr.c             | 15 +++++++++++++--
>  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>  include/hw/boards.h        |  3 +++
>  include/hw/i386/pc.h       |  3 +++
>  10 files changed, 79 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 9633f822f361..1a6480fd2a76 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -3094,10 +3094,17 @@ static void machvirt_machine_init(void)
>  }
>  type_init(machvirt_machine_init);
>  
> +static void virt_machine_7_2_options(MachineClass *mc)
> +{
> +}
> +DEFINE_VIRT_MACHINE_AS_LATEST(7, 2)
> +
>  static void virt_machine_7_1_options(MachineClass *mc)
>  {
> +    virt_machine_7_2_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_7_1, hw_compat_7_1_len);
>  }
> -DEFINE_VIRT_MACHINE_AS_LATEST(7, 1)
> +DEFINE_VIRT_MACHINE(7, 1)
>  
>  static void virt_machine_7_0_options(MachineClass *mc)
>  {
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index a673302ccec5..aa520e74a8c8 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -40,6 +40,9 @@
>  #include "hw/virtio/virtio-pci.h"
>  #include "qom/object_interfaces.h"
>  
> +GlobalProperty hw_compat_7_1[] = {};
> +const size_t hw_compat_7_1_len = G_N_ELEMENTS(hw_compat_7_1);
> +
>  GlobalProperty hw_compat_7_0[] = {
>      { "arm-gicv3-common", "force-8-bit-prio", "on" },
>      { "nvme-ns", "eui64-default", "on"},
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 774cb2bf0748..31724c42ac90 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -107,6 +107,9 @@
>      { "qemu64-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },\
>      { "athlon-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },
>  
> +GlobalProperty pc_compat_7_1[] = {};
> +const size_t pc_compat_7_1_len = G_N_ELEMENTS(pc_compat_7_1);
> +
>  GlobalProperty pc_compat_7_0[] = {};
>  const size_t pc_compat_7_0_len = G_N_ELEMENTS(pc_compat_7_0);
>  
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index a234989ac363..34fa0021c7be 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -424,7 +424,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
>      machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
>  }
>  
> -static void pc_i440fx_7_1_machine_options(MachineClass *m)
> +static void pc_i440fx_7_2_machine_options(MachineClass *m)
>  {
>      PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>      pc_i440fx_machine_options(m);
> @@ -433,6 +433,18 @@ static void pc_i440fx_7_1_machine_options(MachineClass *m)
>      pcmc->default_cpu_version = 1;
>  }
>  
> +DEFINE_I440FX_MACHINE(v7_2, "pc-i440fx-7.2", NULL,
> +                      pc_i440fx_7_2_machine_options);
> +
> +static void pc_i440fx_7_1_machine_options(MachineClass *m)
> +{
> +    pc_i440fx_7_2_machine_options(m);
> +    m->alias = NULL;
> +    m->is_default = false;
> +    compat_props_add(m->compat_props, hw_compat_7_1, hw_compat_7_1_len);
> +    compat_props_add(m->compat_props, pc_compat_7_1, pc_compat_7_1_len);
> +}
> +
>  DEFINE_I440FX_MACHINE(v7_1, "pc-i440fx-7.1", NULL,
>                        pc_i440fx_7_1_machine_options);
>  
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index f96cbd04e284..38634cd11413 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -362,7 +362,7 @@ static void pc_q35_machine_options(MachineClass *m)
>      m->max_cpus = 288;
>  }
>  
> -static void pc_q35_7_1_machine_options(MachineClass *m)
> +static void pc_q35_7_2_machine_options(MachineClass *m)
>  {
>      PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>      pc_q35_machine_options(m);
> @@ -370,6 +370,17 @@ static void pc_q35_7_1_machine_options(MachineClass *m)
>      pcmc->default_cpu_version = 1;
>  }
>  
> +DEFINE_Q35_MACHINE(v7_2, "pc-q35-7.2", NULL,
> +                   pc_q35_7_2_machine_options);
> +
> +static void pc_q35_7_1_machine_options(MachineClass *m)
> +{
> +    pc_q35_7_2_machine_options(m);
> +    m->alias = NULL;
> +    compat_props_add(m->compat_props, hw_compat_7_1, hw_compat_7_1_len);
> +    compat_props_add(m->compat_props, pc_compat_7_1, pc_compat_7_1_len);
> +}
> +
>  DEFINE_Q35_MACHINE(v7_1, "pc-q35-7.1", NULL,
>                     pc_q35_7_1_machine_options);
>  
> diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
> index 0aa383fa6bda..3122c8ef2c38 100644
> --- a/hw/m68k/virt.c
> +++ b/hw/m68k/virt.c
> @@ -322,10 +322,17 @@ type_init(virt_machine_register_types)
>      } \
>      type_init(machvirt_machine_##major##_##minor##_init);
>  
> +static void virt_machine_7_2_options(MachineClass *mc)
> +{
> +}
> +DEFINE_VIRT_MACHINE(7, 2, true)
> +
>  static void virt_machine_7_1_options(MachineClass *mc)
>  {
> +    virt_machine_7_2_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_7_1, hw_compat_7_1_len);
>  }
> -DEFINE_VIRT_MACHINE(7, 1, true)
> +DEFINE_VIRT_MACHINE(7, 1, false)
>  
>  static void virt_machine_7_0_options(MachineClass *mc)
>  {
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index bc9ba6e6dcf2..fb790b61e442 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4730,15 +4730,26 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
>      }                                                                \
>      type_init(spapr_machine_register_##suffix)
>  
> +/*
> + * pseries-7.2
> + */
> +static void spapr_machine_7_2_class_options(MachineClass *mc)
> +{
> +    /* Defaults for the latest behaviour inherited from the base class */
> +}
> +
> +DEFINE_SPAPR_MACHINE(7_2, "7.2", true);
> +
>  /*
>   * pseries-7.1
>   */
>  static void spapr_machine_7_1_class_options(MachineClass *mc)
>  {
> -    /* Defaults for the latest behaviour inherited from the base class */
> +    spapr_machine_7_2_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_7_1, hw_compat_7_1_len);
>  }
>  
> -DEFINE_SPAPR_MACHINE(7_1, "7.1", true);
> +DEFINE_SPAPR_MACHINE(7_1, "7.1", false);
>  
>  /*
>   * pseries-7.0
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index cc3097bfee80..bf1b36d824db 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -792,14 +792,26 @@ bool css_migration_enabled(void)
>      }                                                                         \
>      type_init(ccw_machine_register_##suffix)
>  
> +static void ccw_machine_7_2_instance_options(MachineState *machine)
> +{
> +}
> +
> +static void ccw_machine_7_2_class_options(MachineClass *mc)
> +{
> +}
> +DEFINE_CCW_MACHINE(7_2, "7.2", true);
> +
>  static void ccw_machine_7_1_instance_options(MachineState *machine)
>  {
> +    ccw_machine_7_2_instance_options(machine);
>  }
>  
>  static void ccw_machine_7_1_class_options(MachineClass *mc)
>  {
> +    ccw_machine_7_2_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_7_1, hw_compat_7_1_len);
>  }
> -DEFINE_CCW_MACHINE(7_1, "7.1", true);
> +DEFINE_CCW_MACHINE(7_1, "7.1", false);
>  
>  static void ccw_machine_7_0_instance_options(MachineState *machine)
>  {
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index d94edcef2883..487243a39c84 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -380,6 +380,9 @@ struct MachineState {
>      } \
>      type_init(machine_initfn##_register_types)
>  
> +extern GlobalProperty hw_compat_7_1[];
> +extern const size_t hw_compat_7_1_len;
> +
>  extern GlobalProperty hw_compat_7_0[];
>  extern const size_t hw_compat_7_0_len;
>  
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index b7735dccfc81..4517fa08f2e9 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -195,6 +195,9 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
>  /* sgx.c */
>  void pc_machine_init_sgx_epc(PCMachineState *pcms);
>  
> +extern GlobalProperty pc_compat_7_1[];
> +extern const size_t pc_compat_7_1_len;
> +
>  extern GlobalProperty pc_compat_7_0[];
>  extern const size_t pc_compat_7_0_len;
>  
> -- 
> 2.35.3


