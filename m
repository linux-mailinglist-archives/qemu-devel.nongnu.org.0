Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D16C8496772
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 22:41:06 +0100 (CET)
Received: from localhost ([::1]:47102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB1eb-0003Zh-EW
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 16:41:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1nB1Ej-0007iG-VT
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 16:14:22 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:37510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1nB1Ei-0000fw-50
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 16:14:21 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A912161800;
 Fri, 21 Jan 2022 21:14:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 736CAC340E2;
 Fri, 21 Jan 2022 21:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642799651;
 bh=zoztyVQaXvxc3hMVc6n/GFYezsl3xm4XPka3UtTcfKM=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=pf33FMltCFx3UZ/6L7wLb45lmtZebp4iiVKx6zgObthgT7/9rfJJUKZ5oIgHB5R5u
 7/LRC7QuNiUmmtPvTbfIFiXJRh9fXhAUdYjfZYE4kXm4urlHDx9C0EmWb1pbMEtAEg
 7yNhI6psISuP7W3I0UB8+y+G6Vjck4rWm2MvqVnYIw83nDn3u8D6cCoBNsgGVyblke
 x3QeChIHIzXavLaE8KvGesD6Vm2ZVYkuaea5pyBraCp+zLnX6RueGthbmB7utjV4eC
 4rPjHTje4fenkW5HjdmCbEjvF7Pi15zXI0+eFrXGox9H7rkrgKpH5vHNLOenK8xqVo
 Tk6dyFPVl2GVQ==
Date: Fri, 21 Jan 2022 13:14:10 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH] xen-mapcache: Avoid entry->lock overflow
In-Reply-To: <20220121173329.904412-1-ross.lagerwall@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2201211308400.27308@ubuntu-linux-20-04-desktop>
References: <20220121173329.904412-1-ross.lagerwall@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=sstabellini@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Igor Druzhinin <igor.druzhinin@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 21 Jan 2022, Ross Lagerwall wrote:
> In some cases, a particular mapcache entry may be mapped 256 times
> causing the lock field to wrap to 0. For example, this may happen when
> using emulated NVME and the guest submits a large scatter-gather write.
> At this point, the entry map be remapped causing QEMU to write the wrong
> data or crash (since remap is not atomic).
> 
> Avoid this overflow by increasing the lock field to a uint16_t and also
> detect it and abort rather than continuing regardless.

Nice catch!


> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---
>  hw/i386/xen/xen-mapcache.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i386/xen/xen-mapcache.c b/hw/i386/xen/xen-mapcache.c
> index bd47c3d672..82dc495a60 100644
> --- a/hw/i386/xen/xen-mapcache.c
> +++ b/hw/i386/xen/xen-mapcache.c
> @@ -52,7 +52,7 @@ typedef struct MapCacheEntry {
>      hwaddr paddr_index;
>      uint8_t *vaddr_base;
>      unsigned long *valid_mapping;
> -    uint8_t lock;
> +    uint16_t lock;

As struct MapCacheEntry is not packed, we might as well switch to
uint32_t as it doesn't make a difference.


>  #define XEN_MAPCACHE_ENTRY_DUMMY (1 << 0)
>      uint8_t flags;
>      hwaddr size;
> @@ -355,6 +355,12 @@ tryagain:
>      if (lock) {
>          MapCacheRev *reventry = g_malloc0(sizeof(MapCacheRev));
>          entry->lock++;
> +        if (entry->lock == 0) {
> +            fprintf(stderr,
> +                    "mapcache entry lock overflow: "TARGET_FMT_plx" -> %p\n",
> +                    entry->paddr_index, entry->vaddr_base);
> +            abort();

I was going to suggest that it might be better to return NULL and let
the caller handle the failure but it looks like the caller *cannot*
handle the failure.


> +        }
>          reventry->dma = dma;
>          reventry->vaddr_req = mapcache->last_entry->vaddr_base + address_offset;
>          reventry->paddr_index = mapcache->last_entry->paddr_index;
> -- 
> 2.27.0
> 

