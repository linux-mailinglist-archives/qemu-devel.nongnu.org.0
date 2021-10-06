Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2761E423FC0
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 16:03:04 +0200 (CEST)
Received: from localhost ([::1]:45702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY7Vc-0004mV-OB
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 10:03:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mY7SD-0002m0-Sy
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 09:59:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mY7S9-0005rK-76
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 09:59:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633528763;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pf7UGfomKyP/Y+4LIYobe67u116qbakd8g8WmLZ7Oy8=;
 b=aNZcRDfrKdSuxmGlqDyPLOq0xDNp+aXQ8JWl/t+TdpyLp9SwKO3S4EkwlZYiWrw+vZOLvR
 p5ys1KxjNjhEO3SvSgs/YWPFxUcflqMVIdAqYnmrozqWlUDZFWJ9ZQNRaMmtmpVq/wSPBB
 vVFsCjcbu4CCx1v/wfFAudiWh2gsf/A=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-PI_VMNi7P0ygokcfVyykAA-1; Wed, 06 Oct 2021 09:59:20 -0400
X-MC-Unique: PI_VMNi7P0ygokcfVyykAA-1
Received: by mail-wr1-f72.google.com with SMTP id
 c2-20020adfa302000000b0015e4260febdso2103867wrb.20
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 06:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=pf7UGfomKyP/Y+4LIYobe67u116qbakd8g8WmLZ7Oy8=;
 b=NQgMIrTI3YWxkCY8SCNzu91xKuGmeDqDGLZggKMnEqRtQH4i8GSgMuqvlsrfZqls9N
 u4nJWBnNl0siHIqlNv6H9/jYdezV9svqSDyzQeaAetAlGZaVwLl36yQHpIm6P44Q4DiV
 3llyFLO7sTVC1scnFO5M0EUVURAMiZDGz65/PuPrgiB3Ib+H4BiLXkHSsn8SLJd+DO29
 dOHcJUYIAOCEAAPI8Q60VS/4sCKtQWZzEWhH+wsQozR8aSGQODqHD6nSrFbQHvACdrEa
 m6Is+KNd2Kv1S05m0ex7dfb7RwXzmXa40r1jfW/UBEbiOL8FzTk4e7FrWLpOKVf9SsBF
 Al3Q==
X-Gm-Message-State: AOAM531Nn8JWUBRnkIwnrmCoEhLdVuD0FTUAMY48xBXXGlpQ6b8ZL9Ik
 +bS3NMe+c8QT4uTog8jgA3oDZDz0mUAkWzd8NbIzDbl+v3crWDFvXZDbYYj5j/QvTKb+eRaKL/D
 2IL204ElCxyONU9o=
X-Received: by 2002:a5d:64a3:: with SMTP id m3mr29075003wrp.157.1633528758821; 
 Wed, 06 Oct 2021 06:59:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0pSZnx5fGAK76bUwbZyp02ChSdOBofqvdGHthUG1p7xUFiPyJYjGQ+pm7loQ0eXfhLPZ62g==
X-Received: by 2002:a5d:64a3:: with SMTP id m3mr29074975wrp.157.1633528758567; 
 Wed, 06 Oct 2021 06:59:18 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id q204sm3438764wme.10.2021.10.06.06.59.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 06:59:18 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] hw/arm/virt_acpi_build: Generate DBG2 table
To: Igor Mammedov <imammedo@redhat.com>
References: <20210927131732.63801-1-eric.auger@redhat.com>
 <20210927131732.63801-3-eric.auger@redhat.com>
 <20211006091523.qaub5xg3kxuwjmlh@gator.home>
 <2b284309-1dd6-6d73-225d-f83ad4af8657@redhat.com>
 <20211006154630.0acd896d@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <9196345f-749b-93e3-e7d7-38dfd4dd07f4@redhat.com>
Date: Wed, 6 Oct 2021 15:59:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211006154630.0acd896d@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, Andrew Jones <drjones@redhat.com>,
 gshan@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, philmd@redhat.com,
 ardb@kernel.org, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 10/6/21 3:46 PM, Igor Mammedov wrote:
