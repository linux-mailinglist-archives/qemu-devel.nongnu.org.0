Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0F63B78D1
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:44:35 +0200 (CEST)
Received: from localhost ([::1]:41014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJes-00007Y-K5
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:44:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lyJEA-0005hr-6O
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 15:16:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lyJE2-0006yl-Kk
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 15:16:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624994208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ss1BjTae1AAGGNh7OlTYK7gWPz3HjX6szrT5uaOIkjE=;
 b=EVxl9Ri2mHGO3KVBIaz9n0T80esdv2tntcqcQ7Cea+4HSeFEw4ndKmIUDPxbnoGRHR5fCk
 CG7OYLETKtg30yejsDOnibN7+0qzP5F17KNuPmet4fiUiBXmjkibi/AZrKP5Gz3EIcfn/V
 lI7FtdzQIEKs8+z9M3LZ5Zr/Wn1bv3E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-z1P6JtInPL6f4f8_PMz5SA-1; Tue, 29 Jun 2021 15:16:47 -0400
X-MC-Unique: z1P6JtInPL6f4f8_PMz5SA-1
Received: by mail-wm1-f72.google.com with SMTP id
 q123-20020a1c43810000b02901e0ebb6227fso49788wma.9
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 12:16:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ss1BjTae1AAGGNh7OlTYK7gWPz3HjX6szrT5uaOIkjE=;
 b=Fz+mJvUor1taBu5SkvtAEq1MgIuxH4jRduk/5aIJKlriwmlH4lbyIR8A6JakCEFZQr
 zkR3M2UjJu9Q4sG//sB1nweLBCohu0X4VOHuu8U0v2YhhRnBzq/ZkN/bUW2WVrzkkIce
 WIKUPPXoT/Hv+1SujcUeNMijda5URl0HsWq1vL+tivhLKuD8kvy2Fx68pJsmJt06I9Us
 OE7Q9HKWihkjrih1VpxOjFeNsFyARZ4vengcJ4WoFxTWNWwFL8D397ILKNYF0O7pmvWR
 NuQ2DHDuf0BDku25niLs4VWCSUz9wRRhVcgRVQZosKD/g0/zS94SbvrvZBYuBvsCQagB
 HDdQ==
X-Gm-Message-State: AOAM5301CulayUChZGe+frvke1Xj1GUG3jefNt7goww90j2qNMmrqxdf
 qbKCMok7WQbqaVA1GcQiWtar6g9DIAv8JCWY8RnOxqQkPT9pdKRyiU7Bne3CG/Hl6O2M2d/pMGp
 yGZegMY3iAOCjRf0=
X-Received: by 2002:a5d:64a4:: with SMTP id m4mr36279824wrp.251.1624994206071; 
 Tue, 29 Jun 2021 12:16:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynPJTkiRd/cUuiFoU+jFUKtAeyYb43dJgtkCisFdh6JTbu7Jq9hfgW+kELlom0RqhKeROLWQ==
X-Received: by 2002:a5d:64a4:: with SMTP id m4mr36279805wrp.251.1624994205854; 
 Tue, 29 Jun 2021 12:16:45 -0700 (PDT)
Received: from redhat.com ([77.126.198.14])
 by smtp.gmail.com with ESMTPSA id w4sm2942695wrp.15.2021.06.29.12.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 12:16:45 -0700 (PDT)
Date: Tue, 29 Jun 2021 15:16:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 19/53] acpi: add helper routines to initialize ACPI tables
Message-ID: <20210629151142-mutt-send-email-mst@kernel.org>
References: <20210625091818.1047980-1-imammedo@redhat.com>
 <20210625091818.1047980-21-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210625091818.1047980-21-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 25, 2021 at 05:17:44AM -0400, Igor Mammedov wrote:
