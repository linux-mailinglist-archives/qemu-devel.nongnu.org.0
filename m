Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E867E3E59A1
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 14:07:14 +0200 (CEST)
Received: from localhost ([::1]:32962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDQXK-0007zB-0Y
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 08:07:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mDQVw-00071c-Hc
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 08:05:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mDQVu-0007f5-Bz
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 08:05:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628597145;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g4q2QDAWBThC6y+a1hCiQUc+lrEyO4E4TqnMHZGlfyA=;
 b=KKGlSJ8KQ9EuUphbj16cv8xXcijYi3BnwIU5Qh1dM+KZ8KcEAy/S2Z8smzDkaEuZPnilq5
 //wmq68w0/5z175wmNvZWiPuUTElv3PdxD0E+bp5AaiK24OpgyphfnuemcAlhLhB8kcFcF
 5UdiCa7GFX0bVPYv6lNo8HIiJDjiu7A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-JByW98-hOluidpdRPfa5Kg-1; Tue, 10 Aug 2021 08:05:43 -0400
X-MC-Unique: JByW98-hOluidpdRPfa5Kg-1
Received: by mail-wm1-f71.google.com with SMTP id
 z186-20020a1c7ec30000b02902e6a27a9962so735491wmc.3
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 05:05:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=g4q2QDAWBThC6y+a1hCiQUc+lrEyO4E4TqnMHZGlfyA=;
 b=Y31dP4y7a7I0b8GCVQzmfOteCTYC21lRq0RQ/qmsHwQkjLLzK84RpQeYtvcwEtJt4b
 cN4noBEcdWIBRwqsp4kGB9XDreaV28Kh2v3hRUAkVgodgBYH91AgFLybIZS2hmHNgjGp
 gaicjbInRyd4x/4DBE4Y9uCdQ0jzn72sFxIQytEgbdEdhZOr47iMnwVhkpaNV4ZtJQvF
 VJUqerNF5jN9+526H9SnI0LQWteJ6k+fLzPzOeB8BFyE5BP+O9fukThm00F/QDDu4Ps4
 rnz0EulxbFhMMnpTHPwF9JUFkNhTHi+p7MRRvJAdAP8Kl4dUkSaU8mwG5a7J6HnCpaOm
 eJmQ==
X-Gm-Message-State: AOAM532P4gp2IbolepOsttOIL4N2gVhxrMhQ2AlciQwTbiVLjPiObygs
 raavTrDKv52zUIiQXPzuQHHvwxtEFS/vpiQhwt9ib76MQ4N+juXJSh0LxgqyRmW03JvbVUibO7g
 3XNA+RGImq+gQtXo=
X-Received: by 2002:adf:df12:: with SMTP id y18mr31147276wrl.189.1628597142698; 
 Tue, 10 Aug 2021 05:05:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhkf1YM1L+2zF+VQ84n8qLgAorAAm/AzrIwcvb1UPfikGUWBZ/6xSHeJ378FmThZMCGYcKzQ==
X-Received: by 2002:adf:df12:: with SMTP id y18mr31147240wrl.189.1628597142470; 
 Tue, 10 Aug 2021 05:05:42 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id r10sm6505679wrq.32.2021.08.10.05.05.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 05:05:41 -0700 (PDT)
Subject: Re: [PATCH for-6.2] hw/arm/virt_acpi_build: Generate DBG2 table
To: Igor Mammedov <imammedo@redhat.com>
References: <20210810083057.99651-1-eric.auger@redhat.com>
 <20210810125214.7dadd76b@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <09fd10e1-8952-8ba7-2467-d3545a08bddf@redhat.com>
Date: Tue, 10 Aug 2021 14:05:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210810125214.7dadd76b@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
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
Reply-To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, drjones@redhat.com, gshan@redhat.com,
 mst@redhat.com, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, philmd@redhat.com, ardb@kernel.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Igor,

On 8/10/21 12:52 PM, Igor Mammedov wrote:
> On Tue, 10 Aug 2021 10:30:57 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
>
>> ARM SBBR specification mandates DBG2 table (Debug Port Table 2).
>> this latter allows to describe one or more debug ports.
>>
>> Generate an DBG2 table featuring a single debug port, the PL011.
>>
>> The DBG2 specification can be found at:
>> https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-debug-port-table?redirectedfrom=MSDN
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> using packed structures for composing ACPI tables is discouraged,
> pls use build_append_int_noprefix() API instead. You can look at
> build_amd_iommu() as an example.

I understand this for new code outside of hw/arm/virt-acpi-build.c.
However build_append_int_noprefix() is not (yet) used in
virt-acpi-build.c so this would bring heterogeneity. So does it mean
that any new ACPI description introduced there should also adopt this
new style? Drew will suggest to migrate everything but well ;-)

