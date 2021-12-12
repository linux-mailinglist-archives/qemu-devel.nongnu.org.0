Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4B3471E68
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Dec 2021 23:58:34 +0100 (CET)
Received: from localhost ([::1]:37488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwXnd-0002KC-PY
	for lists+qemu-devel@lfdr.de; Sun, 12 Dec 2021 17:58:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mwXm2-0001V2-KY
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 17:56:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mwXly-00049z-PZ
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 17:56:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639349809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EBwh8nV+1BOAcwbkNDEasVBkvncnjbzSWg9LGHOWz4A=;
 b=Pd9+vHuDNbhMLI8kRdnPlA+ml548qg4zHI2Vfa6ziMYlHTUF2l8xxXbqd7c56TXI0k0kjh
 lmEQUIdkiR4ZpqI9mTyiDgY5VSPGaXJBpNaTdPX5LcbPbSIUNOImknxZiyOFipO7tchWLu
 nbBR0ENvDYJTvYdGlPtjWPccZoEYdYc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-376-wVrD4VP6OpK_BBGnFlb1EA-1; Sun, 12 Dec 2021 17:56:46 -0500
X-MC-Unique: wVrD4VP6OpK_BBGnFlb1EA-1
Received: by mail-wr1-f69.google.com with SMTP id
 h7-20020adfaa87000000b001885269a937so3315023wrc.17
 for <qemu-devel@nongnu.org>; Sun, 12 Dec 2021 14:56:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EBwh8nV+1BOAcwbkNDEasVBkvncnjbzSWg9LGHOWz4A=;
 b=DtGBHEavwefv8PKUE1njsSDVZRGy17CISt8JgV+HsIPXk6SNT/O5VpRmcXlRuJLRva
 d0ZVuuYJhtLf6jxSVVcWFLMbhB927ge4zpF+dZ4qFTYMz6ecWVVzzGc/GMOhLCgsvIGP
 VJylCd3r+YnWs1vMbsuQDhhszLC0BVa328QcgjKdh9ykMnqX8Usv7n/hJTz7y7yaB0Ao
 3MYVqkz8Nvmn+UD3Fg4Jwfl2lZ/qLb8kAjW93dAhxaBvw7CpM/sA2ukIWbdt4ylk25cW
 H7fVhwUXzzYf6GOGNw+iTUUw+RIiH86Nhx6sevCbM8jQAdtbJKOr1LoVyJUCVORKU3Mh
 jAog==
X-Gm-Message-State: AOAM530gvlmDgdGJCYWHZmUH7pCo/RwK0EaKqaDqQnz5xwhbv83kmK9n
 cNVoJ4SevRU0ZUZpCcenHFNKTpRiOSltBAn4B0v6BmV5wAYKAi/ljii10IawlqKO3Y7767WEJsp
 1/91l5KMg5UG32R0=
X-Received: by 2002:a05:6000:2a4:: with SMTP id
 l4mr28464004wry.238.1639349805059; 
 Sun, 12 Dec 2021 14:56:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwP6//cq4gvoQkLk0hXG9AhUwY2Q07lCvXIPYsoUiOPNrwKkBsprSXBmFkj1IMMGrbDCyDcTA==
X-Received: by 2002:a05:6000:2a4:: with SMTP id
 l4mr28463975wry.238.1639349804779; 
 Sun, 12 Dec 2021 14:56:44 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:107e:eefb:294:6ac8:eff6:22df])
 by smtp.gmail.com with ESMTPSA id o12sm5431669wmq.12.2021.12.12.14.56.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 14:56:44 -0800 (PST)
Date: Sun, 12 Dec 2021 17:56:39 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v10 06/10] ACPI ERST: build the ACPI ERST table
Message-ID: <20211212173145-mutt-send-email-mst@kernel.org>
References: <1639072655-19271-1-git-send-email-eric.devolder@oracle.com>
 <1639072655-19271-7-git-send-email-eric.devolder@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1639072655-19271-7-git-send-email-eric.devolder@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Dec 09, 2021 at 12:57:31PM -0500, Eric DeVolder wrote:
> This builds the ACPI ERST table to inform OSPM how to communicate
> with the acpi-erst device.
> 
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> ---
>  hw/acpi/erst.c | 241 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 241 insertions(+)
> 
> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
> index 81f5435..753425a 100644
> --- a/hw/acpi/erst.c
> +++ b/hw/acpi/erst.c
> @@ -711,6 +711,247 @@ static const MemoryRegionOps erst_reg_ops = {
>      .endianness = DEVICE_NATIVE_ENDIAN,
>  };
>  
> +
> +/*******************************************************************/
> +/*******************************************************************/
> +
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

I would create wrappers for the specific uses that we do have. Leave the
rest alone.
You just use 4 of these right? And a bunch of parameters are
always the same. E.g. flags always 0, address always same.

