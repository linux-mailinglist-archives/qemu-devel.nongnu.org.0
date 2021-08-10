Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 405643E5733
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 11:39:46 +0200 (CEST)
Received: from localhost ([::1]:42580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDOEb-0008Ep-Aq
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 05:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mDODp-0007YP-C0
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 05:38:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mDODk-0003bO-Si
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 05:38:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628588330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iGghgImqYpw21QtyZYhz8Be4baMvAlhCRJNnogGz7g8=;
 b=PET/tj6VB6uubSOAtfnTiE5wMvWKifExGQH0B9vcYM1oGoyxGenqGOAIYaUxt0hyTq1yNs
 YKUUCMo1Ls12hFREQW+OViNeMTJTliaoyCGZtlMIAI9z+9ORlL80xdfs/+tMGFcYtUlNAJ
 UpVa454i5yfezKEuvLvALWiRuaZ8spA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-8YC9T5CSOWKFaChO5BEAHg-1; Tue, 10 Aug 2021 05:38:49 -0400
X-MC-Unique: 8YC9T5CSOWKFaChO5BEAHg-1
Received: by mail-wm1-f71.google.com with SMTP id
 j33-20020a05600c1c21b02902e6828f7a20so863859wms.7
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 02:38:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iGghgImqYpw21QtyZYhz8Be4baMvAlhCRJNnogGz7g8=;
 b=Xk45ql7BP239fuyOIxNtzjfNPYOapKaaGsj1VtrrprQ5JuaatZlcbO0FG5vDrdiLmX
 qCAPFJp0ucrNJ/cBC/NwGYNl8tvQJ+jDQgg4L4mShEK2QRboyjvpxspWUJZFJ9YzZSPj
 z+N84VNj3HupF3b72G/0PkNA2FEG29wnHM3qmOppZlHbURcVmU/G2WP1IPwMkqmY4zGI
 vrvAcRRPWlm295FBpLiHnZhMDiX+6Qi5RB9hl/cZ9gKAf5QhCSgtj1G6DpMpgSJRS2bR
 X30pTGFc26jSwWAd27E2BRhRNcvF96Ojb6iRMt9UMTZblj0BU5V1aT2+QLVJn9a7k9F0
 mRkA==
X-Gm-Message-State: AOAM5317oGPZJIdfA9lwhmC08XwL62Imt8HuqYCauEFGt7S9Mu0ltUq4
 oeYxjej0Uke59PXxJkqUdLuGt720okY+DM/dh+CVnTsYaVhXxEnLYnHADPxmrJRGuF0UJN2umeo
 puzHFYK2skVo09gU=
X-Received: by 2002:a1c:188:: with SMTP id 130mr3705961wmb.122.1628588327962; 
 Tue, 10 Aug 2021 02:38:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7x3etEWyo/V+GUD8WnlPdiOFmDuM9dwySx1hF0NTkq/CAw15QifDTnmY/wKY7ytTBiGAKQg==
X-Received: by 2002:a1c:188:: with SMTP id 130mr3705911wmb.122.1628588327243; 
 Tue, 10 Aug 2021 02:38:47 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id z12sm1306937wrn.28.2021.08.10.02.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 02:38:46 -0700 (PDT)
Date: Tue, 10 Aug 2021 10:38:44 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, leobras@redhat.com
Subject: Re: migration-test, intermittent hang, aarch64 host, i386 guest
Message-ID: <YRJJJPkounhQm3uM@work-vm>
References: <CAFEAcA9RoS3Rbbg1RFexpfoE3iKJJ1J-+N1MkLN_fQfgyrS1nw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9RoS3Rbbg1RFexpfoE3iKJJ1J-+N1MkLN_fQfgyrS1nw@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> migration-test hung on me again in merge testing. Here are the
> backtraces; note that one of the qemu-system-i386 processes is a
> zombie that its parent isn't reaping.
> 
> Process tree:
> migration-test(786453)-+-qemu-system-i38(802719)
>                        |-qemu-system-i38(802846)
>                        `-qemu-system-i38(807045)


> Thread 1 (Thread 0xffff99af9690 (LWP 786453)):
> #0  0x0000ffff997d178c in __GI___clock_nanosleep (clock_id=<optimized
> out>, clock_id@entry=0, flags=flags@entry=0,
> req=req@entry=0xffffc3ba2e38, rem=rem@entry=0x0) at
> ../sysdeps/unix/sysv/linux/clock_nanosleep.c:78
> #1  0x0000ffff997d7134 in __GI___nanosleep
> (requested_time=requested_time@entry=0xffffc3ba2e38,
> remaining=remaining@entry=0x0) at nanosleep.c:27
> #2  0x0000ffff997fe0e0 in usleep (useconds=useconds@entry=1000) at
> ../sysdeps/posix/usleep.c:32
> #3  0x0000aaaab4c6ba58 in wait_for_migration_status
> (who=0xaaaad57af470, goal=0xaaaab4c9ea68 "cancelled", ungoals=0x0) at
> ../../tests/qtest/migration-helpers.c:157
> #4  0x0000aaaab4c6aeb0 in test_multifd_tcp_cancel () at
> ../../tests/qtest/migration-test.c:1376

OK, so test_multifd_tcp_cancel  waiting for the 'cancelled'

> Thread 6 (Thread 0xffff01fef560 (LWP 804033)):
> #0  futex_abstimed_wait_cancelable (private=0, abstime=0x0, clockid=0,
> expected=0, futex_word=0xaaaad563bcd8) at
> ../sysdeps/nptl/futex-internal.h:320
> #1  do_futex_wait (sem=sem@entry=0xaaaad563bcd8, abstime=0x0,
> clockid=0) at sem_waitcommon.c:112
> #2  0x0000ffff7d0abdcc in __new_sem_wait_slow
> (sem=sem@entry=0xaaaad563bcd8, abstime=0x0, clockid=0) at
> sem_waitcommon.c:184
> #3  0x0000ffff7d0abe70 in __new_sem_wait
> (sem=sem@entry=0xaaaad563bcd8) at sem_wait.c:42
> #4  0x0000aaaaafbc5f5c in qemu_sem_wait (sem=sem@entry=0xaaaad563bcd8)
> at ../../util/qemu-thread-posix.c:357
> #5  0x0000aaaaaf7a970c in multifd_send_sync_main (f=<optimized out>)
> at ../../migration/multifd.c:617

I think that's the one Leo saw.

Dave

> #6  0x0000aaaaaf984244 in ram_save_iterate (f=0xaaaad4795a60,
> opaque=<optimized out>) at ../../migration/ram.c:2951
> #7  0x0000aaaaaf671294 in qemu_savevm_state_iterate (f=0xaaaad4795a60,
> postcopy=postcopy@entry=false) at ../../migration/savevm.c:1296
> #8  0x0000aaaaaf75279c in migration_iteration_run (s=0xaaaad4487200)
> at ../../migration/migration.c:3576
> #9  migration_thread (opaque=opaque@entry=0xaaaad4487200) at
> ../../migration/migration.c:3813
> #10 0x0000aaaaafbc5098 in qemu_thread_start (args=<optimized out>) at
> ../../util/qemu-thread-posix.c:541
> #11 0x0000ffff7d0a24fc in start_thread (arg=0xffffff697f1f) at
> pthread_create.c:477
> #12 0x0000ffff7cffb67c in thread_start () at
> ../sysdeps/unix/sysv/linux/aarch64/clone.S:78
> 
> Thread 5 (Thread 0xffff2e62a560 (LWP 802816)):
> #0  0x0000aaaaaf92f8dc in tlb_hit_page_mask_anyprot
> (tlb_entry=tlb_entry@entry=0xaaaad4791898, page=75177984,
> mask=4294965248) at /home/pm/qemu/include/exec/cpu_ldst.h:319
> #1  0x0000aaaaaf92fb88 in tlb_flush_entry_mask_locked
> (tlb_entry=0xaaaad4791898, page=<optimized out>, mask=<optimized out>)
> at ../../accel/tcg/cputlb.c:461
> #2  0x0000aaaaaf9337d0 in tlb_flush_vtlb_page_mask_locked
> (mask=<optimized out>, page=<optimized out>, mmu_idx=<optimized out>,
> env=<optimized out>) at ../../accel/tcg/cputlb.c:1201
> #3  tlb_flush_vtlb_page_locked (page=75177984, mmu_idx=2,
> env=0xaaaad4791980) at ../../accel/tcg/cputlb.c:493
> #4  tlb_set_page_with_attrs (cpu=cpu@entry=0xaaaad4789090,
> vaddr=vaddr@entry=75177984, paddr=<optimized out>, attrs=...,
> prot=<optimized out>, mmu_idx=mmu_idx@entry=2, size=<optimized out>)
> at ../../accel/tcg/cputlb.c:1201
> #5  0x0000aaaaaf88217c in handle_mmu_fault (size=<optimized out>,
> mmu_idx=2, is_write1=<optimized out>, addr=75177984,
> cs=0xaaaad4789090) at ../../target/i386/cpu.h:2082
> #6  x86_cpu_tlb_fill (cs=0xaaaad4789090, addr=75177984,
> size=<optimized out>, access_type=<optimized out>, mmu_idx=2,
> probe=false, retaddr=281471470897268) at
> ../../target/i386/tcg/sysemu/excp_helper.c:464
> #7  0x0000aaaaaf92fe28 in tlb_fill (cpu=0xaaaad4789090, addr=75177984,
> size=1, access_type=MMU_DATA_LOAD, mmu_idx=2, retaddr=281471470897268)
> at ../../accel/tcg/cputlb.c:1304
> #8  0x0000aaaaaf930aa4 in load_helper (full_load=<optimized out>,
> code_read=false, op=MO_8, retaddr=281471470897268, oi=<optimized out>,
> addr=75177984, env=0xaaaad4791980) at
> /home/pm/qemu/include/exec/cpu-all.h:482
> #9  full_ldub_mmu (env=0xaaaad4791980, addr=<optimized out>,
> oi=<optimized out>, retaddr=281471470897268) at
> ../../accel/tcg/cputlb.c:1996
> #10 0x0000ffff2f09892c in code_gen_buffer ()
> #11 0x0000aaaaaf99d750 in cpu_tb_exec (tb_exit=<synthetic pointer>,
> itb=<optimized out>, cpu=0xaaaad4789090) at
> ../../accel/tcg/cpu-exec.c:353
> #12 cpu_loop_exec_tb (tb_exit=<synthetic pointer>, last_tb=<synthetic
> pointer>, tb=<optimized out>, cpu=0xaaaad4789090) at
> ../../accel/tcg/cpu-exec.c:812
> #13 cpu_exec (cpu=cpu@entry=0xaaaad4789090) at ../../accel/tcg/cpu-exec.c:970
> #14 0x0000aaaaaf9e5c2c in tcg_cpus_exec (cpu=cpu@entry=0xaaaad4789090)
> at ../../accel/tcg/tcg-accel-ops.c:67
> #15 0x0000aaaaaf9a6384 in rr_cpu_thread_fn
> (arg=arg@entry=0xaaaad4789090) at
> ../../accel/tcg/tcg-accel-ops-rr.c:216
> #16 0x0000aaaaafbc5098 in qemu_thread_start (args=<optimized out>) at
> ../../util/qemu-thread-posix.c:541
> #17 0x0000ffff7d0a24fc in start_thread (arg=0xffffff697b6f) at
> pthread_create.c:477
> #18 0x0000ffff7cffb67c in thread_start () at
> ../sysdeps/unix/sysv/linux/aarch64/clone.S:78
> 
> Thread 4 (Thread 0xffff2ef1c560 (LWP 802815)):
> #0  0x0000ffff7cff2128 in __GI___poll (fds=0xffff28003280, nfds=3,
> timeout=<optimized out>) at ../sysdeps/unix/sysv/linux/poll.c:41
> #1  0x0000ffff7f09bb30 in  () at /lib/aarch64-linux-gnu/libglib-2.0.so.0
> #2  0x0000ffff7f09bef0 in g_main_loop_run () at
> /lib/aarch64-linux-gnu/libglib-2.0.so.0
> #3  0x0000aaaaafa023bc in iothread_run
> (opaque=opaque@entry=0xaaaad44c9350) at ../../iothread.c:73
> #4  0x0000aaaaafbc5098 in qemu_thread_start (args=<optimized out>) at
> ../../util/qemu-thread-posix.c:541
> #5  0x0000ffff7d0a24fc in start_thread (arg=0xffffff697d2f) at
> pthread_create.c:477
> #6  0x0000ffff7cffb67c in thread_start () at
> ../sysdeps/unix/sysv/linux/aarch64/clone.S:78
> 
> Thread 3 (Thread 0xffff6f79e560 (LWP 802813)):
> #0  0x0000ffff7cf5ef4c in __GI___sigtimedwait
> (set=set@entry=0xaaaad4448370, info=info@entry=0xffff6f79dad8,
> timeout=timeout@entry=0x0) at
> ../sysdeps/unix/sysv/linux/sigtimedwait.c:29
> #1  0x0000ffff7d0add24 in __sigwait (set=set@entry=0xaaaad4448370,
> sig=sig@entry=0xffff6f79dba4) at
> ../sysdeps/unix/sysv/linux/sigwait.c:28
> #2  0x0000aaaaafbede34 in sigwait_compat
> (opaque=opaque@entry=0xaaaad4448370) at ../../util/compatfd.c:36
> #3  0x0000aaaaafbc5098 in qemu_thread_start (args=<optimized out>) at
> ../../util/qemu-thread-posix.c:541
> #4  0x0000ffff7d0a24fc in start_thread (arg=0xffffff697faf) at
> pthread_create.c:477
> #5  0x0000ffff7cffb67c in thread_start () at
> ../sysdeps/unix/sysv/linux/aarch64/clone.S:78
> 
> Thread 2 (Thread 0xffff700a0560 (LWP 802811)):
> #0  syscall () at ../sysdeps/unix/sysv/linux/aarch64/syscall.S:38
> #1  0x0000aaaaafbc6140 in qemu_futex_wait (val=<optimized out>,
> f=<optimized out>) at /home/pm/qemu/include/qemu/futex.h:29
> #2  qemu_event_wait (ev=ev@entry=0xaaaab0524358
> <rcu_call_ready_event>) at ../../util/qemu-thread-posix.c:480
> #3  0x0000aaaaafbc8d3c in call_rcu_thread (opaque=opaque@entry=0x0) at
> ../../util/rcu.c:258
> #4  0x0000aaaaafbc5098 in qemu_thread_start (args=<optimized out>) at
> ../../util/qemu-thread-posix.c:541
> #5  0x0000ffff7d0a24fc in start_thread (arg=0xffffff6981ef) at
> pthread_create.c:477
> #6  0x0000ffff7cffb67c in thread_start () at
> ../sysdeps/unix/sysv/linux/aarch64/clone.S:78
> 
> Thread 1 (Thread 0xffff701ff010 (LWP 802719)):
> #0  0x0000ffff7cff2234 in __ppoll (fds=0xaaaad5513040, nfds=5,
> timeout=<optimized out>, timeout@entry=0xffffff698338,
> sigmask=sigmask@entry=0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
> #1  0x0000aaaaafbed02c in ppoll (__ss=0x0, __timeout=0xffffff698338,
> __nfds=<optimized out>, __fds=<optimized out>) at
> /usr/include/aarch64-linux-gnu/bits/poll2.h:77
> #2  qemu_poll_ns (fds=<optimized out>, nfds=<optimized out>,
> timeout=timeout@entry=13245269) at ../../util/qemu-timer.c:348
> #3  0x0000aaaaafbdd8d4 in os_host_main_loop_wait (timeout=13245269) at
> ../../util/main-loop.c:250
> #4  main_loop_wait (nonblocking=nonblocking@entry=0) at
> ../../util/main-loop.c:531
> #5  0x0000aaaaaf9bc348 in qemu_main_loop () at ../../softmmu/runstate.c:726
> #6  0x0000aaaaaf63ba28 in main (argc=<optimized out>, argv=<optimized
> out>, envp=<optimized out>) at ../../softmmu/main.c:50
> [Inferior 1 (process 802719) detached]
> 
> ===========================================================
> PROCESS: 802846
> pm        802846  786453  0 18:29 ?        00:00:00 [qemu-system-i38] <defunct>
> /proc/802846/exe: No such file or directory.
> Could not attach to process.  If your uid matches the uid of the target
> process, check the setting of /proc/sys/kernel/yama/ptrace_scope, or try
> again as the root user.  For more details, see /etc/sysctl.d/10-ptrace.conf
> warning: process 802846 is a zombie - the process has already terminated
> ptrace: Operation not permitted.
> /home/pm/802846: No such file or directory.
> 
> ===========================================================
> PROCESS: 807045
> pm        807045  786453  0 18:29 ?        00:00:00 ./qemu-system-i386
> -qtest unix:/tmp/qtest-786453.sock -qtest-log /dev/null -chardev
> socket,path=/tmp/qtest-786453.qmp,id=char0 -mon
> chardev=char0,mode=control -display none -accel kvm -accel tcg -name
> target,debug-threads=on -m 150M -serial
> file:/tmp/migration-test-LndGy5/dest_serial -incoming defer -drive
> file=/tmp/migration-test-LndGy5/bootsect,format=raw -accel qtest
> [New LWP 807112]
> [New LWP 807114]
> [New LWP 807116]
> [New LWP 807117]
> [Thread debugging using libthread_db enabled]
> Using host libthread_db library "/lib/aarch64-linux-gnu/libthread_db.so.1".
> 0x0000ffff7d982234 in __ppoll (fds=0xaaaaf7c8cdf0, nfds=6,
> timeout=<optimized out>, timeout@entry=0xffffce77ca78,
> sigmask=sigmask@entry=0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
> 44      ../sysdeps/unix/sysv/linux/ppoll.c: No such file or directory.
> 
> Thread 5 (Thread 0xffff6af08560 (LWP 807117)):
> #0  futex_wait_cancelable (private=0, expected=0,
> futex_word=0xaaaaf6e0860c) at ../sysdeps/nptl/futex-internal.h:183
> #1  __pthread_cond_wait_common (abstime=0x0, clockid=0,
> mutex=0xaaaabbcab168 <qemu_global_mutex>, cond=0xaaaaf6e085e0) at
> pthread_cond_wait.c:508
> #2  __pthread_cond_wait (cond=cond@entry=0xaaaaf6e085e0,
> mutex=mutex@entry=0xaaaabbcab168 <qemu_global_mutex>) at
> pthread_cond_wait.c:638
> #3  0x0000aaaabb34f96c in qemu_cond_wait_impl (cond=0xaaaaf6e085e0,
> mutex=0xaaaabbcab168 <qemu_global_mutex>, file=0xaaaabb4b9f08
> "../../softmmu/cpus.c", line=506) at
> ../../util/qemu-thread-posix.c:194
> #4  0x0000aaaabb130258 in rr_cpu_thread_fn
> (arg=arg@entry=0xaaaaf6de9430) at
> ../../accel/tcg/tcg-accel-ops-rr.c:164
> #5  0x0000aaaabb34f098 in qemu_thread_start (args=<optimized out>) at
> ../../util/qemu-thread-posix.c:541
> #6  0x0000ffff7da324fc in start_thread (arg=0xffffce77c2af) at
> pthread_create.c:477
> #7  0x0000ffff7d98b67c in thread_start () at
> ../sysdeps/unix/sysv/linux/aarch64/clone.S:78
> 
> Thread 4 (Thread 0xffff6b7fa560 (LWP 807116)):
> #0  0x0000ffff7d982128 in __GI___poll (fds=0xffff1c003280, nfds=3,
> timeout=<optimized out>) at ../sysdeps/unix/sysv/linux/poll.c:41
> #1  0x0000ffff7fa2bb30 in  () at /lib/aarch64-linux-gnu/libglib-2.0.so.0
> #2  0x0000ffff7fa2bef0 in g_main_loop_run () at
> /lib/aarch64-linux-gnu/libglib-2.0.so.0
> #3  0x0000aaaabb18c3bc in iothread_run
> (opaque=opaque@entry=0xaaaaf6b29350) at ../../iothread.c:73
> #4  0x0000aaaabb34f098 in qemu_thread_start (args=<optimized out>) at
> ../../util/qemu-thread-posix.c:541
> #5  0x0000ffff7da324fc in start_thread (arg=0xffffce77c46f) at
> pthread_create.c:477
> #6  0x0000ffff7d98b67c in thread_start () at
> ../sysdeps/unix/sysv/linux/aarch64/clone.S:78
> 
> Thread 3 (Thread 0xffff6bffb560 (LWP 807114)):
> #0  0x0000ffff7d8eef4c in __GI___sigtimedwait
> (set=set@entry=0xaaaaf6aa8370, info=info@entry=0xffff6bffaad8,
> timeout=timeout@entry=0x0) at
> ../sysdeps/unix/sysv/linux/sigtimedwait.c:29
> #1  0x0000ffff7da3dd24 in __sigwait (set=set@entry=0xaaaaf6aa8370,
> sig=sig@entry=0xffff6bffaba4) at
> ../sysdeps/unix/sysv/linux/sigwait.c:28
> #2  0x0000aaaabb377e34 in sigwait_compat
> (opaque=opaque@entry=0xaaaaf6aa8370) at ../../util/compatfd.c:36
> #3  0x0000aaaabb34f098 in qemu_thread_start (args=<optimized out>) at
> ../../util/qemu-thread-posix.c:541
> #4  0x0000ffff7da324fc in start_thread (arg=0xffffce77c6ef) at
> pthread_create.c:477
> #5  0x0000ffff7d98b67c in thread_start () at
> ../sysdeps/unix/sysv/linux/aarch64/clone.S:78
> 
> Thread 2 (Thread 0xffff70a30560 (LWP 807112)):
> #0  syscall () at ../sysdeps/unix/sysv/linux/aarch64/syscall.S:38
> #1  0x0000aaaabb350140 in qemu_futex_wait (val=<optimized out>,
> f=<optimized out>) at /home/pm/qemu/include/qemu/futex.h:29
> #2  qemu_event_wait (ev=ev@entry=0xaaaabbcae358
> <rcu_call_ready_event>) at ../../util/qemu-thread-posix.c:480
> #3  0x0000aaaabb352d3c in call_rcu_thread (opaque=opaque@entry=0x0) at
> ../../util/rcu.c:258
> #4  0x0000aaaabb34f098 in qemu_thread_start (args=<optimized out>) at
> ../../util/qemu-thread-posix.c:541
> #5  0x0000ffff7da324fc in start_thread (arg=0xffffce77c92f) at
> pthread_create.c:477
> #6  0x0000ffff7d98b67c in thread_start () at
> ../sysdeps/unix/sysv/linux/aarch64/clone.S:78
> 
> Thread 1 (Thread 0xffff70b8f010 (LWP 807045)):
> #0  0x0000ffff7d982234 in __ppoll (fds=0xaaaaf7c8cdf0, nfds=6,
> timeout=<optimized out>, timeout@entry=0xffffce77ca78,
> sigmask=sigmask@entry=0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
> #1  0x0000aaaabb37702c in ppoll (__ss=0x0, __timeout=0xffffce77ca78,
> __nfds=<optimized out>, __fds=<optimized out>) at
> /usr/include/aarch64-linux-gnu/bits/poll2.h:77
> #2  qemu_poll_ns (fds=<optimized out>, nfds=<optimized out>,
> timeout=timeout@entry=1000000000) at ../../util/qemu-timer.c:348
> #3  0x0000aaaabb3678d4 in os_host_main_loop_wait (timeout=1000000000)
> at ../../util/main-loop.c:250
> #4  main_loop_wait (nonblocking=nonblocking@entry=0) at
> ../../util/main-loop.c:531
> #5  0x0000aaaabb146348 in qemu_main_loop () at ../../softmmu/runstate.c:726
> #6  0x0000aaaabadc5a28 in main (argc=<optimized out>, argv=<optimized
> out>, envp=<optimized out>) at ../../softmmu/main.c:50
> [Inferior 1 (process 807045) detached]
> 
> 
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


