Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2402E3FF08B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 17:54:46 +0200 (CEST)
Received: from localhost ([::1]:35046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLp37-0000Zr-77
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 11:54:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mLojo-0008J0-91
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 11:34:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mLojk-0007Wt-48
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 11:34:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630596882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q1eNU8zXLKI6/pg/slkuT4W1g0WFI5LLKLzTRYh/Kcw=;
 b=OBiYjJo1mn35t9q7I/ojiBpvQ4PoIchfjYuYZ/2NZoIf93lukagVKZlrZCXq2UTUPK9yPk
 ySfn3Ka1dbd5mUweRqZw/OFAORS+M/skvqp1CjylzNBQNxJg1DgzZ2XRvkPNdE0u0pncCt
 1vyhySvMqTl7y7iamrdvyoSzReSPCTE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-30dREPOFNzCF5BBaV0Wvlg-1; Thu, 02 Sep 2021 11:34:41 -0400
X-MC-Unique: 30dREPOFNzCF5BBaV0Wvlg-1
Received: by mail-wm1-f72.google.com with SMTP id
 s197-20020a1ca9ce000000b002e72ba822dcso1187175wme.6
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 08:34:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q1eNU8zXLKI6/pg/slkuT4W1g0WFI5LLKLzTRYh/Kcw=;
 b=AOiGB0Lkxkc30P2V/RYEdcTfDIf4dDJ/LV0f8oCm0y4Ptnyp2PV5Zm/x6lIK+Us4N2
 QB2y0pR3ybrL4Ed9VjluQexqNU1KMg35kOkq5ius9WKJsHCeTCZ9b2dyFSarwSUKTs2b
 2DRrrFMTenJTR13WNtZqeMtzt1J6ZgQDrrJGNjOJu9Hq1fqjncjTU3sls8U5T1qS8+uP
 ORrvK38EJ+RWL5WmkPoHMnGrP3yrrc80k9q35h27/3ncEE1OweUkFG9UjflTPqU2A6of
 8LS4IhXtw5X32+dr9/kTf9jqiUBHufDhy2OR3kEKRODRBI1TPkgBUD/0vxFUFIW5ZTYG
 gsrA==
X-Gm-Message-State: AOAM530LJjMFRGrLaagR7m0mRBmnMKyEvrBKqunh08R+eeNjmeGU92+I
 kyQOa5iYIOr92hI3gMPr8Z0eygP5e8I1s2gMObIHKDzWSzaf0Fpihuk0SJdv7QFyShcKjV3UL/o
 nH8xJkE2HKa3FAAM=
X-Received: by 2002:a05:600c:19d1:: with SMTP id
 u17mr3772508wmq.21.1630596879780; 
 Thu, 02 Sep 2021 08:34:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6oKpFfgp4vBbgK/sGeqNtu9UnCb0KHwb5wyS2p0eUVtx/ReqFg6NNAdRN3qjcPzi9oug9jQ==
X-Received: by 2002:a05:600c:19d1:: with SMTP id
 u17mr3772487wmq.21.1630596879537; 
 Thu, 02 Sep 2021 08:34:39 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id p4sm1892952wmc.11.2021.09.02.08.34.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 08:34:38 -0700 (PDT)
Subject: Re: [PATCH v2 27/35] acpi: arm: virt: build_dsdt: use
 acpi_init_table()/acpi_table_composed() instead of build_header()
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210708154617.1538485-1-imammedo@redhat.com>
 <20210708154617.1538485-28-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <76437dba-52cb-11a6-be80-96afdd9194dc@redhat.com>
Date: Thu, 2 Sep 2021 17:34:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210708154617.1538485-28-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.225, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-arm@nongnu.org,
 mst@redhat.com, shannon.zhaosl@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/8/21 5:46 PM, Igor Mammedov wrote:
> it replaces error-prone pointer arithmetic for build_header() API,
> with 2 calls to start and finish table creation,
> which hides offsets magic from API user.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
> CC: peter.maydell@linaro.org
> CC: shannon.zhaosl@gmail.com
> CC: qemu-arm@nongnu.org
> CC: drjones@redhat.com
> ---
>  hw/arm/virt-acpi-build.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index dd8011a670..d15e67a39b 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -636,10 +636,11 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      MachineState *ms = MACHINE(vms);
>      const MemMapEntry *memmap = vms->memmap;
>      const int *irqmap = vms->irqmap;
> +    AcpiTable table = { .sig = "DSDT", .rev = 2, .oem_id = vms->oem_id,
> +                        .oem_table_id = vms->oem_table_id };
>  
> +    acpi_init_table(&table, table_data);
>      dsdt = init_aml_allocator();
> -    /* Reserve space for header */
> -    acpi_data_push(dsdt->buf, sizeof(AcpiTableHeader));
>  
>      /* When booting the VM with UEFI, UEFI takes ownership of the RTC hardware.
>       * While UEFI can use libfdt to disable the RTC device node in the DTB that
> @@ -686,12 +687,10 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  
>      aml_append(dsdt, scope);
>  
> -    /* copy AML table into ACPI tables blob and patch header there */
> +    /* copy AML table into ACPI tables blob */
>      g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
> -    build_header(linker, table_data,
> -        (void *)(table_data->data + table_data->len - dsdt->buf->len),
> -                 "DSDT", dsdt->buf->len, 2, vms->oem_id,
> -                 vms->oem_table_id);
> +
> +    acpi_table_composed(linker, &table);
>      free_aml_allocator();
>  }
>  
> 


