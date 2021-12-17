Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D950478DDD
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 15:34:20 +0100 (CET)
Received: from localhost ([::1]:46568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myEJP-0001HU-99
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 09:34:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1myEGs-0006lp-JO
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:31:42 -0500
Received: from relay68.bu.edu ([128.197.228.73]:60682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1myEGq-0005zh-65
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:31:41 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 1BHEUw7m011469
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 17 Dec 2021 09:31:01 -0500
Date: Fri, 17 Dec 2021 09:30:58 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH] memory: Fix dma-reentrancy issues at the MMIO level
Message-ID: <20211217143045.x6ct3dwhc7vmery6@mozz.bu.edu>
References: <20211217030858.834822-1-alxndr@bu.edu>
 <380ea0e5-a006-c570-4ec8-d67e837547ee@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <380ea0e5-a006-c570-4ec8-d67e837547ee@redhat.com>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.998,
 HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Li Qiang <liq3ea@gmail.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bandan Das <bsd@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 211217 1458, Philippe Mathieu-Daudé wrote:
> On 12/17/21 04:08, Alexander Bulekov wrote:
> > Here's my shot at fixing dma-reentracy issues. This patch adds a flag to
> > the DeviceState, which is set/checked when we call an accessor
> > associated with the device's IO MRs.
> 
> Your approach is exactly what Gerd suggested:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg831437.html

Yes - my bad for not searching my mail more carefully.

> 
> > The problem, in short, as I understand it: For the vast majority of
> > cases, we want to prevent a device from accessing it's own PIO/MMIO
> > regions over DMA.
> > 
> > This patch/solution is based on some assumptions:
> > 1. DMA accesses that hit mmio regions are only dangerous if they end up
> > interacting with memory-regions belonging to the device initiating the
> > DMA.
> > Not dangerous:  sdhci_pio->dma_write->e1000_mmio
> > Dangerous:      sdhci_pio->dma_write->sdhci_mmio
> 
> It doesn't have to be dangerous, see Paolo's example which
> invalidated my previous attempt and forced me to write 24
> patches in multiples series to keep the "niche" cases working:
> https://www.mail-archive.com/qemu-block@nongnu.org/msg72939.html

I don't understand what IO accesses this decodes to. This is loading a
picture into VRAM?

-Alex

> 
> > 
> > 2. Most devices do not interact with their own PIO/MMIO memory-regions
> > using DMA.
> > 
> > 3. There is no way for there to be multiple simultaneous accesses to a
> > device's PIO/MMIO memory-regions.
> > 
> > 4. All devices are QOMified :-)
> > 
> > With this patch, I wasn't able to reproduce the issues being tracked
> > here, with QTest reproducers:
> > https://gitlab.com/qemu-project/qemu/-/issues/556
> > 
> > This passes the i386 qos/qtests for me and I was able to boot some linux/windows
> > VMs with basic devices configured, without any apparent problems.
> > 
> > Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> > Cc: Mauro Matteo Cascella <mcascell@redhat.com>
> > Cc: Qiuhao Li <Qiuhao.Li@outlook.com>
> > Cc: Peter Xu <peterx@redhat.com>
> > Cc: Jason Wang <jasowang@redhat.com>
> > Cc: David Hildenbrand <david@redhat.com>
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: Peter Maydell <peter.maydell@linaro.org>
> > Cc: Li Qiang <liq3ea@gmail.com>
> > Cc: Thomas Huth <thuth@redhat.com>
> > Cc: Laurent Vivier <lvivier@redhat.com>
> > Cc: Bandan Das <bsd@redhat.com>
> > Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> > Cc: Darren Kenny <darren.kenny@oracle.com>
> > Cc: Bin Meng <bin.meng@windriver.com>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Stefan Hajnoczi <stefanha@redhat.com>
> > 
> > Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> > ---
> >  include/hw/qdev-core.h |  1 +
> >  softmmu/memory.c       | 15 +++++++++++++++
> >  softmmu/trace-events   |  1 +
> >  3 files changed, 17 insertions(+)
> > 
> > diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> > index 20d3066595..32f7c779ab 100644
> > --- a/include/hw/qdev-core.h
> > +++ b/include/hw/qdev-core.h
> > @@ -193,6 +193,7 @@ struct DeviceState {
> >      int instance_id_alias;
> >      int alias_required_for_version;
> >      ResettableState reset;
> > +    int engaged_in_direct_io;
> >  };
> >  
> >  struct DeviceListener {
> > diff --git a/softmmu/memory.c b/softmmu/memory.c
> > index 7340e19ff5..255c3c602f 100644
> > --- a/softmmu/memory.c
> > +++ b/softmmu/memory.c
> > @@ -532,6 +532,7 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
> >      uint64_t access_mask;
> >      unsigned access_size;
> >      unsigned i;
> > +    DeviceState *dev = NULL;
> >      MemTxResult r = MEMTX_OK;
> >  
> >      if (!access_size_min) {
> > @@ -541,6 +542,17 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
> >          access_size_max = 4;
> >      }
> >  
> > +    /* Do not allow more than one simultanous access to a device's IO Regions */
> > +    if (mr->owner &&
> > +        !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {
> > +        dev = (DeviceState *) object_dynamic_cast(mr->owner, TYPE_DEVICE);
> > +        if (dev->engaged_in_direct_io) {
> > +            trace_memory_region_reentrant_io(get_cpu_index(), mr, addr, size);
> > +            return MEMTX_ERROR;
> > +        }
> > +        dev->engaged_in_direct_io = true;
> > +    }
> > +
> >      /* FIXME: support unaligned access? */
> >      access_size = MAX(MIN(size, access_size_max), access_size_min);
> >      access_mask = MAKE_64BIT_MASK(0, access_size * 8);
> > @@ -555,6 +567,9 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
> >                          access_mask, attrs);
> >          }
> >      }
> > +    if (dev) {
> > +        dev->engaged_in_direct_io = false;
> > +    }
> >      return r;
> >  }
> >  
> > diff --git a/softmmu/trace-events b/softmmu/trace-events
> > index 9c88887b3c..d7228316db 100644
> > --- a/softmmu/trace-events
> > +++ b/softmmu/trace-events
> > @@ -13,6 +13,7 @@ memory_region_ops_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, u
> >  memory_region_ops_write(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size, const char *name) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u name '%s'"
> >  memory_region_subpage_read(int cpu_index, void *mr, uint64_t offset, uint64_t value, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" value 0x%"PRIx64" size %u"
> >  memory_region_subpage_write(int cpu_index, void *mr, uint64_t offset, uint64_t value, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" value 0x%"PRIx64" size %u"
> > +memory_region_reentrant_io(int cpu_index, void *mr, uint64_t offset, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" size %u"
> >  memory_region_ram_device_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
> >  memory_region_ram_device_write(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
> >  memory_region_sync_dirty(const char *mr, const char *listener, int global) "mr '%s' listener '%s' synced (global=%d)"
> > 
> 

