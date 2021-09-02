Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 126563FEE53
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 15:06:47 +0200 (CEST)
Received: from localhost ([::1]:39226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLmQY-0004zo-4g
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 09:06:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mLmGI-0002yT-OA
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:56:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mLmGE-00086x-HV
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:56:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630587365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qeWBDJF79GT624ZpXWESeuy8/Uow/Kf+d3pOnzUy+Pc=;
 b=hIHQPt+aRwOYOdUG5lUyb5DE3CKJOWKHvbhuiAJKEjD9/ChRV+CQHi+QeLesZVZmRbgPM3
 RU1EUybrELtot82btkU8mKfiEPOTFH8A9y/ZlMCJlVIR6bAFr2x+EEnHUMwO9KQaw8gK0p
 SDR4laebpVZXEmczAOqVl43Fhb50GQY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-fu_nQyNCOLOHsr_B7_WENw-1; Thu, 02 Sep 2021 08:56:03 -0400
X-MC-Unique: fu_nQyNCOLOHsr_B7_WENw-1
Received: by mail-wr1-f70.google.com with SMTP id
 v18-20020adfe2920000b029013bbfb19640so495744wri.17
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 05:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qeWBDJF79GT624ZpXWESeuy8/Uow/Kf+d3pOnzUy+Pc=;
 b=ViHXJXaELbuDVXP89fK6YPMGUqz8XMpu3uDHaf4nQGRZLa6yJK+sHwvRjXmJmvncKx
 124Fm0+ZjwsS2U5R1txWfetrsxu1eXocQT9fEIOMtYZ29auBn9zV33k7IBkQLxN/+NTE
 RqWPtr1CDTDZhi4F8PF115Dck38bR3ysycuXj7W/uD/QoQTYovly43f3Kwi557ndejZ+
 iUIWikkLz87bmy+1B/cSdUHpG/mRdzrHTFloQ981byyJUIlfEy1py4gJAn9/lXocYdfH
 B7IICqhjxLq0l0fHwqs4phnPZD9rgVTcQgcXrwTWdn3Tpl6yLuoP7GuPL12RHwguvyp7
 1Ovg==
X-Gm-Message-State: AOAM530VFcE2dSUYhYuVh5dg3SJJMUEk9utGyKjkvqn/unlxn8u1oOCb
 ISlSpxcH/A7ijDoSKJCd2pmqUMkzPiLrQLnjjGcrz0Kj7pKJA8Vsn4ahj5vxcSgZRvxGRJ0zrg3
 iNq62PdnZDQrRG9E=
X-Received: by 2002:adf:9d4b:: with SMTP id o11mr3722905wre.29.1630587361990; 
 Thu, 02 Sep 2021 05:56:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwn+TrLhWgrd/lr8RutrrUUDw2L3YPZNauvM61IW8h39aQdCouhEVqpfJCAPpsxLbSAr23/+w==
X-Received: by 2002:adf:9d4b:: with SMTP id o11mr3722883wre.29.1630587361729; 
 Thu, 02 Sep 2021 05:56:01 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id k16sm1771897wrh.24.2021.09.02.05.56.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 05:56:01 -0700 (PDT)
Subject: Re: [PATCH v2 01/35] acpi: add helper routines to initialize ACPI
 tables
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210708154617.1538485-1-imammedo@redhat.com>
 <20210708154617.1538485-2-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <03839787-0664-afcb-28fb-e95830138815@redhat.com>
Date: Thu, 2 Sep 2021 14:56:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210708154617.1538485-2-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eauger@redhat.com;
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

Hi Igor,

On 7/8/21 5:45 PM, Igor Mammedov wrote:
> Patch introduces acpi_init_table()/acpi_table_composed() API
> that hides pointer/offset arithmetic from user as opposed
> to build_header(), to prevent errors caused by it [1].
> 
>  acpi_init_table():
>      initializes table header and keeps track of
>      table data/offsets
>  acpi_table_composed():
>      sets actual table length and tells bios loader
>      where table is for the later initialization on
>      guest side.
might be worth to put those comments in the code as doc comments since
"_composed" terminology is not self-explanatory?
> 
> 1) commits
>    bb9feea43179 x86: acpi: use offset instead of pointer when using build_header()
>    4d027afeb3a9 Virt: ACPI: fix qemu assert due to re-assigned table data address
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  include/hw/acpi/aml-build.h | 14 +++++++++
>  hw/acpi/aml-build.c         | 58 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 72 insertions(+)
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
> index d5103e6d7b..c598010144 100644
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
> @@ -1692,6 +1705,51 @@ Aml *aml_object_type(Aml *object)
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
build_append_padded_str?
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
> +    /* patch "Length" field that has been reserved by acpi_init_table()
> +     * to the actual length, i.e. accumulated table length from
> +     * acpi_init_table() till acpi_table_composed()
> +     */
> +    memcpy(len_ptr, &table_len_le, sizeof table_len_le);
can't you use a garray/build_append function instead to be homogeneous
with the rest of the code?
> +
> +    bios_linker_loader_add_checksum(linker, ACPI_BUILD_TABLE_FILE,
> +        desc->table_offset, table_len, desc->table_offset + checksum_offset);
> +}
> +
>  void
>  build_header(BIOSLinker *linker, GArray *table_data,
>               AcpiTableHeader *h, const char *sig, int len, uint8_t rev,
> 

Thanks

Eric


