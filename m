Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3BC6F8018
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 11:36:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1purrT-0002kL-Ax; Fri, 05 May 2023 05:36:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1purrQ-0002gV-En; Fri, 05 May 2023 05:36:20 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1purrN-0003IG-BT; Fri, 05 May 2023 05:36:20 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 4CDFE475B7;
 Fri,  5 May 2023 11:36:05 +0200 (CEST)
Message-ID: <9d413dd9-a606-8e80-2ae7-a068cd582bb5@proxmox.com>
Date: Fri, 5 May 2023 11:35:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Fiona Ebner <f.ebner@proxmox.com>
Subject: Question about graph locking preconditions regarding
 qemu_in_main_thread()
Content-Language: en-US
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Czenczek <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, QEMU Developers
 <qemu-devel@nongnu.org>, Thomas Lamprecht <t.lamprecht@proxmox.com>
To: "open list:Network Block Dev..." <qemu-block@nongnu.org>
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
I noticed that the bdrv_graph_co_rd_lock() and bdrv_graph_co_rd_unlock()
functions use qemu_in_main_thread() as a conditional to return early.
What high-level requirements ensure that qemu_in_main_thread() will
evaluate to the same value during locking and unlocking?

This paragraph assumes no iothreads are used for simplicity. One
requirement is: don't call bdrv_* functions without the BQL. Well,
snapshot-save does just that during setup, but it might be fine, because
it's done after calling vm_stop() and within a bdrv_drain_all section
(there is another issue however [0], so it still makes sense to change
snapshot-save to hold the BQL during setup).

But a variation without the vm_stop() and drained section will be able
to produce a negative reader count, see below[1][2]. The issue obviously
depends on dropping the BQL, but I'm not entirely sure it depends on the
bdrv_* call or if steps 3. and 4. in [2] could also happen in some other
scenario.

I'm not aware of any actual issues in QEMU :) But I thought, I'd better ask.

Best Regards,
Fiona

[0]: https://lists.nongnu.org/archive/html/qemu-devel/2023-04/msg05415.html

[1]: Example QMP function inspired by snapshot-save

> void qmp_unlock_write_lock(Error **errp)
> {
>     Error *local_err = NULL;
>     QDict *options = qdict_new();
>     const uint8_t *buf = malloc(1000);
> 
>     /*
>     vm_stop(RUN_STATE_SAVE_VM);
>     bdrv_drain_all_begin();
>     */
> 
>     qdict_put_str(options, "driver", "qcow2");
>     BlockBackend *bb = blk_new_open("/tmp/disk.qcow2", NULL, options, BDRV_O_RDWR, &local_err);
>     if (!bb) {
>         error_set(errp, ERROR_CLASS_GENERIC_ERROR, "failed to open");
>     } else {
>         qemu_mutex_unlock_iothread();
>         bdrv_save_vmstate(blk_bs(bb), buf, 0, 1000);
>         qemu_mutex_lock_iothread();
>         blk_unref(bb);
>     }
> 
>     /*
>     bdrv_drain_all_end();
>     vm_start();
>     */
> }

[2]:

In the output below, the boolean value after the backtraces of
bdrv_graph_co_rd(un)lock is the value of qemu_in_main_thread().

AFAICT, what happened below is:
1. QMP function is executed in the main thread and drops the BQL.
2. bdrv_co_writev_vmstate_entry is called, increasing the reader count,
because qemu_in_main_thread() is false.
3. A vCPU thread issued a write, not increasing the reader count,
because qemu_in_main_thread() is true.
4. The write is finished in the main thread, decreasing the reader
count, because qemu_in_main_thread() is false.
5. bdrv_co_writev_vmstate_entry is finished in the main thread,
decreasing the reader count, because qemu_in_main_thread() is false.
6. The assertion that the reader count is non-negative fails (during
blk_unref(), bdrv_graph_wrlock() is called which triggers the assert,
not shown below).