Thanks

Eric
>
> PS:
> Also note field comments format.
> /it should be verbatim copy of entry name from respective table in spec/
>
>> ---
>>
>> Tested by comparing the content with the table generated
>> by EDK2 along with the SBSA-REF machine (code generated by
>> DynamicTablesPkg/Library/Acpi/Arm/AcpiDbg2LibArm/Dbg2Generator.c).
>>
>> I reused the Generic Address Structure filled by QEMU in the SPCR, ie.
>> bit_width = 8 and byte access. While EDK2 sets bit_width = 32 and
>> dword access. Also the name exposed by acpica tools is different:
>> 'COM0' in my case where '\_SB.COM0' in SBSA-REF case?
>> ---
>>  hw/arm/virt-acpi-build.c    | 77 ++++++++++++++++++++++++++++++++++++-
>>  include/hw/acpi/acpi-defs.h | 50 ++++++++++++++++++++++++
>>  2 files changed, 126 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 037cc1fd82..35f27b41df 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -563,6 +563,78 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>                   vms->oem_table_id);
>>  }
>>  
>> +#define ACPI_DBG2_PL011_UART_LENGTH 0x1000
>> +
>> +/* DBG2 */
>> +static void
>> +build_dbg2(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>> +{
>> +    int addr_offset, addrsize_offset, namespace_offset, namespace_length;
>> +    const MemMapEntry *uart_memmap = &vms->memmap[VIRT_UART];
>> +    struct AcpiGenericAddress *base_address;
>> +    int dbg2_start = table_data->len;
>> +    AcpiDbg2Device *dbg2dev;
>> +    char name[] = "COM0";
>> +    AcpiDbg2Table *dbg2;
>> +    uint32_t *addr_size;
>> +    uint8_t *namespace;
>> +
>> +    dbg2 = acpi_data_push(table_data, sizeof *dbg2);
>> +    dbg2->info_offset = sizeof *dbg2;
>> +    dbg2->info_count = 1;
>> +
>> +    /* debug device info structure */
>> +
>> +    dbg2dev = acpi_data_push(table_data, sizeof(AcpiDbg2Device));
>> +
>> +    dbg2dev->revision = 0;
>> +    namespace_length = sizeof name;
>> +    dbg2dev->length = sizeof *dbg2dev + sizeof(struct AcpiGenericAddress) +
>> +                      4 + namespace_length;
>> +    dbg2dev->register_count = 1;
>> +
>> +    addr_offset = sizeof *dbg2dev;
>> +    addrsize_offset = addr_offset + sizeof(struct AcpiGenericAddress);
>> +    namespace_offset = addrsize_offset + 4;
>> +
>> +    dbg2dev->namepath_length = cpu_to_le16(namespace_length);
>> +    dbg2dev->namepath_offset = cpu_to_le16(namespace_offset);
>> +    dbg2dev->oem_data_length = cpu_to_le16(0);
>> +    dbg2dev->oem_data_offset = cpu_to_le16(0); /* No OEM data is present */
>> +    dbg2dev->port_type = cpu_to_le16(ACPI_DBG2_SERIAL_PORT);
>> +    dbg2dev->port_subtype = cpu_to_le16(ACPI_DBG2_ARM_PL011);
>> +
>> +    dbg2dev->base_address_offset = cpu_to_le16(addr_offset);
>> +    dbg2dev->address_size_offset = cpu_to_le16(addrsize_offset);
>> +
>> +    /*
>> +     * variable length content:
>> +     * BaseAddressRegister[1]
>> +     * AddressSize[1]
>> +     * NamespaceString[1]
>> +     */
>> +
>> +    base_address = acpi_data_push(table_data,
>> +                                  sizeof(struct AcpiGenericAddress));
>> +
>> +    base_address->space_id = AML_SYSTEM_MEMORY;
>> +    base_address->bit_width = 8;
>> +    base_address->bit_offset = 0;
>> +    base_address->access_width = 1;
>> +    base_address->address = cpu_to_le64(uart_memmap->base);
>> +
>> +    addr_size = acpi_data_push(table_data, sizeof *addr_size);
>> +    *addr_size = cpu_to_le32(ACPI_DBG2_PL011_UART_LENGTH);
>> +
>> +    namespace = acpi_data_push(table_data, namespace_length);
>> +    memcpy(namespace, name, namespace_length);
>> +
>> +    build_header(linker, table_data,
>> +                 (void *)(table_data->data + dbg2_start), "DBG2",
>> +                 table_data->len - dbg2_start, 3, vms->oem_id,
>> +                 vms->oem_table_id);
>> +}
>> +
>>  /* MADT */
>>  static void
>>  build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>> @@ -790,7 +862,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>>      dsdt = tables_blob->len;
>>      build_dsdt(tables_blob, tables->linker, vms);
>>  
>> -    /* FADT MADT GTDT MCFG SPCR pointed to by RSDT */
>> +    /* FADT MADT GTDT MCFG SPCR DBG2 pointed to by RSDT */
>>      acpi_add_table(table_offsets, tables_blob);
>>      build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
>>  
>> @@ -813,6 +885,9 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>>      acpi_add_table(table_offsets, tables_blob);
>>      build_spcr(tables_blob, tables->linker, vms);
>>  
>> +    acpi_add_table(table_offsets, tables_blob);
>> +    build_dbg2(tables_blob, tables->linker, vms);
>> +
>>      if (vms->ras) {
>>          build_ghes_error_table(tables->hardware_errors, tables->linker);
>>          acpi_add_table(table_offsets, tables_blob);
>> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
>> index cf9f44299c..bdb2ebed2c 100644
>> --- a/include/hw/acpi/acpi-defs.h
>> +++ b/include/hw/acpi/acpi-defs.h
>> @@ -618,4 +618,54 @@ struct AcpiIortRC {
>>  } QEMU_PACKED;
>>  typedef struct AcpiIortRC AcpiIortRC;
>>  
>> +/* DBG2 */
>> +
>> +/* Types for port_type field above */
>> +
>> +#define ACPI_DBG2_SERIAL_PORT       0x8000
>> +#define ACPI_DBG2_1394_PORT         0x8001
>> +#define ACPI_DBG2_USB_PORT          0x8002
>> +#define ACPI_DBG2_NET_PORT          0x8003
>> +
>> +/* Subtypes for port_subtype field above */
>> +
>> +#define ACPI_DBG2_16550_COMPATIBLE  0x0000
>> +#define ACPI_DBG2_16550_SUBSET      0x0001
>> +#define ACPI_DBG2_ARM_PL011         0x0003
>> +#define ACPI_DBG2_ARM_SBSA_32BIT    0x000D
>> +#define ACPI_DBG2_ARM_SBSA_GENERIC  0x000E
>> +#define ACPI_DBG2_ARM_DCC           0x000F
>> +#define ACPI_DBG2_BCM2835           0x0010
>> +
>> +#define ACPI_DBG2_1394_STANDARD     0x0000
>> +
>> +#define ACPI_DBG2_USB_XHCI          0x0000
>> +#define ACPI_DBG2_USB_EHCI          0x0001
>> +
>> +/* Debug Device Information Subtable */
>> +
>> +struct AcpiDbg2Device {
>> +    uint8_t  revision;
>> +    uint16_t length;
>> +    uint8_t  register_count; /* Number of base_address registers */
>> +    uint16_t namepath_length;
>> +    uint16_t namepath_offset;
>> +    uint16_t oem_data_length;
>> +    uint16_t oem_data_offset;
>> +    uint16_t port_type;
>> +    uint16_t port_subtype;
>> +    uint8_t  reserved[2];
>> +    uint16_t base_address_offset;
>> +    uint16_t address_size_offset;
>> +}  QEMU_PACKED;
>> +typedef struct AcpiDbg2Device AcpiDbg2Device;
>> +
>> +struct AcpiDbg2Table {
>> +    ACPI_TABLE_HEADER_DEF /* ACPI common table header */
>> +    uint32_t info_offset; /* offset to the first debug struct */
>> +    uint32_t info_count;  /* number of debug device info struct entries */
>> +    uint8_t  dbg2_device_info[];
>> +} QEMU_PACKED;
>> +typedef struct AcpiDbg2Table AcpiDbg2Table;
>> +
>>  #endif


