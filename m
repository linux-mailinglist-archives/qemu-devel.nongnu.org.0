Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B561C3C7781
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 21:50:22 +0200 (CEST)
Received: from localhost ([::1]:43466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3OQ9-0001FK-OD
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 15:50:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3OIh-0005CR-GC
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 15:42:39 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:39635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3OId-0007PA-Ue
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 15:42:37 -0400
Received: by mail-ed1-x531.google.com with SMTP id v1so34737842edt.6
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 12:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=RACHyTAUb8tgNCa8nMywfpMo//Rgy7gGeID2hTFJZ7Y=;
 b=QLrer2mdN/TvptsheV3nfTF194SbydC3aKUVfmIzw3d5XB9cVug0GfVRowsqdL5PAO
 JDM0nqOfTitEqvNE3xswjHtHP9glC/IR32sdQ7muidCSM4YIHYIsWE1uFsi2k5eLaHT8
 Ugmg6BG2pxjZEBKwvg5zRHUNjHfsiwIDaAWZcEfpG/0otHhyRLJ4fMfFc6Ugk0USuKci
 2l9qSFwHtZK9RKAYzkghVDW8Kce5+RXQA6366/PUpM0dwk2c3ZvzAlOxe6R0RrdYjVW8
 Q2uqvvb4bkB+lc6LTZC6LlvqM4w00P9+Bt6k3IDQqM/sZ4YpPvjUTAbZzT1jk264EHj/
 Gtog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=RACHyTAUb8tgNCa8nMywfpMo//Rgy7gGeID2hTFJZ7Y=;
 b=OSsnTj1nuLNF1j35ktKGTRfaQGX5idQ9Fid7yr3MlUUXFFab5YpCaIOwRjd5mdhDhL
 bF+RotiFLprkOYSoY5tQKtfwyQPAP/cEixN6XFr+kgWVSZ1Y+VcDcTiCmv35gup0kW4/
 RaOxMSwaFUZOOoDW17sPY2i03B8u4EhcWXiy1ur/NBpasBk0DLsQGfgcYvbtPXFSpnWJ
 iZltspS4djGzcIYfAv83y1AoDd73uJoZxaGNCDKYS78KGcvShVVFJp2Q/MCAIsM+JQPb
 cTTRXiUNOzMCrUZ0YbAKU8xmlrvFaBUe8+IoFoqeJXKZu1sXQDP21kkhgLRSwq6KTuY/
 0ttQ==
X-Gm-Message-State: AOAM533sR6X6bfaASUXNCble7bsRVp8lzBucZY37LpbA/gjrpTC2VnY/
 bKdHGJstSxewBFGC5FEVOUSPOz+HnxgBE2OJ9hlAGQ60f/PyoaoK
X-Google-Smtp-Source: ABdhPJxMK2SgDoXsMLcktpVJDIHFcMDzsguZp4vhfZ3RluX3ojN8Ue2t0Nrm9cYyGEDe9/4FE1np4ct3Gc+ClhrPX5w=
X-Received: by 2002:a05:6402:1ca4:: with SMTP id
 cz4mr7910959edb.52.1626205354169; 
 Tue, 13 Jul 2021 12:42:34 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Jul 2021 20:41:54 +0100
Message-ID: <CAFEAcA-9cLv8OJnMqRRaXBvCcPp7Qh-xjVjMWMvuKXsT8sZTTA@mail.gmail.com>
Subject: migration test, random hang, x86-64 host
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Random hang in 'make check' for x86-64 host, clang build,
qemu-system-i386 target. I think I've seen this occasionally
in the past.

This is with commit 708f50199b59 plus a merge of the
ppc pullreq c785a40179b, but the latter doesn't touch anything
relevant here.

Process tree:

petmay01 17386  0.0  0.0  13920  3100 ?        S    19:41   0:00
                       \_ bash -o pipefail -c echo
'MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
QTEST_QEMU_IMG=./qemu-img
G_TEST_DBUS_DAEMON=/mnt/nvmedisk/linaro/qemu-for-merges/tests/dbus-vmstate-daemon.sh
QTEST_QEMU_BINARY=./qemu-system-i386
QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon
tests/qtest/migration-test --tap -k' &&
MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
QTEST_QEMU_IMG=./qemu-img
G_TEST_DBUS_DAEMON=/mnt/nvmedisk/linaro/qemu-for-merges/tests/dbus-vmstate-daemon.sh
QTEST_QEMU_BINARY=./qemu-system-i386
QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon
tests/qtest/migration-test --tap -k -m quick < /dev/null |
./scripts/tap-driver.pl --test-name="qtest-i386/migration-test"
petmay01 17387 35.6  0.0 108676  5176 ?        Rl   19:41  19:23
                           \_ tests/qtest/migration-test --tap -k -m
quick
petmay01 18514  127  0.6 2355552 195772 ?      Sl   19:42  68:56
                           |   \_ ./qemu-system-i386 -qtest
unix:/tmp/qtest-17387.sock -qtest-log /dev/null -chardev
socket,path=/tmp/qtest-17387.qmp,id=char0 -mon
chardev=char0,mode=control -display none -accel kvm -accel tcg -name
source,debug-threads=on -m 150M -serial
file:/tmp/migration-test-GIqa8F/src_serial -drive
file=/tmp/migration-test-GIqa8F/bootsect,format=raw -accel qtest
petmay01 18527  0.0  0.0      0     0 ?        Z    19:42   0:01
                           |   \_ [qemu-system-i38] <defunct>
petmay01 18687  0.0  0.2 1100052 88064 ?       Sl   19:42   0:00
                           |   \_ ./qemu-system-i386 -qtest
unix:/tmp/qtest-17387.sock -qtest-log /dev/null -chardev
socket,path=/tmp/qtest-17387.qmp,id=char0 -mon
chardev=char0,mode=control -display none -accel kvm -accel tcg -name
target,debug-threads=on -m 150M -serial
file:/tmp/migration-test-GIqa8F/dest_serial -incoming defer -drive
file=/tmp/migration-test-GIqa8F/bootsect,format=raw -accel qtest
petmay01 17388  0.0  0.0  37760 11484 ?        S    19:41   0:00
                           \_ perl ./scripts/tap-driver.pl
--test-name=qtest-i386/migration-test


Thread backtraces, process 18514:

Thread 5 (Thread 0x7fc85b7fe700 (LWP 18560)):
#0  0x00007fc89c5b37c6 in futex_abstimed_wait_cancelable (private=0,
abstime=0x0, expected=0, futex_word=0x560cad14f420) at
../sysdeps/unix/sysv/linux/futex-internal.h:205
#1  0x00007fc89c5b37c6 in do_futex_wait (sem=sem@entry=0x560cad14f420,
abstime=0x0)
    at sem_waitcommon.c:111
