Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16584424042
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 16:38:46 +0200 (CEST)
Received: from localhost ([::1]:49132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY84C-0002Q5-Sp
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 10:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mY82Z-0000bZ-5S
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 10:37:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mY82S-0001rJ-Vd
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 10:37:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633531015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M5jzF5FsTVRxgkqdKkJKCFOxuJFUTNQfF+fN06hDbSA=;
 b=PUKce2noTE831uxb9ayo1L6fVhCk+pZgVb2JN5FMb69F23Hlw6/HhAS8zD+TT7Do9RnoUw
 cAVftDHpq/6rXmJeAe2QErUIQ+MocbgskSq5800u/Uc8Fol9o6sU9ACmgB4KvoSa3eq5oq
 zHnoR+P7Ck/8Z6np/0GQXsw0QHpHReA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-w8_Jz2muO5CYoGINUOezZA-1; Wed, 06 Oct 2021 10:36:54 -0400
X-MC-Unique: w8_Jz2muO5CYoGINUOezZA-1
Received: by mail-wr1-f72.google.com with SMTP id
 e12-20020a056000178c00b001606927de88so2222449wrg.10
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 07:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S0uAoRprRqihQFzodcV2i68WADwXiLthnrHfRc2I1kU=;
 b=EwrVhVPyWOBHND8pS4TMcYmPFlEDDGOMazR40i9+3LRn3T64Z7CN2kll+rXire2/+w
 ImVfe2FI8fFZ3+gH9OSoq2nv9UjKSKEIuvt5IqEoqy0LRbFx4otdRPyxd07l/6Syn+gq
 e2JSleOUDKuS0LSsmIPSbt74dTejLEU51V8lartZ6kB88DA5A9eTmFA9xapEJqrlzQ6H
 /xoK3PuNvnxxUxlJg04YlLGr5EUE5MAcp3Y7TDetz0W5qABZ/tyDdz2XoR6Yz/OFc+b1
 Ey25D4NVFkoMa6tTvJUlFc4nCxC0o/pP6CAfDJBnssTPecaVawovqztzHkczMLE2V77l
 IXnQ==
X-Gm-Message-State: AOAM531UUHRQrGWSMfVwy/sr4de/SRuZNkcqF9ULgmD3SsMyamMMk966
 st4g4zJYMHB52Thg+sU1KmOxQqESEO0sl3QWiM9W0guiIDVb8poeohuvDr5GkHH9fkomBChUy8o
 q3gj9F/ZcaB7woiQ=
X-Received: by 2002:a05:6000:1565:: with SMTP id
 5mr8675153wrz.276.1633531011908; 
 Wed, 06 Oct 2021 07:36:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJym7w+yhuzGTO4b5phc/BBpwBPNErYju3AEls/aWX/kfxIkcZuNceS1tvF/4sPkZ6CVP3MMNQ==
X-Received: by 2002:a05:6000:1565:: with SMTP id
 5mr8675071wrz.276.1633531011226; 
 Wed, 06 Oct 2021 07:36:51 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id d1sm24625758wrr.72.2021.10.06.07.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 07:36:50 -0700 (PDT)
Date: Wed, 6 Oct 2021 16:36:49 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v6 05/10] ACPI ERST: support for ACPI ERST feature
Message-ID: <20211006163649.5fdafa3d@redhat.com>
In-Reply-To: <8a96c313-860b-f881-3a03-aeba6fc6111f@oracle.com>
References: <1628202639-16361-1-git-send-email-eric.devolder@oracle.com>
 <1628202639-16361-6-git-send-email-eric.devolder@oracle.com>
 <20210921173022.7b80f484@redhat.com>
 <a32d9433-3cc1-8bf5-7082-fe603968476a@oracle.com>
 <20211005133947.1bec313a@redhat.com>
 <8a96c313-860b-f881-3a03-aeba6fc6111f@oracle.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 5 Oct 2021 11:40:35 -0500
Eric DeVolder <eric.devolder@oracle.com> wrote:

