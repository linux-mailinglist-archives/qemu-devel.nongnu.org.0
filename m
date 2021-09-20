Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A52E411B9A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 18:59:38 +0200 (CEST)
Received: from localhost ([::1]:40028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSMdl-0000JJ-CQ
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 12:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mSMEA-0006bX-JT
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:33:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mSME8-0003g6-MU
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:33:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632155587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T7ibi1Xmil/KMGQvBU3n03Ranedj7DRx72e57E/vwv4=;
 b=fqVIZCPBjML87zmWXwdw5ZNLq4mp2lEM3wvNq6Z8e9Bbz9skUeg6KHQ3qREBOnh78MsCed
 VHNguqS2cCNCZbL9Ic5GAv5xAlSrWUoK3EXDNZYOhWe2ZebDDKarQNIJId4DglHBmD6Alo
 uW7Fa/8PHh4BrEzEP0J3EYsM9jpo+JE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-Ez3Wb0l3OSegFkn63ZB5ew-1; Mon, 20 Sep 2021 12:33:06 -0400
X-MC-Unique: Ez3Wb0l3OSegFkn63ZB5ew-1
Received: by mail-wr1-f72.google.com with SMTP id
 x7-20020a5d6507000000b0015dada209b1so6560351wru.15
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 09:33:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T7ibi1Xmil/KMGQvBU3n03Ranedj7DRx72e57E/vwv4=;
 b=tj/1tKrfQ+SEExs/IS/wWxSLKgqgTWnVqCAQ+3OjzeiFqDWMwfwel/SRSO1ddsSo+Z
 GGn0BebjUkkSwurzFoFUPSEe7pEpb2R8hufBBC8g3OenNaKOzsqQjt6rYtdaWFX5zs24
 3Mv7vKWMfkasR06YPZRZvmkSkLTuAg2l1lFhKWluRVDB4zvM4+refQndNPozPnFGUTi1
 Z7XI1QvqTq7v2LeiY+ryzrEUG8KbxIz1UE6Lb3gi71vZzr/H2ze0CL0TagTI6Tdop6wF
 vtULZLQhOglNSdOhZCiT5zWKvQvfeeqFNhuzalavCFa1MKX5QfN1DWBrNo33gDwKFVqI
 6Spg==
X-Gm-Message-State: AOAM533aL2FNz7POPnlAM2K8LcfJH0Jttp7FGKPBDueS1v3bVv0252rF
 13cqtyobFxjNAJ/KYBI4yrhbV4bIWIXYxaDGMxKG+3iqNtcjS3lyIwj+YZGOtTPNzxphK7T8WxR
 +oPcAJjC7K5rkZWs=
X-Received: by 2002:a05:600c:4b87:: with SMTP id
 e7mr30409395wmp.108.1632155585490; 
 Mon, 20 Sep 2021 09:33:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBMriR5iyAj4l/ZDM1DaUcrYp/k0XG6re7lMXOWiNhuDZJ/wrxJ/Bxhx6NZ+3P2LtSRQr4mw==
X-Received: by 2002:a05:600c:4b87:: with SMTP id
 e7mr30409366wmp.108.1632155585276; 
 Mon, 20 Sep 2021 09:33:05 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id v21sm11504120wrv.3.2021.09.20.09.33.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 09:33:04 -0700 (PDT)
Subject: Re: [PATCH v3 09/35] acpi: build_hmat: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210907144814.741785-1-imammedo@redhat.com>
 <20210907144814.741785-10-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <914b59ec-d0ed-fe88-212f-f0bdbf21239e@redhat.com>
Date: Mon, 20 Sep 2021 18:33:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210907144814.741785-10-imammedo@redhat.com>
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
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Igor,

On 9/7/21 4:47 PM, Igor Mammedov wrote:
> it replaces error-prone pointer arithmetic for build_header() API,
> with 2 calls to start and finish table creation,
> which hides offsets magic from API user.
> 
> Also since acpi_table_begin() reserves space only for standard header
> while previous acpi_data_push() reserved the header + 4 bytes field,
> add 4 bytes 'Reserved' field into hmat_build_table_structs()
> which didn have it.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eruc
> ---
> v3:
>   * s/acpi_init_table|acpi_table_composed/acpi_table_begin|acpi_table_end/
> ---
>  hw/acpi/hmat.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/acpi/hmat.c b/hw/acpi/hmat.c
> index edb3fd91b2..6913ebf730 100644
> --- a/hw/acpi/hmat.c
> +++ b/hw/acpi/hmat.c
> @@ -200,6 +200,8 @@ static void hmat_build_table_structs(GArray *table_data, NumaState *numa_state)
>      HMAT_LB_Info *hmat_lb;
>      NumaHmatCacheOptions *hmat_cache;
>  
> +    build_append_int_noprefix(table_data, 0, 4); /* Reserved */
> +
>      for (i = 0; i < numa_state->num_nodes; i++) {
>          flags = 0;
>  
> @@ -256,14 +258,10 @@ static void hmat_build_table_structs(GArray *table_data, NumaState *numa_state)
>  void build_hmat(GArray *table_data, BIOSLinker *linker, NumaState *numa_state,
>                  const char *oem_id, const char *oem_table_id)
>  {
> -    int hmat_start = table_data->len;
> -
> -    /* reserve space for HMAT header  */
> -    acpi_data_push(table_data, 40);
> +    AcpiTable table = { .sig = "HMAT", .rev = 2,
> +                        .oem_id = oem_id, .oem_table_id = oem_table_id };
>  
> +    acpi_table_begin(&table, table_data);
>      hmat_build_table_structs(table_data, numa_state);
> -
> -    build_header(linker, table_data,
> -                 (void *)(table_data->data + hmat_start),
> -                 "HMAT", table_data->len - hmat_start, 2, oem_id, oem_table_id);
> +    acpi_table_end(linker, &table);
>  }
> 


