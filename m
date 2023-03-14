Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 702946B8F74
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 11:12:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc1dW-0006Fx-C1; Tue, 14 Mar 2023 06:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pc1dU-0006Fi-43
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 06:12:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pc1dR-00045G-AM
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 06:12:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678788719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yI8/3oobN3lQGgaP5LJzYeXqDjMMWWNIejNKLNDNJl0=;
 b=RCrh6NBRtiRE1T/0DgsrTgHOiZBsmyeGByY4iENjALH4PFZnbq7A9ecuE7ITZWlrVfCEUV
 U4tXq+X0GaIFz21tV6xIWyoBEeqemwqPSpSg/RbZGoy3jPHasWj0xZVWMhoYPKvpzuAz6s
 ziTrD08emRO/l3XKqlVQy1YNmoRBXU8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-212-aOcZgHn7MiCULBkedVPjDw-1; Tue, 14 Mar 2023 06:11:58 -0400
X-MC-Unique: aOcZgHn7MiCULBkedVPjDw-1
Received: by mail-wm1-f70.google.com with SMTP id
 ay12-20020a05600c1e0c00b003ed201dcf71so2451696wmb.4
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 03:11:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678788717;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yI8/3oobN3lQGgaP5LJzYeXqDjMMWWNIejNKLNDNJl0=;
 b=D4VKmYFASFH0EmeZ4beOoHfBPCHDLqFDJkz39IAk0rQBk7WkWFPj8MXcAVw6pgyF02
 D9cpP0+TorKE/c8XtuLbKt2rEr3dWKXTFmiHbfajwZuqKiHJgXXT+UDr23HhoKEJc2xu
 tsUEKe5nN7o51g+lAUCZ4Uq49SL6d7biOWUEAyaQbgq5R8AnNah1nv55zOnx+fnpCz40
 jtJoST9i+NpSqxCuElWUboGUDPNVpdpVJXay5XEBK597gpK69b9P11F+GHWi6X+RsHyt
 Y0I3Od981EIS9YYt7rnnm90V+HGX4y3SZUTEbWrdUkO+oy2+qYwD29L0AtZ4eM+wME6d
 Cp+A==
X-Gm-Message-State: AO0yUKWKeEG2zCczLLjaP2DAEpPjVQkgLglZdFSJlcwMjN5j4MMovKfW
 JZphpWCabB+YAkiXJDUFoDOuIWaX9QMWu1Qr0oyxSdIPcGk/oil7gMthOPwG3eSawym4NMm3SUz
 Cu6ZCpTgw2lFAC/Y=
X-Received: by 2002:adf:da45:0:b0:2ce:ad08:ca4 with SMTP id
 r5-20020adfda45000000b002cead080ca4mr5177349wrl.35.1678788716803; 
 Tue, 14 Mar 2023 03:11:56 -0700 (PDT)
X-Google-Smtp-Source: AK7set8VIlqzjY73R8r20xH8MjzJeLX6qz7rTzW4yLOG4O9KWEg2TJlz2sQINE8UCTz4xcddjczClg==
X-Received: by 2002:adf:da45:0:b0:2ce:ad08:ca4 with SMTP id
 r5-20020adfda45000000b002cead080ca4mr5177331wrl.35.1678788716410; 
 Tue, 14 Mar 2023 03:11:56 -0700 (PDT)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a0560001b0300b002c559626a50sm1731087wrz.13.2023.03.14.03.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 03:11:55 -0700 (PDT)
Date: Tue, 14 Mar 2023 10:11:53 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, peterx@redhat.com
Cc: qemu-devel@nongnu.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH] tests/qtest/migration-test: Disable
 migration/multifd/tcp/plain/cancel
Message-ID: <ZBBIaX+cZD5Ud2wQ@work-vm>
References: <20230302172211.4146376-1-peter.maydell@linaro.org>
 <CAFEAcA_Pf11W3FuaLHvzQ7yrkh6KC556HDfvXpZYaHqN4iMvsg@mail.gmail.com>
 <CAFEAcA92kLBwgJoAc9HCr4oX=S0V=RmdO4+rOnKPJn32hQAf4Q@mail.gmail.com>
 <CAFEAcA-UaJsoA-rqmwEqh1j6xcCc=ifCctvN-jaW40VckRdp9Q@mail.gmail.com>
 <CAFEAcA-q1UwPePdHTzXNSX4i6Urh3j6h51kymy6=7SzDAFU87w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA-q1UwPePdHTzXNSX4i6Urh3j6h51kymy6=7SzDAFU87w@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Copying Peter Xu on this one since it's poscopy, especially the newer
postcopy preempt.

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Sun, 12 Mar 2023 at 14:06, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Tue, 7 Mar 2023 at 09:53, Peter Maydell <peter.maydell@linaro.org> wrote:
> > >
> > > On Sat, 4 Mar 2023 at 15:39, Peter Maydell <peter.maydell@linaro.org> wrote:
> > > >
> > > > On Thu, 2 Mar 2023 at 17:22, Peter Maydell <peter.maydell@linaro.org> wrote:
> > > > >
> > > > > migration-test has been flaky for a long time, both in CI and
> > > > > otherwise:
> > > > >
> > > >
> > > >
> > > > > In the cases where I've looked at the underlying log, this seems to
> > > > > be in the migration/multifd/tcp/plain/cancel subtest.  Disable that
> > > > > specific subtest by default until somebody can track down the
> > > > > underlying cause. Enthusiasts can opt back in by setting
> > > > > QEMU_TEST_FLAKY_TESTS=1 in their environment.
> > > >
> > > > So I'm going to apply this, because hopefully it will improve
> > > > the reliability a bit, but it's clearly not all of the
> > > > issues with migration-test
> >
> > Here's another one, on the s390x CI runner:
> > https://gitlab.com/qemu-project/qemu/-/jobs/3917587994
> 
> And here's a backtrace from a hung migration-test on the s390x
> runner (looks like a deadlock, none of these processes were
> using CPU):

Ah a backtrace!
OK, I think I kind of see what's happening here, one for Peter Xu.
If I'm right it's a race something like:
  a) The test harness tells the source it wants to enter postcopy
  b) The harness then waits for the source to stop
  c) ... and the dest to start 

  It's blocked on one of b&c but can't tell which

  d) The main thread in the dest is waiting for the postcopy recovery fd
    to be opened
  e) But I think the source is still trying to send normal precopy RAM
    and perhaps hasn't got around yet to opening that socket yet????
  f) But I think the dest isn't reading from the main channel at that
    point because of (d)

Dave

> Process tree:
> migration-test(1464515)─┬─qemu-system-aar(1465117)
>                         └─qemu-system-aar(1465125)
> ===========================================================
> PROCESS: 1464515
> gitlab-+ 1464515 1463129  0 14:27 ?        00:00:02
> /home/gitlab-runner/builds/FLaZkdt1/0/qemu-project/qemu/build/tests/qtest/migration-test
> --tap -k
> [New LWP 1464517]
> [Thread debugging using libthread_db enabled]
> Using host libthread_db library "/lib/s390x-linux-gnu/libthread_db.so.1".
> __libc_recv (fd=fd@entry=5, buf=buf@entry=0x3ffc06f9987,
> len=len@entry=1, flags=flags@entry=0) at
> ../sysdeps/unix/sysv/linux/recv.c:30
> 30      ../sysdeps/unix/sysv/linux/recv.c: No such file or directory.
> 
> Thread 2 (Thread 0x3ff9faff900 (LWP 1464517)):
> #0  syscall () at ../sysdeps/unix/sysv/linux/s390/s390-64/syscall.S:37
> #1  0x000002aa1175ae34 in qemu_futex_wait (val=<optimized out>,
> f=<optimized out>) at
> /home/gitlab-runner/builds/FLaZkdt1/0/qemu-project/qemu/include/qemu/futex.h:29
> #2  qemu_event_wait (ev=ev@entry=0x2aa118d96b8 <rcu_call_ready_event>)
> at ../util/qemu-thread-posix.c:464
> #3  0x000002aa117879ea in call_rcu_thread (opaque=opaque@entry=0x0) at
> ../util/rcu.c:261
> #4  0x000002aa11759e9a in qemu_thread_start (args=<optimized out>) at
> ../util/qemu-thread-posix.c:541
> #5  0x000003ffa0487e66 in start_thread (arg=0x3ff9faff900) at
> pthread_create.c:477
> #6  0x000003ffa037cbe6 in thread_start () at
> ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 1 (Thread 0x3ffa0b6d990 (LWP 1464515)):
> #0  __libc_recv (fd=fd@entry=5, buf=buf@entry=0x3ffc06f9987,
> len=len@entry=1, flags=flags@entry=0) at
> ../sysdeps/unix/sysv/linux/recv.c:30
> #1  0x000002aa1172ba22 in recv (__flags=0, __n=1, __buf=0x3ffc06f9987,
> __fd=5) at /usr/include/s390x-linux-gnu/bits/socket2.h:44
> #2  qmp_fd_receive (fd=<optimized out>) at ../tests/qtest/libqmp.c:73
> #3  0x000002aa11729b8e in qtest_qmp_receive_dict (s=0x2aa129b97d0) at
> ../tests/qtest/libqtest.c:837
> #4  qtest_qmp_eventwait_ref (event=<optimized out>, s=<optimized out>)
> at ../tests/qtest/libqtest.c:837
> #5  qtest_qmp_eventwait_ref (s=0x2aa129b97d0, event=<optimized out>)
> at ../tests/qtest/libqtest.c:828
> #6  0x000002aa11729c1a in qtest_qmp_eventwait (s=<optimized out>,
> event=<optimized out>) at ../tests/qtest/libqtest.c:850
> #7  0x000002aa1171ec56 in test_postcopy_common (args=0x3ffc06f9c88) at
> ../tests/qtest/migration-test.c:1161

so I think that's the call:
    migrate_postcopy_start(from, to);
and migrate_postcopy_start has a pair of qtest_qmp_eventwait's in
but we can't tell which.

So it's waiting for an event after it's been told to enter postcopy
mode.

> #8  0x000002aa1171edb4 in test_postcopy_preempt () at
> ../tests/qtest/migration-test.c:1178
> #9  0x000003ffa067e608 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
> #10 0x000003ffa067e392 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
> #11 0x000003ffa067e392 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
> #12 0x000003ffa067e392 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
> #13 0x000003ffa067e392 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
> #14 0x000003ffa067eada in g_test_run_suite () from
> /lib/s390x-linux-gnu/libglib-2.0.so.0
> #15 0x000003ffa067eb10 in g_test_run () from
> /lib/s390x-linux-gnu/libglib-2.0.so.0
> #16 0x000002aa1171ab14 in main (argc=<optimized out>, argv=<optimized
> out>) at ../tests/qtest/migration-test.c:2615
> [Inferior 1 (process 1464515) detached]
> 
> ===========================================================
> PROCESS: 1465117
> gitlab-+ 1465117 1464515  0 14:28 ?        00:00:01
> ./qemu-system-aarch64 -qtest unix:/tmp/qtest-1464515.sock -qtest-log
> /dev/null -chardev socket,path=/tmp/qtest-1464515.qmp,id=char0 -mon
> chardev=char0,mode=control -display none -accel kvm -accel tcg
> -machine virt,gic-version=max -name source,debug-threads=on -m 150M
> -serial file:/tmp/migration-test-G3X601/src_serial -cpu max -kernel
> /tmp/migration-test-G3X601/bootsect -accel qtest
> [New LWP 1465122]
> [New LWP 1465123]
> [New LWP 1465124]
> [New LWP 1465137]
> [New LWP 1465138]
> [Thread debugging using libthread_db enabled]
> Using host libthread_db library "/lib/s390x-linux-gnu/libthread_db.so.1".
> 0x000003ffa66f1c8c in __ppoll (fds=0x2aa1f1c96f0, nfds=5,
> timeout=<optimized out>, timeout@entry=0x3fff71f9968,
> sigmask=sigmask@entry=0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
> 44      ../sysdeps/unix/sysv/linux/ppoll.c: No such file or directory.
> 
> Thread 6 (Thread 0x3ff950fe900 (LWP 1465138)):
> #0  __libc_sendmsg (fd=<optimized out>, msg=msg@entry=0x3ff950f9800,
> flags=flags@entry=0) at ../sysdeps/unix/sysv/linux/sendmsg.c:30
> #1  0x000002aa1cb4c81a in qio_channel_socket_writev (ioc=<optimized
> out>, iov=<optimized out>, niov=<optimized out>, fds=<optimized out>,
> nfds=<optimized out>, flags=0, errp=0x3ff950f9b70) at
> ../io/channel-socket.c:605
> #2  0x000002aa1cb51e78 in qio_channel_writev_full
> (ioc=ioc@entry=0x2aa1e8ee400, iov=0x2aa1f1bac90, niov=64,
> fds=fds@entry=0x0, nfds=nfds@entry=0, flags=0, errp=0x3ff950f9b70) at
> ../io/channel.c:108
> #3  0x000002aa1cb52cf0 in qio_channel_writev_full_all
> (ioc=0x2aa1e8ee400, iov=iov@entry=0x2aa1e5fe4d0, niov=<optimized out>,
> fds=fds@entry=0x0, nfds=nfds@entry=0, flags=0, errp=0x3ff950f9b70) at
> ../io/channel.c:263
> #4  0x000002aa1cb52d9e in qio_channel_writev_all (ioc=<optimized out>,
> iov=iov@entry=0x2aa1e5fe4d0, niov=<optimized out>,
> errp=errp@entry=0x3ff950f9b70) at ../io/channel.c:242
> #5  0x000002aa1c6de2a4 in qemu_fflush (f=f@entry=0x2aa1e5f6490) at
> ../migration/qemu-file.c:302
> #6  0x000002aa1c6de532 in qemu_fflush (f=0x2aa1e5f6490) at
> ../migration/qemu-file.c:297
> #7  add_to_iovec (f=f@entry=0x2aa1e5f6490, buf=<optimized out>,
> size=size@entry=4096, may_free=<optimized out>) at
> ../migration/qemu-file.c:510
> #8  0x000002aa1c6dea16 in qemu_put_buffer_async
> (f=f@entry=0x2aa1e5f6490, buf=<error reading variable: value has been
> optimized out>, size=size@entry=4096, may_free=<optimized out>) at
> ../migration/qemu-file.c:535
> #9  0x000002aa1cabcad6 in save_normal_page (async=<optimized out>,
> buf=<optimized out>, offset=1306624, block=0x2aa1e60cab0,
> pss=0x3ff28001440) at ../migration/ram.c:1400
> #10 ram_save_page (pss=0x3ff28001440, rs=<optimized out>) at
> ../migration/ram.c:1449
> #11 ram_save_target_page_legacy (rs=<optimized out>,
> pss=0x3ff28001440) at ../migration/ram.c:2381
> #12 0x000002aa1cab9906 in ram_save_host_page (pss=0x3ff28001440,
> rs=0x3ff28001440) at ../migration/ram.c:2539
> #13 ram_find_and_save_block (rs=rs@entry=0x3ff28001440) at
> ../migration/ram.c:2620
> #14 0x000002aa1cab9fe4 in ram_save_iterate (f=0x2aa1e5f6490,
> opaque=<optimized out>) at ../migration/ram.c:3361
> #15 0x000002aa1c6fa934 in qemu_savevm_state_iterate (f=0x2aa1e5f6490,
> postcopy=<optimized out>) at ../migration/savevm.c:1345
> #16 0x000002aa1c6ede24 in migration_iteration_run (s=0x2aa1e2cdcd0) at
> ../migration/migration.c:3896

To me this doesn't look like the postcopy flow; this looks like the
normal migration precopy flow; which is probably why the test thread
hasn't got it's event yet.  If you're saying it's not using CPU, that
suggests this outbound writer thread is blocked on the pipe to the
destination.

> #17 migration_thread (opaque=opaque@entry=0x2aa1e2cdcd0) at
> ../migration/migration.c:4124
> #18 0x000002aa1ccc462a in qemu_thread_start (args=<optimized out>) at
> ../util/qemu-thread-posix.c:541
> #19 0x000003ffa6807e66 in start_thread (arg=0x3ff950fe900) at
> pthread_create.c:477
> #20 0x000003ffa66fcbe6 in thread_start () at
> ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 5 (Thread 0x3ff958ff900 (LWP 1465137)):
> #0  __libc_recvmsg (fd=<optimized out>, msg=msg@entry=0x3ff958fa9f0,
> flags=flags@entry=0) at ../sysdeps/unix/sysv/linux/recvmsg.c:30
> #1  0x000002aa1cb4cad4 in qio_channel_socket_readv (ioc=<optimized
> out>, iov=<optimized out>, niov=<optimized out>, fds=0x0, nfds=0x0,
> flags=0, errp=0x3ff958faca8) at ../io/channel-socket.c:532
> #2  0x000002aa1cb51d60 in qio_channel_readv_full (ioc=0x2aa1e8ee400,
> iov=iov@entry=0x3ff958fabf0, niov=niov@entry=1, fds=fds@entry=0x0,
> nfds=nfds@entry=0x0, flags=0, errp=0x3ff958faca8) at
> ../io/channel.c:74
> #3  0x000002aa1cb51fe6 in qio_channel_read (ioc=<optimized out>,
> buf=buf@entry=0x2aa1e7a3c38 "", buflen=buflen@entry=32768,
> errp=errp@entry=0x3ff958faca8) at ../io/channel.c:314
> #4  0x000002aa1c6de13e in qemu_fill_buffer (f=0x2aa1e7a3c00) at
> ../migration/qemu-file.c:415
> #5  0x000002aa1c6ded18 in qemu_peek_byte (f=0x2aa1e7a3c00,
> offset=<optimized out>) at ../migration/qemu-file.c:707
> #6  0x000002aa1c6defba in qemu_get_byte (f=0x2aa1e7a3c00) at
> ../migration/qemu-file.c:720
> #7  qemu_get_be16 (f=f@entry=0x2aa1e7a3c00) at ../migration/qemu-file.c:800
> #8  0x000002aa1c6ea7e8 in source_return_path_thread
> (opaque=opaque@entry=0x2aa1e2cdcd0) at ../migration/migration.c:2995
> #9  0x000002aa1ccc462a in qemu_thread_start (args=<optimized out>) at
> ../util/qemu-thread-posix.c:541
> #10 0x000003ffa6807e66 in start_thread (arg=0x3ff958ff900) at
> pthread_create.c:477
> #11 0x000003ffa66fcbe6 in thread_start () at
> ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 4 (Thread 0x3ff9662e900 (LWP 1465124)):
> #0  futex_wait_cancelable (private=0, expected=0,
> futex_word=0x2aa1e5daeb8) at ../sysdeps/nptl/futex-internal.h:183
> #1  __pthread_cond_wait_common (abstime=0x0, clockid=0,
> mutex=0x2aa1d75bf80 <qemu_global_mutex>, cond=0x2aa1e5dae90) at
> pthread_cond_wait.c:508
> #2  __pthread_cond_wait (cond=cond@entry=0x2aa1e5dae90,
> mutex=mutex@entry=0x2aa1d75bf80 <qemu_global_mutex>) at
> pthread_cond_wait.c:647
> #3  0x000002aa1ccc500e in qemu_cond_wait_impl (cond=0x2aa1e5dae90,
> mutex=0x2aa1d75bf80 <qemu_global_mutex>, file=0x2aa1ce5d9bc
> "../softmmu/cpus.c", line=<optimized out>) at
> ../util/qemu-thread-posix.c:225
> #4  0x000002aa1c6bdf0e in qemu_wait_io_event
> (cpu=cpu@entry=0x2aa1e70c750) at ../softmmu/cpus.c:424
> #5  0x000002aa1cb34412 in mttcg_cpu_thread_fn
> (arg=arg@entry=0x2aa1e70c750) at
> ../accel/tcg/tcg-accel-ops-mttcg.c:123
> #6  0x000002aa1ccc462a in qemu_thread_start (args=<optimized out>) at
> ../util/qemu-thread-posix.c:541
> #7  0x000003ffa6807e66 in start_thread (arg=0x3ff9662e900) at
> pthread_create.c:477
> #8  0x000003ffa66fcbe6 in thread_start () at
> ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 3 (Thread 0x3ff97021900 (LWP 1465123)):
> #0  0x000003ffa66f1b32 in __GI___poll (fds=0x3ff480036b0, nfds=3,
> timeout=<optimized out>) at ../sysdeps/unix/sysv/linux/poll.c:29
> #1  0x000003ffa8ed4386 in  () at /lib/s390x-linux-gnu/libglib-2.0.so.0
> #2  0x000003ffa8ed4790 in g_main_loop_run () at
> /lib/s390x-linux-gnu/libglib-2.0.so.0
> #3  0x000002aa1cb74afe in iothread_run
> (opaque=opaque@entry=0x2aa1e371400) at ../iothread.c:70
> #4  0x000002aa1ccc462a in qemu_thread_start (args=<optimized out>) at
> ../util/qemu-thread-posix.c:541
> #5  0x000003ffa6807e66 in start_thread (arg=0x3ff97021900) at
> pthread_create.c:477
> #6  0x000003ffa66fcbe6 in thread_start () at
> ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 2 (Thread 0x3ff97923900 (LWP 1465122)):
> #0  syscall () at ../sysdeps/unix/sysv/linux/s390/s390-64/syscall.S:37
> #1  0x000002aa1ccc55c4 in qemu_futex_wait (val=<optimized out>,
> f=<optimized out>) at
> /home/gitlab-runner/builds/FLaZkdt1/0/qemu-project/qemu/include/qemu/futex.h:29
> #2  qemu_event_wait (ev=ev@entry=0x2aa1d78e5d0 <rcu_call_ready_event>)
> at ../util/qemu-thread-posix.c:464
> #3  0x000002aa1ccce19a in call_rcu_thread (opaque=opaque@entry=0x0) at
> ../util/rcu.c:261
> #4  0x000002aa1ccc462a in qemu_thread_start (args=<optimized out>) at
> ../util/qemu-thread-posix.c:541
> #5  0x000003ffa6807e66 in start_thread (arg=0x3ff97923900) at
> pthread_create.c:477
> #6  0x000003ffa66fcbe6 in thread_start () at
> ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 1 (Thread 0x3ffaa07e4a0 (LWP 1465117)):
> #0  0x000003ffa66f1c8c in __ppoll (fds=0x2aa1f1c96f0, nfds=5,
> timeout=<optimized out>, timeout@entry=0x3fff71f9968,
> sigmask=sigmask@entry=0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
> #1  0x000002aa1ccda44a in ppoll (__ss=0x0, __timeout=0x3fff71f9968,
> __nfds=<optimized out>, __fds=<optimized out>) at
> /usr/include/s390x-linux-gnu/bits/poll2.h:77
> #2  qemu_poll_ns (fds=<optimized out>, nfds=<optimized out>,
> timeout=timeout@entry=1000000000) at ../util/qemu-timer.c:351
> #3  0x000002aa1ccd7460 in os_host_main_loop_wait (timeout=1000000000)
> at ../util/main-loop.c:312
> #4  main_loop_wait (nonblocking=nonblocking@entry=0) at ../util/main-loop.c:603
> #5  0x000002aa1c6c4ae4 in qemu_main_loop () at ../softmmu/runstate.c:731
> #6  0x000002aa1c42c5ba in qemu_default_main () at ../softmmu/main.c:37
> #7  0x000003ffa662440a in __libc_start_main (main=0x2aa1c428b90
> <main>, argc=<optimized out>, argv=0x3fff71f9db8, init=<optimized
> out>, fini=<optimized out>, rtld_fini=0x3ffaa090e50 <_dl_fini>,
> stack_end=0x3fff71f9d00) at libc-start.c:308
> #8  0x000002aa1c42c4e4 in _start () at ../softmmu/main.c:48
> [Inferior 1 (process 1465117) detached]
> 
> ===========================================================
> PROCESS: 1465125
> gitlab-+ 1465125 1464515  0 14:28 ?        00:00:00
> ./qemu-system-aarch64 -qtest unix:/tmp/qtest-1464515.sock -qtest-log
> /dev/null -chardev socket,path=/tmp/qtest-1464515.qmp,id=char0 -mon
> chardev=char0,mode=control -display none -accel kvm -accel tcg
> -machine virt,gic-version=max -name target,debug-threads=on -m 150M
> -serial file:/tmp/migration-test-G3X601/dest_serial -incoming
> unix:/tmp/migration-test-G3X601/migsocket -cpu max -kernel
> /tmp/migration-test-G3X601/bootsect -accel qtest
> [New LWP 1465133]
> [New LWP 1465134]
> [New LWP 1465135]
> [New LWP 1465140]
> [Thread debugging using libthread_db enabled]
> Using host libthread_db library "/lib/s390x-linux-gnu/libthread_db.so.1".
> futex_wait_cancelable (private=0, expected=0,
> futex_word=0x2aa2b37b560) at ../sysdeps/nptl/futex-internal.h:183
> 183     ../sysdeps/nptl/futex-internal.h: No such file or directory.
> 
> Thread 5 (Thread 0x3ff749fe900 (LWP 1465140)):
> #0  0x000003ff858f1b32 in __GI___poll (fds=fds@entry=0x3ff10000b60,
> nfds=2, nfds@entry=<error reading variable: value has been optimized
> out>, timeout=timeout@entry=-1) at
> ../sysdeps/unix/sysv/linux/poll.c:29
> #1  0x000002aa284f520e in poll (__timeout=-1, __nfds=<optimized out>,
> __fds=0x3ff10000b60) at /usr/include/s390x-linux-gnu/bits/poll2.h:46
> #2  postcopy_ram_fault_thread (opaque=opaque@entry=0x2aa2b37b3a0) at
> ../migration/postcopy-ram.c:952
> #3  0x000002aa28ac462a in qemu_thread_start (args=<optimized out>) at
> ../util/qemu-thread-posix.c:541
> #4  0x000003ff85a07e66 in start_thread (arg=0x3ff749fe900) at
> pthread_create.c:477
> #5  0x000003ff858fcbe6 in thread_start () at
> ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

Oh, we've got a postcopy_ram_fault_thread - so the dest knows that
postcopy is in progress; so it must have seen a postcopy message from
the source.

> Thread 4 (Thread 0x3ff7582e900 (LWP 1465135)):
> #0  futex_wait_cancelable (private=0, expected=0,
> futex_word=0x2aa2b82310c) at ../sysdeps/nptl/futex-internal.h:183
> #1  __pthread_cond_wait_common (abstime=0x0, clockid=0,
> mutex=0x2aa2955bf80 <qemu_global_mutex>, cond=0x2aa2b8230e0) at
> pthread_cond_wait.c:508
> #2  __pthread_cond_wait (cond=cond@entry=0x2aa2b8230e0,
> mutex=mutex@entry=0x2aa2955bf80 <qemu_global_mutex>) at
> pthread_cond_wait.c:647
> #3  0x000002aa28ac500e in qemu_cond_wait_impl (cond=0x2aa2b8230e0,
> mutex=0x2aa2955bf80 <qemu_global_mutex>, file=0x2aa28c5d9bc
> "../softmmu/cpus.c", line=<optimized out>) at
> ../util/qemu-thread-posix.c:225
> #4  0x000002aa284bdf0e in qemu_wait_io_event
> (cpu=cpu@entry=0x2aa2b7b9750) at ../softmmu/cpus.c:424
> #5  0x000002aa28934412 in mttcg_cpu_thread_fn
> (arg=arg@entry=0x2aa2b7b9750) at
> ../accel/tcg/tcg-accel-ops-mttcg.c:123
> #6  0x000002aa28ac462a in qemu_thread_start (args=<optimized out>) at
> ../util/qemu-thread-posix.c:541
> #7  0x000003ff85a07e66 in start_thread (arg=0x3ff7582e900) at
> pthread_create.c:477
> #8  0x000003ff858fcbe6 in thread_start () at
> ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 3 (Thread 0x3ff76221900 (LWP 1465134)):
> #0  0x000003ff858f1b32 in __GI___poll (fds=0x3ff280036b0, nfds=3,
> timeout=<optimized out>) at ../sysdeps/unix/sysv/linux/poll.c:29
> #1  0x000003ff880d4386 in  () at /lib/s390x-linux-gnu/libglib-2.0.so.0
> #2  0x000003ff880d4790 in g_main_loop_run () at
> /lib/s390x-linux-gnu/libglib-2.0.so.0
> #3  0x000002aa28974afe in iothread_run
> (opaque=opaque@entry=0x2aa2b41e400) at ../iothread.c:70
> #4  0x000002aa28ac462a in qemu_thread_start (args=<optimized out>) at
> ../util/qemu-thread-posix.c:541
> #5  0x000003ff85a07e66 in start_thread (arg=0x3ff76221900) at
> pthread_create.c:477
> #6  0x000003ff858fcbe6 in thread_start () at
> ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 2 (Thread 0x3ff76b23900 (LWP 1465133)):
> #0  syscall () at ../sysdeps/unix/sysv/linux/s390/s390-64/syscall.S:37
> #1  0x000002aa28ac55c4 in qemu_futex_wait (val=<optimized out>,
> f=<optimized out>) at
> /home/gitlab-runner/builds/FLaZkdt1/0/qemu-project/qemu/include/qemu/futex.h:29
> #2  qemu_event_wait (ev=ev@entry=0x2aa2958e5d0 <rcu_call_ready_event>)
> at ../util/qemu-thread-posix.c:464
> #3  0x000002aa28ace19a in call_rcu_thread (opaque=opaque@entry=0x0) at
> ../util/rcu.c:261
> #4  0x000002aa28ac462a in qemu_thread_start (args=<optimized out>) at
> ../util/qemu-thread-posix.c:541
> #5  0x000003ff85a07e66 in start_thread (arg=0x3ff76b23900) at
> pthread_create.c:477
> #6  0x000003ff858fcbe6 in thread_start () at
> ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 1 (Thread 0x3ff8927e4a0 (LWP 1465125)):
> #0  futex_wait_cancelable (private=0, expected=0,
> futex_word=0x2aa2b37b560) at ../sysdeps/nptl/futex-internal.h:183
> #1  __pthread_cond_wait_common (abstime=0x0, clockid=0,
> mutex=0x2aa2b37b508, cond=0x2aa2b37b538) at pthread_cond_wait.c:508
> #2  __pthread_cond_wait (cond=cond@entry=0x2aa2b37b538,
> mutex=mutex@entry=0x2aa2b37b508) at pthread_cond_wait.c:647
> #3  0x000002aa28ac500e in qemu_cond_wait_impl (cond=0x2aa2b37b538,
> mutex=0x2aa2b37b508, file=0x2aa28d70dee "../util/qemu-thread-posix.c",
> line=<optimized out>) at ../util/qemu-thread-posix.c:225
> #4  0x000002aa28ac542e in qemu_sem_wait (sem=0x2aa2b37b508) at
> ../util/qemu-thread-posix.c:314
> #5  0x000002aa284f485a in postcopy_ram_incoming_setup
> (mis=0x2aa2b37b3a0, mis@entry=<error reading variable: value has been

Which is:
    if (migrate_postcopy_preempt()) {
        /*
         * The preempt channel is established in asynchronous way.  Wait
         * for its completion.
         */
        qemu_sem_wait(&mis->postcopy_qemufile_dst_done);

> optimized out>) at ../migration/postcopy-ram.c:1204
> #6  0x000002aa284fbf70 in loadvm_postcopy_handle_listen
> (mis=<optimized out>) at ../migration/savevm.c:2016
> #7  loadvm_process_command (f=0x2aa2b85b7a0) at ../migration/savevm.c:2379
> #8  qemu_loadvm_state_main (f=f@entry=0x2aa2b85b7a0,
> mis=0x2aa2b37b3a0) at ../migration/savevm.c:2724
> #9  0x000002aa284fc2fe in loadvm_handle_cmd_packaged (mis=<optimized
> out>) at ../migration/savevm.c:2248
> #10 loadvm_process_command (f=0x2aa2b6a3490) at ../migration/savevm.c:2373
> #11 qemu_loadvm_state_main (f=f@entry=0x2aa2b6a3490,
> mis=mis@entry=0x2aa2b37b3a0) at ../migration/savevm.c:2724
> #12 0x000002aa284fcf14 in qemu_loadvm_state (f=0x2aa2b6a3490) at
> ../migration/savevm.c:2790
> #13 0x000002aa284e9f64 in process_incoming_migration_co
> (opaque=<optimized out>) at ../migration/migration.c:606
> #14 0x000002aa28ad92e6 in coroutine_trampoline (i0=<optimized out>,
> i1=<optimized out>) at ../util/coroutine-ucontext.c:177
> #15 0x000003ff858569c2 in __makecontext_ret () at
> ../sysdeps/unix/sysv/linux/s390/s390-64/__makecontext_ret.S:23
> [Inferior 1 (process 1465125) detached]
> 
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


