Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AA24144FD
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 11:22:10 +0200 (CEST)
Received: from localhost ([::1]:58524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSySA-0004My-3e
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 05:22:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mSyQJ-000365-Uk
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 05:20:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mSyQH-0001Fl-9r
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 05:20:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632302412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=495c930lUAj9sYLhbjb9ayUAPO3nEAHAKOiXzbpfxS4=;
 b=cmDacP0SCI3h4f9sB4NXoCbpEInPkSb3oV40CCA2Y4Um6R5MS7HU6CG/ySMCKtGf6QUR38
 A6NWg0ZmUtHGuqww/yClIr4KD7qBXx2twZnG5+kjjFn9eCMhBP/ElR/t9YylWWU4WGYykC
 Z7/YYZi7esbir+xdtAOFh0NMb38jzQA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-gWBxoHh6Nv6r9fUV41kIFA-1; Wed, 22 Sep 2021 05:20:11 -0400
X-MC-Unique: gWBxoHh6Nv6r9fUV41kIFA-1
Received: by mail-wr1-f71.google.com with SMTP id
 l9-20020adfc789000000b00160111fd4e8so1538799wrg.17
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 02:20:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=495c930lUAj9sYLhbjb9ayUAPO3nEAHAKOiXzbpfxS4=;
 b=H4I8iCg8T1mH1fscKDURjgiOFZt732TwNHi+Q3Ff6cEsEJOMn6xv2ZBVVxwV3OyMbd
 2d08Bv68qx0zViFcRu9bJI2HAZFlxExYn2+xSCOabWBBKPJuOXJLuU0++uWPj8q5FoQn
 COLYQ9njdRTiSVhIudB9Wn5ID/Vn3jkLE/kWQR5yPzoc5iyUxg25UJSmZckqEpJx3LWS
 OsEhWEyECI8akS4pB0zHdGycbLtIY7EIqX2E4s2kMILwZ45aGOx4591oCa0j4HHI1oq+
 qDHlSC9QKCpAvqQ2zuAKkEFAlAFovDxrCoqlqG97fOdE0dkD3LQgGP7FsT3k00ON+0hD
 rFkQ==
X-Gm-Message-State: AOAM5310S25lVdO499fJatUhc3uxAbjpdfwmvsMi/VoM5h0k4+EKuaHA
 ixBTZ3Faca7Ia6kHBV/2ehhbVsUZG8H5RwMwXb3JUQSdn1PIXncf9fME/PAwRX0w1iiCmXqpelB
 aBzwWTNsXNZLanYE=
X-Received: by 2002:a5d:5351:: with SMTP id t17mr41220085wrv.405.1632302410346; 
 Wed, 22 Sep 2021 02:20:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYdmWre1A1LZfiX/5n6nac0rQo9F0ZeIuRrD6Prpcm81XW/vn6xRqdOf3XcL/PlGDKh6aVkQ==
X-Received: by 2002:a5d:5351:: with SMTP id t17mr41220068wrv.405.1632302410134; 
 Wed, 22 Sep 2021 02:20:10 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id q10sm1381417wmq.12.2021.09.22.02.20.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 02:20:09 -0700 (PDT)
Subject: Re: [PATCH v3 19/35] acpi: build_waet: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210907144814.741785-1-imammedo@redhat.com>
 <20210907144814.741785-20-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <cd52a722-389f-d85b-6bd3-446a5a582268@redhat.com>
Date: Wed, 22 Sep 2021 11:20:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210907144814.741785-20-imammedo@redhat.com>
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
>  hw/i386/acpi-build.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 2875c4f393..45724469b0 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2201,10 +2201,10 @@ static void
>  build_waet(GArray *table_data, BIOSLinker *linker, const char *oem_id,
>             const char *oem_table_id)
>  {
> -    int waet_start = table_data->len;
> +    AcpiTable table = { .sig = "WAET", .rev = 1, .oem_id = oem_id,
> +                        .oem_table_id = oem_table_id };
>  
> -    /* WAET header */
> -    acpi_data_push(table_data, sizeof(AcpiTableHeader));
> +    acpi_table_begin(&table, table_data);
>      /*
>       * Set "ACPI PM timer good" flag.
>       *
> @@ -2213,9 +2213,7 @@ build_waet(GArray *table_data, BIOSLinker *linker, const char *oem_id,
>       * Which avoids costly VMExits caused by guest re-reading it unnecessarily.
>       */
>      build_append_int_noprefix(table_data, 1 << 1 /* ACPI PM timer good */, 4);
> -
> -    build_header(linker, table_data, (void *)(table_data->data + waet_start),
> -                 "WAET", table_data->len - waet_start, 1, oem_id, oem_table_id);
> +    acpi_table_end(linker, &table);
>  }
>  
>  /*
> 
an easy one

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric


