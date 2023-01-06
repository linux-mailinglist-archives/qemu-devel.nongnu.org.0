Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F8966000F
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 13:12:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDlYr-0004Ac-5d; Fri, 06 Jan 2023 07:11:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDlYh-00044t-Fw
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 07:10:52 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDlYf-0007cB-0f
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 07:10:51 -0500
Received: by mail-pl1-x62c.google.com with SMTP id c6so1488661pls.4
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 04:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=f+2ho1Bv+3GYeu0Rq+lL9NhNimkdZkCGFhyPO373pAs=;
 b=lzwdj6bDrPtpjouEUCAKyan1VPFwK9T4CoEpLk+SYsTI47IZhJz5dKOsZgjKwuBcwJ
 3y3IlwZm9cU12X7QLJUGGi+dXqo96bthqG69h4grdx8cpcuRFqB281nlO3kPEbqp562P
 gDNaTQXb/bv7oo70pNnCvUKe0JtxjfKCD40DgLJ1zf7mPVL86fH0MtHsywGWIa23pYVn
 WSuCNqwh5iCtelV6nLSGlT9RX3IavNVoO1RiGqEpk7zgs+0m49+tbZmwC7yYpoVp+8hK
 10cxv4ifjBo7nlad6B+zJuIlchXpaK9PNfSiOzg25b1JoPDCWf/tRvgoNH8MkX+Y4wyq
 fSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f+2ho1Bv+3GYeu0Rq+lL9NhNimkdZkCGFhyPO373pAs=;
 b=6fOUQFrbwvECWF4ie38aqb6M2o2VtxEdC0TPb8vSCWdbzkxpfUeHiPhjkPI1yXD9Q9
 eFsgUxj5Ep1emICrefeyqyxYL4ycTGNS2j7opT1XEvz8svwnvcEFizsXUYIqYgos0LgR
 ketyKARM4klXQAxyvo+xJgcqcaGmHO0TMrx5ghHLMsh5PzDK3+Qr68DwwFHv2LnkfRRI
 ORVkCej6UOBEnLQnSUG9++5D76kh7gaaX3wP9YJKIKhgHFT2p8Tkh+WS7U6fbYuGK2ou
 j38kkbSdHyNAVxnZ68GnGJOCnDbpW5z4B9P/v2io2NTrvtuMsFv9oUFHEDi/F4Jlw6hp
 k4NA==
X-Gm-Message-State: AFqh2kpmqraIGaIAPA02NWrIjiEUh+mCOne0iumhmIAMIoI73fcbaQtH
 x8M4wJluKu2Mfe+jfpqMfafy3rgDA197CN8zq04cEjnyN4oS5LJG
X-Google-Smtp-Source: AMrXdXv5ANbEUFh2yENg26J22QQzV+cVZWRBrSEH6yv+cBJOseh9aYawhgleKi1Wh9IAgUpe6MRVyEWixTvSYtQSf3s=
X-Received: by 2002:a17:903:2653:b0:189:cdc8:7261 with SMTP id
 je19-20020a170903265300b00189cdc87261mr3700224plb.168.1673007045639; Fri, 06
 Jan 2023 04:10:45 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Jan 2023 12:10:34 +0000
Message-ID: <CAFEAcA-f39VfWEwb-zRabjVoO-XQ-0V=iCFu1PVjg7eYChszbA@mail.gmail.com>
Subject: intermittent hang, s390x host, bios-tables-test test, TPM
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62c.google.com
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

I'm seeing an intermittent hang on the s390 CI runner in the
bios-tables-test test. It looks like we've deadlocked because:

 * the TPM device is waiting for data on its socket that never arrives,
   and it's holding the iothread lock
 * QEMU is therefore not making forward progress;
   in particular it is unable to handle qtest queries/responses
 * the test binary thread 1 is waiting to get a response to its
   qtest command, which is not going to arrive
 * test binary thread 3 (tpm_emu_ctrl_thread) is has hit an
   assertion and is trying to kill QEMU via qtest_kill_qemu()
 * qtest_kill_qemu() is only a "SIGTERM and wait", so will wait
   forever, because QEMU won't respond to the SIGTERM while it's
   blocked waiting for the TPM device to release the iothread lock
 * because the ctrl-thread is waiting for QEMU to exit, it's never
   going to send the data that would unblock the TPM device emulation

A secondary problem revealed by this is that gitlab CI runner
jobs can be cancelled or time out in the gitlab CI, whilst leaving
processes lying around (and consuming CPU in the case of livelocks)
on the CI host. This means that future CI jobs then time out because
the host's CPU is all being wasted by these stuck old jobs. Why does
this happen and how can we configure the CI runner so timed out
jobs reliably clean themselves up ?


Process tree:
gitlab-+ 2659701  0.0  0.0 233272  5952 ?        Ssl  Jan05   0:02
/home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/build/tests/qtest/bios-tables-test
--tap -k
gitlab-+ 2661317  0.0  0.3 1783272 61500 ?       Sl   Jan05   0:00  \_
./qemu-system-x86_64 -qtest unix:/tmp/qtest-2659701.sock -qtest-log
/dev/null -chardev socket,path=/tmp/qtest-2659701.qmp,id=char0 -mon
chardev=char0,mode=control -display none -machine q35 -accel kvm
-accel tcg -net none -chardev
socket,id=chr,path=/tmp/qemu-test_acpi_q35_tcg_tis.Y88AY1/sock -tpmdev
emulator,id=dev,chardev=chr -device tpm-tis,tpmdev=dev -drive
id=hd0,if=none,file=tests/acpi-test-disk-bjuUil,format=raw -device
ide-hd,drive=hd0 -accel qtest

Here's the backtrace of the qemu-system-x86_64 process:


Thread 4 (Thread 0x3ff2bfff900 (LWP 2661322)):
#0  __libc_recvmsg (fd=<optimized out>, msg=msg@entry=0x3ff2bff9e48,
flags=flags@entry=1073741824) at
../sysdeps/unix/sysv/linux/recvmsg.c:30
#1  0x000002aa124aab4e in qio_channel_socket_readv (ioc=<optimized
out>, iov=<optimized out>, niov=<optimized out>, fds=0x3ff2bffa030,
nfds=0x3ff2bffa038, errp=0x0) at ../io/channel-socket.c:521
#2  0x000002aa124afca4 in qio_channel_readv_full (ioc=0x2aa142f5280,
iov=iov@entry=0x3ff2bffa040, niov=niov@entry=1,
fds=fds@entry=0x3ff2bffa030, nfds=nfds@entry=0x3ff2bffa038, errp=0x0)
at ../io/channel.c:66
#3  0x000002aa12579098 in tcp_chr_recv (chr=chr@entry=0x2aa141aaa60,
buf=buf@entry=0x3ff2bffa308 "", len=len@entry=4) at
../chardev/char-socket.c:284
#4  0x000002aa1257b75a in tcp_chr_sync_read (chr=0x2aa141aaa60,
buf=0x3ff2bffa308 "", len=<optimized out>) at
../chardev/char-socket.c:535
#5  0x000002aa12575aa0 in qemu_chr_fe_read_all
(be=be@entry=0x2aa1423df00, buf=buf@entry=0x3ff2bffa308 "",
len=len@entry=4) at
/home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/include/chardev/char.h:231
#6  0x000002aa12249872 in tpm_emulator_ctrlcmd (tpm=0x2aa1423dea0,
cmd=cmd@entry=9, msg=msg@entry=0x3ff2bffa308,
msg_len_in=msg_len_in@entry=0, msg_len_out=msg_len_out@entry=4) at
../backends/tpm/tpm_emulator.c:145
#7  0x000002aa1224a2ca in tpm_emulator_cancel_cmd (tb=<optimized out>)
at ../backends/tpm/tpm_emulator.c:500
#8  0x000002aa121e68c4 in tpm_tis_mmio_write (opaque=0x2aa1529ec20,
addr=24, val=64, size=<optimized out>) at
../hw/tpm/tpm_tis_common.c:663
#9  0x000002aa12402348 in memory_region_write_accessor
(mr=0x2aa1529ec20, addr=24, value=<optimized out>, size=<optimized
out>, shift=<optimized out>, mask=255, attrs=...) at
../softmmu/memory.c:493
#10 0x000002aa123fde26 in access_with_adjusted_size
(addr=addr@entry=24, value=value@entry=0x3ff2bffa678,
size=size@entry=1, access_size_min=<optimized out>,
access_size_max=<optimized out>, access_size_max@entry=0,
access_fn=0x2aa12402298 <memory_region_write_accessor>, mr=<optimized
out>, attrs=...) at ../softmmu/memory.c:555
Python Exception <class 'gdb.error'> PC not saved:

Thread 3 (Thread 0x3ff70aa0900 (LWP 2661321)):
#0  0x000003ff801f1b32 in __GI___poll (fds=0x3ff24003280, nfds=3,
timeout=<optimized out>) at ../sysdeps/unix/sysv/linux/poll.c:29
#1  0x000003ff829d4386 in  () at /lib/s390x-linux-gnu/libglib-2.0.so.0
#2  0x000003ff829d4790 in g_main_loop_run () at
/lib/s390x-linux-gnu/libglib-2.0.so.0
#3  0x000002aa124d29d6 in iothread_run
(opaque=opaque@entry=0x2aa1434d300) at ../iothread.c:74
#4  0x000002aa1261c36a in qemu_thread_start (args=<optimized out>) at
../util/qemu-thread-posix.c:505
#5  0x000003ff80307e66 in start_thread (arg=0x3ff70aa0900) at
pthread_create.c:477
#6  0x000003ff801fcbe6 in thread_start () at
../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Thread 2 (Thread 0x3ff71423900 (LWP 2661319)):
#0  syscall () at ../sysdeps/unix/sysv/linux/s390/s390-64/syscall.S:37
#1  0x000002aa1261d30c in qemu_futex_wait (val=<optimized out>,
f=<optimized out>) at
/home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/include/qemu/futex.h:29
#2  qemu_event_wait (ev=ev@entry=0x2aa12e87220 <rcu_call_ready_event>)
at ../util/qemu-thread-posix.c:430
#3  0x000002aa12625eea in call_rcu_thread (opaque=opaque@entry=0x0) at
../util/rcu.c:261
#4  0x000002aa1261c36a in qemu_thread_start (args=<optimized out>) at
../util/qemu-thread-posix.c:505
#5  0x000003ff80307e66 in start_thread (arg=0x3ff71423900) at
pthread_create.c:477
#6  0x000003ff801fcbe6 in thread_start () at
../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Thread 1 (Thread 0x3ff83b7e460 (LWP 2661317)):
#0  __lll_lock_wait (futex=futex@entry=0x2aa12e55a00
<qemu_global_mutex>, private=<optimized out>) at lowlevellock.c:52
#1  0x000003ff8030a6ce in __GI___pthread_mutex_lock
(mutex=mutex@entry=0x2aa12e55a00 <qemu_global_mutex>) at
../nptl/pthread_mutex_lock.c:80
#2  0x000002aa1261c6ce in qemu_mutex_lock_impl (mutex=0x2aa12e55a00
<qemu_global_mutex>, file=0x2aa12809064 "../util/main-loop.c",
line=<optimized out>) at ../util/qemu-thread-posix.c:89
#3  0x000002aa122317a4 in qemu_mutex_lock_iothread_impl
(file=file@entry=0x2aa12809064 "../util/main-loop.c",
line=line@entry=318) at ../softmmu/cpus.c:503
#4  0x000002aa1262eec2 in os_host_main_loop_wait (timeout=<optimized
out>) at ../util/main-loop.c:318
#5  main_loop_wait (nonblocking=nonblocking@entry=0) at ../util/main-loop.c:606
#6  0x000002aa12237b64 in qemu_main_loop () at ../softmmu/runstate.c:731
#7  0x000002aa1206d7ca in qemu_default_main () at ../softmmu/main.c:37
#8  0x000003ff8012440a in __libc_start_main (main=0x2aa1206aea8
<main>, argc=<optimized out>, argv=0x3fff997a7c8, init=<optimized
out>, fini=<optimized out>, rtld_fini=0x3ff83b90e50 <_dl_fini>,
stack_end=0x3fff997a710) at libc-start.c:308
#9  0x000002aa1206d6f4 in _start () at ../softmmu/main.c:48

