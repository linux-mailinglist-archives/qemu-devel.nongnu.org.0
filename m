Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D17749BAD6
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 19:00:28 +0100 (CET)
Received: from localhost ([::1]:54504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCQ7H-0008M1-Bz
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 13:00:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nCQ5l-0007cL-SU
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 12:58:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nCQ5g-00040R-7A
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 12:58:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643133523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2ptkGQzfizBwXejl4cZ+ojP/RXP1eTRpLmkxDBWCSgg=;
 b=SdN2ga9IbH957T31dqvQqq9UpvOLt7yq9uVJHySW0cuPpll9BMHaW0m+G6RQTM41hFZzD0
 WObm2OHE/ounHD3ul5BXIKKgIlL938PZ3mb0lKWq9lzjgnwD5KnCwz/+WtRH2vVFSwD1cw
 eDXB419xgAKdxV5pJqechyvI0Us5cfU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-dWRj7I9xPzqKdaGWhwA0Lg-1; Tue, 25 Jan 2022 12:58:39 -0500
X-MC-Unique: dWRj7I9xPzqKdaGWhwA0Lg-1
Received: by mail-ej1-f71.google.com with SMTP id
 v2-20020a1709062f0200b006a5f725efc1so3763628eji.23
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 09:58:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2ptkGQzfizBwXejl4cZ+ojP/RXP1eTRpLmkxDBWCSgg=;
 b=m1ndCXD3PkDHvXgtpz75nJuAsgUk9uJx0zrv3QsD/C82gMgayiVko93+10i/HyRYwG
 VuAnwtPIVQ7TRlXuZKdlpnk7cwHjjKWWvd71bD/Qjkza53UOwJhE0kKpKXCLmjmaDm0s
 znoquEUVG//ehmf8dCK9iUYVbwIZsuOKcm0dSLDioJAu9QQKL39uiWYD18bxWBU+Glyi
 MnHjx4IfEeHgccqmeYekWzMakK8i/S8Ijzw7dtlh3GcFQuNv3/Acb05KbkEFpsLh4JVU
 3GOj6hGfNt87ODKHpfYila6u86bx0Qyormv0r+UDyf3DXZ93uva/K9QRNjw/aTWXyCg3
 cCKQ==
X-Gm-Message-State: AOAM532rJ+/AeRj2UAwquiFeeijk/uZM2wokZBoohyvQXrkfCD8ypT8F
 kBDouDPdZnS5+L3x8Fkal/1/w7N426yO/US4rlhlVqrAjem5ttuYonbXxP92Tm4l1yCCInJWhNv
 X14ZiwTNJZHyo6R4=
X-Received: by 2002:a05:6402:3594:: with SMTP id
 y20mr10580722edc.92.1643133516878; 
 Tue, 25 Jan 2022 09:58:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwULAY/S0fx9pl7052vwRmSd24Lw4VMiF8gbLqoG8Ky0tPEUYzgqsE/BUhM4eHGyanOiVBLKg==
X-Received: by 2002:a05:6402:3594:: with SMTP id
 y20mr10580697edc.92.1643133516591; 
 Tue, 25 Jan 2022 09:58:36 -0800 (PST)
Received: from redhat.com ([176.12.185.204])
 by smtp.gmail.com with ESMTPSA id z8sm6477522ejc.151.2022.01.25.09.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 09:58:36 -0800 (PST)
Date: Tue, 25 Jan 2022 12:58:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v13 06/10] ACPI ERST: build the ACPI ERST table
Message-ID: <20220125124649-mutt-send-email-mst@kernel.org>
References: <1643044621-15892-1-git-send-email-eric.devolder@oracle.com>
 <1643044621-15892-7-git-send-email-eric.devolder@oracle.com>
 <alpine.DEB.2.22.394.2201251600060.1134355@anisinha-lenovo>
 <4c680569-bca2-c85b-b0e0-0cfbb5c158fc@oracle.com>
MIME-Version: 1.0
In-Reply-To: <4c680569-bca2-c85b-b0e0-0cfbb5c158fc@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
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
 qemu-devel@nongnu.org, pbonzini@redhat.com, Ani Sinha <ani@anisinha.ca>,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 25, 2022 at 10:24:49AM -0600, Eric DeVolder wrote:
