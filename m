Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0603333A8BA
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 00:17:04 +0100 (CET)
Received: from localhost ([::1]:58570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLZyp-0002K6-1u
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 19:17:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLZxa-0001t9-W4
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:15:47 -0400
Received: from relay64.bu.edu ([128.197.228.104]:58670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLZxY-0005cm-QW
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:15:46 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 12ENEZhI024090
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Sun, 14 Mar 2021 19:14:39 -0400
Date: Sun, 14 Mar 2021 19:14:35 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 1/3] memory: add a sparse memory device for fuzzing
Message-ID: <20210314231435.fjdkd2gzrf7dh243@mozz.bu.edu>
References: <20210313231859.941263-1-alxndr@bu.edu>
 <20210313231859.941263-2-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210313231859.941263-2-alxndr@bu.edu>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 f4bug@amsat.org, darren.kenny@oracle.com, bsd@redhat.com, stefanha@redhat.com,
 Igor Mammedov <imammedo@redhat.com>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210313 1818, Alexander Bulekov wrote:
> For testing, it can be useful to simulate an enormous amount of memory
> (e.g. 2^64 RAM). This adds an MMIO device that acts as sparse memory.
> When something writes a nonzero value to a sparse-mem address, we
> allocate a block of memory. This block is kept around, until all of the
> bytes within the block are zero-ed. The device has a very low priority
> (so it can be mapped beneath actual RAM, and virtual device MMIO
> regions).
> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  MAINTAINERS                 |   1 +
>  hw/mem/meson.build          |   1 +
>  hw/mem/sparse-mem.c         | 152 ++++++++++++++++++++++++++++++++++++
>  include/hw/mem/sparse-mem.h |  19 +++++
>  4 files changed, 173 insertions(+)
>  create mode 100644 hw/mem/sparse-mem.c
>  create mode 100644 include/hw/mem/sparse-mem.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f22d83c178..9e3d8b1401 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2618,6 +2618,7 @@ R: Thomas Huth <thuth@redhat.com>
>  S: Maintained
>  F: tests/qtest/fuzz/
>  F: scripts/oss-fuzz/
> +F: hw/mem/sparse-mem.c
>  F: docs/devel/fuzzing.rst
>  
>  Register API
> diff --git a/hw/mem/meson.build b/hw/mem/meson.build
> index 0d22f2b572..ef79e04678 100644
> --- a/hw/mem/meson.build
> +++ b/hw/mem/meson.build
> @@ -1,5 +1,6 @@
>  mem_ss = ss.source_set()
>  mem_ss.add(files('memory-device.c'))
> +mem_ss.add(when: 'CONFIG_FUZZ', if_true: files('sparse-mem.c'))
>  mem_ss.add(when: 'CONFIG_DIMM', if_true: files('pc-dimm.c'))
>  mem_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_mc.c'))
>  mem_ss.add(when: 'CONFIG_NVDIMM', if_true: files('nvdimm.c'))
> diff --git a/hw/mem/sparse-mem.c b/hw/mem/sparse-mem.c
> new file mode 100644
> index 0000000000..575a287f59
> --- /dev/null
> +++ b/hw/mem/sparse-mem.c
> @@ -0,0 +1,152 @@
> +/*
> + * A sparse memory device. Useful for fuzzing
> + *
> + * Copyright Red Hat Inc., 2021
> + *
> + * Authors:
> + *  Alexander Bulekov   <alxndr@bu.edu>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "exec/address-spaces.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/sysbus.h"
> +#include "qapi/error.h"
> +#include "qemu/units.h"
> +#include "sysemu/qtest.h"
> +#include "hw/mem/sparse-mem.h"
> +
> +#define SPARSE_MEM(obj) OBJECT_CHECK(SparseMemState, (obj), TYPE_SPARSE_MEM)
> +#define SPARSE_BLOCK_SIZE 0x1000
> +
> +typedef struct SparseMemState {
> +    SysBusDevice parent_obj;
> +    MemoryRegion mmio;
> +    uint64_t baseaddr;
> +    uint64_t length;
> +    uint64_t size_used;
> +    uint64_t maxsize;
> +    GHashTable *mapped;
> +} SparseMemState;
> +
> +typedef struct sparse_mem_block {
> +    uint8_t data[SPARSE_BLOCK_SIZE];
> +} sparse_mem_block;
> +
> +static uint64_t sparse_mem_read(void *opaque, hwaddr addr, unsigned int size)
> +{
> +    printf("SPARSEREAD %lx\n", addr);
This debug-printf shouldn't be here..
-Alex

