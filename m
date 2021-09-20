Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2244A4119C1
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 18:26:59 +0200 (CEST)
Received: from localhost ([::1]:52090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSM89-0001b3-UF
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 12:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mSM30-0003hf-SO
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:21:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mSM2o-0002c7-1v
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:21:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632154879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L6oc7VjRW9yjq2lhkcxu7ei+1kUhIrwT1wCAq9GLNk8=;
 b=Tn47W2zxAf9CG4rZo9s6aXgo7eWX75h/qO7Q2D1WXmoz/hTGBK7DBezhRXQQHyQ5L0tiKD
 gCqiDLRK24JoIyYq2MxK5YV7A+/SRsxSQ7cxxsVltZY29mj59EtD+BaSSDy3oFYz0OIyeg
 sM2WHjViqfJtfZ4d80cBt5mYMEwhGnI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-08bB2oOTO9GsGE7SK6rMBA-1; Mon, 20 Sep 2021 12:21:18 -0400
X-MC-Unique: 08bB2oOTO9GsGE7SK6rMBA-1
Received: by mail-wr1-f69.google.com with SMTP id
 q14-20020a5d574e000000b00157b0978ddeso6544164wrw.5
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 09:21:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L6oc7VjRW9yjq2lhkcxu7ei+1kUhIrwT1wCAq9GLNk8=;
 b=TOuB01Y6bd9VXq92xWZGzXtClo5eIJL0JcGU1btyfW1OJysfUMaBLYcLC26bbmOZed
 R/HAuSh3bZsPH5F3prf339pwa9lXzPY3cU6wBBmX0JYjJw1MtQiS3ymyn2ExcbOJuZMA
 ukRIpOPDXQ1XoOmkbqB3GxaDOPMNRpbaXH9/fUtBfo+Aa7frW1mNIlVYRaFUFKipgaIG
 iJJ6wzONGI2kSmEXfAny36IJ3qwHxkVITJYNSWKODoZvyT5F0AZuQcI0p6KrfnwJSa/d
 nbj7gX3ENuKibM6Xs05jbTW2FDbNT1SObhZJhzOZAJem5nuV+H85gZxyI+AjQGVU+S5i
 7xRg==
X-Gm-Message-State: AOAM5303xzDhYysK0oUDqYv4K6rhC91fLWUSoK/7ppg/l+McCJxeYn6Y
 brhn/Io+Ym9CAGhOQ0MGv9F3G5iGJVxL9wAuyRd1TkvLlrlyrumXcFX9Elqna2FJMTmT3jg8UPS
 aHKB/+eg3XetjFvg=
X-Received: by 2002:adf:e384:: with SMTP id e4mr29424248wrm.64.1632154877020; 
 Mon, 20 Sep 2021 09:21:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLWL1H2zvgFXZrsxlSOF6jTW3vTCRyFZS4OKOxvccjg373yTzwFHwqmRFzyc2S7/AIMl1LtQ==
X-Received: by 2002:adf:e384:: with SMTP id e4mr29424225wrm.64.1632154876773; 
 Mon, 20 Sep 2021 09:21:16 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id i5sm16361055wrc.86.2021.09.20.09.21.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 09:21:16 -0700 (PDT)
Subject: Re: [PATCH v3 03/35] acpi: build_xsdt: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210907144814.741785-1-imammedo@redhat.com>
 <20210907144814.741785-4-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <540cdc1c-be5e-7cb8-d62a-639cf2da24ba@redhat.com>
Date: Mon, 20 Sep 2021 18:21:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210907144814.741785-4-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 9/7/21 4:47 PM, Igor Mammedov wrote:
> it replaces error-prone pointer arithmetic for build_header() API,
> with 2 calls to start and finish table creation,
> which hides offsets magic from API user.
> 
> While at it switch to build_append_int_noprefix() to build
> entries to other tables (which also removes some manual offset
> calculations).
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

> ---
> v3:
>   * s/acpi_init_table|acpi_table_composed/acpi_table_begin|acpi_table_end/
> ---
>  include/hw/acpi/acpi-defs.h | 10 ----------
>  hw/acpi/aml-build.c         | 27 ++++++++++++---------------
>  2 files changed, 12 insertions(+), 25 deletions(-)
> 
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index ccfa3382aa..f6d2ca172b 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -149,16 +149,6 @@ struct AcpiSerialPortConsoleRedirection {
>  typedef struct AcpiSerialPortConsoleRedirection
>                 AcpiSerialPortConsoleRedirection;
>  
> -/*
> - * ACPI 2.0 eXtended System Description Table (XSDT)
nit: you may move that comment to aml-build.c

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> - */
> -struct AcpiXsdtDescriptorRev2 {
> -    ACPI_TABLE_HEADER_DEF       /* ACPI common table header */
> -    uint64_t table_offset_entry[];  /* Array of pointers to other */
> -    /* ACPI tables */
> -} QEMU_PACKED;
> -typedef struct AcpiXsdtDescriptorRev2 AcpiXsdtDescriptorRev2;
> -
>  /*
>   * ACPI 1.0 Firmware ACPI Control Structure (FACS)
>   */
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 32f14d4a78..daefc132f3 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -1916,27 +1916,24 @@ build_xsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
>             const char *oem_id, const char *oem_table_id)
>  {
>      int i;
> -    unsigned xsdt_entries_offset;
> -    AcpiXsdtDescriptorRev2 *xsdt;
> -    int xsdt_start = table_data->len;
> -    const unsigned table_data_len = (sizeof(uint64_t) * table_offsets->len);
> -    const unsigned xsdt_entry_size = sizeof(xsdt->table_offset_entry[0]);
> -    const size_t xsdt_len = sizeof(*xsdt) + table_data_len;
> -
> -    xsdt = acpi_data_push(table_data, xsdt_len);
> -    xsdt_entries_offset = (char *)xsdt->table_offset_entry - table_data->data;
> +    AcpiTable table = { .sig = "XSDT", .rev = 1,
> +                        .oem_id = oem_id, .oem_table_id = oem_table_id };
> +
> +    acpi_table_begin(&table, table_data);
> +
>      for (i = 0; i < table_offsets->len; ++i) {
>          uint64_t ref_tbl_offset = g_array_index(table_offsets, uint32_t, i);
> -        uint64_t xsdt_entry_offset = xsdt_entries_offset + xsdt_entry_size * i;
> +        uint64_t xsdt_entry_offset = table.array->len;
>  
> -        /* xsdt->table_offset_entry to be filled by Guest linker */
> +        /* reserve space for entry */
> +        build_append_int_noprefix(table.array, 0, 8);
> +
> +        /* mark position of RSDT entry to be filled by Guest linker */
>          bios_linker_loader_add_pointer(linker,
> -            ACPI_BUILD_TABLE_FILE, xsdt_entry_offset, xsdt_entry_size,
> +            ACPI_BUILD_TABLE_FILE, xsdt_entry_offset, 8,
>              ACPI_BUILD_TABLE_FILE, ref_tbl_offset);
>      }
> -    build_header(linker, table_data,
> -                 (void *)(table_data->data + xsdt_start),
> -                 "XSDT", xsdt_len, 1, oem_id, oem_table_id);
> +    acpi_table_end(linker, &table);
>  }
>  
>  void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
> 


