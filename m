Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED19B4239B9
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 10:27:14 +0200 (CEST)
Received: from localhost ([::1]:57416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY2Gg-0005Dm-24
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 04:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mY2FQ-0003ko-Fx
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 04:25:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mY2FO-00017N-54
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 04:25:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633508753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MFp5oAiNkjhl6IYudPtOIoQ/lNfsoqVYGKLWeoagLx4=;
 b=gOJlVrcMZmqMrfoZex3CHJTFjZOXfaRNNCOu/OXmj2ZGxIja2G+/kaPtclzugsEs8HkazV
 No64exyUzseUEWmP853t0hI1l2NGIb9gNjkZJ1p2Ye7a22kbZ0ksrvbKD+6sL8QKdq8aUb
 zK0OVbQEadzwri7oMegjS62Be56fp60=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-HpRlgs8fO_-H9-wiRybJLQ-1; Wed, 06 Oct 2021 04:25:51 -0400
X-MC-Unique: HpRlgs8fO_-H9-wiRybJLQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 o2-20020a5d4a82000000b00160c6b7622aso1294219wrq.12
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 01:25:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MFp5oAiNkjhl6IYudPtOIoQ/lNfsoqVYGKLWeoagLx4=;
 b=yioYcH+Vaf1ISqKSUSLDVuh/Lg9BABPk0dbrCZ/77fPv5aG/IcSt5pJkV8KUtTWlTe
 jdXLsq/v9TIyGiIAaHwNfuWfDWNmSOXBvUN+66BTamLcPp6YPuAn/oAlQlrhvxmuV5lH
 oD6/onjFeXJfMPBN5nXHMbyyomt1xHJSrcgKb/o/GklOKOjM3qf5WGiR1dvBe0hPghk+
 Xm1GC8JwmHF2JTBg5NaWsq4DEk3yhD7MmNOBZkajiQp4TEpnDTHRTUir56BcQb46UWPe
 bUCnx38myPEWd/rJnhLgghF2Ez8Sn0nUoLuLOpFzAjc3uVOAmjED07rUD6jPfdw5TaNL
 V8uw==
X-Gm-Message-State: AOAM530c5Sy9SfhzzbDJcQY8gYEsXiQQjqyr4+NQZQDOJkNgVCBqCDSB
 eRww0F7y/SsZIK1QsatY5uHF4ilMabxZm9oWnemJXYBZYbDVLZuVzJ3Pr6CAeb3dyM9OE+YIW+w
 LyzzO0D0EZCeq230=
X-Received: by 2002:adf:bb12:: with SMTP id r18mr17000581wrg.313.1633508750408; 
 Wed, 06 Oct 2021 01:25:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxveQrbkT8eOc2iYVqt5JotqcN5Vtookl+5dAbAc3sB92SGpiWEYH+Bg7xsFPwMWCX6ARwurw==
X-Received: by 2002:adf:bb12:: with SMTP id r18mr17000565wrg.313.1633508750177; 
 Wed, 06 Oct 2021 01:25:50 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id b15sm23875622wru.9.2021.10.06.01.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 01:25:49 -0700 (PDT)
Date: Wed, 6 Oct 2021 10:25:48 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v3 2/3] hw/arm/virt_acpi_build: Generate DBG2 table
Message-ID: <20211006102548.6f02e16e@redhat.com>
In-Reply-To: <20210927131732.63801-3-eric.auger@redhat.com>
References: <20210927131732.63801-1-eric.auger@redhat.com>
 <20210927131732.63801-3-eric.auger@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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

On Mon, 27 Sep 2021 15:17:31 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> ARM SBBR specification mandates DBG2 table (Debug Port Table 2)
> since v1.0 (ARM DEN0044F 8.3.1.7 DBG2).
> 
> The DBG2 table allows to describe one or more debug ports.
> 
> Generate an DBG2 table featuring a single debug port, the PL011.
> 
> The DBG2 specification can be found at
> "Microsoft Debug Port Table 2 (DBG2)"
> https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-debug-port-table?redirectedfrom=MSDN
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> v2 -> v3:
> Took into account all comments from Igor on v2:
> mostly style adjustment, revision references
> 
> v1 -> v2:
> - rebased on Igor's refactoring
> ---
>  hw/arm/virt-acpi-build.c | 62 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 61 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 6cec97352b..257d0fee17 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -616,6 +616,63 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      acpi_table_end(linker, &table);
>  }
>  
> +/* Debug Port Table 2 (DBG2) */
> +static void
> +build_dbg2(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> +{
> +    AcpiTable table = { .sig = "DBG2", .rev = 3, .oem_id = vms->oem_id,
> +                        .oem_table_id = vms->oem_table_id };
> +    int dbg2devicelength;
> +    const char name[] = "COM0";
> +    const int namespace_length = sizeof(name);
> +
> +    acpi_table_begin(&table, table_data);
> +
> +    dbg2devicelength = 22 /* BaseAddressRegister[] offset */ +
> +                       12 /* BaseAddressRegister[] */ +
> +                       4 /* AddressSize[] */ +
> +                       namespace_length /* NamespaceString[] */;
> +
> +    /* OffsetDbgDeviceInfo */
> +    build_append_int_noprefix(table_data, 44, 4);
> +    /* NumberDbgDeviceInfo */
> +    build_append_int_noprefix(table_data, 1, 4);
> +
> +    /* Table 2. Debug Device Information structure format */
> +    build_append_int_noprefix(table_data, 0, 1); /* Revision */
> +    build_append_int_noprefix(table_data, dbg2devicelength, 2); /* Length */
> +    /* NumberofGenericAddressRegisters */
> +    build_append_int_noprefix(table_data, 1, 1);
> +    /* NameSpaceStringLength */
> +    build_append_int_noprefix(table_data, namespace_length, 2);
> +    build_append_int_noprefix(table_data, 38, 2); /* NameSpaceStringOffset */
> +    build_append_int_noprefix(table_data, 0, 2); /* OemDataLength */
> +    /* OemDataOffset (0 means no OEM data) */
> +    build_append_int_noprefix(table_data, 0, 2);
> +
> +    /* Port Type */
> +    build_append_int_noprefix(table_data, 0x8000 /* Serial */, 2);
> +    /* Port Subtype */
> +    build_append_int_noprefix(table_data, 0x3 /* ARM PL011 UART */, 2);
> +    build_append_int_noprefix(table_data, 0, 2); /* Reserved */
> +    /* BaseAddressRegisterOffset */
> +    build_append_int_noprefix(table_data, 22, 2);
> +    /* AddressSizeOffset */
> +    build_append_int_noprefix(table_data, 34, 2);
> +
> +    /* BaseAddressRegister[] */
> +    build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 8, 0, 1,
> +                     vms->memmap[VIRT_UART].base);
> +
> +    /* AddressSize[] */
> +    build_append_int_noprefix(table_data, 0x1000 /* Register Space */, 4);

s/0x1000/vms->memmap[VIRT_UART].size/?

> +
> +    /* NamespaceString[] */
> +    g_array_append_vals(table_data, name, namespace_length);
> +
> +    acpi_table_end(linker, &table);
> +};
> +
>  /*
>   * ACPI spec, Revision 5.1 Errata A
>   * 5.2.12 Multiple APIC Description Table (MADT)
> @@ -875,7 +932,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      dsdt = tables_blob->len;
>      build_dsdt(tables_blob, tables->linker, vms);
>  
> -    /* FADT MADT GTDT MCFG SPCR pointed to by RSDT */
> +    /* FADT MADT GTDT MCFG SPCR DBG2 pointed to by RSDT */
>      acpi_add_table(table_offsets, tables_blob);
>      build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
>  
> @@ -898,6 +955,9 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      acpi_add_table(table_offsets, tables_blob);
>      build_spcr(tables_blob, tables->linker, vms);
>  
> +    acpi_add_table(table_offsets, tables_blob);
> +    build_dbg2(tables_blob, tables->linker, vms);
> +
>      if (vms->ras) {
>          build_ghes_error_table(tables->hardware_errors, tables->linker);
>          acpi_add_table(table_offsets, tables_blob);


