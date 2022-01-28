Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E55749FE87
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 17:59:20 +0100 (CET)
Received: from localhost ([::1]:51014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDUal-0004I3-5X
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 11:59:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nDTtN-0000pb-AC
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 11:14:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nDTtK-0004TK-Jp
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 11:14:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643386465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=15gytEXhlTmDq7mth31T+ucTn1iLZJPlg7ik2XNK5b0=;
 b=U2HhYZ4rp3rKBAEsNy0Vf3BMkeH9x9lNuhVG8AH+OFuq1xqww+xINqpHkWJKH5tYe/WVL1
 rXSrLN3K1dmLQh7EDKsnVSzBOnhwnnA+o/Fvw59zPMp6dUlgeC6WgCdx+RJ637Dq9c7xoO
 YJFZmZ0ySl3yY2PfoJ4JjJIXEItkdxI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-ygXVdcHmPDyvvON9kymEiA-1; Fri, 28 Jan 2022 11:14:24 -0500
X-MC-Unique: ygXVdcHmPDyvvON9kymEiA-1
Received: by mail-wm1-f69.google.com with SMTP id
 v185-20020a1cacc2000000b0034906580813so6116439wme.1
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 08:14:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=15gytEXhlTmDq7mth31T+ucTn1iLZJPlg7ik2XNK5b0=;
 b=hISYvnqi+4UBPpWXtAklGp3XmF7dUPQ+MbrN+7lEOj9h0LCaBsEubEZ4qc6vqwlOys
 viNZyVI22WloYGHa1QYI88uZ7addgva1KNxVliBK68KunnQGA3DC7UU7Snx7kTW12CoH
 JQjgjqb4+Fe2+w1rNOP9Yfn9D1lRxsaxmA0Tw8I8MkZmigWAHjPYUdmvup3eAvZqoswB
 PRAq6r6ZwVgy+uv/qVVaoqDs4bd2N+EpCLW12fUIThV8GQNU8aFesvAJUvUTQNPfcT5Q
 7zUVj4dkS8F3LHoSyL7JIgVwXuFcKTErN2SK7ny/qRCE45/coqtVuVaswrZCOeQiHB7A
 5FWg==
X-Gm-Message-State: AOAM530MmSw42Ptqa39S2nCBtZeamy0uu4uos6TFz6PQ1cOquRluzGHX
 NX+k8buTPU4Xo0/FVJ6mFmsYurrje0+6ddXwY8hfyM9sik55StanSb0VnLwGj4uyOyml6jtuPSd
 nzZC/Y8Wz6Xbw1Vw=
X-Received: by 2002:adf:de0b:: with SMTP id b11mr7297304wrm.712.1643386462905; 
 Fri, 28 Jan 2022 08:14:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6RR2AcrVCIyxP5GxS23EvH66SGSeOpYFfrDjDBxiX2LFZVQSuRqBdfYmT/GdT+qUTdhCrvw==
X-Received: by 2002:adf:de0b:: with SMTP id b11mr7297285wrm.712.1643386462644; 
 Fri, 28 Jan 2022 08:14:22 -0800 (PST)
Received: from redhat.com ([2.55.144.199])
 by smtp.gmail.com with ESMTPSA id l39sm2357716wms.24.2022.01.28.08.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 08:14:22 -0800 (PST)
Date: Fri, 28 Jan 2022 11:14:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v14 06/10] ACPI ERST: build the ACPI ERST table
Message-ID: <20220128111327-mutt-send-email-mst@kernel.org>
References: <1643214514-2839-1-git-send-email-eric.devolder@oracle.com>
 <1643214514-2839-7-git-send-email-eric.devolder@oracle.com>
 <alpine.OSX.2.20.2201271401250.42000@athabasca.local>
 <1f544cb3-7434-3480-63fc-ff317327ea78@oracle.com>
 <20220127193136-mutt-send-email-mst@kernel.org>
 <c5460e4e-61dd-78ad-6703-e518a8302097@oracle.com>
 <20220128105311-mutt-send-email-mst@kernel.org>
 <db012849-b7ec-eecc-bf41-a6b211c021f0@oracle.com>
