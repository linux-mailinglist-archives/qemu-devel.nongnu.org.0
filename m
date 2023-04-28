Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 208426F130F
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 10:13:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psJDQ-0007dS-DT; Fri, 28 Apr 2023 04:12:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1psJDP-0007dK-2S
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 04:12:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1psJDM-0006cm-H0
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 04:12:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682669543;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=CSqY5HN9WxLAMunnjRVGKFcyvGgh8uRFt+SUEsikjzk=;
 b=Ty4Hv6oKw+8rDhBOHNrl1kjy/lX6yODabILa7+KPEriTGj7ElNveA1/vvmktSEo8Lmtfvh
 6MTb7+ZjbbhC/IgWbnOG/twiMLHvBkM00J/V1Covqd/hE0XxNdPTlfvOByjerL6CRlEzkB
 vrs37ANyYvLxhMtJdop2uVBhXIEhu9U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-82-93TvBz07ODOOQfw2pPn6Vg-1; Fri, 28 Apr 2023 04:12:20 -0400
X-MC-Unique: 93TvBz07ODOOQfw2pPn6Vg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F58A88B7AE;
 Fri, 28 Apr 2023 08:12:19 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B4E49492C13;
 Fri, 28 Apr 2023 08:12:15 +0000 (UTC)
Date: Fri, 28 Apr 2023 09:12:13 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alexander Bulekov <alxndr@bu.edu>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jon Maloy <jmaloy@redhat.com>, Siqi Chen <coc.cyqh@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: [PATCH v10 1/8] memory: prevent dma-reentracy issues
Message-ID: <ZEt/3RwtL/jePTTv@redhat.com>
References: <20230427211013.2994127-1-alxndr@bu.edu>
 <20230427211013.2994127-2-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230427211013.2994127-2-alxndr@bu.edu>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Apr 27, 2023 at 05:10:06PM -0400, Alexander Bulekov wrote:
> Add a flag to the DeviceState, when a device is engaged in PIO/MMIO/DMA.
> This flag is set/checked prior to calling a device's MemoryRegion
> handlers, and set when device code initiates DMA.  The purpose of this
> flag is to prevent two types of DMA-based reentrancy issues:
> 
> 1.) mmio -> dma -> mmio case
> 2.) bh -> dma write -> mmio case
> 
> These issues have led to problems such as stack-exhaustion and
> use-after-frees.
> 
> Summary of the problem from Peter Maydell:
> https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae5KcknhPRD5fPBZA@mail.gmail.com
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/62
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/540
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/541
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/556
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/557
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/827
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1282
> Resolves: CVE-2023-0330
> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>  include/exec/memory.h  |  5 +++++
>  include/hw/qdev-core.h |  7 +++++++
>  softmmu/memory.c       | 16 ++++++++++++++++
>  3 files changed, 28 insertions(+)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 15ade918ba..e45ce6061f 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -767,6 +767,8 @@ struct MemoryRegion {
>      bool is_iommu;
>      RAMBlock *ram_block;
>      Object *owner;
> +    /* owner as TYPE_DEVICE. Used for re-entrancy checks in MR access hotpath */
> +    DeviceState *dev;
>  
>      const MemoryRegionOps *ops;
>      void *opaque;
> @@ -791,6 +793,9 @@ struct MemoryRegion {
>      unsigned ioeventfd_nb;
>      MemoryRegionIoeventfd *ioeventfds;
>      RamDiscardManager *rdm; /* Only for RAM */
> +
> +    /* For devices designed to perform re-entrant IO into their own IO MRs */
> +    bool disable_reentrancy_guard;
>  };
>  
>  struct IOMMUMemoryRegion {
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index bd50ad5ee1..7623703943 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -162,6 +162,10 @@ struct NamedClockList {
>      QLIST_ENTRY(NamedClockList) node;
>  };
>  
> +typedef struct {
> +    bool engaged_in_io;
> +} MemReentrancyGuard;
> +
>  /**
>   * DeviceState:
>   * @realized: Indicates whether the device has been fully constructed.
> @@ -194,6 +198,9 @@ struct DeviceState {
>      int alias_required_for_version;
>      ResettableState reset;
>      GSList *unplug_blockers;
> +
> +    /* Is the device currently in mmio/pio/dma? Used to prevent re-entrancy */
> +    MemReentrancyGuard mem_reentrancy_guard;
>  };
>  
>  struct DeviceListener {
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index b1a6cae6f5..fe23f0e5ce 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -542,6 +542,18 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
>          access_size_max = 4;
>      }
>  
> +    /* Do not allow more than one simultaneous access to a device's IO Regions */
> +    if (mr->dev && !mr->disable_reentrancy_guard &&
> +        !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {
> +        if (mr->dev->mem_reentrancy_guard.engaged_in_io) {
> +            warn_report("Blocked re-entrant IO on "
> +                    "MemoryRegion: %s at addr: 0x%" HWADDR_PRIX,
> +                    memory_region_name(mr), addr);
> +            return MEMTX_ACCESS_ERROR;

If we issue this warn_report on every invalid memory access, is this
going to become a denial of service by flooding logs, or is the
return MEMTX_ACCESS_ERROR, sufficient to ensure this is only printed
*once* in the lifetime of the QEMU process ?


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