#2  0x00007fc89c5b38b8 in __new_sem_wait_slow (sem=0x560cad14f420,
abstime=0x0) at sem_waitcommon.c:181
#3  0x0000560caa2ca21d in qemu_sem_wait (sem=0x560cad14f420) at
../../util/qemu-thread-posix.c:357
#4  0x0000560ca9137426 in multifd_send_sync_main (f=0x560cad014d80) at
../../migration/multifd.c:617
#5  0x0000560ca9d14231 in ram_save_iterate (f=<optimised out>,
opaque=<optimised out>)
    at ../../migration/ram.c:2906
#6  0x0000560ca94f2f0e in qemu_savevm_state_iterate (f=<optimised
out>, postcopy=false)
    at ../../migration/savevm.c:1295
#7  0x0000560ca926ea16 in migration_iteration_run (s=<optimised out>)
    at ../../migration/migration.c:3534
#8  0x0000560ca926ea16 in migration_thread (opaque=<optimised out>) at
../../migration/migration.c:3767
#9  0x0000560caa2cabf7 in qemu_thread_start (args=0x560cad138330) at
../../util/qemu-thread-posix.c:541
#10 0x00007fc89c5aa6db in start_thread (arg=0x7fc85b7fe700) at
pthread_create.c:463
#11 0x00007fc89bcaf71f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 4 (Thread 0x7fc88256a700 (LWP 18524)):
#0  0x00007fc89bca4317 in ioctl () at ../sysdeps/unix/syscall-template.S:78
#1  0x0000560ca9cc5879 in kvm_vcpu_ioctl (cpu=<optimised out>, type=44672)
    at ../../accel/kvm/kvm-all.c:3011
#2  0x0000560ca9cc43d2 in kvm_cpu_exec (cpu=0x560cad0ff9c0) at
../../accel/kvm/kvm-all.c:2837
#3  0x0000560ca9be0d14 in kvm_vcpu_thread_fn (arg=0x560cad0ff9c0) at
../../accel/kvm/kvm-accel-ops.c:49
#4  0x0000560caa2cabf7 in qemu_thread_start (args=0x560cad10d090) at
../../util/qemu-thread-posix.c:541
#5  0x00007fc89c5aa6db in start_thread (arg=0x7fc88256a700) at
pthread_create.c:463
#6  0x00007fc89bcaf71f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 3 (Thread 0x7fc882e5c700 (LWP 18522)):
#0  0x00007fc89bca2cb9 in __GI___poll (fds=0x7fc874003240, nfds=3, timeout=-1)
    at ../sysdeps/unix/sysv/linux/poll.c:29
