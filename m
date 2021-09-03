Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0C93FFB07
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 09:23:15 +0200 (CEST)
Received: from localhost ([::1]:56930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM3Xe-000737-6B
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 03:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mM3Wl-0006MT-2k
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 03:22:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mM3Wh-00034G-BV
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 03:22:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630653734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kilyEN0XwaU0jFghZyXUNO41y7jptKzhM7U31yKPC/E=;
 b=DkhC+IsoITOiVGai5v7WYmKb7sZejqlYQms00vBiSYMR8ARUQca50j1OCVhN8pBbuR5jPE
 6cbDoRSDUptaY2OUqZ22VDgKxMhSwCvco47JHSdx00os4g1+aAa2qF8aYnKmwcQVG9p3u0
 ZIPId7sa6gOAnzMk1wJYgLlFws2eb1w=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-kUqmhAEIM5CIz1YLf2Debg-1; Fri, 03 Sep 2021 03:22:13 -0400
X-MC-Unique: kUqmhAEIM5CIz1YLf2Debg-1
Received: by mail-wm1-f71.google.com with SMTP id
 r4-20020a1c4404000000b002e728beb9fbso2271579wma.9
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 00:22:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kilyEN0XwaU0jFghZyXUNO41y7jptKzhM7U31yKPC/E=;
 b=X0QqrhJ93azHj6QiJDY3b7NDod6aimEUnZtwlPTERcf71klB+BgkKgHWU7chO5yk6X
 6mnR8Q+TjcBWKqsVF2YONUPhXZ3QRZ7xvUkLcjY60gHEKtSLZPYu/lz+WOvT1+86SxrI
 pd+A299NAQcomqhAmQwL3h9uF0bFiSLucWjQ/ANFtNp/UAUoQJUSG3TJ7L8caowu5IDn
 FaSiirhT9IW+4zxyVCZ2XBLU5qQlmhA1fR7J6Gp3xDCN+ArFI3HqAbFJDvXRJ2iPaQBM
 Roy0AKb1q00X7OZ0HpcyoOrC2JZB8IM7TfEl+xdGb+k3j289DYnqRRktrQAthXxScB7v
 s5fg==
X-Gm-Message-State: AOAM530WqBrPgWQp/EOj1hRtI0A0X2VdtWjGOzFRNYuPJaiH9CDcXI/p
 dxqbGBuybRFERiSdI9Eky4gkH3rXVgH7VQDeQDyKNq0byVoKJfspXq46o5DpxUWvKQavRZLQQnl
 RNrjVnJni6h7O7kc=
X-Received: by 2002:adf:fb91:: with SMTP id a17mr2210214wrr.376.1630653731982; 
 Fri, 03 Sep 2021 00:22:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZq4KkV8WOCIFkM6qtwvGliKZgf3v5+R/uR7xTfXRizATtG20dxAdS9jwQSvVzEePU3//DLQ==
X-Received: by 2002:adf:fb91:: with SMTP id a17mr2210192wrr.376.1630653731735; 
 Fri, 03 Sep 2021 00:22:11 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id j207sm3862937wmj.40.2021.09.03.00.22.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 00:22:11 -0700 (PDT)
Subject: Re: [PATCH v2 01/35] acpi: add helper routines to initialize ACPI
 tables
To: Igor Mammedov <imammedo@redhat.com>
References: <20210708154617.1538485-1-imammedo@redhat.com>
 <20210708154617.1538485-2-imammedo@redhat.com>
 <03839787-0664-afcb-28fb-e95830138815@redhat.com>
 <20210903091221.407cc17e@redhat.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <5ae754db-2f14-d91d-4091-953c1cc83762@redhat.com>
Date: Fri, 3 Sep 2021 09:22:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210903091221.407cc17e@redhat.com>
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
Cc: qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Igor,

On 9/3/21 9:12 AM, Igor Mammedov wrote:
> On Thu, 2 Sep 2021 14:56:00 +0200
> Eric Auger <eauger@redhat.com> wrote:
> 
>> Hi Igor,
>>
>> On 7/8/21 5:45 PM, Igor Mammedov wrote:
>>> Patch introduces acpi_init_table()/acpi_table_composed() API
>>> that hides pointer/offset arithmetic from user as opposed
>>> to build_header(), to prevent errors caused by it [1].
>>>
>>>  acpi_init_table():
>>>      initializes table header and keeps track of
>>>      table data/offsets
>>>  acpi_table_composed():
>>>      sets actual table length and tells bios loader
>>>      where table is for the later initialization on
>>>      guest side.  
>> might be worth to put those comments in the code as doc comments since
>> "_composed" terminology is not self-explanatory?
> 
> I'll add doc comments as suggested.
> A better idea how to name function is welcome as well?
acpi_table_build_init()/_complete() or somethink like that giving an
idea of what it does actually. But you would be obliged to revisit all
the patches. I think it is good enough if you add the comment.
> 
> 
>>> 1) commits
>>>    bb9feea43179 x86: acpi: use offset instead of pointer when using build_header()
>>>    4d027afeb3a9 Virt: ACPI: fix qemu assert due to re-assigned table data address
>>>
>>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>>> ---
>>>  include/hw/acpi/aml-build.h | 14 +++++++++
>>>  hw/acpi/aml-build.c         | 58 +++++++++++++++++++++++++++++++++++++
>>>  2 files changed, 72 insertions(+)
>>>
>>> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
>>> index 471266d739..d590660bd2 100644
>>> --- a/include/hw/acpi/aml-build.h
>>> +++ b/include/hw/acpi/aml-build.h
>>> @@ -413,6 +413,20 @@ Aml *aml_concatenate(Aml *source1, Aml *source2, Aml *target);
>>>  Aml *aml_object_type(Aml *object);
>>>  
>>>  void build_append_int_noprefix(GArray *table, uint64_t value, int size);
>>> +
>>> +typedef struct AcpiTable {
>>> +    const char *sig;
>>> +    const uint8_t rev;
>>> +    const char *oem_id;
>>> +    const char *oem_table_id;
>>> +    /* private vars tracking table state */
>>> +    GArray *array;
>>> +    unsigned table_offset;
>>> +} AcpiTable;
>>> +
>>> +void acpi_init_table(AcpiTable *desc, GArray *array);
>>> +void acpi_table_composed(BIOSLinker *linker, AcpiTable *table);
>>> +
>>>  void
>>>  build_header(BIOSLinker *linker, GArray *table_data,
>>>               AcpiTableHeader *h, const char *sig, int len, uint8_t rev,
>>> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>>> index d5103e6d7b..c598010144 100644
>>> --- a/hw/acpi/aml-build.c
>>> +++ b/hw/acpi/aml-build.c
>>> @@ -52,6 +52,19 @@ static void build_append_byte(GArray *array, uint8_t val)
>>>      g_array_append_val(array, val);
>>>  }
>>>  
>>> +static void build_append_padded_str(GArray *array, const char *str,
>>> +                                    size_t maxlen, char pad)
>>> +{
>>> +    size_t i;
>>> +    size_t len = strlen(str);
>>> +
>>> +    g_assert(len <= maxlen);
>>> +    g_array_append_vals(array, str, len);
>>> +    for (i = maxlen - len; i > 0; i--) {
>>> +        g_array_append_val(array, pad);
>>> +    }
>>> +}
>>> +
>>>  static void build_append_array(GArray *array, GArray *val)
>>>  {
>>>      g_array_append_vals(array, val->data, val->len);
>>> @@ -1692,6 +1705,51 @@ Aml *aml_object_type(Aml *object)
>>>      return var;
>>>  }
>>>  
>>> +void acpi_init_table(AcpiTable *desc, GArray *array)
>>> +{
>>> +
>>> +    desc->array = array;
>>> +    desc->table_offset = array->len;
>>> +
>>> +    /*
>>> +     * ACPI spec 1.0b
>>> +     * 5.2.3 System Description Table Header
>>> +     */
>>> +    g_assert(strlen(desc->sig) == 4);
>>> +    g_array_append_vals(array, desc->sig, 4); /* Signature */  
>> build_append_padded_str?
> 
> it will do the job even if it's a bit of overkill,
> signature must be 4 characters long so there is nothing to pad here
> (at least till this day).
> Using padded variant may confuse reader in the future,
> so I'd prefer to keep this line as is.

sure it was just a nit
> 
> 
>>> +    build_append_int_noprefix(array, 0, 4); /* Length */
>>> +    build_append_int_noprefix(array, desc->rev, 1); /* Revision */
>>> +    build_append_int_noprefix(array, 0, 1); /* Checksum */
>>> +    build_append_padded_str(array, desc->oem_id, 6, ' '); /* OEMID */
>>> +    /* OEM Table ID */
>>> +    build_append_padded_str(array, desc->oem_table_id, 8, ' ');
>>> +    build_append_int_noprefix(array, 1, 4); /* OEM Revision */
>>> +    g_array_append_vals(array, ACPI_BUILD_APPNAME8, 4); /* Creator ID */
> 
> here we potentially can reuse build_append_padded_str() if we
> remove padding in ACPI_BUILD_APPNAME8, but that should wait till
> refactoring is complete (to avoid breaking incremental refactoring)

OK
> 
>>> +    build_append_int_noprefix(array, 1, 4); /* Creator Revision */
>>> +}
>>> +
>>> +void acpi_table_composed(BIOSLinker *linker, AcpiTable *desc)
>>> +{
>>> +    /*
>>> +     * ACPI spec 1.0b
>>> +     * 5.2.3 System Description Table Header
>>> +     * Table 5-2 DESCRIPTION_HEADER Fields
>>> +     */
>>> +    const unsigned checksum_offset = 9;
>>> +    uint32_t table_len = desc->array->len - desc->table_offset;
>>> +    uint32_t table_len_le = cpu_to_le32(table_len);
>>> +    gchar *len_ptr = &desc->array->data[desc->table_offset + 4];
>>> +
>>> +    /* patch "Length" field that has been reserved by acpi_init_table()
>>> +     * to the actual length, i.e. accumulated table length from
>>> +     * acpi_init_table() till acpi_table_composed()
>>> +     */
>>> +    memcpy(len_ptr, &table_len_le, sizeof table_len_le);  
>> can't you use a garray/build_append function instead to be homogeneous
>> with the rest of the code?
> those are for inserting/adding _new_ values, and won't work here,
> here we are patching value in place, comment above was supposed
> to clarify that (I guess it wasn't sufficient),
> Care to suggest a better comment?

I thought  g_array_insert_vals() could do the job. No the comment was
clear to me actually.      Maybe in acpi_init_table, along with Length
comment you add a comment saying actual value will be set in composed().

Eric
> 
>>> +
>>> +    bios_linker_loader_add_checksum(linker, ACPI_BUILD_TABLE_FILE,
>>> +        desc->table_offset, table_len, desc->table_offset + checksum_offset);
>>> +}
>>> +
>>>  void
>>>  build_header(BIOSLinker *linker, GArray *table_data,
>>>               AcpiTableHeader *h, const char *sig, int len, uint8_t rev,
>>>   
>>
>> Thanks
>>
>> Eric
>>
> 


