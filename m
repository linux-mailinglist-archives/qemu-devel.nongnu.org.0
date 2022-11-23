Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6956360FE
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 15:03:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxqKA-000598-LS; Wed, 23 Nov 2022 09:02:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@jedlik.phy.bme.hu>)
 id 1oxqK4-00058X-Fz
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 09:01:56 -0500
Received: from jedlik.phy.bme.hu ([152.66.102.83])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@jedlik.phy.bme.hu>)
 id 1oxqK1-0007hI-Us
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 09:01:56 -0500
Received: by jedlik.phy.bme.hu (Postfix, from userid 1000)
 id BD1D4A011E; Wed, 23 Nov 2022 14:51:49 +0100 (CET)
Date: Wed, 23 Nov 2022 14:51:49 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Markus Armbruster <armbru@redhat.com>
cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v2] Drop more useless casts from void * to pointer
In-Reply-To: <20221123133811.1398562-1-armbru@redhat.com>
Message-ID: <alpine.LMD.2.03.2211231441480.26886@eik.bme.hu>
References: <20221123133811.1398562-1-armbru@redhat.com>
User-Agent: Alpine 2.03 (LMD 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Received-SPF: none client-ip=152.66.102.83;
 envelope-from=balaton@jedlik.phy.bme.hu; helo=jedlik.phy.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

On Wed, 23 Nov 2022, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> ---
> v2:
> * PATCH 1+2 merged as commit 0a553c12c7 and 3f7febc937
> * PATCH 3 change to util/coroutine-ucontext.c dropped [Laurent]
>
> bsd-user/elfload.c                      | 2 +-
> contrib/plugins/cache.c                 | 8 ++++----
> contrib/vhost-user-blk/vhost-user-blk.c | 2 +-
> hw/core/qdev-clock.c                    | 2 +-
> hw/hyperv/vmbus.c                       | 2 +-
> hw/net/cadence_gem.c                    | 2 +-
> hw/net/virtio-net.c                     | 2 +-
> hw/nvme/ctrl.c                          | 4 ++--
> hw/rdma/vmw/pvrdma_cmd.c                | 9 +++------
> hw/rdma/vmw/pvrdma_qp_ops.c             | 6 +++---
> hw/virtio/virtio-iommu.c                | 3 +--
> linux-user/syscall.c                    | 2 +-
> target/i386/hax/hax-all.c               | 2 +-
> tests/tcg/aarch64/system/semiheap.c     | 4 ++--
> util/vfio-helpers.c                     | 2 +-
> 15 files changed, 24 insertions(+), 28 deletions(-)
>
> diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
> index f8edb22f2a..fbcdc94b96 100644
> --- a/bsd-user/elfload.c
> +++ b/bsd-user/elfload.c
> @@ -156,7 +156,7 @@ static abi_ulong copy_elf_strings(int argc, char **argv, void **page,
>             --p; --tmp; --len;
>             if (--offset < 0) {
>                 offset = p % TARGET_PAGE_SIZE;
> -                pag = (char *)page[p / TARGET_PAGE_SIZE];
> +                pag = page[p / TARGET_PAGE_SIZE];

I think arithmetic on void pointer was undefined at least in the past so 
some compilers may warn for it but not sure if this is still the case for 
the compilers we care about. Apparently not if this now compiles but that 
explains why this cast was not useless. Found some more info on this here:

https://stackoverflow.com/questions/3523145/pointer-arithmetic-for-void-pointer-in-c

Regards,
BALATON Zoltan

