Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 749DF66C45A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 16:53:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHRle-0006P9-TV; Mon, 16 Jan 2023 10:51:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pHRlc-0006Ok-UX
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 10:51:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pHRlb-0003fR-5Y
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 10:51:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673884282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mgrduK0vdG5RdklEwTnsWAWcaWhuwL7lCF629mSwpM0=;
 b=OvQS2CaenITtL/NvuKKnDG1MV62yodJb6HgafisoWQSfrh1dKN2hPj42DpXHTx/QiPg3yl
 9U+lsxP0UCslQmMtZ+77F8WkV6KkWDDdBwLfaifyjlSoCrqkthvrC8xVVG5TGodvCPT105
 sxLyargMBrQpZn5dJojF8w0QK/66v1Q=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-93-3mjyKvi9MEGaF7SMftn4AA-1; Mon, 16 Jan 2023 10:51:20 -0500
X-MC-Unique: 3mjyKvi9MEGaF7SMftn4AA-1
Received: by mail-ej1-f71.google.com with SMTP id
 sb39-20020a1709076da700b0086b1cfb06f0so5779682ejc.4
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 07:51:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mgrduK0vdG5RdklEwTnsWAWcaWhuwL7lCF629mSwpM0=;
 b=2sT9uVr294J0NC1j7QgFkuG2BhVNyE9I+LNenv87/+vbkq3UAQByYeoylFlEX1kY68
 IH+8Cq0EaQEDlyOqaRB81J5eE0rV2BuYkNwYOEpd4qcSzqCjSmO7SwFTdjjqXP97gPTN
 hydYCDOFMDRvHvWixV7mTxY77d8BvOYvwWDjncbOdGcrinP2yV78UzUfR52x2Up7CnvO
 edO0ysoCWOJbjOu+0ewL197cbiU47T3Auvzl0CAWP1wEN7JGz0rlFIhtkEr1OtDK5a3D
 d9FeN5e+b16MPGVdfEg60tLrnuoHz2cnU5sOHSac6fwUDB2+KenZi/ogC8gSmC2UqoOh
 pQ4Q==
X-Gm-Message-State: AFqh2kpTi2HlYHxRCyHgKJGk+cVzZ7GvmXb17Jo4J2+8vN+KoqzThQFv
 wYGOyn/4ROqI2lvNq9vUMKfYOwAmHvRaEXbKuTavH0ed4JMpyGCw0Hldt+8KEuzEVljx4GM3S3C
 aBJolKUde2pQeZhM=
X-Received: by 2002:a17:907:7653:b0:86d:4517:a4fa with SMTP id
 kj19-20020a170907765300b0086d4517a4famr9359224ejc.1.1673884279851; 
 Mon, 16 Jan 2023 07:51:19 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtNUID3Hqn0m2MUdGwDmfBhARy0nLyAVr469tXfqeakGt3euydxH75krupzX+vkuPHAi2Qz9A==
X-Received: by 2002:a17:907:7653:b0:86d:4517:a4fa with SMTP id
 kj19-20020a170907765300b0086d4517a4famr9359201ejc.1.1673884279578; 
 Mon, 16 Jan 2023 07:51:19 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 22-20020a170906311600b0082535e2da13sm11986923ejx.6.2023.01.16.07.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 07:51:19 -0800 (PST)
Date: Mon, 16 Jan 2023 16:51:18 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Philippe =?UTF-8?B?TWF0aGlldS1E?=
 =?UTF-8?B?YXVkw6k=?= <philmd@linaro.org>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani
 Sinha <ani@anisinha.ca>, Markus Armbruster <armbru@redhat.com>, Aurelien
 Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 2/7] hw/acpi/acpi_dev_interface: Remove unused parameter
 from AcpiDeviceIfClass::madt_cpu
Message-ID: <20230116165118.5d4d6f0a@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230114222738.282478-3-shentey@gmail.com>
References: <20230114222738.282478-1-shentey@gmail.com>
 <20230114222738.282478-3-shentey@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, 14 Jan 2023 23:27:33 +0100
Bernhard Beschow <shentey@gmail.com> wrote:

> The only function ever assigned to AcpiDeviceIfClass::madt_cpu is
> pc_madt_cpu_entry() which doesn't use the AcpiDeviceIf parameter.

intent for AcpiDeviceIfClass::madt_cpu is to make cpu hotplug AML
reusable (so it's not x86, specific and applicable to other target
that use ACPI with it's own madt_entry definition (think about
arm/virt machine)).

Indeed  (AcpiDeviceIf *adev) is unused and it is there only for
AcpiDeviceIfClass callbacks consistent signature. Other than
I don't see any possible use for adev within madt_cpu()

so
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