MIME-Version: 1.0
In-Reply-To: <db012849-b7ec-eecc-bf41-a6b211c021f0@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, Jan 28, 2022 at 10:01:18AM -0600, Eric DeVolder wrote:
> Michael, thanks! See inline response below, please.
> eric
> 
> On 1/28/22 09:54, Michael S. Tsirkin wrote:
> > On Fri, Jan 28, 2022 at 09:11:41AM -0600, Eric DeVolder wrote:
> > > Michael,
> > > Thanks for examining this. Inline response below.
> > > eric
> > > 
> > > On 1/27/22 18:37, Michael S. Tsirkin wrote:
> > > > On Thu, Jan 27, 2022 at 04:02:07PM -0600, Eric DeVolder wrote:
> > > > > Ani,
> > > > > Thanks for the RB! Inline responses below.
> > > > > eric
> > > > > 
> > > > > On 1/27/22 02:36, Ani Sinha wrote:
> > > > > > 
> > > > > > 
> > > > > > On Wed, 26 Jan 2022, Eric DeVolder wrote:
> > > > > > 
> > > > > > > This builds the ACPI ERST table to inform OSPM how to communicate
> > > > > > > with the acpi-erst device.
> > > > > > 
> > > > > > There might be more optimizations possible but I think we have messaged
> > > > > > this code enough. We can further rework the code if needed in subsequent
> > > > > > patches once this is pushed.
> > > > > > 
> > > > > > > 
> > > > > > > Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> > > > > > 
> > > > > > with some minor comments,
> > > > > > 
> > > > > > Reviewed-by: Ani Sinha <ani@anisinha.ca>
> > > > > > 
> > > > > > >     hw/acpi/erst.c | 225 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> > > > > > >     1 file changed, 225 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
> > > > > > > index fe9ba51..5d5a639 100644
> > > > > > > --- a/hw/acpi/erst.c
> > > > > > > +++ b/hw/acpi/erst.c
> > > > > > > @@ -59,6 +59,27 @@
> > > > > > >     #define STATUS_RECORD_STORE_EMPTY     0x04
> > > > > > >     #define STATUS_RECORD_NOT_FOUND       0x05
> > > > > > > 
> > > > > > > +/* ACPI 4.0: Table 17-19 Serialization Instructions */
> > > > > > > +#define INST_READ_REGISTER                 0x00
> > > > > > > +#define INST_READ_REGISTER_VALUE           0x01
> > > > > > > +#define INST_WRITE_REGISTER                0x02
> > > > > > > +#define INST_WRITE_REGISTER_VALUE          0x03
> > > > > > > +#define INST_NOOP                          0x04
> > > > > > > +#define INST_LOAD_VAR1                     0x05
> > > > > > > +#define INST_LOAD_VAR2                     0x06
> > > > > > > +#define INST_STORE_VAR1                    0x07
> > > > > > > +#define INST_ADD                           0x08
> > > > > > > +#define INST_SUBTRACT                      0x09
> > > > > > > +#define INST_ADD_VALUE                     0x0A
> > > > > > > +#define INST_SUBTRACT_VALUE                0x0B
> > > > > > > +#define INST_STALL                         0x0C
> > > > > > > +#define INST_STALL_WHILE_TRUE              0x0D
> > > > > > > +#define INST_SKIP_NEXT_INSTRUCTION_IF_TRUE 0x0E
> > > > > > > +#define INST_GOTO                          0x0F
> > > > > > > +#define INST_SET_SRC_ADDRESS_BASE          0x10
> > > > > > > +#define INST_SET_DST_ADDRESS_BASE          0x11
> > > > > > > +#define INST_MOVE_DATA                     0x12
> > > > > > > +
> > > > > > >     /* UEFI 2.1: Appendix N Common Platform Error Record */
> > > > > > >     #define UEFI_CPER_RECORD_MIN_SIZE 128U
> > > > > > >     #define UEFI_CPER_RECORD_LENGTH_OFFSET 20U
> > > > > > > @@ -172,6 +193,210 @@ typedef struct {
> > > > > > > 
> > > > > > >     /*******************************************************************/
> > > > > > >     /*******************************************************************/
> > > > > > > +typedef struct {
> > > > > > > +    GArray *table_data;
> > > > > > > +    pcibus_t bar;
> > > > > > > +    uint8_t instruction;
> > > > > > > +    uint8_t flags;
> > > > > > > +    uint8_t register_bit_width;
> > > > > > > +    pcibus_t register_offset;
> > > > > > > +} BuildSerializationInstructionEntry;
> > > > > > > +
> > > > > > > +/* ACPI 4.0: 17.4.1.2 Serialization Instruction Entries */
> > > > > > > +static void build_serialization_instruction(
> > > > > > > +    BuildSerializationInstructionEntry *e,
> > > > > > > +    uint8_t serialization_action,
> > > > > > > +    uint64_t value)
> > > > > > > +{
> > > > > > > +    /* ACPI 4.0: Table 17-18 Serialization Instruction Entry */
> > > > > > > +    struct AcpiGenericAddress gas;
> > > > > > > +    uint64_t mask;
> > > > > > > +
> > > > > > > +    /* Serialization Action */
> > > > > > > +    build_append_int_noprefix(e->table_data, serialization_action, 1);
> > > > > > > +    /* Instruction */
> > > > > > > +    build_append_int_noprefix(e->table_data, e->instruction, 1);
> > > > > > > +    /* Flags */
> > > > > > > +    build_append_int_noprefix(e->table_data, e->flags, 1);
> > > > > > > +    /* Reserved */
> > > > > > > +    build_append_int_noprefix(e->table_data, 0, 1);
> > > > > > > +    /* Register Region */
> > > > > > > +    gas.space_id = AML_SYSTEM_MEMORY;
> > > > > > > +    gas.bit_width = e->register_bit_width;
> > > > > > > +    gas.bit_offset = 0;
> > > > > > > +    gas.access_width = ctz32(e->register_bit_width) - 2;
> > > > > > 
> > > > > > Should this be casted as unit8_t?
> > > > > OK, done.
> > > > > 
> > > > > > 
> > > > > > > +    gas.address = (uint64_t)(e->bar + e->register_offset);
> > > > > > > +    build_append_gas_from_struct(e->table_data, &gas);
> > > > > > > +    /* Value */
> > > > > > > +    build_append_int_noprefix(e->table_data, value, 8);
> > > > > > > +    /* Mask */
> > > > > > > +    mask = (1ULL << (e->register_bit_width - 1) << 1) - 1;
> > > > > > > +    build_append_int_noprefix(e->table_data, mask, 8);
> > > > > > > +}
> > > > > > > +
> > > > > > > +/* ACPI 4.0: 17.4.1 Serialization Action Table */
> > > > > > > +void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
> > > > > > > +    const char *oem_id, const char *oem_table_id)
> > > > > > > +{
> > > > > > > +    /*
> > > > > > > +     * Serialization Action Table
> > > > > > > +     * The serialization action table must be generated first
> > > > > > > +     * so that its size can be known in order to populate the
> > > > > > > +     * Instruction Entry Count field.
> > > > > > > +     */
> > > > > > > +    GArray *table_instruction_data = g_array_new(FALSE, FALSE, sizeof(char));
> > > > > > > +    pcibus_t bar0 = pci_get_bar_addr(PCI_DEVICE(erst_dev), 0);
> > > > > > > +    AcpiTable table = { .sig = "ERST", .rev = 1, .oem_id = oem_id,
> > > > > > > +                        .oem_table_id = oem_table_id };
> > > > > > > +    /* Contexts for the different ways ACTION and VALUE are accessed */
> > > > > > > +    BuildSerializationInstructionEntry rd_value_32_val = {
> > > > > > > +        .table_data = table_instruction_data,
> > > > > > > +        .bar = bar0,
> > > > > > > +        .instruction = INST_READ_REGISTER_VALUE,
> > > > > > > +        .flags = 0,
> > > > > > > +        .register_bit_width = 32,
> > > > > > > +        .register_offset = ERST_VALUE_OFFSET,
> > > > > > > +    };
> > > > > > > +    BuildSerializationInstructionEntry rd_value_32 = {
> > > > > > > +        .table_data = table_instruction_data,
> > > > > > > +        .bar = bar0,
> > > > > > > +        .instruction = INST_READ_REGISTER,
> > > > > > > +        .flags = 0,
> > > > > > > +        .register_bit_width = 32,
> > > > > > > +        .register_offset = ERST_VALUE_OFFSET,
> > > > > > > +    };
> > > > > > > +    BuildSerializationInstructionEntry rd_value_64 = {
> > > > > > > +        .table_data = table_instruction_data,
> > > > > > > +        .bar = bar0,
> > > > > > > +        .instruction = INST_READ_REGISTER,
> > > > > > > +        .flags = 0,
> > > > > > > +        .register_bit_width = 64,
> > > > > > > +        .register_offset = ERST_VALUE_OFFSET,
> > > > > > > +    };
> > > > > > > +    BuildSerializationInstructionEntry wr_value_32_val = {
> > > > > > > +        .table_data = table_instruction_data,
> > > > > > > +        .bar = bar0,
> > > > > > > +        .instruction = INST_WRITE_REGISTER_VALUE,
> > > > > > > +        .flags = 0,
> > > > > > > +        .register_bit_width = 32,
> > > > > > > +        .register_offset = ERST_VALUE_OFFSET,
> > > > > > > +    };
> > > > > > > +    BuildSerializationInstructionEntry wr_value_32 = {
> > > > > > > +        .table_data = table_instruction_data,
> > > > > > > +        .bar = bar0,
> > > > > > > +        .instruction = INST_WRITE_REGISTER,
> > > > > > > +        .flags = 0,
> > > > > > > +        .register_bit_width = 32,
> > > > > > > +        .register_offset = ERST_VALUE_OFFSET,
> > > > > > > +    };
> > > > > > > +    BuildSerializationInstructionEntry wr_value_64 = {
> > > > > > > +        .table_data = table_instruction_data,
> > > > > > > +        .bar = bar0,
> > > > > > > +        .instruction = INST_WRITE_REGISTER,
> > > > > > > +        .flags = 0,
> > > > > > > +        .register_bit_width = 64,
> > > > > > > +        .register_offset = ERST_VALUE_OFFSET,
> > > > > > > +    };
> > > > > > > +    BuildSerializationInstructionEntry wr_action = {
> > > > > > > +        .table_data = table_instruction_data,
> > > > > > > +        .bar = bar0,
> > > > > > > +        .instruction = INST_WRITE_REGISTER_VALUE,
> > > > > > > +        .flags = 0,
> > > > > > > +        .register_bit_width = 32,
> > > > > > > +        .register_offset = ERST_ACTION_OFFSET,
> > > > > > > +    };
> > > > > > 
> > > > > > We can probably write a macro to simply generating these structs. I see
> > > > > > .bar and .flags are the same in all structs. The .bit_width can be a param
> > > > > > into the macro etc.
> > > > > Agree, however the request was to NOT hide the use of local variables in
> > > > > macros, so while .flags is always 0, .instruction, .register_bit_width and .register_offset
> > > > > would be parameters, that leaves .table_data and .bar which just need the local
> > > > > variables. Is the following acceptable (which hides the use of the local variables)?
> > > > 
> > > > You can just use assignment:
> > > > 
> > > >      BuildSerializationInstructionEntry entry = {
> > > >          .table_data = table_instruction_data,
> > > >          .bar = bar0,
> > > >          .flags = 0,
> > > >          .register_bit_width = 32,
> > > >      };
> > > >      BuildSerializationInstructionEntry rd_value_32_val = entry;
> > > >      rd_value_32_val.action = INST_READ_REGISTER_VALUE;
> > > >      rd_value_32_val.register_offset = ERST_ACTION_OFFSET;
> > > > 
> > > > and so on.
> > > > not sure it's worth it, it's just a couple of lines.
> > > > 
> > > 
> > > OK, here is the equivalent using struct assignment, is this what you were after?
> > > 
> > >      BuildSerializationInstructionEntry base = {
> > >          .table_data = table_instruction_data,
> > >          .bar = bar0,
> > >          .instruction = INST_WRITE_REGISTER,
> > >          .flags = 0,
> > >          .register_bit_width = 32,
> > >          .register_offset = ERST_VALUE_OFFSET,
> > >      };
> > >      BuildSerializationInstructionEntry rd_value_32_val = base;
> > >      rd_value_32_val.instruction = INST_READ_REGISTER_VALUE;
> > >      BuildSerializationInstructionEntry rd_value_32 = base;
> > >      rd_value_32.instruction = INST_READ_REGISTER;
> > >      BuildSerializationInstructionEntry rd_value_64 = base;
> > >      rd_value_64.instruction = INST_READ_REGISTER;
> > >      rd_value_64.register_bit_width = 64;
> > >      BuildSerializationInstructionEntry wr_value_32_val = base;
> > >      wr_value_32_val.instruction = INST_WRITE_REGISTER_VALUE;
> > >      BuildSerializationInstructionEntry wr_value_32 = base;
> > >      BuildSerializationInstructionEntry wr_value_64 = base;
> > >      wr_value_64.register_bit_width = 64;
> > >      BuildSerializationInstructionEntry wr_action = base;
> > >      wr_action.instruction = INST_WRITE_REGISTER_VALUE;
> > >      wr_action.register_offset = ERST_ACTION_OFFSET;
> > > 
> > 
> > That's what I described, yes. We should have some empty lines here I
> > guess. I'm ok with the original one too, there's not too much
> > duplication.
> 
> Are the blank lines referring to spacing out the setup of each of the 7 accesors?
> If so, I could put a one line comment between each setup? Or is a blank line also
> needed?

A blank line between declarations and code is usually a good idea.


> Is it OK to post v15 with the struct assignment approach? Or would you prefer the
> explicit structs (which is what I think you mean by 'the original one')?
> 
> Thanks!
> eric

I don't care either way.

> > 
> > 
> > > 
> > > > 
> > > > 
> > > > > #define SERIALIZATIONINSTRUCTIONCTX(name, \
> > > > >       inst, bit_width, offset) \
> > > > >       BuildSerializationInstructionEntry name = { \
> > > > >           .table_data = table_instruction_data, \
> > > > >           .bar = bar0, \
> > > > >           .instruction = inst, \
> > > > >           .flags = 0, \
> > > > >           .register_bit_width = bit_width, \
> > > > >           .register_offset = offset, \
> > > > >       }
> > > > >       SERIALIZATIONINSTRUCTIONCTX(rd_value_32_val,
> > > > >           INST_READ_REGISTER_VALUE, 32, ERST_VALUE_OFFSET);
> > > > >       SERIALIZATIONINSTRUCTIONCTX(rd_value_32,
> > > > >           INST_READ_REGISTER, 32, ERST_VALUE_OFFSET);
> > > > >       SERIALIZATIONINSTRUCTIONCTX(rd_value_64,
> > > > >           INST_READ_REGISTER, 64, ERST_VALUE_OFFSET);
> > > > >       SERIALIZATIONINSTRUCTIONCTX(wr_value_32_val,
> > > > >           INST_WRITE_REGISTER_VALUE, 32, ERST_VALUE_OFFSET);
> > > > >       SERIALIZATIONINSTRUCTIONCTX(wr_value_32,
> > > > >           INST_WRITE_REGISTER, 32, ERST_VALUE_OFFSET);
> > > > >       SERIALIZATIONINSTRUCTIONCTX(wr_value_64,
> > > > >           INST_WRITE_REGISTER, 64, ERST_VALUE_OFFSET);
> > > > >       SERIALIZATIONINSTRUCTIONCTX(wr_action,
> > > > >           INST_WRITE_REGISTER_VALUE, 32, ERST_ACTION_OFFSET);
> > > > > 
> > > > > These are the 7 accessors needed.
> > > > 
> > > > not at all sure this one is worth the macro mess.
> > > 
> > > I'm hoping to produce a v15 with the style you want.
> > > eric
> > > 
> > > > 
> > > > > > 
> > > > > > > +    unsigned action;
> > > > > > > +
> > > > > > > +    trace_acpi_erst_pci_bar_0(bar0);
> > > > > > > +
> > > > > > > +    /* Serialization Instruction Entries */
> > > > > > > +    action = ACTION_BEGIN_WRITE_OPERATION;
> > > > > > > +    build_serialization_instruction(&wr_action, action, action);
> > > > > > > +
> > > > > > > +    action = ACTION_BEGIN_READ_OPERATION;
> > > > > > > +    build_serialization_instruction(&wr_action, action, action);
> > > > > > > +
> > > > > > > +    action = ACTION_BEGIN_CLEAR_OPERATION;
> > > > > > > +    build_serialization_instruction(&wr_action, action, action);
> > > > > > > +
> > > > > > > +    action = ACTION_END_OPERATION;
> > > > > > > +    build_serialization_instruction(&wr_action, action, action);
> > > > > > > +
> > > > > > > +    action = ACTION_SET_RECORD_OFFSET;
> > > > > > > +    build_serialization_instruction(&wr_value_32, action, 0);
> > > > > > > +    build_serialization_instruction(&wr_action, action, action);
> > > > > > > +
> > > > > > > +    action = ACTION_EXECUTE_OPERATION;
> > > > > > > +    build_serialization_instruction(&wr_value_32_val, action,
> > > > > > > +        ERST_EXECUTE_OPERATION_MAGIC);
> > > > > > > +    build_serialization_instruction(&wr_action, action, action);
> > > > > > > +
> > > > > > > +    action = ACTION_CHECK_BUSY_STATUS;
> > > > > > > +    build_serialization_instruction(&wr_action, action, action);
> > > > > > > +    build_serialization_instruction(&rd_value_32_val, action, 0x01);
> > > > > > > +
> > > > > > > +    action = ACTION_GET_COMMAND_STATUS;
> > > > > > > +    build_serialization_instruction(&wr_action, action, action);
> > > > > > > +    build_serialization_instruction(&rd_value_32, action, 0);
> > > > > > > +
> > > > > > > +    action = ACTION_GET_RECORD_IDENTIFIER;
> > > > > > > +    build_serialization_instruction(&wr_action, action, action);
> > > > > > > +    build_serialization_instruction(&rd_value_64, action, 0);
> > > > > > > +
> > > > > > > +    action = ACTION_SET_RECORD_IDENTIFIER;
> > > > > > > +    build_serialization_instruction(&wr_value_64, action, 0);
> > > > > > > +    build_serialization_instruction(&wr_action, action, action);
> > > > > > > +
> > > > > > > +    action = ACTION_GET_RECORD_COUNT;
> > > > > > > +    build_serialization_instruction(&wr_action, action, action);
> > > > > > > +    build_serialization_instruction(&rd_value_32, action, 0);
> > > > > > > +
> > > > > > > +    action = ACTION_BEGIN_DUMMY_WRITE_OPERATION;
> > > > > > > +    build_serialization_instruction(&wr_action, action, action);
> > > > > > > +
> > > > > > > +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE;
> > > > > > > +    build_serialization_instruction(&wr_action, action, action);
> > > > > > > +    build_serialization_instruction(&rd_value_64, action, 0);
> > > > > > > +
> > > > > > > +    action = ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;
> > > > > > > +    build_serialization_instruction(&wr_action, action, action);
> > > > > > > +    build_serialization_instruction(&rd_value_64, action, 0);
> > > > > > > +
> > > > > > > +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES;
> > > > > > > +    build_serialization_instruction(&wr_action, action, action);
> > > > > > > +    build_serialization_instruction(&rd_value_32, action, 0);
> > > > > > > +
> > > > > > > +    action = ACTION_GET_EXECUTE_OPERATION_TIMINGS;
> > > > > > > +    build_serialization_instruction(&wr_action, action, action);
> > > > > > > +    build_serialization_instruction(&rd_value_64, action, 0);
> > > > > > > +
> > > > > > > +    /* Serialization Header */
> > > > > > > +    acpi_table_begin(&table, table_data);
> > > > > > > +
> > > > > > > +    /* Serialization Header Size */
> > > > > > > +    build_append_int_noprefix(table_data, 48, 4);
> > > > > > > +
> > > > > > > +    /* Reserved */
> > > > > > > +    build_append_int_noprefix(table_data,  0, 4);
> > > > > > > +
> > > > > > > +    /*
> > > > > > > +     * Instruction Entry Count
> > > > > > > +     * Each instruction entry is 32 bytes
> > > > > > > +     */
> > > > > > > +    g_assert((table_instruction_data->len) % 32 == 0);
> > > > > > > +    build_append_int_noprefix(table_data,
> > > > > > > +        (table_instruction_data->len / 32), 4);
> > > > > > > +
> > > > > > > +    /* Serialization Instruction Entries */
> > > > > > > +    g_array_append_vals(table_data, table_instruction_data->data,
> > > > > > > +        table_instruction_data->len);
> > > > > > > +    g_array_free(table_instruction_data, TRUE);
> > > > > > > +
> > > > > > > +    acpi_table_end(linker, &table);
> > > > > > > +}
> > > > > > > +
> > > > > > > +/*******************************************************************/
> > > > > > > +/*******************************************************************/
> > > > > > >     static uint8_t *get_nvram_ptr_by_index(ERSTDeviceState *s, unsigned index)
> > > > > > >     {
> > > > > > >         uint8_t *rc = NULL;
> > > > > > > --
> > > > > > > 1.8.3.1
> > > > > > > 
> > > > > > > 
> > > > 
> > 


