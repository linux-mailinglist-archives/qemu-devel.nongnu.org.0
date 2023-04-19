Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 522B26E7BF7
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 16:13:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp8Ws-0001FB-29; Wed, 19 Apr 2023 10:11:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pp8Wd-0001EB-Nt; Wed, 19 Apr 2023 10:11:11 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pp8WM-000691-2D; Wed, 19 Apr 2023 10:11:10 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 4D32645A43;
 Wed, 19 Apr 2023 16:10:40 +0200 (CEST)
Message-ID: <2a61b581-5a21-c945-bb98-b6863cac0c1f@proxmox.com>
Date: Wed, 19 Apr 2023 16:09:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
From: Fiona Ebner <f.ebner@proxmox.com>
Subject: QMP (without OOB) function running in thread different from the main
 thread as part of aio_poll
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 michael.roth@amd.com, Markus Armbruster <armbru@redhat.com>,
 Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,
while debugging a completely different issue, I was surprised to see
do_qmp_dispatch_bh being run in a vCPU thread. I was under the
impression that QMP functions are supposed to be executed in the main
thread. Is that wrong?

I managed to reproduced the scenario with a build of upstream QEMU
v8.0.0-rc4 once more (again with GDB open), but it's not a simple
reproducer and racy. The backtrace is below[0].

My attempt at explaining the situation is:
1. In qapi/qmp-dispatch.c, the main thread schedules do_qmp_dispatch_bh,
because the coroutine context doesn't match.
2. The host OS switches to the vCPU thread.
3. Something in the vCPU thread triggers aio_poll with the main thread's
AioContext (in my case, a write to a pflash drive).
4. do_qmp_dispatch_bh is executed in the vCPU thread.

Could this be an artifact of running with a debugger?

I CC'ed the maintainers of util/aio-posix.c and qapi/qmp-dispatch.c
hoping that is not too far off.

Best Regards,
Fiona

[0]:
> Thread 5 "CPU 0/KVM" hit Breakpoint 2, do_qmp_dispatch_bh (opaque=0x7ffff2e96e30) at ../qapi/qmp-dispatch.c:124
> 124	    QmpDispatchBH *data = opaque;
> #0  do_qmp_dispatch_bh (opaque=0x7ffff2e96e30) at ../qapi/qmp-dispatch.c:124
> #1  0x000055555604f50a in aio_bh_call (bh=0x7fffe4005430) at ../util/async.c:155
> #2  0x000055555604f615 in aio_bh_poll (ctx=0x555556b3e730) at ../util/async.c:184
> #3  0x00005555560337b8 in aio_poll (ctx=0x555556b3e730, blocking=true) at ../util/aio-posix.c:721
> #4  0x0000555555e8cf1c in bdrv_poll_co (s=0x7ffff1a45eb0) at /home/febner/repos/qemu/block/block-gen.h:43
> #5  0x0000555555e8fc3a in blk_pwrite (blk=0x555556daf840, offset=159232, bytes=512, buf=0x7ffee3226e00, flags=0) at block/block-gen.c:1650
> #6  0x0000555555908078 in pflash_update (pfl=0x555556d92300, offset=159232, size=1) at ../hw/block/pflash_cfi01.c:394
> #7  0x0000555555908749 in pflash_write (pfl=0x555556d92300, offset=159706, value=127, width=1, be=0) at ../hw/block/pflash_cfi01.c:522
> #8  0x0000555555908cda in pflash_mem_write_with_attrs (opaque=0x555556d92300, addr=159706, value=127, len=1, attrs=...) at ../hw/block/pflash_cfi01.c:681
> #9  0x0000555555d8936a in memory_region_write_with_attrs_accessor (mr=0x555556d926c0, addr=159706, value=0x7ffff1a460c8, size=1, shift=0, mask=255, attrs=...) at ../softmmu/memory.c:514
> #10 0x0000555555d894a9 in access_with_adjusted_size (addr=159706, value=0x7ffff1a460c8, size=1, access_size_min=1, access_size_max=4, access_fn=0x555555d89270 <memory_region_write_with_attrs_accessor>, mr=0x555556d926c0, attrs=...) at ../softmmu/memory.c:555
> #11 0x0000555555d8c5de in memory_region_dispatch_write (mr=0x555556d926c0, addr=159706, data=127, op=MO_8, attrs=...) at ../softmmu/memory.c:1522
> #12 0x0000555555d996f4 in flatview_write_continue (fv=0x7fffe843cc60, addr=4290932698, attrs=..., ptr=0x7ffff7fc5028, len=1, addr1=159706, l=1, mr=0x555556d926c0) at ../softmmu/physmem.c:2641
> #13 0x0000555555d99857 in flatview_write (fv=0x7fffe843cc60, addr=4290932698, attrs=..., buf=0x7ffff7fc5028, len=1) at ../softmmu/physmem.c:2683
> #14 0x0000555555d99c07 in address_space_write (as=0x555556a01b20 <address_space_memory>, addr=4290932698, attrs=..., buf=0x7ffff7fc5028, len=1) at ../softmmu/physmem.c:2779
> #15 0x0000555555d99c74 in address_space_rw (as=0x555556a01b20 <address_space_memory>, addr=4290932698, attrs=..., buf=0x7ffff7fc5028, len=1, is_write=true) at ../softmmu/physmem.c:2789
> #16 0x0000555555e2da88 in kvm_cpu_exec (cpu=0x555556ea10d0) at ../accel/kvm/kvm-all.c:2989
> #17 0x0000555555e3079a in kvm_vcpu_thread_fn (arg=0x555556ea10d0) at ../accel/kvm/kvm-accel-ops.c:51
> #18 0x000055555603825f in qemu_thread_start (args=0x555556b3c3b0) at ../util/qemu-thread-posix.c:541
> #19 0x00007ffff7125ea7 in start_thread (arg=<optimized out>) at pthread_create.c:477
> #20 0x00007ffff62c4a2f in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95


