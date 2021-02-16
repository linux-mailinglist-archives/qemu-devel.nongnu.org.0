Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B89931D04D
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 19:36:32 +0100 (CET)
Received: from localhost ([::1]:38480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC5D5-0002Rh-L9
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 13:36:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lC5BH-00010L-S3
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 13:34:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lC5BF-0008JM-VY
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 13:34:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613500477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b9nF/1Mw1v1reYLVc00NSBWoTWPZv6cviZTpFQZ7xX4=;
 b=GsY4B9kAyL8QVwpdcWUzH1+roHs2cDJbNO0sIYrpsHpQjTzoR3PDx3cQum4CqzyqhmfYsb
 BGAM/mHMrfFK1pbZK1w0rDvw56EXVSbXThgiJinU9D1NYwL98C+vYByH2lz4rhEbbTjmZp
 BSih76XtJa9fUypHYDoj4LNnFl0cbTE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-d5anyg-XOHKRP5XW4fSszA-1; Tue, 16 Feb 2021 13:34:33 -0500
X-MC-Unique: d5anyg-XOHKRP5XW4fSszA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8345010082F8;
 Tue, 16 Feb 2021 18:34:32 +0000 (UTC)
Received: from omen.home.shazbot.org (ovpn-112-255.phx2.redhat.com
 [10.3.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AEFB670481;
 Tue, 16 Feb 2021 18:34:31 +0000 (UTC)
Date: Tue, 16 Feb 2021 11:34:14 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v5 07/11] vfio: Support for RamDiscardMgr in the vIOMMU
 case
Message-ID: <20210216113414.6cfd089c@omen.home.shazbot.org>
In-Reply-To: <20210121110540.33704-8-david@redhat.com>
References: <20210121110540.33704-1-david@redhat.com>
 <20210121110540.33704-8-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, teawater <teawaterz@linux.alibaba.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 Jan 2021 12:05:36 +0100
David Hildenbrand <david@redhat.com> wrote:

> vIOMMU support works already with RamDiscardMgr as long as guests only
> map populated memory. Both, populated and discarded memory is mapped
> into &address_space_memory, where vfio_get_xlat_addr() will find that
> memory, to create the vfio mapping.
> 
> Sane guests will never map discarded memory (e.g., unplugged memory
> blocks in virtio-mem) into an IOMMU - or keep it mapped into an IOMMU while
> memory is getting discarded. However, there are two cases where a malicious
> guests could trigger pinning of more memory than intended.
> 
> One case is easy to handle: the guest trying to map discarded memory
> into an IOMMU.
> 
> The other case is harder to handle: the guest keeping memory mapped in
> the IOMMU while it is getting discarded. We would have to walk over all
> mappings when discarding memory and identify if any mapping would be a
> violation. Let's keep it simple for now and print a warning, indicating
> that setting RLIMIT_MEMLOCK can mitigate such attacks.
> 
> We have to take care of incoming migration: at the point the
> IOMMUs get restored and start creating mappings in vfio, RamDiscardMgr
> implementations might not be back up and running yet: let's add runstate
> priorities to enforce the order when restoring.
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Auger Eric <eric.auger@redhat.com>
> Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
> Cc: teawater <teawaterz@linux.alibaba.com>
> Cc: Marek Kedzierski <mkedzier@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  hw/vfio/common.c            | 35 +++++++++++++++++++++++++++++++++++


Acked-by: Alex Williamson <alex.williamson@redhat.com>
Reviewed-by: Alex Williamson <alex.williamson@redhat.com>


>  hw/virtio/virtio-mem.c      |  1 +
>  include/migration/vmstate.h |  1 +
>  3 files changed, 37 insertions(+)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 166ec6ec62..15ecd05a4b 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -36,6 +36,7 @@
>  #include "qemu/range.h"
>  #include "sysemu/kvm.h"
>  #include "sysemu/reset.h"
> +#include "sysemu/runstate.h"
>  #include "trace.h"
>  #include "qapi/error.h"
>  #include "migration/migration.h"
> @@ -574,6 +575,40 @@ static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
>          error_report("iommu map to non memory area %"HWADDR_PRIx"",
>                       xlat);
>          return false;
> +    } else if (memory_region_has_ram_discard_mgr(mr)) {
> +        RamDiscardMgr *rdm = memory_region_get_ram_discard_mgr(mr);
> +        RamDiscardMgrClass *rdmc = RAM_DISCARD_MGR_GET_CLASS(rdm);
> +
> +        /*
> +         * Malicious VMs can map memory into the IOMMU, which is expected
> +         * to remain discarded. vfio will pin all pages, populating memory.
> +         * Disallow that. vmstate priorities make sure any RamDiscardMgr were
> +         * already restored before IOMMUs are restored.
> +         */
> +        if (!rdmc->is_populated(rdm, mr, xlat, len)) {
> +            error_report("iommu map to discarded memory (e.g., unplugged via"
> +                         " virtio-mem): %"HWADDR_PRIx"",
> +                         iotlb->translated_addr);
> +            return false;
> +        }
> +
> +        /*
> +         * Malicious VMs might trigger discarding of IOMMU-mapped memory. The
> +         * pages will remain pinned inside vfio until unmapped, resulting in a
> +         * higher memory consumption than expected. If memory would get
> +         * populated again later, there would be an inconsistency between pages
> +         * pinned by vfio and pages seen by QEMU. This is the case until
> +         * unmapped from the IOMMU (e.g., during device reset).
> +         *
> +         * With malicious guests, we really only care about pinning more memory
> +         * than expected. RLIMIT_MEMLOCK set for the user/process can never be
> +         * exceeded and can be used to mitigate this problem.
> +         */
> +        warn_report_once("Using vfio with vIOMMUs and coordinated discarding of"
> +                         " RAM (e.g., virtio-mem) works, however, malicious"
> +                         " guests can trigger pinning of more memory than"
> +                         " intended via an IOMMU. It's possible to mitigate "
> +                         " by setting/adjusting RLIMIT_MEMLOCK.");
>      }
>  
>      /*
> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> index 6200813bb8..f419a758f3 100644
> --- a/hw/virtio/virtio-mem.c
> +++ b/hw/virtio/virtio-mem.c
> @@ -871,6 +871,7 @@ static const VMStateDescription vmstate_virtio_mem_device = {
>      .name = "virtio-mem-device",
>      .minimum_version_id = 1,
>      .version_id = 1,
> +    .priority = MIG_PRI_VIRTIO_MEM,
>      .post_load = virtio_mem_post_load,
>      .fields = (VMStateField[]) {
>          VMSTATE_WITH_TMP(VirtIOMEM, VirtIOMEMMigSanityChecks,
> diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> index 075ee80096..3bf58ff043 100644
> --- a/include/migration/vmstate.h
> +++ b/include/migration/vmstate.h
> @@ -153,6 +153,7 @@ typedef enum {
>      MIG_PRI_DEFAULT = 0,
>      MIG_PRI_IOMMU,              /* Must happen before PCI devices */
>      MIG_PRI_PCI_BUS,            /* Must happen before IOMMU */
> +    MIG_PRI_VIRTIO_MEM,         /* Must happen before IOMMU */
>      MIG_PRI_GICV3_ITS,          /* Must happen before PCI devices */
>      MIG_PRI_GICV3,              /* Must happen before the ITS */
>      MIG_PRI_MAX,


