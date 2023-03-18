Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C245C6BF6F3
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 01:33:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdKUB-0007HE-6M; Fri, 17 Mar 2023 20:31:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pdKU8-0007Gy-HB
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 20:31:48 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pdKU6-00048a-Rx
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 20:31:48 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0624060C8E;
 Sat, 18 Mar 2023 00:31:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5DEDC433D2;
 Sat, 18 Mar 2023 00:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679099493;
 bh=DBSUpqHFxRsGHOAqc/0x27DXPhRxpRQpYIOQSUw/imc=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=YrME8qNBHwf1Gxmu7UWYr3sR5T+hEu/K/0WBBKBPI2d1rbt15NG0r+45amqlvs39I
 8Z/NGTyGFFQlSngcoehkJGACpinyfbLMAwcH12GuqUcVisBOjW7Gg3yqKcIVQzHlFx
 BqOOVNy7smILe49E+0FvX73Cmj97MGLLR5kjkZwMBVnyWs4fnqjW36F/dXz+d7y0wP
 92wHHLh3cSXo0pGnUZQZ0YAc5iU4i/nXJkqWTg95Opp7Y6iNIn66TyCgvb27oc8j8F
 sb/Tm9BZZLZflE+jwibKSBibCUDlxIQ8HZHxaLjR8U63cTrg5+9c+7lKjOjTBt9Ovw
 Fj4prNdT6Amxg==
Date: Fri, 17 Mar 2023 17:31:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Huang Rui <ray.huang@amd.com>
cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Anthony PERARD <anthony.perard@citrix.com>, 
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Jan Beulich <jbeulich@suse.com>, 
 Antonio Caggiano <antonio.caggiano@collabora.com>, 
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, 
 Robert Beckett <bob.beckett@collabora.com>, qemu-devel@nongnu.org, 
 xen-devel@lists.xenproject.org, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>, 
 Xenia Ragiadakou <burzalodowa@gmail.com>, 
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>, 
 Chen Jiqian <Jiqian.Chen@amd.com>, Xenia.Ragiadakou@amd.com
Subject: Re: [RFC QEMU PATCH 12/18] softmmu: Fix the size to map cache with
 xen for host virtual address
In-Reply-To: <20230312092244.451465-13-ray.huang@amd.com>
Message-ID: <alpine.DEB.2.22.394.2303171626541.3359@ubuntu-linux-20-04-desktop>
References: <20230312092244.451465-1-ray.huang@amd.com>
 <20230312092244.451465-13-ray.huang@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=sstabellini@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, 12 Mar 2023, Huang Rui wrote:
> The xen_map_cache function wants to pass offset and size of this memory
> block as the input parameters to map the host virtual address. However,
> block->offset is too large as 0x100000000 (4G), if we assign the size as
> block->max_length (0x110000000), the mapped host address will be out of
> block->max_length and easy to overflow.

Hi Ray,

Is this patch still required after all the other fixes?

If it is required, where is the overflow that it is trying to prevent?
Is it a failure in the hypercall mapping the memory to QEMU
(hw/i386/xen/xen-mapcache.c:xen_remap_bucket) ?


> We have to assign the size as
> (block->max_length - block->offset), then that is able to ensure the
> address will be located in legal range inside of max_length.
>
> {rcu = {next = 0x0, func = 0x0}, mr = 0x55555681b620, host = 0x0,
> colo_cache = 0x0, offset = 0x100000000, used_length = 0x110000000,
> max_length = 0x110000000, resized = 0x0, flags = 0x10, idstr = {0x78,
> 0x65, 0x6e, 0x2e, 0x72, 0x61, 0x6d, 0x0 <repeats 249 times>}, next = {
>     le_next = 0x5555568c61b0, le_prev = 0x55555681c640},
> ramblock_notifiers = {lh_first = 0x0}, fd = 0xffffffff, page_size =
> 0x1000, bmap = 0x0, receivedmap = 0x0, clear_bmap = 0x0,
> clear_bmap_shift = 0x0, postcopy_length = 0x0}
> 
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> ---
>  softmmu/physmem.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 1b606a3002..1b0bb35da9 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -2304,7 +2304,7 @@ void *qemu_map_ram_ptr(RAMBlock *ram_block, ram_addr_t addr)
>              return xen_map_cache(addr, 0, 0, false);
>          }
>  
> -        block->host = xen_map_cache(block->offset, block->max_length, 1, false);
> +	block->host = xen_map_cache(block->offset, block->max_length, 1, false);

Coding style: indentation is 4 spaces. In any case, this looks like a
spurious change?


>      }
>      return ramblock_ptr(block, addr);
>  }
> @@ -2337,7 +2337,8 @@ static void *qemu_ram_ptr_length(RAMBlock *ram_block, ram_addr_t addr,
>              return xen_map_cache(addr, *size, lock, lock);
>          }
>  
> -        block->host = xen_map_cache(block->offset, block->max_length, 1, lock);
> +	block->host = xen_map_cache(block->offset,
> +				    block->max_length - block->offset, 1, lock);
>      }
>      return ramblock_ptr(block, addr);


block->offset is the address of the beginning of the block, and
block->max_length is the size. Here the behavior is theoretically
correct: if block->host is not set (not mapped in QEMU yet), then call
xen_map_cache to map the entire block from beginning to end, setting
block->host with a pointer to the beginning of the mapped area in QEMU.
From that point onward, ramblock_ptr() will then behave correctly.

Of course if xen_map_cache fails to map the entire region at once
because it is too large or other error, then we have a big problem.

But I think in that case this patch would still cause issues. In this
example offset (start of the ramblock) is 0x100000000, and max_length
(size of the ramblock) is 0x110000000. So with this change we are
mapping 0x110000000-0x100000000 = 0x10000000 which is only the first
256MB of the region which is more than 4GB.

What happens the next time qemu_ram_ptr_length is called for an address
above the first 256MB? It will break because block->host != NULL so the
function will behave as if the entire ramblock is mapped in QEMU while
it is not (only the first 256MB are). ramblock_ptr will return
block->host + something-more-than-256MB which is actually invalid.


I think we would need more something along this line where we fall back
to temporary mappings of a smaller region if we can't map it all at once.
MAX_SIZE would be the max size where a single mapping still succeeds,
maybe 4GB?

        if (block->offset == 0 || block->max_length > MAX_SIZE) {
            return xen_map_cache(addr, *size, lock, lock);
        }


Otherwise, maybe the error could be due to max_length being incorrect to
begin with?

