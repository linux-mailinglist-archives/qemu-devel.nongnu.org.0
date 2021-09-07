Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD48402703
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 12:19:14 +0200 (CEST)
Received: from localhost ([::1]:49964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNYC9-0001aP-P5
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 06:19:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNYBC-0008Ob-43
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 06:18:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNYBA-0007dw-9M
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 06:18:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631009891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K3C4RPhpFvataIaonCqx/aNNACHlIDgxFBxCSr+5faI=;
 b=g78eumm9qkqbdqY2ZmepFGjxTjEWUmFPIps413BpPGzim/AQeAgeXDBxMAhg0Tw286IqLD
 bOLFaXcAzP71g9oBWXsbMmTI9WK5ASPo2xo9n7N69rfI1BCi+ZNdZd0Z3bFZaBaytJeoRc
 noQQXOwqAgMHkSEEqLjau01uBV6DAgo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-tNXIPLgGO_GapwK_vS5pog-1; Tue, 07 Sep 2021 06:18:10 -0400
X-MC-Unique: tNXIPLgGO_GapwK_vS5pog-1
Received: by mail-ej1-f71.google.com with SMTP id
 r21-20020a1709067055b02904be5f536463so3470757ejj.0
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 03:18:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K3C4RPhpFvataIaonCqx/aNNACHlIDgxFBxCSr+5faI=;
 b=ZhHorXJjzQoNZeKR1zkuFWncsF5wESN8rRV82FYEzYcOIvSdusAj5AfmU5GgM/xCk5
 xKjwNzGtbK6stnjVUBVsoxq50BDWuvoSt1jEybCV7GWTjKATjrFCVBMgoUaudxj1jJ4G
 coMpir2ywK/XTXh88mKJLgjSOBB4INKw9C1feAFycMqcwfhJ1Y0SF8Bof4BOB3Af7ukg
 cmIxgNSB5X01rGt+P144DdtgxJ7zHO/C2Es+i5k9TMAmwcTFJ0TMm8EseO2iLZgc6GTb
 qwZ7xuNOQVana92shBjEAMNmFx0k9id2z6r1pdo7BAkF9G85JW+zrc5MYAJ0ClcEDyqq
 nboQ==
X-Gm-Message-State: AOAM532LlIeTPpgOBv3bfwvmc7T67iP3moGVqjsuccNXdnemsH+8N2st
 o5XV2Fj2bNHnfZHIMCpHSiEyzjzv5yGxyjaImvmTiQUhhdkr+h/cfcALIg0W1rUr/CgvpSktHRs
 5zWIpx8ScehSEQdg=
X-Received: by 2002:a17:906:9747:: with SMTP id
 o7mr17795187ejy.486.1631009888791; 
 Tue, 07 Sep 2021 03:18:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYk3TdQEaP3Z8b5RN2Kq5Ja2rmICoMvZ6Do42a6tyJDAIfwYtH4sfxfVv2235gxhAxY9Te4Q==
X-Received: by 2002:a17:906:9747:: with SMTP id
 o7mr17795170ejy.486.1631009888579; 
 Tue, 07 Sep 2021 03:18:08 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id bm14sm6272484edb.71.2021.09.07.03.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 03:18:08 -0700 (PDT)
Date: Tue, 7 Sep 2021 12:18:06 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 3/3] hw/arm/virt_acpi_build: Generate DBG2 table
Message-ID: <20210907121806.79c74f27@redhat.com>
In-Reply-To: <20210906123139.93593-4-eric.auger@redhat.com>
References: <20210906123139.93593-1-eric.auger@redhat.com>
 <20210906123139.93593-4-eric.auger@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, gshan@redhat.com,
 mst@redhat.com, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, philmd@redhat.com, ardb@kernel.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon,  6 Sep 2021 14:31:39 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> ARM SBBR specification  mandates DBG2 table (Debug Port Table 2).
                        ^^ revision here, and possibly a pointer [chapter]
                           to concrete place in spec where it's said.

> this latter allows to describe one or more debug ports.
> 
> Generate an DBG2 table featuring a single debug port, the PL011.
> 
> The DBG2 specification can be found at:
> https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-debug-port-table?redirectedfrom=MSDN

links tend to go stale, I'd use a combo of name and optionally link here:
 "Microsoft Debug Port Table 2 (DBG2)"
    link
 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

table looks correct,
so only style related thing to fix to match the common
ACPI code style.

