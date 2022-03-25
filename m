Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C055B4E6F4B
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 09:08:41 +0100 (CET)
Received: from localhost ([::1]:44330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXezw-0001YZ-JI
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 04:08:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nXevX-0000eQ-LI
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 04:04:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nXevU-0000A5-Az
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 04:04:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648195443;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=4pztfmDTLgoCOjKDqaVKsBU95A1sQxw9eIp8muBuVnA=;
 b=fiZHvBuGxgVVW6fVjOaiwC2b1DBk3ZpkSKplz5QQ14TQtw0ML4Pfl3uubpPoNgQhT+AKoB
 5pVM/M2v2NTZ2x4vgl9N+GJB8Cq3Of5PwDXKMgaELo7TaBrcYPToF/M+8xxaITah10y+Vm
 9oNEQF9U3MmPSYYKNdHND1uw4gRHOXg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-TvK_CVyENmCfaRo0cfDI0g-1; Fri, 25 Mar 2022 04:04:02 -0400
X-MC-Unique: TvK_CVyENmCfaRo0cfDI0g-1
Received: by mail-wm1-f69.google.com with SMTP id
 n19-20020a7bcbd3000000b0038c94b86258so2427258wmi.2
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 01:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=4pztfmDTLgoCOjKDqaVKsBU95A1sQxw9eIp8muBuVnA=;
 b=adD1mFSiy7GF/ClBSZ73+PYr5X8bQKsAfR4nsghTbm+fnJnAsDJb+FCVCb27payiDx
 qYwRSYh/hNhxDCR4axCGrXQ4ZhZzaTaMnETeOwYvs9w+hCXjfVd+2iYlMkqrk6exJZeE
 iKXUx0FV3F5Ib84npbUVkE1WDggUOZn2PBrGGAhExuOpfjCgXdirYXIZUQ6GypqmfcLf
 5Hzjpluc9+EjYrXhYscDUJVZ5X2Y4r/LjjkzPhGPRdpevRaa2UZlwhFyYQKuYahNzivc
 wtX9/Vm/6d7TYGcZKkhZ5UYJJ9BexMzBdFflzifjSjDTYay1DnDDFwTr/b6T3ZEXUivI
 oe6A==
X-Gm-Message-State: AOAM533AIvp7tPn8MqTTP9bYWQPlGoZmHQESLJlXnayctIAHep/g5ywV
 ghiGr9lAvGP0wu4dbu99EHci6599T1lGzRq1rd45hYy04aeJU56AhEbQfqVFDP0VoHVV8o6MFI7
 lrW3sdNJqR4INaQE=
X-Received: by 2002:a05:6000:22a:b0:203:f7f8:e006 with SMTP id
 l10-20020a056000022a00b00203f7f8e006mr7951431wrz.175.1648195439649; 
 Fri, 25 Mar 2022 01:03:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiETj0X5vy7pL4nKKII5AClu8ftpsTKV7wKkcT9igXvg4TFVDXot38fh12VjMoFCQudL4c7g==
X-Received: by 2002:a05:6000:22a:b0:203:f7f8:e006 with SMTP id
 l10-20020a056000022a00b00203f7f8e006mr7951379wrz.175.1648195439005; 
 Fri, 25 Mar 2022 01:03:59 -0700 (PDT)
Received: from localhost ([47.63.10.52]) by smtp.gmail.com with ESMTPSA id
 p2-20020a5d4582000000b00203f51aa12asm4445732wrq.55.2022.03.25.01.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 01:03:58 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: hang in migration-test (s390 host)
In-Reply-To: <2d9e3abd-99de-dc56-c6bd-93e54cd22b8e@redhat.com> (Laurent
 Vivier's message of "Thu, 24 Mar 2022 13:59:16 +0100")
References: <CAFEAcA_X7d9-e+u3UpB5WvJrmJhhRKdw8EhUzCdFDNVfhFF8mg@mail.gmail.com>
 <2d9e3abd-99de-dc56-c6bd-93e54cd22b8e@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Fri, 25 Mar 2022 09:03:56 +0100
Message-ID: <87zglee9w3.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: quintela@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Laurent Vivier <lvivier@redhat.com> wrote:
> Perhaps Juan or Thomas can help too (added to cc)
>
> Is this a regression?
> It looks like a bug in QEMU as it doesn't move from cancelling to cancelled.

Hi

TCG never stops given.  And s390 makes things even more interesting.
First of all, it is a pity that glib debug symbols are not loaded.

>> PROCESS: 2771497
>> gitlab-+ 2771497 2769521 10 Mar23 ?        01:51:09
>> /home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/build/tests/qtest/migration-test
>> --tap -k
>> [New LWP 2771498]
>> [Thread debugging using libthread_db enabled]
>> Using host libthread_db library "/lib/s390x-linux-gnu/libthread_db.so.1".
>> __libc_read (nbytes=1, buf=0x3ffd577abd7, fd=4) at
>> ../sysdeps/unix/sysv/linux/read.c:26
>> 26      ../sysdeps/unix/sysv/linux/read.c: No such file or directory.
>> Thread 2 (Thread 0x3ffb197f900 (LWP 2771498)):
>> #0  syscall () at ../sysdeps/unix/sysv/linux/s390/s390-64/syscall.S:37
>> #1  0x000002aa00535c14 in qemu_futex_wait (val=<optimized out>,
>> f=<optimized out>) at
>> /home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/include/qemu/futex.h:29
>> #2  qemu_event_wait (ev=ev@entry=0x2aa0056eb50 <rcu_call_ready_event>)
>> at ../util/qemu-thread-posix.c:481
>> #3  0x000002aa00541aca in call_rcu_thread (opaque=opaque@entry=0x0) at
>> ../util/rcu.c:261
>> #4  0x000002aa00534c0a in qemu_thread_start (args=<optimized out>) at
>> ../util/qemu-thread-posix.c:556
>> #5  0x000003ffb1c07e66 in start_thread (arg=0x3ffb197f900) at
>> pthread_create.c:477
>> #6  0x000003ffb1afcbf6 in thread_start () at
>> ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Starting rcu thread.

>> Thread 1 (Thread 0x3ffb1ff5430 (LWP 2771497)):
>> #0  __libc_read (nbytes=1, buf=0x3ffd577abd7, fd=4) at
>> ../sysdeps/unix/sysv/linux/read.c:26
>> #1  __libc_read (fd=fd@entry=4, buf=buf@entry=0x3ffd577abd7,
>> nbytes=nbytes@entry=1) at ../sysdeps/unix/sysv/linux/read.c:24
>> #2  0x000002aa00511bc4 in read (__nbytes=1, __buf=0x3ffd577abd7,
>> __fd=4) at /usr/include/s390x-linux-gnu/bits/unistd.h:44
>> #3  qmp_fd_receive (fd=<optimized out>) at ../tests/qtest/libqtest.c:613
>> #4  0x000002aa00511c6a in qtest_qmp_receive_dict (s=0x2aa00ea3110) at
>> ../tests/qtest/libqtest.c:648
>> #5  qtest_qmp_receive (s=s@entry=0x2aa00ea3110) at ../tests/qtest/libqtest.c:636
>> #6  0x000002aa00512554 in qtest_vqmp (s=s@entry=0x2aa00ea3110,
>> fmt=fmt@entry=0x2aa00548098 "{ 'execute': 'query-migrate' }",
>> ap=ap@entry=0x3ffd577ad80) at ../tests/qtest/libqtest.c:749
>> #7  0x000002aa00510386 in wait_command (who=who@entry=0x2aa00ea3110,
>> command=command@entry=0x2aa00548098 "{ 'execute': 'query-migrate' }")
>> at ../tests/qtest/migration-helpers.c:63
>> #8  0x000002aa00510498 in migrate_query (who=who@entry=0x2aa00ea3110)
>> at ../tests/qtest/migration-helpers.c:116
>> #9  migrate_query_status (who=who@entry=0x2aa00ea3110) at
>> ../tests/qtest/migration-helpers.c:116
>> #10 0x000002aa005106ac in check_migration_status (ungoals=0x0,
>> goal=0x2aa00547a10 "cancelled", who=0x2aa00ea3110) at
>> ../tests/qtest/migration-helpers.c:156
>> #11 wait_for_migration_status (who=0x2aa00ea3110, goal=<optimized
>> out>, ungoals=0x0) at ../tests/qtest/migration-helpers.c:156
>> #12 0x000002aa0050fbc2 in test_multifd_tcp_cancel () at
>> ../tests/qtest/migration-test.c:1379
>> #13 0x000003ffb1dfe608 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
>> #14 0x000003ffb1dfe392 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
>> #15 0x000003ffb1dfe392 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
>> #16 0x000003ffb1dfe392 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
>> #17 0x000003ffb1dfe392 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
>> #18 0x000003ffb1dfeada in g_test_run_suite () from
>> /lib/s390x-linux-gnu/libglib-2.0.so.0
>> #19 0x000003ffb1dfeb10 in g_test_run () from
>> /lib/s390x-linux-gnu/libglib-2.0.so.0
>> #20 0x000002aa0050cea8 in main (argc=<optimized out>, argv=<optimized
>> out>) at ../tests/qtest/migration-test.c:1491

This is the main process that is waiting for qemu.  I was not even aware
that we used threads on this program.  Anyways, if the problem is here,
the probem is on the test harness code, not in qemu.

>> [Inferior 1 (process 2771497) detached]
>> ===========================================================
>> PROCESS: 2772862
>> gitlab-+ 2772862 2771497 99 Mar23 ?        18:45:28 ./qemu-system-i386
>> -qtest unix:/tmp/qtest-2771497.sock -qtest-log /dev/null -chardev
>> socket,path=/tmp/qtest-2771497.qmp,id=char0 -mon
>> chardev=char0,mode=control -display none -accel kvm -accel tcg -name
>> source,debug-threads=on -m 150M -serial
>> file:/tmp/migration-test-f6G71L/src_serial -drive
>> file=/tmp/migration-test-f6G71L/bootsect,format=raw -accel qtest

Source of migration thread.

>> [New LWP 2772864]
>> [New LWP 2772866]
>> [New LWP 2772867]
>> [New LWP 2772915]
>> [Thread debugging using libthread_db enabled]
>> Using host libthread_db library "/lib/s390x-linux-gnu/libthread_db.so.1".
>> 0x000003ff94ef1c9c in __ppoll (fds=0x2aa179a6f30, nfds=5,
>> timeout=<optimized out>, timeout@entry=0x3fff557b588,
>> sigmask=sigmask@entry=0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
>> 44      ../sysdeps/unix/sysv/linux/ppoll.c: No such file or directory.
>> Thread 5 (Thread 0x3ff1b7f6900 (LWP 2772915)):
>> #0  futex_abstimed_wait_cancelable (private=0, abstime=0x0, clockid=0,
>> expected=0, futex_word=0x2aa1881f634) at
>> ../sysdeps/nptl/futex-internal.h:320
>> #1  do_futex_wait (sem=sem@entry=0x2aa1881f630, abstime=0x0,
>> clockid=0) at sem_waitcommon.c:112
>> #2  0x000003ff95011870 in __new_sem_wait_slow
>> (sem=sem@entry=0x2aa1881f630, abstime=0x0, clockid=0) at
>> sem_waitcommon.c:184
>> #3  0x000003ff9501190e in __new_sem_wait (sem=sem@entry=0x2aa1881f630)
>> at sem_wait.c:42
>> #4  0x000002aa165b1416 in qemu_sem_wait (sem=sem@entry=0x2aa1881f630)
>> at ../util/qemu-thread-posix.c:358
>> #5  0x000002aa16023434 in multifd_send_sync_main (f=0x2aa17993760) at
>> ../migration/multifd.c:610
>> #6  0x000002aa162a8f18 in ram_save_iterate (f=0x2aa17993760,
>> opaque=<optimized out>) at ../migration/ram.c:3049
>> #7  0x000002aa1602bafc in qemu_savevm_state_iterate (f=0x2aa17993760,
>> postcopy=<optimized out>) at ../migration/savevm.c:1296
>> #8  0x000002aa1601fe4e in migration_iteration_run (s=0x2aa17748010) at
>> ../migration/migration.c:3607
>> #9  migration_thread (opaque=opaque@entry=0x2aa17748010) at
>> ../migration/migration.c:3838
>> #10 0x000002aa165b05c2 in qemu_thread_start (args=<optimized out>) at
>> ../util/qemu-thread-posix.c:556
>> #11 0x000003ff95007e66 in start_thread (arg=0x3ff1b7f6900) at
>> pthread_create.c:477
>> #12 0x000003ff94efcbf6 in thread_start () at
>> ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Migration main thread in multifd_send_sync_main(), waiting for the
semaphore in

    for (i = 0; i < migrate_multifd_channels(); i++) {
        MultiFDSendParams *p = &multifd_send_state->params[i];

        trace_multifd_send_sync_main_wait(p->id);
        qemu_sem_wait(&p->sem_sync);
    }

Knowing the value of i would be great.  See the end of the email, I
think it is going to be 0.

>> Thread 4 (Thread 0x3ff84d2f900 (LWP 2772867)):
>> #0  rcu_read_lock () at
>> /home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/include/qemu/rcu.h:87
>> #1  rcu_read_auto_lock () at
>> /home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/include/qemu/rcu.h:170
>> #2  memory_region_get_ram_ptr (mr=0x2aa17612220) at ../softmmu/memory.c:2319
>> #3  0x000002aa1637abf0 in tlb_set_page_with_attrs
>> (cpu=cpu@entry=0x2aa179860a0, vaddr=vaddr@entry=52445184,
>> paddr=<optimized out>, attrs=..., prot=<optimized out>, prot@entry=7,
>> mmu_idx=2, size=4096) at ../accel/tcg/cputlb.c:1157
>> #4  0x000002aa1620465e in handle_mmu_fault (size=<optimized out>,
>> mmu_idx=<optimized out>, is_write1=<optimized out>, addr=<optimized
>> out>, cs=0x2aa179860a0) at ../target/i386/cpu.h:2157
>> #5  x86_cpu_tlb_fill (cs=0x2aa179860a0, addr=<optimized out>,
>> size=<optimized out>, access_type=<optimized out>, mmu_idx=<optimized
>> out>, probe=false, retaddr=4394827381568) at
>> ../target/i386/tcg/sysemu/excp_helper.c:432
>> #6  0x000002aa16375cea in tlb_fill (cpu=0x2aa179860a0, addr=<optimized
>> out>, size=<optimized out>, access_type=<optimized out>,
>> mmu_idx=<optimized out>, retaddr=4394827381568) at
>> ../accel/tcg/cputlb.c:1313
>> #7  0x000002aa16376cd6 in load_helper (full_load=<optimized out>,
>> code_read=false, op=MO_8, retaddr=<optimized out>, oi=<optimized out>,
>> addr=52445184, env=0x2aa1798e970) at
>> /home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/include/exec/cpu-all.h:467
>> #8  full_ldub_mmu (env=0x2aa1798e970, addr=<optimized out>,
>> oi=<optimized out>, retaddr=<optimized out>) at
>> ../accel/tcg/cputlb.c:2025
>> #9  0x000003ff401ffbfa in code_gen_buffer ()
>> #10 0x000002aa16369d0e in cpu_tb_exec (tb_exit=<synthetic pointer>,
>> itb=<optimized out>, cpu=<optimized out>) at
>> ../accel/tcg/cpu-exec.c:357
>> #11 cpu_loop_exec_tb (tb_exit=<synthetic pointer>, last_tb=<synthetic
>> pointer>, tb=<optimized out>, cpu=<optimized out>) at
>> ../accel/tcg/cpu-exec.c:847
>> #12 cpu_exec (cpu=<optimized out>) at ../accel/tcg/cpu-exec.c:1006
>> #13 0x0000000000007000 in  ()

vcpu running thread, rcu_read_lock()

    if (p_rcu_reader->depth++ > 0) {
        return;
    }

If we are looking the same code, this thread is running normally in the
if line.

>> Thread 3 (Thread 0x3ff85621900 (LWP 2772866)):
>> #0  0x000003ff94ef1b42 in __GI___poll (fds=0x3ff380032a0, nfds=3,
>> timeout=<optimized out>) at ../sysdeps/unix/sysv/linux/poll.c:29
>> #1  0x000003ff975d4386 in  () at /lib/s390x-linux-gnu/libglib-2.0.so.0
>> #2  0x000003ff975d4790 in g_main_loop_run () at
>> /lib/s390x-linux-gnu/libglib-2.0.so.0
>> #3  0x000002aa163bfa4e in iothread_run
>> (opaque=opaque@entry=0x2aa176ad000) at ../iothread.c:73
>> #4  0x000002aa165b05c2 in qemu_thread_start (args=<optimized out>) at
>> ../util/qemu-thread-posix.c:556
>> #5  0x000003ff95007e66 in start_thread (arg=0x3ff85621900) at
>> pthread_create.c:477
>> #6  0x000003ff94efcbf6 in thread_start () at
>> ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

iothread on poll, nothing fishy here.

>> Thread 2 (Thread 0x3ff85fa4900 (LWP 2772864)):
>> #0  syscall () at ../sysdeps/unix/sysv/linux/s390/s390-64/syscall.S:37
>> #1  0x000002aa165b15cc in qemu_futex_wait (val=<optimized out>,
>> f=<optimized out>) at
>> /home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/include/qemu/futex.h:29
>> #2  qemu_event_wait (ev=ev@entry=0x2aa16f57e60 <rcu_call_ready_event>)
>> at ../util/qemu-thread-posix.c:481
>> #3  0x000002aa165b9e42 in call_rcu_thread (opaque=opaque@entry=0x0) at
>> ../util/rcu.c:261
>> #4  0x000002aa165b05c2 in qemu_thread_start (args=<optimized out>) at
>> ../util/qemu-thread-posix.c:556
>> #5  0x000003ff95007e66 in start_thread (arg=0x3ff85fa4900) at
>> pthread_create.c:477
>> #6  0x000003ff94efcbf6 in thread_start () at
>> ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Calling the rcu thread here.

>> Thread 1 (Thread 0x3ff983fe440 (LWP 2772862)):
>> #0  0x000003ff94ef1c9c in __ppoll (fds=0x2aa179a6f30, nfds=5,
>> timeout=<optimized out>, timeout@entry=0x3fff557b588,
>> sigmask=sigmask@entry=0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
>> #1  0x000002aa165d154a in ppoll (__ss=0x0, __timeout=0x3fff557b588,
>> __nfds=<optimized out>, __fds=<optimized out>) at
>> /usr/include/s390x-linux-gnu/bits/poll2.h:77
>> #2  qemu_poll_ns (fds=<optimized out>, nfds=<optimized out>,
>> timeout=timeout@entry=6543045) at ../util/qemu-timer.c:348
>> #3  0x000002aa165cd768 in os_host_main_loop_wait (timeout=6543045) at
>> ../util/main-loop.c:250
>> #4  main_loop_wait (nonblocking=nonblocking@entry=0) at ../util/main-loop.c:531
>> #5  0x000002aa15ffaa94 in qemu_main_loop () at ../softmmu/runstate.c:727
>> #6  0x000002aa15fae7a0 in main (argc=<optimized out>, argv=<optimized
>> out>, envp=<optimized out>) at ../softmmu/main.c:50


Man thread also calling poll().  Nothing unusual here.

But where are the multifd channel threads, nowhere to be seen.

>> [Inferior 1 (process 2772862) detached]
>> ===========================================================
>> PROCESS: 2772869
>> gitlab-+ 2772869 2771497  0 Mar23 ?        00:00:00 [qemu-system-i38] <defunct>
>> /proc/2772869/exe: No such file or directory.
>> Could not attach to process.  If your uid matches the uid of the target
>> process, check the setting of /proc/sys/kernel/yama/ptrace_scope, or try
>> again as the root user.  For more details, see /etc/sysctl.d/10-ptrace.conf
>> warning: process 2772869 is a zombie - the process has already terminated
>> ptrace: Operation not permitted.
>> /home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/build/2772869:
>> No such file or directory.

I have no clue what is this process and what this have to do with this
run, what can it be?  We already have two qemu's and a test harness
programm.  Can this be from a previous test case that we are still
waiting for?


>> ===========================================================
>> PROCESS: 2773014
>> gitlab-+ 2773014 2771497  0 Mar23 ?        00:00:02 ./qemu-system-i386
>> -qtest unix:/tmp/qtest-2771497.sock -qtest-log /dev/null -chardev
>> socket,path=/tmp/qtest-2771497.qmp,id=char0 -mon
>> chardev=char0,mode=control -display none -accel kvm -accel tcg -name
>> target,debug-threads=on -m 150M -serial
>> file:/tmp/migration-test-f6G71L/dest_serial -incoming defer -drive
>> file=/tmp/migration-test-f6G71L/bootsect,format=raw -accel qtest
>> [New LWP 2773017]
>> [New LWP 2773018]
>> [New LWP 2773019]

Note to myself, we should name the qemu process "somehow" to know at
what test they belong.

This is the destination migration process.

>> [Thread debugging using libthread_db enabled]
>> Using host libthread_db library "/lib/s390x-linux-gnu/libthread_db.so.1".
>> 0x000003ffa4671c9c in __ppoll (fds=0x2aa0333c020, nfds=6,
>> timeout=<optimized out>, timeout@entry=0x3ffedefb228,
>> sigmask=sigmask@entry=0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
>> 44      ../sysdeps/unix/sysv/linux/ppoll.c: No such file or directory.
>> Thread 4 (Thread 0x3ff4ffff900 (LWP 2773019)):
>> #0  futex_wait_cancelable (private=0, expected=0,
>> futex_word=0x2aa0333af7c) at ../sysdeps/nptl/futex-internal.h:183
>> #1  __pthread_cond_wait_common (abstime=0x0, clockid=0,
>> mutex=0x2aa01f26f10 <qemu_global_mutex>, cond=0x2aa0333af50) at
>> pthread_cond_wait.c:508
>> #2  __pthread_cond_wait (cond=cond@entry=0x2aa0333af50,
>> mutex=mutex@entry=0x2aa01f26f10 <qemu_global_mutex>) at
>> pthread_cond_wait.c:638
>> #3  0x000002aa015b0e56 in qemu_cond_wait_impl (cond=0x2aa0333af50,
>> mutex=0x2aa01f26f10 <qemu_global_mutex>, file=0x2aa0162e3fc
>> "../softmmu/cpus.c", line=<optimized out>) at
>> ../util/qemu-thread-posix.c:195
>> #4  0x000002aa00ff4436 in qemu_wait_io_event
>> (cpu=cpu@entry=0x2aa0331b0a0) at ../softmmu/cpus.c:424
>> #5  0x000002aa013852e0 in mttcg_cpu_thread_fn
>> (arg=arg@entry=0x2aa0331b0a0) at
>> ../accel/tcg/tcg-accel-ops-mttcg.c:124
>> #6  0x000002aa015b05c2 in qemu_thread_start (args=<optimized out>) at
>> ../util/qemu-thread-posix.c:556
>> #7  0x000003ffa4787e66 in start_thread (arg=0x3ff4ffff900) at
>> pthread_create.c:477
>> #8  0x000003ffa467cbf6 in thread_start () at
>> ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

mttcg_cpu_thread.  No clue what it does, but it shouldn't be related to
migration (famous last words).

>> Thread 3 (Thread 0x3ff54da1900 (LWP 2773018)):
>> #0  0x000003ffa4671b42 in __GI___poll (fds=0x3ff48003250, nfds=3,
>> timeout=<optimized out>) at ../sysdeps/unix/sysv/linux/poll.c:29
>> #1  0x000003ffa6d54386 in  () at /lib/s390x-linux-gnu/libglib-2.0.so.0
>> #2  0x000003ffa6d54790 in g_main_loop_run () at
>> /lib/s390x-linux-gnu/libglib-2.0.so.0
>> #3  0x000002aa013bfa4e in iothread_run
>> (opaque=opaque@entry=0x2aa03042000) at ../iothread.c:73
>> #4  0x000002aa015b05c2 in qemu_thread_start (args=<optimized out>) at
>> ../util/qemu-thread-posix.c:556
>> #5  0x000003ffa4787e66 in start_thread (arg=0x3ff54da1900) at
>> pthread_create.c:477
>> #6  0x000003ffa467cbf6 in thread_start () at
>> ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

iothread in poll(), nothing interesting here.

>> Thread 2 (Thread 0x3ff95724900 (LWP 2773017)):
>> #0  syscall () at ../sysdeps/unix/sysv/linux/s390/s390-64/syscall.S:37
>> #1  0x000002aa015b15cc in qemu_futex_wait (val=<optimized out>,
>> f=<optimized out>) at
>> /home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/include/qemu/futex.h:29
>> #2  qemu_event_wait (ev=ev@entry=0x2aa01f57e60 <rcu_call_ready_event>)
>> at ../util/qemu-thread-posix.c:481
>> #3  0x000002aa015b9e42 in call_rcu_thread (opaque=opaque@entry=0x0) at
>> ../util/rcu.c:261
>> #4  0x000002aa015b05c2 in qemu_thread_start (args=<optimized out>) at
>> ../util/qemu-thread-posix.c:556
>> #5  0x000003ffa4787e66 in start_thread (arg=0x3ff95724900) at
>> pthread_create.c:477
>> #6  0x000003ffa467cbf6 in thread_start () at
>> ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

rthu thread again.

>> Thread 1 (Thread 0x3ffa7b7e440 (LWP 2773014)):
>> #0  0x000003ffa4671c9c in __ppoll (fds=0x2aa0333c020, nfds=6,
>> timeout=<optimized out>, timeout@entry=0x3ffedefb228,
>> sigmask=sigmask@entry=0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
>> #1  0x000002aa015d154a in ppoll (__ss=0x0, __timeout=0x3ffedefb228,
>> __nfds=<optimized out>, __fds=<optimized out>) at
>> /usr/include/s390x-linux-gnu/bits/poll2.h:77
>> #2  qemu_poll_ns (fds=<optimized out>, nfds=<optimized out>,
>> timeout=timeout@entry=1000000000) at ../util/qemu-timer.c:348
>> #3  0x000002aa015cd768 in os_host_main_loop_wait (timeout=1000000000)
>> at ../util/main-loop.c:250
>> #4  main_loop_wait (nonblocking=nonblocking@entry=0) at ../util/main-loop.c:531
>> #5  0x000002aa00ffaa94 in qemu_main_loop () at ../softmmu/runstate.c:727
>> #6  0x000002aa00fae7a0 in main (argc=<optimized out>, argv=<optimized
>> out>, envp=<optimized out>) at ../softmmu/main.c:50
>> [Inferior 1 (process 2773014) detached]

main thread here calling poll,  Nothing unusual here.

But I don't see any multifd threads here.  Can it be that the migration
hasn't yet started here, but then how are the source side already on the sync_main?

Only real explanation that I can think for this behaviour is if we
called migration_cancel() before we even got the oportunity of creating
the multifd channels, and we are waiting for them.  The only thing that
cames to mind here is change the code to something like this:

    for (i = 0; i < migrate_multifd_channels(); i++) {
        MultiFDSendParams *p = &multifd_send_state->params[i];

        trace_multifd_send_sync_main_wait(p->id);
        qemu_mutex_lock(&p->mutex);
        if (p->running)
            qemu_sem_wait(&p->sem_sync);
        qemu_mutex_unlock(&p->mutex);
    }

But notice that we have another loop just before this one that already
loops through the same threads, so I have to think more how this can
even happen.

Later, Juan.


