Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F6C6BF6FE
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 01:39:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdKaU-0000wm-Cw; Fri, 17 Mar 2023 20:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pdKaS-0000wO-FM
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 20:38:20 -0400
Received: from ams.source.kernel.org ([145.40.68.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pdKaQ-00064m-LK
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 20:38:20 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 61469B82743;
 Sat, 18 Mar 2023 00:38:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EEE6C433EF;
 Sat, 18 Mar 2023 00:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679099895;
 bh=fYCkolcIq5ttiT2XygvfAMF3lcbIHcilUkWWt62IQe4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=aK4J5tnFMPpgBWMwjVFaHoGcZd4X/87BeD3/foSMvyHjTdjoQe/k+kBTkoCff2FJU
 hVkH1h7W0ihd9p6CXEGOU1sKGCk0G1PMM+kQz7U7OJ8FdTi2L8GgAZFP5YBZ3Y36Ag
 tlWpReIwJZaQEaAw9sOG2NUTzYgSP8zuunLixqO1OK4LGZHXTY3QWjfbtjWUo8EGZ0
 1wscwRjLEbTWG/CviQsiuB7SoHe8uF3NgvNbjWCzl02aedbmjbsCph+iCZL/y4pArJ
 AgWUyyi63eHwpgHln/kIbiGMSH6K+/DjtKe43+7aU8OnQJAogxvE08WGVufONcwMmy
 5OD4eU3x/oIjg==
Date: Fri, 17 Mar 2023 17:38:10 -0700 (PDT)
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
 Chen Jiqian <Jiqian.Chen@amd.com>
Subject: Re: [RFC QEMU PATCH 13/18] hw/i386/xen/xen-hvm: Introduce
 xen_ram_block_check function
In-Reply-To: <20230312092244.451465-14-ray.huang@amd.com>
Message-ID: <alpine.DEB.2.22.394.2303171735020.3359@ubuntu-linux-20-04-desktop>
References: <20230312092244.451465-1-ray.huang@amd.com>
 <20230312092244.451465-14-ray.huang@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=145.40.68.75; envelope-from=sstabellini@kernel.org;
 helo=ams.source.kernel.org
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
> Introduce xen_ram_block_check function to check whether current ramblock
> is xen ram memory.
> 
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> ---
>  hw/i386/xen/xen-hvm.c | 15 +++++++++++++++
>  include/hw/xen/xen.h  |  1 +
>  2 files changed, 16 insertions(+)
> 
> diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
> index e4293d6d66..a4f12aefce 100644
> --- a/hw/i386/xen/xen-hvm.c
> +++ b/hw/i386/xen/xen-hvm.c
> @@ -32,6 +32,7 @@
>  #include "sysemu/xen.h"
>  #include "sysemu/xen-mapcache.h"
>  #include "trace.h"
> +#include "include/exec/ramblock.h"
>  
>  #include <xen/hvm/ioreq.h>
>  #include <xen/hvm/e820.h>
> @@ -1564,6 +1565,20 @@ void xen_register_framebuffer(MemoryRegion *mr)
>      framebuffer = mr;
>  }
>  
> +bool xen_ram_block_check(RAMBlock *rb)
> +{
> +	bool ret;
> +
> +	if (!rb)
> +		return false;
> +
> +	ret = (rb == ram_memory.ram_block);
> +	if (ret)
> +		rb->offset = 0;

I take that this is needed because there is a ramblock that is
ram_memory but with offset != 0?  So it would fail the block->offset ==
0 check in qemu_ram_ptr_length (which is meant to capture all accesses
to ram_memory, but failing at it)?

If so, would it be possible to just do this instead:


diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index fb412a56e1..3e2640dabd 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2149,7 +2149,7 @@ static void *qemu_ram_ptr_length(RAMBlock *ram_block, ram_addr_t addr,
          * because we don't want to map the entire memory in QEMU.
          * In that case just map the requested area.
          */
-        if (block->offset == 0) {
+        if (block->offset == 0 || block == ram_memory.ram_block) {
             return xen_map_cache(addr, *size, lock, lock);
         }
 


> +	return ret;
> +}
> +
>  void xen_shutdown_fatal_error(const char *fmt, ...)
>  {
>      va_list ap;
> diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
> index afdf9c436a..99a383eb17 100644
> --- a/include/hw/xen/xen.h
> +++ b/include/hw/xen/xen.h
> @@ -31,5 +31,6 @@ qemu_irq *xen_interrupt_controller_init(void);
>  void xenstore_store_pv_console_info(int i, Chardev *chr);
>  
>  void xen_register_framebuffer(struct MemoryRegion *mr);
> +bool xen_ram_block_check(RAMBlock *rb);
>  
>  #endif /* QEMU_HW_XEN_H */
> -- 
> 2.25.1
> 