> Igor, again thanks for the detailed review. Inline responses below.
> eric
>=20
> On 10/5/21 6:39 AM, Igor Mammedov wrote:
> > On Mon, 4 Oct 2021 16:13:09 -0500
> > Eric DeVolder <eric.devolder@oracle.com> wrote:
> >  =20
> >> Igor, thanks for the close examination. Inline responses below.
> >> eric
> >>
> >> On 9/21/21 10:30 AM, Igor Mammedov wrote: =20
> >>> On Thu,  5 Aug 2021 18:30:34 -0400
> >>> Eric DeVolder <eric.devolder@oracle.com> wrote:
> >>>     =20
> >>>> This implements a PCI device for ACPI ERST. This implements the
> >>>> non-NVRAM "mode" of operation for ERST as it is supported by
> >>>> Linux and Windows.
> >>>>
> >>>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> >>>> ---
> >>>>    hw/acpi/erst.c       | 750 ++++++++++++++++++++++++++++++++++++++=
+++++++++++++
> >>>>    hw/acpi/meson.build  |   1 +
> >>>>    hw/acpi/trace-events |  15 ++
> >>>>    3 files changed, 766 insertions(+)
> >>>>    create mode 100644 hw/acpi/erst.c
> >>>>
> >>>> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
> >>>> new file mode 100644
> >>>> index 0000000..eb4ab34
> >>>> --- /dev/null
> >>>> +++ b/hw/acpi/erst.c
> >>>> @@ -0,0 +1,750 @@
> >>>> +/*
> >>>> + * ACPI Error Record Serialization Table, ERST, Implementation
> >>>> + *
> >>>> + * ACPI ERST introduced in ACPI 4.0, June 16, 2009.
> >>>> + * ACPI Platform Error Interfaces : Error Serialization
> >>>> + *
> >>>> + * Copyright (c) 2021 Oracle and/or its affiliates.
> >>>> + *
> >>>> + * SPDX-License-Identifier: GPL-2.0-or-later
> >>>> + */
> >>>> +
> >>>> +#include <sys/types.h>
> >>>> +#include <sys/stat.h>
> >>>> +#include <unistd.h>
> >>>> +
> >>>> +#include "qemu/osdep.h"
> >>>> +#include "qapi/error.h"
> >>>> +#include "hw/qdev-core.h"
> >>>> +#include "exec/memory.h"
> >>>> +#include "qom/object.h"
> >>>> +#include "hw/pci/pci.h"
> >>>> +#include "qom/object_interfaces.h"
> >>>> +#include "qemu/error-report.h"
> >>>> +#include "migration/vmstate.h"
> >>>> +#include "hw/qdev-properties.h"
> >>>> +#include "hw/acpi/acpi.h"
> >>>> +#include "hw/acpi/acpi-defs.h"
> >>>> +#include "hw/acpi/aml-build.h"
> >>>> +#include "hw/acpi/bios-linker-loader.h"
> >>>> +#include "exec/address-spaces.h"
> >>>> +#include "sysemu/hostmem.h"
> >>>> +#include "hw/acpi/erst.h"
> >>>> +#include "trace.h"
> >>>> +
> >>>> +/* ACPI 4.0: Table 17-16 Serialization Actions */
> >>>> +#define ACTION_BEGIN_WRITE_OPERATION         0x0
> >>>> +#define ACTION_BEGIN_READ_OPERATION          0x1
> >>>> +#define ACTION_BEGIN_CLEAR_OPERATION         0x2
> >>>> +#define ACTION_END_OPERATION                 0x3
> >>>> +#define ACTION_SET_RECORD_OFFSET             0x4
> >>>> +#define ACTION_EXECUTE_OPERATION             0x5
> >>>> +#define ACTION_CHECK_BUSY_STATUS             0x6
> >>>> +#define ACTION_GET_COMMAND_STATUS            0x7
> >>>> +#define ACTION_GET_RECORD_IDENTIFIER         0x8
> >>>> +#define ACTION_SET_RECORD_IDENTIFIER         0x9
> >>>> +#define ACTION_GET_RECORD_COUNT              0xA
> >>>> +#define ACTION_BEGIN_DUMMY_WRITE_OPERATION   0xB
> >>>> +#define ACTION_RESERVED                      0xC
> >>>> +#define ACTION_GET_ERROR_LOG_ADDRESS_RANGE   0xD
> >>>> +#define ACTION_GET_ERROR_LOG_ADDRESS_LENGTH  0xE
> >>>> +#define ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES 0xF
> >>>> +#define ACTION_GET_EXECUTE_OPERATION_TIMINGS 0x10
> >>>> +
> >>>> +/* ACPI 4.0: Table 17-17 Command Status Definitions */
> >>>> +#define STATUS_SUCCESS                0x00
> >>>> +#define STATUS_NOT_ENOUGH_SPACE       0x01
> >>>> +#define STATUS_HARDWARE_NOT_AVAILABLE 0x02
> >>>> +#define STATUS_FAILED                 0x03
> >>>> +#define STATUS_RECORD_STORE_EMPTY     0x04
> >>>> +#define STATUS_RECORD_NOT_FOUND       0x05
> >>>> +
> >>>> +
> >>>> +/* UEFI 2.1: Appendix N Common Platform Error Record */
> >>>> +#define UEFI_CPER_RECORD_MIN_SIZE 128U
> >>>> +#define UEFI_CPER_RECORD_LENGTH_OFFSET 20U
> >>>> +#define UEFI_CPER_RECORD_ID_OFFSET 96U
> >>>> +#define IS_UEFI_CPER_RECORD(ptr) \
> >>>> +    (((ptr)[0] =3D=3D 'C') && \
> >>>> +     ((ptr)[1] =3D=3D 'P') && \
> >>>> +     ((ptr)[2] =3D=3D 'E') && \
> >>>> +     ((ptr)[3] =3D=3D 'R'))
> >>>> +#define THE_UEFI_CPER_RECORD_ID(ptr) \
> >>>> +    (*(uint64_t *)(&(ptr)[UEFI_CPER_RECORD_ID_OFFSET]))
> >>>> +
> >>>> +/*
> >>>> + * This implementation is an ACTION (cmd) and VALUE (data)
> >>>> + * interface consisting of just two 64-bit registers.
> >>>> + */
> >>>> +#define ERST_REG_SIZE (16UL)
> >>>> +#define ERST_ACTION_OFFSET (0UL) /* action (cmd) */
> >>>> +#define ERST_VALUE_OFFSET  (8UL) /* argument/value (data) */
> >>>> +
> >>>> +/*
> >>>> + * ERST_RECORD_SIZE is the buffer size for exchanging ERST
> >>>> + * record contents. Thus, it defines the maximum record size.
> >>>> + * As this is mapped through a PCI BAR, it must be a power of
> >>>> + * two and larger than UEFI_CPER_RECORD_MIN_SIZE.
> >>>> + * The backing storage is divided into fixed size "slots",
> >>>> + * each ERST_RECORD_SIZE in length, and each "slot"
> >>>> + * storing a single record. No attempt at optimizing storage
> >>>> + * through compression, compaction, etc is attempted.
> >>>> + * NOTE that slot 0 is reserved for the backing storage header.
> >>>> + * Depending upon the size of the backing storage, additional
> >>>> + * slots will be part of the slot 0 header in order to account
> >>>> + * for a record_id for each available remaining slot.
> >>>> + */
> >>>> +/* 8KiB records, not too small, not too big */
> >>>> +#define ERST_RECORD_SIZE (8192UL)
> >>>> +
> >>>> +#define ACPI_ERST_MEMDEV_PROP "memdev"
> >>>> +
> >>>> +/*
> >>>> + * From the ACPI ERST spec sections:
> >>>> + * A record id of all 0s is used to indicate
> >>>> + * 'unspecified' record id.
> >>>> + * A record id of all 1s is used to indicate
> >>>> + * empty or end.
> >>>> + */
> >>>> +#define ERST_UNSPECIFIED_RECORD_ID (0UL)
> >>>> +#define ERST_EMPTY_END_RECORD_ID (~0UL)
> >>>> +#define ERST_EXECUTE_OPERATION_MAGIC 0x9CUL
> >>>> +#define ERST_IS_VALID_RECORD_ID(rid) \
> >>>> +    ((rid !=3D ERST_UNSPECIFIED_RECORD_ID) && \
> >>>> +     (rid !=3D ERST_EMPTY_END_RECORD_ID))
> >>>> +
> >>>> +typedef struct erst_storage_header_s { =20
> >>>     =20
> >>>> +#define ERST_STORE_MAGIC 0x524F545354535245UL =20
> >>>
> >>> move it out of structure definition,
> >>> also where value comes from? (perhaps something starting
> >>> with ERST... would be more self-describing) =20
> >> done; this value is 'ERSTSTOR', which I've left as a comment in v7.
> >> =20
> >>>     =20
> >>>> +    uint64_t magic;
> >>>> +    uint32_t record_size;
> >>>> +    uint32_t record_offset; /* offset to record storage beyond head=
er */
> >>>> +    uint16_t version;
> >>>> +    uint16_t reserved;
> >>>> +    uint32_t record_count;
> >>>> +    uint64_t map[]; /* contains record_ids, and position indicates =
index */
> >>>> +} erst_storage_header_t; =20
> >>> docs/devel/style.rst: Typedefs =20
> >> done; thanks
> >> =20
> >>>
> >>> also give it's used as header layout in storage,
> >>> set packed attribute for structure =20
> >> done
> >> =20
> >>>     =20
> >>>> +
> >>>> +/*
> >>>> + * Object cast macro
> >>>> + */
> >>>> +#define ACPIERST(obj) \
> >>>> +    OBJECT_CHECK(ERSTDeviceState, (obj), TYPE_ACPI_ERST)
> >>>> +
> >>>> +/*
> >>>> + * Main ERST device state structure
> >>>> + */
> >>>> +typedef struct {
> >>>> +    PCIDevice parent_obj;
> >>>> +
> >>>> +    /* Backend storage */
> >>>> +    HostMemoryBackend *hostmem;
> >>>> +    MemoryRegion *hostmem_mr;
> >>>> +
> >>>> +    /* Programming registers */
> >>>> +    MemoryRegion iomem;
> >>>> +
> >>>> +    /* Exchange buffer */
> >>>> +    Object *exchange_obj;
> >>>> +    HostMemoryBackend *exchange;
> >>>> +    MemoryRegion *exchange_mr;
> >>>> +    uint32_t storage_size;
> >>>> +
> >>>> +    /* Interface state */
> >>>> +    uint8_t operation;
> >>>> +    uint8_t busy_status;
> >>>> +    uint8_t command_status;
> >>>> +    uint32_t record_offset;
> >>>> +    uint64_t reg_action;
> >>>> +    uint64_t reg_value;
> >>>> +    uint64_t record_identifier;
> >>>> +    erst_storage_header_t *header;
> >>>> +    unsigned next_record_index;
> >>>> +    unsigned first_record_index;
> >>>> +    unsigned last_record_index;
> >>>> +
> >>>> +} ERSTDeviceState;
> >>>> +
> >>>> +/******************************************************************=
*/
> >>>> +/******************************************************************=
*/
> >>>> +
> >>>> +static uint8_t *get_nvram_ptr_by_index(ERSTDeviceState *s, unsigned=
 index)