>=20
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  include/hw/acpi/acpi_dev_interface.h | 3 +--
>  include/hw/i386/pc.h                 | 6 ++----
>  hw/acpi/acpi-x86-stub.c              | 5 ++---
>  hw/acpi/cpu.c                        | 3 +--
>  hw/i386/acpi-common.c                | 7 +++----
>  5 files changed, 9 insertions(+), 15 deletions(-)
>=20
> diff --git a/include/hw/acpi/acpi_dev_interface.h b/include/hw/acpi/acpi_=
dev_interface.h
> index ea6056ab92..a1648220ff 100644
> --- a/include/hw/acpi/acpi_dev_interface.h
> +++ b/include/hw/acpi/acpi_dev_interface.h
> @@ -52,8 +52,7 @@ struct AcpiDeviceIfClass {
>      /* <public> */
>      void (*ospm_status)(AcpiDeviceIf *adev, ACPIOSTInfoList ***list);
>      void (*send_event)(AcpiDeviceIf *adev, AcpiEventStatusBits ev);
> -    void (*madt_cpu)(AcpiDeviceIf *adev, int uid,
> -                     const CPUArchIdList *apic_ids, GArray *entry,
> +    void (*madt_cpu)(int uid, const CPUArchIdList *apic_ids, GArray *ent=
ry,
>                       bool force_enabled);
>  };
>  #endif
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 991f905f5d..a0647165d1 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -9,7 +9,6 @@
>  #include "hw/block/flash.h"
>  #include "hw/i386/x86.h"
> =20
> -#include "hw/acpi/acpi_dev_interface.h"
>  #include "hw/hotplug.h"
>  #include "qom/object.h"
>  #include "hw/i386/sgx-epc.h"
> @@ -193,9 +192,8 @@ bool pc_system_ovmf_table_find(const char *entry, uin=
t8_t **data,
>  void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size);
> =20
>  /* hw/i386/acpi-common.c */
> -void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
> -                       const CPUArchIdList *apic_ids, GArray *entry,
> -                       bool force_enabled);
> +void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
> +                       GArray *entry, bool force_enabled);
> =20
>  /* sgx.c */
>  void pc_machine_init_sgx_epc(PCMachineState *pcms);
> diff --git a/hw/acpi/acpi-x86-stub.c b/hw/acpi/acpi-x86-stub.c
> index 3df1e090f4..d0d399d26b 100644
> --- a/hw/acpi/acpi-x86-stub.c
> +++ b/hw/acpi/acpi-x86-stub.c
> @@ -2,9 +2,8 @@
>  #include "hw/i386/pc.h"
>  #include "hw/i386/acpi-build.h"
> =20
> -void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
> -                       const CPUArchIdList *apic_ids, GArray *entry,
> -                       bool force_enabled)
> +void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
> +                       GArray *entry, bool force_enabled)
>  {
>  }
> =20
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index 9148b3a49e..c59a0acbf1 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -357,7 +357,6 @@ void build_cpus_aml(Aml *table, MachineState *machine=
, CPUHotplugFeatures opts,
>      char *cphp_res_path =3D g_strdup_printf("%s." CPUHP_RES_DEVICE, res_=
root);
>      Object *obj =3D object_resolve_path_type("", TYPE_ACPI_DEVICE_IF, NU=
LL);
>      AcpiDeviceIfClass *adevc =3D ACPI_DEVICE_IF_GET_CLASS(obj);
> -    AcpiDeviceIf *adev =3D ACPI_DEVICE_IF(obj);
> =20
>      cpu_ctrl_dev =3D aml_device("%s", cphp_res_path);
>      {
> @@ -668,7 +667,7 @@ void build_cpus_aml(Aml *table, MachineState *machine=
, CPUHotplugFeatures opts,
> =20
>              /* build _MAT object */
>              assert(adevc && adevc->madt_cpu);
> -            adevc->madt_cpu(adev, i, arch_ids, madt_buf,
> +            adevc->madt_cpu(i, arch_ids, madt_buf,
>                              true); /* set enabled flag */
>              aml_append(dev, aml_name_decl("_MAT",
>                  aml_buffer(madt_buf->len, (uint8_t *)madt_buf->data)));
> diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
> index 4aaafbdd7b..52e5c1439a 100644
> --- a/hw/i386/acpi-common.c
> +++ b/hw/i386/acpi-common.c
> @@ -33,9 +33,8 @@
>  #include "acpi-build.h"
>  #include "acpi-common.h"
> =20
> -void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
> -                       const CPUArchIdList *apic_ids, GArray *entry,
> -                       bool force_enabled)
> +void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
> +                       GArray *entry, bool force_enabled)
>  {
>      uint32_t apic_id =3D apic_ids->cpus[uid].arch_id;
>      /* Flags =E2=80=93 Local APIC Flags */
> @@ -112,7 +111,7 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *=
linker,
>      build_append_int_noprefix(table_data, 1 /* PCAT_COMPAT */, 4); /* Fl=
ags */
> =20
>      for (i =3D 0; i < apic_ids->len; i++) {
> -        adevc->madt_cpu(adev, i, apic_ids, table_data, false);
> +        adevc->madt_cpu(i, apic_ids, table_data, false);
>          if (apic_ids->cpus[i].arch_id > 254) {
>              x2apic_mode =3D true;
>          }