> On Wed, 6 Oct 2021 11:57:07 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
>
>> Hi,
>>
>> On 10/6/21 11:15 AM, Andrew Jones wrote:
>>> On Mon, Sep 27, 2021 at 03:17:31PM +0200, Eric Auger wrote:  
>>>> ARM SBBR specification mandates DBG2 table (Debug Port Table 2)
>>>> since v1.0 (ARM DEN0044F 8.3.1.7 DBG2).
>>>>
>>>> The DBG2 table allows to describe one or more debug ports.
>>>>
>>>> Generate an DBG2 table featuring a single debug port, the PL011.
>>>>
>>>> The DBG2 specification can be found at
>>>> "Microsoft Debug Port Table 2 (DBG2)"
>>>> https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-debug-port-table?redirectedfrom=MSDN
>>>>
>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>
>>>> ---
>>>>
>>>> v2 -> v3:
>>>> Took into account all comments from Igor on v2:
>>>> mostly style adjustment, revision references
>>>>
>>>> v1 -> v2:
>>>> - rebased on Igor's refactoring
>>>> ---
>>>>  hw/arm/virt-acpi-build.c | 62 +++++++++++++++++++++++++++++++++++++++-
>>>>  1 file changed, 61 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>>>> index 6cec97352b..257d0fee17 100644
>>>> --- a/hw/arm/virt-acpi-build.c
>>>> +++ b/hw/arm/virt-acpi-build.c
>>>> @@ -616,6 +616,63 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>>>      acpi_table_end(linker, &table);
>>>>  }
>>>>  
>>>> +/* Debug Port Table 2 (DBG2) */
>>>> +static void
>>>> +build_dbg2(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)  
>>> nit: I didn't think QEMU liked this style, i.e. QEMU prefers
>>>
>>>  static void build_dbg2(GArray *table_data, BIOSLinker *linker,
>>>                         VirtMachineState *vms)
>>>
>>> Eh, I see that hw/arm/virt-acpi-build.c is full of the format you have
>>> here, so never mind.
>>>  
>>>> +{
>>>> +    AcpiTable table = { .sig = "DBG2", .rev = 3, .oem_id = vms->oem_id,  
>>> Can you explain where the .rev = 3 comes from? The spec says "For this
>>> version of the specification, this value is 0."  
>> The above revision field belongs to the acpi table header. Not to be
>> mixed with the Revision field of the DBG2 table
>> which is set below (set to 0):
>>
>> +    build_append_int_noprefix(table_data, 0, 1); /* Revision */
>>
>> Besides that's a good question. I have rev=3 here but that must come from a copy/paste. when googling I
>> found
>>
>> https://lists.denx.de/pipermail/u-boot/2015-June/217134.html
>> /header->revision = 1; /* ACPI 1.0/2.0: 1, ACPI 3.0: 2, ACPI 4.0: 3 */
>> Not sure if 3 is the right value though? Igor, please could you advise?
>> Thanks Eric /
>>
> "Table 1. Debug Port Table 2 format"
> says table revision must be 0
Hum OK, sorry was confused by the 2 different revision fields. I will
fix that.
>
>>>  
>>>> +                        .oem_table_id = vms->oem_table_id };
>>>> +    int dbg2devicelength;
>>>> +    const char name[] = "COM0";
>>>> +    const int namespace_length = sizeof(name);
>>>> +
>>>> +    acpi_table_begin(&table, table_data);
>>>> +
>>>> +    dbg2devicelength = 22 /* BaseAddressRegister[] offset */ +
>>>> +                       12 /* BaseAddressRegister[] */ +
>>>> +                       4 /* AddressSize[] */ +  
>>> I'd personally prefer the '+' before the comment, but maybe Igor has a
>>> special ACPI code format preference here.
> indeed '+' before comment should look better
OK

Eric
>
>>>  
>>>> +                       namespace_length /* NamespaceString[] */;
>>>> +
>>>> +    /* OffsetDbgDeviceInfo */
>>>> +    build_append_int_noprefix(table_data, 44, 4);
>>>> +    /* NumberDbgDeviceInfo */
>>>> +    build_append_int_noprefix(table_data, 1, 4);
>>>> +
>>>> +    /* Table 2. Debug Device Information structure format */
>>>> +    build_append_int_noprefix(table_data, 0, 1); /* Revision */
>>>> +    build_append_int_noprefix(table_data, dbg2devicelength, 2); /* Length */
>>>> +    /* NumberofGenericAddressRegisters */
>>>> +    build_append_int_noprefix(table_data, 1, 1);
>>>> +    /* NameSpaceStringLength */
>>>> +    build_append_int_noprefix(table_data, namespace_length, 2);
>>>> +    build_append_int_noprefix(table_data, 38, 2); /* NameSpaceStringOffset */
>>>> +    build_append_int_noprefix(table_data, 0, 2); /* OemDataLength */
>>>> +    /* OemDataOffset (0 means no OEM data) */
>>>> +    build_append_int_noprefix(table_data, 0, 2);
>>>> +
>>>> +    /* Port Type */
>>>> +    build_append_int_noprefix(table_data, 0x8000 /* Serial */, 2);
>>>> +    /* Port Subtype */
>>>> +    build_append_int_noprefix(table_data, 0x3 /* ARM PL011 UART */, 2);
>>>> +    build_append_int_noprefix(table_data, 0, 2); /* Reserved */
>>>> +    /* BaseAddressRegisterOffset */
>>>> +    build_append_int_noprefix(table_data, 22, 2);
>>>> +    /* AddressSizeOffset */
>>>> +    build_append_int_noprefix(table_data, 34, 2);
>>>> +
>>>> +    /* BaseAddressRegister[] */
>>>> +    build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 8, 0, 1,
>>>> +                     vms->memmap[VIRT_UART].base);
>>>> +
>>>> +    /* AddressSize[] */
>>>> +    build_append_int_noprefix(table_data, 0x1000 /* Register Space */, 4);
>>>> +
>>>> +    /* NamespaceString[] */
>>>> +    g_array_append_vals(table_data, name, namespace_length);
>>>> +
>>>> +    acpi_table_end(linker, &table);
>>>> +};
>>>> +
>>>>  /*
>>>>   * ACPI spec, Revision 5.1 Errata A
>>>>   * 5.2.12 Multiple APIC Description Table (MADT)
>>>> @@ -875,7 +932,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>>>>      dsdt = tables_blob->len;
>>>>      build_dsdt(tables_blob, tables->linker, vms);
>>>>  
>>>> -    /* FADT MADT GTDT MCFG SPCR pointed to by RSDT */
>>>> +    /* FADT MADT GTDT MCFG SPCR DBG2 pointed to by RSDT */
>>>>      acpi_add_table(table_offsets, tables_blob);
>>>>      build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
>>>>  
>>>> @@ -898,6 +955,9 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>>>>      acpi_add_table(table_offsets, tables_blob);
>>>>      build_spcr(tables_blob, tables->linker, vms);
>>>>  
>>>> +    acpi_add_table(table_offsets, tables_blob);
>>>> +    build_dbg2(tables_blob, tables->linker, vms);
>>>> +
>>>>      if (vms->ras) {
>>>>          build_ghes_error_table(tables->hardware_errors, tables->linker);
>>>>          acpi_add_table(table_offsets, tables_blob);
>>>> -- 
>>>> 2.26.3
>>>>  
>>> Thanks,
>>> drew 
>>>  