> +/* ACPI 4.0: 17.4.1.2 Serialization Instruction Entries */
> +static void build_serialization_instruction_entry(GArray *table_data,
> +    uint8_t serialization_action,
> +    uint8_t instruction,
> +    uint8_t flags,
> +    uint8_t register_bit_width,

maybe make it width in bytes, then you do not need a switch.

> +    uint64_t register_address,
> +    uint64_t value,
> +    uint64_t mask)
> +{
> +    /* ACPI 4.0: Table 17-18 Serialization Instruction Entry */
> +    struct AcpiGenericAddress gas;
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
> +    switch (register_bit_width) {
> +    case 8:
> +        gas.access_width = 1;
> +        break;
> +    case 16:
> +        gas.access_width = 2;
> +        break;
> +    case 32:
> +        gas.access_width = 3;
> +        break;
> +    case 64:
> +        gas.access_width = 4;
> +        break;
> +    default:
> +        gas.access_width = 0;
> +        break;

does this default actually work?

> +    }
> +    gas.address = register_address;
> +    build_append_gas_from_struct(table_data, &gas);
> +    /* Value */
> +    build_append_int_noprefix(table_data, value  , 8);
> +    /* Mask */
> +    build_append_int_noprefix(table_data, mask   , 8);
> +}
> +
> +/* ACPI 4.0: 17.4.1 Serialization Action Table */
> +void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
> +    const char *oem_id, const char *oem_table_id)
> +{
> +    GArray *table_instruction_data;
> +    unsigned action;
> +    pcibus_t bar0, bar1;
> +    AcpiTable table = { .sig = "ERST", .rev = 1, .oem_id = oem_id,
> +                        .oem_table_id = oem_table_id };
> +
> +    bar0 = (pcibus_t)pci_get_bar_addr(PCI_DEVICE(erst_dev), 0);
> +    trace_acpi_erst_pci_bar_0(bar0);
> +    bar1 = (pcibus_t)pci_get_bar_addr(PCI_DEVICE(erst_dev), 1);

why do we need the cast here?
Also assignment at declaration point will be cleaner, won't it?

> +    trace_acpi_erst_pci_bar_1(bar1);

bar1 seems unused ... why do we bother with it just for trace?

> +
> +#define MASK8  0x00000000000000FFUL
> +#define MASK16 0x000000000000FFFFUL
> +#define MASK32 0x00000000FFFFFFFFUL
> +#define MASK64 0xFFFFFFFFFFFFFFFFUL


can't we just pass # of bytes?

> +
> +    /*
> +     * Serialization Action Table
> +     * The serialization action table must be generated first
> +     * so that its size can be known in order to populate the
> +     * Instruction Entry Count field.
> +     */
> +    table_instruction_data = g_array_new(FALSE, FALSE, sizeof(char));
> +
> +    /* Serialization Instruction Entries */
> +    action = ACTION_BEGIN_WRITE_OPERATION;
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> +
> +    action = ACTION_BEGIN_READ_OPERATION;
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> +
> +    action = ACTION_BEGIN_CLEAR_OPERATION;
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> +
> +    action = ACTION_END_OPERATION;
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> +
> +    action = ACTION_SET_RECORD_OFFSET;
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_WRITE_REGISTER      , 0, 32,
> +        bar0 + ERST_VALUE_OFFSET , 0, MASK32);
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> +
> +    action = ACTION_EXECUTE_OPERATION;
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> +        bar0 + ERST_VALUE_OFFSET , ERST_EXECUTE_OPERATION_MAGIC, MASK8);
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> +
> +    action = ACTION_CHECK_BUSY_STATUS;
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_READ_REGISTER_VALUE , 0, 32,
> +        bar0 + ERST_VALUE_OFFSET, 0x01, MASK8);
> +
> +    action = ACTION_GET_COMMAND_STATUS;
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_READ_REGISTER       , 0, 32,
> +        bar0 + ERST_VALUE_OFFSET, 0, MASK8);
> +
> +    action = ACTION_GET_RECORD_IDENTIFIER;
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_READ_REGISTER       , 0, 64,
> +        bar0 + ERST_VALUE_OFFSET, 0, MASK64);
> +
> +    action = ACTION_SET_RECORD_IDENTIFIER;
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_WRITE_REGISTER      , 0, 64,
> +        bar0 + ERST_VALUE_OFFSET , 0, MASK64);
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> +
> +    action = ACTION_GET_RECORD_COUNT;
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_READ_REGISTER       , 0, 32,
> +        bar0 + ERST_VALUE_OFFSET, 0, MASK32);
> +
> +    action = ACTION_BEGIN_DUMMY_WRITE_OPERATION;
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> +
> +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE;
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_READ_REGISTER       , 0, 64,
> +        bar0 + ERST_VALUE_OFFSET, 0, MASK64);
> +
> +    action = ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_READ_REGISTER       , 0, 64,
> +        bar0 + ERST_VALUE_OFFSET, 0, MASK32);
> +
> +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES;
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_READ_REGISTER       , 0, 32,
> +        bar0 + ERST_VALUE_OFFSET, 0, MASK32);
> +
> +    action = ACTION_GET_EXECUTE_OPERATION_TIMINGS;
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> +    build_serialization_instruction_entry(table_instruction_data,
> +        action, INST_READ_REGISTER       , 0, 64,
> +        bar0 + ERST_VALUE_OFFSET, 0, MASK64);
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

assert that it's a multiple of 32 maybe

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
>  /*******************************************************************/
>  /*******************************************************************/
>  static int erst_post_load(void *opaque, int version_id)
> -- 
> 1.8.3.1


