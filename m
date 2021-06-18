Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0E73ACA0C
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 13:39:14 +0200 (CEST)
Received: from localhost ([::1]:48524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luCq8-00031k-Lx
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 07:39:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1luCof-0002N0-6u
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 07:37:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1luCoc-0001bP-NA
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 07:37:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624016256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uF8jwx8X7Ixfi9AhlSh8jUiOgqwCc/wKnA4eQfDCgJI=;
 b=Fu79BCetNVvAAFb4PbiYFxT/IL4qfXBkT+yuJCnMnEaqPrp0bnHgJghFrERgE+2ACneu9/
 BpXL8Fqy7pRXlpSnukg+sDJuTQrpmK4jEzv+u1Tn3UWTpalgSGxwoaanrQaL6QjOXSutLz
 ubBErem+O4/2or94DoTBnuIrbklxOfw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-4JjwJh-rMc2-5khcXOp5VA-1; Fri, 18 Jun 2021 07:37:35 -0400
X-MC-Unique: 4JjwJh-rMc2-5khcXOp5VA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42A83803620;
 Fri, 18 Jun 2021 11:37:34 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D331C67879;
 Fri, 18 Jun 2021 11:37:21 +0000 (UTC)
Date: Fri, 18 Jun 2021 13:37:20 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH v2 19/23] hw/i386: Move pc_madt_cpu_entry() to acpi-pc.c
Message-ID: <20210618133720.459491bd@redhat.com>
In-Reply-To: <20210616204328.2611406-20-philmd@redhat.com>
References: <20210616204328.2611406-1-philmd@redhat.com>
 <20210616204328.2611406-20-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laszlo Ersek <lersek@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Jun 2021 22:43:24 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> pc_madt_cpu_entry() is specific to QEMU 'PC' machines,
> move it to acpi-pc.c.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/i386/acpi-common.c | 40 ----------------------------------------
>  hw/i386/acpi-pc.c     | 39 +++++++++++++++++++++++++++++++++++++++

it's used not only by PC machines but also microvm,
which didn't use acpi-build.c (aka acpi-pc.c)
it only links fine by virtue that PC machines
are object files are also included.

>  2 files changed, 39 insertions(+), 40 deletions(-)
>=20
> diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
> index 77afebd9e1f..5ae1853b6f2 100644
> --- a/hw/i386/acpi-common.c
> +++ b/hw/i386/acpi-common.c
> @@ -23,49 +23,10 @@
>  #include "qemu/osdep.h"
>  #include "hw/acpi/acpi.h"
>  #include "hw/acpi/aml-build.h"
> -#include "hw/i386/pc.h"
>  #include "target/i386/cpu.h"
>  #include "acpi-build.h"
>  #include "acpi-common.h"
> =20
> -void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
> -                       const CPUArchIdList *apic_ids, GArray *entry)
> -{
> -    uint32_t apic_id =3D apic_ids->cpus[uid].arch_id;
> -
> -    /* ACPI spec says that LAPIC entry for non present
> -     * CPU may be omitted from MADT or it must be marked
> -     * as disabled. However omitting non present CPU from
> -     * MADT breaks hotplug on linux. So possible CPUs
> -     * should be put in MADT but kept disabled.
> -     */
> -    if (apic_id < 255) {
> -        AcpiMadtProcessorApic *apic =3D acpi_data_push(entry, sizeof *ap=
ic);
> -
> -        apic->type =3D ACPI_APIC_PROCESSOR;
> -        apic->length =3D sizeof(*apic);
> -        apic->processor_id =3D uid;
> -        apic->local_apic_id =3D apic_id;
> -        if (apic_ids->cpus[uid].cpu !=3D NULL) {
> -            apic->flags =3D cpu_to_le32(1);
> -        } else {
> -            apic->flags =3D cpu_to_le32(0);
> -        }
> -    } else {
> -        AcpiMadtProcessorX2Apic *apic =3D acpi_data_push(entry, sizeof *=
apic);
> -
> -        apic->type =3D ACPI_APIC_LOCAL_X2APIC;
> -        apic->length =3D sizeof(*apic);
> -        apic->uid =3D cpu_to_le32(uid);
> -        apic->x2apic_id =3D cpu_to_le32(apic_id);
> -        if (apic_ids->cpus[uid].cpu !=3D NULL) {
> -            apic->flags =3D cpu_to_le32(1);
> -        } else {
> -            apic->flags =3D cpu_to_le32(0);
> -        }
> -    }
> -}
> -
>  void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
>                       X86MachineState *x86ms, AcpiDeviceIf *adev,
>                       const char *oem_id, const char *oem_table_id)
> @@ -155,4 +116,3 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *=
linker,
>                   (void *)(table_data->data + madt_start), "APIC",
>                   table_data->len - madt_start, 1, oem_id, oem_table_id);
>  }
> -
> diff --git a/hw/i386/acpi-pc.c b/hw/i386/acpi-pc.c
> index 796ffc6f5c4..a3cd60d81e6 100644
> --- a/hw/i386/acpi-pc.c
> +++ b/hw/i386/acpi-pc.c
> @@ -2707,3 +2707,42 @@ void acpi_setup(void)
>       */
>      acpi_build_tables_cleanup(&tables, false);
>  }
> +
> +void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
> +                       const CPUArchIdList *apic_ids, GArray *entry)
> +{
> +    uint32_t apic_id =3D apic_ids->cpus[uid].arch_id;
> +
> +    /*
> +     * ACPI spec says that LAPIC entry for non present
> +     * CPU may be omitted from MADT or it must be marked
> +     * as disabled. However omitting non present CPU from
> +     * MADT breaks hotplug on linux. So possible CPUs
> +     * should be put in MADT but kept disabled.
> +     */
> +    if (apic_id < 255) {
> +        AcpiMadtProcessorApic *apic =3D acpi_data_push(entry, sizeof *ap=
ic);
> +
> +        apic->type =3D ACPI_APIC_PROCESSOR;
> +        apic->length =3D sizeof(*apic);
> +        apic->processor_id =3D uid;
> +        apic->local_apic_id =3D apic_id;
> +        if (apic_ids->cpus[uid].cpu !=3D NULL) {
> +            apic->flags =3D cpu_to_le32(1);
> +        } else {
> +            apic->flags =3D cpu_to_le32(0);
> +        }
> +    } else {
> +        AcpiMadtProcessorX2Apic *apic =3D acpi_data_push(entry, sizeof *=
apic);
> +
> +        apic->type =3D ACPI_APIC_LOCAL_X2APIC;
> +        apic->length =3D sizeof(*apic);
> +        apic->uid =3D cpu_to_le32(uid);
> +        apic->x2apic_id =3D cpu_to_le32(apic_id);
> +        if (apic_ids->cpus[uid].cpu !=3D NULL) {
> +            apic->flags =3D cpu_to_le32(1);
> +        } else {
> +            apic->flags =3D cpu_to_le32(0);
> +        }
> +    }
> +}