> Ani,
> Thanks for the feedback! Inline responses below.
> eric
> 
> On 1/25/22 04:53, Ani Sinha wrote:
> > 
> > 
> > On Mon, 24 Jan 2022, Eric DeVolder wrote:
> > 
> > > This builds the ACPI ERST table to inform OSPM how to communicate
> > > with the acpi-erst device.
> > > 
> > > Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> > > ---
> > >   hw/acpi/erst.c | 188 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> > >   1 file changed, 188 insertions(+)
> > > 
> > > diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
> > > index fe9ba51..b0c7539 100644
> > > --- a/hw/acpi/erst.c
> > > +++ b/hw/acpi/erst.c
> > > @@ -59,6 +59,27 @@
> > >   #define STATUS_RECORD_STORE_EMPTY     0x04
> > >   #define STATUS_RECORD_NOT_FOUND       0x05
> > > 
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
> > >   /* UEFI 2.1: Appendix N Common Platform Error Record */
> > >   #define UEFI_CPER_RECORD_MIN_SIZE 128U
> > >   #define UEFI_CPER_RECORD_LENGTH_OFFSET 20U
> > > @@ -172,6 +193,173 @@ typedef struct {
> > > 
> > >   /*******************************************************************/
> > >   /*******************************************************************/
> > > +
> > > +/* ACPI 4.0: 17.4.1.2 Serialization Instruction Entries */
> > > +static void build_serialization_instruction_entry(GArray *table_data,
> > > +    uint8_t serialization_action,
> > > +    uint8_t instruction,
> > > +    uint8_t flags,
> > > +    uint8_t register_bit_width,
> > > +    uint64_t register_address,
> > > +    uint64_t value)
> > > +{
> > > +    /* ACPI 4.0: Table 17-18 Serialization Instruction Entry */
> > > +    struct AcpiGenericAddress gas;
> > > +    uint64_t mask;
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
> > > +    gas.access_width = ctz32(register_bit_width) - 2;
> > > +    gas.address = register_address;
> > > +    build_append_gas_from_struct(table_data, &gas);
> > > +    /* Value */
> > > +    build_append_int_noprefix(table_data, value  , 8);
> > > +    /* Mask */
> > > +    mask = (1ULL << (register_bit_width - 1) << 1) - 1;
> > > +    build_append_int_noprefix(table_data, mask  , 8);
> > > +}
> > > +
> > > +/* ACPI 4.0: 17.4.1 Serialization Action Table */
> > > +void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
> > > +    const char *oem_id, const char *oem_table_id)
> > > +{
> > > +    GArray *table_instruction_data;
> > > +    unsigned action;
> > > +    pcibus_t bar0 = pci_get_bar_addr(PCI_DEVICE(erst_dev), 0);
> > > +    AcpiTable table = { .sig = "ERST", .rev = 1, .oem_id = oem_id,
> > > +                        .oem_table_id = oem_table_id };
> > > +
> > > +    trace_acpi_erst_pci_bar_0(bar0);
> > > +
> > > +    /*
> > > +     * Serialization Action Table
> > > +     * The serialization action table must be generated first
> > > +     * so that its size can be known in order to populate the
> > > +     * Instruction Entry Count field.
> > > +     */
> > > +    table_instruction_data = g_array_new(FALSE, FALSE, sizeof(char));
> > > +
> > > +    /*
> > > +     * Macros for use with construction of the action instructions
> > > +     */
> > > +#define BUILD_READ_REGISTER(width_in_bits, reg) \
> > > +    build_serialization_instruction_entry(table_instruction_data, \
> > > +        action, INST_READ_REGISTER, 0, width_in_bits, \
> > > +        bar0 + reg, 0)
> > > +
> > > +#define BUILD_READ_REGISTER_VALUE(width_in_bits, reg, value) \
> > > +    build_serialization_instruction_entry(table_instruction_data, \
> > > +        action, INST_READ_REGISTER_VALUE, 0, width_in_bits, \
> > > +        bar0 + reg, value)
> > > +
> > > +#define BUILD_WRITE_REGISTER(width_in_bits, reg, value) \
> > > +    build_serialization_instruction_entry(table_instruction_data, \
> > > +        action, INST_WRITE_REGISTER, 0, width_in_bits, \
> > > +        bar0 + reg, value)
> > > +
> > > +#define BUILD_WRITE_REGISTER_VALUE(width_in_bits, reg, value) \
> > > +    build_serialization_instruction_entry(table_instruction_data, \
> > > +        action, INST_WRITE_REGISTER_VALUE, 0, width_in_bits, \
> > > +        bar0 + reg, value)
> > > +
> > > +    /* Serialization Instruction Entries */
> > > +    action = ACTION_BEGIN_WRITE_OPERATION;
> > > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > > +
> > > +    action = ACTION_BEGIN_READ_OPERATION;
> > > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > > +
> > > +    action = ACTION_BEGIN_CLEAR_OPERATION;
> > > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > > +
> > > +    action = ACTION_END_OPERATION;
> > > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > > +
> > > +    action = ACTION_SET_RECORD_OFFSET;
> > > +    BUILD_WRITE_REGISTER(32, ERST_VALUE_OFFSET, 0);
> > > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > > +
> > > +    action = ACTION_EXECUTE_OPERATION;
> > > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_VALUE_OFFSET,
> > > +        ERST_EXECUTE_OPERATION_MAGIC);


