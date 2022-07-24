Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F3557F73E
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jul 2022 23:43:20 +0200 (CEST)
Received: from localhost ([::1]:35286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFjNe-0004WC-PR
	for lists+qemu-devel@lfdr.de; Sun, 24 Jul 2022 17:43:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ly@xryan.net>) id 1oFjM0-0002qr-A5
 for qemu-devel@nongnu.org; Sun, 24 Jul 2022 17:41:36 -0400
Received: from p3plsmtpa09-08.prod.phx3.secureserver.net
 ([173.201.193.237]:34266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ly@xryan.net>) id 1oFjLy-0007VQ-3x
 for qemu-devel@nongnu.org; Sun, 24 Jul 2022 17:41:36 -0400
Received: from [192.168.2.110] ([107.142.220.210]) by :SMTPAUTH: with ESMTPSA
 id FjLsoFPzlpkbRFjLtoq9EW; Sun, 24 Jul 2022 14:41:29 -0700
X-CMAE-Analysis: v=2.4 cv=I7ug+Psg c=1 sm=1 tr=0 ts=62ddbc89
 a=PWyw4K0K+Bg32SwyYQrI8A==:117 a=PWyw4K0K+Bg32SwyYQrI8A==:17
 a=IkcTkHD0fZMA:10 a=-DKPHhmlI0iLGAAKiu4A:9 a=QEXdDO2ut3YA:10
X-SECURESERVER-ACCT: ly@xryan.net
Message-ID: <50e25c56-5624-fe2d-1327-665fc7b9bf05@xryan.net>
Date: Sun, 24 Jul 2022 17:41:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: qemu-block@nongnu.org, qemu-devel@nongnu.org
From: Liang Yan <ly@xryan.net>
Subject: Deadlock between bdrv_drain_all_begin and prepare_mmio_access
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfItElLRjzV6DQtwEvIs04NwzQOrvmQXUq7ztGe89qX2VXEXY470EjjeX0qNDsQ2wcjYorkKcc6igDD71hQzqK9unsQSel3DDcBgsmUeLEDBOPnDWM06H
 rVD9mYZ3nh48kJujpexYD7v/BNeSwrGMxzLMjk9/lhraC6DJk01beCytzsqK2YecT7bu6Jh+3zoaTRlgoDLc5t6AMPtcu8v79RQydcTbpMyhDXK164TQF07T
Received-SPF: pass client-ip=173.201.193.237; envelope-from=ly@xryan.net;
 helo=p3plsmtpa09-08.prod.phx3.secureserver.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello All,

I am facing a lock situation between main-loop thread 1 and vcpu thread 
4 when doing a qmp snapshot. QEMU is running on 6.0.x, checked the 
upstream code and did not see any big change since between. Guest is a 
Windows 10 VM. Unfortunately, I could not get into the windows vm or 
reproduce the issue by myself. No iothread is used here, native aio only.

 From the code,

-> AIO_WAIT_WHILE(NULL, bdrv_drain_all_poll());

--> aio_poll(qemu_get_aio_context(), true);

Mainloop mutex is locked when start snapshot in thread 1, vcpu released 
thread lock when address_space_rw and try to get thread lock again in 
prepare_mmio_access.

It seems main loop thread is stuck at aio_poll with blocking, but I can 
not figure out what the addr=4275044592 belongs to from mmio read.

I do not quite understand what really happens here, either block jobs 
never drained out or maybe a block io read from vcpu and cause a 
deadlock? I hope domain experts here could help figure out the root 
cause, thanks in advance and let me know if need any further information.


Regards,

Liang


