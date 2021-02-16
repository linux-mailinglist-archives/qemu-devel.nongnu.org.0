Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2804231D04C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 19:36:28 +0100 (CET)
Received: from localhost ([::1]:38120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC5D1-0002Ib-8W
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 13:36:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lC5BF-0000wN-W1
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 13:34:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lC5BD-0008JH-Qe
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 13:34:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613500475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GYgJmUI5DjHOGNh22RNLQeeR1dia/9NiJ4Ft22QMOsQ=;
 b=VR/E4BzxqM+iHAEROQFfmw6cH4gJlFTjpQJLFhB+2KgspxU0HDcCv7SYaVX2zU+nJK6DKs
 S6Wb6G3FoPnhzxeIs3dRUJm1JKUXtb+yPzS4TPjpN6g41pXMAfcbbSsbIqS5YfT3SJMDrR
 uuK24qgNpRpxYGbS4Ln6xfMHWVpVbh0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-JvRxwiGEM96jngQEuoV2Kg-1; Tue, 16 Feb 2021 13:34:32 -0500
X-MC-Unique: JvRxwiGEM96jngQEuoV2Kg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6428010082F5;
 Tue, 16 Feb 2021 18:34:31 +0000 (UTC)
Received: from omen.home.shazbot.org (ovpn-112-255.phx2.redhat.com
 [10.3.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E696C6F452;
 Tue, 16 Feb 2021 18:34:19 +0000 (UTC)
Date: Tue, 16 Feb 2021 11:34:06 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v5 06/11] vfio: Sanity check maximum number of DMA
 mappings with RamDiscardMgr
Message-ID: <20210216113406.470665a5@omen.home.shazbot.org>
In-Reply-To: <20210121110540.33704-7-david@redhat.com>
References: <20210121110540.33704-1-david@redhat.com>
 <20210121110540.33704-7-david@redhat.com>
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

On Thu, 21 Jan 2021 12:05:35 +0100
David Hildenbrand <david@redhat.com> wrote:

> Although RamDiscardMgr can handle running into the maximum number of
> DMA mappings by propagating errors when creating a DMA mapping, we want
> to sanity check and warn the user early that there is a theoretical setup
> issue and that virtio-mem might not be able to provide as much memory
> towards a VM as desired.
> 
> As suggested by Alex, let's use the number of KVM memory slots to guess
> how many other mappings we might see over time.
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
>  hw/vfio/common.c | 43 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)


Acked-by: Alex Williamson <alex.williamson@redhat.com
Reviewed-by: Alex Williamson <alex.williamson@redhat.com>



> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 78be813a53..166ec6ec62 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -761,6 +761,49 @@ static void vfio_register_ram_discard_notifier(VFIOContainer *container,
>                                vfio_ram_discard_notify_discard_all);
>      rdmc->register_listener(rdm, section->mr, &vrdl->listener);
>      QLIST_INSERT_HEAD(&container->vrdl_list, vrdl, next);
> +
> +    /*
> +     * Sanity-check if we have a theoretically problematic setup where we could
> +     * exceed the maximum number of possible DMA mappings over time. We assume
> +     * that each mapped section in the same address space as a RamDiscardMgr
> +     * section consumes exactly one DMA mapping, with the exception of
> +     * RamDiscardMgr sections; i.e., we don't expect to have gIOMMU sections in
> +     * the same address space as RamDiscardMgr sections.
> +     *
> +     * We assume that each section in the address space consumes one memslot.
> +     * We take the number of KVM memory slots as a best guess for the maximum
> +     * number of sections in the address space we could have over time,
> +     * also consuming DMA mappings.
> +     */
> +    if (container->dma_max_mappings) {
> +        unsigned int vrdl_count = 0, vrdl_mappings = 0, max_memslots = 512;
> +
> +#ifdef CONFIG_KVM
> +        if (kvm_enabled()) {
> +            max_memslots = kvm_get_max_memslots();
> +        }
> +#endif
> +
> +        QLIST_FOREACH(vrdl, &container->vrdl_list, next) {
> +            hwaddr start, end;
> +
> +            start = QEMU_ALIGN_DOWN(vrdl->offset_within_address_space,
> +                                    vrdl->granularity);
> +            end = ROUND_UP(vrdl->offset_within_address_space + vrdl->size,
> +                           vrdl->granularity);
> +            vrdl_mappings += (end - start) / vrdl->granularity;
> +            vrdl_count++;
> +        }
> +
> +        if (vrdl_mappings + max_memslots - vrdl_count >
> +            container->dma_max_mappings) {
> +            warn_report("%s: possibly running out of DMA mappings. E.g., try"
> +                        " increasing the 'block-size' of virtio-mem devies."
> +                        " Maximum possible DMA mappings: %d, Maximum possible"
> +                        " memslots: %d", __func__, container->dma_max_mappings,
> +                        max_memslots);
> +        }
> +    }
>  }
>  
>  static void vfio_unregister_ram_discard_listener(VFIOContainer *container,


