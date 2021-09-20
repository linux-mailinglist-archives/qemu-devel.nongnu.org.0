Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDC1411A9B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 18:49:30 +0200 (CEST)
Received: from localhost ([::1]:48870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSMTx-0003zF-4r
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 12:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mSM9T-0006gV-3X
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:28:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mSM9O-00088c-GI
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:28:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632155293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D3TekfOIZuwbV5StCzYTTlbMrwMo9h/VmXf9CiJ57Lk=;
 b=ACbowlYWY8KBF9mjkKYfK4CqQqZ7ZuQ+PrPJgrRV/gpiz356BgIvKEWt2xPz91WtOlngfT
 eWYkD9H9ZI4POoA0hl7ueEZUTI1j+8NVuR0BrJEuK2VxteiIMhS7gKpV87eB6nqRpUGtFM
 4Xy0R7p/+yqkN3ttH5DuQlwWcPPvTzo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-AFwv3-tFO7-S1WbjIGGS7A-1; Mon, 20 Sep 2021 12:28:12 -0400
X-MC-Unique: AFwv3-tFO7-S1WbjIGGS7A-1
Received: by mail-wr1-f71.google.com with SMTP id
 q14-20020a5d574e000000b00157b0978ddeso6559229wrw.5
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 09:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D3TekfOIZuwbV5StCzYTTlbMrwMo9h/VmXf9CiJ57Lk=;
 b=IUXwpZDcPh03aX91GjuxcEWIOswrXzdWdZ2buj+eTJwf2wjXsptrio2F9ORPHCkVAg
 EOWLr8l2q74hvxfnBxD4uWyDndveX4C5qYBF/fxZ57PZwmPpSWldv0cTch4skp6CfdKn
 PB6AVNwlUMNHfkWToLVE5hhbK36WNwj1fPodbDGq0l+zmCsEC9y1wECynGrRB8gpJKuh
 Aayjvud/bbiZQAtT5E86LhLul9l4UtimvdWLw3qdMB/43inyh7CV9wdhd0NHp/2XABgM
 6R2VSTDMCAm3oHajU4zDRi5UYKwA0gLF3dYTU7o3CSVFdYbRHX7ZZVOSq6VNYN/jxBPD
 /NCQ==
X-Gm-Message-State: AOAM532993O9csjhKb/L/ld93B8ZjoTWT1oxhLTi2FmfWUKzZimM6t5j
 ws3niMBiClh/6sueUoKZ830uMXMZS8B+E3JXCZvJ89sHEMfxdjcWjfCK0nWcILNGjRIIAhqIOiH
 fILGQabIllCN6rTY=
X-Received: by 2002:adf:e485:: with SMTP id i5mr28917130wrm.22.1632155291548; 
 Mon, 20 Sep 2021 09:28:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgrnJzru5LGlMXw9jyXm1fizh3gOOCRkUBcmjfyxYlCT29Xr/NQvC2mSCzXO9hQbbLymYhLg==
X-Received: by 2002:adf:e485:: with SMTP id i5mr28917111wrm.22.1632155291364; 
 Mon, 20 Sep 2021 09:28:11 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id d70sm6152wmd.3.2021.09.20.09.28.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 09:28:10 -0700 (PDT)
Subject: Re: [PATCH v3 08/35] acpi: build_mcfg: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210907144814.741785-1-imammedo@redhat.com>
 <20210907144814.741785-9-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <081a9eb2-d409-ca93-fa3b-28a25c7fd2dd@redhat.com>
Date: Mon, 20 Sep 2021 18:28:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210907144814.741785-9-imammedo@redhat.com>
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
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
> v3:
>   * s/acpi_init_table|acpi_table_composed/acpi_table_begin|acpi_table_end/
> ---
>  hw/acpi/pci.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/acpi/pci.c b/hw/acpi/pci.c
> index 75b1103ec4..20b70dcd81 100644
> --- a/hw/acpi/pci.c
> +++ b/hw/acpi/pci.c
> @@ -28,19 +28,20 @@
>  #include "hw/acpi/pci.h"
>  #include "hw/pci/pcie_host.h"
>  
> +/*
> + * PCI Firmware Specification, Revision 3.0
> + * 4.1.2 MCFG Table Description.
> + */
>  void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info,
>                  const char *oem_id, const char *oem_table_id)
>  {
> -    int mcfg_start = table_data->len;
> +    AcpiTable table = { .sig = "MCFG", .rev = 1,
> +                        .oem_id = oem_id, .oem_table_id = oem_table_id };
> +
> +    acpi_table_begin(&table, table_data);
>  
> -    /*
> -     * PCI Firmware Specification, Revision 3.0
> -     * 4.1.2 MCFG Table Description.
> -     */
> -    acpi_data_push(table_data, sizeof(AcpiTableHeader));
>      /* Reserved */
>      build_append_int_noprefix(table_data, 0, 8);
> -
>      /*
>       * Memory Mapped Enhanced Configuration Space Base Address Allocation
>       * Structure
> @@ -56,6 +57,5 @@ void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info,
>      /* Reserved */
>      build_append_int_noprefix(table_data, 0, 4);
>  
> -    build_header(linker, table_data, (void *)(table_data->data + mcfg_start),
> -                 "MCFG", table_data->len - mcfg_start, 1, oem_id, oem_table_id);
> +    acpi_table_end(linker, &table);
>  }
> 


