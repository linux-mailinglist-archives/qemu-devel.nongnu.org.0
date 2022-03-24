Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D43794E6263
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 12:22:59 +0100 (CET)
Received: from localhost ([::1]:47282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXLYQ-0005z1-Dx
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 07:22:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXLVL-0004TU-S7
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 07:19:49 -0400
Received: from [2607:f8b0:4864:20::112b] (port=43423
 helo=mail-yw1-x112b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXLVJ-0007bR-Cx
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 07:19:47 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2e5e31c34bfso47046607b3.10
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 04:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=Oj9p0jwOgVoiL4eo/7l/C3nngDfxFTcgc1zr6BoVH90=;
 b=vZ3sIzkvR2HacR12zsqmRYfoCN8lEeZgrYNeVCL7ICph+GH4NdeP+akHG8wud0YNyP
 5Pbb84sxuNzTsGGAkPo1/tuFgXdhRE4gSGWyB0+59J15+B7S8u9TiCta2iOocSAonM5m
 fh+CzuMpiG6592+UvIXRrz+cYNCPNB5xihW35G+UpvAJPTahioVW32eWGFZj18/FKAi3
 VannfoDKOtCYLSlL20A8DkfCnRxiUmXZmcs7aLFOmQLhRGqfJzwpJIMtHd+6LzhNndeG
 lEhUkQF5mn1chDEKbxpURAfH0Q6bnMTHqwBh91B69hCXCP64sb/eQ755VFOKYvzpW9f4
 3Lzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=Oj9p0jwOgVoiL4eo/7l/C3nngDfxFTcgc1zr6BoVH90=;
 b=vJfPqAbf18fo2liNcBaXQEc8ad/v6wuXIN2tDvQp3qE56v0BS2c+xabLsGAHTImhTZ
 1801P2bdUf64GDIQB0nCf/zyUfaXF1WfgGc4kqtTETVSMvYBE1spvZHSu35ncbE7JdJD
 n0uiTkZ4RFvrtLt58RoWoo+64m4eLfXqeAtjuF9JqbJP6Dgkwy7bVNv1We56umnMyQe+
 jDXki/OfvQhjNR8cjsU/+OSPFUVhawUxOiZGMIPDaoSy3yiLn5sYgEA3TWuKsMhZo3km
 qVzwB0VCuuu4HGNZ5A8w0qIybzlt/XwtdCb1NwKZWiyP+weV+cTo2US4mnFshPU87fOj
 LdKA==
X-Gm-Message-State: AOAM531Sh3JFCF5AYMZHT0OJcVGl1dl8bSjvdBngYbbyRvCsatz7d1Te
 Nj/ccT9I7fnLIa50RiF8YwscPjNL79aoDwy41FC7Ke05Pwaebk2M
X-Google-Smtp-Source: ABdhPJzJ/oiplWjx4Aj0LPesNfkhoXL0t14HI5fM3OS4mozNkEcdlMH5xLDLA0oGu408p4PXiQJ9TiGvRiuwABA6gqs=
X-Received: by 2002:a0d:fd02:0:b0:2e5:9617:fda8 with SMTP id
 n2-20020a0dfd02000000b002e59617fda8mr4126131ywf.10.1648120783814; Thu, 24 Mar
 2022 04:19:43 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Mar 2022 11:19:30 +0000
Message-ID: <CAFEAcA_X7d9-e+u3UpB5WvJrmJhhRKdw8EhUzCdFDNVfhFF8mg@mail.gmail.com>
Subject: hang in migration-test (s390 host)
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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

Here's the hang in the migration-test process. It's in
the test_multifd_tcp_cancel() test.

Here the status returned by the QEMU process is "cancelling",
and we are spinning forever waiting for a "cancelled" state
that never arrives.

I can keep these stuck tests around for a day or so in case there's
further stuff you'd like me to check via gdb, but they
eat CPU on these hosts and prevent us running further CI jobs
(the lack of spare CPU on the box means the other CI jobs tend
to time out before the 1h mark) so I can't keep them indefinitely.

-- PMM

Process tree:
migration-test(2771497)=E2=94=80=E2=94=AC=E2=94=80qemu-system-i38(2772862)
                        =E2=94=9C=E2=94=80qemu-system-i38(2772869)
                        =E2=94=94=E2=94=80qemu-system-i38(2773014)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
PROCESS: 2771497
gitlab-+ 2771497 2769521 10 Mar23 ?        01:51:09
/home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/build/tests/qtest/m=
igration-test
--tap -k
[New LWP 2771498]
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/s390x-linux-gnu/libthread_db.so.1".
__libc_read (nbytes=3D1, buf=3D0x3ffd577abd7, fd=3D4) at
../sysdeps/unix/sysv/linux/read.c:26
26      ../sysdeps/unix/sysv/linux/read.c: No such file or directory.

Thread 2 (Thread 0x3ffb197f900 (LWP 2771498)):
#0  syscall () at ../sysdeps/unix/sysv/linux/s390/s390-64/syscall.S:37
#1  0x000002aa00535c14 in qemu_futex_wait (val=3D<optimized out>,
f=3D<optimized out>) at
/home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/include/qemu/futex.=
h:29
#2  qemu_event_wait (ev=3Dev@entry=3D0x2aa0056eb50 <rcu_call_ready_event>)
at ../util/qemu-thread-posix.c:481
#3  0x000002aa00541aca in call_rcu_thread (opaque=3Dopaque@entry=3D0x0) at
../util/rcu.c:261
#4  0x000002aa00534c0a in qemu_thread_start (args=3D<optimized out>) at
../util/qemu-thread-posix.c:556
#5  0x000003ffb1c07e66 in start_thread (arg=3D0x3ffb197f900) at
pthread_create.c:477
#6  0x000003ffb1afcbf6 in thread_start () at
../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Thread 1 (Thread 0x3ffb1ff5430 (LWP 2771497)):
#0  __libc_read (nbytes=3D1, buf=3D0x3ffd577abd7, fd=3D4) at
../sysdeps/unix/sysv/linux/read.c:26
#1  __libc_read (fd=3Dfd@entry=3D4, buf=3Dbuf@entry=3D0x3ffd577abd7,
nbytes=3Dnbytes@entry=3D1) at ../sysdeps/unix/sysv/linux/read.c:24
#2  0x000002aa00511bc4 in read (__nbytes=3D1, __buf=3D0x3ffd577abd7,
__fd=3D4) at /usr/include/s390x-linux-gnu/bits/unistd.h:44
#3  qmp_fd_receive (fd=3D<optimized out>) at ../tests/qtest/libqtest.c:613
#4  0x000002aa00511c6a in qtest_qmp_receive_dict (s=3D0x2aa00ea3110) at
../tests/qtest/libqtest.c:648
#5  qtest_qmp_receive (s=3Ds@entry=3D0x2aa00ea3110) at ../tests/qtest/libqt=
est.c:636
#6  0x000002aa00512554 in qtest_vqmp (s=3Ds@entry=3D0x2aa00ea3110,
fmt=3Dfmt@entry=3D0x2aa00548098 "{ 'execute': 'query-migrate' }",
ap=3Dap@entry=3D0x3ffd577ad80) at ../tests/qtest/libqtest.c:749
#7  0x000002aa00510386 in wait_command (who=3Dwho@entry=3D0x2aa00ea3110,
command=3Dcommand@entry=3D0x2aa00548098 "{ 'execute': 'query-migrate' }")
at ../tests/qtest/migration-helpers.c:63
#8  0x000002aa00510498 in migrate_query (who=3Dwho@entry=3D0x2aa00ea3110)
at ../tests/qtest/migration-helpers.c:116
#9  migrate_query_status (who=3Dwho@entry=3D0x2aa00ea3110) at
../tests/qtest/migration-helpers.c:116
#10 0x000002aa005106ac in check_migration_status (ungoals=3D0x0,
goal=3D0x2aa00547a10 "cancelled", who=3D0x2aa00ea3110) at
../tests/qtest/migration-helpers.c:156
#11 wait_for_migration_status (who=3D0x2aa00ea3110, goal=3D<optimized
out>, ungoals=3D0x0) at ../tests/qtest/migration-helpers.c:156
#12 0x000002aa0050fbc2 in test_multifd_tcp_cancel () at
../tests/qtest/migration-test.c:1379
#13 0x000003ffb1dfe608 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
#14 0x000003ffb1dfe392 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
#15 0x000003ffb1dfe392 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
#16 0x000003ffb1dfe392 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
#17 0x000003ffb1dfe392 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
#18 0x000003ffb1dfeada in g_test_run_suite () from
/lib/s390x-linux-gnu/libglib-2.0.so.0
#19 0x000003ffb1dfeb10 in g_test_run () from
/lib/s390x-linux-gnu/libglib-2.0.so.0
#20 0x000002aa0050cea8 in main (argc=3D<optimized out>, argv=3D<optimized
out>) at ../tests/qtest/migration-test.c:1491
[Inferior 1 (process 2771497) detached]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
PROCESS: 2772862
gitlab-+ 2772862 2771497 99 Mar23 ?        18:45:28 ./qemu-system-i386
-qtest unix:/tmp/qtest-2771497.sock -qtest-log /dev/null -chardev
socket,path=3D/tmp/qtest-2771497.qmp,id=3Dchar0 -mon
chardev=3Dchar0,mode=3Dcontrol -display none -accel kvm -accel tcg -name
source,debug-threads=3Don -m 150M -serial
file:/tmp/migration-test-f6G71L/src_serial -drive
file=3D/tmp/migration-test-f6G71L/bootsect,format=3Draw -accel qtest
[New LWP 2772864]
[New LWP 2772866]
[New LWP 2772867]
[New LWP 2772915]
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/s390x-linux-gnu/libthread_db.so.1".
0x000003ff94ef1c9c in __ppoll (fds=3D0x2aa179a6f30, nfds=3D5,
timeout=3D<optimized out>, timeout@entry=3D0x3fff557b588,
sigmask=3Dsigmask@entry=3D0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
44      ../sysdeps/unix/sysv/linux/ppoll.c: No such file or directory.

Thread 5 (Thread 0x3ff1b7f6900 (LWP 2772915)):
#0  futex_abstimed_wait_cancelable (private=3D0, abstime=3D0x0, clockid=3D0=
,
expected=3D0, futex_word=3D0x2aa1881f634) at
../sysdeps/nptl/futex-internal.h:320
#1  do_futex_wait (sem=3Dsem@entry=3D0x2aa1881f630, abstime=3D0x0,
clockid=3D0) at sem_waitcommon.c:112
#2  0x000003ff95011870 in __new_sem_wait_slow
(sem=3Dsem@entry=3D0x2aa1881f630, abstime=3D0x0, clockid=3D0) at
sem_waitcommon.c:184
#3  0x000003ff9501190e in __new_sem_wait (sem=3Dsem@entry=3D0x2aa1881f630)
at sem_wait.c:42
#4  0x000002aa165b1416 in qemu_sem_wait (sem=3Dsem@entry=3D0x2aa1881f630)
at ../util/qemu-thread-posix.c:358
#5  0x000002aa16023434 in multifd_send_sync_main (f=3D0x2aa17993760) at
../migration/multifd.c:610
#6  0x000002aa162a8f18 in ram_save_iterate (f=3D0x2aa17993760,
opaque=3D<optimized out>) at ../migration/ram.c:3049
#7  0x000002aa1602bafc in qemu_savevm_state_iterate (f=3D0x2aa17993760,
postcopy=3D<optimized out>) at ../migration/savevm.c:1296
#8  0x000002aa1601fe4e in migration_iteration_run (s=3D0x2aa17748010) at
../migration/migration.c:3607
#9  migration_thread (opaque=3Dopaque@entry=3D0x2aa17748010) at
../migration/migration.c:3838
#10 0x000002aa165b05c2 in qemu_thread_start (args=3D<optimized out>) at
../util/qemu-thread-posix.c:556
#11 0x000003ff95007e66 in start_thread (arg=3D0x3ff1b7f6900) at
pthread_create.c:477
#12 0x000003ff94efcbf6 in thread_start () at
../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Thread 4 (Thread 0x3ff84d2f900 (LWP 2772867)):
#0  rcu_read_lock () at
/home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/include/qemu/rcu.h:=
87
#1  rcu_read_auto_lock () at
/home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/include/qemu/rcu.h:=
170
#2  memory_region_get_ram_ptr (mr=3D0x2aa17612220) at ../softmmu/memory.c:2=
319
#3  0x000002aa1637abf0 in tlb_set_page_with_attrs
(cpu=3Dcpu@entry=3D0x2aa179860a0, vaddr=3Dvaddr@entry=3D52445184,
paddr=3D<optimized out>, attrs=3D..., prot=3D<optimized out>, prot@entry=3D=
7,
mmu_idx=3D2, size=3D4096) at ../accel/tcg/cputlb.c:1157
#4  0x000002aa1620465e in handle_mmu_fault (size=3D<optimized out>,
mmu_idx=3D<optimized out>, is_write1=3D<optimized out>, addr=3D<optimized
out>, cs=3D0x2aa179860a0) at ../target/i386/cpu.h:2157
#5  x86_cpu_tlb_fill (cs=3D0x2aa179860a0, addr=3D<optimized out>,
size=3D<optimized out>, access_type=3D<optimized out>, mmu_idx=3D<optimized
out>, probe=3Dfalse, retaddr=3D4394827381568) at
../target/i386/tcg/sysemu/excp_helper.c:432
#6  0x000002aa16375cea in tlb_fill (cpu=3D0x2aa179860a0, addr=3D<optimized
out>, size=3D<optimized out>, access_type=3D<optimized out>,
mmu_idx=3D<optimized out>, retaddr=3D4394827381568) at
../accel/tcg/cputlb.c:1313
#7  0x000002aa16376cd6 in load_helper (full_load=3D<optimized out>,
code_read=3Dfalse, op=3DMO_8, retaddr=3D<optimized out>, oi=3D<optimized ou=
t>,
addr=3D52445184, env=3D0x2aa1798e970) at
/home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/include/exec/cpu-al=
l.h:467
#8  full_ldub_mmu (env=3D0x2aa1798e970, addr=3D<optimized out>,
oi=3D<optimized out>, retaddr=3D<optimized out>) at
../accel/tcg/cputlb.c:2025
#9  0x000003ff401ffbfa in code_gen_buffer ()
#10 0x000002aa16369d0e in cpu_tb_exec (tb_exit=3D<synthetic pointer>,
itb=3D<optimized out>, cpu=3D<optimized out>) at
../accel/tcg/cpu-exec.c:357
#11 cpu_loop_exec_tb (tb_exit=3D<synthetic pointer>, last_tb=3D<synthetic
pointer>, tb=3D<optimized out>, cpu=3D<optimized out>) at
../accel/tcg/cpu-exec.c:847
#12 cpu_exec (cpu=3D<optimized out>) at ../accel/tcg/cpu-exec.c:1006
#13 0x0000000000007000 in  ()

Thread 3 (Thread 0x3ff85621900 (LWP 2772866)):
#0  0x000003ff94ef1b42 in __GI___poll (fds=3D0x3ff380032a0, nfds=3D3,
timeout=3D<optimized out>) at ../sysdeps/unix/sysv/linux/poll.c:29
#1  0x000003ff975d4386 in  () at /lib/s390x-linux-gnu/libglib-2.0.so.0
#2  0x000003ff975d4790 in g_main_loop_run () at
/lib/s390x-linux-gnu/libglib-2.0.so.0
#3  0x000002aa163bfa4e in iothread_run
(opaque=3Dopaque@entry=3D0x2aa176ad000) at ../iothread.c:73
#4  0x000002aa165b05c2 in qemu_thread_start (args=3D<optimized out>) at
../util/qemu-thread-posix.c:556
#5  0x000003ff95007e66 in start_thread (arg=3D0x3ff85621900) at
pthread_create.c:477
#6  0x000003ff94efcbf6 in thread_start () at
../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Thread 2 (Thread 0x3ff85fa4900 (LWP 2772864)):
#0  syscall () at ../sysdeps/unix/sysv/linux/s390/s390-64/syscall.S:37
#1  0x000002aa165b15cc in qemu_futex_wait (val=3D<optimized out>,
f=3D<optimized out>) at
/home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/include/qemu/futex.=
h:29
#2  qemu_event_wait (ev=3Dev@entry=3D0x2aa16f57e60 <rcu_call_ready_event>)
at ../util/qemu-thread-posix.c:481
#3  0x000002aa165b9e42 in call_rcu_thread (opaque=3Dopaque@entry=3D0x0) at
../util/rcu.c:261
#4  0x000002aa165b05c2 in qemu_thread_start (args=3D<optimized out>) at
../util/qemu-thread-posix.c:556
#5  0x000003ff95007e66 in start_thread (arg=3D0x3ff85fa4900) at
pthread_create.c:477
#6  0x000003ff94efcbf6 in thread_start () at
../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Thread 1 (Thread 0x3ff983fe440 (LWP 2772862)):
#0  0x000003ff94ef1c9c in __ppoll (fds=3D0x2aa179a6f30, nfds=3D5,
timeout=3D<optimized out>, timeout@entry=3D0x3fff557b588,
sigmask=3Dsigmask@entry=3D0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
#1  0x000002aa165d154a in ppoll (__ss=3D0x0, __timeout=3D0x3fff557b588,
__nfds=3D<optimized out>, __fds=3D<optimized out>) at
/usr/include/s390x-linux-gnu/bits/poll2.h:77
#2  qemu_poll_ns (fds=3D<optimized out>, nfds=3D<optimized out>,
timeout=3Dtimeout@entry=3D6543045) at ../util/qemu-timer.c:348
#3  0x000002aa165cd768 in os_host_main_loop_wait (timeout=3D6543045) at
../util/main-loop.c:250
#4  main_loop_wait (nonblocking=3Dnonblocking@entry=3D0) at ../util/main-lo=
op.c:531
#5  0x000002aa15ffaa94 in qemu_main_loop () at ../softmmu/runstate.c:727
#6  0x000002aa15fae7a0 in main (argc=3D<optimized out>, argv=3D<optimized
out>, envp=3D<optimized out>) at ../softmmu/main.c:50
[Inferior 1 (process 2772862) detached]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
PROCESS: 2772869
gitlab-+ 2772869 2771497  0 Mar23 ?        00:00:00 [qemu-system-i38] <defu=
nct>
/proc/2772869/exe: No such file or directory.
Could not attach to process.  If your uid matches the uid of the target
process, check the setting of /proc/sys/kernel/yama/ptrace_scope, or try
again as the root user.  For more details, see /etc/sysctl.d/10-ptrace.conf
warning: process 2772869 is a zombie - the process has already terminated
ptrace: Operation not permitted.
/home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/build/2772869:
No such file or directory.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
PROCESS: 2773014
gitlab-+ 2773014 2771497  0 Mar23 ?        00:00:02 ./qemu-system-i386
-qtest unix:/tmp/qtest-2771497.sock -qtest-log /dev/null -chardev
socket,path=3D/tmp/qtest-2771497.qmp,id=3Dchar0 -mon
chardev=3Dchar0,mode=3Dcontrol -display none -accel kvm -accel tcg -name
target,debug-threads=3Don -m 150M -serial
file:/tmp/migration-test-f6G71L/dest_serial -incoming defer -drive
file=3D/tmp/migration-test-f6G71L/bootsect,format=3Draw -accel qtest
[New LWP 2773017]
[New LWP 2773018]
[New LWP 2773019]
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/s390x-linux-gnu/libthread_db.so.1".
0x000003ffa4671c9c in __ppoll (fds=3D0x2aa0333c020, nfds=3D6,
timeout=3D<optimized out>, timeout@entry=3D0x3ffedefb228,
sigmask=3Dsigmask@entry=3D0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
44      ../sysdeps/unix/sysv/linux/ppoll.c: No such file or directory.

Thread 4 (Thread 0x3ff4ffff900 (LWP 2773019)):
#0  futex_wait_cancelable (private=3D0, expected=3D0,
futex_word=3D0x2aa0333af7c) at ../sysdeps/nptl/futex-internal.h:183
#1  __pthread_cond_wait_common (abstime=3D0x0, clockid=3D0,
mutex=3D0x2aa01f26f10 <qemu_global_mutex>, cond=3D0x2aa0333af50) at
pthread_cond_wait.c:508
#2  __pthread_cond_wait (cond=3Dcond@entry=3D0x2aa0333af50,
mutex=3Dmutex@entry=3D0x2aa01f26f10 <qemu_global_mutex>) at
pthread_cond_wait.c:638
#3  0x000002aa015b0e56 in qemu_cond_wait_impl (cond=3D0x2aa0333af50,
mutex=3D0x2aa01f26f10 <qemu_global_mutex>, file=3D0x2aa0162e3fc
"../softmmu/cpus.c", line=3D<optimized out>) at
../util/qemu-thread-posix.c:195
#4  0x000002aa00ff4436 in qemu_wait_io_event
(cpu=3Dcpu@entry=3D0x2aa0331b0a0) at ../softmmu/cpus.c:424
#5  0x000002aa013852e0 in mttcg_cpu_thread_fn
(arg=3Darg@entry=3D0x2aa0331b0a0) at
../accel/tcg/tcg-accel-ops-mttcg.c:124
#6  0x000002aa015b05c2 in qemu_thread_start (args=3D<optimized out>) at
../util/qemu-thread-posix.c:556
#7  0x000003ffa4787e66 in start_thread (arg=3D0x3ff4ffff900) at
pthread_create.c:477
#8  0x000003ffa467cbf6 in thread_start () at
../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Thread 3 (Thread 0x3ff54da1900 (LWP 2773018)):
#0  0x000003ffa4671b42 in __GI___poll (fds=3D0x3ff48003250, nfds=3D3,
timeout=3D<optimized out>) at ../sysdeps/unix/sysv/linux/poll.c:29
#1  0x000003ffa6d54386 in  () at /lib/s390x-linux-gnu/libglib-2.0.so.0
#2  0x000003ffa6d54790 in g_main_loop_run () at
/lib/s390x-linux-gnu/libglib-2.0.so.0
#3  0x000002aa013bfa4e in iothread_run
(opaque=3Dopaque@entry=3D0x2aa03042000) at ../iothread.c:73
#4  0x000002aa015b05c2 in qemu_thread_start (args=3D<optimized out>) at
../util/qemu-thread-posix.c:556
#5  0x000003ffa4787e66 in start_thread (arg=3D0x3ff54da1900) at
pthread_create.c:477
#6  0x000003ffa467cbf6 in thread_start () at
../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Thread 2 (Thread 0x3ff95724900 (LWP 2773017)):
#0  syscall () at ../sysdeps/unix/sysv/linux/s390/s390-64/syscall.S:37
#1  0x000002aa015b15cc in qemu_futex_wait (val=3D<optimized out>,
f=3D<optimized out>) at
/home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/include/qemu/futex.=
h:29
#2  qemu_event_wait (ev=3Dev@entry=3D0x2aa01f57e60 <rcu_call_ready_event>)
at ../util/qemu-thread-posix.c:481
#3  0x000002aa015b9e42 in call_rcu_thread (opaque=3Dopaque@entry=3D0x0) at
../util/rcu.c:261
#4  0x000002aa015b05c2 in qemu_thread_start (args=3D<optimized out>) at
../util/qemu-thread-posix.c:556
#5  0x000003ffa4787e66 in start_thread (arg=3D0x3ff95724900) at
pthread_create.c:477
#6  0x000003ffa467cbf6 in thread_start () at
../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Thread 1 (Thread 0x3ffa7b7e440 (LWP 2773014)):
#0  0x000003ffa4671c9c in __ppoll (fds=3D0x2aa0333c020, nfds=3D6,
timeout=3D<optimized out>, timeout@entry=3D0x3ffedefb228,
sigmask=3Dsigmask@entry=3D0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
#1  0x000002aa015d154a in ppoll (__ss=3D0x0, __timeout=3D0x3ffedefb228,
__nfds=3D<optimized out>, __fds=3D<optimized out>) at
/usr/include/s390x-linux-gnu/bits/poll2.h:77
#2  qemu_poll_ns (fds=3D<optimized out>, nfds=3D<optimized out>,
timeout=3Dtimeout@entry=3D1000000000) at ../util/qemu-timer.c:348
#3  0x000002aa015cd768 in os_host_main_loop_wait (timeout=3D1000000000)
at ../util/main-loop.c:250
#4  main_loop_wait (nonblocking=3Dnonblocking@entry=3D0) at ../util/main-lo=
op.c:531
#5  0x000002aa00ffaa94 in qemu_main_loop () at ../softmmu/runstate.c:727
#6  0x000002aa00fae7a0 in main (argc=3D<optimized out>, argv=3D<optimized
out>, envp=3D<optimized out>) at ../softmmu/main.c:50
[Inferior 1 (process 2773014) detached]


-- PMM




--=20
123456789012345678901234567890123456789012345678901234567890123456789012345=
67890
         1         2         3         4         5         6         7     =
    8

