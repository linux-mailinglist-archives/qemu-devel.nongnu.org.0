Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1784119C2
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 18:26:59 +0200 (CEST)
Received: from localhost ([::1]:52070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSM8A-0001Zw-PM
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 12:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mSM3C-000420-RD
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:21:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mSM3A-00034A-TZ
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:21:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632154908;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NiSXRV3gclmSrAgG2BaDrXqBzLCwQOza8SqoM12f7UY=;
 b=asUAv5RTeDwzeFQW9Y72jglI4uN2c4cSxg0zaSfstJ9bv6P2/cPL3iQKem+0MWCQXdTEfs
 GMZiI7S5iLn59xsJEcspd4bzbkolEvYdXDukozBxLUS06KTh5UtqJ7nmoh2tF3Ut19IlTa
 CPF9qdAnblM7gnmRUgvyl4dFwRH1YAc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-HTuF90xjNLGNbmp93Hbi9A-1; Mon, 20 Sep 2021 12:21:46 -0400
X-MC-Unique: HTuF90xjNLGNbmp93Hbi9A-1
Received: by mail-wr1-f72.google.com with SMTP id
 s13-20020a5d69cd000000b00159d49442cbso6547665wrw.13
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 09:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=NiSXRV3gclmSrAgG2BaDrXqBzLCwQOza8SqoM12f7UY=;
 b=vDNuP0UT6O2PEM99YiTJYBd1gjVVlK9zi135y5TZTRS1L08ytgrzmk9DpWcTGdizY/
 rHut12j/at3CZiYxc1HZ2B0mHcog5Nb8wXkn33rIwfmgsb/yYgXbx+dywMwbP5xWmGdo
 0/Tsu3wz4Gy7GWd6DxDg2Dhux0Rvo5ujoD73bq/XGe92ft27zQ9+YWPNo8HmyT92EjRD
 xFDOjVbsyNUaWY9TmLp0gq8QdQTINnzs5gyEIZT7snd84qI6kDOEGJEwYm4JS1ANRP77
 cQMrsqKCtzXFmZ6Ay7SWLR/gRhF+h/0kGYK38KbscV6egGrE0yOuow89nZMbVBpoDGwW
 +k4g==
X-Gm-Message-State: AOAM530FtDVfyiQEhvHoH16ceW1aFsa5FBxiFea5M2QANbj2TH7PFcVU
 qL9Xi61TdMYyh5G9S5QVBOTTMdXybxT2SpZjwmDx/2rjPy5i/cPBe/MjxhvFVkqxLvIuEA2bHnV
 67ozQ5w9rKyoOvzw=
X-Received: by 2002:a5d:54cf:: with SMTP id x15mr30338547wrv.27.1632154904498; 
 Mon, 20 Sep 2021 09:21:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEOxVpMOpSXRBZT64fepvZmV0b40THDCI29EqSVFFRCZ4mFmDYTNeviAWBBXPejD+G71cwxg==
X-Received: by 2002:a5d:54cf:: with SMTP id x15mr30338528wrv.27.1632154904291; 
 Mon, 20 Sep 2021 09:21:44 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id y11sm9154748wrg.18.2021.09.20.09.21.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 09:21:43 -0700 (PDT)
Subject: Re: [PATCH v3 01/35] acpi: add helper routines to initialize ACPI
 tables
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210907144814.741785-1-imammedo@redhat.com>
 <20210907144814.741785-2-imammedo@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <0ec39009-032a-6494-1b90-82deb06d7ce0@redhat.com>
Date: Mon, 20 Sep 2021 18:21:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210907144814.741785-2-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Reply-To: eric.auger@redhat.com
Cc: wangyanan55@huawei.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Igor,

On 9/7/21 4:47 PM, Igor Mammedov wrote:
> Patch introduces acpi_table_begin()/ acpi_table_end() API
> that hides pointer/offset arithmetic from user as opposed
> to build_header(), to prevent errors caused by it [1].
>
>  acpi_table_begin():
>      initializes table header and keeps track of
>      table data/offsets
>  acpi_table_end():
>      sets actual table length and tells bios loader
>      where table is for the later initialization on
>      guest side.
>
> 1) commits
>    bb9feea43179 x86: acpi: use offset instead of pointer when using build_header()
>    4d027afeb3a9 Virt: ACPI: fix qemu assert due to re-assigned table data address
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> CC: eric.auger@redhat.com
> CC: wangyanan55@huawei.com
> ---
>  include/hw/acpi/aml-build.h | 31 +++++++++++++++++++
>  hw/acpi/aml-build.c         | 62 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 93 insertions(+)
>
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index 471266d739..4242382399 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -413,6 +413,37 @@ Aml *aml_concatenate(Aml *source1, Aml *source2, Aml *target);
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
> +/**
> + * acpi_table_begin:
> + * initializes table header and keeps track of
> + * table data/offsets
> + * @desc: ACPI table descriptor
> + * @array: blob where the ACPI table will be composed/stored.
> + */
> +void acpi_table_begin(AcpiTable *desc, GArray *array);
> +
> +/**
> + * acpi_table_end:
> + * sets actual table length and tells bios loader
> + * where table is for the later initialization on
> + * guest side.
> + * @linker: reference to BIOSLinker object to use for the table
> + * @table: ACPI table descriptor that was used with @acpi_table_begin
> + * counterpart
> + */
> +void acpi_table_end(BIOSLinker *linker, AcpiTable *table);
> +
>  void
>  build_header(BIOSLinker *linker, GArray *table_data,
>               AcpiTableHeader *h, const char *sig, int len, uint8_t rev,
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index d5103e6d7b..229a3eb654 100644
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
> @@ -1692,6 +1705,55 @@ Aml *aml_object_type(Aml *object)
>      return var;
>  }
>  
> +void acpi_table_begin(AcpiTable *desc, GArray *array)
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
> +    /*
> +     * reserve space for Length field, which will be patched by
> +     * acpi_table_end() when the table creation is finished.
> +     */
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
> +void acpi_table_end(BIOSLinker *linker, AcpiTable *desc)
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
> +    /* patch "Length" field that has been reserved by acpi_table_begin()
> +     * to the actual length, i.e. accumulated table length from
> +     * acpi_table_begin() till acpi_table_end()
> +     */
> +    memcpy(len_ptr, &table_len_le, sizeof table_len_le);
> +
> +    bios_linker_loader_add_checksum(linker, ACPI_BUILD_TABLE_FILE,
> +        desc->table_offset, table_len, desc->table_offset + checksum_offset);
> +}
> +
>  void
>  build_header(BIOSLinker *linker, GArray *table_data,
>               AcpiTableHeader *h, const char *sig, int len, uint8_t rev,
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric


