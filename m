Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E12D48636C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 12:06:10 +0100 (CET)
Received: from localhost ([::1]:51994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Qav-0007Fe-Jg
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 06:06:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5QHA-0001uY-5c
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:45:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5QH6-0005oe-Hq
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:45:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641465939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bGpqslBPPyh5/QNheh2puQM/dcTR1gVC5pBq0YvpW2Y=;
 b=gwTso+drpiKwJ1keSvhqoeerewRkUK6lx+ugwSIcpF8cTvbIV7+5qpIkXYAMLDBMyZXQzB
 ZuTvlNWgIhd9EG9TrMAnb8IhhLz6+res9wGWUWHwf1xpmRy3iuHJeD/DRMu6e3R8IgMIvk
 YxAGAb827p1y6nKngAQ8rsVF4e96QiI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-SRadFnXwPXG-n5xbAAxTxA-1; Thu, 06 Jan 2022 05:45:36 -0500
X-MC-Unique: SRadFnXwPXG-n5xbAAxTxA-1
Received: by mail-wm1-f69.google.com with SMTP id
 c5-20020a1c3505000000b00345c92c27c6so2894817wma.2
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 02:45:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bGpqslBPPyh5/QNheh2puQM/dcTR1gVC5pBq0YvpW2Y=;
 b=q2IMLbCPjf8sV3diCN0+t0BmG/zBYd8cyi+VSLJ/bmLpS2fpPyeh1x65fsg0UpmvPE
 VAd2074IdVBw66gvz/0KFhkOY597GcoOJcWk1efWDotpCVNGnikRVC8Hcn0Q04s7cXhI
 d56xTj3F+Sprkkb6e/Mm7iAnuc0bYlWA+CbqEHqvAcUIhms8ryFLEA38Mr9ts8w2qg+o
 MCS+i2SHvJM1875tGPEn5XtjWWqv8Zzn3poJ6u6wt5L0x9zgpArX4hlT6I1cyod/BSp+
 eITMMy+68ll7IIpG5RqWxY1zP6w0ew/7gbHfSRJzDbB1trXecEDkD9ka+KCK8yMYglHl
 H+Xw==
X-Gm-Message-State: AOAM532pULjIWtfXhBOtXUBY+dQfmY0Y9l0LJXKQj5fNa5BSTswq8yyl
 66bq+I/MaNw1iXkvc7+1+sydmC1VPZOaY5DhyaD+rQ6Uhek85z5Fe1r3QiyBSU3TU631sBJaYg5
 H1snEGEVhQTGZFNU=
X-Received: by 2002:a05:600c:a03:: with SMTP id
 z3mr6491920wmp.73.1641465935573; 
 Thu, 06 Jan 2022 02:45:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxGVvkrewFc4l+6KCgNH+KrSlYJDeFH/C38qQ/CfmRmzVA4rY8NLVNH8GvR70j9adbGnce9lw==
X-Received: by 2002:a05:600c:a03:: with SMTP id
 z3mr6491895wmp.73.1641465935364; 
 Thu, 06 Jan 2022 02:45:35 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id l19sm1211129wme.33.2022.01.06.02.45.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 02:45:34 -0800 (PST)
Date: Thu, 6 Jan 2022 05:45:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v11 06/10] ACPI ERST: build the ACPI ERST table
Message-ID: <20220106054104-mutt-send-email-mst@kernel.org>
References: <1639582695-7328-1-git-send-email-eric.devolder@oracle.com>
 <1639582695-7328-7-git-send-email-eric.devolder@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1639582695-7328-7-git-send-email-eric.devolder@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: berrange@redhat.com, ehabkost@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, ani@anisinha.ca,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 15, 2021 at 10:38:11AM -0500, Eric DeVolder wrote:
