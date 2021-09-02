Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0EC3FF097
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 17:56:53 +0200 (CEST)
Received: from localhost ([::1]:39704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLp5A-0003ku-PC
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 11:56:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mLokM-0000eA-SV
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 11:35:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mLokL-00085K-AE
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 11:35:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630596920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YretbNT8HLu7u5hVE10QkMbw4g360d+DdGPHMX0vFS4=;
 b=bzEdFJh/w0ZjYGVhIpkcvKcH3Oe6mzwB0ypREddUMzFjOlsaGTjjUZW0JcL3YNS3u7O4uu
 FGwoZTjhklkUk9UPbWU5FfNFIBeR6Z1XJD1Piqsam9pOD0IIGKjuF4x1oOTSHrQmHmUrQa
 QNmH0PZZSFgqv7zaMsu10rQzPzhT8BQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-ay7zZT99PlS62c5rA6vskw-1; Thu, 02 Sep 2021 11:35:19 -0400
X-MC-Unique: ay7zZT99PlS62c5rA6vskw-1
Received: by mail-wm1-f71.google.com with SMTP id
 a201-20020a1c7fd2000000b002e748bf0544so1201243wmd.2
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 08:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YretbNT8HLu7u5hVE10QkMbw4g360d+DdGPHMX0vFS4=;
 b=M6CZYZ2v+1vBT5XOmr5dsC7wNTSvETJSyKHuFbTqxGQrLkDHtGcGJ+cL5DZZIWgDxq
 YxDec7miZv7+iUxnEvNAZtcDlHb3Qt0pNr320Ux4FZfQ/4zg1en3JRmJrQPeXhQGpPFS
 jir1wFN3PIGjSHiY3NKvntnJNFKKXV9WzkdIObQSV8DGzcvmBhB7YHy5L9W3n6cB/uhk
 pnHaMXk3pxlPT/TjE4hc0vSFoC8305w42uHk9ZQGQc1DtZEGVrGC4+O4MlkVKDnKbu9F
 Ynxfsnu5XLjaMpSdFyAUHD3wnYRZ/kwpD/vn4ZP9PAW7GXuJTalUD0haYH7cZNomjIwE
 JMYw==
X-Gm-Message-State: AOAM531zurcp+nJcooA0IAI8DvrzYNDd9ds1HMqX59FVU1ZdfZEcRbGl
 i+cXxmOzD2cqISUlwSwa0ss3t6acNozYSJWg93gG5iZ+wdh5zUoIM6vXmvPc+zAUknvF7AfezBE
 hKH6+JFhnxRJrHuE=
X-Received: by 2002:adf:f08b:: with SMTP id n11mr4413057wro.176.1630596917968; 
 Thu, 02 Sep 2021 08:35:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNqP61W5TmY6lrranKEYT46caCf8mSJNNJ6O7JHtVIx9Lsim3w5yIWZ5l6XD8Pa//DMRjt/g==
X-Received: by 2002:adf:f08b:: with SMTP id n11mr4413032wro.176.1630596917747; 
 Thu, 02 Sep 2021 08:35:17 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id s14sm1888876wmc.25.2021.09.02.08.35.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 08:35:17 -0700 (PDT)
Subject: Re: [PATCH v2 13/35] acpi: x86: build_dsdt: use
 acpi_init_table()/acpi_table_composed() instead of build_header()
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210708154617.1538485-1-imammedo@redhat.com>
 <20210708154617.1538485-14-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <b2d08e88-f0dc-f4ac-c981-6223a485d413@redhat.com>
Date: Thu, 2 Sep 2021 17:35:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210708154617.1538485-14-imammedo@redhat.com>
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
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/8/21 5:45 PM, Igor Mammedov wrote:
> it replaces error-prone pointer arithmetic for build_header() API,
> with 2 calls to start and finish table creation,
> which hides offsets magic from API user.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
> CC: marcel.apfelbaum@gmail.com
> ---
>  hw/i386/acpi-build.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 796ffc6f5c..538af9d944 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1380,12 +1380,12 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>  #endif
>      int i;
>      VMBusBridge *vmbus_bridge = vmbus_bridge_find();
> +    AcpiTable table = { .sig = "DSDT", .rev = 1, .oem_id = x86ms->oem_id,
> +                        .oem_table_id = x86ms->oem_table_id };
>  
> +    acpi_init_table(&table, table_data);
>      dsdt = init_aml_allocator();
>  
> -    /* Reserve space for header */
> -    acpi_data_push(dsdt->buf, sizeof(AcpiTableHeader));
> -
>      build_dbg_aml(dsdt);
>      if (misc->is_piix4) {
>          sb_scope = aml_scope("_SB");
> @@ -1816,9 +1816,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>  
>      /* copy AML table into ACPI tables blob and patch header there */
>      g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
> -    build_header(linker, table_data,
> -        (void *)(table_data->data + table_data->len - dsdt->buf->len),
> -                 "DSDT", dsdt->buf->len, 1, x86ms->oem_id, x86ms->oem_table_id);
> +    acpi_table_composed(linker, &table);
>      free_aml_allocator();
>  }
>  
> 