(gdb) thread 1
[Switching to thread 1 (Thread 0x7f9ebcf96040 (LWP 358660))]
#0  0x00007f9ec6eb4ac6 in __ppoll (fds=0x562dda80bc90, nfds=2, 
timeout=<optimized out>, timeout@entry=0x0, sigmask=sigmask@entry=0x0) 
at ../sysdeps/unix/sysv/linux/ppoll.c:44
44    ../sysdeps/unix/sysv/linux/ppoll.c: No such file or directory.
(gdb) bt
#0  0x00007f9ec6eb4ac6 in __ppoll (fds=0x562dda80bc90, nfds=2, 
timeout=<optimized out>, timeout@entry=0x0, sigmask=sigmask@entry=0x0) 
at ../sysdeps/unix/sysv/linux/ppoll.c:44
#1  0x0000562dd7f5a409 in ppoll (__ss=0x0, __timeout=0x0, 
__nfds=<optimized out>, __fds=<optimized out>) at 
/usr/include/x86_64-linux-gnu/bits/poll2.h:77
#2  qemu_poll_ns (fds=<optimized out>, nfds=<optimized out>, 
timeout=timeout@entry=-1) at ../../util/qemu-timer.c:336
#3  0x0000562dd7f93de9 in fdmon_poll_wait (ctx=0x562dda193860, 
ready_list=0x7ffedaeb3f48, timeout=-1) at ../../util/fdmon-poll.c:80
#4  0x0000562dd7f6d05b in aio_poll (ctx=<optimized out>, 
blocking=blocking@entry=true) at ../../util/aio-posix.c:607
#5  0x0000562dd7e67e54 in bdrv_drain_all_begin () at ../../block/io.c:642
#6  bdrv_drain_all_begin () at ../../block/io.c:607
#7  0x0000562dd7e68a6d in bdrv_drain_all () at ../../block/io.c:693
#8  0x0000562dd7e54963 in qmp_transaction 
(dev_list=dev_list@entry=0x7ffedaeb4070, 
has_props=has_props@entry=false, props=0x562dda803910, props@entry=0x0, 
errp=errp@entry=0x7ffedaeb4128)
     at ../../blockdev.c:2348
#9  0x0000562dd7e54d5b in blockdev_do_action (errp=0x7ffedaeb4128, 
action=0x7ffedaeb4060) at ../../blockdev.c:1055
#10 qmp_blockdev_snapshot_sync (has_device=<optimized out>, 
device=<optimized out>, has_node_name=<optimized out>, 
node_name=<optimized out>, snapshot_file=<optimized out>,
     has_snapshot_node_name=<optimized out>, 
snapshot_node_name=0x562dda83c970 "hvd-snapshot", has_format=false, 
format=0x0, has_mode=false, mode=NEW_IMAGE_MODE_EXISTING, 
errp=0x7ffedaeb4128)
     at ../../blockdev.c:1083
#11 0x0000562dd7f0e5aa in qmp_marshal_blockdev_snapshot_sync 
(args=<optimized out>, ret=<optimized out>, errp=0x7f9ebc61ae90) at 
qapi/qapi-commands-block-core.c:221
#12 0x0000562dd7f5c5db in do_qmp_dispatch_bh (opaque=0x7f9ebc61aea0) at 
../../qapi/qmp-dispatch.c:131
#13 0x0000562dd7f5dc27 in aio_bh_call (bh=0x7f9e3000b760) at 
../../util/async.c:164
#14 aio_bh_poll (ctx=ctx@entry=0x562dda193860) at ../../util/async.c:164
#15 0x0000562dd7f6ca82 in aio_dispatch (ctx=0x562dda193860) at 
../../util/aio-posix.c:381
#16 0x0000562dd7f5da42 in aio_ctx_dispatch (source=<optimized out>, 
callback=<optimized out>, user_data=<optimized out>) at 
../../util/async.c:306
#17 0x00007f9ec7ade17d in g_main_context_dispatch () from 
/lib/x86_64-linux-gnu/libglib-2.0.so.0
#18 0x0000562dd7f4f320 in glib_pollfds_poll () at ../../util/main-loop.c:231
#19 os_host_main_loop_wait (timeout=<optimized out>) at 
../../util/main-loop.c:254
#20 main_loop_wait (nonblocking=nonblocking@entry=0) at 
../../util/main-loop.c:530
#21 0x0000562dd7d3cfd9 in qemu_main_loop () at ../../softmmu/runstate.c:725
#22 0x0000562dd7b7aa82 in main (argc=<optimized out>, argv=<optimized 
out>, envp=<optimized out>) at ../../softmmu/main.c:50


