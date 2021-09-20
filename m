Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C674119B7
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 18:23:42 +0200 (CEST)
Received: from localhost ([::1]:44776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSM4z-0004xH-RM
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 12:23:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mSM2s-0003XI-PF
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:21:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mSM2p-0002ip-HR
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:21:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632154886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B0Sa52yIxgAicQEG8wE/n6vkfTgQ4QA5QGGXWmOgLxc=;
 b=NItYiVolGo5b1U1xnbJKpn/narRt1TXj2lgCVPATdNf+c3eFJxNFPnLMcy7My1yWN/wrhQ
 lYqzJz6CcL6bUUeNuML4OzyNE8zoTUFIcd9axe7Io4tfelHWVcUlIJEAWSBmlgcmx0RtKd
 PGPFbW85mGAIlCEnQ18BIUAM6YfD3EY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-8wlNp0IpMeWxFnunjMosWQ-1; Mon, 20 Sep 2021 12:21:25 -0400
X-MC-Unique: 8wlNp0IpMeWxFnunjMosWQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 m18-20020adfe952000000b0015b0aa32fd6so6550353wrn.12
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 09:21:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B0Sa52yIxgAicQEG8wE/n6vkfTgQ4QA5QGGXWmOgLxc=;
 b=B6O5ihbBeZjLYwDa9vAe/wIBI0pYcp+dWpAklr0avOKvs2PJLM/2+klAZrJQ2xKxF2
 TopNv1lR9YNPSqEw5qy3R7HEhFwHQdIqvdkDV/kYsxoCUTJV9GXO15U6eYc3fwVfdhLz
 hiapnI5mkFGHe1EEhy7DafyMMMtYMWQQv12JhgFK+ZH4qEf38df/CK7ygREC2Wbhrtzw
 8+BrmhrJs+Z6I67daeip+FKsyzFE8TiYV47O+hzcYXSnIHXbmh7k3cbsdJDbrUksXr2f
 fgwgU3lhDh+UPckj5+G42rtZ38FNXOBA6Dcv7d++yMYAB53+pAyQOQDqs8LYp09VdqFm
 1XkQ==
X-Gm-Message-State: AOAM531jI7J9ZMON2xnbHXDCqhQmSoXYAXYp2P4GigGbZBHKZPb3cltf
 +jiaGDLWUXcGSGxDLdGYiwYT9RPMTPx7K38X8nfZoegIxUgJE0bajEzFjqbPJMfQs47UezcV7wP
 UOENdt2SZhQnvoLA=
X-Received: by 2002:a7b:c20f:: with SMTP id x15mr18037290wmi.59.1632154883724; 
 Mon, 20 Sep 2021 09:21:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyb3Y7VnXhtj+jNleykf4nmb7xPQQfvUBsDgqy+RnYaqroDk1fOOTc4JsGBCspOVXbrG53YJw==
X-Received: by 2002:a7b:c20f:: with SMTP id x15mr18037275wmi.59.1632154883547; 
 Mon, 20 Sep 2021 09:21:23 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id r5sm16086333wrm.79.2021.09.20.09.21.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 09:21:23 -0700 (PDT)
Subject: Re: [PATCH v3 02/35] acpi: build_rsdt: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210907144814.741785-1-imammedo@redhat.com>
 <20210907144814.741785-3-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <61d3f4da-d0ba-399e-d851-fa7aa90365d8@redhat.com>
Date: Mon, 20 Sep 2021 18:21:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210907144814.741785-3-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.475, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 9/7/21 4:47 PM, Igor Mammedov wrote:
> it replaces error-prone pointer arithmetic for build_header() API,
> with 2 calls to start and finish table creation,
> which hides offests magic from API user.
> 
> While at it switch to build_append_int_noprefix() to build
> entries to other tables (which also removes some manual offset
> calculations).
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

> ---
> v3:
>  * s/acpi_init_table|acpi_table_composed/acpi_table_begin|acpi_table_end/
> ---
>  include/hw/acpi/acpi-defs.h | 10 ----------
>  hw/acpi/aml-build.c         | 27 ++++++++++++---------------
>  2 files changed, 12 insertions(+), 25 deletions(-)
> 
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index cf9f44299c..ccfa3382aa 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -149,16 +149,6 @@ struct AcpiSerialPortConsoleRedirection {
>  typedef struct AcpiSerialPortConsoleRedirection
>                 AcpiSerialPortConsoleRedirection;
>  
> -/*
> - * ACPI 1.0 Root System Description Table (RSDT)
nit: you may move that comment to aml-build.c

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> - */
> -struct AcpiRsdtDescriptorRev1 {
> -    ACPI_TABLE_HEADER_DEF       /* ACPI common table header */
> -    uint32_t table_offset_entry[];  /* Array of pointers to other */
> -    /* ACPI tables */
> -} QEMU_PACKED;
> -typedef struct AcpiRsdtDescriptorRev1 AcpiRsdtDescriptorRev1;
> -
>  /*
>   * ACPI 2.0 eXtended System Description Table (XSDT)
>   */
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 229a3eb654..32f14d4a78 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -1890,27 +1890,24 @@ build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
>             const char *oem_id, const char *oem_table_id)
>  {
>      int i;
> -    unsigned rsdt_entries_offset;
> -    AcpiRsdtDescriptorRev1 *rsdt;
> -    int rsdt_start = table_data->len;
> -    const unsigned table_data_len = (sizeof(uint32_t) * table_offsets->len);
> -    const unsigned rsdt_entry_size = sizeof(rsdt->table_offset_entry[0]);
> -    const size_t rsdt_len = sizeof(*rsdt) + table_data_len;
> -
> -    rsdt = acpi_data_push(table_data, rsdt_len);
> -    rsdt_entries_offset = (char *)rsdt->table_offset_entry - table_data->data;
> +    AcpiTable table = { .sig = "RSDT", .rev = 1,
> +                        .oem_id = oem_id, .oem_table_id = oem_table_id };
> +
> +    acpi_table_begin(&table, table_data);
>      for (i = 0; i < table_offsets->len; ++i) {
>          uint32_t ref_tbl_offset = g_array_index(table_offsets, uint32_t, i);
> -        uint32_t rsdt_entry_offset = rsdt_entries_offset + rsdt_entry_size * i;
> +        uint32_t rsdt_entry_offset = table.array->len;
> +
> +        /* reserve space for entry */
> +        build_append_int_noprefix(table.array, 0, 4);
>  
> -        /* rsdt->table_offset_entry to be filled by Guest linker */
> +        /* mark position of RSDT entry to be filled by Guest linker */
>          bios_linker_loader_add_pointer(linker,
> -            ACPI_BUILD_TABLE_FILE, rsdt_entry_offset, rsdt_entry_size,
> +            ACPI_BUILD_TABLE_FILE, rsdt_entry_offset, 4,
>              ACPI_BUILD_TABLE_FILE, ref_tbl_offset);
> +
>      }
> -    build_header(linker, table_data,
> -                 (void *)(table_data->data + rsdt_start),
> -                 "RSDT", rsdt_len, 1, oem_id, oem_table_id);
> +    acpi_table_end(linker, &table);
>  }
>  
>  /* Build xsdt table */
> 


