Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB1D490725
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 12:28:11 +0100 (CET)
Received: from localhost ([::1]:38904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9QBG-000561-2R
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 06:28:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n9Q7k-0003Uw-5P
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 06:24:32 -0500
Received: from [2a00:1450:4864:20::32d] (port=39644
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n9Q7g-0005m1-L7
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 06:24:30 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 d18-20020a05600c251200b0034974323cfaso23549026wma.4
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 03:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=nk/JgNKJk8trqnxpTJZPkCUuFezDbks5W05fEf8j+ck=;
 b=rDNNh3fFLECl5HWkexMjXCoNdsr1Y6uMzQlpEFoL7k9iucTvPeDK1Z5NvPD06q0ZdZ
 BTmo07nUWQ3HZr2N00yADdqd/AP/ugdRhoYj4+gD/BnhKSB+kYQTmdRsuwev/TF20NEL
 /AamK8t7GGCC8pWM6MH6q4DfVGLOpoEq221JzwGQ33AOKiB2EkTIBqeIi1i0AoSXx5/+
 O+Tmrq9vyn5De+hXmrBpFFndNfbTc7I801noyBZc3vNWt/rOXY8xbKf/Gj2xnUr0Md04
 MKTEZM82bkyWouLpEQN+21lIG2BmAsyF+AsbEvkYJsnHLDECy7rG+fw/8VI9bA54hhon
 buVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=nk/JgNKJk8trqnxpTJZPkCUuFezDbks5W05fEf8j+ck=;
 b=l0pARqTSPMhGgHWZmj/GXRGk1oj+l1mq69qvwRSTSGUHb0dBPGEfK2biBMVtBeUrmT
 Rrh5L6tN61OBZoMXr0UGAOsWr2+sUS7BC3YlrDbSzUoWaOJ1/AJIvoISU1R8z4X4ADdm
 sWlsqlZExVdLYbWJI8uA0ZYxnXEx1Vk5aPiOoRGAvwrTbrjiwWYL0WSt2/zSRjJQ4liz
 yImbR1M1SRonyEoui/PhV5W2PHDOHAmV4c08hqea3prXucpp/wosjr9y6uB6I9+E4zSk
 wVGF6Jy3nR5D17zcwFk+UWPyOFM6zS5wzKkcpk++UMNldJQjRiRP8HTrpoTKPjZU4J0O
 QeWw==
X-Gm-Message-State: AOAM532kiaxJpaan7sjm93vr0XKB1mvsW1XOMhzwar3KyjhFLAtExaB3
 A/CPrpP6L0G0kUXXKQlDKDsjfw==
X-Google-Smtp-Source: ABdhPJz7xMqFiLaofzWrPcA7Iy6I1k2wvH/j3lCauyRB5IB4Q9qcfpBkhZuXa+2RhwHCNMcq+zsQ4g==
X-Received: by 2002:a05:600c:20d:: with SMTP id
 13mr8349748wmi.51.1642418666901; 
 Mon, 17 Jan 2022 03:24:26 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z15sm13238895wrm.25.2022.01.17.03.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 03:24:25 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F01611FFB7;
 Mon, 17 Jan 2022 11:24:24 +0000 (GMT)
References: <CAFEAcA_dGRnM-2u3Lvq-ETP87oz3jEvWRf=vknbur3UxN9APJg@mail.gmail.com>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: intermittent hang, migration-test, 32-bit arm
Date: Mon, 17 Jan 2022 11:23:00 +0000
In-reply-to: <CAFEAcA_dGRnM-2u3Lvq-ETP87oz3jEvWRf=vknbur3UxN9APJg@mail.gmail.com>
Message-ID: <87sftma9lj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> Hi; I see intermittent hangs in the qtest migration-test on my
> 32-bit arm setup (which is a chroot on a 64-bit arm box). Here's
> a backtrace:
>
> Process tree:
> migration-test(13212)-+-qemu-system-aar(24798)
>                       |-qemu-system-aar(24813)
>                       `-qemu-system-aar(25455)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

I think I've seen it hang with qemu-system-aarch64 (on my x86-64 dev
setup). Or at least I had to kill a qtest which had been going for over
2000s when the normal run in ~65s. I'll try and capture a backtrace next
time.


> PROCESS: 13212
> pmaydell 13212 11608 31 Jan16 ?        04:29:22
> /home/peter.maydell/qemu/build/all-a32/tests/qtest/migration-test
> --tap -k
> [New LWP 13213]
> [Thread debugging using libthread_db enabled]
> Using host libthread_db library "/lib/arm-linux-gnueabihf/libthread_db.so=
.1".
> __libc_do_syscall () at ../sysdeps/unix/sysv/linux/arm/libc-do-syscall.S:=
47
> 47      ../sysdeps/unix/sysv/linux/arm/libc-do-syscall.S: No such file
> or directory.
>
> Thread 2 (Thread 0xf7c3f440 (LWP 13213)):
> #0  syscall () at ../sysdeps/unix/sysv/linux/arm/syscall.S:37
> #1  0x005757fa in qemu_futex_wait (val=3D<optimised out>, f=3D<optimised
> out>) at /home/peter.maydell/qemu/include/qemu/futex.h:29
> #2  qemu_event_wait (ev=3Dev@entry=3D0x5a2a58 <rcu_call_ready_event>) at
> ../../util/qemu-thread-posix.c:481
> #3  0x0057dd62 in call_rcu_thread (opaque=3D<optimised out>) at
> ../../util/rcu.c:261
> #4  0x00574cea in qemu_thread_start (args=3D<optimised out>) at
> ../../util/qemu-thread-posix.c:556
> #5  0xf7d9a614 in start_thread (arg=3D0x21eebe87) at pthread_create.c:463
> #6  0xf7d357ec in ?? () at ../sysdeps/unix/sysv/linux/arm/clone.S:73
> from /lib/arm-linux-gnueabihf/libc.so.6
> Backtrace stopped: previous frame identical to this frame (corrupt stack?)
>
> Thread 1 (Thread 0xf7f31010 (LWP 13212)):
> #0  __libc_do_syscall () at ../sysdeps/unix/sysv/linux/arm/libc-do-syscal=
l.S:47
> #1  0xf7da1d8c in __libc_read (fd=3Dfd@entry=3D4,
> buf=3Dbuf@entry=3D0xfff0da2f, nbytes=3Dnbytes@entry=3D1) at
> ../sysdeps/unix/sysv/linux/read.c:27
> #2  0x0055d3fc in read (__nbytes=3D1, __buf=3D0xfff0da2f, __fd=3D4) at
> /usr/include/arm-linux-gnueabihf/bits/unistd.h:44
> #3  qmp_fd_receive (fd=3D4) at ../../tests/qtest/libqtest.c:613
> #4  0x0055d474 in qtest_qmp_receive_dict (s=3D0xefa798) at
> ../../tests/qtest/libqtest.c:648
> #5  qtest_qmp_receive (s=3Ds@entry=3D0xefa798) at ../../tests/qtest/libqt=
est.c:636
> #6  0x0055da5c in qtest_vqmp (s=3Ds@entry=3D0xefa798,
> fmt=3Dfmt@entry=3D0x28b77700 <error: Cannot access memory at address
> 0x28b77700>, ap=3D..., ap@entry=3D...) at ../../tests/qtest/libqtest.c:749
> #7  0x0055c420 in wait_command (who=3D0xefa798, command=3D0x5828dc "{
> 'execute': 'query-migrate' }") at
> ../../tests/qtest/migration-helpers.c:63
> #8  0x0055c4ea in migrate_query (who=3D<optimised out>) at
> ../../tests/qtest/migration-helpers.c:107
> #9  migrate_query_status (who=3D<optimised out>) at
> ../../tests/qtest/migration-helpers.c:116
> #10 0x0055c656 in check_migration_status (ungoals=3D0x0, goal=3D0x582208
> "cancelled", who=3D0xefa798) at
> ../../tests/qtest/migration-helpers.c:132
> #11 wait_for_migration_status (who=3D0xefa798, goal=3D0x582208
> "cancelled", ungoals=3D0x0) at ../../tests/qtest/migration-helpers.c:156
> #12 0x0055bb4e in test_multifd_tcp_cancel () at
> ../../tests/qtest/migration-test.c:1376
> #13 0xf7e8ee74 in ?? () from /usr/lib/arm-linux-gnueabihf/libglib-2.0.so.0
> Backtrace stopped: previous frame identical to this frame (corrupt stack?)
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> PROCESS: 24798
> pmaydell 24798 13212 99 Jan16 ?        18:03:09 ./qemu-system-aarch64
> -qtest unix:/tmp/qtest-13212.sock -qtest-log /dev/null -chardev
> socket,path=3D/tmp/qtest-13212.qmp,id=3Dchar0 -mon
> chardev=3Dchar0,mode=3Dcontrol -display none -accel kvm -accel tcg
> -machine virt,gic-version=3Dmax -name source,debug-threads=3Don -m 150M
> -serial file:/tmp/migration-test-weBz3n/src_serial -cpu max -kernel
> /tmp/migration-test-weBz3n/bootsect -accel qtest
> [New LWP 24808]
> [New LWP 24809]
> [New LWP 24810]
> [New LWP 25267]
> [Thread debugging using libthread_db enabled]
> Using host libthread_db library "/lib/arm-linux-gnueabihf/libthread_db.so=
.1".
> __libc_do_syscall () at ../sysdeps/unix/sysv/linux/arm/libc-do-syscall.S:=
46
> 46      ../sysdeps/unix/sysv/linux/arm/libc-do-syscall.S: No such file
> or directory.
>
> Thread 5 (Thread 0xd27f5b70 (LWP 25267)):
> #0  0xf6d48f04 in __libc_do_syscall () at
> ../sysdeps/unix/sysv/linux/arm/libc-do-syscall.S:46
> #1  0xf6d46194 in futex_abstimed_wait_cancelable (private=3D0,
> abstime=3D0x0, expected=3D1, futex_word=3D0x3fd1458) at
> ../sysdeps/unix/sysv/linux/futex-internal.h:205
> #2  0xf6d46194 in do_futex_wait (sem=3Dsem@entry=3D0x3fd1458, abstime=3D0=
x0)
> at sem_waitcommon.c:115
> #3  0xf6d46274 in __new_sem_wait_slow (sem=3Dsem@entry=3D0x3fd1458,
> abstime=3D0x0) at sem_waitcommon.c:282
> #4  0xf6d462de in __new_sem_wait (sem=3Dsem@entry=3D0x3fd1458) at sem_wai=
t.c:42
> #5  0x011bc95a in qemu_sem_wait (sem=3Dsem@entry=3D0x3fd1458) at
> ../../util/qemu-thread-posix.c:358
> #6  0x00bed020 in multifd_send_sync_main (f=3D0x35aa7c8) at
> ../../migration/multifd.c:624
> #7  0x00fa4b66 in ram_save_iterate (f=3D0x35aa7c8, opaque=3D<optimised
> out>) at ../../migration/ram.c:3133
> #8  0x00bf2df6 in qemu_savevm_state_iterate (f=3D0x35aa7c8,
> postcopy=3Dpostcopy@entry=3Dfalse) at ../../migration/savevm.c:1296
> #9  0x00bea7ac in migration_iteration_run (s=3D0x34012f0) at
> ../../migration/migration.c:3597
> #10 0x00bea7ac in migration_thread (opaque=3D0x34012f0) at
> ../../migration/migration.c:3838
> #11 0x011bbfd2 in qemu_thread_start (args=3D<optimised out>) at
> ../../util/qemu-thread-posix.c:556
> #12 0xf6d3f614 in start_thread (arg=3D0xb604dd4d) at pthread_create.c:463
> #13 0xf6cda7ec in  () at ../sysdeps/unix/sysv/linux/arm/clone.S:73
>
> Thread 4 (Thread 0xdbffdb70 (LWP 24810)):
> #0  0x00e4e58c in helper_access_check_cp_reg (env=3D0x36b8950,
> rip=3D0x36f8630, syndrome=3D1645403292, isread=3D0) at
> ../../target/arm/op_helper.c:632
> #1  0xee500cf4 in code_gen_buffer ()
> #2  0x01038706 in cpu_tb_exec (tb_exit=3D<synthetic pointer>,
> itb=3D<optimised out>, cpu=3D0xee500bc0 <code_gen_buffer+2980>) at
> ../../accel/tcg/cpu-exec.c:357
> #3  0x01038706 in cpu_loop_exec_tb (tb_exit=3D<synthetic pointer>,
> last_tb=3D<synthetic pointer>, tb=3D<optimised out>, cpu=3D0xee500bc0
> <code_gen_buffer+2980>) at ../../accel/tcg/cpu-exec.c:842
> #4  0x01038706 in cpu_exec (cpu=3Dcpu@entry=3D0x36b2c60) at
> ../../accel/tcg/cpu-exec.c:1001
> #5  0x0104f5d2 in tcg_cpus_exec (cpu=3Dcpu@entry=3D0x36b2c60) at
> ../../accel/tcg/tcg-accel-ops.c:67
> #6  0x0104fd02 in rr_cpu_thread_fn (arg=3D<optimised out>) at
> ../../accel/tcg/tcg-accel-ops-rr.c:223
> #7  0x011bbfd2 in qemu_thread_start (args=3D<optimised out>) at
> ../../util/qemu-thread-posix.c:556
> #8  0xf6d3f614 in start_thread (arg=3D0xb604dd4d) at pthread_create.c:463
> #9  0xf6cda7ec in  () at ../sysdeps/unix/sysv/linux/arm/clone.S:73
>
> Thread 3 (Thread 0xee4fdb70 (LWP 24809)):
> #0  0xf74acea6 in  () at /usr/lib/arm-linux-gnueabihf/libglib-2.0.so.0
> #1  0xf74c3818 in g_slice_alloc () at
> /usr/lib/arm-linux-gnueabihf/libglib-2.0.so.0
> #2  0x00000000 in  ()
>
> Thread 2 (Thread 0xf0f99b70 (LWP 24808)):
> #0  0xf6cd7f30 in syscall () at ../sysdeps/unix/sysv/linux/arm/syscall.S:=
37
> #1  0x011bcae2 in qemu_futex_wait (val=3D<optimised out>, f=3D<optimised
> out>) at /home/peter.maydell/qemu/include/qemu/futex.h:29
> #2  0x011bcae2 in qemu_event_wait (ev=3Dev@entry=3D0x194619c
> <rcu_gp_event>) at ../../util/qemu-thread-posix.c:481
> #3  0x011c2386 in wait_for_readers () at ../../util/rcu.c:138
> #4  0x011c256a in synchronize_rcu () at ../../util/rcu.c:167
> #5  0x011c2888 in call_rcu_thread (opaque=3D<optimised out>) at
> ../../util/rcu.c:268
> #6  0x011bbfd2 in qemu_thread_start (args=3D<optimised out>) at
> ../../util/qemu-thread-posix.c:556
> #7  0xf6d3f614 in start_thread (arg=3D0xb604dd4d) at pthread_create.c:463
> #8  0xf6cda7ec in  () at ../sysdeps/unix/sysv/linux/arm/clone.S:73
>
> Thread 1 (Thread 0xf1091010 (LWP 24798)):
> #0  0xf6c59204 in __libc_do_syscall () at
> ../sysdeps/unix/sysv/linux/arm/libc-do-syscall.S:46
> #1  0xf6cd3a04 in __GI_ppoll (fds=3Dfds@entry=3D0x3fe1cb0,
> nfds=3Dnfds@entry=3D5, timeout=3D<optimised out>, timeout@entry=3D0xffe93=
c84,
> sigmask=3Dsigmask@entry=3D0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:39
> #2  0x011d20d2 in ppoll (__ss=3D0x0, __timeout=3D0xffe93c84, __nfds=3D5,
> __fds=3D0x3fe1cb0) at /usr/include/arm-linux-gnueabihf/bits/poll2.h:77
> #3  0x011d20d2 in qemu_poll_ns (fds=3D0x3fe1cb0, nfds=3D5,
> timeout=3D<optimised out>) at ../../util/qemu-timer.c:348
> #4  0x011cf8c2 in os_host_main_loop_wait (timeout=3D1000000000) at
> ../../util/main-loop.c:250
> #5  0x011cf8c2 in main_loop_wait (nonblocking=3Dnonblocking@entry=3D0) at
> ../../util/main-loop.c:531
> #6  0x00f8910e in qemu_main_loop () at ../../softmmu/runstate.c:726
> #7  0x00b96f56 in main (argc=3D<optimised out>, argv=3D<optimised out>,
> envp=3D<optimised out>) at ../../softmmu/main.c:50
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> PROCESS: 24813
> pmaydell 24813 13212  0 Jan16 ?        00:00:00 [qemu-system-aar] <defunc=
t>
> /proc/24813/exe: No such file or directory.
> Could not attach to process.  If your uid matches the uid of the target
> process, check the setting of /proc/sys/kernel/yama/ptrace_scope, or try
> again as the root user.  For more details, see /etc/sysctl.d/10-ptrace.co=
nf
> warning: process 24813 is a zombie - the process has already terminated
> ptrace: Operation not permitted.
> /home/peter.maydell/24813: No such file or directory.
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> PROCESS: 25455
> pmaydell 25455 13212  0 Jan16 ?        00:00:01 ./qemu-system-aarch64
> -qtest unix:/tmp/qtest-13212.sock -qtest-log /dev/null -chardev
> socket,path=3D/tmp/qtest-13212.qmp,id=3Dchar0 -mon
> chardev=3Dchar0,mode=3Dcontrol -display none -accel kvm -accel tcg
> -machine virt,gic-version=3Dmax -name target,debug-threads=3Don -m 150M
> -serial file:/tmp/migration-test-weBz3n/dest_serial -incoming defer
> -cpu max -kernel /tmp/migration-test-weBz3n/bootsect -accel qtest
> [New LWP 25458]
> [New LWP 25461]
> [New LWP 25464]
> [Thread debugging using libthread_db enabled]
> Using host libthread_db library "/lib/arm-linux-gnueabihf/libthread_db.so=
.1".
> __libc_do_syscall () at ../sysdeps/unix/sysv/linux/arm/libc-do-syscall.S:=
46
> 46      ../sysdeps/unix/sysv/linux/arm/libc-do-syscall.S: No such file
> or directory.
>
> Thread 4 (Thread 0xdc1fdb70 (LWP 25464)):
> #0  0xf6f43f04 in __libc_do_syscall () at
> ../sysdeps/unix/sysv/linux/arm/libc-do-syscall.S:46
> #1  0xf6f3f072 in futex_wait_cancelable (private=3D<optimised out>,
> expected=3D0, futex_word=3D0x3b405a4) at
> ../sysdeps/unix/sysv/linux/futex-internal.h:88
> #2  0xf6f3f072 in __pthread_cond_wait_common (abstime=3D0x0,
> mutex=3D0x18bbcc0 <qemu_global_mutex>, cond=3D0x3b40578) at
> pthread_cond_wait.c:502
> #3  0xf6f3f072 in __pthread_cond_wait (cond=3Dcond@entry=3D0x3b40578,
> mutex=3Dmutex@entry=3D0x18bbcc0 <qemu_global_mutex>) at
> pthread_cond_wait.c:655
> #4  0x0114753c in qemu_cond_wait_impl (cond=3D0x3b40578, mutex=3D0x18bbcc0
> <qemu_global_mutex>, file=3D0x12a93a8 "../../softmmu/cpus.c", line=3D510)
> at ../../util/qemu-thread-posix.c:195
> #5  0x00fdac14 in rr_cpu_thread_fn (arg=3D<optimised out>) at
> ../../accel/tcg/tcg-accel-ops-rr.c:171
> #6  0x01146fd2 in qemu_thread_start (args=3D<optimised out>) at
> ../../util/qemu-thread-posix.c:556
> #7  0xf6f3a614 in start_thread (arg=3D0x71e7baef) at pthread_create.c:463
> #8  0xf6ed57ec in  () at ../sysdeps/unix/sysv/linux/arm/clone.S:73
>
> Thread 3 (Thread 0xee6fdb70 (LWP 25461)):
> #0  0xf6e54204 in __libc_do_syscall () at
> ../sysdeps/unix/sysv/linux/arm/libc-do-syscall.S:46
> #1  0xf6ece948 in __GI___poll (fds=3D0x39eff18, nfds=3D3, timeout=3D-1) at
> ../sysdeps/unix/sysv/linux/poll.c:29
> #2  0xf76aa92e in  () at /usr/lib/arm-linux-gnueabihf/libglib-2.0.so.0
>
> Thread 2 (Thread 0xf1194b70 (LWP 25458)):
> #0  0xf6ed2f30 in syscall () at ../sysdeps/unix/sysv/linux/arm/syscall.S:=
37
> #1  0x01147ae2 in qemu_futex_wait (val=3D<optimised out>, f=3D<optimised
> out>) at /home/peter.maydell/qemu/include/qemu/futex.h:29
> #2  0x01147ae2 in qemu_event_wait (ev=3Dev@entry=3D0x18d11f0
> <rcu_call_ready_event>) at ../../util/qemu-thread-posix.c:481
> #3  0x0114d85a in call_rcu_thread (opaque=3D<optimised out>) at
> ../../util/rcu.c:261
> #4  0x01146fd2 in qemu_thread_start (args=3D<optimised out>) at
> ../../util/qemu-thread-posix.c:556
> #5  0xf6f3a614 in start_thread (arg=3D0x71e7baef) at pthread_create.c:463
> #6  0xf6ed57ec in  () at ../sysdeps/unix/sysv/linux/arm/clone.S:73
>
> Thread 1 (Thread 0xf128c010 (LWP 25455)):
> #0  0xf6e54204 in __libc_do_syscall () at
> ../sysdeps/unix/sysv/linux/arm/libc-do-syscall.S:46
> #1  0xf6ecea04 in __GI_ppoll (fds=3Dfds@entry=3D0x441dc68,
> nfds=3Dnfds@entry=3D6, timeout=3D<optimised out>, timeout@entry=3D0xffe9c=
0d4,
> sigmask=3Dsigmask@entry=3D0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:39
> #2  0x0115d0d2 in ppoll (__ss=3D0x0, __timeout=3D0xffe9c0d4, __nfds=3D6,
> __fds=3D0x441dc68) at /usr/include/arm-linux-gnueabihf/bits/poll2.h:77
> #3  0x0115d0d2 in qemu_poll_ns (fds=3D0x441dc68, nfds=3D6,
> timeout=3D<optimised out>) at ../../util/qemu-timer.c:348
> #4  0x0115a8c2 in os_host_main_loop_wait (timeout=3D1000000000) at
> ../../util/main-loop.c:250
> #5  0x0115a8c2 in main_loop_wait (nonblocking=3Dnonblocking@entry=3D0) at
> ../../util/main-loop.c:531
> #6  0x00f1410e in qemu_main_loop () at ../../softmmu/runstate.c:726
> #7  0x00b21f56 in main (argc=3D<optimised out>, argv=3D<optimised out>,
> envp=3D<optimised out>) at ../../softmmu/main.c:50
>
>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

