Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3DD1F1429
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jun 2020 10:09:17 +0200 (CEST)
Received: from localhost ([::1]:42542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jiCqK-0007ac-R8
	for lists+qemu-devel@lfdr.de; Mon, 08 Jun 2020 04:09:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jiCpK-0006yf-3R; Mon, 08 Jun 2020 04:08:14 -0400
Received: from charlie.dont.surf ([128.199.63.193]:37400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jiCpI-0004TT-Fj; Mon, 08 Jun 2020 04:08:13 -0400
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 0A963BF5B9;
 Mon,  8 Jun 2020 08:08:07 +0000 (UTC)
Date: Mon, 8 Jun 2020 10:08:00 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Andrzej Jakowski <andrzej.jakowski@linux.intel.com>
Subject: Re: [PATCH v1 2/2] nvme: allow cmb and pmr to be enabled on same
 device
Message-ID: <20200608080750.ahze6ez3gvhginq7@apples.localdomain>
References: <20200605181043.28782-1-andrzej.jakowski@linux.intel.com>
 <20200605181043.28782-3-andrzej.jakowski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200605181043.28782-3-andrzej.jakowski@linux.intel.com>
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 04:08:08
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

On Jun  5 11:10, Andrzej Jakowski wrote:
> So far it was not possible to have CMB and PMR emulated on the same
> device, because BAR2 was used exclusively either of PMR or CMB. This
> patch places CMB at BAR4 offset so it not conflicts with MSI-X vectors.
> 

Hi Andrzej,

Thanks for doing this, it's a nice addition!

Though, I would prefer that the table and pba was located in BAR0 and
keeping BAR4 for exclusive CMB use. I'm no expert on this, but is it ok
to have the table and pba in prefetchable memory? Having it "together"
with the other controller-level configuration memory just feels more
natural to me, but I'm not gonna put my foot down.

Using BAR0 would also slightly simplify the patch since no changes would
be required for the CMB path.

Also, can you rebase this on Kevin's block branch? There are a bunch of
refactoring patches that changes the realization code, so this patch
doesn't apply at all.

> Signed-off-by: Andrzej Jakowski <andrzej.jakowski@linux.intel.com>
> ---
>  hw/block/nvme.c      | 127 +++++++++++++++++++++++++++++--------------
>  hw/block/nvme.h      |   3 +-
>  include/block/nvme.h |   4 +-
>  3 files changed, 91 insertions(+), 43 deletions(-)
> 
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index f0b45704be..353cf20e0a 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -22,12 +22,12 @@
>   *              [pmrdev=<mem_backend_file_id>,] \
>   *              num_queues=<N[optional]>
>   *
> - * Note cmb_size_mb denotes size of CMB in MB. CMB is assumed to be at
> - * offset 0 in BAR2 and supports only WDS, RDS and SQS for now.
> + * Note cmb_size_mb denotes size of CMB in MB. CMB when configured is assumed
> + * to be resident in BAR4 at certain offset - this is because BAR4 is also
> + * used for storing MSI-X table that is available at offset 0 in BAR4.
>   *
> - * cmb_size_mb= and pmrdev= options are mutually exclusive due to limitation
> - * in available BAR's. cmb_size_mb= will take precedence over pmrdev= when
> - * both provided.
> + * pmrdev is assumed to be resident in BAR2. When configured it consumes whole
> + * BAR2 exclusively.

Actually it uses both BAR2 and BAR3 since its 64 bits.

> @@ -1342,6 +1346,71 @@ static const MemoryRegionOps nvme_cmb_ops = {
>      },
>  };
>  
> +#define NVME_MSIX_BIR (4)
> +static void nvme_bar4_init(PCIDevice *pci_dev)
> +{
> +    NvmeCtrl *n = NVME(pci_dev);
> +    int status;
> +    uint64_t bar_size = 4096;
> +    uint32_t nvme_pba_offset = bar_size / 2;
> +    uint32_t nvme_pba_size = QEMU_ALIGN_UP(n->num_queues, 64) / 8;
> +    uint32_t cmb_size_units;
> +
> +    if (n->num_queues * PCI_MSIX_ENTRY_SIZE > nvme_pba_offset) {
> +        nvme_pba_offset = n->num_queues * PCI_MSIX_ENTRY_SIZE;
> +    }
> +
> +    if (nvme_pba_offset + nvme_pba_size > 4096) {
> +        bar_size = nvme_pba_offset + nvme_pba_size;
> +    }
> +

This is migration compatibility stuff that is not needed because the
nvme device is unmigratable anyway.


