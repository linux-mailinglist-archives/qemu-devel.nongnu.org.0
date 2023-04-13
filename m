Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 742976E0BDD
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 12:52:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmuXQ-0006oQ-P5; Thu, 13 Apr 2023 06:50:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmuXO-0006oA-Q2
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 06:50:46 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmuXM-0002P6-LW
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 06:50:46 -0400
Received: by mail-ej1-x62a.google.com with SMTP id dm2so36428148ejc.8
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 03:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681383043; x=1683975043;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=j3GBnE24AC3CUIUnWNtPY3BUyG43HV3u/PTjUzCr+Hk=;
 b=KYOKPwDz80u0qG8tvfcBow8RrfElqqn6/jfVdcoeDYUophj4jF3Mf/Z/H8oiVTrXiY
 ytEaRfLk1nwPIKopGYG6GA9rQLccAVEM2PeLLDu08GehLKay8Jd+BHcEfYJ1nnVUw/FG
 OAYYObeJzEyaRrbHFtnAPBm4V04sJnAV7mDO7VPWn5zWW7nWc/8nxY+IYRC2PMBPBe7y
 n022GCNoX2a7M3Jt6GmhWrkJID4xYUcsLgNBXm4ZpEl8+pcdd4siweWWYoa0L7N/X390
 kj/BzpUm+2jH2YlbQY85pEgsNYsBUPUk6jNmQ6kNCFQIGaSQAgtqjtkOwKq2ylESO3FR
 u8lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681383043; x=1683975043;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j3GBnE24AC3CUIUnWNtPY3BUyG43HV3u/PTjUzCr+Hk=;
 b=N5eShmNT8gzKTZL1mBIyBk0y+jCcxCV4KMvx52FTp/ClPYpDCb3a8Wkrntq9tUU+0P
 CwH+zNyC1/g3IaKUaSdjf0RDN9T3HjJ9DpTiGytZDP4CaG1WJHlw7+Eb4hOajV83ikZz
 Fw0QpFoyB3Ss+HEjeu2mozv2IIxjYBtT4yw8T/ThumhtATpIu70ArtvkpS77c27wkY2q
 3KJPoQtGlWETQCJC86bRndkhJZKMyP67iww56NEw3Ax0P8M/PLgorx9PwcyhyRlh1QEs
 goCbBkAQixH8s98Fea23aQdVmXeDmLN9I5bugUsdcMkCVJdbXcvru6ZBpvB21K9gDhA3
 zVYg==
X-Gm-Message-State: AAQBX9f5dZEkI86kdQOjXFkCJ6xE45lUeSa3aRFU1RQ3L1NaEKAegCq8
 SOl6iBsVWX8gRFgfB2OxBU/OWEBqQLtg7Eu0IKtawUIwoffCBvnl
X-Google-Smtp-Source: AKy350a/VTwRlVpBhvA1Za+fmWbmdN6AI/jQI3/5lnA/AcIRZUJoyHKlox794XxUXhQaf/aUSY99C9H0hKMuXV9OsCY=
X-Received: by 2002:a17:906:b085:b0:94e:3ba:1649 with SMTP id
 x5-20020a170906b08500b0094e03ba1649mr1004674ejy.6.1681383042654; Thu, 13 Apr
 2023 03:50:42 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Apr 2023 11:50:31 +0100
Message-ID: <CAFEAcA8gecpvfUj9uz+HBRspskZsxJTdD2Yz3M3uOKcFJbpv-Q@mail.gmail.com>
Subject: netdev-socket test hang (s390 host, mips64el guest, backtrace)
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

I just found a hung netdev-socket test on our s390 CI runner.
Looks like a deadlock, no processes using CPU.
Here's the backtrace; looks like both QEMU processes are sat
idle but the test process is sat waiting forever for something
in test_stream_inet_reconnect(). Any ideas?

Process tree:
netdev-socket(3496843)-+-qemu-system-mip(3496956)
                       `-qemu-system-mip(3496976)
===========================================================
PROCESS: 3496843
gitlab-+ 3496843 3472329  0 Apr10 ?        00:00:00
/home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/build/tests/qtest/netdev-socket
--tap -k
[New LWP 3496844]
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/s390x-linux-gnu/libthread_db.so.1".
__libc_recv (fd=fd@entry=3, buf=buf@entry=0x3ffe1cf9f27,
len=len@entry=1, flags=flags@entry=0) at
../sysdeps/unix/sysv/linux/recv.c:30
30      ../sysdeps/unix/sysv/linux/recv.c: No such file or directory.

Thread 2 (Thread 0x3ffa457f900 (LWP 3496844)):
#0  syscall () at ../sysdeps/unix/sysv/linux/s390/s390-64/syscall.S:37
#1  0x000002aa22cccbbc in qemu_futex_wait (val=<optimized out>,
f=<optimized out>) at
/home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/include/qemu/futex.h:29
#2  qemu_event_wait (ev=ev@entry=0x2aa22d3c860 <rcu_call_ready_event>)
at ../util/qemu-thread-posix.c:464
#3  0x000002aa22cf89a2 in call_rcu_thread (opaque=opaque@entry=0x0) at
../util/rcu.c:261
#4  0x000002aa22ccbc22 in qemu_thread_start (args=<optimized out>) at
../util/qemu-thread-posix.c:541
#5  0x000003ffa4807e66 in start_thread (arg=0x3ffa457f900) at
pthread_create.c:477
#6  0x000003ffa46fcbe6 in thread_start () at
../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Thread 1 (Thread 0x3ffa4c72770 (LWP 3496843)):
#0  __libc_recv (fd=fd@entry=3, buf=buf@entry=0x3ffe1cf9f27,
len=len@entry=1, flags=flags@entry=0) at
../sysdeps/unix/sysv/linux/recv.c:30
#1  0x000002aa22c9d982 in recv (__flags=0, __n=1, __buf=0x3ffe1cf9f27,
__fd=3) at /usr/include/s390x-linux-gnu/bits/socket2.h:44
#2  qmp_fd_receive (fd=<optimized out>) at ../tests/qtest/libqmp.c:73
#3  0x000002aa22c9baee in qtest_qmp_receive_dict (s=0x2aa232a50d0) at
../tests/qtest/libqtest.c:837
#4  qtest_qmp_eventwait_ref (event=<optimized out>, s=<optimized out>)
at ../tests/qtest/libqtest.c:837
#5  qtest_qmp_eventwait_ref (s=0x2aa232a50d0, event=<optimized out>)
at ../tests/qtest/libqtest.c:828
#6  0x000002aa22c9262c in wait_stream_connected (qts=<optimized out>,
addr=0x3ffe1cfa1b8, id=0x2aa22cfeed6 "st0") at
../tests/qtest/netdev-socket.c:157
#7  0x000002aa22c929b6 in test_stream_inet_reconnect () at
../tests/qtest/netdev-socket.c:229
#8  0x000003ffa49fe608 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
#9  0x000003ffa49fe392 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
#10 0x000003ffa49fe392 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
#11 0x000003ffa49fe392 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
#12 0x000003ffa49fe392 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
#13 0x000003ffa49feada in g_test_run_suite () from
/lib/s390x-linux-gnu/libglib-2.0.so.0
#14 0x000003ffa49feb10 in g_test_run () from
/lib/s390x-linux-gnu/libglib-2.0.so.0
#15 0x000002aa22c90678 in main (argc=<optimized out>, argv=<optimized
out>) at ../tests/qtest/netdev-socket.c:543
[Inferior 1 (process 3496843) detached]

===========================================================
PROCESS: 3496956
gitlab-+ 3496956 3496843  0 Apr10 ?        00:00:00
./qemu-system-mips64el -qtest unix:/tmp/qtest-3496843.sock -qtest-log
/dev/null -chardev socket,path=/tmp/qtest-3496843.qmp,id=char0 -mon
chardev=char0,mode=control -display none -nodefaults -M none -netdev
stream,server=false,id=st0,addr.type=inet,addr.ipv4=on,addr.ipv6=off,reconnect=1,addr.host=127.0.0.1,addr.port=50989
-accel qtest
[New LWP 3496965]
[New LWP 3496967]
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/s390x-linux-gnu/libthread_db.so.1".
0x000003ff81af1c8c in __ppoll (fds=0x2aa40b08230, nfds=6,
timeout=<optimized out>, timeout@entry=0x0, sigmask=sigmask@entry=0x0)
at ../sysdeps/unix/sysv/linux/ppoll.c:44
44      ../sysdeps/unix/sysv/linux/ppoll.c: No such file or directory.

Thread 3 (Thread 0x3ff71c20900 (LWP 3496967)):
#0  0x000003ff81af1b32 in __GI___poll (fds=0x3ff64003680, nfds=3,
timeout=<optimized out>) at ../sysdeps/unix/sysv/linux/poll.c:29
#1  0x000003ff842d4386 in  () at /lib/s390x-linux-gnu/libglib-2.0.so.0
#2  0x000003ff842d4790 in g_main_loop_run () at
/lib/s390x-linux-gnu/libglib-2.0.so.0
#3  0x000002aa3ea03bbe in iothread_run
(opaque=opaque@entry=0x2aa4096bf00) at ../iothread.c:70
#4  0x000002aa3eb534ca in qemu_thread_start (args=<optimized out>) at
../util/qemu-thread-posix.c:541
#5  0x000003ff81c07e66 in start_thread (arg=0x3ff71c20900) at
pthread_create.c:477
#6  0x000003ff81afcbe6 in thread_start () at
../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Thread 2 (Thread 0x3ff72d23900 (LWP 3496965)):
#0  syscall () at ../sysdeps/unix/sysv/linux/s390/s390-64/syscall.S:37
#1  0x000002aa3eb54464 in qemu_futex_wait (val=<optimized out>,
f=<optimized out>) at
/home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/include/qemu/futex.h:29
#2  qemu_event_wait (ev=ev@entry=0x2aa3f1e01c8 <rcu_call_ready_event>)
at ../util/qemu-thread-posix.c:464
#3  0x000002aa3eb5e212 in call_rcu_thread (opaque=opaque@entry=0x0) at
../util/rcu.c:261
#4  0x000002aa3eb534ca in qemu_thread_start (args=<optimized out>) at
../util/qemu-thread-posix.c:541
#5  0x000003ff81c07e66 in start_thread (arg=0x3ff72d23900) at
pthread_create.c:477
#6  0x000003ff81afcbe6 in thread_start () at
../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65


Thread 1 (Thread 0x3ff8547e4a0 (LWP 3496956)):
#0  0x000003ff81af1c8c in __ppoll (fds=0x2aa40b08230, nfds=6,
timeout=<optimized out>, timeout@entry=0x0, sigmask=sigmask@entry=0x0)
at ../sysdeps/unix/sysv/linux/ppoll.c:44
#1  0x000002aa3eb6a486 in ppoll (__ss=0x0, __timeout=0x0,
__nfds=<optimized out>, __fds=<optimized out>) at
/usr/include/s390x-linux-gnu/bits/poll2.h:77
#2  qemu_poll_ns (fds=<optimized out>, nfds=<optimized out>,
timeout=timeout@entry=-1) at ../util/qemu-timer.c:339
#3  0x000002aa3eb67460 in os_host_main_loop_wait (timeout=-1) at
../util/main-loop.c:308
#4  main_loop_wait (nonblocking=nonblocking@entry=0) at ../util/main-loop.c:592
#5  0x000002aa3e77082c in qemu_main_loop () at ../softmmu/runstate.c:731
#6  0x000002aa3e59d5da in qemu_default_main () at ../softmmu/main.c:37
#7  0x000003ff81a2440a in __libc_start_main (main=0x2aa3e59b0c0
<main>, argc=<optimized out>, argv=0x3fffbdfaf68, init=<optimized
out>, fini=<optimized out>, rtld_fini=0x3ff85490e50 <_dl_fini>,
stack_end=0x3fffbdfaeb0) at libc-start.c:308
#8  0x000002aa3e59d504 in _start () at ../softmmu/main.c:48
[Inferior 1 (process 3496956) detached]

===========================================================
PROCESS: 3496976
gitlab-+ 3496976 3496843  0 Apr10 ?        00:00:00
./qemu-system-mips64el -qtest unix:/tmp/qtest-3496843.sock -qtest-log
/dev/null -chardev socket,path=/tmp/qtest-3496843.qmp,id=char0 -mon
chardev=char0,mode=control -display none -nodefaults -M none -netdev
stream,id=st0,server=true,addr.type=inet,addr.ipv4=on,addr.ipv6=off,addr.host=127.0.0.1,addr.port=50989
-accel qtest
[New LWP 3496981]
[New LWP 3496983]
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/s390x-linux-gnu/libthread_db.so.1".
0x000003ff88bf1c8c in __ppoll (fds=0x2aa0d0cbe70, nfds=6,
timeout=<optimized out>, timeout@entry=0x0, sigmask=sigmask@entry=0x0)
at ../sysdeps/unix/sysv/linux/ppoll.c:44
44      ../sysdeps/unix/sysv/linux/ppoll.c: No such file or directory.

Thread 3 (Thread 0x3ff78d20900 (LWP 3496983)):
#0  0x000003ff88bf1b32 in __GI___poll (fds=0x3ff6c001610, nfds=3,
timeout=<optimized out>) at ../sysdeps/unix/sysv/linux/poll.c:29
#1  0x000003ff8b3d4386 in  () at /lib/s390x-linux-gnu/libglib-2.0.so.0
#2  0x000003ff8b3d4790 in g_main_loop_run () at
/lib/s390x-linux-gnu/libglib-2.0.so.0
#3  0x000002aa0bc03bbe in iothread_run
(opaque=opaque@entry=0x2aa0cf4c700) at ../iothread.c:70
#4  0x000002aa0bd534ca in qemu_thread_start (args=<optimized out>) at
../util/qemu-thread-posix.c:541
#5  0x000003ff88d07e66 in start_thread (arg=0x3ff78d20900) at
pthread_create.c:477
#6  0x000003ff88bfcbe6 in thread_start () at
../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Thread 2 (Thread 0x3ff79e23900 (LWP 3496981)):
#0  syscall () at ../sysdeps/unix/sysv/linux/s390/s390-64/syscall.S:37
#1  0x000002aa0bd54464 in qemu_futex_wait (val=<optimized out>,
f=<optimized out>) at
/home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/include/qemu/futex.h:29
#2  qemu_event_wait (ev=ev@entry=0x2aa0c3e01c8 <rcu_call_ready_event>)
at ../util/qemu-thread-posix.c:464
#3  0x000002aa0bd5e212 in call_rcu_thread (opaque=opaque@entry=0x0) at
../util/rcu.c:261
#4  0x000002aa0bd534ca in qemu_thread_start (args=<optimized out>) at
../util/qemu-thread-posix.c:541
#5  0x000003ff88d07e66 in start_thread (arg=0x3ff79e23900) at
pthread_create.c:477
#6  0x000003ff88bfcbe6 in thread_start () at
../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Thread 1 (Thread 0x3ff8c57e4a0 (LWP 3496976)):
#0  0x000003ff88bf1c8c in __ppoll (fds=0x2aa0d0cbe70, nfds=6,
timeout=<optimized out>, timeout@entry=0x0, sigmask=sigmask@entry=0x0)
at ../sysdeps/unix/sysv/linux/ppoll.c:44
#1  0x000002aa0bd6a486 in ppoll (__ss=0x0, __timeout=0x0,
__nfds=<optimized out>, __fds=<optimized out>) at
/usr/include/s390x-linux-gnu/bits/poll2.h:77
#2  qemu_poll_ns (fds=<optimized out>, nfds=<optimized out>,
timeout=timeout@entry=-1) at ../util/qemu-timer.c:339
#3  0x000002aa0bd67460 in os_host_main_loop_wait (timeout=-1) at
../util/main-loop.c:308
#4  main_loop_wait (nonblocking=nonblocking@entry=0) at ../util/main-loop.c:592
#5  0x000002aa0b97082c in qemu_main_loop () at ../softmmu/runstate.c:731
#6  0x000002aa0b79d5da in qemu_default_main () at ../softmmu/main.c:37
#7  0x000003ff88b2440a in __libc_start_main (main=0x2aa0b79b0c0
<main>, argc=<optimized out>, argv=0x3ffe28fa838, init=<optimized
out>, fini=<optimized out>, rtld_fini=0x3ff8c590e50 <_dl_fini>,
stack_end=0x3ffe28fa780) at libc-start.c:308
#8  0x000002aa0b79d504 in _start () at ../softmmu/main.c:48
[Inferior 1 (process 3496976) detached]

thanks
-- PMM

