Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2173D3C34B8
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 15:32:50 +0200 (CEST)
Received: from localhost ([::1]:54296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2D68-0007GF-3a
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 09:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2D4i-0006a5-J3
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 09:31:20 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:39610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2D4f-0001YZ-Cf
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 09:31:20 -0400
Received: by mail-ed1-x52a.google.com with SMTP id v1so18529425edt.6
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 06:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=M3EPRxb9jLOb2yEKA8h3RO9EVJea2X1MJt6jhJsYi5s=;
 b=X07urgnHFolad52OBeaXQkMN6NsxmnYqy+E+VLg7IN5j/9Fy14ch7QpXJbDcVPjPIM
 zMBQfLwvESKg42qMezEhS63Cl9G0QFBY2/0RPe3jBP88c56MF/emyJJ2+bq/yCJfkxZz
 aVwp9a7U71VogrkVZc+BnTJ40xGhPCGvNHotukDSh2iNAwFjvg3Sg4sw8o9IL5vHtBNn
 NvdHqh22ju39jH353IxtfyXpPqm+TYGX06XIIup1XRATTsHCEeUsZw2vPeSjoruBkfSS
 heGsYwfjNId4jGhlpaE9RFtzVVMvLbWoSUMknc6txJezWdN0PzPwV6bPydB+omS6y9Hg
 gSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=M3EPRxb9jLOb2yEKA8h3RO9EVJea2X1MJt6jhJsYi5s=;
 b=NUgN0NKOSyiQ1YtfX1sZdodWZK3t4MFekP6C/1a/KfsT0r7l118doEFIbQa8qnHfns
 mMO1aVZNfvS2uGr2QXC8GOmFMNiYj9s4RWZ32fD5EBcGofiOuLMcx075eYqVH1m70gbv
 VUfcgy2ge2kpfuvi8JYLsfUKHw9a0CfC6vib4UDBp5E+rVYPnE/DEtOIhBMF8K1htaTm
 HlRl94pNXSH5T76HtfaMcVjgfHesj3rBpa0eUwKBI1bFw1IimDSHtilN8qIOSIwzwvEM
 2vODWv/INpfKJaW69gNuNdU4699ggAFAN+98wJRXZrdNPxeUKdwUc3N5JIU8CMZlVhjq
 ZKMg==
X-Gm-Message-State: AOAM533eok5ohjVxUTYJQ/kFOCm8p6LTIpSzhmXBtvDZAf3bnJ05l4aW
 sDm/yH28nD4ugAfPV69DtPsYdOdo82pMYnql3NdoggosewL3iam0
X-Google-Smtp-Source: ABdhPJxpsQOoc2kyoYOvFZtLDeIalq6ve1rirgpbvJNQi08scqA/ogPSan9AlAEDW5J8Lw1xxcciI1Vk1OSVRWYujFY=
X-Received: by 2002:aa7:c6d4:: with SMTP id b20mr29723997eds.204.1625923874931; 
 Sat, 10 Jul 2021 06:31:14 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 10 Jul 2021 14:30:36 +0100
Message-ID: <CAFEAcA-L5kztvCiS-Y+_LDiaFgWzuCpPYN1-cHNY9Q8qpi538Q@mail.gmail.com>
Subject: intermittent hang in qos-test for qemu-system-i386 on 32-bit arm host
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I've noticed recently that intermittently 'make check' will hang on
my aarch32 test system (really an aarch64 box with an aarch32 chroot).

I think from grep that this must be the vhost-user-blk test.

Here's the process tree:

pmaydell 13126  0.0  0.0   8988  6416 ?        S    Jul09   0:01 make
-C build/all-a32 check V=1 GCC_COLORS= -j9
pmaydell 19632  0.0  0.0   4432  2096 ?        S    Jul09   0:00  \_
bash -o pipefail -c echo 'MALLOC_PERTURB_=${MALLOC_PERTURB_:-$((
${RANDOM:-0} % 255 + 1))} QTEST_QEMU_IMG=./qemu-img
G_TEST_DBUS_DAEMON=/home/peter.maydell/qemu/tests/dbus-vmstate-daemon.sh
QTEST_QEMU_BINARY=./qemu-system-i386
QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon
tests/qtest/qos-test --tap -k' &&
MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
QTEST_QEMU_IMG=./qemu-img
G_TEST_DBUS_DAEMON=/home/peter.maydell/qemu/tests/dbus-vmstate-daemon.sh
QTEST_QEMU_BINARY=./qemu-system-i386
QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon
tests/qtest/qos-test --tap -k -m quick < /dev/null |
./scripts/tap-driver.pl --test-name="qtest-i386/qos-test"
pmaydell 19634  0.0  0.0  13608  3076 ?        Sl   Jul09   0:02
\_ tests/qtest/qos-test --tap -k -m quick
pmaydell 20679  0.0  0.0 109076 16100 ?        Sl   Jul09   0:00
|   \_ ./storage-daemon/qemu-storage-daemon --blockdev
driver=file,node-name=disk0,filename=qtest.X7RL2X --export
type=vhost-user-blk,id=disk0,addr.type=unix,addr.path=/tmp/qtest-19634-sock.9LJoHn,node-name=disk0,writable=on,num-queues=1
pmaydell 20681  0.0  0.2 447828 46544 ?        Sl   Jul09   0:00
|   \_ ./qemu-system-i386 -qtest unix:/tmp/qtest-19634.sock -qtest-log
/dev/null -chardev socket,path=/tmp/qtest-19634.qmp,id=char0 -mon
chardev=char0,mode=control -display none -M pc -device
vhost-user-blk-pci,id=drv0,chardev=char1,addr=4.0 -object
memory-backend-memfd,id=mem,size=256M,share=on -M memory-backend=mem
-m 256M -chardev socket,id=char1,path=/tmp/qtest-19634-sock.9LJoHn
-accel qtest
pmaydell 19635  0.0  0.0  10256  7176 ?        S    Jul09   0:00
\_ perl ./scripts/tap-driver.pl --test-name=qtest-i386/qos-test


Backtrace from tests/qtest/qos-test (not as helpful as it could
be since this is an optimized build):

(gdb) thread apply all bt

Thread 2 (Thread 0xf76ff240 (LWP 19636)):
#0  syscall () at ../sysdeps/unix/sysv/linux/arm/syscall.S:37
#1  0x005206de in qemu_futex_wait (val=<optimised out>, f=<optimised
out>) at /home/peter.maydell/qemu/include/qemu/futex.h:29
#2  qemu_event_wait (ev=ev@entry=0x5816fc <rcu_call_ready_event>) at
../../util/qemu-thread-posix.c:480
#3  0x005469c2 in call_rcu_thread (opaque=<optimised out>) at
../../util/rcu.c:258
#4  0x0051fbc2 in qemu_thread_start (args=<optimised out>) at
../../util/qemu-thread-posix.c:541
#5  0xf785a614 in start_thread (arg=0xf6ce711c) at pthread_create.c:463
#6  0xf77f57ec in ?? () at ../sysdeps/unix/sysv/linux/arm/clone.S:73
from /lib/arm-linux-gnueabihf/libc.so.6
Backtrace stopped: previous frame identical to this frame (corrupt stack?)

Thread 1 (Thread 0xf7a04010 (LWP 19634)):
#0  __libc_do_syscall () at ../sysdeps/unix/sysv/linux/arm/libc-do-syscall.S:46
#1  0xf7861d8c in __libc_read (fd=12, buf=buf@entry=0xff9ce8e4,
nbytes=nbytes@entry=1024) at ../sysdeps/unix/sysv/linux/read.c:27
#2  0x004ebc5a in read (__nbytes=1024, __buf=0xff9ce8e4,
__fd=<optimised out>) at
/usr/include/arm-linux-gnueabihf/bits/unistd.h:44
#3  qtest_client_socket_recv_line (s=0x1a46cb8) at
../../tests/qtest/libqtest.c:494
#4  0x004ebd4e in qtest_rsp_args (s=s@entry=0x1a46cb8,
expected_args=expected_args@entry=1) at
../../tests/qtest/libqtest.c:521
#5  0x004ec1ee in qtest_query_target_endianness (s=0x1a46cb8) at
../../tests/qtest/libqtest.c:570
#6  0x004ec94a in qtest_init_without_qmp_handshake
(extra_args=<optimised out>) at ../../tests/qtest/libqtest.c:332
#7  0x004ecd7a in qtest_init (extra_args=<optimised out>) at
../../tests/qtest/libqtest.c:339
#8  0x004ded10 in qtest_start (
    args=0x1a63710 "-M pc  -device
