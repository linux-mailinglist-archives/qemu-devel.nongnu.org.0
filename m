Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC9941429F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 09:25:28 +0200 (CEST)
Received: from localhost ([::1]:35928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSwdD-0003ja-2D
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 03:25:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mSwbL-0002Ir-D9
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 03:23:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mSwbJ-0000MG-Nv
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 03:23:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632295409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cwvx8FeK0hKbPJnq7+Mr4M1F4tNTVFGdAvi4deLXht8=;
 b=FnoOiu/C81tBaE1E3WZ1/wQLmpjBByKz1a+Lt6S6s2cec00RVvcKMPjSq049v9Mt/t+XW1
 m9oP/P7QODx3iKYguTWP1eRhff8I50Yj8EfFB0e8y9XTkY+nJXUlD5G1fXusUhKw3YauRa
 A25HyOH5C2jKIzzlaLJq1RobJd6TSFo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-6ZStYYtQOfuQvgvWOTf0pA-1; Wed, 22 Sep 2021 03:23:24 -0400
X-MC-Unique: 6ZStYYtQOfuQvgvWOTf0pA-1
Received: by mail-wr1-f71.google.com with SMTP id
 r5-20020adfb1c5000000b0015cddb7216fso1283268wra.3
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 00:23:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cwvx8FeK0hKbPJnq7+Mr4M1F4tNTVFGdAvi4deLXht8=;
 b=KHLSA1+y+CGpdXCS+zXNOm8FFIohOT2tppWJgGBIjZmV7hWGo7EI53dqN+g1elKUCj
 CWdfAEvk/MOoI8g2rOcs1lqn7eKqWVgV+WAjO8RVsKX+zTOBd0Fa1OuN01RoRCKuzUEZ
 P6S2pEiCB6UnjAYnoCFcXFUhVpISJvi6quq1fx4nZ84TtisYBYGvwWJL4JyE//un+XWY
 C6rZQPYPwHNzCiXxQSX09osHgskCNeAaZsLEca5pKVMbl8m2+Hn+gFPCtf0pajRChKNM
 EVdss0TzTASymZDZOZymNj8l1G68rG2/kqttuobcYWxIQ8EOfuy0QsRQQY3MVLiT0XKZ
 yiVA==
X-Gm-Message-State: AOAM531mXFu5SIrzGus+NGsGTP+1oGg4fVPcoTvBk59pFaiwLIlF3oPH
 6V9mrq+jP2fO1rn49DcwbKNEDCE19XMPE2r3Ume/cScd3V8q+pT+CEUJDpdU60zGLTOXlwseOIy
 evJ2l/eH/qpIfQQs=
X-Received: by 2002:a5d:6503:: with SMTP id x3mr40618129wru.76.1632295402497; 
 Wed, 22 Sep 2021 00:23:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwo+g12BuC16mo9l/U4IX992D2wN4vISH9OhEC5j4TmNjrJF7JVPBfPPMIioRnz4JMfjRfYBg==
X-Received: by 2002:a5d:6503:: with SMTP id x3mr40618106wru.76.1632295402276; 
 Wed, 22 Sep 2021 00:23:22 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id c8sm1307925wru.30.2021.09.22.00.23.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 00:23:21 -0700 (PDT)
Subject: Re: [PATCH v3 15/35] acpi: build_tpm_tcpa: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210907144814.741785-1-imammedo@redhat.com>
 <20210907144814.741785-16-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <c718222a-f3a9-085f-7200-104b018aa2d5@redhat.com>
Date: Wed, 22 Sep 2021 09:23:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210907144814.741785-16-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: mst@redhat.com, stefanb@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/7/21 4:47 PM, Igor Mammedov wrote:
> it replaces error-prone pointer arithmetic for build_header() API,
> with 2 calls to start and finish table creation,
> which hides offsets magic from API user.
> 
> While at it switch to build_append_int_noprefix() to build
> table entries (which also removes some manual offset
> calculations).
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> v2:
>   * fix assert when starting QEMU with TPM 1.2
>       Stefan Berger <stefanb@linux.ibm.com>
> v3:
>  * fix invalid checksum, by putting acpi_table_composed()
>    after pointer patching
>  * s/acpi_init_table|acpi_table_composed/acpi_table_begin|acpi_table_end/
> 
> CC: stefanb@linux.vnet.ibm.com
> ---
>  include/hw/acpi/acpi-defs.h | 14 --------------
>  hw/i386/acpi-build.c        | 38 ++++++++++++++++++++++---------------
>  2 files changed, 23 insertions(+), 29 deletions(-)
> 
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index 4d8f8b34b0..3b42b138f0 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -418,20 +418,6 @@ struct AcpiSratProcessorGiccAffinity {
>  
>  typedef struct AcpiSratProcessorGiccAffinity AcpiSratProcessorGiccAffinity;
>  
> -/*
> - * TCPA Description Table
> - *
> - * Following Level 00, Rev 00.37 of specs:
> - * http://www.trustedcomputinggroup.org/resources/tcg_acpi_specification
> - */
> -struct Acpi20Tcpa {
> -    ACPI_TABLE_HEADER_DEF                    /* ACPI common table header */
> -    uint16_t platform_class;
> -    uint32_t log_area_minimum_length;
> -    uint64_t log_area_start_address;
> -} QEMU_PACKED;
> -typedef struct Acpi20Tcpa Acpi20Tcpa;
> -
>  /* DMAR - DMA Remapping table r2.2 */
>  struct AcpiTableDmar {
>      ACPI_TABLE_HEADER_DEF
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 7cfa0cf825..c329580cff 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1878,31 +1878,39 @@ build_hpet(GArray *table_data, BIOSLinker *linker, const char *oem_id,
>  }
>  
>  #ifdef CONFIG_TPM
> +/*
> + * TCPA Description Table
> + *
> + * Following Level 00, Rev 00.37 of specs:
> + * http://www.trustedcomputinggroup.org/resources/tcg_acpi_specification
> + * 7.1.2 ACPI Table Layout
> + */
>  static void
>  build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
>                 const char *oem_id, const char *oem_table_id)
>  {
> -    int tcpa_start = table_data->len;
> -    Acpi20Tcpa *tcpa = acpi_data_push(table_data, sizeof *tcpa);
> -    unsigned log_addr_size = sizeof(tcpa->log_area_start_address);
> -    unsigned log_addr_offset =
> -        (char *)&tcpa->log_area_start_address - table_data->data;
> +    unsigned log_addr_offset;
> +    AcpiTable table = { .sig = "TCPA", .rev = 2,
> +                        .oem_id = oem_id, .oem_table_id = oem_table_id };
>  
> -    tcpa->platform_class = cpu_to_le16(TPM_TCPA_ACPI_CLASS_CLIENT);
> -    tcpa->log_area_minimum_length = cpu_to_le32(TPM_LOG_AREA_MINIMUM_SIZE);
> -    acpi_data_push(tcpalog, le32_to_cpu(tcpa->log_area_minimum_length));
> +    acpi_table_begin(&table, table_data);
> +    /* Platform Class */
> +    build_append_int_noprefix(table_data, TPM_TCPA_ACPI_CLASS_CLIENT, 2);
> +    /* Log Area Minimum Length (LAML) */
> +    build_append_int_noprefix(table_data, TPM_LOG_AREA_MINIMUM_SIZE, 4);
> +    /* Log Area Start Address (LASA) */
> +    log_addr_offset = table_data->len;
> +    build_append_int_noprefix(table_data, 0, 8);
>  
> +    /* allocate/reserve space for TPM log area */
> +    acpi_data_push(tcpalog, TPM_LOG_AREA_MINIMUM_SIZE);
>      bios_linker_loader_alloc(linker, ACPI_BUILD_TPMLOG_FILE, tcpalog, 1,
>                               false /* high memory */);
> -
>      /* log area start address to be filled by Guest linker */
> -    bios_linker_loader_add_pointer(linker,
> -        ACPI_BUILD_TABLE_FILE, log_addr_offset, log_addr_size,
> -        ACPI_BUILD_TPMLOG_FILE, 0);
> +    bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
> +        log_addr_offset, 8, ACPI_BUILD_TPMLOG_FILE, 0);
>  
> -    build_header(linker, table_data,
> -                 (void *)(table_data->data + tcpa_start),
> -                 "TCPA", sizeof(*tcpa), 2, oem_id, oem_table_id);
> +    acpi_table_end(linker, &table);
>  }
>  #endif
>  
> 
Looks good to me

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric



