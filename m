Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1671F3D2024
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 10:47:01 +0200 (CEST)
Received: from localhost ([::1]:36350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6UM8-0007CF-5q
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 04:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m6UKb-0006Nl-Er
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 04:45:27 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:48522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m6UKY-0002mv-U1
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 04:45:24 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A1867225FC;
 Thu, 22 Jul 2021 08:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626943521; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QZ5tZnDTohrR09fdO0pCPMZwAcve/8so9ZKhLi8BuMY=;
 b=T2UCRCaZtcm/r2TQmRGbcRPXOmw0AuOE11QNuOFQu1tf29mPCjt43xHZvbW71KRCPWqryA
 x+ZQlKPElFpkwkWAvCeWOzgJsQgiK0aPg3Yr0Yx66UH8gT/txsMK6u1q5T/b0YWm5eRXz4
 MlspjaKe5qWB9p1CAl+5Dt09U/ETw7w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626943521;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QZ5tZnDTohrR09fdO0pCPMZwAcve/8so9ZKhLi8BuMY=;
 b=jYMiYv3JIRKkFSpzz712M6UMURM0JLbUJ1TcfLEvC8zU8rp986xNl11cyhwuJYg4ADpMmB
 +tbvok8NMlQq6GAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6D21E13DA5;
 Thu, 22 Jul 2021 08:45:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4yILGSEw+WD7cQAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 22 Jul 2021 08:45:21 +0000
Subject: Re: intermittent hang in qos-test for qemu-system-i386 on 32-bit arm
 host
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAFEAcA-L5kztvCiS-Y+_LDiaFgWzuCpPYN1-cHNY9Q8qpi538Q@mail.gmail.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <78d300da-71b9-55b2-2dd3-3b02cebb2dfe@suse.de>
Date: Thu, 22 Jul 2021 10:45:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-L5kztvCiS-Y+_LDiaFgWzuCpPYN1-cHNY9Q8qpi538Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.117,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Coiby Xu <Coiby.Xu@gmail.com>, Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/10/21 3:30 PM, Peter Maydell wrote:
> I've noticed recently that intermittently 'make check' will hang on
> my aarch32 test system (really an aarch64 box with an aarch32 chroot).
> 
> I think from grep that this must be the vhost-user-blk test.
> 
> Here's the process tree:
> 
> pmaydell 13126  0.0  0.0   8988  6416 ?        S    Jul09   0:01 make
> -C build/all-a32 check V=1 GCC_COLORS= -j9
> pmaydell 19632  0.0  0.0   4432  2096 ?        S    Jul09   0:00  \_
> bash -o pipefail -c echo 'MALLOC_PERTURB_=${MALLOC_PERTURB_:-$((
> ${RANDOM:-0} % 255 + 1))} QTEST_QEMU_IMG=./qemu-img
> G_TEST_DBUS_DAEMON=/home/peter.maydell/qemu/tests/dbus-vmstate-daemon.sh
> QTEST_QEMU_BINARY=./qemu-system-i386
> QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon
> tests/qtest/qos-test --tap -k' &&
> MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> QTEST_QEMU_IMG=./qemu-img
> G_TEST_DBUS_DAEMON=/home/peter.maydell/qemu/tests/dbus-vmstate-daemon.sh
> QTEST_QEMU_BINARY=./qemu-system-i386
> QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon
> tests/qtest/qos-test --tap -k -m quick < /dev/null |
> ./scripts/tap-driver.pl --test-name="qtest-i386/qos-test"
> pmaydell 19634  0.0  0.0  13608  3076 ?        Sl   Jul09   0:02
> \_ tests/qtest/qos-test --tap -k -m quick
> pmaydell 20679  0.0  0.0 109076 16100 ?        Sl   Jul09   0:00
> |   \_ ./storage-daemon/qemu-storage-daemon --blockdev
> driver=file,node-name=disk0,filename=qtest.X7RL2X --export
> type=vhost-user-blk,id=disk0,addr.type=unix,addr.path=/tmp/qtest-19634-sock.9LJoHn,node-name=disk0,writable=on,num-queues=1
> pmaydell 20681  0.0  0.2 447828 46544 ?        Sl   Jul09   0:00
> |   \_ ./qemu-system-i386 -qtest unix:/tmp/qtest-19634.sock -qtest-log
> /dev/null -chardev socket,path=/tmp/qtest-19634.qmp,id=char0 -mon
> chardev=char0,mode=control -display none -M pc -device
> vhost-user-blk-pci,id=drv0,chardev=char1,addr=4.0 -object
> memory-backend-memfd,id=mem,size=256M,share=on -M memory-backend=mem
> -m 256M -chardev socket,id=char1,path=/tmp/qtest-19634-sock.9LJoHn
> -accel qtest
> pmaydell 19635  0.0  0.0  10256  7176 ?        S    Jul09   0:00
> \_ perl ./scripts/tap-driver.pl --test-name=qtest-i386/qos-test
> 
> 
> Backtrace from tests/qtest/qos-test (not as helpful as it could
> be since this is an optimized build):
> 
> (gdb) thread apply all bt
> 
> Thread 2 (Thread 0xf76ff240 (LWP 19636)):
> #0  syscall () at ../sysdeps/unix/sysv/linux/arm/syscall.S:37
> #1  0x005206de in qemu_futex_wait (val=<optimised out>, f=<optimised
> out>) at /home/peter.maydell/qemu/include/qemu/futex.h:29
> #2  qemu_event_wait (ev=ev@entry=0x5816fc <rcu_call_ready_event>) at
> ../../util/qemu-thread-posix.c:480
> #3  0x005469c2 in call_rcu_thread (opaque=<optimised out>) at
> ../../util/rcu.c:258
> #4  0x0051fbc2 in qemu_thread_start (args=<optimised out>) at
> ../../util/qemu-thread-posix.c:541
> #5  0xf785a614 in start_thread (arg=0xf6ce711c) at pthread_create.c:463
> #6  0xf77f57ec in ?? () at ../sysdeps/unix/sysv/linux/arm/clone.S:73
> from /lib/arm-linux-gnueabihf/libc.so.6
> Backtrace stopped: previous frame identical to this frame (corrupt stack?)
> 
> Thread 1 (Thread 0xf7a04010 (LWP 19634)):
> #0  __libc_do_syscall () at ../sysdeps/unix/sysv/linux/arm/libc-do-syscall.S:46
> #1  0xf7861d8c in __libc_read (fd=12, buf=buf@entry=0xff9ce8e4,
> nbytes=nbytes@entry=1024) at ../sysdeps/unix/sysv/linux/read.c:27
> #2  0x004ebc5a in read (__nbytes=1024, __buf=0xff9ce8e4,
> __fd=<optimised out>) at
> /usr/include/arm-linux-gnueabihf/bits/unistd.h:44
> #3  qtest_client_socket_recv_line (s=0x1a46cb8) at
> ../../tests/qtest/libqtest.c:494
> #4  0x004ebd4e in qtest_rsp_args (s=s@entry=0x1a46cb8,
> expected_args=expected_args@entry=1) at
> ../../tests/qtest/libqtest.c:521
> #5  0x004ec1ee in qtest_query_target_endianness (s=0x1a46cb8) at
> ../../tests/qtest/libqtest.c:570
> #6  0x004ec94a in qtest_init_without_qmp_handshake
> (extra_args=<optimised out>) at ../../tests/qtest/libqtest.c:332
> #7  0x004ecd7a in qtest_init (extra_args=<optimised out>) at
> ../../tests/qtest/libqtest.c:339
> #8  0x004ded10 in qtest_start (
>     args=0x1a63710 "-M pc  -device
> vhost-user-blk-pci,id=drv0,chardev=char1,addr=4.0 -object
> memory-backend-memfd,id=mem,size=256M,share=on  -M memory-backend=mem
> -m 256M -chardev socket,id=char1,path=/tmp/qtest-19634-so"...) at
> ../../tests/qtest/libqtest-single.h:29
> #9  restart_qemu_or_continue (
>     path=0x1a63710 "-M pc  -device
> vhost-user-blk-pci,id=drv0,chardev=char1,addr=4.0 -object
> memory-backend-memfd,id=mem,size=256M,share=on  -M memory-backend=mem
> -m 256M -chardev socket,id=char1,path=/tmp/qtest-19634-so"...) at
> ../../tests/qtest/qos-test.c:105
> #10 run_one_test (arg=<optimised out>) at ../../tests/qtest/qos-test.c:178
> #11 0xf794ee74 in ?? () from /usr/lib/arm-linux-gnueabihf/libglib-2.0.so.0
> Backtrace stopped: previous frame identical to this frame (corrupt stack?)
> 
> 
> Backtrace from qemu-system-i386:
> 
> (gdb) thread apply all bt
> 
> Thread 4 (Thread 0xdfd0cb90 (LWP 20734)):
> #0  0xf6f85206 in __libc_do_syscall () at
> ../sysdeps/unix/sysv/linux/arm/libc-do-syscall.S:47
> #1  0xf6f93492 in __GI___sigtimedwait (set=<optimised out>,
>     set@entry=0xdfd0c3c4, info=info@entry=0xdfd0c324,
> timeout=timeout@entry=0x0) at
> ../sysdeps/unix/sysv/linux/sigtimedwait.c:42
> #2  0xf7073e6c in __sigwait (set=set@entry=0xdfd0c3c4,
> sig=sig@entry=0xdfd0c3c0) at ../sysdeps/unix/sysv/linux/sigwait.c:28
> #3  0x00c999a6 in dummy_cpu_thread_fn (arg=0x24d1168) at
> ../../accel/dummy-cpus.c:46
> #4  0x00e18ba2 in qemu_thread_start (args=<optimised out>) at
> ../../util/qemu-thread-posix.c:541
> #5  0xf706b614 in start_thread (arg=0xa8db8843) at pthread_create.c:463
> #6  0xf70067ec in  () at ../sysdeps/unix/sysv/linux/arm/clone.S:73
> 
> Thread 3 (Thread 0xe07fcb90 (LWP 20710)):
> #0  0xf6f85204 in __libc_do_syscall () at
> ../sysdeps/unix/sysv/linux/arm/libc-do-syscall.S:46
> #1  0xf6fff948 in __GI___poll (fds=0x2409b90, nfds=3, timeout=-1) at
> ../sysdeps/unix/sysv/linux/poll.c:29
> #2  0xf781692e in  () at /usr/lib/arm-linux-gnueabihf/libglib-2.0.so.0
> 
> Thread 2 (Thread 0xf1201b90 (LWP 20703)):
> #0  0xf7074f04 in __libc_do_syscall () at
> ../sysdeps/unix/sysv/linux/arm/libc-do-syscall.S:46
> #1  0xf7072ad2 in __lll_lock_wait (futex=futex@entry=0x14f2e68
> <qemu_global_mutex>, private=0) at lowlevellock.c:43
> #2  0xf706d3e2 in __GI___pthread_mutex_lock
> (mutex=mutex@entry=0x14f2e68 <qemu_global_mutex>) at
> pthread_mutex_lock.c:78
> #3  0x00e18c9c in qemu_mutex_lock_impl (mutex=0x14f2e68
> <qemu_global_mutex>, file=0x1355bd4 "../../util/rcu.c", line=266)
>     at ../../util/qemu-thread-posix.c:79
> #4  0x00c1403a in qemu_mutex_lock_iothread_impl (file=0x1355bd4
> "../../util/rcu.c", line=line@entry=266) at ../../softmmu/cpus.c:493
> #5  0x00e15ad4 in call_rcu_thread (opaque=<optimised out>) at
> ../../util/rcu.c:266
> #6  0x00e18ba2 in qemu_thread_start (args=<optimised out>) at
> ../../util/qemu-thread-posix.c:541
> #7  0xf706b614 in start_thread (arg=0xa8db8843) at pthread_create.c:463
> #8  0xf70067ec in  () at ../sysdeps/unix/sysv/linux/arm/clone.S:73
> 
> Thread 1 (Thread 0xf12f9010 (LWP 20681)):
> #0  0xf6f85204 in __libc_do_syscall () at
> ../sysdeps/unix/sysv/linux/arm/libc-do-syscall.S:46
> #1  0xf6fff948 in __GI___poll (fds=0x3248040, nfds=2, timeout=-1) at
> ../sysdeps/unix/sysv/linux/poll.c:29
> #2  0xf781692e in  () at /usr/lib/arm-linux-gnueabihf/libglib-2.0.so.0
> 
> Backtrace of qemu-storage-daemon:
> 
> (gdb) thread apply all bt
> 
> Thread 2 (Thread 0xf21ffdd0 (LWP 20722)):
> #0  syscall () at ../sysdeps/unix/sysv/linux/arm/syscall.S:37
> #1  0x009a9986 in qemu_futex_wait (val=<optimised out>, f=<optimised
> out>) at /home/peter.maydell/qemu/include/qemu/futex.h:29
> #2  qemu_event_wait (ev=ev@entry=0xa64958 <rcu_call_ready_event>) at
> ../../util/qemu-thread-posix.c:480
> #3  0x009a5d66 in call_rcu_thread (opaque=<optimised out>) at
> ../../util/rcu.c:258
> #4  0x009a8e6a in qemu_thread_start (args=<optimised out>) at
> ../../util/qemu-thread-posix.c:541
> #5  0xf79dd614 in start_thread (arg=0xa310c11f) at pthread_create.c:463
> #6  0xf79787ec in ?? () at ../sysdeps/unix/sysv/linux/arm/clone.S:73
> from /lib/arm-linux-gnueabihf/libc.so.6
> Backtrace stopped: previous frame identical to this frame (corrupt stack?)
> 
> Thread 1 (Thread 0xf22f7010 (LWP 20679)):
> #0  __libc_do_syscall () at ../sysdeps/unix/sysv/linux/arm/libc-do-syscall.S:46
> #1  0xf7971a04 in __GI_ppoll (fds=0x117c578, nfds=5,
> timeout=<optimised out>, timeout@entry=0x0, sigmask=sigmask@entry=0x0)
>     at ../sysdeps/unix/sysv/linux/ppoll.c:39
> #2  0x009a68fc in ppoll (__ss=0x0, __timeout=0x0, __nfds=<optimised
> out>, __fds=<optimised out>)
>     at /usr/include/arm-linux-gnueabihf/bits/poll2.h:77
> #3  qemu_poll_ns (fds=<optimised out>, nfds=<optimised out>,
> timeout=<optimised out>) at ../../util/qemu-timer.c:336
> #4  0x009c0222 in os_host_main_loop_wait (timeout=-1) at
> ../../util/main-loop.c:250
> #5  main_loop_wait (nonblocking=<optimised out>) at ../../util/main-loop.c:531
> #6  0x008ee92a in main (argc=5, argv=0xffdce5c4) at
> ../../storage-daemon/qemu-storage-daemon.c:345
> 
> 
> Any ideas ?
> 
> thanks
> -- PMM
> 

I see something very similar on X86:

https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg05814.html

It is easy to reproduce in my case (seems to happen all the time to me).

Ciao,

Claudio