#1  0x00007fc8a1f436e9 in  () at /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#2  0x00007fc8a1f43a82 in g_main_loop_run () at
/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#3  0x0000560ca9d3f979 in iothread_run (opaque=<optimised out>) at
../../iothread.c:73
#4  0x0000560caa2cabf7 in qemu_thread_start (args=0x560cad03e420) at
../../util/qemu-thread-posix.c:541
#5  0x00007fc89c5aa6db in start_thread (arg=0x7fc882e5c700) at
pthread_create.c:463
#6  0x00007fc89bcaf71f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 2 (Thread 0x7fc88375e700 (LWP 18519)):
#0  0x00007fc89bca9639 in syscall () at
../sysdeps/unix/sysv/linux/x86_64/syscall.S:38
#1  0x0000560caa2ca74b in qemu_futex_wait (val=4294967295, f=<optimised out>)
    at /mnt/nvmedisk/linaro/qemu-for-merges/include/qemu/futex.h:29
#2  0x0000560caa2ca74b in qemu_event_wait (ev=0x560cac45f224
<rcu_call_ready_event>)
    at ../../util/qemu-thread-posix.c:480
#3  0x0000560caa2d7c22 in call_rcu_thread (opaque=<optimised out>) at
../../util/rcu.c:258
#4  0x0000560caa2cabf7 in qemu_thread_start (args=0x560cacd69840) at
../../util/qemu-thread-posix.c:541
#5  0x00007fc89c5aa6db in start_thread (arg=0x7fc88375e700) at
pthread_create.c:463
#6  0x00007fc89bcaf71f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 1 (Thread 0x7fc8a45a5440 (LWP 18514)):
#0  0x00007fc89bca2db6 in __GI_ppoll (fds=0x560cad573f20, nfds=6,
timeout=<optimised out>, sigmask=0x0)
    at ../sysdeps/unix/sysv/linux/ppoll.c:39
#1  0x0000560caa27f8e1 in qemu_poll_ns (fds=0x560cad573f20,
nfds=<optimised out>, timeout=<optimised out>) at
../../util/qemu-timer.c:348
#2  0x0000560caa28568c in os_host_main_loop_wait (timeout=1000000000)
at ../../util/main-loop.c:250
#3  0x0000560caa28568c in main_loop_wait (nonblocking=<optimised out>)
at ../../util/main-loop.c:531
---Type <return> to continue, or q <return> to quit---
#5  0x0000560ca8fcdcbb in main (argc=<optimised out>, argv=<optimised
out>, envp=<optimised out>)
    at ../../softmmu/main.c:50


Thread backtraces, process 18687:
Thread 4 (Thread 0x7fb61957b700 (LWP 18696)):
#0  0x00007fb6335c1ad3 in futex_wait_cancelable (private=<optimised
out>, expected=0, futex_word=0x556a2b37e07c) at
../sysdeps/unix/sysv/linux/futex-internal.h:88
#1  0x00007fb6335c1ad3 in __pthread_cond_wait_common (abstime=0x0,
mutex=0x556a29e3af40 <qemu_global_mutex>, cond=0x556a2b37e050) at
pthread_cond_wait.c:502
#2  0x00007fb6335c1ad3 in __pthread_cond_wait (cond=0x556a2b37e050,
mutex=0x556a29e3af40 <qemu_global_mutex>) at pthread_cond_wait.c:655
#3  0x0000556a27ca94f4 in qemu_cond_wait_impl (cond=0x556a2b37e050,
mutex=0x556a29e3af40 <qemu_global_mutex>, file=0x556a27f12095
"../../softmmu/cpus.c", line=419) at
../../util/qemu-thread-posix.c:194
#4  0x0000556a27627693 in qemu_wait_io_event (cpu=0x556a2b3709c0) at
../../softmmu/cpus.c:419
#5  0x0000556a275c0d2b in kvm_vcpu_thread_fn (arg=0x556a2b3709c0) at
../../accel/kvm/kvm-accel-ops.c:54
#6  0x0000556a27caabf7 in qemu_thread_start (args=0x556a2b37e090) at
../../util/qemu-thread-posix.c:541
#7  0x00007fb6335bb6db in start_thread (arg=0x7fb61957b700) at
pthread_create.c:463
#8  0x00007fb632cc071f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 3 (Thread 0x7fb619e6d700 (LWP 18694)):
#0  0x00007fb632cb3cb9 in __GI___poll (fds=0x7fb60c003240, nfds=3, timeout=-1)
    at ../sysdeps/unix/sysv/linux/poll.c:29