> Thread 1 "qemu-system-x86" hit Breakpoint 3, qmp_unlock_write_lock (errp=0x7fffffffd740) at ../migration/savevm.c:3410
> 3410            qemu_mutex_unlock_iothread();
> 
> Thread 1 "qemu-system-x86" hit Breakpoint 5, bdrv_graph_co_rdlock () at ../block/graph-lock.c:161
> 161     {
> #0  bdrv_graph_co_rdlock () at ../block/graph-lock.c:161
> #1  0x0000555555e8e4f3 in bdrv_co_writev_vmstate_entry (opaque=0x7fffffffd600) at block/block-gen.c:784
> #2  0x0000555556053c15 in coroutine_trampoline (i0=1457248608, i1=21845) at ../util/coroutine-ucontext.c:177
> #3  0x00007ffff6169d40 in ?? () from /lib/x86_64-linux-gnu/libc.so.6
> #4  0x00007fffffffc950 in ?? ()
> #5  0x0000000000000000 in ?? ()
> $51 = false
> [Switching to Thread 0x7ffff0a47700 (LWP 54187)]
> 
> Thread 7 "CPU 0/KVM" hit Breakpoint 5, bdrv_graph_co_rdlock () at ../block/graph-lock.c:161
> 161     {
> #0  bdrv_graph_co_rdlock () at ../block/graph-lock.c:161
> #1  0x0000555555ebf2e3 in graph_lockable_auto_lock (x=0x7fff4bfffdf3) at /home/febner/repos/qemu/include/block/graph-lock.h:214
> #2  0x0000555555ec20d6 in blk_co_do_pwritev_part (blk=0x555556dac400, offset=145920, bytes=512, qiov=0x7fff4bfffef0, qiov_offset=0, flags=0) at ../block/block-backend.c:1367
> #3  0x0000555555ec2234 in blk_co_pwritev_part (blk=0x555556dac400, offset=145920, bytes=512, qiov=0x7fff4bfffef0, qiov_offset=0, flags=0) at ../block/block-backend.c:1404
> #4  0x0000555555ec2311 in blk_co_pwritev (blk=0x555556dac400, offset=145920, bytes=512, qiov=0x7fff4bfffef0, flags=0) at ../block/block-backend.c:1426
> #5  0x0000555555ec22bb in blk_co_pwrite (blk=0x555556dac400, offset=145920, bytes=512, buf=0x7fff5ae23a00, flags=0) at ../block/block-backend.c:1418
> #6  0x0000555555e8fc60 in blk_co_pwrite_entry (opaque=0x7ffff0a41eb0) at block/block-gen.c:1624
> #7  0x0000555556053c15 in coroutine_trampoline (i0=-535577088, i1=32767) at ../util/coroutine-ucontext.c:177
> #8  0x00007ffff6169d40 in ?? () from /lib/x86_64-linux-gnu/libc.so.6
> #9  0x00007ffff0a41690 in ?? ()
> #10 0x0000000000000000 in ?? ()
> $52 = true
> [Switching to Thread 0x7ffff3901280 (LWP 54113)]
> 
> Thread 1 "qemu-system-x86" hit Breakpoint 6, bdrv_graph_co_rdunlock () at ../block/graph-lock.c:231
> 231         bdrv_graph = qemu_get_current_aio_context()->bdrv_graph;
> #0  bdrv_graph_co_rdunlock () at ../block/graph-lock.c:231
> #1  0x0000555555ebf2fa in graph_lockable_auto_unlock (x=0x7fff4bfffdf3) at /home/febner/repos/qemu/include/block/graph-lock.h:221
> #2  0x0000555555ebf31c in glib_autoptr_clear_GraphLockable (_ptr=0x7fff4bfffdf3) at /home/febner/repos/qemu/include/block/graph-lock.h:224
> #3  0x0000555555ebf33a in glib_autoptr_cleanup_GraphLockable (_ptr=0x7fff4bfffdf8) at /home/febner/repos/qemu/include/block/graph-lock.h:224
> #4  0x0000555555ec21c6 in blk_co_do_pwritev_part (blk=0x555556dac400, offset=145920, bytes=512, qiov=0x7fff4bfffef0, qiov_offset=0, flags=0) at ../block/block-backend.c:1367
> #5  0x0000555555ec2234 in blk_co_pwritev_part (blk=0x555556dac400, offset=145920, bytes=512, qiov=0x7fff4bfffef0, qiov_offset=0, flags=0) at ../block/block-backend.c:1404
> #6  0x0000555555ec2311 in blk_co_pwritev (blk=0x555556dac400, offset=145920, bytes=512, qiov=0x7fff4bfffef0, flags=0) at ../block/block-backend.c:1426
> #7  0x0000555555ec22bb in blk_co_pwrite (blk=0x555556dac400, offset=145920, bytes=512, buf=0x7fff5ae23a00, flags=0) at ../block/block-backend.c:1418
> #8  0x0000555555e8fc60 in blk_co_pwrite_entry (opaque=0x7ffff0a41eb0) at block/block-gen.c:1624
> #9  0x0000555556053c15 in coroutine_trampoline (i0=-535577088, i1=32767) at ../util/coroutine-ucontext.c:177
> #10 0x00007ffff6169d40 in ?? () from /lib/x86_64-linux-gnu/libc.so.6
> #11 0x00007ffff0a41690 in ?? ()
> #12 0x0000000000000000 in ?? ()
> $53 = false
> 
> Thread 1 "qemu-system-x86" hit Breakpoint 6, bdrv_graph_co_rdunlock () at ../block/graph-lock.c:231
> 231         bdrv_graph = qemu_get_current_aio_context()->bdrv_graph;
> #0  bdrv_graph_co_rdunlock () at ../block/graph-lock.c:231
> #1  0x0000555555e8e522 in bdrv_co_writev_vmstate_entry (opaque=0x7fffffffd600) at block/block-gen.c:786
> #2  0x0000555556053c15 in coroutine_trampoline (i0=1457248608, i1=21845) at ../util/coroutine-ucontext.c:177
> #3  0x00007ffff6169d40 in ?? () from /lib/x86_64-linux-gnu/libc.so.6
> #4  0x00007fffffffc950 in ?? ()
> #5  0x0000000000000000 in ?? ()
> $54 = false
> 
> Thread 1 "qemu-system-x86" hit Breakpoint 4, qmp_unlock_write_lock (errp=0x7fffffffd740) at ../migration/savevm.c:3412
> 3412            qemu_mutex_lock_iothread();
> qemu-system-x86_64: ../block/graph-lock.c:105: reader_count: Assertion `(int32_t)rd >= 0' failed.