>    acpi_init_table():
>       initializes table header and keeps track of
>       table data/offsets
>    acpi_table_composed():
>       sets actual table length and tells bios loader
>       where it's for later initialization on guest side.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  include/hw/acpi/aml-build.h | 14 ++++++++++
>  hw/acpi/aml-build.c         | 53 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 67 insertions(+)
> 
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index 471266d739..d590660bd2 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -413,6 +413,20 @@ Aml *aml_concatenate(Aml *source1, Aml *source2, Aml *target);
>  Aml *aml_object_type(Aml *object);
>  
>  void build_append_int_noprefix(GArray *table, uint64_t value, int size);
> +
> +typedef struct AcpiTable {
> +    const char *sig;
> +    const uint8_t rev;
> +    const char *oem_id;
> +    const char *oem_table_id;
> +    /* private vars tracking table state */
> +    GArray *array;
> +    unsigned table_offset;
> +} AcpiTable;
> +
> +void acpi_init_table(AcpiTable *desc, GArray *array);
> +void acpi_table_composed(BIOSLinker *linker, AcpiTable *table);
> +
>  void
>  build_header(BIOSLinker *linker, GArray *table_data,
>               AcpiTableHeader *h, const char *sig, int len, uint8_t rev,
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index d5103e6d7b..576fc0238c 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -52,6 +52,19 @@ static void build_append_byte(GArray *array, uint8_t val)
>      g_array_append_val(array, val);
>  }
>  
> +static void build_append_padded_str(GArray *array, const char *str,
> +                                    size_t maxlen, char pad)
> +{
> +    size_t i;
> +    size_t len = strlen(str);
> +
> +    g_assert(len <= maxlen);
> +    g_array_append_vals(array, str, len);
> +    for (i = maxlen - len; i > 0; i--) {
> +        g_array_append_val(array, pad);
> +    }
> +}
> +
>  static void build_append_array(GArray *array, GArray *val)
>  {
>      g_array_append_vals(array, val->data, val->len);
> @@ -1692,6 +1705,46 @@ Aml *aml_object_type(Aml *object)
>      return var;
>  }
>  
> +void acpi_init_table(AcpiTable *desc, GArray *array)
> +{
> +
> +    desc->array = array;
> +    desc->table_offset = array->len;
> +
> +    /*
> +     * ACPI spec 1.0b
> +     * 5.2.3 System Description Table Header
> +     */
> +    g_assert(strlen(desc->sig) == 4);
> +    g_array_append_vals(array, desc->sig, 4); /* Signature */
> +    build_append_int_noprefix(array, 0, 4); /* Length */
> +    build_append_int_noprefix(array, desc->rev, 1); /* Revision */
> +    build_append_int_noprefix(array, 0, 1); /* Checksum */
> +    build_append_padded_str(array, desc->oem_id, 6, ' '); /* OEMID */
> +    /* OEM Table ID */
> +    build_append_padded_str(array, desc->oem_table_id, 8, ' ');
> +    build_append_int_noprefix(array, 1, 4); /* OEM Revision */
> +    g_array_append_vals(array, ACPI_BUILD_APPNAME8, 4); /* Creator ID */
> +    build_append_int_noprefix(array, 1, 4); /* Creator Revision */
> +}
> +
> +void acpi_table_composed(BIOSLinker *linker, AcpiTable *desc)
> +{
> +    /*
> +     * ACPI spec 1.0b
> +     * 5.2.3 System Description Table Header
> +     * Table 5-2 DESCRIPTION_HEADER Fields
> +     */
> +    const unsigned checksum_offset = 9;
> +    uint32_t table_len = desc->array->len - desc->table_offset;
> +    uint32_t table_len_le = cpu_to_le32(table_len);
> +    gchar *len_ptr = &desc->array->data[desc->table_offset + 4];
> +
> +    memcpy(len_ptr, &table_len_le, sizeof table_len_le);

ok so this patches in the correct length.
Not sure how to make it prettier ... at least please
add comments explaining what's going on here.

> +    bios_linker_loader_add_checksum(linker, ACPI_BUILD_TABLE_FILE,
> +        desc->table_offset, table_len, desc->table_offset + checksum_offset);
> +}
> +
>  void
>  build_header(BIOSLinker *linker, GArray *table_data,
>               AcpiTableHeader *h, const char *sig, int len, uint8_t rev,
> -- 
> 2.27.0


