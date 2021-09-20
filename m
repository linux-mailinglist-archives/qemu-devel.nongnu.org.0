Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BECEA411AEB
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 18:52:12 +0200 (CEST)
Received: from localhost ([::1]:53748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSMWZ-0007Hk-Qh
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 12:52:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mSMH6-0002Um-SN
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:36:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mSMH5-0006Ak-6D
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:36:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632155770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RB8IUWsV39pT6mG32TzQMIf/82YGOoITz6OTWTJoAqM=;
 b=TWRQi4NzVilSTaGhtCT/rXUXDHjcnrddjiucHcnDP+3S+VWcf8g2JIxi9QywLyyjSfDi3V
 JitrF+d/efjxmQvRa6Qpu1Ey2xleL6ynWC8j8vQZZ614uZxq9YHqgjfxouSpursaRUxPgx
 ERJ97+gvbNMWhny/2oBeCC2Iaw1Ipgo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-rWxjvEt4MnWZjVJ0kZ9wFg-1; Mon, 20 Sep 2021 12:36:09 -0400
X-MC-Unique: rWxjvEt4MnWZjVJ0kZ9wFg-1
Received: by mail-wr1-f72.google.com with SMTP id
 j16-20020adfa550000000b0016012acc443so1215519wrb.14
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 09:36:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RB8IUWsV39pT6mG32TzQMIf/82YGOoITz6OTWTJoAqM=;
 b=dcCjP6YkFApApJfvj1yu3ACrl62JLLTdZBlyt1hkIP4yumQ/OthQPDOVBRuvRt6oEn
 IrxO+M/feP9IXmNXjinm64q09bV5SoLfV7tVQYnWUifdOaHfW7b5LL9dg7VrIdibqA5n
 dDSBcNUDM+IbMXoGMZnhBmdRBdCydn6xB3ZIZMTstKzZ245UWlHXtaHTSG4+fsenS51p
 ELYvk9/ZVhRLYebZawlVuWpatJZgVxmU3ULdIbcGYUBFK9kIUDNWSY7+14t2YR56XFes
 QApR0AuYlKUueqjFeKlFldwXKQ3J/eA0QzciIeUR/ECH9Dny8I8pR2TuXgIKPE/50Ngg
 g1zA==
X-Gm-Message-State: AOAM531oZ//omhdeXjp/9IHBKH4QVcDjIb7QIVTUVqIZsCjmr60hWpKz
 wA7cC50KqExyvIrdJpMhO0SmirCVLubqThMPACHleWRlUiXIOiN2bqi8YSkcLxh85Rih5TBfKxu
 K965adk9MuQja1hc=
X-Received: by 2002:a1c:ed13:: with SMTP id l19mr30641587wmh.48.1632155767071; 
 Mon, 20 Sep 2021 09:36:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIQzdqE8OKGvg2XJZIoigPRKW/TLRRfjNZ1UWFLgNY76M93f+ena6gGEmyO/+27WgsqRTjYg==
X-Received: by 2002:a1c:ed13:: with SMTP id l19mr30641566wmh.48.1632155766775; 
 Mon, 20 Sep 2021 09:36:06 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id z6sm31785wmp.1.2021.09.20.09.36.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 09:36:06 -0700 (PDT)
Subject: Re: [PATCH v3 10/35] acpi: nvdimm_build_nfit: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210907144814.741785-1-imammedo@redhat.com>
 <20210907144814.741785-11-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <cb95db14-2fa0-a82c-5220-1d62bab437ee@redhat.com>
Date: Mon, 20 Sep 2021 18:36:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210907144814.741785-11-imammedo@redhat.com>
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
Cc: xiaoguangrong.eric@gmail.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/7/21 4:47 PM, Igor Mammedov wrote:
> it replaces error-prone pointer arithmetic for build_header() API,
> with 2 calls to start and finish table creation,
> which hides offsets magic from API user.
> 
> Also since acpi_table_begin() reserves space only for standard header
> while previous acpi_data_push() reserved the header + 4 bytes field,
> add 4 bytes 'Reserved' field into nvdimm_build_nfit() which didn't
> have it.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

> ---
> v3:
>   * s/acpi_init_table|acpi_table_composed/acpi_table_begin|acpi_table_end/
> 
> CC: xiaoguangrong.eric@gmail.com
> ---
>  hw/acpi/nvdimm.c | 42 +++++++++++++++++-------------------------
>  1 file changed, 17 insertions(+), 25 deletions(-)
> 
> diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
> index e3d5fe1939..15f6ca82ca 100644
> --- a/hw/acpi/nvdimm.c
> +++ b/hw/acpi/nvdimm.c
> @@ -44,22 +44,6 @@ static const uint8_t nvdimm_nfit_spa_uuid[] =
>        UUID_LE(0x66f0d379, 0xb4f3, 0x4074, 0xac, 0x43, 0x0d, 0x33,
>                0x18, 0xb7, 0x8c, 0xdb);
>  
> -/*
> - * NVDIMM Firmware Interface Table
> - * @signature: "NFIT"
> - *
> - * It provides information that allows OSPM to enumerate NVDIMM present in
> - * the platform and associate system physical address ranges created by the
> - * NVDIMMs.
> - *
> - * It is defined in ACPI 6.0: 5.2.25 NVDIMM Firmware Interface Table (NFIT)
> - */
> -struct NvdimmNfitHeader {
> -    ACPI_TABLE_HEADER_DEF
> -    uint32_t reserved;
> -} QEMU_PACKED;
> -typedef struct NvdimmNfitHeader NvdimmNfitHeader;
> -
>  /*
>   * define NFIT structures according to ACPI 6.0: 5.2.25 NVDIMM Firmware
>   * Interface Table (NFIT).
> @@ -401,25 +385,33 @@ void nvdimm_plug(NVDIMMState *state)
>      nvdimm_build_fit_buffer(state);
>  }
>  
> +/*
> + * NVDIMM Firmware Interface Table
> + * @signature: "NFIT"
> + *
> + * It provides information that allows OSPM to enumerate NVDIMM present in
> + * the platform and associate system physical address ranges created by the
> + * NVDIMMs.
> + *
> + * It is defined in ACPI 6.0: 5.2.25 NVDIMM Firmware Interface Table (NFIT)
> + */
> +
>  static void nvdimm_build_nfit(NVDIMMState *state, GArray *table_offsets,
>                                GArray *table_data, BIOSLinker *linker,
>                                const char *oem_id, const char *oem_table_id)
>  {
>      NvdimmFitBuffer *fit_buf = &state->fit_buf;
> -    unsigned int header;
> +    AcpiTable table = { .sig = "NFIT", .rev = 1,
> +                        .oem_id = oem_id, .oem_table_id = oem_table_id };
>  
>      acpi_add_table(table_offsets, table_data);
>  
> -    /* NFIT header. */
> -    header = table_data->len;
> -    acpi_data_push(table_data, sizeof(NvdimmNfitHeader));
> +    acpi_table_begin(&table, table_data);
> +    /* Reserved */
> +    build_append_int_noprefix(table_data, 0, 4);
>      /* NVDIMM device structures. */
>      g_array_append_vals(table_data, fit_buf->fit->data, fit_buf->fit->len);
> -
> -    build_header(linker, table_data,
> -                 (void *)(table_data->data + header), "NFIT",
> -                 sizeof(NvdimmNfitHeader) + fit_buf->fit->len, 1, oem_id,
> -                 oem_table_id);
> +    acpi_table_end(linker, &table);
>  }
>  
>  #define NVDIMM_DSM_MEMORY_SIZE      4096
> 


