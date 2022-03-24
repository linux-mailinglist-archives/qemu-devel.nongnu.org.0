Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE8D4E6266
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 12:23:28 +0100 (CET)
Received: from localhost ([::1]:48358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXLYt-0006gq-9t
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 07:23:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXLUY-0003u7-IO
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 07:19:00 -0400
Received: from [2607:f8b0:4864:20::92d] (port=39585
 helo=mail-ua1-x92d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXLUW-0007Pq-9c
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 07:18:58 -0400
Received: by mail-ua1-x92d.google.com with SMTP id i26so1904687uap.6
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 04:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=PbvdPUtLPSEAYg2V0AsPSnq6eBMtXX9aphtDeBJQX3c=;
 b=Wy7YrWEmUAHtqXCKKCm+tqmx5P+jFgRWTBbnrXUOL5Rj7r8JS0FukdiY2sfaFIXkJD
 Yq+vICQT7AiJ90ec8boebitI4JhV0jVvJnw4cU4Z6SS3VQL/VJ820vzyA7m8+8EwPJrl
 wZ1uNSVQkuKML/ZadyFpEJq11InatX3Hv4cuMqnozZgr5jYmtEWM4i53/Rh7H3Bh0AiG
 vtqz0oFq91nV9ugxaly3VEYTXzEDSQusg7qesPz3w0pujAsQ/4NifluVk7Knk/UN2Opr
 njT9FYDxJl4gDneg5P51ofJtVBIcYEQoYcHkDNVlEiUNKUHawzFCcTtqkwh3XU+LYzrQ
 Z/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=PbvdPUtLPSEAYg2V0AsPSnq6eBMtXX9aphtDeBJQX3c=;
 b=Qo3QqiD+NflDOuIAncCVnckrOYmaAJqmcpOGK2gE1ZXKr1ipFT3MibNhb6s8wKiDDQ
 QcuIObXG3Nd9CmVlUDLE5JbLGyVEyHog8uyMHLn/fYEQFjaxhGlQ4W/ilIFLeIG9E0jV
 YiGmdBC2XGHdgogHNj+LKti+VTyRllKzWns87fkZmF3KGyk0AQbTJFmWdti9QLou+uIJ
 YebmEZBSPbGDjOODtNJG+cpoxQDw8dOctS1xtGz7M5DeW90aOOsKVXkLbzFWYJ4vCGNG
 y+y8Z9Bq+KGkEXgPnVUx6pfcCyFt1M0skRrv3qrxpUIc3i02n7KDVeOoQt2nWmmi/sVS
 obOA==
X-Gm-Message-State: AOAM530adfWsQ5eIk1ZqxAqtNIACjTsydvXEJMempdFmd81ivAMtTK9l
 NnKuN0w7rM6C70h15td+Rbo+qYVU4XFCvEL6YL1EdZA/UZJJDP89
X-Google-Smtp-Source: ABdhPJymny4r0U8Z2+6RSQDgNb+jGOg8xsFJ++jih7YOzJUBdEBTJhTWOsOyAz61yq3IdUMIzRAca8aMc0+1ns2aOuQ=
X-Received: by 2002:a25:cdc8:0:b0:633:8aa6:6a3 with SMTP id
 d191-20020a25cdc8000000b006338aa606a3mr3868684ybf.288.1648120289739; Thu, 24
 Mar 2022 04:11:29 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Mar 2022 11:11:17 +0000
Message-ID: <CAFEAcA9PDWf+NDajMMTE5svM9mUTOOrWXj+O2wn7Sd8=RZDgaw@mail.gmail.com>
Subject: hang in virtio-failover-test (s390 host)
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ua1-x92d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a backtrace from virtio-failover-test, which had hung
on the s390 gitlab CI runner. Both processes were using CPU,
so this is some kind of livelock, not a deadlock.

Looking more closely at the virtio-net-failover process, in the function
test_migrate_off_abort() we have executed 'migrate_cancel' and then go
into a loop waiting for 'status' to be "cancelled", with aborts if
it is either "failed" or "active". But the status the QEMU process
returns is "completed", so we loop forever waiting for a status change
that will never come (I assume).

I also have a hang in migration-test on this system, which I'll
send a separate email about.

-- PMM

virtio-net-fail(2706321)=E2=94=80=E2=94=80=E2=94=80qemu-system-i38(2706783)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
PROCESS: 2706321
gitlab-+ 2706321 2691914 46 Mar23 ?        08:49:56
/home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/build/tests/qtest/v=
irtio-net-failover
--tap -k
[New LWP 2706322]
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/s390x-linux-gnu/libthread_db.so.1".
__libc_read (nbytes=3D1, buf=3D0x3ffe6bfa4d7, fd=3D3) at
../sysdeps/unix/sysv/linux/read.c:26
26      ../sysdeps/unix/sysv/linux/read.c: No such file or directory.

Thread 2 (Thread 0x3ff8617f900 (LWP 2706322)):
#0  syscall () at ../sysdeps/unix/sysv/linux/s390/s390-64/syscall.S:37
#1  0x000002aa3f8bb334 in qemu_futex_wait (val=3D<optimized out>,
f=3D<optimized out>) at
/home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/include/qemu/futex.=
h:29
#2  qemu_event_wait (ev=3Dev@entry=3D0x2aa3f8f6ce8 <rcu_call_ready_event>)
at ../util/qemu-thread-posix.c:481
#3  0x000002aa3f8c5a2a in call_rcu_thread (opaque=3Dopaque@entry=3D0x0) at
../util/rcu.c:261
#4  0x000002aa3f8ba32a in qemu_thread_start (args=3D<optimized out>) at
../util/qemu-thread-posix.c:556
#5  0x000003ff86407e66 in start_thread (arg=3D0x3ff8617f900) at
pthread_create.c:477
#6  0x000003ff862fcbf6 in thread_start () at
../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Thread 1 (Thread 0x3ff867f5430 (LWP 2706321)):
#0  __libc_read (nbytes=3D1, buf=3D0x3ffe6bfa4d7, fd=3D3) at
../sysdeps/unix/sysv/linux/read.c:26
#1  __libc_read (fd=3Dfd@entry=3D3, buf=3Dbuf@entry=3D0x3ffe6bfa4d7,
nbytes=3Dnbytes@entry=3D1) at ../sysdeps/unix/sysv/linux/read.c:24
#2  0x000002aa3f89d4f4 in read (__nbytes=3D1, __buf=3D0x3ffe6bfa4d7,
__fd=3D3) at /usr/include/s390x-linux-gnu/bits/unistd.h:44
#3  qmp_fd_receive (fd=3D<optimized out>) at ../tests/qtest/libqtest.c:613
#4  0x000002aa3f89d59a in qtest_qmp_receive_dict (s=3D0x2aa401fcc50) at
../tests/qtest/libqtest.c:648
#5  qtest_qmp_receive (s=3D0x2aa401fcc50) at ../tests/qtest/libqtest.c:636
#6  0x000002aa3f89de84 in qtest_vqmp (s=3D<optimized out>,
fmt=3D<optimized out>, ap=3Dap@entry=3D0x3ffe6bfa680) at
../tests/qtest/libqtest.c:749
#7  0x000002aa3f89e0aa in qtest_qmp (s=3D<optimized out>, fmt=3D<optimized
out>) at ../tests/qtest/libqtest.c:790
#8  0x000002aa3f88cc88 in migrate_status (qts=3D<optimized out>) at
../tests/qtest/virtio-net-failover.c:595
#9  0x000002aa3f892fcc in test_migrate_off_abort (opaque=3D<optimized
out>) at ../tests/qtest/virtio-net-failover.c:1425
#10 0x000003ff865fe608 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
#11 0x000003ff865fe392 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
#12 0x000003ff865fe392 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
#13 0x000003ff865fe392 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
#14 0x000003ff865fe392 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
#15 0x000003ff865feada in g_test_run_suite () from
/lib/s390x-linux-gnu/libglib-2.0.so.0
#16 0x000003ff865feb10 in g_test_run () from
/lib/s390x-linux-gnu/libglib-2.0.so.0
#17 0x000002aa3f88c43a in main (argc=3D<optimized out>, argv=3D<optimized
out>) at ../tests/qtest/virtio-net-failover.c:1869
[Inferior 1 (process 2706321) detached]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
PROCESS: 2706783
gitlab-+ 2706783 2706321 33 Mar23 ?        06:19:26 ./qemu-system-i386
-qtest unix:/tmp/qtest-2706321.sock -qtest-log /dev/null -chardev
socket,path=3D/tmp/qtest-2706321.qmp,id=3Dchar0 -mon
chardev=3Dchar0,mode=3Dcontrol -display none -M q35 -nodefaults -device
pcie-root-port,id=3Droot0,addr=3D0x1,bus=3Dpcie.0,chassis=3D1 -device
pcie-root-port,id=3Droot1,addr=3D0x2,bus=3Dpcie.0,chassis=3D2 -netdev
user,id=3Dhs0 -netdev user,id=3Dhs1 -accel qtest
[New LWP 2706795]
[New LWP 2706796]
[New LWP 2706797]
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/s390x-linux-gnu/libthread_db.so.1".
0x000003ffa5cf1c9c in __ppoll (fds=3D0x2aa22222600, nfds=3D5,
timeout=3D<optimized out>, timeout@entry=3D0x3ffca97b438,
sigmask=3Dsigmask@entry=3D0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
44      ../sysdeps/unix/sysv/linux/ppoll.c: No such file or directory.

Thread 4 (Thread 0x3ff95ca1900 (LWP 2706797)):
#0  futex_wait_cancelable (private=3D0, expected=3D0,
futex_word=3D0x2aa214a5dd8) at ../sysdeps/nptl/futex-internal.h:183
#1  __pthread_cond_wait_common (abstime=3D0x0, clockid=3D0,
mutex=3D0x2aa1f426f10 <qemu_global_mutex>, cond=3D0x2aa214a5db0) at
pthread_cond_wait.c:508
#2  __pthread_cond_wait (cond=3Dcond@entry=3D0x2aa214a5db0,
mutex=3Dmutex@entry=3D0x2aa1f426f10 <qemu_global_mutex>) at
pthread_cond_wait.c:638
#3  0x000002aa1eab0e56 in qemu_cond_wait_impl (cond=3D0x2aa214a5db0,
mutex=3D0x2aa1f426f10 <qemu_global_mutex>, file=3D0x2aa1eb2e3fc
"../softmmu/cpus.c", line=3D<optimized out>) at
../util/qemu-thread-posix.c:195
#4  0x000002aa1e4f4436 in qemu_wait_io_event
(cpu=3Dcpu@entry=3D0x2aa214993b0) at ../softmmu/cpus.c:424
#5  0x000002aa1e882f22 in dummy_cpu_thread_fn
(arg=3Darg@entry=3D0x2aa214993b0) at ../accel/dummy-cpus.c:53
#6  0x000002aa1eab05c2 in qemu_thread_start (args=3D<optimized out>) at
../util/qemu-thread-posix.c:556
#7  0x000003ffa5e07e66 in start_thread (arg=3D0x3ff95ca1900) at
pthread_create.c:477
#8  0x000003ffa5cfcbf6 in thread_start () at
../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Thread 3 (Thread 0x3ff964a2900 (LWP 2706796)):
#0  0x000003ffa5cf1b42 in __GI___poll (fds=3D0x3ff88003250, nfds=3D3,
timeout=3D<optimized out>) at ../sysdeps/unix/sysv/linux/poll.c:29
#1  0x000003ffa83d4386 in  () at /lib/s390x-linux-gnu/libglib-2.0.so.0
#2  0x000003ffa83d4790 in g_main_loop_run () at
/lib/s390x-linux-gnu/libglib-2.0.so.0
#3  0x000002aa1e8bfa4e in iothread_run
(opaque=3Dopaque@entry=3D0x2aa212f3400) at ../iothread.c:73
#4  0x000002aa1eab05c2 in qemu_thread_start (args=3D<optimized out>) at
../util/qemu-thread-posix.c:556
#5  0x000003ffa5e07e66 in start_thread (arg=3D0x3ff964a2900) at
pthread_create.c:477
#6  0x000003ffa5cfcbf6 in thread_start () at
../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Thread 2 (Thread 0x3ff96da4900 (LWP 2706795)):
#0  syscall () at ../sysdeps/unix/sysv/linux/s390/s390-64/syscall.S:37
#1  0x000002aa1eab15cc in qemu_futex_wait (val=3D<optimized out>,
f=3D<optimized out>) at
/home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/include/qemu/futex.=
h:29
#2  qemu_event_wait (ev=3Dev@entry=3D0x2aa1f457e60 <rcu_call_ready_event>)
at ../util/qemu-thread-posix.c:481
#3  0x000002aa1eab9e42 in call_rcu_thread (opaque=3Dopaque@entry=3D0x0) at
../util/rcu.c:261
#4  0x000002aa1eab05c2 in qemu_thread_start (args=3D<optimized out>) at
../util/qemu-thread-posix.c:556
#5  0x000003ffa5e07e66 in start_thread (arg=3D0x3ff96da4900) at
pthread_create.c:477
#6  0x000003ffa5cfcbf6 in thread_start () at
../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Thread 1 (Thread 0x3ffa91fe440 (LWP 2706783)):
#0  0x000003ffa5cf1c9c in __ppoll (fds=3D0x2aa22222600, nfds=3D5,
timeout=3D<optimized out>, timeout@entry=3D0x3ffca97b438,
sigmask=3Dsigmask@entry=3D0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
#1  0x000002aa1ead154a in ppoll (__ss=3D0x0, __timeout=3D0x3ffca97b438,
__nfds=3D<optimized out>, __fds=3D<optimized out>) at
/usr/include/s390x-linux-gnu/bits/poll2.h:77
#2  qemu_poll_ns (fds=3D<optimized out>, nfds=3D<optimized out>,
timeout=3Dtimeout@entry=3D1000000000) at ../util/qemu-timer.c:348
#3  0x000002aa1eacd768 in os_host_main_loop_wait (timeout=3D1000000000)
at ../util/main-loop.c:250
#4  main_loop_wait (nonblocking=3Dnonblocking@entry=3D0) at ../util/main-lo=
op.c:531
#5  0x000002aa1e4faa94 in qemu_main_loop () at ../softmmu/runstate.c:727
#6  0x000002aa1e4ae7a0 in main (argc=3D<optimized out>, argv=3D<optimized
out>, envp=3D<optimized out>) at ../softmmu/main.c:50
[Inferior 1 (process 2706783) detached]

thanks
-- PMM

