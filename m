Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFEC1F3742
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jun 2020 11:50:57 +0200 (CEST)
Received: from localhost ([::1]:59438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jiauG-0000kh-4Y
	for lists+qemu-devel@lfdr.de; Tue, 09 Jun 2020 05:50:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jiat8-0008Hh-3s; Tue, 09 Jun 2020 05:49:46 -0400
Received: from charlie.dont.surf ([128.199.63.193]:39374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jiat7-0004rq-9x; Tue, 09 Jun 2020 05:49:45 -0400
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 73380BF5B8;
 Tue,  9 Jun 2020 09:49:43 +0000 (UTC)
Date: Tue, 9 Jun 2020 11:49:39 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Andrzej Jakowski <andrzej.jakowski@linux.intel.com>
Subject: Re: [PATCH v1 2/2] nvme: allow cmb and pmr to be enabled on same
 device
Message-ID: <20200609094939.o5vbpvvuoren4u2e@apples.localdomain>
References: <20200605181043.28782-1-andrzej.jakowski@linux.intel.com>
 <20200605181043.28782-3-andrzej.jakowski@linux.intel.com>
 <20200608080750.ahze6ez3gvhginq7@apples.localdomain>
 <c4c6eb4b-ed35-951c-0b00-079070638445@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c4c6eb4b-ed35-951c-0b00-079070638445@linux.intel.com>
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 05:45:20
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: kbusch@kernel.org, kwolf@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Jun  8 12:44, Andrzej Jakowski wrote:
> On 6/8/20 1:08 AM, Klaus Jensen wrote:
> > On Jun  5 11:10, Andrzej Jakowski wrote:
> >> So far it was not possible to have CMB and PMR emulated on the same
> >> device, because BAR2 was used exclusively either of PMR or CMB. This
> >> patch places CMB at BAR4 offset so it not conflicts with MSI-X vectors.
> >>
> > 
> > Hi Andrzej,
> > 
> > Thanks for doing this, it's a nice addition!
> > 
> > Though, I would prefer that the table and pba was located in BAR0 and
> > keeping BAR4 for exclusive CMB use. I'm no expert on this, but is it ok
> > to have the table and pba in prefetchable memory? Having it "together"
> > with the other controller-level configuration memory just feels more
> > natural to me, but I'm not gonna put my foot down.
> Hi Klaus,
> 
> Thx for your feedback!
> I don't think it matters if MSIX table is in prefetchable vs 
> non-prefetchable memory. 
> My understanding is that spec allows MSIX and PBA to be in any BAR and
> offset. I understand your preference and at the same time think that
> since it is not in violation of the spec why don't we leave it as-is?
> Does anybody know what's typical approach for real devices?

On the SSD in my system, lspci -vv shows:

        Capabilities: [b0] MSI-X: Enable+ Count=33 Masked-
                Vector table: BAR=0 offset=00002000
                PBA: BAR=4 offset=00000000

So, the table is in BAR0 but the PBA is in BAR4. Oh well.

> >> @@ -1342,6 +1346,71 @@ static const MemoryRegionOps nvme_cmb_ops = {
> >>      },
> >>  };
> >>  
> >> +#define NVME_MSIX_BIR (4)
> >> +static void nvme_bar4_init(PCIDevice *pci_dev)
> >> +{
> >> +    NvmeCtrl *n = NVME(pci_dev);
> >> +    int status;
> >> +    uint64_t bar_size = 4096;
> >> +    uint32_t nvme_pba_offset = bar_size / 2;
> >> +    uint32_t nvme_pba_size = QEMU_ALIGN_UP(n->num_queues, 64) / 8;
> >> +    uint32_t cmb_size_units;
> >> +
> >> +    if (n->num_queues * PCI_MSIX_ENTRY_SIZE > nvme_pba_offset) {
> >> +        nvme_pba_offset = n->num_queues * PCI_MSIX_ENTRY_SIZE;
> >> +    }
> >> +
> >> +    if (nvme_pba_offset + nvme_pba_size > 4096) {
> >> +        bar_size = nvme_pba_offset + nvme_pba_size;
> >> +    }
> >> +
> > 
> > This is migration compatibility stuff that is not needed because the
> > nvme device is unmigratable anyway.
> I don't understand that comment. Could you please explain more?
>  
> 

It looks like you cribbed this code from msix_init_exclusive_bar(). All
that fuzz about the PBA starting in the upper half (nvme_pba_offset =
bar_size / 2) for nentries lower or equal to 128 is for migration
compatibility (migrating a VM from an old version of QEMU to a newer
one). It is something that was added when the location of the msix table
and pba became dynamic (it used to be static). But, since the nvme
device is marked as unmigratable (VMStateDescription.unmigratable = 1),
I believe these special cases are irrelevant.

