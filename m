Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0D26D1AEE
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 10:57:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piAYB-0001Nz-QM; Fri, 31 Mar 2023 04:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1piAY5-0001Mg-8j
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 04:55:53 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1piAY3-0004Ht-1z
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 04:55:53 -0400
Received: by mail-ed1-x52d.google.com with SMTP id h8so86883585ede.8
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 01:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680252948;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=8ed8Hu3kKsZ661zk2+70P5iF+xJu/RCkyMhzbJHVuTs=;
 b=GVSRRhpXuNO5WmL2RG3Ig4TxLfJYGpwUfUTUnhwVxSzDP9HCqLa1z8ss7vDWp8pmC+
 U7UuuTYWe0Vjzj6GOKSyAecLxNe20cja0pU0F0qSCYTg/ngiAhUZuvDKM5RUXqhdRjaS
 pgap7ISmO2KY5CGet7vb+BmL49rmLMJsPOIBJVwPwquzxBXoYPGmRkZnzsbnLRcxnN/0
 vffn+VcUYUqj7An7daiwTevLyXSAxSyPHTgh5dB/0+DmWkH8Sxx/fMkr25R1DxY2iAuG
 tYeGaBLMC359vTCYTtJlDzsKvKL28lI9I3ZsbtpJAj9TebSmmdb53XYr7kW8bzbdVCRG
 WHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680252948;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8ed8Hu3kKsZ661zk2+70P5iF+xJu/RCkyMhzbJHVuTs=;
 b=eYfeUSyypWyaCvasMixwInOoUUmtOOiUfc0iDM59K+98bPU4fPCJlblsWpxA1/ko7x
 icwSzMVwxYGChWyzoCKbtVxOOxEde8jyoMafPd5a8JAkB8VchosXNdI45hRlsiB0Y+0m
 Sy94iB6RkRDOpUoCsQjrVbdrBmx6oZLLW9jhwmzh+uK0FLebwC80SATDtFCqeSbysBVy
 tnAR1Q7tBMX2E2u/PK35Z2H5H+9wPFjl4I4YqWUl9VVM9nDdKBDOYz8xiVJpXZjJOMQL
 yJCmOp1CUraF0sWQu4ApzZ3D5budrH6K+nYDhFNysPhB+a867QTLl2ufg6M1ITyJx8Sb
 ti6Q==
X-Gm-Message-State: AAQBX9f3QpVgljR6uAQkXsGw64izm7QlPYxmrG4fZKdUrb0cd1agwm08
 RlLcKNOZlNb6tDg4CcZKjSholiE6ODH4kF57aHzeo+qZENfuJZyiS2w=
X-Google-Smtp-Source: AKy350ZBPL2LSc4BevTwCTS1hiUKQ87W6GH+taiewvf+20eT922narpfjqA4hB8/gjwZ0Hin3rIemwtbG/p3JXd1qQA=
X-Received: by 2002:a17:906:9619:b0:932:446:b2f7 with SMTP id
 s25-20020a170906961900b009320446b2f7mr12099960ejx.6.1680252948160; Fri, 31
 Mar 2023 01:55:48 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 31 Mar 2023 09:55:37 +0100
Message-ID: <CAFEAcA9+cDYiF1p_Q-76Ox87XUMxO690LpKFLcqdMfzhHNAc9w@mail.gmail.com>
Subject: virtio-net-failover intermittent test hangs eating CPU on s390 host
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Jason Wang <jasowang@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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

Found a couple of virtio-net-failover test processes sat on the
s390 CI runner with the virtio-net-failover process eating CPU.
Backtrace (I captured from both, but the backtraces are the same
in both cases):


Process tree:
virtio-net-fail(3435488)---qemu-system-i38(3435776)
===========================================================
PROCESS: 3435488
gitlab-+ 3435488 3415953 24 Mar30 ?        04:01:46
/home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/build/tests/qtest/virtio-net-failover
--tap -k
[New LWP 3435489]
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/s390x-linux-gnu/libthread_db.so.1".
__libc_send (fd=fd@entry=3, buf=buf@entry=0x2aa08e5f5c0,
len=len@entry=29, flags=flags@entry=0) at
../sysdeps/unix/sysv/linux/send.c:30
30      ../sysdeps/unix/sysv/linux/send.c: No such file or directory.

Thread 2 (Thread 0x3ffb25ff900 (LWP 3435489)):
#0  syscall () at ../sysdeps/unix/sysv/linux/s390/s390-64/syscall.S:37
#1  0x000002aa086d9cf4 in qemu_futex_wait (val=<optimized out>,
f=<optimized out>) at
/home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/include/qemu/futex.h:29
#2  qemu_event_wait (ev=ev@entry=0x2aa0874b890 <rcu_call_ready_event>)
at ../util/qemu-thread-posix.c:464
#3  0x000002aa08705e82 in call_rcu_thread (opaque=opaque@entry=0x0) at
../util/rcu.c:261
#4  0x000002aa086d8d5a in qemu_thread_start (args=<optimized out>) at
../util/qemu-thread-posix.c:541
#5  0x000003ffb2887e66 in start_thread (arg=0x3ffb25ff900) at
pthread_create.c:477
#6  0x000003ffb277cbe6 in thread_start () at
../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Thread 1 (Thread 0x3ffb2cf2770 (LWP 3435488)):
#0  __libc_send (fd=fd@entry=3, buf=buf@entry=0x2aa08e5f5c0,
len=len@entry=29, flags=flags@entry=0) at
../sysdeps/unix/sysv/linux/send.c:30
#1  0x000002aa086d5878 in qemu_send_full (s=s@entry=3,
buf=0x2aa08e5f5c0, count=count@entry=29) at ../util/osdep.c:509
#2  0x000002aa086aab8a in socket_send (size=<optimized out>,
buf=<optimized out>, fd=3) at ../tests/qtest/libqmp.c:172
#3  _qmp_fd_vsend_fds (fd=<optimized out>, fds=<optimized out>,
fds@entry=0x0, fds_num=fds_num@entry=0, fmt=<optimized out>,
ap=ap@entry=0x3ffd0679f00) at ../tests/qtest/libqmp.c:172
#4  0x000002aa086aaf72 in qmp_fd_vsend (fd=<optimized out>,
fmt=<optimized out>, ap=ap@entry=0x3ffd0679f00) at
../tests/qtest/libqmp.c:190
#5  0x000002aa086a886c in qtest_qmp_vsend (ap=0x3ffd0679f00,
fmt=<optimized out>, s=0x2aa08e63d70) at ../tests/qtest/libqtest.c:788
#6  qtest_vqmp (ap=0x3ffd0679f00, fmt=<optimized out>,
s=0x2aa08e63d70) at ../tests/qtest/libqtest.c:762
#7  qtest_qmp (s=0x2aa08e63d70, fmt=<optimized out>) at
../tests/qtest/libqtest.c:788
#8  0x000002aa086911d0 in migrate_status (qts=<optimized out>) at
../tests/qtest/virtio-net-failover.c:596
#9  0x000002aa0869cee0 in test_migrate_off_abort (opaque=<optimized
out>) at ../tests/qtest/virtio-net-failover.c:1425
#10 0x000003ffb2a7e608 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
#11 0x000003ffb2a7e392 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
#12 0x000003ffb2a7e392 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
#13 0x000003ffb2a7e392 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
#14 0x000003ffb2a7e392 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
#15 0x000003ffb2a7eada in g_test_run_suite () from
/lib/s390x-linux-gnu/libglib-2.0.so.0
#16 0x000003ffb2a7eb10 in g_test_run () from
/lib/s390x-linux-gnu/libglib-2.0.so.0
#17 0x000002aa086905e2 in main (argc=<optimized out>, argv=<optimized
out>) at ../tests/qtest/virtio-net-failover.c:1897
[Inferior 1 (process 3435488) detached]

