Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A319498517
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 17:44:56 +0100 (CET)
Received: from localhost ([::1]:49970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC2Sd-000532-2g
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 11:44:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1nC2Rf-0003j2-4n
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 11:43:56 -0500
Received: from [2604:1380:4601:e00::1] (port=40282 helo=ams.source.kernel.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1nC2Rb-0002bb-U9
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 11:43:53 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 75942B810FD;
 Mon, 24 Jan 2022 16:43:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5AB9C340E5;
 Mon, 24 Jan 2022 16:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643042614;
 bh=HrREaWHY3DAyMl8U0orzrUtiJHYyNjPRzbvbk1rj2q0=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=jQdMME0snRbZyOSTP63GJkb3b+Adk8Nuj9w5yvdMa9HcYBa5FhuvVrezbZFU7YK+j
 UlG9Se0mNWIy1F9+7fRCJVcPAvBjCbT47Ku2Hj7DGSyvasUhs21yK6goG65mEDkaGV
 YA36KTyxQ03J3KvDDeBi7B3eN9nA2ZQxdWJie5hGt8smHcwp6RbbXZIdmpF+C6SJe+
 r9f5R3a7kMB5UY5jgLSur2hdI/0nlIouHs5d0EHxZNQgZjSUS7wqd+UusLV2jm2X1I
 qBxPemyPjUotwsd2krbd6SO/lB8bobq4D7PgtE4qaZWVAkGGjSsjmobd8YvDUyEMVu
 /Qbufae9Y4CRg==
Date: Mon, 24 Jan 2022 08:43:32 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH v2] xen-mapcache: Avoid entry->lock overflow
In-Reply-To: <20220124104450.152481-1-ross.lagerwall@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2201240843130.27308@ubuntu-linux-20-04-desktop>
References: <20220124104450.152481-1-ross.lagerwall@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2604:1380:4601:e00::1
 (failed)
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=sstabellini@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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

On Mon, 24 Jan 2022, Ross Lagerwall wrote:
> In some cases, a particular mapcache entry may be mapped 256 times
> causing the lock field to wrap to 0. For example, this may happen when
> using emulated NVME and the guest submits a large scatter-gather write.
> At this point, the entry map be remapped causing QEMU to write the wrong
> data or crash (since remap is not atomic).
> 
> Avoid this overflow by increasing the lock field to a uint32_t and also
> detect it and abort rather than continuing regardless.
> 
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2: Change type to uint32_t since there is a hole there
> anyway. The struct size remains at 48 bytes on x86_64.
> 
>  hw/i386/xen/xen-mapcache.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i386/xen/xen-mapcache.c b/hw/i386/xen/xen-mapcache.c
> index bd47c3d672..f2ef977963 100644
> --- a/hw/i386/xen/xen-mapcache.c
> +++ b/hw/i386/xen/xen-mapcache.c
> @@ -52,7 +52,7 @@ typedef struct MapCacheEntry {
>      hwaddr paddr_index;
>      uint8_t *vaddr_base;
>      unsigned long *valid_mapping;
> -    uint8_t lock;
> +    uint32_t lock;
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
> +        }
>          reventry->dma = dma;
>          reventry->vaddr_req = mapcache->last_entry->vaddr_base + address_offset;
>          reventry->paddr_index = mapcache->last_entry->paddr_index;
> -- 
> 2.27.0
> 

