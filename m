Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D692CCA89
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 00:29:34 +0100 (CET)
Received: from localhost ([::1]:37028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkbYz-0002lw-GU
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 18:29:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kkbX2-0001SZ-3S
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 18:27:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kkbWx-0005Q4-TT
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 18:27:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606951646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oqrhrD63FRYDjGqtfZfq2JsrgCQHdvQ0SLTmNY1CqI4=;
 b=SdZM5LEOxTGOzBHVX6oV23+1W+rkBL8xz3DWR3SZ2RRpJB1pKQzIF+H3mHZodZRuPXmevo
 NL6KnljCxA0aXUAq8hMYuObqptw2Z/IQHZToJtgtsJ2s5v3zr690zQue6fMGq8ONSMilvh
 ZENEUJsBEQLGHZC2GHDtYkMrJxx+AqY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-SLlnTshdP7-DjNl8n1ZpIQ-1; Wed, 02 Dec 2020 18:27:25 -0500
X-MC-Unique: SLlnTshdP7-DjNl8n1ZpIQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC777107ACF8;
 Wed,  2 Dec 2020 23:27:23 +0000 (UTC)
Received: from w520.home (ovpn-112-10.phx2.redhat.com [10.3.112.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD01019C44;
 Wed,  2 Dec 2020 23:27:07 +0000 (UTC)
Date: Wed, 2 Dec 2020 16:26:33 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 4/9] vfio: Support for RamDiscardMgr in the !vIOMMU case
Message-ID: <20201202162633.27cb15b6@w520.home>
In-Reply-To: <20201119153918.120976-5-david@redhat.com>
References: <20201119153918.120976-1-david@redhat.com>
 <20201119153918.120976-5-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>, Auger Eric <eric.auger@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Luiz Capitulino <lcapitulino@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 19 Nov 2020 16:39:13 +0100
David Hildenbrand <david@redhat.com> wrote:

> Implement support for RamDiscardMgr, to prepare for virtio-mem
> support. Instead of mapping the whole memory section, we only map
> "populated" parts and update the mapping when notified about
> discarding/population of memory via the RamDiscardListener. Similarly, when
> syncing the dirty bitmaps, sync only the actually mapped (populated) parts
> by replaying via the notifier.
> 
> Small mapping granularity is problematic for vfio, because we might run out
> of mappings. Warn to at least make users aware that there is such a
> limitation and that we are dealing with a setup issue e.g., of
> virtio-mem devices.
> 
> Using virtio-mem with vfio is still blocked via
> ram_block_discard_disable()/ram_block_discard_require() after this patch.
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
>  hw/vfio/common.c              | 233 ++++++++++++++++++++++++++++++++++
>  include/hw/vfio/vfio-common.h |  12 ++
>  2 files changed, 245 insertions(+)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index c1fdbf17f2..d52e7356cb 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
...
> +static void vfio_register_ram_discard_notifier(VFIOContainer *container,
> +                                               MemoryRegionSection *section)
> +{
> +    RamDiscardMgr *rdm = memory_region_get_ram_discard_mgr(section->mr);
> +    RamDiscardMgrClass *rdmc = RAM_DISCARD_MGR_GET_CLASS(rdm);
> +    MachineState *ms = MACHINE(qdev_get_machine());
> +    uint64_t suggested_granularity;
> +    VFIORamDiscardListener *vrdl;
> +    int ret;
> +
> +    vrdl = g_new0(VFIORamDiscardListener, 1);
> +    vrdl->container = container;
> +    vrdl->mr = section->mr;
> +    vrdl->offset_within_region = section->offset_within_region;
> +    vrdl->offset_within_address_space = section->offset_within_address_space;
> +    vrdl->size = int128_get64(section->size);
> +    vrdl->granularity = rdmc->get_min_granularity(rdm, section->mr);
> +
> +    /* Ignore some corner cases not relevant in practice. */
> +    g_assert(QEMU_IS_ALIGNED(vrdl->offset_within_region, TARGET_PAGE_SIZE));
> +    g_assert(QEMU_IS_ALIGNED(vrdl->offset_within_address_space,
> +                             TARGET_PAGE_SIZE));
> +    g_assert(QEMU_IS_ALIGNED(vrdl->size, TARGET_PAGE_SIZE));
> +
> +    /*
> +     * We assume initial RAM never has a RamDiscardMgr and that all memory
> +     * to eventually get hotplugged later could be coordinated via a
> +     * RamDiscardMgr ("worst case").
> +     *
> +     * We assume the Linux kernel is configured ("dma_entry_limit") for the
> +     * maximum of 65535 mappings and that we can consume roughly half of that


s/maximum/default/

Deciding we should only use half of it seems arbitrary.


> +     * for this purpose.
> +     *
> +     * In reality, we might also have RAM without a RamDiscardMgr in our device
> +     * memory region and might be able to consume more mappings.
> +     */
> +    suggested_granularity = pow2ceil((ms->maxram_size - ms->ram_size) / 32768);
> +    suggested_granularity = MAX(suggested_granularity, 1 * MiB);
> +    if (vrdl->granularity < suggested_granularity) {
> +        warn_report("%s: eventually problematic mapping granularity (%" PRId64
> +                    " MiB) with coordinated discards (e.g., 'block-size' in"
> +                    " virtio-mem). Suggested minimum granularity: %" PRId64
> +                    " MiB", __func__, vrdl->granularity / MiB,
> +                    suggested_granularity / MiB);
> +    }


Starting w/ kernel 5.10 we have a way to get the instantaneous count of
available DMA mappings, so we could avoid assuming 64k when that's
available (see ex. s390_pci_update_dma_avail()).  Thanks,

Alex