vhost-user-blk-pci,id=drv0,chardev=char1,addr=4.0 -object
memory-backend-memfd,id=mem,size=256M,share=on  -M memory-backend=mem
-m 256M -chardev socket,id=char1,path=/tmp/qtest-19634-so"...) at
../../tests/qtest/libqtest-single.h:29
#9  restart_qemu_or_continue (
    path=0x1a63710 "-M pc  -device
vhost-user-blk-pci,id=drv0,chardev=char1,addr=4.0 -object
memory-backend-memfd,id=mem,size=256M,share=on  -M memory-backend=mem
-m 256M -chardev socket,id=char1,path=/tmp/qtest-19634-so"...) at
../../tests/qtest/qos-test.c:105
#10 run_one_test (arg=<optimised out>) at ../../tests/qtest/qos-test.c:178
#11 0xf794ee74 in ?? () from /usr/lib/arm-linux-gnueabihf/libglib-2.0.so.0
Backtrace stopped: previous frame identical to this frame (corrupt stack?)


Backtrace from qemu-system-i386:

(gdb) thread apply all bt

Thread 4 (Thread 0xdfd0cb90 (LWP 20734)):
#0  0xf6f85206 in __libc_do_syscall () at
../sysdeps/unix/sysv/linux/arm/libc-do-syscall.S:47
#1  0xf6f93492 in __GI___sigtimedwait (set=<optimised out>,
    set@entry=0xdfd0c3c4, info=info@entry=0xdfd0c324,
timeout=timeout@entry=0x0) at
../sysdeps/unix/sysv/linux/sigtimedwait.c:42
#2  0xf7073e6c in __sigwait (set=set@entry=0xdfd0c3c4,
sig=sig@entry=0xdfd0c3c0) at ../sysdeps/unix/sysv/linux/sigwait.c:28
#3  0x00c999a6 in dummy_cpu_thread_fn (arg=0x24d1168) at
../../accel/dummy-cpus.c:46
#4  0x00e18ba2 in qemu_thread_start (args=<optimised out>) at
../../util/qemu-thread-posix.c:541
#5  0xf706b614 in start_thread (arg=0xa8db8843) at pthread_create.c:463
#6  0xf70067ec in  () at ../sysdeps/unix/sysv/linux/arm/clone.S:73

Thread 3 (Thread 0xe07fcb90 (LWP 20710)):
#0  0xf6f85204 in __libc_do_syscall () at
../sysdeps/unix/sysv/linux/arm/libc-do-syscall.S:46
#1  0xf6fff948 in __GI___poll (fds=0x2409b90, nfds=3, timeout=-1) at
../sysdeps/unix/sysv/linux/poll.c:29
#2  0xf781692e in  () at /usr/lib/arm-linux-gnueabihf/libglib-2.0.so.0

