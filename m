Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 534E040AC47
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 13:17:10 +0200 (CEST)
Received: from localhost ([::1]:35380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ6R2-0005MN-TV
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 07:17:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mQ6Q2-0004he-MC
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 07:16:06 -0400
Received: from relay68.bu.edu ([128.197.228.73]:41480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mQ6O5-0007tA-KU
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 07:16:05 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 18EBCidM013050
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 14 Sep 2021 07:12:47 -0400
Date: Tue, 14 Sep 2021 07:12:44 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] hw/virtio: Update vring after modifying its queue size
Message-ID: <20210914111244.j3hcntzwz7g43coj@mozz.bu.edu>
References: <20210825224256.1750286-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210825224256.1750286-1-philmd@redhat.com>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 qemu-devel@nongnu.org, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210826 0042, Philippe Mathieu-Daudé wrote:
> When a ring queue size is modified, we need to call
> virtio_queue_update_rings() to re-init the memory region
> caches. Otherwise the region might have outdated memory
> size, and later load/store access might trigger an
> assertion, such:
> 
>   qemu-system-i386: include/exec/memory_ldst_cached.h.inc:30: uint16_t address_space_lduw_le_cached(MemoryRegionCache *, hwaddr, MemTxAttrs, MemTxResult *):
>   Assertion `addr < cache->len && 2 <= cache->len - addr' failed.
>   Thread 1 "qemu-system-i38" received signal SIGABRT, Aborted.
>   0x00007ffff4d312a2 in raise () from /lib64/libc.so.6
>   (gdb) bt
>   #1  0x00007ffff4d1a8a4 in abort () at /lib64/libc.so.6
>   #4  0x0000555558f2b8ec in address_space_lduw_le_cached (cache=0x61300010a7c0, addr=134, attrs=..., result=0x0) at include/exec/memory_ldst_cached.h.inc:30
>   #5  0x0000555558f2ac6b in lduw_le_phys_cached (cache=0x61300010a7c0, addr=134) at include/exec/memory_ldst_phys.h.inc:67
>   #6  0x0000555558f2a3cd in virtio_lduw_phys_cached (vdev=0x62d00003a680, cache=0x61300010a7c0, pa=134) at include/hw/virtio/virtio-access.h:166
>   #7  0x0000555558f300ea in vring_avail_ring (vq=0x7fffdd55d8a0, i=65) at hw/virtio/virtio.c:326
>   #8  0x0000555558f33b10 in vring_get_used_event (vq=0x7fffdd55d8a0) at hw/virtio/virtio.c:332
>   #9  0x0000555558f33677 in virtio_split_should_notify (vdev=0x62d00003a680, vq=0x7fffdd55d8a0) at hw/virtio/virtio.c:2471
>   #10 0x0000555558f1859f in virtio_should_notify (vdev=0x62d00003a680, vq=0x7fffdd55d8a0) at hw/virtio/virtio.c:2523
>   #11 0x0000555558f188cc in virtio_notify (vdev=0x62d00003a680, vq=0x7fffdd55d8a0) at hw/virtio/virtio.c:2565
>   #12 0x0000555557c2bd52 in virtio_input_handle_sts (vdev=0x62d00003a680, vq=0x7fffdd55d8a0) at hw/input/virtio-input.c:100
>   #13 0x0000555558f16df7 in virtio_queue_notify (vdev=0x62d00003a680, n=1) at hw/virtio/virtio.c:2363
>   #14 0x00005555583f45c0 in virtio_pci_notify_write (opaque=0x62d000032400, addr=7, val=0, size=1) at hw/virtio/virtio-pci.c:1369
>   #15 0x0000555558b80b04 in memory_region_write_accessor (mr=0x62d000033190, addr=7, value=0x7fffffff8eb0, size=1, shift=0, mask=255, attrs=...) at softmmu/memory.c:492
> 
> Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
> Fixes: ab223c9518e ("virtio: allow virtio-1 queue layout")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/302
> BugLink: https://bugs.launchpad.net/qemu/+bug/1913510

OSS-Fuzz found ways to trigger assertion failure for virtio-{rng,
serial, scsi, balloon, 9p}. Would it be useful to have qtest reproducers
for these?

-Alex

> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/virtio/virtio.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 874377f37a7..04ffe5f420e 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -2255,6 +2255,7 @@ void virtio_queue_set_num(VirtIODevice *vdev, int n, int num)
>          return;
>      }
>      vdev->vq[n].vring.num = num;
> +    virtio_queue_update_rings(vdev, n);
>  }
>  
>  VirtQueue *virtio_vector_first_queue(VirtIODevice *vdev, uint16_t vector)
> -- 
> 2.31.1
> 