===========================================================
PROCESS: 3435776
gitlab-+ 3435776 3435488 18 Mar30 ?        03:04:00 ./qemu-system-i386
-qtest unix:/tmp/qtest-3435488.sock -qtest-log /dev/null -chardev
socket,path=/tmp/qtest-3435488.qmp,id=char0 -mon
chardev=char0,mode=control -display none -M q35 -nodefaults -device
pcie-root-port,id=root0,addr=0x1,bus=pcie.0,chassis=1 -device
pcie-root-port,id=root1,addr=0x2,bus=pcie.0,chassis=2 -netdev
user,id=hs0 -netdev user,id=hs1 -accel qtest
[New LWP 3435778]
[New LWP 3435779]
[New LWP 3435780]
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/s390x-linux-gnu/libthread_db.so.1".
0x000003ff8e871c8c in __ppoll (fds=0x2aa37996d80, nfds=5,
timeout=<optimized out>, timeout@entry=0x3ffcf0fa428,
sigmask=sigmask@entry=0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
44      ../sysdeps/unix/sysv/linux/ppoll.c: No such file or directory.

Thread 4 (Thread 0x3ff7e9a0900 (LWP 3435780)):
#0  futex_wait_cancelable (private=0, expected=0,
futex_word=0x2aa3789d928) at ../sysdeps/nptl/futex-internal.h:183
#1  __pthread_cond_wait_common (abstime=0x0, clockid=0,
mutex=0x2aa36313260 <qemu_global_mutex>, cond=0x2aa3789d900) at
pthread_cond_wait.c:508
#2  __pthread_cond_wait (cond=cond@entry=0x2aa3789d900,
mutex=mutex@entry=0x2aa36313260 <qemu_global_mutex>) at
pthread_cond_wait.c:647
#3  0x000002aa35a3d4be in qemu_cond_wait_impl (cond=0x2aa3789d900,
mutex=0x2aa36313260 <qemu_global_mutex>, file=0x2aa35b84c4c
"../softmmu/cpus.c", line=<optimized out>) at
../util/qemu-thread-posix.c:225
#4  0x000002aa3566df2e in qemu_wait_io_event
(cpu=cpu@entry=0x2aa37897350) at ../softmmu/cpus.c:424
#5  0x000002aa356df704 in dummy_cpu_thread_fn
(arg=arg@entry=0x2aa37897350) at ../accel/dummy-cpus.c:60
#6  0x000002aa35a3cada in qemu_thread_start (args=<optimized out>) at
../util/qemu-thread-posix.c:541
#7  0x000003ff8e987e66 in start_thread (arg=0x3ff7e9a0900) at
pthread_create.c:477
#8  0x000003ff8e87cbe6 in thread_start () at
../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Thread 3 (Thread 0x3ff7f1a1900 (LWP 3435779)):
#0  0x000003ff8e871b32 in __GI___poll (fds=0x3ff700032a0, nfds=3,
timeout=<optimized out>) at ../sysdeps/unix/sysv/linux/poll.c:29
#1  0x000003ff91054386 in  () at /lib/s390x-linux-gnu/libglib-2.0.so.0
#2  0x000003ff91054790 in g_main_loop_run () at
/lib/s390x-linux-gnu/libglib-2.0.so.0
#3  0x000002aa358ecffe in iothread_run
(opaque=opaque@entry=0x2aa376c2f00) at ../iothread.c:70
#4  0x000002aa35a3cada in qemu_thread_start (args=<optimized out>) at
../util/qemu-thread-posix.c:541
#5  0x000003ff8e987e66 in start_thread (arg=0x3ff7f1a1900) at
pthread_create.c:477
#6  0x000003ff8e87cbe6 in thread_start () at
../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Thread 2 (Thread 0x3ff7faa3900 (LWP 3435778)):
#0  syscall () at ../sysdeps/unix/sysv/linux/s390/s390-64/syscall.S:37
#1  0x000002aa35a3da74 in qemu_futex_wait (val=<optimized out>,
f=<optimized out>) at
/home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/include/qemu/futex.h:29
#2  qemu_event_wait (ev=ev@entry=0x2aa36343548 <rcu_call_ready_event>)
at ../util/qemu-thread-posix.c:464
#3  0x000002aa35a4786a in call_rcu_thread (opaque=opaque@entry=0x0) at
../util/rcu.c:261
#4  0x000002aa35a3cada in qemu_thread_start (args=<optimized out>) at
../util/qemu-thread-posix.c:541
#5  0x000003ff8e987e66 in start_thread (arg=0x3ff7faa3900) at
pthread_create.c:477
#6  0x000003ff8e87cbe6 in thread_start () at
../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Thread 1 (Thread 0x3ff921fe4a0 (LWP 3435776)):
#0  0x000003ff8e871c8c in __ppoll (fds=0x2aa37996d80, nfds=5,
timeout=<optimized out>, timeout@entry=0x3ffcf0fa428,
sigmask=sigmask@entry=0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
#1  0x000002aa35a53aa2 in ppoll (__ss=0x0, __timeout=0x3ffcf0fa428,
__nfds=<optimized out>, __fds=<optimized out>) at
/usr/include/s390x-linux-gnu/bits/poll2.h:77
#2  qemu_poll_ns (fds=<optimized out>, nfds=<optimized out>,
timeout=timeout@entry=1000000000) at ../util/qemu-timer.c:351
#3  0x000002aa35a50ab8 in os_host_main_loop_wait (timeout=1000000000)
at ../util/main-loop.c:308
#4  main_loop_wait (nonblocking=nonblocking@entry=0) at ../util/main-loop.c:592
#5  0x000002aa35674b04 in qemu_main_loop () at ../softmmu/runstate.c:731
#6  0x000002aa3548df9a in qemu_default_main () at ../softmmu/main.c:37
#7  0x000003ff8e7a440a in __libc_start_main (main=0x2aa3548b560
<main>, argc=<optimized out>, argv=0x3ffcf0fa878, init=<optimized
out>, fini=<optimized out>, rtld_fini=0x3ff92210e50 <_dl_fini>,
stack_end=0x3ffcf0fa7c0) at libc-start.c:308
#8  0x000002aa3548dec4 in _start () at ../softmmu/main.c:48
[Inferior 1 (process 3435776) detached]

thanks
-- PMM

