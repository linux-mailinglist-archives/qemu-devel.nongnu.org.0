Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BE86FC3DB
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 12:28:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwKYV-0003bY-R0; Tue, 09 May 2023 06:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pwKYQ-0003b4-7s; Tue, 09 May 2023 06:26:46 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pwKYL-00049h-OK; Tue, 09 May 2023 06:26:44 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 974E847D29;
 Tue,  9 May 2023 12:26:29 +0200 (CEST)
Message-ID: <8af6f1ef-9b91-7024-36a1-e98ba87a9feb@proxmox.com>
Date: Tue, 9 May 2023 12:26:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Question about graph locking preconditions regarding
 qemu_in_main_thread()
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Hanna Czenczek <hreitz@redhat.com>, eesposit@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, QEMU Developers
 <qemu-devel@nongnu.org>, Thomas Lamprecht <t.lamprecht@proxmox.com>
References: <9d413dd9-a606-8e80-2ae7-a068cd582bb5@proxmox.com>
 <ZFjRbW4+gsz65vqn@redhat.com>
From: Fiona Ebner <f.ebner@proxmox.com>
In-Reply-To: <ZFjRbW4+gsz65vqn@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.802,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Am 08.05.23 um 12:40 schrieb Kevin Wolf:
> Am 05.05.2023 um 11:35 hat Fiona Ebner geschrieben:
>> Hi,
>> I noticed that the bdrv_graph_co_rd_lock() and bdrv_graph_co_rd_unlock()
>> functions use qemu_in_main_thread() as a conditional to return early.
>> What high-level requirements ensure that qemu_in_main_thread() will
>> evaluate to the same value during locking and unlocking?
> 
> I think it's actually wrong.
> 
> There are some conditions under which we don't actually need to do
> anything for locking: Writing the graph is only possible from the main
> context while holding the BQL. So if a reader is running in the main
> contextunder the BQL and knows that it won't be interrupted until the
> next writer runs, we don't actually need to do anything.
> 
> This is the case if the reader code neither has a nested event loop
> (this is forbidden anyway while you hold the lock) nor is a coroutine
> (because a writer could run when the coroutine has yielded).

Sorry, I don't understand the first part. If bdrv_writev_vmstate() is
called, then, because it is a generated coroutine wrapper,
AIO_WAIT_WHILE()/aio_poll() is used. And that is the case regardless of
whether the lock is held or not, i.e. there is a nested event loop even
if the lock is held?

> These conditions are exactly what bdrv_graph_rdlock_main_loop() asserts.
> They are not fulfilled in bdrv_graph_co_rdlock, which always runs in a
> coroutine.
> 

Thank you for the explanation!

>> In the output below, the boolean value after the backtraces of
>> bdrv_graph_co_rd(un)lock is the value of qemu_in_main_thread().
>>
>> AFAICT, what happened below is:
>> 1. QMP function is executed in the main thread and drops the BQL.
>> 2. bdrv_co_writev_vmstate_entry is called, increasing the reader count,
>> because qemu_in_main_thread() is false.
>> 3. A vCPU thread issued a write, not increasing the reader count,
>> because qemu_in_main_thread() is true.
>> 4. The write is finished in the main thread, decreasing the reader
>> count, because qemu_in_main_thread() is false.
> 
> This one is weird. Why don't we hold the BQL there?
> 
> Ah, I actually have an idea: Maybe it is executed by the nested event
> loop in bdrv_writev_vmstate(). This nested event loop runs now without
> the BQL, too, and it can call any sort of callback in QEMU that really
> expects to be called with the BQL. Scary!
> 
> If this is what happens, you actually have your proof that not holding
> the BQL can cause problems even if there is no other thread active that
> could interfere.
> 
> Can you try to confirm this in gdb? In case you haven't debugged
> coroutines much yet: If you have this state in gdb for a running
> instance, you can repeat 'fin' until you reach the next coroutine
> switch, and then you should be able to get the stack trace to see who
> entered the coroutine.
> 

Thank you for the guidance! Hope I did it correctly, but AFAICS, you are
spot-on :)

> Run till exit from #0  blk_co_pwrite_entry (opaque=0x7ffff1242eb0) at block/block-gen.c:1624
> coroutine_trampoline (i0=1543776144, i1=32767) at ../util/coroutine-ucontext.c:178
> 178	        qemu_coroutine_switch(co, co->caller, COROUTINE_TERMINATE);
> (gdb) s
> [New Thread 0x7fff537f7700 (LWP 128641)]
> [Thread 0x7fff537f7700 (LWP 128641) exited]
> qemu_coroutine_switch (from_=0x7fff5c042790, to_=0x7ffff3901148, action=COROUTINE_TERMINATE) at ../util/coroutine-ucontext.c:298
> 298	{
> (gdb) n
> 299	    CoroutineUContext *from = DO_UPCAST(CoroutineUContext, base, from_);
> (gdb) 
> 300	    CoroutineUContext *to = DO_UPCAST(CoroutineUContext, base, to_);
> (gdb) 
> 302	    void *fake_stack_save = NULL;
> (gdb) 
> [New Thread 0x7fff537f7700 (LWP 128660)]
> 304	    set_current(to_);
> (gdb) 
> [Thread 0x7fff537f7700 (LWP 128660) exited]
> 306	    ret = sigsetjmp(from->env, 0);
> (gdb) n
> [New Thread 0x7fff537f7700 (LWP 128762)]
> [Thread 0x7fff537f7700 (LWP 128762) exited]
> 307	    if (ret == 0) {
> (gdb) 
> 308	        start_switch_fiber_asan(action, &fake_stack_save, to->stack,
> (gdb) 
> 310	        start_switch_fiber_tsan(&fake_stack_save,
> (gdb) 
> [New Thread 0x7fff537f7700 (LWP 128868)]
> 312	        siglongjmp(to->env, action);
> (gdb) s
> [Thread 0x7fff537f7700 (LWP 128868) exited]
> longjmp_compat (env=0x7ffff39011b0, val=2) at ../sysdeps/x86/nptl/pt-longjmp.c:62
> 62	../sysdeps/x86/nptl/pt-longjmp.c: No such file or directory.
> (gdb) 
> __libc_siglongjmp (env=0x7fff5c0c07e8, val=3) at ../setjmp/longjmp.c:30
> 30	../setjmp/longjmp.c: No such file or directory.
> (gdb) 
> _longjmp_unwind (env=0x7fff5c0c07e8, val=3) at ../sysdeps/nptl/jmp-unwind.c:30
> 30	../sysdeps/nptl/jmp-unwind.c: No such file or directory.
> (gdb) bt
> #0  _longjmp_unwind (env=0x7fff5c0c07e8, val=3) at ../sysdeps/nptl/jmp-unwind.c:30
> #1  0x00007ffff6154961 in __libc_siglongjmp (env=0x7fff5c0c07e8, val=3) at ../setjmp/longjmp.c:30
> #2  0x00007ffff712cc59 in longjmp_compat (env=<optimized out>, val=<optimized out>) at ../sysdeps/x86/nptl/pt-longjmp.c:62
> #3  0x000055555605409b in qemu_coroutine_switch (from_=0x7ffff3901148, to_=0x7fff5c0c0780, action=COROUTINE_ENTER) at ../util/coroutine-ucontext.c:312
> #4  0x0000555556052214 in qemu_aio_coroutine_enter (ctx=0x555556b40f10, co=0x7fff5c0c0780) at ../util/qemu-coroutine.c:161
> #5  0x0000555556050ae3 in aio_co_enter (ctx=0x555556b40f10, co=0x7fff5c0c0780) at ../util/async.c:680
> #6  0x0000555556050a26 in aio_co_wake (co=0x7fff5c0c0780) at ../util/async.c:664
> #7  0x0000555556054ea9 in thread_pool_co_cb (opaque=0x7fff516dd880, ret=0) at ../util/thread-pool.c:284
> #8  0x0000555556054acb in thread_pool_completion_bh (opaque=0x555556b39c00) at ../util/thread-pool.c:199
> #9  0x000055555604fa34 in aio_bh_call (bh=0x555556dcca30) at ../util/async.c:155
> #10 0x000055555604fb3f in aio_bh_poll (ctx=0x555556b40f10) at ../util/async.c:184
> #11 0x0000555556033ce2 in aio_poll (ctx=0x555556b40f10, blocking=true) at ../util/aio-posix.c:721
> #12 0x0000555555e8d055 in bdrv_poll_co (s=0x7fffffffd610) at /home/febner/repos/qemu/block/block-gen.h:43
> #13 0x0000555555e8e606 in bdrv_writev_vmstate (bs=0x555557a6aed0, qiov=0x7fffffffd690, pos=0) at block/block-gen.c:809
> #14 0x0000555555ed75e3 in bdrv_save_vmstate (bs=0x555557a6aed0, buf=0x555556dc5000 "\020t\317VUU", pos=0, size=1000) at ../block/io.c:2786
> #15 0x0000555555b77528 in qmp_unlock_write_lock (errp=0x7fffffffd750) at ../migration/savevm.c:3411
> #16 0x0000555555fde0b8 in qmp_marshal_unlock_write_lock (args=0x7fffe8007e60, ret=0x7ffff2e94d98, errp=0x7ffff2e94d90) at qapi/qapi-commands-migration.c:1468
> #17 0x00005555560263b1 in do_qmp_dispatch_bh (opaque=0x7ffff2e94e30) at ../qapi/qmp-dispatch.c:128
> #18 0x000055555604fa34 in aio_bh_call (bh=0x7fffe8005e90) at ../util/async.c:155
> #19 0x000055555604fb3f in aio_bh_poll (ctx=0x555556b40f10) at ../util/async.c:184
> #20 0x0000555556033399 in aio_dispatch (ctx=0x555556b40f10) at ../util/aio-posix.c:421
> #21 0x000055555604ff7a in aio_ctx_dispatch (source=0x555556b40f10, callback=0x0, user_data=0x0) at ../util/async.c:326
> #22 0x00007ffff7544e6b in g_main_context_dispatch () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
> #23 0x00005555560516c0 in glib_pollfds_poll () at ../util/main-loop.c:290
> #24 0x000055555605173a in os_host_main_loop_wait (timeout=0) at ../util/main-loop.c:313
> #25 0x000055555605183f in main_loop_wait (nonblocking=0) at ../util/main-loop.c:592
> #26 0x0000555555b2c188 in qemu_main_loop () at ../softmmu/runstate.c:731
> #27 0x000055555586ea92 in qemu_default_main () at ../softmmu/main.c:37
> #28 0x000055555586eac8 in main (argc=60, argv=0x7fffffffdb28) at ../softmmu/main.c:48

Best Regards,
Fiona


