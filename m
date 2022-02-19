Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EB24BC347
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Feb 2022 01:24:20 +0100 (CET)
Received: from localhost ([::1]:36588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLDXv-0007DQ-DG
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 19:24:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nLDWP-0006Oq-45; Fri, 18 Feb 2022 19:22:45 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:24727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nLDVk-0005Ri-0j; Fri, 18 Feb 2022 19:22:44 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id AB7ED7457EF;
 Sat, 19 Feb 2022 01:12:59 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 73694745712; Sat, 19 Feb 2022 01:12:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 71FA17456E3;
 Sat, 19 Feb 2022 01:12:59 +0100 (CET)
Date: Sat, 19 Feb 2022 01:12:59 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Liav Albani <liavalb@gmail.com>
Subject: Re: [PATCH v2 1/2] hw/ide: split bmdma read and write functions from
 piix.c
In-Reply-To: <20220218204155.236611-2-liavalb@gmail.com>
Message-ID: <ffba4b98-5b6-c39a-3cb-73cb2e1cbf15@eik.bme.hu>
References: <20220218204155.236611-1-liavalb@gmail.com>
 <20220218204155.236611-2-liavalb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Feb 2022, Liav Albani wrote:
> This is a preparation before implementing another PCI IDE controller
> that relies on these functions, so these can be shared between both
> implementations.
>
> Signed-off-by: Liav Albani <liavalb@gmail.com>
> ---
> hw/ide/bmdma.c         | 84 ++++++++++++++++++++++++++++++++++++++++++
> hw/ide/meson.build     |  2 +-
> hw/ide/piix.c          | 51 ++-----------------------
> include/hw/ide/bmdma.h | 34 +++++++++++++++++
> 4 files changed, 122 insertions(+), 49 deletions(-)
> create mode 100644 hw/ide/bmdma.c
> create mode 100644 include/hw/ide/bmdma.h
>
> diff --git a/hw/ide/bmdma.c b/hw/ide/bmdma.c
> new file mode 100644
> index 0000000000..d12ed730dd
> --- /dev/null
> +++ b/hw/ide/bmdma.c
> @@ -0,0 +1,84 @@
> +/*
> + * QEMU IDE Emulation: Intel PCI Bus master IDE support for PIIX3/4 and ICH6/7.
> + *
> + * Copyright (c) 2003 Fabrice Bellard
> + * Copyright (c) 2006 Openedhand Ltd.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/pci/pci.h"
> +#include "migration/vmstate.h"
> +#include "qapi/error.h"
> +#include "qemu/module.h"
> +#include "sysemu/block-backend.h"
> +#include "sysemu/blockdev.h"
> +#include "sysemu/dma.h"
> +
> +#include "hw/ide/bmdma.h"
> +#include "hw/ide/pci.h"
> +#include "trace.h"

Are you sure you need all these includes? I haven't checked but I think 
there may be some unneeded ones here. On the other hand I'm not sure 
putting these in a new file is worth it. There are already some bmdma_* 
functions in hw/ide/pci.c which are declared in include/hw/ide/pci.h so 
you could just move these there too then no new file, new header nor 
changes to meson.build is needed in this patch..

> +
> +uint64_t intel_ide_bmdma_read(void *opaque, hwaddr addr, unsigned size)

As I said before these aren't intel specific as the same functions also 
appear in other ide controllers such as via.c so maybe a better name would 
be bmdma_default_read and bmdma_default_write or somehting similar so 
these can be also reused by other non-intel devices too.

Regards,
BALATON Zoltan

> +{
> +    BMDMAState *bm = opaque;
> +    uint32_t val;
> +
> +    if (size != 1) {
> +        return ((uint64_t)1 << (size * 8)) - 1;
> +    }
> +
> +    switch (addr & 3) {
> +    case 0:
> +        val = bm->cmd;
> +        break;
> +    case 2:
> +        val = bm->status;
> +        break;
> +    default:
> +        val = 0xff;
> +        break;
> +    }
> +
> +    trace_bmdma_read(addr, val);
> +    return val;
> +}
> +
> +void intel_ide_bmdma_write(void *opaque, hwaddr addr,
> +                        uint64_t val, unsigned size)
> +{
> +    BMDMAState *bm = opaque;
> +
> +    if (size != 1) {
> +        return;
> +    }
> +
> +    trace_bmdma_write(addr, val);
> +
> +    switch (addr & 3) {
> +    case 0:
> +        bmdma_cmd_writeb(bm, val);
> +        break;
> +    case 2:
> +        uint8_t cur_val = bm->status;
> +        bm->status = (val & 0x60) | (cur_val & 1) | (cur_val & ~val & 0x06);
> +        break;
> +    }
> +}
> diff --git a/hw/ide/meson.build b/hw/ide/meson.build
> index ddcb3b28d2..38f9ae7178 100644
> --- a/hw/ide/meson.build
> +++ b/hw/ide/meson.build
> @@ -7,7 +7,7 @@ softmmu_ss.add(when: 'CONFIG_IDE_ISA', if_true: files('isa.c', 'ioport.c'))
> softmmu_ss.add(when: 'CONFIG_IDE_MACIO', if_true: files('macio.c'))
> softmmu_ss.add(when: 'CONFIG_IDE_MMIO', if_true: files('mmio.c'))
> softmmu_ss.add(when: 'CONFIG_IDE_PCI', if_true: files('pci.c'))
> -softmmu_ss.add(when: 'CONFIG_IDE_PIIX', if_true: files('piix.c', 'ioport.c'))
> +softmmu_ss.add(when: 'CONFIG_IDE_PIIX', if_true: files('piix.c', 'ioport.c', 'bmdma.c'))
> softmmu_ss.add(when: 'CONFIG_IDE_QDEV', if_true: files('qdev.c'))
> softmmu_ss.add(when: 'CONFIG_IDE_SII3112', if_true: files('sii3112.c'))
> softmmu_ss.add(when: 'CONFIG_IDE_VIA', if_true: files('via.c'))
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index ce89fd0aa3..8f94809eee 100644
> --- a/hw/ide/piix.c
> +++ b/hw/ide/piix.c
> @@ -33,57 +33,12 @@
> #include "sysemu/dma.h"
>
> #include "hw/ide/pci.h"
> +#include "hw/ide/bmdma.h"
> #include "trace.h"
>
> -static uint64_t bmdma_read(void *opaque, hwaddr addr, unsigned size)
> -{
> -    BMDMAState *bm = opaque;
> -    uint32_t val;
> -
> -    if (size != 1) {
> -        return ((uint64_t)1 << (size * 8)) - 1;
> -    }
> -
> -    switch(addr & 3) {
> -    case 0:
> -        val = bm->cmd;
> -        break;
> -    case 2:
> -        val = bm->status;
> -        break;
> -    default:
> -        val = 0xff;
> -        break;
> -    }
> -
> -    trace_bmdma_read(addr, val);
> -    return val;
> -}
> -
> -static void bmdma_write(void *opaque, hwaddr addr,
> -                        uint64_t val, unsigned size)
> -{
> -    BMDMAState *bm = opaque;
> -
> -    if (size != 1) {
> -        return;
> -    }
> -
> -    trace_bmdma_write(addr, val);
> -
> -    switch(addr & 3) {
> -    case 0:
> -        bmdma_cmd_writeb(bm, val);
> -        break;
> -    case 2:
> -        bm->status = (val & 0x60) | (bm->status & 1) | (bm->status & ~val & 0x06);
> -        break;
> -    }
> -}
> -
> static const MemoryRegionOps piix_bmdma_ops = {
> -    .read = bmdma_read,
> -    .write = bmdma_write,
> +    .read = intel_ide_bmdma_read,
> +    .write = intel_ide_bmdma_write,
> };
>
> static void bmdma_setup_bar(PCIIDEState *d)
> diff --git a/include/hw/ide/bmdma.h b/include/hw/ide/bmdma.h
> new file mode 100644
> index 0000000000..ce76d395f5
> --- /dev/null
> +++ b/include/hw/ide/bmdma.h
> @@ -0,0 +1,34 @@
> +/*
> + * QEMU IDE Emulation: Intel PCI Bus master IDE support for PIIX3/4 and ICH6/7.
> + *
> + * Copyright (c) 2022 Liav Albani
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#ifndef HW_IDE_BMDMA_H
> +#define HW_IDE_BMDMA_H
> +
> +#include "hw/ide/internal.h"
> +
> +uint64_t intel_ide_bmdma_read(void *opaque, hwaddr addr, unsigned size);
> +void intel_ide_bmdma_write(void *opaque, hwaddr addr, uint64_t val,
> +                           unsigned size);
> +
> +#endif
>