> 
> ---
> v1 -> v2:
> - rebased on Igor's refactoring
> ---
>  hw/arm/virt-acpi-build.c | 64 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 63 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 488ea04eed7..de604e79779 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -512,6 +512,65 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      acpi_table_composed(linker, &table);
>  }
>  
> +/* Debug Port Table 2 (DBG2) */
> +static void
> +build_dbg2(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> +{
> +    AcpiTable table = { .sig = "DBG2", .rev = 3, .oem_id = vms->oem_id,
> +                        .oem_table_id = vms->oem_table_id };
> +    int dbg2devicelength, baseaddroffset = 22, namespace_length;
> +    char name[] = "COM0";
const?

Also I'd move here:
       const int namespace_length = sizeof(name);

> +
> +    acpi_init_table(&table, table_data);
> +
> +    namespace_length = sizeof name;
> +    dbg2devicelength = baseaddroffset +
> +                       sizeof(struct AcpiGenericAddress) + 4 + namespace_length;
                          ^^^^, fragile as it's subject to alignment which depends on target

I suggest following style:
       
       dbg2devicelength = 22 /* BaseAddressRegister[] offset, fixed size table header */ +
                          12 /* BaseAddressRegister[] */ +
                          4 /* AddressSize[] */
                          namespace_length /* NamespaceString[] */;

       and drop 'baseaddroffset' and 'sizeof(struct AcpiGenericAddress)'
       to be more consistent with other ACPI code to annotate where lengths come from

> +    /* offset to the first debug struct */
         comment should be verbatim field name from spec table, i.e. in this case 
            /* OffsetDbgDeviceInfo */
         ditto for the rest of field comments

> +    build_append_int_noprefix(table_data, 44, 4);
> +    /* number of debug device info struct entries */
> +    build_append_int_noprefix(table_data, 1, 4);
> +
> +    /* debug device info structure */

copy from spec, for ease to find it using just copy/past,

 /* Table 2. Debug Device Information structure format */

> +    /* revision */
> +    build_append_int_noprefix(table_data, 0, 1);
> +    /* length */
> +    build_append_int_noprefix(table_data, dbg2devicelength, 2);
> +    /* register count */
> +    build_append_int_noprefix(table_data, 1, 1);
> +    /* name path length */
> +    build_append_int_noprefix(table_data, namespace_length, 2);
> +    /* name path offset */
> +    build_append_int_noprefix(table_data, 38, 2);
> +    /* oem data length */
> +    build_append_int_noprefix(table_data, 0, 2);
> +    /* oem data offset (0 means no OEM data) */
> +    build_append_int_noprefix(table_data, 0, 2);
> +    /* port type (serial port) */
> +    build_append_int_noprefix(table_data, 0x8000, 2);
values could be annotated like following, using description from spec:

          build_append_int_noprefix(table_data, 0x8000 /* Serial */, 2);

> +    /* port subtype (ARM PL011)*/
> +    build_append_int_noprefix(table_data, 0x3, 2);
                                             0x3 /* ARM PL011 UART */

it gives checkpatch warning but all APCI code uses this style,
so it's fine

> +    /* reserved */
> +    build_append_int_noprefix(table_data, 0, 2);
> +    /* base address offset */
> +    build_append_int_noprefix(table_data, 22, 2);
> +    /* address size offset */
> +    build_append_int_noprefix(table_data, 34, 2);
> +
> +    /* BaseAddressRegister */
> +    build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 8, 0, 1,
> +                     vms->memmap[VIRT_UART].base);
> +
> +    /* AddressSize (PL011 UART length) */
> +    build_append_int_noprefix(table_data, 0x1000, 4);
                                             ^^^^
at least point out where it comes from or use macro to define
value and use it here and in pl011_init()


> +
> +    /* NamespaceString */
> +    g_array_append_vals(table_data, name, namespace_length);
> +
> +    acpi_table_composed(linker, &table);
> +};
> +
>  /*
>   * ACPI spec, Revision 5.1 Errata A
>   * 5.2.12 Multiple APIC Description Table (MADT)
> @@ -770,7 +829,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      dsdt = tables_blob->len;
>      build_dsdt(tables_blob, tables->linker, vms);
>  
> -    /* FADT MADT GTDT MCFG SPCR pointed to by RSDT */
> +    /* FADT MADT GTDT MCFG SPCR DBG2 pointed to by RSDT */
>      acpi_add_table(table_offsets, tables_blob);
>      build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
>  
> @@ -793,6 +852,9 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      acpi_add_table(table_offsets, tables_blob);
>      build_spcr(tables_blob, tables->linker, vms);
>  
> +    acpi_add_table(table_offsets, tables_blob);
> +    build_dbg2(tables_blob, tables->linker, vms);
> +
>      if (vms->ras) {
>          build_ghes_error_table(tables->hardware_errors, tables->linker);
>          acpi_add_table(table_offsets, tables_blob);


