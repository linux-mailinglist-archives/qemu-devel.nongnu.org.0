Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C29947394B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 01:07:02 +0100 (CET)
Received: from localhost ([::1]:50548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwvLR-0004Ln-9P
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 19:07:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mwvJs-0003Y4-5J
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 19:05:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mwvJg-00039S-Gq
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 19:05:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639440311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MbQT7lzowfn2VR8PkVYjciEiI38MrAipDY0DcsRXdV0=;
 b=UjKwB8zwnpCWBZCD76nXWDyRntvAuvNBtS5fBMW9L2Qca6+gxIJTRTU8nnRt6X8qnpLUn9
 3Tl98K9IOgjv7Jf4E/5FbVdEB+OhuRRpLZyhXBcfK9HK0tIFiC+Hi0ML741jbZosCQHyF+
 GRAMtlJPlTuTgvidG7Ci1kK9SQ5JdRk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-j1UYsiv0NzurrU6PAqBlLQ-1; Mon, 13 Dec 2021 19:05:09 -0500
X-MC-Unique: j1UYsiv0NzurrU6PAqBlLQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 l4-20020a05600c1d0400b00332f47a0fa3so7144586wms.8
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 16:05:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MbQT7lzowfn2VR8PkVYjciEiI38MrAipDY0DcsRXdV0=;
 b=ReL4Ox9GWPwTRTRkc03YOTdMet5BAfdVr3v9igye2bLhtRCY0HeLaBDI0E8J/5qf9K
 WYwClh5xM8GLS4IvqebWt3/IgPnvkOq0F9TDCnXrosDtSveAxCX6+saNuQuRG6qBoabO
 q/xXMdjp8mJyusxU+Ruvs5chkv8VXBbYI2S+p/VHTdcWxOrReQCzVbGCs9Qsl0EbctfH
 FadvdaYyx7nx/ljiEvY+0fiJrxumddsBRBQc03IuVwNOTW+wWxXGeQiYfbn1Up2JO4F+
 neHpd51r8DZWuDP7bo4Ct21NZY2ldt25fRB3OoXmNCruLZ99c98+zS5rZ+M7URv8Rdff
 a+gw==
X-Gm-Message-State: AOAM5304gHWz0H+xBttCe2cc0SQxQ0MvPfyqXRfoUgI01SJluYi2v1L9
 6mVDd3ZwxZo75tGL+FX6TQbwus9ne4ts6Rb9rlMROl1gn0H3cFIpbuZ82ohL4xW6b2ZNkbVcqDz
 G5x83KKJGPP3PXGA=
X-Received: by 2002:adf:bc89:: with SMTP id g9mr1795930wrh.578.1639440308612; 
 Mon, 13 Dec 2021 16:05:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwyAg5i6CXjQtdyEuxJ0d3W50OWVTCZVk1fnPOSI67aKsaT8u9+X2bz5I2M+raJHkvtn1+WHQ==
X-Received: by 2002:adf:bc89:: with SMTP id g9mr1795887wrh.578.1639440308337; 
 Mon, 13 Dec 2021 16:05:08 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207d:b931:2ce5:ef76:2d17:5466])
 by smtp.gmail.com with ESMTPSA id v8sm9093960wrc.114.2021.12.13.16.05.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 16:05:06 -0800 (PST)
Date: Mon, 13 Dec 2021 19:05:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v10 06/10] ACPI ERST: build the ACPI ERST table
Message-ID: <20211213185833-mutt-send-email-mst@kernel.org>
References: <1639072655-19271-1-git-send-email-eric.devolder@oracle.com>
 <1639072655-19271-7-git-send-email-eric.devolder@oracle.com>
 <20211212173145-mutt-send-email-mst@kernel.org>
 <21c92605-8039-974b-7f62-fb1d22e4a206@oracle.com>
MIME-Version: 1.0
In-Reply-To: <21c92605-8039-974b-7f62-fb1d22e4a206@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
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

On Mon, Dec 13, 2021 at 04:02:26PM -0600, Eric DeVolder wrote:
> Michael,
> Thanks for reviewing! Inline responses below.
> eric
> 
> On 12/12/21 16:56, Michael S. Tsirkin wrote:
> > On Thu, Dec 09, 2021 at 12:57:31PM -0500, Eric DeVolder wrote:
> > > This builds the ACPI ERST table to inform OSPM how to communicate
> > > with the acpi-erst device.
> > > 
> > > Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> > > ---
> > >   hw/acpi/erst.c | 241 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> > >   1 file changed, 241 insertions(+)
> > > 
> > > diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
> > > index 81f5435..753425a 100644
> > > --- a/hw/acpi/erst.c
> > > +++ b/hw/acpi/erst.c
> > > @@ -711,6 +711,247 @@ static const MemoryRegionOps erst_reg_ops = {
> > >       .endianness = DEVICE_NATIVE_ENDIAN,
> > >   };
> > > +
> > > +/*******************************************************************/
> > > +/*******************************************************************/
> > > +
> > > +/* ACPI 4.0: Table 17-19 Serialization Instructions */
> > > +#define INST_READ_REGISTER                 0x00
> > > +#define INST_READ_REGISTER_VALUE           0x01
> > > +#define INST_WRITE_REGISTER                0x02
> > > +#define INST_WRITE_REGISTER_VALUE          0x03
> > > +#define INST_NOOP                          0x04
> > > +#define INST_LOAD_VAR1                     0x05
> > > +#define INST_LOAD_VAR2                     0x06
> > > +#define INST_STORE_VAR1                    0x07
> > > +#define INST_ADD                           0x08
> > > +#define INST_SUBTRACT                      0x09
> > > +#define INST_ADD_VALUE                     0x0A
> > > +#define INST_SUBTRACT_VALUE                0x0B
> > > +#define INST_STALL                         0x0C
> > > +#define INST_STALL_WHILE_TRUE              0x0D
> > > +#define INST_SKIP_NEXT_INSTRUCTION_IF_TRUE 0x0E
> > > +#define INST_GOTO                          0x0F
> > > +#define INST_SET_SRC_ADDRESS_BASE          0x10
> > > +#define INST_SET_DST_ADDRESS_BASE          0x11
> > > +#define INST_MOVE_DATA                     0x12
> > > +
> > 
> > I would create wrappers for the specific uses that we do have. Leave the
> > rest alone.
> > You just use 4 of these right? And a bunch of parameters are
> > always the same. E.g. flags always 0, address always same.
> 
> If I understand correctly, I think you are suggesting making wrappers for
> the 4 in use (ie WRITE, WRITE_VALUE, READ, READ_VALUE). in an effort to
> simplify/hide the underlying call to
> build_serialization_instruction_entry(). OK, I'll do that.
> 
> > 
> > > +/* ACPI 4.0: 17.4.1.2 Serialization Instruction Entries */
> > > +static void build_serialization_instruction_entry(GArray *table_data,
> > > +    uint8_t serialization_action,
> > > +    uint8_t instruction,
> > > +    uint8_t flags,
> > > +    uint8_t register_bit_width,
> > 
> > maybe make it width in bytes, then you do not need a switch.
> 
> I can make it bytes, but the switch is still needed as the corresponding
> field is an encoding (ie 1,2,3,4 vs 1, 2, 4, 8).

So it's ffs basically?

> > 
> > > +    uint64_t register_address,
> > > +    uint64_t value,
> > > +    uint64_t mask)
> > > +{
> > > +    /* ACPI 4.0: Table 17-18 Serialization Instruction Entry */
> > > +    struct AcpiGenericAddress gas;
> > > +
> > > +    /* Serialization Action */
> > > +    build_append_int_noprefix(table_data, serialization_action, 1);
> > > +    /* Instruction */
> > > +    build_append_int_noprefix(table_data, instruction         , 1);
> > > +    /* Flags */
> > > +    build_append_int_noprefix(table_data, flags               , 1);
> > > +    /* Reserved */
> > > +    build_append_int_noprefix(table_data, 0                   , 1);
> > > +    /* Register Region */
> > > +    gas.space_id = AML_SYSTEM_MEMORY;
> > > +    gas.bit_width = register_bit_width;
> > > +    gas.bit_offset = 0;
> > > +    switch (register_bit_width) {
> > > +    case 8:
> > > +        gas.access_width = 1;
> > > +        break;
> > > +    case 16:
> > > +        gas.access_width = 2;
> > > +        break;
> > > +    case 32:
> > > +        gas.access_width = 3;
> > > +        break;
> > > +    case 64:
> > > +        gas.access_width = 4;
> > > +        break;
> > > +    default:
> > > +        gas.access_width = 0;
> > > +        break;
> > 
> > does this default actually work?
> I actually have no idea. But given that this is driven by code in this file,
> I'll set an assert there instead; this should never happen.
> 
> > 
> > > +    }
> > > +    gas.address = register_address;
> > > +    build_append_gas_from_struct(table_data, &gas);
> > > +    /* Value */
> > > +    build_append_int_noprefix(table_data, value  , 8);
> > > +    /* Mask */
> > > +    build_append_int_noprefix(table_data, mask   , 8);
> > > +}
> > > +
> > > +/* ACPI 4.0: 17.4.1 Serialization Action Table */
> > > +void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
> > > +    const char *oem_id, const char *oem_table_id)
> > > +{
> > > +    GArray *table_instruction_data;
> > > +    unsigned action;
> > > +    pcibus_t bar0, bar1;
> > > +    AcpiTable table = { .sig = "ERST", .rev = 1, .oem_id = oem_id,
> > > +                        .oem_table_id = oem_table_id };
> > > +
> > > +    bar0 = (pcibus_t)pci_get_bar_addr(PCI_DEVICE(erst_dev), 0);
> > > +    trace_acpi_erst_pci_bar_0(bar0);
> > > +    bar1 = (pcibus_t)pci_get_bar_addr(PCI_DEVICE(erst_dev), 1);
> > 
> > why do we need the cast here?
> > Also assignment at declaration point will be cleaner, won't it?
> Corrected; cast removed and assigned at declaration.
> > 
> > > +    trace_acpi_erst_pci_bar_1(bar1);
> > 
> > bar1 seems unused ... why do we bother with it just for trace?
> Corrected; bar1 not needed.
> 
> > 
> > > +
> > > +#define MASK8  0x00000000000000FFUL
> > > +#define MASK16 0x000000000000FFFFUL
> > > +#define MASK32 0x00000000FFFFFFFFUL
> > > +#define MASK64 0xFFFFFFFFFFFFFFFFUL
> > 
> > 
> > can't we just pass # of bytes?
> I could, but then I'd need a switch statement to convert to one of these
> masks. The full mask is embedded in the generic address structure.
> 
> Perhaps in the wrapper I can use width in bytes and the switch statement can
> producing the encoding and the mask...

we don't need a switch, mask is just (1ULL << (bytes * BITS_PER_BYTE - 1) << 1) - 1
encoding is just ffs(bytes)


> > 
> > > +
> > > +    /*
> > > +     * Serialization Action Table
> > > +     * The serialization action table must be generated first
> > > +     * so that its size can be known in order to populate the
> > > +     * Instruction Entry Count field.
> > > +     */
> > > +    table_instruction_data = g_array_new(FALSE, FALSE, sizeof(char));
> > > +
> > > +    /* Serialization Instruction Entries */
> > > +    action = ACTION_BEGIN_WRITE_OPERATION;
> > > +    build_serialization_instruction_entry(table_instruction_data,
> > > +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> > > +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> > > +
> > > +    action = ACTION_BEGIN_READ_OPERATION;
> > > +    build_serialization_instruction_entry(table_instruction_data,
> > > +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> > > +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> > > +
> > > +    action = ACTION_BEGIN_CLEAR_OPERATION;
> > > +    build_serialization_instruction_entry(table_instruction_data,
> > > +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> > > +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> > > +
> > > +    action = ACTION_END_OPERATION;
> > > +    build_serialization_instruction_entry(table_instruction_data,
> > > +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> > > +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> > > +
> > > +    action = ACTION_SET_RECORD_OFFSET;
> > > +    build_serialization_instruction_entry(table_instruction_data,
> > > +        action, INST_WRITE_REGISTER      , 0, 32,
> > > +        bar0 + ERST_VALUE_OFFSET , 0, MASK32);
> > > +    build_serialization_instruction_entry(table_instruction_data,
> > > +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> > > +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> > > +
> > > +    action = ACTION_EXECUTE_OPERATION;
> > > +    build_serialization_instruction_entry(table_instruction_data,
> > > +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> > > +        bar0 + ERST_VALUE_OFFSET , ERST_EXECUTE_OPERATION_MAGIC, MASK8);
> > > +    build_serialization_instruction_entry(table_instruction_data,
> > > +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> > > +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> > > +
> > > +    action = ACTION_CHECK_BUSY_STATUS;
> > > +    build_serialization_instruction_entry(table_instruction_data,
> > > +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> > > +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> > > +    build_serialization_instruction_entry(table_instruction_data,
> > > +        action, INST_READ_REGISTER_VALUE , 0, 32,
> > > +        bar0 + ERST_VALUE_OFFSET, 0x01, MASK8);
> > > +
> > > +    action = ACTION_GET_COMMAND_STATUS;
> > > +    build_serialization_instruction_entry(table_instruction_data,
> > > +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> > > +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> > > +    build_serialization_instruction_entry(table_instruction_data,
> > > +        action, INST_READ_REGISTER       , 0, 32,
> > > +        bar0 + ERST_VALUE_OFFSET, 0, MASK8);
> > > +
> > > +    action = ACTION_GET_RECORD_IDENTIFIER;
> > > +    build_serialization_instruction_entry(table_instruction_data,
> > > +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> > > +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> > > +    build_serialization_instruction_entry(table_instruction_data,
> > > +        action, INST_READ_REGISTER       , 0, 64,
> > > +        bar0 + ERST_VALUE_OFFSET, 0, MASK64);
> > > +
> > > +    action = ACTION_SET_RECORD_IDENTIFIER;
> > > +    build_serialization_instruction_entry(table_instruction_data,
> > > +        action, INST_WRITE_REGISTER      , 0, 64,
> > > +        bar0 + ERST_VALUE_OFFSET , 0, MASK64);
> > > +    build_serialization_instruction_entry(table_instruction_data,
> > > +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> > > +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> > > +
> > > +    action = ACTION_GET_RECORD_COUNT;
> > > +    build_serialization_instruction_entry(table_instruction_data,
> > > +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> > > +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> > > +    build_serialization_instruction_entry(table_instruction_data,
> > > +        action, INST_READ_REGISTER       , 0, 32,
> > > +        bar0 + ERST_VALUE_OFFSET, 0, MASK32);
> > > +
> > > +    action = ACTION_BEGIN_DUMMY_WRITE_OPERATION;
> > > +    build_serialization_instruction_entry(table_instruction_data,
> > > +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> > > +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> > > +
> > > +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE;
> > > +    build_serialization_instruction_entry(table_instruction_data,
> > > +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> > > +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> > > +    build_serialization_instruction_entry(table_instruction_data,
> > > +        action, INST_READ_REGISTER       , 0, 64,
> > > +        bar0 + ERST_VALUE_OFFSET, 0, MASK64);
> > > +
> > > +    action = ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;
> > > +    build_serialization_instruction_entry(table_instruction_data,
> > > +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> > > +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> > > +    build_serialization_instruction_entry(table_instruction_data,
> > > +        action, INST_READ_REGISTER       , 0, 64,
> > > +        bar0 + ERST_VALUE_OFFSET, 0, MASK32);
> > > +
> > > +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES;
> > > +    build_serialization_instruction_entry(table_instruction_data,
> > > +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> > > +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> > > +    build_serialization_instruction_entry(table_instruction_data,
> > > +        action, INST_READ_REGISTER       , 0, 32,
> > > +        bar0 + ERST_VALUE_OFFSET, 0, MASK32);
> > > +
> > > +    action = ACTION_GET_EXECUTE_OPERATION_TIMINGS;
> > > +    build_serialization_instruction_entry(table_instruction_data,
> > > +        action, INST_WRITE_REGISTER_VALUE, 0, 32,
> > > +        bar0 + ERST_ACTION_OFFSET, action, MASK8);
> > > +    build_serialization_instruction_entry(table_instruction_data,
> > > +        action, INST_READ_REGISTER       , 0, 64,
> > > +        bar0 + ERST_VALUE_OFFSET, 0, MASK64);
> > > +
> > > +    /* Serialization Header */
> > > +    acpi_table_begin(&table, table_data);
> > > +
> > > +    /* Serialization Header Size */
> > > +    build_append_int_noprefix(table_data, 48, 4);
> > > +
> > > +    /* Reserved */
> > > +    build_append_int_noprefix(table_data,  0, 4);
> > > +
> > > +    /*
> > > +     * Instruction Entry Count
> > > +     * Each instruction entry is 32 bytes
> > > +     */
> > 
> > assert that it's a multiple of 32 maybe
> done!
> 
> > 
> > > +    build_append_int_noprefix(table_data,
> > > +        (table_instruction_data->len / 32), 4);
> > > +
> > > +    /* Serialization Instruction Entries */
> > > +    g_array_append_vals(table_data, table_instruction_data->data,
> > > +        table_instruction_data->len);
> > > +    g_array_free(table_instruction_data, TRUE);
> > > +
> > > +    acpi_table_end(linker, &table);
> > > +}
> > > +
> > >   /*******************************************************************/
> > >   /*******************************************************************/
> > >   static int erst_post_load(void *opaque, int version_id)
> > > -- 
> > > 1.8.3.1
> > 