#1  0x00007fb638f546e9 in  () at /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#2  0x00007fb638f54a82 in g_main_loop_run () at
/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#3  0x0000556a2771f979 in iothread_run (opaque=<optimised out>) at
../../iothread.c:73
#4  0x0000556a27caabf7 in qemu_thread_start (args=0x556a2b2af420) at
../../util/qemu-thread-posix.c:541
#5  0x00007fb6335bb6db in start_thread (arg=0x7fb619e6d700) at
pthread_create.c:463
#6  0x00007fb632cc071f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 2 (Thread 0x7fb61a76f700 (LWP 18691)):
#0  0x00007fb632cba639 in syscall () at
../sysdeps/unix/sysv/linux/x86_64/syscall.S:38
#1  0x0000556a27caa74b in qemu_futex_wait (val=4294967295, f=<optimised out>)
    at /mnt/nvmedisk/linaro/qemu-for-merges/include/qemu/futex.h:29
#2  0x0000556a27caa74b in qemu_event_wait (ev=0x556a29e3f224
<rcu_call_ready_event>)
    at ../../util/qemu-thread-posix.c:480
#3  0x0000556a27cb7c22 in call_rcu_thread (opaque=<optimised out>) at
../../util/rcu.c:258
#4  0x0000556a27caabf7 in qemu_thread_start (args=0x556a2afda840) at
../../util/qemu-thread-posix.c:541
#5  0x00007fb6335bb6db in start_thread (arg=0x7fb61a76f700) at
pthread_create.c:463
#6  0x00007fb632cc071f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 1 (Thread 0x7fb63b5b6440 (LWP 18687)):
#0  0x00007fb632cb3db6 in __GI_ppoll (fds=0x556a2c0baa50, nfds=7,
timeout=<optimised out>, sigmask=0x0)
    at ../sysdeps/unix/sysv/linux/ppoll.c:39
#1  0x0000556a27c5f8e1 in qemu_poll_ns (fds=0x556a2c0baa50,
nfds=<optimised out>, timeout=<optimised out>) at
../../util/qemu-timer.c:348
#2  0x0000556a27c6568c in os_host_main_loop_wait (timeout=1000000000)
at ../../util/main-loop.c:250
#3  0x0000556a27c6568c in main_loop_wait (nonblocking=<optimised out>)
at ../../util/main-loop.c:531
#4  0x0000556a274b7517 in qemu_main_loop () at ../../softmmu/runstate.c:726
#5  0x0000556a269adcbb in main (argc=<optimised out>, argv=<optimised
out>, envp=<optimised out>)
    at ../../softmmu/main.c:50


Thread backtraces, migration-test process:

Thread 2 (Thread 0x7faa2ff97700 (LWP 17390)):
#0  syscall () at ../sysdeps/unix/sysv/linux/x86_64/syscall.S:38
#1  0x0000557a3da6f5fb in qemu_futex_wait (val=4294967295, f=<optimised out>)
    at /mnt/nvmedisk/linaro/qemu-for-merges/include/qemu/futex.h:29
#2  qemu_event_wait (ev=0x557a3e78b5c4 <rcu_call_ready_event>) at
../../util/qemu-thread-posix.c:480
#3  0x0000557a3da7a6d2 in call_rcu_thread (opaque=<optimised out>) at
../../util/rcu.c:258
#4  0x0000557a3da6faa7 in qemu_thread_start (args=0x557a3fbd0590) at
../../util/qemu-thread-posix.c:541
#5  0x00007faa30c266db in start_thread (arg=0x7faa2ff97700) at
pthread_create.c:463
#6  0x00007faa3032b71f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Thread 1 (Thread 0x7faa316e1780 (LWP 17387)):
#0  0x00007faa302ee7a0 in __GI___nanosleep
(requested_time=requested_time@entry=0x7ffd6a1505f0,
    remaining=remaining@entry=0x0) at ../sysdeps/unix/sysv/linux/nanosleep.c:28
#1  0x00007faa30321657 in usleep (useconds=<optimised out>) at
../sysdeps/posix/usleep.c:32
#2  0x0000557a3da1aafa in wait_for_migration_status (who=<optimised
out>, goal=<optimised out>,
    ungoals=<optimised out>) at ../../tests/qtest/migration-helpers.c:157
#3  0x0000557a3da1806a in test_multifd_tcp_cancel () at
../../tests/qtest/migration-test.c:1375
#4  0x00007faa3124f05a in ?? () from /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#5  0x00007faa3124ef8b in ?? () from /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#6  0x00007faa3124ef8b in ?? () from /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#7  0x00007faa3124ef8b in ?? () from /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#8  0x00007faa3124ef8b in ?? () from /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#9  0x00007faa3124f232 in g_test_run_suite () from
/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#10 0x00007faa3124f251 in g_test_run () from
/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#11 0x0000557a3da168e2 in main (argc=1, argv=0x7ffd6a150c98) at
../../tests/qtest/migration-test.c:1494

thanks
-- PMM

