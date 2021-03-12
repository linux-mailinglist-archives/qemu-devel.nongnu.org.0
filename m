Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CC5338444
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 04:11:10 +0100 (CET)
Received: from localhost ([::1]:53668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKYCi-0000U6-UB
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 22:11:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lKYBA-0008Mr-J8
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 22:09:32 -0500
Received: from relay64.bu.edu ([128.197.228.104]:55305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lKYB8-0000xg-Nm
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 22:09:32 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 12C388Zq012010
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 11 Mar 2021 22:08:11 -0500
Date: Thu, 11 Mar 2021 22:08:08 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 1/3] memory: add a sparse memory device
Message-ID: <20210312030808.f2vuko2xxzscbspc@mozz.bu.edu>
References: <20210311053614.940352-1-alxndr@bu.edu>
 <20210311053614.940352-2-alxndr@bu.edu>
 <4f410e96-77f0-91f9-3303-3e303ab15c09@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4f410e96-77f0-91f9-3303-3e303ab15c09@redhat.com>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, lidong.chen@oracle.com, darren.kenny@oracle.com,
 bsd@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210311 1525, Philippe Mathieu-Daudé wrote:
> On 3/11/21 6:36 AM, Alexander Bulekov wrote:
> > For testing, it can be useful to simulate an enormous amount of memory
> > (e.g. 2^64 RAM). This adds an MMIO device that acts as sparse memory.
> > When something writes a nonzero value to a sparse-mem address, we
> > allocate a block of memory. This block is kept around, until all of the
> > bytes within the block are zero-ed. The device has a very low priority
> > (so it can be mapped beneath actual RAM, and virtual device MMIO
> > regions).
> 
> I'm not convinced we need this, but still added some comments while
> reviewing.
> 
> > 
> > Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> > ---
> >  MAINTAINERS         |   1 +
> >  hw/mem/meson.build  |   1 +
> >  hw/mem/sparse-mem.c | 154 ++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 156 insertions(+)
> >  create mode 100644 hw/mem/sparse-mem.c
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index f22d83c178..9e3d8b1401 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2618,6 +2618,7 @@ R: Thomas Huth <thuth@redhat.com>
> >  S: Maintained
> >  F: tests/qtest/fuzz/
> >  F: scripts/oss-fuzz/
> > +F: hw/mem/sparse-mem.c
> >  F: docs/devel/fuzzing.rst
> >  
> >  Register API
> > diff --git a/hw/mem/meson.build b/hw/mem/meson.build
> > index 0d22f2b572..732f459e0a 100644
> > --- a/hw/mem/meson.build
> > +++ b/hw/mem/meson.build
> > @@ -1,5 +1,6 @@
> >  mem_ss = ss.source_set()
> >  mem_ss.add(files('memory-device.c'))
> > +mem_ss.add(files('sparse-mem.c'))
> >  mem_ss.add(when: 'CONFIG_DIMM', if_true: files('pc-dimm.c'))
> >  mem_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_mc.c'))
> >  mem_ss.add(when: 'CONFIG_NVDIMM', if_true: files('nvdimm.c'))
> > diff --git a/hw/mem/sparse-mem.c b/hw/mem/sparse-mem.c
> > new file mode 100644
> > index 0000000000..ffda6f76b4
> > --- /dev/null
> > +++ b/hw/mem/sparse-mem.c
> > @@ -0,0 +1,154 @@
> > +/*
> > + * A sparse memory device
> > + *
> > + * Copyright Red Hat Inc., 2021
> > + *
> > + * Authors:
> > + *  Alexander Bulekov   <alxndr@bu.edu>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> > + * See the COPYING file in the top-level directory.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +
> > +#include "exec/address-spaces.h"
> > +#include "hw/qdev-properties.h"
> > +
> > +#define TYPE_SPARSE_MEM "sparse-mem"
> > +#define SPARSE_MEM(obj) OBJECT_CHECK(SparseMemState, (obj), TYPE_SPARSE_MEM)
> > +
> > +#define SPARSE_BLOCK_SIZE 0x1000
> > +
> > +typedef struct SparseMemState {
> > +    DeviceState parent_obj;
> > +    MemoryRegion mmio;
> > +    uint64_t baseaddr;
> > +    uint64_t length;
> > +    uint64_t usage;
> 
> usage -> size_used?
> 

Ok - that's nicer.

> > +    uint64_t maxsize;
> > +    GHashTable *mapped;
> > +} SparseMemState;
> > +
> > +typedef struct sparse_mem_block {
> > +    uint16_t nonzeros;
> > +    uint8_t data[SPARSE_BLOCK_SIZE];
> > +} sparse_mem_block;
> > +
> 
> > +static const MemoryRegionOps sparse_mem_ops = {
> > +    .read = sparse_mem_read,
> > +    .write = sparse_mem_write,
> > +    .endianness = DEVICE_LITTLE_ENDIAN,
> > +    .valid = {
> > +            .min_access_size = 1,
> > +            .max_access_size = 8,
> > +            .unaligned = false,
> 
> Why restrict unaligned accesses?
> 

It is mostly a shortcut to avoid dealing with accesses that span
multiple "blocks". E.g. a read from (uint32_t*)0x1ffe would require
looking both at the 0x1000 and 0x2000 blocks.

> > +        },
> > +};
> > +
> > +static Property sparse_mem_properties[] = {
> > +    /* The base address of the memory */
> > +    DEFINE_PROP_UINT64("baseaddr", SparseMemState, baseaddr, 0x0),
> > +    /* The length of the sparse memory region */
> > +    DEFINE_PROP_UINT64("length", SparseMemState, length, UINT64_MAX),
> > +    /* Max amount of actual memory that can be used to back the sparse memory */
> > +    DEFINE_PROP_UINT64("maxsize", SparseMemState, maxsize, 0x100000),
> 
> 0x100000 -> 1 * MiB
> 

Ok.

> > +    DEFINE_PROP_END_OF_LIST(),
> > +};
> > +
> > +static void sparse_mem_realize(DeviceState *dev, Error **errp)
> > +{
> > +    SparseMemState *s = SPARSE_MEM(dev);
> 
> Anyhow, we should restrict this device to QTest accelerator, right?
> 
> Maybe:
>     if (!qtest_enabled()) {
>         error_setg(errp, "sparse_mem device requires QTest");
>         return;
>     }
> 
> > +
> > +    assert(s->baseaddr + s->length > s->baseaddr);
> 
> Don't you need more than 64-bit to do this check?

The check is to make sure that baseaddr + length doesn't overflow the
64-bit address-space.

> 
> > +
> > +    s->mapped = g_hash_table_new(NULL, NULL);
> > +    memory_region_init_io(&(s->mmio), OBJECT(s), &sparse_mem_ops, s,
> > +                          "sparse-mem", s->length);
> > +    memory_region_add_subregion_overlap(get_system_memory(), s->baseaddr,
> > +                                        &(s->mmio), -100);
> 
> mr_add() to sysmem from a non-sysbus device is odd... Maybe it is
> acceptable, I don't know enough.
> 

I will try to find a more standard way to do this.
Thanks
-Alex

> > +}
> > +
> 

