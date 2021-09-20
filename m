Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 296284119F9
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 18:42:08 +0200 (CEST)
Received: from localhost ([::1]:34724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSMMp-0002el-59
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 12:42:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mSM8K-0004Es-2d
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:27:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mSM8I-0007H3-9O
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:27:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632155225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=furhIU5k1oKJG53JCCaQxNUTccM7gPWDAnpSFJZFmOY=;
 b=fsLg9UUpierMfQvy9EFstssTnOcmm0Ug2XH/DkqMg0Spt8SmU4PIVm45TRKQvhGwyBQqES
 cSVOxVgK/J4IMZx0WOacbPZyKmMXj0Aqr2uuzK/Gg13wWCxZmr3ZeE+Vmwk/0SnfVpay+j
 SBNI6J+yuOyiUksZhRB2dt2s0bvMiL8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-hjO-35aOOUWwteDg89FV4Q-1; Mon, 20 Sep 2021 12:27:04 -0400
X-MC-Unique: hjO-35aOOUWwteDg89FV4Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 c2-20020adfa302000000b0015e4260febdso5237422wrb.20
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 09:27:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=furhIU5k1oKJG53JCCaQxNUTccM7gPWDAnpSFJZFmOY=;
 b=1dBNgA8eRfKefvJRHuBK0FzTNdnoV6nRpYIVueYlxttbWn6bBuAhVZB26SvHKnhYQS
 HWg1L/TkGEYdulHcd/JbKo/PWyC5SXKKTHVzgulqQdWa2DwvChssDODCyNMxYtBbzUT5
 O9NEQVoxolZrauNtNg2cpGU5YRQNZSBeSJuoTHbezHtTQ3K9wrQVGne6i7TcolJCThfy
 o+uw9jhQ1KEuqohpfX7dKFG5EtMuQS72u8c3PjFD9s/9ZjBXTHB2mOpuCiiAEn7UX6+Q
 BL0Bu0xbwovqYELVb1yrBjkIFcFYeg3Sj28JDCEs3T7N5+/QZwXgfNXYmo1M4liNNtTA
 LDmg==
X-Gm-Message-State: AOAM531r0HX5+uzACVfn8/WR8kEcPNYlywVA7tWT8eSH7MgqE6mzicSe
 FysFsBBHUzd4X8c4gwuF43MLuB3yRA47Ejx2kDzxz2U5r3EO5Jqt/KS/GUVpc6pf1TOXoRQyoA8
 5rGDLvcVy6Ks07Ys=
X-Received: by 2002:a05:600c:4991:: with SMTP id
 h17mr30499475wmp.74.1632155223276; 
 Mon, 20 Sep 2021 09:27:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwF47CrDjuLUqcRMop8RN22Dbiwoxt7Io1NtN8Y3f2pgTRExtNBfF493YE08vrYG9PyNwq3LQ==
X-Received: by 2002:a05:600c:4991:: with SMTP id
 h17mr30499458wmp.74.1632155223140; 
 Mon, 20 Sep 2021 09:27:03 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id j21sm16360041wrd.48.2021.09.20.09.27.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 09:27:02 -0700 (PDT)
Subject: Re: [PATCH v3 07/35] acpi: acpi_build_hest: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210907144814.741785-1-imammedo@redhat.com>
 <20210907144814.741785-8-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <bca27e57-aa05-1fdb-dacd-4ccbe30087c4@redhat.com>
Date: Mon, 20 Sep 2021 18:27:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210907144814.741785-8-imammedo@redhat.com>
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
Cc: drjones@redhat.com, Dongjiu Geng <gengdongjiu1@gmail.com>,
 qemu-arm@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/7/21 4:47 PM, Igor Mammedov wrote:
> it replaces error-prone pointer arithmetic for build_header() API,
> with 2 calls to start and finish table creation,
> which hides offsets magic from API user.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Dongjiu Geng <gengdongjiu1@gmail.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
> v3:
>   * s/acpi_init_table|acpi_table_composed/acpi_table_begin|acpi_table_end/
> 
> CC: qemu-arm@nongnu.org
> CC: drjones@redhat.com
> CC: gengdongjiu1@gmail.com
> CC: eauger@redhat.com
> ---
>  hw/acpi/ghes.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index a749b84d62..45d9a809cc 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -362,18 +362,16 @@ static void build_ghes_v2(GArray *table_data, int source_id, BIOSLinker *linker)
>  void acpi_build_hest(GArray *table_data, BIOSLinker *linker,
>                       const char *oem_id, const char *oem_table_id)
>  {
> -    uint64_t hest_start = table_data->len;
> +    AcpiTable table = { .sig = "HEST", .rev = 1,
> +                        .oem_id = oem_id, .oem_table_id = oem_table_id };
>  
> -    /* Hardware Error Source Table header*/
> -    acpi_data_push(table_data, sizeof(AcpiTableHeader));
> +    acpi_table_begin(&table, table_data);
>  
>      /* Error Source Count */
>      build_append_int_noprefix(table_data, ACPI_GHES_ERROR_SOURCE_COUNT, 4);
> -
>      build_ghes_v2(table_data, ACPI_HEST_SRC_ID_SEA, linker);
>  
> -    build_header(linker, table_data, (void *)(table_data->data + hest_start),
> -                 "HEST", table_data->len - hest_start, 1, oem_id, oem_table_id);
> +    acpi_table_end(linker, &table);
>  }
>  
>  void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
> 