So e.g.


typedef struct {
    GArray *table_data;
    uint8_t register_bit_width;
    pcibus_t bar;
    unsigned register;
} BuildSerializationInstructionEntry;

void
build_serialization_instruction_entry(BuildSerializationInstructionEntry *)

and now

BuildSerializationInstructionEntry entry = {
	.table_data = table_instruction_data,
	bar = bar0,
};
BuildSerializationInstructionEntry write32 = {
	.table_data = entry.table_data,
	.bar = entry.bar,
	.register_bit_width = 32,
	.register = ERST_ACTION_OFFSET
};

etc.

you can move common fields into structure, uncommon ones
out of it.

> > 
> > except here, on all cases we have
> > BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > 
> > We should treat the above as special case and simplify the rest of the
> > calls (eliminate repeated common arguments).
> 
> OK, I created BUILD_WRITE_ACTION() to replace this occurrence. I've provided
> what this section of code looks like with this and the other below change at
> the end.
> 
> I have seen the comment from Michael and you about using inline functions, I
> will respond to that in the other message.
> 
> > 
> > > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > > +
> > > +    action = ACTION_CHECK_BUSY_STATUS;
> > > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > > +    BUILD_READ_REGISTER_VALUE(32, ERST_VALUE_OFFSET, 0x01);
> > > +
> > > +    action = ACTION_GET_COMMAND_STATUS;
> > > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > > +    BUILD_READ_REGISTER(32, ERST_VALUE_OFFSET);
> > > +
> > > +    action = ACTION_GET_RECORD_IDENTIFIER;
> > > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > > +    BUILD_READ_REGISTER(64, ERST_VALUE_OFFSET);
> > > +
> > > +    action = ACTION_SET_RECORD_IDENTIFIER;
> > > +    BUILD_WRITE_REGISTER(64, ERST_VALUE_OFFSET, 0);
> > > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > 
> > This one seems reverted. Should this be
> > BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > BUILD_WRITE_REGISTER(64, ERST_VALUE_OFFSET, 0);
> > 
> > like others?
> 
> This is a SET operation, so the data is provided in VALUE register, then
> the ACTION is written to perform the command, ie record the value.
> 
> > 
> > > +
> > > +    action = ACTION_GET_RECORD_COUNT;
> > > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > > +    BUILD_READ_REGISTER(32, ERST_VALUE_OFFSET);
> > > +
> > > +    action = ACTION_BEGIN_DUMMY_WRITE_OPERATION;
> > > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > > +
> > > +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE;
> > > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > > +    BUILD_READ_REGISTER(64, ERST_VALUE_OFFSET);
> > > +
> > > +    action = ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;
> > > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > > +    BUILD_READ_REGISTER(64, ERST_VALUE_OFFSET);
> > > +
> > > +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES;
> > > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > > +    BUILD_READ_REGISTER(32, ERST_VALUE_OFFSET);
> > > +
> > > +    action = ACTION_GET_EXECUTE_OPERATION_TIMINGS;
> > > +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> > > +    BUILD_READ_REGISTER(64, ERST_VALUE_OFFSET);
> > > +
> > 
> > BUILD_READ_REGISTER() is always called with ERST_VALUE_OFFSET as second
> > argument. WE should eliminate this repeated passing of same argument.
> 
> The BUILD_READ_REGISTER is always against the VALUE register, as you point out,
> so I've s/BUILD_READ_REGISTER/BUILD_READ_VALUE/ and embedded the offset in the
> macro now. You can see this below.
> 
> > 
> > 
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
> > > +    g_assert((table_instruction_data->len) % 32 == 0);
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
> > > +/*******************************************************************/
> > > +/*******************************************************************/
> > >   static uint8_t *get_nvram_ptr_by_index(ERSTDeviceState *s, unsigned index)
> > >   {
> > >       uint8_t *rc = NULL;
> > > --
> > > 1.8.3.1
> > > 
> > > 
> 
> And here is what the main snippet looks like with the above changes (a diff
> is quite messy):
> 
>     /*
>      * Macros for use with construction of the action instructions
>      */
> #define BUILD_READ_VALUE(width_in_bits) \
>     build_serialization_instruction_entry(table_instruction_data, \
>         action, INST_READ_REGISTER, 0, width_in_bits, \
>         bar0 + ERST_VALUE_OFFSET, 0)
> 
> #define BUILD_READ_VALUE_VALUE(width_in_bits, value) \
>     build_serialization_instruction_entry(table_instruction_data, \
>         action, INST_READ_REGISTER_VALUE, 0, width_in_bits, \
>         bar0 + ERST_VALUE_OFFSET, value)
> 
> #define BUILD_WRITE_REGISTER(width_in_bits, reg, value) \
>     build_serialization_instruction_entry(table_instruction_data, \
>         action, INST_WRITE_REGISTER, 0, width_in_bits, \
>         bar0 + reg, value)
> 
> #define BUILD_WRITE_REGISTER_VALUE(width_in_bits, reg, value) \
>     build_serialization_instruction_entry(table_instruction_data, \
>         action, INST_WRITE_REGISTER_VALUE, 0, width_in_bits, \
>         bar0 + reg, value)
> 
> #define BUILD_WRITE_ACTION() \
>     BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action)
> 
>     /* Serialization Instruction Entries */
>     action = ACTION_BEGIN_WRITE_OPERATION;
>     BUILD_WRITE_ACTION();
> 
>     action = ACTION_BEGIN_READ_OPERATION;
>     BUILD_WRITE_ACTION();
> 
>     action = ACTION_BEGIN_CLEAR_OPERATION;
>     BUILD_WRITE_ACTION();
> 
>     action = ACTION_END_OPERATION;
>     BUILD_WRITE_ACTION();
> 
>     action = ACTION_SET_RECORD_OFFSET;
>     BUILD_WRITE_REGISTER(32, ERST_VALUE_OFFSET, 0);
>     BUILD_WRITE_ACTION();
> 
>     action = ACTION_EXECUTE_OPERATION;
>     BUILD_WRITE_REGISTER_VALUE(32, ERST_VALUE_OFFSET,
>         ERST_EXECUTE_OPERATION_MAGIC);
>     BUILD_WRITE_ACTION();
> 
>     action = ACTION_CHECK_BUSY_STATUS;
>     BUILD_WRITE_ACTION();
>     BUILD_READ_VALUE_VALUE(32, 0x01);
> 
>     action = ACTION_GET_COMMAND_STATUS;
>     BUILD_WRITE_ACTION();
>     BUILD_READ_VALUE(32);
> 
>     action = ACTION_GET_RECORD_IDENTIFIER;
>     BUILD_WRITE_ACTION();
>     BUILD_READ_VALUE(64);
> 
>     action = ACTION_SET_RECORD_IDENTIFIER;
>     BUILD_WRITE_REGISTER(64, ERST_VALUE_OFFSET, 0);
>     BUILD_WRITE_ACTION();
> 
>     action = ACTION_GET_RECORD_COUNT;
>     BUILD_WRITE_ACTION();
>     BUILD_READ_VALUE(32);
> 
>     action = ACTION_BEGIN_DUMMY_WRITE_OPERATION;
>     BUILD_WRITE_ACTION();
>     BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> 
>     action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE;
>     BUILD_WRITE_ACTION();
>     BUILD_READ_VALUE(64);
> 
>     action = ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;
>     BUILD_WRITE_ACTION();
>     BUILD_READ_VALUE(64);
> 
>     action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES;
>     BUILD_WRITE_ACTION();
>     BUILD_READ_VALUE(32);
> 
>     action = ACTION_GET_EXECUTE_OPERATION_TIMINGS;
>     BUILD_WRITE_ACTION();
>     BUILD_READ_VALUE(64);
> 
>     /* Serialization Header */