> This builds the ACPI ERST table to inform OSPM how to communicate
> with the acpi-erst device.
> 
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> ---
>  hw/acpi/erst.c | 188 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 188 insertions(+)
> 
> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
> index bb6cad4..05177b3 100644
> --- a/hw/acpi/erst.c
> +++ b/hw/acpi/erst.c
> @@ -59,6 +59,27 @@
>  #define STATUS_RECORD_STORE_EMPTY     0x04
>  #define STATUS_RECORD_NOT_FOUND       0x05
>  
> +/* ACPI 4.0: Table 17-19 Serialization Instructions */
> +#define INST_READ_REGISTER                 0x00
> +#define INST_READ_REGISTER_VALUE           0x01
> +#define INST_WRITE_REGISTER                0x02
> +#define INST_WRITE_REGISTER_VALUE          0x03
> +#define INST_NOOP                          0x04
> +#define INST_LOAD_VAR1                     0x05
> +#define INST_LOAD_VAR2                     0x06
> +#define INST_STORE_VAR1                    0x07
> +#define INST_ADD                           0x08
> +#define INST_SUBTRACT                      0x09
> +#define INST_ADD_VALUE                     0x0A
> +#define INST_SUBTRACT_VALUE                0x0B
> +#define INST_STALL                         0x0C
> +#define INST_STALL_WHILE_TRUE              0x0D
> +#define INST_SKIP_NEXT_INSTRUCTION_IF_TRUE 0x0E
> +#define INST_GOTO                          0x0F
> +#define INST_SET_SRC_ADDRESS_BASE          0x10
> +#define INST_SET_DST_ADDRESS_BASE          0x11
> +#define INST_MOVE_DATA                     0x12
> +
>  /* UEFI 2.1: Appendix N Common Platform Error Record */
>  #define UEFI_CPER_RECORD_MIN_SIZE 128U
>  #define UEFI_CPER_RECORD_LENGTH_OFFSET 20U
> @@ -172,6 +193,173 @@ typedef struct {
>  
>  /*******************************************************************/
>  /*******************************************************************/
> +
> +/* ACPI 4.0: 17.4.1.2 Serialization Instruction Entries */
> +static void build_serialization_instruction_entry(GArray *table_data,
> +    uint8_t serialization_action,
> +    uint8_t instruction,
> +    uint8_t flags,
> +    uint8_t register_bit_width,
> +    uint64_t register_address,
> +    uint64_t value)
> +{
> +    /* ACPI 4.0: Table 17-18 Serialization Instruction Entry */
> +    struct AcpiGenericAddress gas;
> +    uint64_t mask;
> +
> +    /* Serialization Action */
> +    build_append_int_noprefix(table_data, serialization_action, 1);
> +    /* Instruction */
> +    build_append_int_noprefix(table_data, instruction         , 1);
> +    /* Flags */
> +    build_append_int_noprefix(table_data, flags               , 1);
> +    /* Reserved */
> +    build_append_int_noprefix(table_data, 0                   , 1);
> +    /* Register Region */
> +    gas.space_id = AML_SYSTEM_MEMORY;
> +    gas.bit_width = register_bit_width;
> +    gas.bit_offset = 0;
> +    gas.access_width = ctz32(register_bit_width) - 2;
> +    gas.address = register_address;
> +    build_append_gas_from_struct(table_data, &gas);
> +    /* Value */
> +    build_append_int_noprefix(table_data, value  , 8);
> +    /* Mask */
> +    mask = (1ULL << (register_bit_width - 1) << 1) - 1;
> +    build_append_int_noprefix(table_data, mask  , 8);
> +}
> +
> +/* ACPI 4.0: 17.4.1 Serialization Action Table */
> +void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
> +    const char *oem_id, const char *oem_table_id)
> +{
> +    GArray *table_instruction_data;
> +    unsigned action;
> +    pcibus_t bar0 = pci_get_bar_addr(PCI_DEVICE(erst_dev), 0);
> +    AcpiTable table = { .sig = "ERST", .rev = 1, .oem_id = oem_id,
> +                        .oem_table_id = oem_table_id };
> +
> +    trace_acpi_erst_pci_bar_0(bar0);
> +
> +    /*
> +     * Serialization Action Table
> +     * The serialization action table must be generated first
> +     * so that its size can be known in order to populate the
> +     * Instruction Entry Count field.
> +     */
> +    table_instruction_data = g_array_new(FALSE, FALSE, sizeof(char));
> +
> +    /*
> +     * Macros for use with construction of the action instructions
> +     */
> +#define build_read_register(action, width_in_bits, reg) \
> +    build_serialization_instruction_entry(table_instruction_data, \
> +        action, INST_READ_REGISTER, 0, width_in_bits, \
> +        bar0 + reg, 0)
> +
> +#define build_read_register_value(action, width_in_bits, reg, value) \
> +    build_serialization_instruction_entry(table_instruction_data, \
> +        action, INST_READ_REGISTER_VALUE, 0, width_in_bits, \
> +        bar0 + reg, value)
> +
> +#define build_write_register(action, width_in_bits, reg, value) \
> +    build_serialization_instruction_entry(table_instruction_data, \
> +        action, INST_WRITE_REGISTER, 0, width_in_bits, \
> +        bar0 + reg, value)
> +
> +#define build_write_register_value(action, width_in_bits, reg, value) \
> +    build_serialization_instruction_entry(table_instruction_data, \
> +        action, INST_WRITE_REGISTER_VALUE, 0, width_in_bits, \
> +        bar0 + reg, value)

I'm not sure why these are macros not functions.
But assuming it's preferable this way, pls make them
use ALL_CAPS as per QEMU coding style.


> +
> +    /* Serialization Instruction Entries */
> +    action = ACTION_BEGIN_WRITE_OPERATION;
> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
> +
> +    action = ACTION_BEGIN_READ_OPERATION;
> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
> +
> +    action = ACTION_BEGIN_CLEAR_OPERATION;
> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
> +
> +    action = ACTION_END_OPERATION;
> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
> +
> +    action = ACTION_SET_RECORD_OFFSET;
> +    build_write_register(action, 32, ERST_VALUE_OFFSET, 0);
> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
> +
> +    action = ACTION_EXECUTE_OPERATION;
> +    build_write_register_value(action, 32, ERST_VALUE_OFFSET,
> +        ERST_EXECUTE_OPERATION_MAGIC);
> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
> +
> +    action = ACTION_CHECK_BUSY_STATUS;
> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
> +    build_read_register_value(action, 32, ERST_VALUE_OFFSET, 0x01);
> +
> +    action = ACTION_GET_COMMAND_STATUS;
> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
> +    build_read_register(action, 32, ERST_VALUE_OFFSET);
> +
> +    action = ACTION_GET_RECORD_IDENTIFIER;
> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
> +    build_read_register(action, 64, ERST_VALUE_OFFSET);
> +
> +    action = ACTION_SET_RECORD_IDENTIFIER;
> +    build_write_register(action, 64, ERST_VALUE_OFFSET, 0);
> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
> +
> +    action = ACTION_GET_RECORD_COUNT;
> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
> +    build_read_register(action, 32, ERST_VALUE_OFFSET);
> +
> +    action = ACTION_BEGIN_DUMMY_WRITE_OPERATION;
> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
> +
> +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE;
> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
> +    build_read_register(action, 64, ERST_VALUE_OFFSET);
> +
> +    action = ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;
> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
> +    build_read_register(action, 64, ERST_VALUE_OFFSET);
> +
> +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES;
> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
> +    build_read_register(action, 32, ERST_VALUE_OFFSET);
> +
> +    action = ACTION_GET_EXECUTE_OPERATION_TIMINGS;
> +    build_write_register_value(action, 32, ERST_ACTION_OFFSET, action);
> +    build_read_register(action, 64, ERST_VALUE_OFFSET);
> +
> +    /* Serialization Header */
> +    acpi_table_begin(&table, table_data);
> +
> +    /* Serialization Header Size */
> +    build_append_int_noprefix(table_data, 48, 4);
> +
> +    /* Reserved */
> +    build_append_int_noprefix(table_data,  0, 4);
> +
> +    /*
> +     * Instruction Entry Count
> +     * Each instruction entry is 32 bytes
> +     */
> +    g_assert((table_instruction_data->len) % 32 == 0);
> +    build_append_int_noprefix(table_data,
> +        (table_instruction_data->len / 32), 4);
> +
> +    /* Serialization Instruction Entries */
> +    g_array_append_vals(table_data, table_instruction_data->data,
> +        table_instruction_data->len);
> +    g_array_free(table_instruction_data, TRUE);
> +
> +    acpi_table_end(linker, &table);
> +}
> +
> +/*******************************************************************/
> +/*******************************************************************/
>  static uint8_t *get_nvram_ptr_by_index(ERSTDeviceState *s, unsigned index)
>  {
>      uint8_t *rc = NULL;
> -- 
> 1.8.3.1


