Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C42414509
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 11:24:06 +0200 (CEST)
Received: from localhost ([::1]:60644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSyTv-0005oy-Rb
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 05:24:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mSySD-0004vS-5e
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 05:22:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mSySB-0002zU-8H
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 05:22:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632302528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A8qWPRq9qbnKfCoAhH4LBUJ/GiXL5F2UoEkm2KwSssI=;
 b=Vb5GPYwIeEQ4dsq3Igq0GPL8OLdkTSs4EMeoD1SSetI0G8pqhXj/J1RJ/6uN+eWUWdA2NF
 BgD58tvDjbqHvsjzQ4qQnlHjoLAXAswirH9qRPln/D4Y+sCnEnFB/xlk/DNFUvZH66AaOn
 fTNCXBbOrQEwdHwCNblsh1Y2vOU1seg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-oR3QOKtYPEKtldkuVR9dog-1; Wed, 22 Sep 2021 05:22:07 -0400
X-MC-Unique: oR3QOKtYPEKtldkuVR9dog-1
Received: by mail-wr1-f70.google.com with SMTP id
 i4-20020a5d5224000000b0015b14db14deso1524823wra.23
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 02:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A8qWPRq9qbnKfCoAhH4LBUJ/GiXL5F2UoEkm2KwSssI=;
 b=pub5i965p+e+EJZyq57MrQiz4ScAixKxohbFuC68nT1MCUbpUWq6K2l8Lzgc/j+0F2
 IGpEjYhdS824h6hkbP/Mf0q4iY63KQxoG/DgAwk0YTNyiyFx0H/gDyylBnSucGvjE+li
 s6ZhX0lf64Lp7CF/99wSkmcCW896+PaoJTpQ5XBG1A8q9cGimjSrNIqo0mTh8i4OvEY5
 /ZIdNfP0GulcJYU/4bDQsALS7r9HmTc5xwOZ728m0p3b7b3YfxhRV2a1uZCDCSm+E8Mk
 uaNC7egxL+WwGirqg6Fjy39tOMDf5a581YUaqdB4o0FoI2wejSEWUSJo810ucDtIJ6+I
 NyKw==
X-Gm-Message-State: AOAM531dxA7LYxh2ye2u9RyK1CNKvjs0U11CmGjTrVnzPmV4Bpt1mNtY
 LsEP29Kn3yOUXoaFsoFH6byVTnUtkLkdtWVdWz8LgoDgMyxwFiGFthG2mmdkbNfcH+G1Reu33xV
 9VrGPhxRt+Va9Ny0=
X-Received: by 2002:a5d:65ce:: with SMTP id e14mr41139023wrw.328.1632302526442; 
 Wed, 22 Sep 2021 02:22:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxq03+LTRZdY8scXp7NhVzR1ZakQRiN263uoB6u6MtrVW2y6breTmgNEzRqAa0tZWYT2UpIpg==
X-Received: by 2002:a5d:65ce:: with SMTP id e14mr41139010wrw.328.1632302526243; 
 Wed, 22 Sep 2021 02:22:06 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id t18sm259799wrv.39.2021.09.22.02.22.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 02:22:05 -0700 (PDT)
Subject: Re: [PATCH v3 20/35] acpi: build_amd_iommu: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210907144814.741785-1-imammedo@redhat.com>
 <20210907144814.741785-21-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <5f4270dc-c961-2612-1b66-6344e40d6512@redhat.com>
Date: Wed, 22 Sep 2021 11:22:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210907144814.741785-21-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eauger@redhat.com;
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



On 9/7/21 4:47 PM, Igor Mammedov wrote:
> it replaces error-prone pointer arithmetic for build_header() API,
> with 2 calls to start and finish table creation,
> which hides offsets magic from API user.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> v3:
>   * s/acpi_init_table|acpi_table_composed/acpi_table_begin|acpi_table_end/
> 
> CC: marcel.apfelbaum@gmail.com
> ---
>  hw/i386/acpi-build.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 45724469b0..9f888d5a2c 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2319,12 +2319,12 @@ build_amd_iommu(GArray *table_data, BIOSLinker *linker, const char *oem_id,
>                  const char *oem_table_id)
>  {
>      int ivhd_table_len = 24;
> -    int iommu_start = table_data->len;
>      AMDVIState *s = AMD_IOMMU_DEVICE(x86_iommu_get_default());
>      GArray *ivhd_blob = g_array_new(false, true, 1);
> +    AcpiTable table = { .sig = "IVRS", .rev = 1, .oem_id = oem_id,
> +                        .oem_table_id = oem_table_id };
>  
> -    /* IVRS header */
> -    acpi_data_push(table_data, sizeof(AcpiTableHeader));
> +    acpi_table_begin(&table, table_data);
>      /* IVinfo - IO virtualization information common to all
>       * IOMMU units in a system
>       */
> @@ -2409,10 +2409,7 @@ build_amd_iommu(GArray *table_data, BIOSLinker *linker, const char *oem_id,
>                                   0x48,                      /* special device */
>                                   8);
>      }
> -
> -    build_header(linker, table_data, (void *)(table_data->data + iommu_start),
> -                 "IVRS", table_data->len - iommu_start, 1, oem_id,
> -                 oem_table_id);
> +    acpi_table_end(linker, &table);
>  }
>  
>  typedef
> 
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric


