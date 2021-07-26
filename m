Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 675B23D57BA
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 12:43:55 +0200 (CEST)
Received: from localhost ([::1]:46904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7y5R-0001cH-Jv
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 06:43:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m7y43-0000Bs-Ie
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 06:42:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m7y3w-00026s-T7
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 06:42:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627296139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XPMaZeHuCtU289K2UfiBb8GUduwOyZ4566/wfSql5Fo=;
 b=d2guOjxB88UCyrteSKNXcwg2BoCV9m3X/7bV14iYchJHM4Fkynezij4mKX5yqdqYj/9me6
 HdGwZzY/nODMMsbvADiXBu2Kae7wm3udVF0E+RFdqkFFItjS3J9Zu0PZjNPp+eqQJc3zPX
 mdMOqTV0aDQesNvKJgZvqy60LPPQT8Q=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-fhrh_PMiNWSJVqTTCl5B8A-1; Mon, 26 Jul 2021 06:42:17 -0400
X-MC-Unique: fhrh_PMiNWSJVqTTCl5B8A-1
Received: by mail-wm1-f69.google.com with SMTP id
 132-20020a1c018a0000b029025005348905so1412542wmb.7
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 03:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XPMaZeHuCtU289K2UfiBb8GUduwOyZ4566/wfSql5Fo=;
 b=Jbcy8Pycsq/LihM2zIdIjBGGyePB3ca9cE0iEGZSoFkTbK/bQ+ZwgyXMAegFY7B8RK
 VZl6EHMw/vM4xJaQ8pP5pm6X52e1O/SDt08Py96ToigKJd+5pSanVBXc+/sLFByA0KGL
 Lf7DV7873PVPeNC66kC3a549dsV/UUEOg71G+gatVJ3NyU4maaW8LIHwRAwJ/rwNUqVc
 FP0UT8SUxbe5wj9RjWhZuBKi3tT0554CktTFrMcoK4DgqjlShjUFyAk2qwmGnGD8eAPP
 fuIWUhs3k5f8WeeaW6H1XRM36DGXzM2fIHFd7Q7ESbdkp85CJOCrpjOroXAsqaKvA8JH
 /y7g==
X-Gm-Message-State: AOAM533/s+csdgyHithnk51V6VyrVS4WVq+IrYrc/5W6261AyKPg3XWo
 qMPkV1QEmJd0+WbUKv4xEgUYHb6KQ2OA7i387enodAESUi7PcBJAdgw+J/0cHHgU6+v01q7gPu7
 5wt421CGUXZ63d6s=
X-Received: by 2002:a05:600c:4ec9:: with SMTP id
 g9mr16152082wmq.54.1627296135874; 
 Mon, 26 Jul 2021 03:42:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTZprlDJC4cPuhFZIqMafIu+6rGrMtCwayfOv+nfb3Ac5VJxTIPCP1M8txMAg2PV9NtO9YtQ==
X-Received: by 2002:a05:600c:4ec9:: with SMTP id
 g9mr16152047wmq.54.1627296135338; 
 Mon, 26 Jul 2021 03:42:15 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id d8sm43829016wrv.20.2021.07.26.03.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 03:42:14 -0700 (PDT)
Date: Mon, 26 Jul 2021 12:42:13 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v5 05/10] ACPI ERST: support for ACPI ERST feature
Message-ID: <20210726124213.58b0e557@redhat.com>
In-Reply-To: <0a09250e-4347-0ad6-d95c-0bfd2094b98b@oracle.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
 <1625080041-29010-6-git-send-email-eric.devolder@oracle.com>
 <20210720141704.381734cc@redhat.com>
 <0a09250e-4347-0ad6-d95c-0bfd2094b98b@oracle.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 21 Jul 2021 11:07:40 -0500
Eric DeVolder <eric.devolder@oracle.com> wrote:

> On 7/20/21 7:17 AM, Igor Mammedov wrote:
> > On Wed, 30 Jun 2021 15:07:16 -0400
> > Eric DeVolder <eric.devolder@oracle.com> wrote:
> >   
> >> This change implements the support for the ACPI ERST feature.  
> > Drop this  
> Done
> 
> >   
> >>
> >> This implements a PCI device for ACPI ERST. This implments the  
> > s/implments/implements/  
> Corrected
> 
> >   
> >> non-NVRAM "mode" of operation for ERST.  
> > add here why non-NVRAM "mode" is implemented.  
> How about:
> This implements a PCI device for ACPI ERST. This implments the
> non-NVRAM "mode" of operation for ERST as it is supported by
> Linux and Windows and aligns with ERST support in most BIOS.

modulo typos looks good to me.
pls consider using a spell checker to check commit messages/comments.

> 
> > 
> > Also even if this non-NVRAM implementation, there is still
> > a lot of not necessary data copying (see below) so drop it
> > or justify why it's there.
> >     
> >> This change also includes erst.c in the build of general ACPI support.  
> > Drop this as well  
> Done
> 
> > 
> >   
> >> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> >> ---
> >>   hw/acpi/erst.c      | 704 ++++++++++++++++++++++++++++++++++++++++++++++++++++
> >>   hw/acpi/meson.build |   1 +
> >>   2 files changed, 705 insertions(+)
> >>   create mode 100644 hw/acpi/erst.c
> >>
> >> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
> >> new file mode 100644
> >> index 0000000..6e9bd2e
> >> --- /dev/null
> >> +++ b/hw/acpi/erst.c
> >> @@ -0,0 +1,704 @@
> >> +/*
> >> + * ACPI Error Record Serialization Table, ERST, Implementation
> >> + *
> >> + * Copyright (c) 2021 Oracle and/or its affiliates.
> >> + *
> >> + * ACPI ERST introduced in ACPI 4.0, June 16, 2009.
> >> + * ACPI Platform Error Interfaces : Error Serialization
> >> + *
> >> + * This library is free software; you can redistribute it and/or
> >> + * modify it under the terms of the GNU Lesser General Public
> >> + * License as published by the Free Software Foundation;
> >> + * version 2 of the License.
> >> + *
> >> + * This library is distributed in the hope that it will be useful,
> >> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> >> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> >> + * Lesser General Public License for more details.
> >> + *
> >> + * You should have received a copy of the GNU Lesser General Public
> >> + * License along with this library; if not, see <http://www.gnu.org/licenses/>

consider adding SPDX-License-Identifier to all new files.
 
> >> + */
> >> +
> >> +#include <sys/types.h>
> >> +#include <sys/stat.h>
> >> +#include <unistd.h>
> >> +
> >> +#include "qemu/osdep.h"
> >> +#include "qapi/error.h"
> >> +#include "hw/qdev-core.h"
> >> +#include "exec/memory.h"
> >> +#include "qom/object.h"
> >> +#include "hw/pci/pci.h"
> >> +#include "qom/object_interfaces.h"
> >> +#include "qemu/error-report.h"
> >> +#include "migration/vmstate.h"
> >> +#include "hw/qdev-properties.h"
> >> +#include "hw/acpi/acpi.h"
> >> +#include "hw/acpi/acpi-defs.h"
> >> +#include "hw/acpi/aml-build.h"
> >> +#include "hw/acpi/bios-linker-loader.h"
> >> +#include "exec/address-spaces.h"
> >> +#include "sysemu/hostmem.h"
> >> +#include "hw/acpi/erst.h"
> >> +#include "trace.h"
> >> +
> >> +/* UEFI 2.1: Append N Common Platform Error Record */
> >> +#define UEFI_CPER_RECORD_MIN_SIZE 128U
> >> +#define UEFI_CPER_RECORD_LENGTH_OFFSET 20U
> >> +#define UEFI_CPER_RECORD_ID_OFFSET 96U
> >> +#define IS_UEFI_CPER_RECORD(ptr) \
> >> +    (((ptr)[0] == 'C') && \
> >> +     ((ptr)[1] == 'P') && \
> >> +     ((ptr)[2] == 'E') && \
> >> +     ((ptr)[3] == 'R'))
> >> +#define THE_UEFI_CPER_RECORD_ID(ptr) \
> >> +    (*(uint64_t *)(&(ptr)[UEFI_CPER_RECORD_ID_OFFSET]))
> >> +
> >> +/*
> >> + * This implementation is an ACTION (cmd) and VALUE (data)
> >> + * interface consisting of just two 64-bit registers.
> >> + */
> >> +#define ERST_REG_SIZE (2UL * sizeof(uint64_t))  
> >   
> >> +#define ERST_CSR_ACTION (0UL << 3) /* action (cmd) */
> >> +#define ERST_CSR_VALUE  (1UL << 3) /* argument/value (data) */  
> > what's meaning of CRS?  
> CSR = control status register
> > Looking at patch both should be called ERST_[ACTION|VALUE]_OFFSET  
> Done
> > pls use explicit offset values instead of shifting bit.  
> Done
> > 
> >   
> >> +/*
> >> + * ERST_RECORD_SIZE is the buffer size for exchanging ERST
> >> + * record contents. Thus, it defines the maximum record size.
> >> + * As this is mapped through a PCI BAR, it must be a power of
> >> + * two, and should be at least PAGE_SIZE.
> >> + * Records are stored in the backing file in a simple fashion.
> >> + * The backing file is essentially divided into fixed size
> >> + * "slots", ERST_RECORD_SIZE in length, with each "slot"
> >> + * storing a single record. No attempt at optimizing storage
> >> + * through compression, compaction, etc is attempted.
> >> + * NOTE that any change to this value will make any pre-
> >> + * existing backing files, not of the same ERST_RECORD_SIZE,
> >> + * unusable to the guest.
> >> + */
> >> +/* 8KiB records, not too small, not too big */
> >> +#define ERST_RECORD_SIZE (2UL * 4096)
> >> +
> >> +#define ERST_INVALID_RECORD_ID (~0UL)
> >> +#define ERST_EXECUTE_OPERATION_MAGIC 0x9CUL
> >> +
> >> +/*
> >> + * Object cast macro
> >> + */
> >> +#define ACPIERST(obj) \
> >> +    OBJECT_CHECK(ERSTDeviceState, (obj), TYPE_ACPI_ERST)
> >> +
> >> +/*
> >> + * Main ERST device state structure
> >> + */
> >> +typedef struct {
> >> +    PCIDevice parent_obj;
> >> +
> >> +    HostMemoryBackend *hostmem;
> >> +    MemoryRegion *hostmem_mr;
> >> +
> >> +    MemoryRegion iomem; /* programming registes */
> >> +    MemoryRegion nvmem; /* exchange buffer */
> >> +    uint32_t prop_size;  
> > s/^^^/storage_size/  
> Corrected
> 
> >   
> >> +    hwaddr bar0; /* programming registers */
> >> +    hwaddr bar1; /* exchange buffer */  
> > why do you need to keep this addresses around?
> > Suggest to drop these fields and use local variables or pci_get_bar_addr() at call site.  
> Corrected
> 
> >   
> >> +
> >> +    uint8_t operation;
> >> +    uint8_t busy_status;
> >> +    uint8_t command_status;
> >> +    uint32_t record_offset;
> >> +    uint32_t record_count;
> >> +    uint64_t reg_action;
> >> +    uint64_t reg_value;
> >> +    uint64_t record_identifier;
> >> +
> >> +    unsigned next_record_index;  
> > 
> >   
> >> +    uint8_t record[ERST_RECORD_SIZE]; /* read/written directly by guest */
> >> +    uint8_t tmp_record[ERST_RECORD_SIZE]; /* intermediate manipulation buffer */  
> > drop these see [**] below  
> Corrected
> 
> >   
> >> +
> >> +} ERSTDeviceState;
> >> +
> >> +/*******************************************************************/
> >> +/*******************************************************************/
> >> +
> >> +static unsigned copy_from_nvram_by_index(ERSTDeviceState *s, unsigned index)
> >> +{
> >> +    /* Read an nvram entry into tmp_record */
> >> +    unsigned rc = ACPI_ERST_STATUS_FAILED;
> >> +    off_t offset = (index * ERST_RECORD_SIZE);
> >> +
> >> +    if ((offset + ERST_RECORD_SIZE) <= s->prop_size) {
> >> +        if (s->hostmem_mr) {
> >> +            uint8_t *p = (uint8_t *)memory_region_get_ram_ptr(s->hostmem_mr);
> >> +            memcpy(s->tmp_record, p + offset, ERST_RECORD_SIZE);
> >> +            rc = ACPI_ERST_STATUS_SUCCESS;
> >> +        }
> >> +    }
> >> +    return rc;
> >> +}
> >> +
> >> +static unsigned copy_to_nvram_by_index(ERSTDeviceState *s, unsigned index)
> >> +{
> >> +    /* Write entry in tmp_record into nvram, and backing file */
> >> +    unsigned rc = ACPI_ERST_STATUS_FAILED;
> >> +    off_t offset = (index * ERST_RECORD_SIZE);
> >> +
> >> +    if ((offset + ERST_RECORD_SIZE) <= s->prop_size) {
> >> +        if (s->hostmem_mr) {
> >> +            uint8_t *p = (uint8_t *)memory_region_get_ram_ptr(s->hostmem_mr);
> >> +            memcpy(p + offset, s->tmp_record, ERST_RECORD_SIZE);
> >> +            rc = ACPI_ERST_STATUS_SUCCESS;
> >> +        }
> >> +    }
> >> +    return rc;
> >> +}
> >> +
> >> +static int lookup_erst_record_by_identifier(ERSTDeviceState *s,
> >> +    uint64_t record_identifier, bool *record_found, bool alloc_for_write)
> >> +{
> >> +    int rc = -1;
> >> +    int empty_index = -1;
> >> +    int index = 0;
> >> +    unsigned rrc;
> >> +
> >> +    *record_found = 0;
> >> +
> >> +    do {
> >> +        rrc = copy_from_nvram_by_index(s, (unsigned)index);  
> > 
> > you have direct access to backend memory so there is no need
> > whatsoever to copy records from it to an intermediate buffer
> > everywhere. Almost all operations with records can be done
> > in place modulo EXECUTE_OPERATION action in BEGIN_[READ|WRITE]
> > context, where record is moved between backend and guest buffer.
> > 
> > So please eliminate all not necessary copying.
> > (for fun, time operations and set backend size to some huge
> > value to see how expensive this code is)  
> 
> I've corrected this. In our previous exchangs, I thought the reference
> to copying was about trying to directly have guest write/read the appropriate
> record in the backend storage. After reading this comment I realized that
> yes I was doing alot of copying (an artifact of the transition away from
> direct file i/o to MemoryBackend). So good find, and I've eliminated the
> intermediate copying.
> 
> >   
> >> +        if (rrc == ACPI_ERST_STATUS_SUCCESS) {
> >> +            uint64_t this_identifier;
> >> +            this_identifier = THE_UEFI_CPER_RECORD_ID(s->tmp_record);
> >> +            if (IS_UEFI_CPER_RECORD(s->tmp_record) &&
> >> +                (this_identifier == record_identifier)) {
> >> +                rc = index;
> >> +                *record_found = 1;
> >> +                break;
> >> +            }
> >> +            if ((this_identifier == ERST_INVALID_RECORD_ID) &&
> >> +                (empty_index < 0)) {
> >> +                empty_index = index; /* first available for write */
> >> +            }
> >> +        }
> >> +        ++index;
> >> +    } while (rrc == ACPI_ERST_STATUS_SUCCESS);
> >> +
> >> +    /* Record not found, allocate for writing */
> >> +    if ((rc < 0) && alloc_for_write) {
> >> +        rc = empty_index;
> >> +    }
> >> +
> >> +    return rc;
> >> +}
> >> +
> >> +static unsigned clear_erst_record(ERSTDeviceState *s)
> >> +{
> >> +    unsigned rc = ACPI_ERST_STATUS_RECORD_NOT_FOUND;
> >> +    bool record_found;
> >> +    int index;
> >> +
> >> +    index = lookup_erst_record_by_identifier(s,
> >> +        s->record_identifier, &record_found, 0);
> >> +    if (record_found) {
> >> +        memset(s->tmp_record, 0xFF, ERST_RECORD_SIZE);
> >> +        rc = copy_to_nvram_by_index(s, (unsigned)index);
> >> +        if (rc == ACPI_ERST_STATUS_SUCCESS) {
> >> +            s->record_count -= 1;
> >> +        }
> >> +    }
> >> +
> >> +    return rc;
> >> +}
> >> +
> >> +static unsigned write_erst_record(ERSTDeviceState *s)
> >> +{
> >> +    unsigned rc = ACPI_ERST_STATUS_FAILED;
> >> +
> >> +    if (s->record_offset < (ERST_RECORD_SIZE - UEFI_CPER_RECORD_MIN_SIZE)) {
> >> +        uint64_t record_identifier;
> >> +        uint8_t *record = &s->record[s->record_offset];
> >> +        bool record_found;
> >> +        int index;
> >> +
> >> +        record_identifier = (s->record_identifier == ERST_INVALID_RECORD_ID)
> >> +            ? THE_UEFI_CPER_RECORD_ID(record) : s->record_identifier;
> >> +
> >> +        index = lookup_erst_record_by_identifier(s,
> >> +            record_identifier, &record_found, 1);
> >> +        if (index < 0) {
> >> +            rc = ACPI_ERST_STATUS_NOT_ENOUGH_SPACE;
> >> +        } else {
> >> +            if (0 != s->record_offset) {
> >> +                memset(&s->tmp_record[ERST_RECORD_SIZE - s->record_offset],
> >> +                    0xFF, s->record_offset);
> >> +            }
> >> +            memcpy(s->tmp_record, record, ERST_RECORD_SIZE - s->record_offset);
> >> +            rc = copy_to_nvram_by_index(s, (unsigned)index);
> >> +            if (rc == ACPI_ERST_STATUS_SUCCESS) {
> >> +                if (!record_found) { /* not overwriting existing record */
> >> +                    s->record_count += 1; /* writing new record */
> >> +                }
> >> +            }
> >> +        }
> >> +    }
> >> +
> >> +    return rc;
> >> +}
> >> +
> >> +static unsigned next_erst_record(ERSTDeviceState *s,
> >> +    uint64_t *record_identifier)
> >> +{
> >> +    unsigned rc = ACPI_ERST_STATUS_RECORD_NOT_FOUND;
> >> +    unsigned index;
> >> +    unsigned rrc;
> >> +
> >> +    *record_identifier = ERST_INVALID_RECORD_ID;
> >> +
> >> +    index = s->next_record_index;
> >> +    do {
> >> +        rrc = copy_from_nvram_by_index(s, (unsigned)index);
> >> +        if (rrc == ACPI_ERST_STATUS_SUCCESS) {
> >> +            if (IS_UEFI_CPER_RECORD(s->tmp_record)) {
> >> +                s->next_record_index = index + 1; /* where to start next time */
> >> +                *record_identifier = THE_UEFI_CPER_RECORD_ID(s->tmp_record);
> >> +                rc = ACPI_ERST_STATUS_SUCCESS;
> >> +                break;
> >> +            }
> >> +            ++index;
> >> +        } else {
> >> +            if (s->next_record_index == 0) {
> >> +                rc = ACPI_ERST_STATUS_RECORD_STORE_EMPTY;
> >> +            }
> >> +            s->next_record_index = 0; /* at end, reset */
> >> +        }
> >> +    } while (rrc == ACPI_ERST_STATUS_SUCCESS);
> >> +
> >> +    return rc;
> >> +}
> >> +
> >> +static unsigned read_erst_record(ERSTDeviceState *s)
> >> +{
> >> +    unsigned rc = ACPI_ERST_STATUS_RECORD_NOT_FOUND;
> >> +    bool record_found;
> >> +    int index;
> >> +
> >> +    index = lookup_erst_record_by_identifier(s,
> >> +        s->record_identifier, &record_found, 0);
> >> +    if (record_found) {
> >> +        rc = copy_from_nvram_by_index(s, (unsigned)index);
> >> +        if (rc == ACPI_ERST_STATUS_SUCCESS) {
> >> +            if (s->record_offset < ERST_RECORD_SIZE) {
> >> +                memcpy(&s->record[s->record_offset], s->tmp_record,
> >> +                    ERST_RECORD_SIZE - s->record_offset);
> >> +            }
> >> +        }
> >> +    }
> >> +
> >> +    return rc;
> >> +}
> >> +
> >> +static unsigned get_erst_record_count(ERSTDeviceState *s)
> >> +{
> >> +    /* Compute record_count */
> >> +    unsigned index = 0;
> >> +
> >> +    s->record_count = 0;
> >> +    while (copy_from_nvram_by_index(s, index) == ACPI_ERST_STATUS_SUCCESS) {
> >> +        uint8_t *ptr = &s->tmp_record[0];
> >> +        uint64_t record_identifier = THE_UEFI_CPER_RECORD_ID(ptr);
> >> +        if (IS_UEFI_CPER_RECORD(ptr) &&
> >> +            (ERST_INVALID_RECORD_ID != record_identifier)) {
> >> +            s->record_count += 1;
> >> +        }
> >> +        ++index;
> >> +    }
> >> +    return s->record_count;
> >> +}
> >> +
> >> +/*******************************************************************/
> >> +
> >> +static uint64_t erst_rd_reg64(hwaddr addr,
> >> +    uint64_t reg, unsigned size)
> >> +{
> >> +    uint64_t rdval;
> >> +    uint64_t mask;
> >> +    unsigned shift;
> >> +
> >> +    if (size == sizeof(uint64_t)) {
> >> +        /* 64b access */
> >> +        mask = 0xFFFFFFFFFFFFFFFFUL;
> >> +        shift = 0;
> >> +    } else {
> >> +        /* 32b access */
> >> +        mask = 0x00000000FFFFFFFFUL;
> >> +        shift = ((addr & 0x4) == 0x4) ? 32 : 0;
> >> +    }
> >> +
> >> +    rdval = reg;
> >> +    rdval >>= shift;
> >> +    rdval &= mask;
> >> +
> >> +    return rdval;
> >> +}
> >> +
> >> +static uint64_t erst_wr_reg64(hwaddr addr,
> >> +    uint64_t reg, uint64_t val, unsigned size)
> >> +{
> >> +    uint64_t wrval;
> >> +    uint64_t mask;
> >> +    unsigned shift;
> >> +
> >> +    if (size == sizeof(uint64_t)) {
> >> +        /* 64b access */
> >> +        mask = 0xFFFFFFFFFFFFFFFFUL;
> >> +        shift = 0;
> >> +    } else {
> >> +        /* 32b access */
> >> +        mask = 0x00000000FFFFFFFFUL;
> >> +        shift = ((addr & 0x4) == 0x4) ? 32 : 0;
> >> +    }
> >> +
> >> +    val &= mask;
> >> +    val <<= shift;
> >> +    mask <<= shift;
> >> +    wrval = reg;
> >> +    wrval &= ~mask;
> >> +    wrval |= val;
> >> +
> >> +    return wrval;
> >> +}  
> > (I see in next patch it's us defining access width in the ACPI tables)
> > so question is: do we have to have mixed register width access?
> > can't all register accesses be 64-bit?  
> 
> Initially I attempted to just use 64-bit exclusively. The problem is that,
> for reasons I don't understand, the OSPM on Linux, even x86_64, breaks a 64b
> register access into two. Here's an example of reading the exchange buffer
> address, which is coded as a 64b access:
> 
> acpi_erst_reg_write addr: 0x0000 <== 0x000000000000000d (size: 4)
> acpi_erst_reg_read  addr: 0x0008 ==> 0x00000000c1010000 (size: 4)
> acpi_erst_reg_read  addr: 0x000c ==> 0x0000000000000000 (size: 4)
> 
> So I went ahead and made ACTION register accesses 32b, else there would
> be two reads of 32-bts, of which the second is useless.

could you post here decompiled ERST table?

> 
> >   
> >> +static void erst_reg_write(void *opaque, hwaddr addr,
> >> +    uint64_t val, unsigned size)
> >> +{
> >> +    ERSTDeviceState *s = (ERSTDeviceState *)opaque;
> >> +
> >> +    /*
> >> +     * NOTE: All actions/operations/side effects happen on the WRITE,
> >> +     * by design. The READs simply return the reg_value contents.
> >> +     */
> >> +    trace_acpi_erst_reg_write(addr, val, size);
> >> +
> >> +    switch (addr) {
> >> +    case ERST_CSR_VALUE + 0:
> >> +    case ERST_CSR_VALUE + 4:
> >> +        s->reg_value = erst_wr_reg64(addr, s->reg_value, val, size);
> >> +        break;
> >> +    case ERST_CSR_ACTION + 0:
> >> +/*  case ERST_CSR_ACTION+4: as coded, not really a 64b register */
> >> +        switch (val) {
> >> +        case ACPI_ERST_ACTION_BEGIN_WRITE_OPERATION:
> >> +        case ACPI_ERST_ACTION_BEGIN_READ_OPERATION:
> >> +        case ACPI_ERST_ACTION_BEGIN_CLEAR_OPERATION:
> >> +        case ACPI_ERST_ACTION_BEGIN_DUMMY_WRITE_OPERATION:
> >> +        case ACPI_ERST_ACTION_END_OPERATION:
> >> +            s->operation = val;
> >> +            break;
> >> +        case ACPI_ERST_ACTION_SET_RECORD_OFFSET:
> >> +            s->record_offset = s->reg_value;
> >> +            break;
> >> +        case ACPI_ERST_ACTION_EXECUTE_OPERATION:
> >> +            if ((uint8_t)s->reg_value == ERST_EXECUTE_OPERATION_MAGIC) {
> >> +                s->busy_status = 1;
> >> +                switch (s->operation) {
> >> +                case ACPI_ERST_ACTION_BEGIN_WRITE_OPERATION:
> >> +                    s->command_status = write_erst_record(s);
> >> +                    break;
> >> +                case ACPI_ERST_ACTION_BEGIN_READ_OPERATION:
> >> +                    s->command_status = read_erst_record(s);
> >> +                    break;
> >> +                case ACPI_ERST_ACTION_BEGIN_CLEAR_OPERATION:
> >> +                    s->command_status = clear_erst_record(s);
> >> +                    break;
> >> +                case ACPI_ERST_ACTION_BEGIN_DUMMY_WRITE_OPERATION:
> >> +                    s->command_status = ACPI_ERST_STATUS_SUCCESS;
> >> +                    break;
> >> +                case ACPI_ERST_ACTION_END_OPERATION:
> >> +                    s->command_status = ACPI_ERST_STATUS_SUCCESS;
> >> +                    break;
> >> +                default:
> >> +                    s->command_status = ACPI_ERST_STATUS_FAILED;
> >> +                    break;
> >> +                }
> >> +                s->record_identifier = ERST_INVALID_RECORD_ID;
> >> +                s->busy_status = 0;
> >> +            }
> >> +            break;
> >> +        case ACPI_ERST_ACTION_CHECK_BUSY_STATUS:
> >> +            s->reg_value = s->busy_status;
> >> +            break;
> >> +        case ACPI_ERST_ACTION_GET_COMMAND_STATUS:
> >> +            s->reg_value = s->command_status;
> >> +            break;
> >> +        case ACPI_ERST_ACTION_GET_RECORD_IDENTIFIER:
> >> +            s->command_status = next_erst_record(s, &s->reg_value);
> >> +            break;
> >> +        case ACPI_ERST_ACTION_SET_RECORD_IDENTIFIER:
> >> +            s->record_identifier = s->reg_value;
> >> +            break;
> >> +        case ACPI_ERST_ACTION_GET_RECORD_COUNT:
> >> +            s->reg_value = s->record_count;
> >> +            break;
> >> +        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE:
> >> +            s->reg_value = s->bar1;
> >> +            break;
> >> +        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_LENGTH:
> >> +            s->reg_value = ERST_RECORD_SIZE;
> >> +            break;
> >> +        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES:
> >> +            s->reg_value = 0x0; /* intentional, not NVRAM mode */
> >> +            break;
> >> +        case ACPI_ERST_ACTION_GET_EXECUTE_OPERATION_TIMINGS:
> >> +            /*
> >> +             * 100UL is max, 10UL is nominal  
> > 100/10 of what, also add reference to spec/table it comes from
> > and explain in comment why theses values were chosen  
> I've changed the comment and style to be similar to build_amd_iommu().
> These are merely sane non-zero max/min times.
> 
> >   
> >> +             */
> >> +            s->reg_value = ((100UL << 32) | (10UL << 0));
> >> +            break;
> >> +        case ACPI_ERST_ACTION_RESERVED:  
> > not necessary, it will be handled by 'default:'  
> Corrected
> 
> >   
> >> +        default:
> >> +            /*
> >> +             * Unknown action/command, NOP
> >> +             */
> >> +            break;
> >> +        }
> >> +        break;
> >> +    default:
> >> +        /*
> >> +         * This should not happen, but if it does, NOP
> >> +         */
> >> +        break;
> >> +    }
> >> +}
> >> +
> >> +static uint64_t erst_reg_read(void *opaque, hwaddr addr,
> >> +                                unsigned size)
> >> +{
> >> +    ERSTDeviceState *s = (ERSTDeviceState *)opaque;
> >> +    uint64_t val = 0;
> >> +
> >> +    switch (addr) {
> >> +    case ERST_CSR_ACTION + 0:
> >> +    case ERST_CSR_ACTION + 4:
> >> +        val = erst_rd_reg64(addr, s->reg_action, size);
> >> +        break;
> >> +    case ERST_CSR_VALUE + 0:
> >> +    case ERST_CSR_VALUE + 4:
> >> +        val = erst_rd_reg64(addr, s->reg_value, size);
> >> +        break;
> >> +    default:
> >> +        break;
> >> +    }
> >> +    trace_acpi_erst_reg_read(addr, val, size);
> >> +    return val;
> >> +}
> >> +
> >> +static const MemoryRegionOps erst_reg_ops = {
> >> +    .read = erst_reg_read,
> >> +    .write = erst_reg_write,
> >> +    .endianness = DEVICE_NATIVE_ENDIAN,
> >> +};
> >> +
> >> +static void erst_mem_write(void *opaque, hwaddr addr,
> >> +    uint64_t val, unsigned size)
> >> +{
> >> +    ERSTDeviceState *s = (ERSTDeviceState *)opaque;  
> >   
> >> +    uint8_t *ptr = &s->record[addr - 0];
> >> +    trace_acpi_erst_mem_write(addr, val, size);
> >> +    switch (size) {
> >> +    default:
> >> +    case sizeof(uint8_t):
> >> +        *(uint8_t *)ptr = (uint8_t)val;
> >> +        break;
> >> +    case sizeof(uint16_t):
> >> +        *(uint16_t *)ptr = (uint16_t)val;
> >> +        break;
> >> +    case sizeof(uint32_t):
> >> +        *(uint32_t *)ptr = (uint32_t)val;
> >> +        break;
> >> +    case sizeof(uint64_t):
> >> +        *(uint64_t *)ptr = (uint64_t)val;
> >> +        break;
> >> +    }
> >> +}
> >> +
> >> +static uint64_t erst_mem_read(void *opaque, hwaddr addr,
> >> +                                unsigned size)
> >> +{
> >> +    ERSTDeviceState *s = (ERSTDeviceState *)opaque;
> >> +    uint8_t *ptr = &s->record[addr - 0];
> >> +    uint64_t val = 0;
> >> +    switch (size) {
> >> +    default:
> >> +    case sizeof(uint8_t):
> >> +        val = *(uint8_t *)ptr;
> >> +        break;
> >> +    case sizeof(uint16_t):
> >> +        val = *(uint16_t *)ptr;
> >> +        break;
> >> +    case sizeof(uint32_t):
> >> +        val = *(uint32_t *)ptr;
> >> +        break;
> >> +    case sizeof(uint64_t):
> >> +        val = *(uint64_t *)ptr;
> >> +        break;
> >> +    }
> >> +    trace_acpi_erst_mem_read(addr, val, size);
> >> +    return val;
> >> +}
> >> +
> >> +static const MemoryRegionOps erst_mem_ops = {
> >> +    .read = erst_mem_read,
> >> +    .write = erst_mem_write,
> >> +    .endianness = DEVICE_NATIVE_ENDIAN,
> >> +};
> >> +
> >> +/*******************************************************************/
> >> +/*******************************************************************/
> >> +
> >> +static const VMStateDescription erst_vmstate  = {
> >> +    .name = "acpi-erst",
> >> +    .version_id = 1,
> >> +    .minimum_version_id = 1,
> >> +    .fields = (VMStateField[]) {
> >> +        VMSTATE_UINT8(operation, ERSTDeviceState),
> >> +        VMSTATE_UINT8(busy_status, ERSTDeviceState),
> >> +        VMSTATE_UINT8(command_status, ERSTDeviceState),
> >> +        VMSTATE_UINT32(record_offset, ERSTDeviceState),
> >> +        VMSTATE_UINT32(record_count, ERSTDeviceState),
> >> +        VMSTATE_UINT64(reg_action, ERSTDeviceState),
> >> +        VMSTATE_UINT64(reg_value, ERSTDeviceState),
> >> +        VMSTATE_UINT64(record_identifier, ERSTDeviceState),
> >> +        VMSTATE_UINT8_ARRAY(record, ERSTDeviceState, ERST_RECORD_SIZE),
> >> +        VMSTATE_UINT8_ARRAY(tmp_record, ERSTDeviceState, ERST_RECORD_SIZE),
> >> +        VMSTATE_END_OF_LIST()
> >> +    }
> >> +};
> >> +
> >> +static void erst_realizefn(PCIDevice *pci_dev, Error **errp)
> >> +{
> >> +    ERSTDeviceState *s = ACPIERST(pci_dev);
> >> +    unsigned index = 0;
> >> +    bool share;
> >> +
> >> +    trace_acpi_erst_realizefn_in();
> >> +
> >> +    if (!s->hostmem) {
> >> +        error_setg(errp, "'" ACPI_ERST_MEMDEV_PROP "' property is not set");
> >> +        return;
> >> +    } else if (host_memory_backend_is_mapped(s->hostmem)) {
> >> +        error_setg(errp, "can't use already busy memdev: %s",
> >> +                   object_get_canonical_path_component(OBJECT(s->hostmem)));
> >> +        return;
> >> +    }
> >> +
> >> +    share = object_property_get_bool(OBJECT(s->hostmem), "share", &error_fatal);  
> > s/&error_fatal/errp/  
> Corrected
> 
> >   
> >> +    if (!share) {
> >> +        error_setg(errp, "ACPI ERST requires hostmem property share=on: %s",
> >> +                   object_get_canonical_path_component(OBJECT(s->hostmem)));
> >> +    }  
> > This limits possible to use backends to file|memfd only, so
> > I wonder if really need this limitation, what if user doesn't
> > care about preserving it across QEMU restarts. (i.e. usecase
> > where storage is used as a means to troubleshoot guest crash
> > i.e. QEMU is not restarted in between)
> > 
> > Maybe instead of enforcing we should just document that if user
> > wishes to preserve content they should use file|memfd backend with
> > share=on option.  
> 
> I've removed this check. It is documented the way it is intended to be used.
> 
> >   
> >> +
> >> +    s->hostmem_mr = host_memory_backend_get_memory(s->hostmem);
> >> +
> >> +    /* HostMemoryBackend size will be multiple of PAGE_SIZE */
> >> +    s->prop_size = object_property_get_int(OBJECT(s->hostmem), "size", &error_fatal);  
> > s/&error_fatal/errp/  
> Corrected
> 
> >   
> >> +
> >> +    /* Convert prop_size to integer multiple of ERST_RECORD_SIZE */
> >> +    s->prop_size -= (s->prop_size % ERST_RECORD_SIZE);  
> > 
> > pls, no fixups on behalf of user, if size is not what it should be
> > error out with suggestion how to fix it.  
> Removed
> 
> >   
> >> +
> >> +    /*
> >> +     * MemoryBackend initializes contents to zero, but we actually
> >> +     * want contents initialized to 0xFF, ERST_INVALID_RECORD_ID.
> >> +     */
> >> +    if (copy_from_nvram_by_index(s, 0) == ACPI_ERST_STATUS_SUCCESS) {
> >> +        if (s->tmp_record[0] == 0x00) {
> >> +            memset(s->tmp_record, 0xFF, ERST_RECORD_SIZE);  
> > this doesn't scale,
> > (set backend size to more than host physical RAM, put it on slow storage and have fun.)  
> of course, which is why i think we need to have an upper bound (my early
> submissions did).
> 
> > 
> > Is it possible to use 0 as invalid record id or change storage format
> > so you would not have to rewrite whole file at startup (maybe some sort  
> no
> 
> > of metadata header/records book-keeping table before actual records.
> > And initialize file only if header is invalid.)  
> I have to scan the backend storage anyway in order to initialize the record
> count, so I've combined that scan with a test to see if the backend storage
> needs to be initialized.


if you add a records table at the start of backend,
then you won't need to read/write whole file.
It would be enough to read/initialize header only and access
actual records only when necessary. Header could look something like:

|erst magic string|
|slot size|
|slots nr|
+++++++++++++++++ slots header ++++++++++++
|is_empty, record offset from file start, maybe something else that would speed up access|
...
|last record descriptor|
++++++++++ actual records +++++++++++++
|slot 0|
...
|slot n|

> >> +            index = 0;
> >> +            while (copy_to_nvram_by_index(s, index) == ACPI_ERST_STATUS_SUCCESS) {
> >> +                ++index;
> >> +            }  
> > also back&forth copying here is not really necessary.  
> corrected
> 
> >   
> >> +        }
> >> +    }
> >> +
> >> +    /* Initialize record_count */
> >> +    get_erst_record_count(s);  
> > why not put it into reset?  
> It is initialized once, then subsequent write/clear operations update
> the counter as needed.

ok

> >   
> >> +
> >> +    /* BAR 0: Programming registers */
> >> +    memory_region_init_io(&s->iomem, OBJECT(pci_dev), &erst_reg_ops, s,
> >> +                          TYPE_ACPI_ERST, ERST_REG_SIZE);
> >> +    pci_register_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->iomem);
> >> +  
> >   
> >> +    /* BAR 1: Exchange buffer memory */
> >> +    memory_region_init_io(&s->nvmem, OBJECT(pci_dev), &erst_mem_ops, s,
> >> +                          TYPE_ACPI_ERST, ERST_RECORD_SIZE);
> >> +    pci_register_bar(pci_dev, 1, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->nvmem);  
> > 
> > **)
> > instead of using mmio for buffer where each write causes
> > guest exit to QEMU, map memory region directly to guest.
> > see ivshmem_bar2, the only difference with ivshmem, you'd
> > create memory region manually (for example you can use
> > memory_region_init_resizeable_ram)
> > 
> > this way you can speedup access and drop erst_mem_ops and
> > [tmp_]record intermediate buffers.
> > 
> > Instead of [tmp_]record you can copy record content
> > directly between buffer and backend memory regions.  
> 
> I've changed the exchange buffer into a MemoryBackend object and
> eliminated the erst_mem_ops.
> 
> >   
> >> +    /*
> >> +     * The vmstate_register_ram_global() puts the memory in
> >> +     * migration stream, where it is written back to the memory
> >> +     * upon reaching the destination, which causes the backing
> >> +     * file to be updated (with share=on).
> >> +     */
> >> +    vmstate_register_ram_global(s->hostmem_mr);
> >> +
> >> +    trace_acpi_erst_realizefn_out(s->prop_size);
> >> +}
> >> +
> >> +static void erst_reset(DeviceState *dev)
> >> +{
> >> +    ERSTDeviceState *s = ACPIERST(dev);
> >> +
> >> +    trace_acpi_erst_reset_in(s->record_count);
> >> +    s->operation = 0;
> >> +    s->busy_status = 0;
> >> +    s->command_status = ACPI_ERST_STATUS_SUCCESS;  
> >   
> >> +    /* indicate empty/no-more until further notice */  
> > pls rephrase, I'm not sure what it's trying to say  
> Eliminated; I don't know why I was trying to say there either
> >   
> >> +    s->record_identifier = ERST_INVALID_RECORD_ID;
> >> +    s->record_offset = 0;
> >> +    s->next_record_index = 0;  
> >   
> >> +    /* NOTE: record_count and nvram are initialized elsewhere */
> >> +    trace_acpi_erst_reset_out(s->record_count);
> >> +}
> >> +
> >> +static Property erst_properties[] = {
> >> +    DEFINE_PROP_LINK(ACPI_ERST_MEMDEV_PROP, ERSTDeviceState, hostmem,
> >> +                     TYPE_MEMORY_BACKEND, HostMemoryBackend *),
> >> +    DEFINE_PROP_END_OF_LIST(),
> >> +};
> >> +
> >> +static void erst_class_init(ObjectClass *klass, void *data)
> >> +{
> >> +    DeviceClass *dc = DEVICE_CLASS(klass);
> >> +    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> >> +
> >> +    trace_acpi_erst_class_init_in();
> >> +    k->realize = erst_realizefn;
> >> +    k->vendor_id = PCI_VENDOR_ID_REDHAT;
> >> +    k->device_id = PCI_DEVICE_ID_REDHAT_ACPI_ERST;
> >> +    k->revision = 0x00;
> >> +    k->class_id = PCI_CLASS_OTHERS;
> >> +    dc->reset = erst_reset;
> >> +    dc->vmsd = &erst_vmstate;
> >> +    dc->user_creatable = true;
> >> +    device_class_set_props(dc, erst_properties);
> >> +    dc->desc = "ACPI Error Record Serialization Table (ERST) device";
> >> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> >> +    trace_acpi_erst_class_init_out();
> >> +}
> >> +
> >> +static const TypeInfo erst_type_info = {
> >> +    .name          = TYPE_ACPI_ERST,
> >> +    .parent        = TYPE_PCI_DEVICE,
> >> +    .class_init    = erst_class_init,
> >> +    .instance_size = sizeof(ERSTDeviceState),
> >> +    .interfaces = (InterfaceInfo[]) {
> >> +        { INTERFACE_CONVENTIONAL_PCI_DEVICE },  
> > what is this for here?
> >   
> >> +        { }
> >> +    }
> >> +};
> >> +
> >> +static void erst_register_types(void)
> >> +{
> >> +    type_register_static(&erst_type_info);
> >> +}
> >> +
> >> +type_init(erst_register_types)
> >> diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
> >> index dd69577..262a8ee 100644
> >> --- a/hw/acpi/meson.build
> >> +++ b/hw/acpi/meson.build
> >> @@ -4,6 +4,7 @@ acpi_ss.add(files(
> >>     'aml-build.c',
> >>     'bios-linker-loader.c',
> >>     'utils.c',
> >> +  'erst.c',
> >>   ))
> >>   acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu.c'))
> >>   acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu_hotplug.c'))  
> >   
> 


