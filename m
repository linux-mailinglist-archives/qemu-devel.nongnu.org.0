Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B593A6136C4
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:46:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUAj-00059e-Il; Mon, 31 Oct 2022 08:45:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1opUAe-000574-4j
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:45:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1opUAa-0000MX-Hs
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:45:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eNtHxNST1Po8AXy71Jho73yLP1vkXkXP59/9JthCYiM=;
 b=gcYnqrT/Q81UwCubtKiD2pFnoAvNiHuQyn+GVm56sOvk+DnRJJomwEKOK/dw/pCuodCfVi
 AkdkNAJRu1VzA2QhINIc1xIu7S+Jo11NMvuNbLLlXdoe9KfGl3HFx62a1UgQP32DwaZzKh
 6fPa66ccqTQhlo0fVwGvVVubppffwUs=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-271-lPcAJu2IMmilf0MadSV9iQ-1; Mon, 31 Oct 2022 08:45:33 -0400
X-MC-Unique: lPcAJu2IMmilf0MadSV9iQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 fp9-20020a05622a508900b003a503ff1d4cso6133490qtb.22
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:45:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eNtHxNST1Po8AXy71Jho73yLP1vkXkXP59/9JthCYiM=;
 b=CH0N1WOWgt7ozNsb2QC//6KA4B1Wh6q2UBufk2nW+FRgZgWYAcEE6NY18DVtfob6eE
 tb6KM/GkuEK9NOF2gjpWmI9DZdRxaZcnh2gI40i7tE6nYf5OykMlf4CjF/sE2jtk/QTb
 y+njxfJn23RSg5BCcebuUG57cSYcha591gBW2XOjSphMHBe38EYh/muQ0wqTFIu1lQO4
 wfS2bbiZsri4uxrbQl55Zb4MxkoQpGqTrdM8RcAz7rDt2BlPNpLWEVruK6cJ4U4yWcle
 JbzjcKppyww+0s+HzXoonMPaTQXs0RwEGIXBdETS1vI2h52I+A6ZgRVlRjApGuj7OwkK
 0vHw==
X-Gm-Message-State: ACrzQf23Ae++9QcBC5X6q+2/h/2npjdC5HkvOrhJv+qn+DZNvymYlOCN
 ipR60RyRAbnuivsLDEJQOlO99ZJainBl86IfqbqCyd3SPCjtEiB206yxgcSz9WZvR9a9SFdhfAI
 HlIh6ycOHy5htzUw=
X-Received: by 2002:a05:620a:1319:b0:6fa:134e:1187 with SMTP id
 o25-20020a05620a131900b006fa134e1187mr8389472qkj.115.1667220333170; 
 Mon, 31 Oct 2022 05:45:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7acn54oOQw+fQpmonUWw6s1lufD6PdcnJIiUqKMPxuGa4UlExPyfFyLIgcVydQTqAoS9v2fQ==
X-Received: by 2002:a05:620a:1319:b0:6fa:134e:1187 with SMTP id
 o25-20020a05620a131900b006fa134e1187mr8389455qkj.115.1667220332964; 
 Mon, 31 Oct 2022 05:45:32 -0700 (PDT)
Received: from fedora (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 d2-20020ac81182000000b00397b1c60780sm3524113qtj.61.2022.10.31.05.45.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:45:32 -0700 (PDT)
Date: Mon, 31 Oct 2022 13:45:29 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <ani@anisinha.ca>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>
Subject: Re: [PATCH v2 2/3] hw/i386/acpi-build: Resolve redundant attribute
Message-ID: <20221031134529.5f7250ce@fedora>
In-Reply-To: <20221028103419.93398-3-shentey@gmail.com>
References: <20221028103419.93398-1-shentey@gmail.com>
 <20221028103419.93398-3-shentey@gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 28 Oct 2022 12:34:18 +0200
Bernhard Beschow <shentey@gmail.com> wrote:

> The is_piix4 attribute is set once in one location and read once in
> another. Doing both in one location allows for removing the attribute
> altogether.

we also test for piix4 in acpi_get_pm_info(),
Perhaps we should move is_piix4 to AcpiPmInfo
and reuse it in build_dsdt()?

Also should use is_piix4 as argument to build_iqcr_method()
to make its call places self documenting. But that's another patch.

> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Message-Id: <20221026133110.91828-3-shentey@gmail.com>
> ---
>  hw/i386/acpi-build.c | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
>=20
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 1ebf14b899..73d8a59737 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -112,7 +112,6 @@ typedef struct AcpiPmInfo {
>  } AcpiPmInfo;
> =20
>  typedef struct AcpiMiscInfo {
> -    bool is_piix4;
>      bool has_hpet;
>  #ifdef CONFIG_TPM
>      TPMVersion tpm_version;
> @@ -281,17 +280,6 @@ static void acpi_get_pm_info(MachineState *machine, =
AcpiPmInfo *pm)
> =20
>  static void acpi_get_misc_info(AcpiMiscInfo *info)
>  {
> -    Object *piix =3D object_resolve_type_unambiguous(TYPE_PIIX4_PM);
> -    Object *lpc =3D object_resolve_type_unambiguous(TYPE_ICH9_LPC_DEVICE=
);
> -    assert(!!piix !=3D !!lpc);
> -
> -    if (piix) {
> -        info->is_piix4 =3D true;
> -    }
> -    if (lpc) {
> -        info->is_piix4 =3D false;
> -    }

ack for this hunk

>      info->has_hpet =3D hpet_find();
>  #ifdef CONFIG_TPM
>      info->tpm_version =3D tpm_get_version(tpm_find());
> @@ -1334,6 +1322,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>             AcpiPmInfo *pm, AcpiMiscInfo *misc,
>             Range *pci_hole, Range *pci_hole64, MachineState *machine)
>  {
> +    Object *piix =3D object_resolve_type_unambiguous(TYPE_PIIX4_PM);
> +    Object *lpc =3D object_resolve_type_unambiguous(TYPE_ICH9_LPC_DEVICE=
);
>      CrsRangeEntry *entry;
>      Aml *dsdt, *sb_scope, *scope, *dev, *method, *field, *pkg, *crs;
>      CrsRangeSet crs_range_set;
> @@ -1354,11 +1344,13 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>      AcpiTable table =3D { .sig =3D "DSDT", .rev =3D 1, .oem_id =3D x86ms=
->oem_id,
>                          .oem_table_id =3D x86ms->oem_table_id };
> =20
> +    assert(!!piix !=3D !!lpc);
> +
>      acpi_table_begin(&table, table_data);
>      dsdt =3D init_aml_allocator();
> =20
>      build_dbg_aml(dsdt);
> -    if (misc->is_piix4) {
> +    if (piix) {
>          sb_scope =3D aml_scope("_SB");
>          dev =3D aml_device("PCI0");
>          aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
> @@ -1371,7 +1363,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>              build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
>          }
>          build_piix4_pci0_int(dsdt);
> -    } else {
> +    } else if (lpc) {
>          sb_scope =3D aml_scope("_SB");
>          dev =3D aml_device("PCI0");
>          aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));