Thread 2 (Thread 0xf1201b90 (LWP 20703)):
#0  0xf7074f04 in __libc_do_syscall () at
../sysdeps/unix/sysv/linux/arm/libc-do-syscall.S:46
#1  0xf7072ad2 in __lll_lock_wait (futex=futex@entry=0x14f2e68
<qemu_global_mutex>, private=0) at lowlevellock.c:43
#2  0xf706d3e2 in __GI___pthread_mutex_lock
(mutex=mutex@entry=0x14f2e68 <qemu_global_mutex>) at
pthread_mutex_lock.c:78
#3  0x00e18c9c in qemu_mutex_lock_impl (mutex=0x14f2e68
<qemu_global_mutex>, file=0x1355bd4 "../../util/rcu.c", line=266)
    at ../../util/qemu-thread-posix.c:79
#4  0x00c1403a in qemu_mutex_lock_iothread_impl (file=0x1355bd4
"../../util/rcu.c", line=line@entry=266) at ../../softmmu/cpus.c:493
#5  0x00e15ad4 in call_rcu_thread (opaque=<optimised out>) at
../../util/rcu.c:266
#6  0x00e18ba2 in qemu_thread_start (args=<optimised out>) at
../../util/qemu-thread-posix.c:541
#7  0xf706b614 in start_thread (arg=0xa8db8843) at pthread_create.c:463
#8  0xf70067ec in  () at ../sysdeps/unix/sysv/linux/arm/clone.S:73

Thread 1 (Thread 0xf12f9010 (LWP 20681)):
#0  0xf6f85204 in __libc_do_syscall () at
../sysdeps/unix/sysv/linux/arm/libc-do-syscall.S:46
#1  0xf6fff948 in __GI___poll (fds=0x3248040, nfds=2, timeout=-1) at
../sysdeps/unix/sysv/linux/poll.c:29
#2  0xf781692e in  () at /usr/lib/arm-linux-gnueabihf/libglib-2.0.so.0

Backtrace of qemu-storage-daemon:

(gdb) thread apply all bt

Thread 2 (Thread 0xf21ffdd0 (LWP 20722)):
#0  syscall () at ../sysdeps/unix/sysv/linux/arm/syscall.S:37
#1  0x009a9986 in qemu_futex_wait (val=<optimised out>, f=<optimised
out>) at /home/peter.maydell/qemu/include/qemu/futex.h:29
#2  qemu_event_wait (ev=ev@entry=0xa64958 <rcu_call_ready_event>) at
../../util/qemu-thread-posix.c:480
#3  0x009a5d66 in call_rcu_thread (opaque=<optimised out>) at
../../util/rcu.c:258
#4  0x009a8e6a in qemu_thread_start (args=<optimised out>) at
../../util/qemu-thread-posix.c:541
#5  0xf79dd614 in start_thread (arg=0xa310c11f) at pthread_create.c:463
#6  0xf79787ec in ?? () at ../sysdeps/unix/sysv/linux/arm/clone.S:73
from /lib/arm-linux-gnueabihf/libc.so.6
Backtrace stopped: previous frame identical to this frame (corrupt stack?)

Thread 1 (Thread 0xf22f7010 (LWP 20679)):
#0  __libc_do_syscall () at ../sysdeps/unix/sysv/linux/arm/libc-do-syscall.S:46
#1  0xf7971a04 in __GI_ppoll (fds=0x117c578, nfds=5,
timeout=<optimised out>, timeout@entry=0x0, sigmask=sigmask@entry=0x0)
    at ../sysdeps/unix/sysv/linux/ppoll.c:39
#2  0x009a68fc in ppoll (__ss=0x0, __timeout=0x0, __nfds=<optimised
out>, __fds=<optimised out>)
    at /usr/include/arm-linux-gnueabihf/bits/poll2.h:77
#3  qemu_poll_ns (fds=<optimised out>, nfds=<optimised out>,
timeout=<optimised out>) at ../../util/qemu-timer.c:336
#4  0x009c0222 in os_host_main_loop_wait (timeout=-1) at
../../util/main-loop.c:250
#5  main_loop_wait (nonblocking=<optimised out>) at ../../util/main-loop.c:531
#6  0x008ee92a in main (argc=5, argv=0xffdce5c4) at
../../storage-daemon/qemu-storage-daemon.c:345


Any ideas ?

thanks
-- PMM