> >>>> +{
> >>>> +    uint8_t *rc =3D NULL;
> >>>> +    off_t offset =3D (index * ERST_RECORD_SIZE); =20
> >>>     =20
> >>>> +    if ((offset + ERST_RECORD_SIZE) <=3D s->storage_size) { =20
> >>>
> >>> it looks like 'index' passed by caller is always valid, if it's the c=
ase
> >>> convert  this to
> >>>           g_assert((offset + ERST_RECORD_SIZE) <=3D s->storage_size))=
 =20
> >> done
> >> =20
> >>>
> >>> also shouldn't <=3D be just < =20
> >> yes, done
> >> =20
> >>>
> >>>     =20
> >>>> +        if (s->hostmem_mr) { =20
> >>> can hostmem_mr be NULL, when this function is called?
> >>> if not I'd drop condition. =20
> >> no, so dropped. done
> >> =20
> >>>     =20
> >>>> +            uint8_t *p =3D (uint8_t *)memory_region_get_ram_ptr(s->=
hostmem_mr);
> >>>> +            rc =3D p + offset;
> >>>> +        }
> >>>> +    }
> >>>> +    return rc;
> >>>> +}
> >>>> +
> >>>> +static void make_erst_storage_header(ERSTDeviceState *s)
> >>>> +{
> >>>> +    erst_storage_header_t *header =3D s->header;
> >>>> +    unsigned mapsz, headersz;
> >>>> +
> >>>> +    header->magic =3D ERST_STORE_MAGIC;
> >>>> +    header->record_size =3D ERST_RECORD_SIZE;
> >>>> +    header->version =3D 0x0101; =20
> >>>
> >>> maybe 0 or 1 to avoid question about what previous versions are =20
> >> changed to simply 0x0100 (ie 1.0) =20
> >>>     =20
> >>>> +    header->reserved =3D 0x0000; =20
> >>> s/0x.../0/ =20
> >> done
> >> =20
> >>>     =20
> >>>> +
> >>>> +    /* Compute mapsize */
> >>>> +    mapsz =3D s->storage_size / ERST_RECORD_SIZE;
> >>>> +    mapsz *=3D sizeof(uint64_t);
> >>>> +    /* Compute header+map size */
> >>>> +    headersz =3D sizeof(erst_storage_header_t) + mapsz; =20
> >>>     =20
> >>>> +    /* Round up to nearest integer multiple of ERST_RECORD_SIZE */
> >>>> +    headersz +=3D (ERST_RECORD_SIZE - 1);
> >>>> +    headersz /=3D ERST_RECORD_SIZE;
> >>>> +    headersz *=3D ERST_RECORD_SIZE; =20
> >>> git grep ROUND_UP
> >>> may be of help here =20
> >> yes, thanks. I'm using that now, done.
> >> =20
> >>>     =20
> >>>> +    header->record_offset =3D headersz;
> >>>> +
> >>>> +    /*
> >>>> +     * The HostMemoryBackend initializes contents to zero,
> >>>> +     * so all record_ids stashed in the map are zero'd.
> >>>> +     * As well the record_count is zero. Properly initialized.
> >>>> +     */
> >>>> +}
> >>>> +
> >>>> +static void check_erst_backend_storage(ERSTDeviceState *s, Error **=
errp)
> >>>> +{
> >>>> +    erst_storage_header_t *header;
> >>>> +
> >>>> +    header =3D (erst_storage_header_t *)get_nvram_ptr_by_index(s, 0=
); =20
> >>> optionally check/assert if it's not 64bit aligned,
> >>> if it's not you risk getting killed by SIGBUG on some hosts,
> >>> since you're accessing fields directly. =20
> >> done!
> >> =20
> >>>     =20
> >>>> +    s->header =3D header;
> >>>> +
> >>>> +    /* Check if header is uninitialized */
> >>>> +    if (header->magic =3D=3D 0UL) { /* HostMemoryBackend inits to 0=
 */
> >>>> +        make_erst_storage_header(s);
> >>>> +    }
> >>>> +
> >>>> +    if (!(
> >>>> +        (header->magic =3D=3D ERST_STORE_MAGIC) &&
> >>>> +        (header->record_size =3D=3D ERST_RECORD_SIZE) &&
> >>>> +        ((header->record_offset % ERST_RECORD_SIZE) =3D=3D 0) &&
> >>>> +        (header->version =3D=3D 0x0101) &&
> >>>> +        (header->reserved =3D=3D 0x0000)
> >>>> +        )) {
> >>>> +        error_setg(errp, "ERST backend storage header is invalid");
> >>>> +    }
> >>>> +
> >>>> +    /* Compute offset of first and last record storage slot */
> >>>> +    s->first_record_index =3D header->record_offset / ERST_RECORD_S=
IZE;
> >>>> +    s->last_record_index =3D (s->storage_size / ERST_RECORD_SIZE); =
=20
> >>>
> >>> applies to whole patch/series,
> >>> if mmaped header values are interpreted as integers you shall
> >>> take care of endianness, i.e. use cpu_to_foo/foo_to_cpu for access =
=20
> >> done; I'm using cpu_to_leX() and leX_to_cpu() for any access to the he=
ader.
> >> =20
> >>>
> >>> and document file endianness in doc (2/10) =20
> >> done
> >> =20
> >>>     =20
> >>>> +}
> >>>> +
> >>>> +static void set_erst_map_by_index(ERSTDeviceState *s, unsigned inde=
x,
> >>>> +    uint64_t record_id) =20
> >>>
> >>> update_[cache|map]_[entry|record_id]() or something like this might b=
e
> >>> a better description erst and index don't really add much here as it'=
s
> >>> clear from context. =20
> >> done; now update_map_entry()
> >> =20
> >>>
> >>>     =20
> >>>> +{
> >>>> +    if (index < s->last_record_index) {
> >>>> +        s->header->map[index] =3D record_id;
> >>>> +    }
> >>>> +}
> >>>> +
> >>>> +static unsigned lookup_erst_record(ERSTDeviceState *s,
> >>>> +    uint64_t record_identifier)
> >>>> +{
> >>>> +    unsigned rc =3D 0; /* 0 not a valid index */
> >>>> +    unsigned index =3D s->first_record_index;
> >>>> +
> >>>> +    /* Find the record_identifier in the map */
> >>>> +    if (record_identifier !=3D ERST_UNSPECIFIED_RECORD_ID) {
> >>>> +        /*
> >>>> +         * Count number of valid records encountered, and
> >>>> +         * short-circuit the loop if identifier not found
> >>>> +         */
> >>>> +        unsigned count =3D 0;
> >>>> +        for (; index < s->last_record_index &&
> >>>> +                count < s->header->record_count; ++index) {
> >>>> +            uint64_t map_record_identifier =3D s->header->map[index=
]; =20
> >>> I'd drop map_record_identifier and use s->header->map[index] directly=
,
> >>> i.e
> >>>      if (s->header->map[index] ... =20
> >> done
> >> =20
> >>>     =20
> >>>> +            if (map_record_identifier !=3D ERST_UNSPECIFIED_RECORD_=
ID) {
> >>>> +                ++count;
> >>>> +            }
> >>>> +            if (map_record_identifier =3D=3D record_identifier) {
> >>>> +                rc =3D index;
> >>>> +                break;
> >>>> +            }
> >>>> +        }
> >>>> +    } else {
> >>>> +        /* Find first available unoccupied slot */
> >>>> +        for (; index < s->last_record_index; ++index) {
> >>>> +            if (s->header->map[index] =3D=3D ERST_UNSPECIFIED_RECOR=
D_ID) {
> >>>> +                rc =3D index;
> >>>> +                break;
> >>>> +            }
> >>>> +        }
> >>>> +    }
> >>>> +
> >>>> +    return rc;
> >>>> +} =20
> >>>
> >>> what's the reason for combining lookup and allocate ops,
> >>> if they where separated it' would be easier to follow code. =20
> >> done; at one point it made sense; no longer.
> >> =20
> >>>     =20
> >>>> +
> >>>> +/* ACPI 4.0: 17.4.2.3 Operations - Clearing */
> >>>> +static unsigned clear_erst_record(ERSTDeviceState *s)
> >>>> +{
> >>>> +    unsigned rc =3D STATUS_RECORD_NOT_FOUND;
> >>>> +    unsigned index;
> >>>> +
> >>>> +    /* Check for valid record identifier */
> >>>> +    if (!ERST_IS_VALID_RECORD_ID(s->record_identifier)) {
> >>>> +        return STATUS_FAILED;
> >>>> +    }
> >>>> +
> >>>> +    index =3D lookup_erst_record(s, s->record_identifier);
> >>>> +    if (index) {
> >>>> +        /* No need to wipe record, just invalidate its map entry */
> >>>> +        set_erst_map_by_index(s, index, ERST_UNSPECIFIED_RECORD_ID)=
;
> >>>> +        s->header->record_count -=3D 1;
> >>>> +        rc =3D STATUS_SUCCESS;
> >>>> +    }
> >>>> +
> >>>> +    return rc;
> >>>> +}
> >>>> +
> >>>> +/* ACPI 4.0: 17.4.2.2 Operations - Reading */
> >>>> +static unsigned read_erst_record(ERSTDeviceState *s)
> >>>> +{
> >>>> +    unsigned rc =3D STATUS_RECORD_NOT_FOUND;
> >>>> +    unsigned index;
> >>>> +
> >>>> +    /* Check record boundary wihin exchange buffer */ =20
> >>>                                   ^^^ typo =20
> >> done
> >> =20
> >>>     =20
> >>>> +    if (s->record_offset >=3D (ERST_RECORD_SIZE - UEFI_CPER_RECORD_=
MIN_SIZE)) {
> >>>> +        return STATUS_FAILED;
> >>>> +    }
> >>>> +
> >>>> +    /* Check for valid record identifier */
> >>>> +    if (!ERST_IS_VALID_RECORD_ID(s->record_identifier)) {
> >>>> +        return STATUS_FAILED;
> >>>> +    }
> >>>> +
> >>>> +    index =3D lookup_erst_record(s, s->record_identifier);
> >>>> +    if (index) {
> >>>> +        uint8_t *ptr;
> >>>> +        uint8_t *record =3D ((uint8_t *)
> >>>> +            memory_region_get_ram_ptr(s->exchange_mr) +
> >>>> +            s->record_offset);
> >>>> +        ptr =3D get_nvram_ptr_by_index(s, index);
> >>>> +        memcpy(record, ptr, ERST_RECORD_SIZE - s->record_offset); =
=20
> >>>
> >>> if record_offset is large enough that record won't fit,
> >>> this will copy truncated record into the exchange buffer.
> >>>
> >>> Maybe it's better to fail whole op? =20
> >> The first check within this function checks for this very condition, a=
nd does fail.
> >> I believe the code does as you are asking. =20
> >=20
> > The 1st check guaranties that 'exchange_mr + record_offset, exchange_mr=
_end'
> > has a space at least for UEFI_CPER_RECORD_MIN_SIZE, while the source re=
cord
> > that's being copied can be larger than that.
> > i.e. assume
> >   record_offset =3D 7, ERST_RECORD_SIZE =3D 10, UEFI_CPER_RECORD_MIN_SI=
ZE =3D 2, ptr->record_size =3D 9
> >    =20
> >   > if (s->record_offset >=3D (ERST_RECORD_SIZE - UEFI_CPER_RECORD_MIN_=
SIZE)) =20
> > will be passed, while =20
> >   > memcpy(record, ptr, ERST_RECORD_SIZE - s->record_offset); =20
> > will copy 3 bytes only, truncating the rest of the record
> > but still report success. =20
> ok, I understand now, thanks!
>=20
> >=20
> > Also, while max copied amount won't exceed exchange_mr capacity
> > due to it being equal to ERST_RECORD_SIZE in current impl., it can
> > be dangerous later on if buffer/record sizes diverge as dependency
> > coded here is implicit. Safer option would be using actual destination
> > buffer/copied record size for check to avoid potential buffer overrun
> > (I'm assuming that records are not random blobs but CPER formatted stru=
cture).
> >=20
> >   copy_size =3D to_be_copied_record_size
> >   if copy_size <=3D memory_region_size(exchange_mr) - record_offset
> >      memcpy(record, ptr, copy_size)
> >   else
> >      error_out =20
> ok
>=20
> >=20
> > [1] the same applies to 'if (s->record_offset >=3D ...)' check
> > make it use actual exchange_mr size explicitly. =20
> ok
>=20
> >=20
> > nit:
> > Also use of record_offset in header and in state is a bit of overloaded=
,
> > I'd consider renaming one of them to avoid confusion. =20
> done; changed header field to 'storage_offset'
>=20
> >  =20
> >>>     =20
> >>>> +        rc =3D STATUS_SUCCESS;
> >>>> +    }
> >>>> +
> >>>> +    return rc;
> >>>> +}
> >>>> +
> >>>> +/* ACPI 4.0: 17.4.2.1 Operations - Writing */
> >>>> +static unsigned write_erst_record(ERSTDeviceState *s)
> >>>> +{
> >>>> +    unsigned rc =3D STATUS_FAILED;
> >>>> +    unsigned index;
> >>>> +    uint64_t record_identifier;
> >>>> +    uint8_t *record;
> >>>> +    uint8_t *ptr =3D NULL;
> >>>> +    bool record_found =3D false;
> >>>> +
> >>>> +    /* Check record boundary wihin exchange buffer */ =20
> >>> ditto, typo =20
> >> done
> >> =20
> >>>     =20
> >>>> +    if (s->record_offset >=3D (ERST_RECORD_SIZE - UEFI_CPER_RECORD_=
MIN_SIZE)) {
> >>>> +        return STATUS_FAILED;
> >>>> +    } =20
> > see (1) =20
> yep
>=20
> >  =20
> >>>> +
> >>>> +    /* Extract record identifier */
> >>>> +    record =3D ((uint8_t *)memory_region_get_ram_ptr(s->exchange_mr=
)
> >>>> +        + s->record_offset);
> >>>> +    record_identifier =3D THE_UEFI_CPER_RECORD_ID(record); =20
> >>> potentially unaligned access to int, should use memcpy() =20
> >> done
> >> =20
> >>>     =20
> >>>> +
> >>>> +    /* Check for valid record identifier */
> >>>> +    if (!ERST_IS_VALID_RECORD_ID(record_identifier)) {
> >>>> +        return STATUS_FAILED;
> >>>> +    }
> >>>> +
> >>>> +    index =3D lookup_erst_record(s, record_identifier);
> >>>> +    if (index) {
> >>>> +        /* Record found, overwrite existing record */
> >>>> +        ptr =3D get_nvram_ptr_by_index(s, index);
> >>>> +        record_found =3D true;
> >>>> +    } else {
> >>>> +        /* Record not found, not an overwrite, allocate for write *=
/
> >>>> +        index =3D lookup_erst_record(s, ERST_UNSPECIFIED_RECORD_ID)=
;
> >>>> +        if (index) {
> >>>> +            ptr =3D get_nvram_ptr_by_index(s, index);
> >>>> +        } else {
> >>>> +            rc =3D STATUS_NOT_ENOUGH_SPACE;
> >>>> +        }
> >>>> +    }
> >>>> +    if (ptr) {
> >>>> +        memcpy(ptr, record, ERST_RECORD_SIZE - s->record_offset); =
=20
> >=20
> > This copies the remainder of exchange buffer, including 'leftovers' fro=
m
> > previous operations.
> > Is there a reason why are you not verifying actual 'record' size in buf=
fer
> > and if it fits within target 'ptr' copy just useful payload from buffer=
? =20
>=20
> So I think this question might be getting at a fundamental difference (an=
d thus the questions/points=20
> you are raising). The UEFI CPER record has a member field 'record_length'=
:
>=20
> "Indicates the size of the actual error record, including the size of the=
 record header, all section=20
> descriptors, and section bodies. The size may include extra buffer space =
to allow for the dynamic=20
> addition of error sections descriptors bodies."
>=20
> Thus far, in this implementation, I have *avoided* using 'record_length' =
out of the record as simply=20
> deeming it as untrustworthy and a possible attack vector. Instead, I've b=
een using=20
> (ERST_RECORD_SIZE-s->record_offset) as the length of the record to copy.
>=20
> I could use 'record_length', and validate it prior to trusting it. Valida=
tion here would simply be=20
> ensuring it is <=3D ERST_RECORD_SIZE? I think this is what you are sugges=
ting, correct?

it should be verified and be less than memcpy target explicitly (i.e. use e=
xchange_mr size or slot size)
that should decouple exchange buffer size from record size.
This way if in the future exchange buffer is increased, one won't have to r=
ewrite
whole impl.

>=20
> >  =20
> >>>> +        if (0 !=3D s->record_offset) {
> >>>> +            memset(&ptr[ERST_RECORD_SIZE - s->record_offset],
> >>>> +                0xFF, s->record_offset);
> >>>> +        } =20
> >>> you've lost me here, care to explain what's going on here? =20
> >> If the record_offset is not 0, then there can be bytes following the r=
ecord within the slot that
> >> were not written. This simply sets them to 0xFF (so bytes from a previ=
ously written record that
> >> happened to occupy this slot do not "bleed" through).
> >> I've left a comment in v7. =20
> >=20
> > well, 'bleed' happens because 'read_erst_record' copies whole slot
> > instead of the actual record size.
> >=20
> > And that would work, only while exchange buffer size and record size
> > are equal, and fall apart silently as soon as that is not true,
> > leading to potential exploits.
> >=20
> > it might be more robust if it written like this:
> >     if_record_is_complete (i.e. record in buffer is not truncated)
> >         if_actual_record_size_fits_in_slot
> >             memcpy(slot, record, actual_record_size)
> >             memset(slot+actual_record_size, 0xff, slot_size - actual_re=
cord_size);
> >     otherwise error out =20
>=20
> See question on 'record_length' above.
>=20
> >    =20
> >>>> +        if (!record_found) {
> >>>> +            s->header->record_count +=3D 1; /* writing new record *=
/
> >>>> +        }
> >>>> +        set_erst_map_by_index(s, index, record_identifier);
> >>>> +        rc =3D STATUS_SUCCESS;
> >>>> +    }
> >>>> +
> >>>> +    return rc;
> >>>> +}
> >>>> +
> >>>> +/* ACPI 4.0: 17.4.2.2 Operations - Reading "During boot..." */
> >>>> +static unsigned next_erst_record(ERSTDeviceState *s,
> >>>> +    uint64_t *record_identifier) =20
> >>> s/record_identifier/found.../ =20
> >> done
> >> =20
> >>>     =20
> >>>> +{
> >>>> +    unsigned rc =3D STATUS_RECORD_NOT_FOUND;
> >>>> +    unsigned index =3D s->next_record_index;
> >>>> +
> >>>> +    *record_identifier =3D ERST_EMPTY_END_RECORD_ID;
> >>>> +
> >>>> +    if (s->header->record_count) {
> >>>> +        for (; index < s->last_record_index; ++index) {
> >>>> +            uint64_t map_record_identifier; =20
> >>> and then s/map_record_identifier/record_identifier/ =20
> >> done
> >> =20
> >>>
> >>> the same applies to other occurrences within patch
> >>> (map_record_identifier is a bit confusing) or drop it
> >>> and use s->header->map[index] directly =20
> >> done
> >> =20
> >>>     =20
> >>>> +            map_record_identifier =3D s->header->map[index];
> >>>> +            if (map_record_identifier !=3D ERST_UNSPECIFIED_RECORD_=
ID) {
> >>>> +                    /* where to start next time */
> >>>> +                    s->next_record_index =3D index + 1;
> >>>> +                    *record_identifier =3D map_record_identifier;
> >>>> +                    rc =3D STATUS_SUCCESS;
> >>>> +                    break;
> >>>> +            }
> >>>> +        }
> >>>> +    }
> >>>> +    if (rc !=3D STATUS_SUCCESS) {
> >>>> +        if (s->next_record_index =3D=3D s->first_record_index) {
> >>>> +            /*
> >>>> +             * next_record_identifier is unchanged, no records foun=
d
> >>>> +             * and *record_identifier contains EMPTY_END id
> >>>> +             */
> >>>> +            rc =3D STATUS_RECORD_STORE_EMPTY;
> >>>> +        }
> >>>> +        /* at end/scan complete, reset */
> >>>> +        s->next_record_index =3D s->first_record_index;
> >>>> +    } =20
> >>>
> >>> Table 17-16, says return existing error or ERST_EMPTY_END_RECORD_ID
> >>> but nothing about op returning a error, so I'd assume status
> >>> should always be STATUS_SUCCESS for GET_RECORD_IDENTIFIER. =20
> >> done
> >> =20
> >>>
> >>> Advancing to the next record is part of record READ op and
> >>> not the part of GET_RECORD_IDENTIFIER as it's done here. =20
> >> well...
> >> =20
> >>>     "The steps performed by the platform to carry out ...
> >>>        2. ..
> >>>           c. If the specified error record does not exist,
> >>>              ... update the status register=E2=80=99s Identifier fiel=
d with the identifier of the
> >>> =E2=80=98first=E2=80=99 error record
> >>>        4. Record the Identifier of the =E2=80=98next=E2=80=99 valid e=
rror record ...
> >>>     " =20
> >>
> >> I used ACPI spec v6 and I was asked to locate the first occurrence of =
ERST in the spec, which was
> >> v4. So the above spec quotes are accurate, however, spec v6 deviates i=
n an important way from the
> >> above, which reads:
> >>
> >>     "c. If the status is Record Not Found (0x05), indicating that the =
specified error record does not
> >> exist, OSPM retrieves a valid identifier by a GET_RECORD_IDENTIFIER ac=
tion. The platform will return
> >> a valid record identifier." =20
> >=20
> > that's quote from OSPM behavior,
> >=20
> > the platform part still looks the same to me (in 4.0/5.0/6.0/6.3) (they=
 split 2.c on 2.c and 2.d)
> > but the meaning is the same. =20
>=20
> So I now see that the description of the READ operation actually has two =
sections; the first starts=20
> with "during boot" and another talking about a straight up read operation=
. I had been focusing on=20
> the "on boot" reading, but alas I do need to accomodate better the plain =
read, as you point out.

if it can work as spec say, we'd better to follow it.
If it doesn't actually work, we can code whatever works +
sufficient documentation/proof to justify that.

> >=20
> >    =20
> >> So GET_RECORD_IDENTIFIER is essentially a factory that pumps out recor=
d identifiers for records
> >> stored. I kind of think of it as the old DOS 'find_first/find_next'. A=
nd yes v4 of the spec states
> >> that the READ operation should initiate the first record_identifer. Ho=
wever v6 clearly states this
> >> is now the responsibility of OSPM, not the READ op.
> >>
> >> I am thinking that the best way to handle this contradiction is to cha=
nge the ACPI spec citation
> >> from v4 to v5, as the wording in v5 matches what I cite from v6, and i=
mplemented. Furthermore, this
> >> approach of OSPM obtaining the next valid record_id via GET_RECORD_IDE=
NTIFIER is consistent with =20
> >  =20
> >> what I observed in BIOS and with how Linux is coded. =20
> > pointer[s] to source[s] please? =20
>=20
> Fwiw, Linux converts all the entries in ERST into pstore entries upon boo=
t. Any subsequent "read" of=20
> the pstore entry does not touch ERST again; instead it reads from the in-=
kernel pstore contents.
>=20
> The driver in Linux is drivers/acpi/apei/erst.c; but note that it conform=
s to the pstore set of=20
> callbacks.
>=20
> >=20
> >=20
> > Well, spec can be wrong too (not the 1st time) but we need to be sure
> > what is broken and doesn't work as it's supposed to and document it
> > properly, before deviating from the spec. =20
>=20
> I see now specs appear to be the same. I need to accomodate the non "on b=
oot" path.
>=20
> >=20
> >=20
> >  =20
> >> Thoughts?
> >> =20
> >>>
> >>>     =20
> >>>> +
> >>>> +    return rc;
> >>>> +}
> >>>> +
> >>>> +/******************************************************************=
*/
> >>>> +
> >>>> +static uint64_t erst_rd_reg64(hwaddr addr,
> >>>> +    uint64_t reg, unsigned size)
> >>>> +{
> >>>> +    uint64_t rdval;
> >>>> +    uint64_t mask;
> >>>> +    unsigned shift;
> >>>> +
> >>>> +    if (size =3D=3D sizeof(uint64_t)) {
> >>>> +        /* 64b access */
> >>>> +        mask =3D 0xFFFFFFFFFFFFFFFFUL;
> >>>> +        shift =3D 0;
> >>>> +    } else {
> >>>> +        /* 32b access */
> >>>> +        mask =3D 0x00000000FFFFFFFFUL;
> >>>> +        shift =3D ((addr & 0x4) =3D=3D 0x4) ? 32 : 0;
> >>>> +    }
> >>>> +
> >>>> +    rdval =3D reg;
> >>>> +    rdval >>=3D shift;
> >>>> +    rdval &=3D mask;
> >>>> +
> >>>> +    return rdval;
> >>>> +}
> >>>> +
> >>>> +static uint64_t erst_wr_reg64(hwaddr addr,
> >>>> +    uint64_t reg, uint64_t val, unsigned size)
> >>>> +{
> >>>> +    uint64_t wrval;
> >>>> +    uint64_t mask;
> >>>> +    unsigned shift;
> >>>> +    if (size =3D=3D sizeof(uint64_t)) {
> >>>> +        /* 64b access */
> >>>> +        mask =3D 0xFFFFFFFFFFFFFFFFUL;
> >>>> +        shift =3D 0;
> >>>> +    } else {
> >>>> +        /* 32b access */
> >>>> +        mask =3D 0x00000000FFFFFFFFUL;
> >>>> +        shift =3D ((addr & 0x4) =3D=3D 0x4) ? 32 : 0;
> >>>> +    }
> >>>> +
> >>>> +    val &=3D mask;
> >>>> +    val <<=3D shift;
> >>>> +    mask <<=3D shift;
> >>>> +    wrval =3D reg;
> >>>> +    wrval &=3D ~mask;
> >>>> +    wrval |=3D val;
> >>>> +
> >>>> +    return wrval;
> >>>> +}
> >>>> +
> >>>> +static void erst_reg_write(void *opaque, hwaddr addr,
> >>>> +    uint64_t val, unsigned size)
> >>>> +{
> >>>> +    ERSTDeviceState *s =3D (ERSTDeviceState *)opaque;
> >>>> +
> >>>> +    /*
> >>>> +     * NOTE: All actions/operations/side effects happen on the WRIT=
E,
> >>>> +     * by design. The READs simply return the reg_value contents. =
=20
> >>>
> >>> point to spec, pls. =20
> >> This was an implementation design choice, so no spec reference applica=
ble, I left a comment.
> >>
> >> =20
> >>>     =20
> >>>> +     */
> >>>> +    trace_acpi_erst_reg_write(addr, val, size);
> >>>> +
> >>>> +    switch (addr) {
> >>>> +    case ERST_VALUE_OFFSET + 0:
> >>>> +    case ERST_VALUE_OFFSET + 4:
> >>>> +        s->reg_value =3D erst_wr_reg64(addr, s->reg_value, val, siz=
e);
> >>>> +        break;
> >>>> +    case ERST_ACTION_OFFSET + 0: =20
> >>>     =20
> >>>> +/*  case ERST_ACTION_OFFSET+4: as coded, not really a 64b register =
*/ =20
> >>>
> >>> what does this mean? =20
> >> In short, all values written to this register are just the ACTION ops,=
 so there wasn't a need to
> >> implement this as a 64-bit register, especially since Linux seems to i=
ssue two 32-bit accesses for
> >> 64-bit; in this case the upper access is utterly useless.
> >> I placed a comment in code. =20
> > comment as it's, above is not helpful,
> > so it would be better to have a comment that explains reasoning a bit b=
etter.
> > like:
> >     supported/impl ACPTION ops are 32 only, so ... =20
> ok
>=20
> >  =20
> >>>> +        switch (val) {
> >>>> +        case ACTION_BEGIN_WRITE_OPERATION:
> >>>> +        case ACTION_BEGIN_READ_OPERATION:
> >>>> +        case ACTION_BEGIN_CLEAR_OPERATION:
> >>>> +        case ACTION_BEGIN_DUMMY_WRITE_OPERATION:
> >>>> +        case ACTION_END_OPERATION:
> >>>> +            s->operation =3D val;
> >>>> +            break;
> >>>> +        case ACTION_SET_RECORD_OFFSET:
> >>>> +            s->record_offset =3D s->reg_value;
> >>>> +            break;
> >>>> +        case ACTION_EXECUTE_OPERATION:
> >>>> +            if ((uint8_t)s->reg_value =3D=3D ERST_EXECUTE_OPERATION=
_MAGIC) {
> >>>> +                s->busy_status =3D 1;
> >>>> +                switch (s->operation) {
> >>>> +                case ACTION_BEGIN_WRITE_OPERATION:
> >>>> +                    s->command_status =3D write_erst_record(s);
> >>>> +                    break;
> >>>> +                case ACTION_BEGIN_READ_OPERATION:
> >>>> +                    s->command_status =3D read_erst_record(s);
> >>>> +                    break;
> >>>> +                case ACTION_BEGIN_CLEAR_OPERATION:
> >>>> +                    s->command_status =3D clear_erst_record(s);
> >>>> +                    break;
> >>>> +                case ACTION_BEGIN_DUMMY_WRITE_OPERATION:
> >>>> +                    s->command_status =3D STATUS_SUCCESS;
> >>>> +                    break;
> >>>> +                case ACTION_END_OPERATION:
> >>>> +                    s->command_status =3D STATUS_SUCCESS;
> >>>> +                    break;
> >>>> +                default:
> >>>> +                    s->command_status =3D STATUS_FAILED;
> >>>> +                    break;
> >>>> +                }
> >>>> +                s->record_identifier =3D ERST_UNSPECIFIED_RECORD_ID=
; =20
> >>>                      shouldn't happen in case of Read op =20
> >> correct, removed as not needed at all now.
> >> =20
> >>>
> >>> "
> >>> 17.4.2.2
> >>> 4. Record the Identifier of the =E2=80=98next=E2=80=99 valid error re=
cord that resides on the persistent store. This
> >>> allows OSPM to retrieve a valid record identifier by executing a GET_=
RECORD_IDENTIFIER
> >>> operation.
> >>> "
> >>>     =20
> >>>> +                s->busy_status =3D 0;
> >>>> +            }
> >>>> +            break;
> >>>> +        case ACTION_CHECK_BUSY_STATUS:
> >>>> +            s->reg_value =3D s->busy_status;
> >>>> +            break;
> >>>> +        case ACTION_GET_COMMAND_STATUS:
> >>>> +            s->reg_value =3D s->command_status;
> >>>> +            break;
> >>>> +        case ACTION_GET_RECORD_IDENTIFIER:
> >>>> +            s->command_status =3D next_erst_record(s, &s->reg_value=
);
> >>>> +            break;
> >>>> +        case ACTION_SET_RECORD_IDENTIFIER:
> >>>> +            s->record_identifier =3D s->reg_value;
> >>>> +            break;
> >>>> +        case ACTION_GET_RECORD_COUNT:
> >>>> +            s->reg_value =3D s->header->record_count;
> >>>> +            break;
> >>>> +        case ACTION_GET_ERROR_LOG_ADDRESS_RANGE:
> >>>> +            s->reg_value =3D (hwaddr)pci_get_bar_addr(PCI_DEVICE(s)=
, 1);
> >>>> +            break;
> >>>> +        case ACTION_GET_ERROR_LOG_ADDRESS_LENGTH:
> >>>> +            s->reg_value =3D ERST_RECORD_SIZE;
> >>>> +            break;
> >>>> +        case ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES:
> >>>> +            s->reg_value =3D 0x0; /* intentional, not NVRAM mode */
> >>>> +            break;
> >>>> +        case ACTION_GET_EXECUTE_OPERATION_TIMINGS:
> >>>> +            s->reg_value =3D
> >>>> +                (100ULL << 32) | /* 100us max time */
> >>>> +                (10ULL  <<  0) ; /*  10us min time */
> >>>> +            break;
> >>>> +        default:
> >>>> +            /* Unknown action/command, NOP */
> >>>> +            break;
> >>>> +        }
> >>>> +        break;
> >>>> +    default:
> >>>> +        /* This should not happen, but if it does, NOP */
> >>>> +        break;
> >>>> +    }
> >>>> +}
> >>>> +
> >>>> +static uint64_t erst_reg_read(void *opaque, hwaddr addr,
> >>>> +                                unsigned size)
> >>>> +{
> >>>> +    ERSTDeviceState *s =3D (ERSTDeviceState *)opaque;
> >>>> +    uint64_t val =3D 0;
> >>>> +
> >>>> +    switch (addr) {
> >>>> +    case ERST_ACTION_OFFSET + 0:
> >>>> +    case ERST_ACTION_OFFSET + 4:
> >>>> +        val =3D erst_rd_reg64(addr, s->reg_action, size);
> >>>> +        break;
> >>>> +    case ERST_VALUE_OFFSET + 0:
> >>>> +    case ERST_VALUE_OFFSET + 4:
> >>>> +        val =3D erst_rd_reg64(addr, s->reg_value, size);
> >>>> +        break;
> >>>> +    default:
> >>>> +        break;
> >>>> +    }
> >>>> +    trace_acpi_erst_reg_read(addr, val, size);
> >>>> +    return val;
> >>>> +}
> >>>> +
> >>>> +static const MemoryRegionOps erst_reg_ops =3D {
> >>>> +    .read =3D erst_reg_read,
> >>>> +    .write =3D erst_reg_write,
> >>>> +    .endianness =3D DEVICE_NATIVE_ENDIAN,
> >>>> +};
> >>>> +
> >>>> +/******************************************************************=
*/
> >>>> +/******************************************************************=
*/
> >>>> +static int erst_post_load(void *opaque, int version_id)
> >>>> +{
> >>>> +    ERSTDeviceState *s =3D opaque;
> >>>> +
> >>>> +    /* Recompute pointer to header */
> >>>> +    s->header =3D (erst_storage_header_t *)get_nvram_ptr_by_index(s=
, 0);
> >>>> +    trace_acpi_erst_post_load(s->header);
> >>>> +
> >>>> +    return 0;
> >>>> +}
> >>>> +
> >>>> +static const VMStateDescription erst_vmstate  =3D {
> >>>> +    .name =3D "acpi-erst",
> >>>> +    .version_id =3D 1,
> >>>> +    .minimum_version_id =3D 1,
> >>>> +    .post_load =3D erst_post_load,
> >>>> +    .fields =3D (VMStateField[]) {
> >>>> +        VMSTATE_UINT32(storage_size, ERSTDeviceState), =20
> >>>    1) =20
> >>>> +        VMSTATE_UINT8(operation, ERSTDeviceState),
> >>>> +        VMSTATE_UINT8(busy_status, ERSTDeviceState),
> >>>> +        VMSTATE_UINT8(command_status, ERSTDeviceState),
> >>>> +        VMSTATE_UINT32(record_offset, ERSTDeviceState),
> >>>> +        VMSTATE_UINT64(reg_action, ERSTDeviceState),
> >>>> +        VMSTATE_UINT64(reg_value, ERSTDeviceState),
> >>>> +        VMSTATE_UINT64(record_identifier, ERSTDeviceState),
> >>>> +        VMSTATE_UINT32(next_record_index, ERSTDeviceState), =20
> >>>     =20
> >>>> +        VMSTATE_UINT32(first_record_index, ERSTDeviceState),
> >>>> +        VMSTATE_UINT32(last_record_index, ERSTDeviceState), =20
> >>>    2) =20
> >>>> +        VMSTATE_END_OF_LIST()
> >>>> +    }
> >>>> +}; =20
> >>>
> >>>    1 and 2 aren't runtime state, so why they are in migration stream?=
 =20
> >> done; removed storage_size, first_record_index and last_record_index f=
rom the migration stream.
> >>
> >> =20
> >>>
> >>> I'd imagine size could be used to check that backend on target is of =
the same size
> >>> to avoid buffer overrun if target side has smaller backend, and fail =
migration if
> >>> it's not the same. But it aren't used this way here. =20
> >> I decided to not do this check as that memory object is migrated autom=
atically, so I dont think my
> >> check adds any value.
> >> =20
> >>>
> >>> the rest could be calculated at realize time. =20
> >> and in fact they are.
> >> =20
> >>>     =20
> >>>> +
> >>>> +static void erst_realizefn(PCIDevice *pci_dev, Error **errp)
> >>>> +{
> >>>> +    ERSTDeviceState *s =3D ACPIERST(pci_dev);
> >>>> +
> >>>> +    trace_acpi_erst_realizefn_in();
> >>>> +
> >>>> +    if (!s->hostmem) {
> >>>> +        error_setg(errp, "'" ACPI_ERST_MEMDEV_PROP "' property is n=
ot set");
> >>>> +        return;
> >>>> +    } else if (host_memory_backend_is_mapped(s->hostmem)) {
> >>>> +        error_setg(errp, "can't use already busy memdev: %s",
> >>>> +                   object_get_canonical_path_component(OBJECT(s->ho=
stmem)));
> >>>> +        return;
> >>>> +    }
> >>>> +
> >>>> +    s->hostmem_mr =3D host_memory_backend_get_memory(s->hostmem);
> >>>> +
> >>>> +    /* HostMemoryBackend size will be multiple of PAGE_SIZE */
> >>>> +    s->storage_size =3D object_property_get_int(OBJECT(s->hostmem),=
 "size", errp);
> >>>> +
> >>>> +    /* Check storage_size against ERST_RECORD_SIZE */
> >>>> +    if (((s->storage_size % ERST_RECORD_SIZE) !=3D 0) ||
> >>>> +         (ERST_RECORD_SIZE > s->storage_size)) {
> >>>> +        error_setg(errp, "ACPI ERST requires size be multiple of "
> >>>> +            "record size (%luKiB)", ERST_RECORD_SIZE);
> >>>> +    }
> >>>> +
> >>>> +    /* Initialize backend storage and record_count */
> >>>> +    check_erst_backend_storage(s, errp);
> >>>> +
> >>>> +    /* BAR 0: Programming registers */
> >>>> +    memory_region_init_io(&s->iomem, OBJECT(pci_dev), &erst_reg_ops=
, s,
> >>>> +                          TYPE_ACPI_ERST, ERST_REG_SIZE);
> >>>> +    pci_register_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &s-=
>iomem);
> >>>> +
> >>>> +    /* BAR 1: Exchange buffer memory */ =20
> >>>
> >>>     =20
> >>>> +    /* Create a hostmem object to use as the exchange buffer */
> >>>> +    s->exchange_obj =3D object_new(TYPE_MEMORY_BACKEND_RAM);
> >>>> +    object_property_set_int(s->exchange_obj, "size", ERST_RECORD_SI=
ZE, errp);
> >>>> +    user_creatable_complete(USER_CREATABLE(s->exchange_obj), errp);
> >>>> +    s->exchange =3D MEMORY_BACKEND(s->exchange_obj);
> >>>> +    host_memory_backend_set_mapped(s->exchange, true);
> >>>> +    s->exchange_mr =3D host_memory_backend_get_memory(s->exchange);=
 =20
> >>> replace this block with single memory_region_init_ram() =20
> >> done!
> >> =20
> >>>
> >>>     =20
> >>>> +    memory_region_init_resizeable_ram(s->exchange_mr, OBJECT(pci_de=
v),
> >>>> +        TYPE_ACPI_ERST, ERST_RECORD_SIZE, ERST_RECORD_SIZE, NULL, e=
rrp); =20
> >>> have ho idea why it's necessary, seems just wrong, it basically leaks
> >>> previous memory region and creates a new one. =20
> >> done!
> >> =20
> >>>     =20
> >>>> +    pci_register_bar(pci_dev, 1, PCI_BASE_ADDRESS_SPACE_MEMORY, s->=
exchange_mr); =20
> >>>     =20
> >>>> +    /* Include the exchange buffer in the migration stream */
> >>>> +    vmstate_register_ram_global(s->exchange_mr); =20
> >>> not necessary if memory_region_init_ram() is used directly =20
> >> done!
> >> =20
> >>>     =20
> >>>> +
> >>>> +    /* Include the backend storage in the migration stream */
> >>>> +    vmstate_register_ram_global(s->hostmem_mr);
> >>>> +
> >>>> +    trace_acpi_erst_realizefn_out(s->storage_size);
> >>>> +}
> >>>> +
> >>>> +static void erst_reset(DeviceState *dev)
> >>>> +{
> >>>> +    ERSTDeviceState *s =3D ACPIERST(dev);
> >>>> +
> >>>> +    trace_acpi_erst_reset_in(s->header->record_count);
> >>>> +    s->operation =3D 0;
> >>>> +    s->busy_status =3D 0;
> >>>> +    s->command_status =3D STATUS_SUCCESS;
> >>>> +    s->record_identifier =3D ERST_UNSPECIFIED_RECORD_ID;
> >>>> +    s->record_offset =3D 0;
> >>>> +    s->next_record_index =3D s->first_record_index;
> >>>> +    /* NOTE: first/last_record_index are computed only once */
> >>>> +    trace_acpi_erst_reset_out(s->header->record_count);
> >>>> +}
> >>>> +
> >>>> +static Property erst_properties[] =3D {
> >>>> +    DEFINE_PROP_LINK(ACPI_ERST_MEMDEV_PROP, ERSTDeviceState, hostme=
m,
> >>>> +                     TYPE_MEMORY_BACKEND, HostMemoryBackend *),
> >>>> +    DEFINE_PROP_END_OF_LIST(),
> >>>> +};
> >>>> +
> >>>> +static void erst_class_init(ObjectClass *klass, void *data)
> >>>> +{
> >>>> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> >>>> +    PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
> >>>> +
> >>>> +    trace_acpi_erst_class_init_in();
> >>>> +    k->realize =3D erst_realizefn;
> >>>> +    k->vendor_id =3D PCI_VENDOR_ID_REDHAT;
> >>>> +    k->device_id =3D PCI_DEVICE_ID_REDHAT_ACPI_ERST;
> >>>> +    k->revision =3D 0x00;
> >>>> +    k->class_id =3D PCI_CLASS_OTHERS;
> >>>> +    dc->reset =3D erst_reset;
> >>>> +    dc->vmsd =3D &erst_vmstate;
> >>>> +    dc->user_creatable =3D true; =20
> >>>
> >>> can't be hotplugged, add:
> >>>          dc->hotpluggable =3D false; =20
> >> done
> >> =20
> >>>     =20
> >>>> +    device_class_set_props(dc, erst_properties);
> >>>> +    dc->desc =3D "ACPI Error Record Serialization Table (ERST) devi=
ce";
> >>>> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> >>>> +    trace_acpi_erst_class_init_out();
> >>>> +}
> >>>> +
> >>>> +static const TypeInfo erst_type_info =3D {
> >>>> +    .name          =3D TYPE_ACPI_ERST,
> >>>> +    .parent        =3D TYPE_PCI_DEVICE,
> >>>> +    .class_init    =3D erst_class_init,
> >>>> +    .instance_size =3D sizeof(ERSTDeviceState),
> >>>> +    .interfaces =3D (InterfaceInfo[]) {
> >>>> +        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> >>>> +        { }
> >>>> +    }
> >>>> +};
> >>>> +
> >>>> +static void erst_register_types(void)
> >>>> +{
> >>>> +    type_register_static(&erst_type_info);
> >>>> +}
> >>>> +
> >>>> +type_init(erst_register_types)
> >>>> diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
> >>>> index 29f804d..401d0e5 100644
> >>>> --- a/hw/acpi/meson.build
> >>>> +++ b/hw/acpi/meson.build
> >>>> @@ -5,6 +5,7 @@ acpi_ss.add(files(
> >>>>      'bios-linker-loader.c',
> >>>>      'core.c',
> >>>>      'utils.c',
> >>>> +  'erst.c',
> >>>>    ))
> >>>>    acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu.=
c'))
> >>>>    acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu_=
hotplug.c'))
> >>>> diff --git a/hw/acpi/trace-events b/hw/acpi/trace-events
> >>>> index 974d770..3579768 100644
> >>>> --- a/hw/acpi/trace-events
> >>>> +++ b/hw/acpi/trace-events
> >>>> @@ -55,3 +55,18 @@ piix4_gpe_writeb(uint64_t addr, unsigned width, u=
int64_t val) "addr: 0x%" PRIx64
> >>>>    # tco.c
> >>>>    tco_timer_reload(int ticks, int msec) "ticks=3D%d (%d ms)"
> >>>>    tco_timer_expired(int timeouts_no, bool strap, bool no_reboot) "t=
imeouts_no=3D%d no_reboot=3D%d/%d"
> >>>> +
> >>>> +# erst.c
> >>>> +acpi_erst_reg_write(uint64_t addr, uint64_t val, unsigned size) "ad=
dr: 0x%04" PRIx64 " <=3D=3D 0x%016" PRIx64 " (size: %u)"
> >>>> +acpi_erst_reg_read(uint64_t addr, uint64_t val, unsigned size) " ad=
dr: 0x%04" PRIx64 " =3D=3D> 0x%016" PRIx64 " (size: %u)"
> >>>> +acpi_erst_mem_write(uint64_t addr, uint64_t val, unsigned size) "ad=
dr: 0x%06" PRIx64 " <=3D=3D 0x%016" PRIx64 " (size: %u)"
> >>>> +acpi_erst_mem_read(uint64_t addr, uint64_t val, unsigned size) " ad=
dr: 0x%06" PRIx64 " =3D=3D> 0x%016" PRIx64 " (size: %u)"
> >>>> +acpi_erst_pci_bar_0(uint64_t addr) "BAR0: 0x%016" PRIx64
> >>>> +acpi_erst_pci_bar_1(uint64_t addr) "BAR1: 0x%016" PRIx64
> >>>> +acpi_erst_realizefn_in(void)
> >>>> +acpi_erst_realizefn_out(unsigned size) "total nvram size %u bytes"
> >>>> +acpi_erst_reset_in(unsigned record_count) "record_count %u"
> >>>> +acpi_erst_reset_out(unsigned record_count) "record_count %u"
> >>>> +acpi_erst_post_load(void *header) "header: 0x%p"
> >>>> +acpi_erst_class_init_in(void)
> >>>> +acpi_erst_class_init_out(void) =20
> >>>     =20
> >> =20
> >  =20
>=20