And here's the test binary:

Thread 4 (Thread 0x3ff8d2fd900 (LWP 2661320)):
#0  __libc_recvmsg (fd=<optimized out>, msg=msg@entry=0x3ff8d2fc7f8,
flags=flags@entry=0) at ../sysdeps/unix/sysv/linux/recvmsg.c:30
#1  0x000002aa095479e6 in qio_channel_socket_readv (ioc=<optimized
out>, iov=<optimized out>, niov=<optimized out>, fds=0x0, nfds=0x0,
errp=0x2aa096105f0 <error_abort>) at ../io/channel-socket.c:521
#2  0x000002aa0954cb3c in qio_channel_readv_full (ioc=0x3ff80004680,
iov=0x3ff8d2fc9e0, niov=1, fds=0x0, nfds=0x0, errp=0x2aa096105f0
<error_abort>) at ../io/channel.c:66
#3  0x000002aa0954cd78 in qio_channel_read
(ioc=ioc@entry=0x3ff80004680, buf=<optimized out>,
buflen=buflen@entry=6, errp=<optimized out>) at ../io/channel.c:306
#4  0x000002aa095224e4 in tpm_emu_tpm_thread (data=0x3fff5ffa160) at
../tests/qtest/tpm-emu.c:48
#5  0x000003ff8f0ffb7c in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
#6  0x000003ff8eb07e66 in start_thread (arg=0x3ff8d2fd900) at
pthread_create.c:477
#7  0x000003ff8e9fcbe6 in thread_start () at
../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Thread 3 (Thread 0x3ff8dafe900 (LWP 2661316)):
#0  0x000003ff8e9c6002 in __GI___wait4 (pid=<optimized out>,
stat_loc=stat_loc@entry=0x2aa0b42c9bc, options=<optimized out>,
usage=usage@entry=0x0) at ../sysdeps/unix/sysv/linux/wait4.c:27
#1  0x000003ff8e9c5f72 in __GI___waitpid (pid=<optimized out>,
stat_loc=stat_loc@entry=0x2aa0b42c9bc, options=options@entry=0) at
waitpid.c:38
#2  0x000002aa0952a516 in qtest_wait_qemu (s=0x2aa0b42c9b0) at
../tests/qtest/libqtest.c:206
#3  0x000002aa0952a58a in qtest_kill_qemu (s=0x2aa0b42c9b0) at
../tests/qtest/libqtest.c:229
#4  0x000003ff8f0c288e in g_hook_list_invoke () from
/lib/s390x-linux-gnu/libglib-2.0.so.0
#5  <signal handler called>
#6  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
#7  0x000003ff8e9240a2 in __GI_abort () at abort.c:79
#8  0x000003ff8f0feda8 in g_assertion_message () from
/lib/s390x-linux-gnu/libglib-2.0.so.0
#9  0x000003ff8f0fedfe in g_assertion_message_expr () from
/lib/s390x-linux-gnu/libglib-2.0.so.0
#10 0x000002aa09522904 in tpm_emu_ctrl_thread (data=0x3fff5ffa160) at
../tests/qtest/tpm-emu.c:189
#11 0x000003ff8f0ffb7c in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
#12 0x000003ff8eb07e66 in start_thread (arg=0x3ff8dafe900) at
pthread_create.c:477
#13 0x000003ff8e9fcbe6 in thread_start () at
../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Thread 2 (Thread 0x3ff8e2ff900 (LWP 2659702)):
#0  syscall () at ../sysdeps/unix/sysv/linux/s390/s390-64/syscall.S:37
#1  0x000002aa0957d044 in qemu_futex_wait (val=<optimized out>,
f=<optimized out>) at
/home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/include/qemu/futex.h:29
#2  qemu_event_wait (ev=ev@entry=0x2aa09610890 <rcu_call_ready_event>)
at ../util/qemu-thread-posix.c:430
#3  0x000002aa0958541a in call_rcu_thread (opaque=opaque@entry=0x0) at
../util/rcu.c:261
#4  0x000002aa0957c0a2 in qemu_thread_start (args=<optimized out>) at
../util/qemu-thread-posix.c:505
#5  0x000003ff8eb07e66 in start_thread (arg=0x3ff8e2ff900) at
pthread_create.c:477
#6  0x000003ff8e9fcbe6 in thread_start () at
../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Thread 1 (Thread 0x3ff8f36db80 (LWP 2659701)):
#0  __libc_recv (fd=<optimized out>, buf=buf@entry=0x3fff5ff96c0,
len=len@entry=1024, flags=flags@entry=0) at
../sysdeps/unix/sysv/linux/recv.c:30
#1  0x000002aa0952998a in recv (__flags=0, __n=1024,
__buf=0x3fff5ff96c0, __fd=<optimized out>) at
/usr/include/s390x-linux-gnu/bits/socket2.h:44
#2  qtest_client_socket_recv_line (s=0x2aa0b42c9b0) at
../tests/qtest/libqtest.c:578
#3  0x000002aa09529b16 in qtest_rsp_args (s=s@entry=0x2aa0b42c9b0,
expected_args=expected_args@entry=2) at ../tests/qtest/libqtest.c:605
#4  0x000002aa0952a3e6 in qtest_read (s=0x2aa0b42c9b0, cmd=<optimized
out>, addr=<optimized out>) at ../tests/qtest/libqtest.c:1044
#5  0x000002aa0952bcac in qtest_readb (s=s@entry=0x2aa0b42c9b0,
addr=addr@entry=31761) at ../tests/qtest/libqtest.c:1054
#6  0x000002aa09521c72 in boot_sector_test (qts=0x2aa0b42c9b0) at
../tests/qtest/boot-sector.c:153
#7  0x000002aa0951e19e in test_acpi_load_tables (data=0x3fff5ffa1a8,
use_uefi=<optimized out>) at ../tests/qtest/bios-tables-test.c:757
#8  0x000002aa0951ea32 in test_acpi_one (params=<optimized out>,
data=0x3fff5ffa1a8) at ../tests/qtest/bios-tables-test.c:812
#9  0x000002aa0952197a in test_acpi_tcg_tpm (tpm_version=<optimized
out>, base=4275306496, tpm_if=0x2aa095b7a26 "tis",
machine=0x2aa095b5a18 "q35") at ../tests/qtest/bios-tables-test.c:1293
#10 0x000003ff8f0fe608 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
#11 0x000003ff8f0fe392 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
#12 0x000003ff8f0fe392 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
#13 0x000003ff8f0fe392 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
#14 0x000003ff8f0feada in g_test_run_suite () from
/lib/s390x-linux-gnu/libglib-2.0.so.0
#15 0x000003ff8f0feb10 in g_test_run () from
/lib/s390x-linux-gnu/libglib-2.0.so.0
#16 0x000002aa0951cea8 in main (argc=<optimized out>, argv=<optimized
out>) at ../tests/qtest/bios-tables-test.c:2067


thanks
-- PMM