(gdb) thread 4
[Switching to thread 4 (Thread 0x7f9e377fd700 (LWP 358668))]
#0  __lll_lock_wait (futex=futex@entry=0x562dd8337a60 
<qemu_global_mutex>, private=0) at lowlevellock.c:52
52    lowlevellock.c: No such file or directory.
(gdb) bt
#0  __lll_lock_wait (futex=futex@entry=0x562dd8337a60 
<qemu_global_mutex>, private=0) at lowlevellock.c:52
#1  0x00007f9ec6f9f0a3 in __GI___pthread_mutex_lock 
(mutex=mutex@entry=0x562dd8337a60 <qemu_global_mutex>) at 
../nptl/pthread_mutex_lock.c:80
#2  0x0000562dd7f667c8 in qemu_mutex_lock_impl (mutex=0x562dd8337a60 
<qemu_global_mutex>, file=0x562dd804c76c "../../softmmu/physmem.c", 
line=2742) at ../../util/qemu-thread-posix.c:79
#3  0x0000562dd7dca8ce in qemu_mutex_lock_iothread_impl 
(file=file@entry=0x562dd804c76c "../../softmmu/physmem.c", 
line=line@entry=2742) at ../../softmmu/cpus.c:491
#4  0x0000562dd7da2e91 in prepare_mmio_access (mr=<optimized out>) at 
../../softmmu/physmem.c:2742
#5  0x0000562dd7da8bbb in flatview_read_continue 
(fv=fv@entry=0x7f9e2827a4c0, addr=addr@entry=4275044592, attrs=..., 
ptr=ptr@entry=0x7f9ebcef7028, len=len@entry=4, addr1=<optimized out>, 
l=<optimized out>,
     mr=0x562dda576f10) at ../../softmmu/physmem.c:2834
#6  0x0000562dd7da8df3 in flatview_read (fv=0x7f9e2827a4c0, 
addr=4275044592, attrs=..., buf=0x7f9ebcef7028, len=4) at 
../../softmmu/physmem.c:2875
#7  0x0000562dd7da8f1f in address_space_read_full (as=<optimized out>, 
addr=<optimized out>, attrs=..., buf=<optimized out>, len=<optimized 
out>) at ../../softmmu/physmem.c:2888
#8  0x0000562dd7da9045 in address_space_rw (as=<optimized out>, 
addr=<optimized out>, attrs=..., attrs@entry=..., 
buf=buf@entry=0x7f9ebcef7028, len=<optimized out>, is_write=<optimized out>)
     at ../../softmmu/physmem.c:2916
#9  0x0000562dd7dfd7a8 in kvm_cpu_exec (cpu=cpu@entry=0x7f9ebc42b010) at 
../../accel/kvm/kvm-all.c:2516
#10 0x0000562dd7d61c75 in kvm_vcpu_thread_fn 
(arg=arg@entry=0x7f9ebc42b010) at ../../accel/kvm/kvm-accel-ops.c:49
#11 0x0000562dd7f66523 in qemu_thread_start (args=<optimized out>) at 
../../util/qemu-thread-posix.c:521
#12 0x00007f9ec6f9c609 in start_thread (arg=<optimized out>) at 
pthread_create.c:477
#13 0x00007f9ec6ec1163 in clone () at 
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

(gdb) print lock
$1 = {lock = {__data = {__lock = 0, __count = 0, __owner = 0, __nusers = 
0, __kind = 0, __spins = 0, __elision = 0, __list = {__prev = 0x0, 
__next = 0x0}}, __size = '\000' <repeats 39 times>, __align = 0},
   initialized = false}

(gdb) p *(pthread_mutex_t *)0x562dd8337a60
$3 = {__data = {__lock = 2, __count = 0, __owner = 358660, __nusers = 1, 
__kind = 0, __spins = 0, __elision = 0, __list = {__prev = 0x0, __next = 
0x0}},
   __size = "\002\000\000\000\000\000\000\000\004y\005\000\001", '\000' 
<repeats 26 times>, __align = 2}




