Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E475C6B95C7
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 14:15:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc4TN-00017s-3W; Tue, 14 Mar 2023 09:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pc4TL-00017f-HL
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 09:13:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pc4TH-0004uS-8a
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 09:13:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678799622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J0rYwQB2geoyqodcZJwOIap2ZKnDCKkTGviQseiG8GI=;
 b=E3QWaQhn6w+waD8Y/0ERgZsK0xZgc56Hyv+u5jdn4aQpCRlO+R0Lv7UAWmSdnfaMPdGoIj
 EwWzqXytQUyZtlnpWxPo0RV6Vv0h1SWSH0BMPrlCAuSdb57j9Nku+/rHDajvbBN7AtOzm6
 d5FnBWQ8ccZYOzjb8ty5s+VOyn1fbG0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-8acztzZYNNOgvqrWZgIQBw-1; Tue, 14 Mar 2023 09:13:41 -0400
X-MC-Unique: 8acztzZYNNOgvqrWZgIQBw-1
Received: by mail-wm1-f70.google.com with SMTP id
 n15-20020a05600c500f00b003dd07ce79c8so5672679wmr.1
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 06:13:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678799619;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J0rYwQB2geoyqodcZJwOIap2ZKnDCKkTGviQseiG8GI=;
 b=JyWrm64mVD8ApmvitiolGVc3SvVnYS0oLHVuqCSpE09BYamaXQl8+Eqlx5pjcS9dUx
 7zr36VHYXesgxmelh1UXBHI414GbbAkvtoI8Z5qG1UTRdOhJK4sXmxEaFZRi+M4lEdeV
 aMuCEj/uKIG4qYriXp1JbX2HR+05HypN36qtHQ6sdvGWcbn8FOVEUsUdKv6OMSSJR2Zt
 3eHWUngaP3l8x9LHaBNma2Lh0Y0LubZXOXFub74YlFe5MDslAbJL/bwROkdeEm3Zwce6
 B8biFugHcFI2EhANhjMEnIkmKeeD0o9J/84s2h129gB1hvSYpnymBLTeyUkSAvD6L6ZR
 IVdQ==
X-Gm-Message-State: AO0yUKU2IMtq2TsjJl8EkMaOI7UD3JszxvtmPhc+kM43lZy8hHTnUv0z
 hjQ50z7K1d9LOaCp6ii2/cansrFYcMOCac+56ZbL2zPXrUZhrJ5yT1/heMjYbxXF1IUm/VT8quo
 jlyut5RqAQBxYWdY=
X-Received: by 2002:adf:f18a:0:b0:2c7:1d20:7743 with SMTP id
 h10-20020adff18a000000b002c71d207743mr27086010wro.21.1678799619469; 
 Tue, 14 Mar 2023 06:13:39 -0700 (PDT)
X-Google-Smtp-Source: AK7set/beF+Af8fdLdntv/BoZx+89K6EAxZMp5VQKsDFwI2zX0KgWHSC4qWzagvdI4ykFa4DMb2T6Q==
X-Received: by 2002:adf:f18a:0:b0:2c7:1d20:7743 with SMTP id
 h10-20020adff18a000000b002c71d207743mr27085984wro.21.1678799619027; 
 Tue, 14 Mar 2023 06:13:39 -0700 (PDT)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 f26-20020a7bc8da000000b003e2096da239sm2914673wml.7.2023.03.14.06.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 06:13:38 -0700 (PDT)
Date: Tue, 14 Mar 2023 13:13:36 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: peterx@redhat.com, qemu-devel@nongnu.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH] tests/qtest/migration-test: Disable
 migration/multifd/tcp/plain/cancel
Message-ID: <ZBBzAL2T7J5jekjl@work-vm>
References: <20230302172211.4146376-1-peter.maydell@linaro.org>
 <CAFEAcA_Pf11W3FuaLHvzQ7yrkh6KC556HDfvXpZYaHqN4iMvsg@mail.gmail.com>
 <CAFEAcA92kLBwgJoAc9HCr4oX=S0V=RmdO4+rOnKPJn32hQAf4Q@mail.gmail.com>
 <CAFEAcA-UaJsoA-rqmwEqh1j6xcCc=ifCctvN-jaW40VckRdp9Q@mail.gmail.com>
 <CAFEAcA-q1UwPePdHTzXNSX4i6Urh3j6h51kymy6=7SzDAFU87w@mail.gmail.com>
 <ZBBIaX+cZD5Ud2wQ@work-vm>
 <CAFEAcA9uQzhTX6DshQeuyChh0CfgDseGdirbyDz08=UqAyqxDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9uQzhTX6DshQeuyChh0CfgDseGdirbyDz08=UqAyqxDA@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Tue, 14 Mar 2023 at 10:12, Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> >
> > Copying Peter Xu on this one since it's poscopy, especially the newer
> > postcopy preempt.
> >
> > * Peter Maydell (peter.maydell@linaro.org) wrote:
> > > On Sun, 12 Mar 2023 at 14:06, Peter Maydell <peter.maydell@linaro.org> wrote:
> > > > Here's another one, on the s390x CI runner:
> > > > https://gitlab.com/qemu-project/qemu/-/jobs/3917587994
> > >
> > > And here's a backtrace from a hung migration-test on the s390x
> > > runner (looks like a deadlock, none of these processes were
> > > using CPU):
> >
> > Ah a backtrace!
> 
> I've attached another 2 -- migration-test seems to fairly
> commonly hang on the s390 CI runner; there are several
> stuck tests on it at the moment.

These are the same as the last one I replied to; it's probably best
if we disable /migration/postcopy/preempt/* until peterx has attacked
it.

Dave

> -- PMM

> Process tree:
> migration-test(1841031)-+-qemu-system-x86(1841381)
>                         `-qemu-system-x86(1841387)
> ===========================================================
> PROCESS: 1841031
> gitlab-+ 1841031 1838397  0 Mar13 ?        00:00:02 /home/gitlab-runner/builds/FLaZkdt1/0/qemu-project/qemu/build/tests/qtest/migration-test --tap -k
> [New LWP 1841033]
> [Thread debugging using libthread_db enabled]
> Using host libthread_db library "/lib/s390x-linux-gnu/libthread_db.so.1".
> __libc_recv (fd=fd@entry=5, buf=buf@entry=0x3ffdac792e7, len=len@entry=1, flags=flags@entry=0) at ../sysdeps/unix/sysv/linux/recv.c:30
> 
> Thread 2 (Thread 0x3ffb01ff900 (LWP 1841033)):
> #0  syscall () at ../sysdeps/unix/sysv/linux/s390/s390-64/syscall.S:37
> #1  0x000002aa133dae34 in qemu_futex_wait (val=<optimized out>, f=<optimized out>) at /home/gitlab-runner/builds/FLaZkdt1/0/qemu-project/qemu/include/qemu/futex.h:29
> #2  qemu_event_wait (ev=ev@entry=0x2aa135596b8 <rcu_call_ready_event>) at ../util/qemu-thread-posix.c:464
> #3  0x000002aa134079ea in call_rcu_thread (opaque=opaque@entry=0x0) at ../util/rcu.c:261
> #4  0x000002aa133d9e9a in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:541
> #5  0x000003ffb0b87e66 in start_thread (arg=0x3ffb01ff900) at pthread_create.c:477
> #6  0x000003ffb0a7cbe6 in thread_start () at ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 1 (Thread 0x3ffb126d990 (LWP 1841031)):
> #0  __libc_recv (fd=fd@entry=5, buf=buf@entry=0x3ffdac792e7, len=len@entry=1, flags=flags@entry=0) at ../sysdeps/unix/sysv/linux/recv.c:30
> #1  0x000002aa133aba22 in recv (__flags=0, __n=1, __buf=0x3ffdac792e7, __fd=5) at /usr/include/s390x-linux-gnu/bits/socket2.h:44
> #2  qmp_fd_receive (fd=<optimized out>) at ../tests/qtest/libqmp.c:73
> #3  0x000002aa133a9b8e in qtest_qmp_receive_dict (s=0x2aa135fb800) at ../tests/qtest/libqtest.c:837
> #4  qtest_qmp_eventwait_ref (event=<optimized out>, s=<optimized out>) at ../tests/qtest/libqtest.c:837
> #5  qtest_qmp_eventwait_ref (s=0x2aa135fb800, event=<optimized out>) at ../tests/qtest/libqtest.c:828
> #6  0x000002aa133a9c1a in qtest_qmp_eventwait (s=<optimized out>, event=<optimized out>) at ../tests/qtest/libqtest.c:850
> #7  0x000002aa1339ec56 in test_postcopy_common (args=0x3ffdac795e8) at ../tests/qtest/migration-test.c:1161
> #8  0x000002aa1339edb4 in test_postcopy_preempt () at ../tests/qtest/migration-test.c:1178
> #9  0x000003ffb0d7e608 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
> #10 0x000003ffb0d7e392 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
> #11 0x000003ffb0d7e392 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
> #12 0x000003ffb0d7e392 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
> #13 0x000003ffb0d7e392 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
> #14 0x000003ffb0d7eada in g_test_run_suite () from /lib/s390x-linux-gnu/libglib-2.0.so.0
> #15 0x000003ffb0d7eb10 in g_test_run () from /lib/s390x-linux-gnu/libglib-2.0.so.0
> #16 0x000002aa1339ab14 in main (argc=<optimized out>, argv=<optimized out>) at ../tests/qtest/migration-test.c:2615
> [Inferior 1 (process 1841031) detached]
> 
> ===========================================================
> PROCESS: 1841381
> gitlab-+ 1841381 1841031  0 Mar13 ?        00:00:06 ./qemu-system-x86_64 -qtest unix:/tmp/qtest-1841031.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-1841031.qmp,id=char0 -mon chardev=char0,mode=control -display none -accel kvm -accel tcg -name source,debug-threads=on -m 150M -serial file:/tmp/migration-test-RM5901/src_serial -drive file=/tmp/migration-test-RM5901/bootsect,format=raw -accel qtest
> [New LWP 1841383]
> [New LWP 1841384]
> [New LWP 1841385]
> [New LWP 1841394]
> [New LWP 1841395]
> [Thread debugging using libthread_db enabled]
> Using host libthread_db library "/lib/s390x-linux-gnu/libthread_db.so.1".
> 0x000003ffb51f1c8c in __ppoll (fds=0x2aa1c0ffbd0, nfds=5, timeout=<optimized out>, timeout@entry=0x3fffbb79bc8, sigmask=sigmask@entry=0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
> 
> Thread 6 (Thread 0x3ff469f7900 (LWP 1841395)):
> #0  __libc_sendmsg (fd=<optimized out>, msg=msg@entry=0x3ff469f2810, flags=flags@entry=0) at ../sysdeps/unix/sysv/linux/sendmsg.c:30
> #1  0x000002aa1a34c52a in qio_channel_socket_writev (ioc=<optimized out>, iov=<optimized out>, niov=<optimized out>, fds=<optimized out>, nfds=<optimized out>, flags=0, errp=0x3ff469f2b80) at ../io/channel-socket.c:605
> #2  0x000002aa1a351b88 in qio_channel_writev_full (ioc=ioc@entry=0x2aa1c0f8400, iov=0x2aa1c0e88e0, niov=64, fds=fds@entry=0x0, nfds=nfds@entry=0, flags=0, errp=0x3ff469f2b80) at ../io/channel.c:108
> #3  0x000002aa1a352a00 in qio_channel_writev_full_all (ioc=0x2aa1c0f8400, iov=iov@entry=0x2aa1b2792a0, niov=<optimized out>, fds=fds@entry=0x0, nfds=nfds@entry=0, flags=0, errp=0x3ff469f2b80) at ../io/channel.c:263
> #4  0x000002aa1a352aae in qio_channel_writev_all (ioc=<optimized out>, iov=iov@entry=0x2aa1b2792a0, niov=<optimized out>, errp=errp@entry=0x3ff469f2b80) at ../io/channel.c:242
> #5  0x000002aa1a10de94 in qemu_fflush (f=f@entry=0x2aa1b271260) at ../migration/qemu-file.c:302
> #6  0x000002aa1a10e122 in qemu_fflush (f=0x2aa1b271260) at ../migration/qemu-file.c:297
> #7  add_to_iovec (f=f@entry=0x2aa1b271260, buf=<optimized out>, size=size@entry=4096, may_free=<optimized out>) at ../migration/qemu-file.c:510
> #8  0x000002aa1a10e606 in qemu_put_buffer_async (f=f@entry=0x2aa1b271260, buf=<error reading variable: value has been optimized out>, size=size@entry=4096, may_free=<optimized out>) at ../migration/qemu-file.c:535
> #9  0x000002aa1a2bd398 in save_normal_page (async=<optimized out>, buf=<optimized out>, offset=1175552, block=0x2aa1b19f340, pss=0x3ff40003000) at ../migration/ram.c:1400
> #10 ram_save_page (pss=0x3ff40003000, rs=0x3ff40003000) at ../migration/ram.c:1449
> #11 ram_save_target_page_legacy (rs=0x3ff40003000, pss=0x3ff40003000) at ../migration/ram.c:2381
> #12 0x000002aa1a2ba330 in ram_save_host_page (pss=0x3ff40003000, rs=0x3ff40003000) at ../migration/ram.c:2539
> #13 ram_find_and_save_block (rs=rs@entry=0x3ff40003000) at ../migration/ram.c:2620
> #14 0x000002aa1a2ba9e4 in ram_save_iterate (f=0x2aa1b271260, opaque=<optimized out>) at ../migration/ram.c:3361
> #15 0x000002aa1a12a524 in qemu_savevm_state_iterate (f=0x2aa1b271260, postcopy=<optimized out>) at ../migration/savevm.c:1345
> #16 0x000002aa1a11da14 in migration_iteration_run (s=0x2aa1af3a810) at ../migration/migration.c:3896
> #17 migration_thread (opaque=opaque@entry=0x2aa1af3a810) at ../migration/migration.c:4124
> #18 0x000002aa1a4c42ca in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:541
> #19 0x000003ffb5307e66 in start_thread (arg=0x3ff469f7900) at pthread_create.c:477
> #20 0x000003ffb51fcbe6 in thread_start () at ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 5 (Thread 0x3ff471f8900 (LWP 1841394)):
> #0  __libc_recvmsg (fd=<optimized out>, msg=msg@entry=0x3ff471f39f0, flags=flags@entry=0) at ../sysdeps/unix/sysv/linux/recvmsg.c:30
> #1  0x000002aa1a34c7e4 in qio_channel_socket_readv (ioc=<optimized out>, iov=<optimized out>, niov=<optimized out>, fds=0x0, nfds=0x0, flags=0, errp=0x3ff471f3ca8) at ../io/channel-socket.c:532
> #2  0x000002aa1a351a70 in qio_channel_readv_full (ioc=0x2aa1c0f8400, iov=iov@entry=0x3ff471f3bf0, niov=niov@entry=1, fds=fds@entry=0x0, nfds=nfds@entry=0x0, flags=0, errp=0x3ff471f3ca8) at ../io/channel.c:74
> #3  0x000002aa1a351cf6 in qio_channel_read (ioc=<optimized out>, buf=buf@entry=0x2aa1b17d9d8 "", buflen=buflen@entry=32768, errp=errp@entry=0x3ff471f3ca8) at ../io/channel.c:314
> #4  0x000002aa1a10dd2e in qemu_fill_buffer (f=0x2aa1b17d9a0) at ../migration/qemu-file.c:415
> #5  0x000002aa1a10e908 in qemu_peek_byte (f=0x2aa1b17d9a0, offset=<optimized out>) at ../migration/qemu-file.c:707
> #6  0x000002aa1a10ebaa in qemu_get_byte (f=0x2aa1b17d9a0) at ../migration/qemu-file.c:720
> #7  qemu_get_be16 (f=f@entry=0x2aa1b17d9a0) at ../migration/qemu-file.c:800
> #8  0x000002aa1a11a3d8 in source_return_path_thread (opaque=opaque@entry=0x2aa1af3a810) at ../migration/migration.c:2995
> #9  0x000002aa1a4c42ca in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:541
> #10 0x000003ffb5307e66 in start_thread (arg=0x3ff471f8900) at pthread_create.c:477
> #11 0x000003ffb51fcbe6 in thread_start () at ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 4 (Thread 0x3ffa4eab900 (LWP 1841385)):
> #0  futex_wait_cancelable (private=0, expected=0, futex_word=0x2aa1b29c30c) at ../sysdeps/nptl/futex-internal.h:183
> #1  __pthread_cond_wait_common (abstime=0x0, clockid=0, mutex=0x2aa1ad9b798 <qemu_global_mutex>, cond=0x2aa1b29c2e0) at pthread_cond_wait.c:508
> #2  __pthread_cond_wait (cond=cond@entry=0x2aa1b29c2e0, mutex=mutex@entry=0x2aa1ad9b798 <qemu_global_mutex>) at pthread_cond_wait.c:647
> #3  0x000002aa1a4c4cae in qemu_cond_wait_impl (cond=0x2aa1b29c2e0, mutex=0x2aa1ad9b798 <qemu_global_mutex>, file=0x2aa1a60b014 "../softmmu/cpus.c", line=<optimized out>) at ../util/qemu-thread-posix.c:225
> #4  0x000002aa1a0edafe in qemu_wait_io_event (cpu=cpu@entry=0x2aa1b26a160) at ../softmmu/cpus.c:424
> #5  0x000002aa1a3315ca in mttcg_cpu_thread_fn (arg=arg@entry=0x2aa1b26a160) at ../accel/tcg/tcg-accel-ops-mttcg.c:123
> #6  0x000002aa1a4c42ca in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:541
> #7  0x000003ffb5307e66 in start_thread (arg=0x3ffa4eab900) at pthread_create.c:477
> #8  0x000003ffb51fcbe6 in thread_start () at ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 3 (Thread 0x3ffa579d900 (LWP 1841384)):
> #0  0x000003ffb51f1b32 in __GI___poll (fds=0x3ff58003280, nfds=3, timeout=<optimized out>) at ../sysdeps/unix/sysv/linux/poll.c:29
> #1  0x000003ffb79d4386 in  () at /lib/s390x-linux-gnu/libglib-2.0.so.0
> #2  0x000003ffb79d4790 in g_main_loop_run () at /lib/s390x-linux-gnu/libglib-2.0.so.0
> #3  0x000002aa1a37480e in iothread_run (opaque=opaque@entry=0x2aa1b0aec00) at ../iothread.c:70
> #4  0x000002aa1a4c42ca in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:541
> #5  0x000003ffb5307e66 in start_thread (arg=0x3ffa579d900) at pthread_create.c:477
> #6  0x000003ffb51fcbe6 in thread_start () at ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 2 (Thread 0x3ffa6423900 (LWP 1841383)):
> #0  syscall () at ../sysdeps/unix/sysv/linux/s390/s390-64/syscall.S:37
> #1  0x000002aa1a4c5264 in qemu_futex_wait (val=<optimized out>, f=<optimized out>) at /home/gitlab-runner/builds/FLaZkdt1/0/qemu-project/qemu/include/qemu/futex.h:29
> #2  qemu_event_wait (ev=ev@entry=0x2aa1adccab0 <rcu_call_ready_event>) at ../util/qemu-thread-posix.c:464
> #3  0x000002aa1a4cde3a in call_rcu_thread (opaque=opaque@entry=0x0) at ../util/rcu.c:261
> #4  0x000002aa1a4c42ca in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:541
> #5  0x000003ffb5307e66 in start_thread (arg=0x3ffa6423900) at pthread_create.c:477
> #6  0x000003ffb51fcbe6 in thread_start () at ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 1 (Thread 0x3ffb8b7e4a0 (LWP 1841381)):
> #0  0x000003ffb51f1c8c in __ppoll (fds=0x2aa1c0ffbd0, nfds=5, timeout=<optimized out>, timeout@entry=0x3fffbb79bc8, sigmask=sigmask@entry=0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
> #1  0x000002aa1a4da07a in ppoll (__ss=0x0, __timeout=0x3fffbb79bc8, __nfds=<optimized out>, __fds=<optimized out>) at /usr/include/s390x-linux-gnu/bits/poll2.h:77
> #2  qemu_poll_ns (fds=<optimized out>, nfds=<optimized out>, timeout=timeout@entry=1000000000) at ../util/qemu-timer.c:351
> #3  0x000002aa1a4d7090 in os_host_main_loop_wait (timeout=1000000000) at ../util/main-loop.c:312
> #4  main_loop_wait (nonblocking=nonblocking@entry=0) at ../util/main-loop.c:603
> #5  0x000002aa1a0f46d4 in qemu_main_loop () at ../softmmu/runstate.c:731
> #6  0x000002aa19f0e312 in qemu_default_main () at ../softmmu/main.c:37
> #7  0x000003ffb512440a in __libc_start_main (main=0x2aa19f0b8d8 <main>, argc=<optimized out>, argv=0x3fffbb7a018, init=<optimized out>, fini=<optimized out>, rtld_fini=0x3ffb8b90e50 <_dl_fini>, stack_end=0x3fffbb79f60) at libc-start.c:308
> #8  0x000002aa19f0e23c in _start () at ../softmmu/main.c:48
> [Inferior 1 (process 1841381) detached]
> 
> ===========================================================
> PROCESS: 1841387
> gitlab-+ 1841387 1841031  0 Mar13 ?        00:00:00 ./qemu-system-x86_64 -qtest unix:/tmp/qtest-1841031.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-1841031.qmp,id=char0 -mon chardev=char0,mode=control -display none -accel kvm -accel tcg -name target,debug-threads=on -m 150M -serial file:/tmp/migration-test-RM5901/dest_serial -incoming unix:/tmp/migration-test-RM5901/migsocket -drive file=/tmp/migration-test-RM5901/bootsect,format=raw -accel qtest
> [New LWP 1841389]
> [New LWP 1841390]
> [New LWP 1841391]
> [New LWP 1841397]
> [Thread debugging using libthread_db enabled]
> Using host libthread_db library "/lib/s390x-linux-gnu/libthread_db.so.1".
> futex_wait_cancelable (private=0, expected=0, futex_word=0x2aa370039c0) at ../sysdeps/nptl/futex-internal.h:183
> 
> Thread 5 (Thread 0x3ff3a1fd900 (LWP 1841397)):
> #0  0x000003ffa3571b32 in __GI___poll (fds=fds@entry=0x3ff2c000b60, nfds=2, nfds@entry=<error reading variable: value has been optimized out>, timeout=timeout@entry=-1) at ../sysdeps/unix/sysv/linux/poll.c:29
> #1  0x000002aa348a4dfe in poll (__timeout=-1, __nfds=<optimized out>, __fds=0x3ff2c000b60) at /usr/include/s390x-linux-gnu/bits/poll2.h:46
> #2  postcopy_ram_fault_thread (opaque=opaque@entry=0x2aa37003800) at ../migration/postcopy-ram.c:952
> #3  0x000002aa34c442ca in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:541
> #4  0x000003ffa3687e66 in start_thread (arg=0x3ff3a1fd900) at pthread_create.c:477
> #5  0x000003ffa357cbe6 in thread_start () at ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 4 (Thread 0x3ff9322b900 (LWP 1841391)):
> #0  futex_wait_cancelable (private=0, expected=0, futex_word=0x2aa3711630c) at ../sysdeps/nptl/futex-internal.h:183
> #1  __pthread_cond_wait_common (abstime=0x0, clockid=0, mutex=0x2aa3551b798 <qemu_global_mutex>, cond=0x2aa371162e0) at pthread_cond_wait.c:508
> #2  __pthread_cond_wait (cond=cond@entry=0x2aa371162e0, mutex=mutex@entry=0x2aa3551b798 <qemu_global_mutex>) at pthread_cond_wait.c:647
> #3  0x000002aa34c44cae in qemu_cond_wait_impl (cond=0x2aa371162e0, mutex=0x2aa3551b798 <qemu_global_mutex>, file=0x2aa34d8b014 "../softmmu/cpus.c", line=<optimized out>) at ../util/qemu-thread-posix.c:225
> #4  0x000002aa3486dafe in qemu_wait_io_event (cpu=cpu@entry=0x2aa370e4160) at ../softmmu/cpus.c:424
> #5  0x000002aa34ab15ca in mttcg_cpu_thread_fn (arg=arg@entry=0x2aa370e4160) at ../accel/tcg/tcg-accel-ops-mttcg.c:123
> #6  0x000002aa34c442ca in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:541
> #7  0x000003ffa3687e66 in start_thread (arg=0x3ff9322b900) at pthread_create.c:477
> #8  0x000003ffa357cbe6 in thread_start () at ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 3 (Thread 0x3ff93b1d900 (LWP 1841390)):
> #0  0x000003ffa3571b32 in __GI___poll (fds=0x3ff44003280, nfds=3, timeout=<optimized out>) at ../sysdeps/unix/sysv/linux/poll.c:29
> #1  0x000003ffa5d54386 in  () at /lib/s390x-linux-gnu/libglib-2.0.so.0
> #2  0x000003ffa5d54790 in g_main_loop_run () at /lib/s390x-linux-gnu/libglib-2.0.so.0
> #3  0x000002aa34af480e in iothread_run (opaque=opaque@entry=0x2aa36f28c00) at ../iothread.c:70
> #4  0x000002aa34c442ca in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:541
> #5  0x000003ffa3687e66 in start_thread (arg=0x3ff93b1d900) at pthread_create.c:477
> #6  0x000003ffa357cbe6 in thread_start () at ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 2 (Thread 0x3ff947a3900 (LWP 1841389)):
> #0  syscall () at ../sysdeps/unix/sysv/linux/s390/s390-64/syscall.S:37
> #1  0x000002aa34c45264 in qemu_futex_wait (val=<optimized out>, f=<optimized out>) at /home/gitlab-runner/builds/FLaZkdt1/0/qemu-project/qemu/include/qemu/futex.h:29
> #2  qemu_event_wait (ev=ev@entry=0x2aa3554cab0 <rcu_call_ready_event>) at ../util/qemu-thread-posix.c:464
> #3  0x000002aa34c4de3a in call_rcu_thread (opaque=opaque@entry=0x0) at ../util/rcu.c:261
> #4  0x000002aa34c442ca in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:541
> #5  0x000003ffa3687e66 in start_thread (arg=0x3ff947a3900) at pthread_create.c:477
> #6  0x000003ffa357cbe6 in thread_start () at ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 1 (Thread 0x3ffa6efe4a0 (LWP 1841387)):
> #0  futex_wait_cancelable (private=0, expected=0, futex_word=0x2aa370039c0) at ../sysdeps/nptl/futex-internal.h:183
> #1  __pthread_cond_wait_common (abstime=0x0, clockid=0, mutex=0x2aa37003968, cond=0x2aa37003998) at pthread_cond_wait.c:508
> #2  __pthread_cond_wait (cond=cond@entry=0x2aa37003998, mutex=mutex@entry=0x2aa37003968) at pthread_cond_wait.c:647
> #3  0x000002aa34c44cae in qemu_cond_wait_impl (cond=0x2aa37003998, mutex=0x2aa37003968, file=0x2aa34e65f06 "../util/qemu-thread-posix.c", line=<optimized out>) at ../util/qemu-thread-posix.c:225
> #4  0x000002aa34c450ce in qemu_sem_wait (sem=0x2aa37003968) at ../util/qemu-thread-posix.c:314
> #5  0x000002aa348a444a in postcopy_ram_incoming_setup (mis=0x2aa37003800, mis@entry=<error reading variable: value has been optimized out>) at ../migration/postcopy-ram.c:1204
> #6  0x000002aa348abb60 in loadvm_postcopy_handle_listen (mis=<optimized out>) at ../migration/savevm.c:2016
> #7  loadvm_process_command (f=0x2aa37201810) at ../migration/savevm.c:2379
> #8  qemu_loadvm_state_main (f=f@entry=0x2aa37201810, mis=0x2aa37003800) at ../migration/savevm.c:2724
> #9  0x000002aa348abeee in loadvm_handle_cmd_packaged (mis=<optimized out>) at ../migration/savevm.c:2248
> #10 loadvm_process_command (f=0x2aa370eb260) at ../migration/savevm.c:2373
> #11 qemu_loadvm_state_main (f=f@entry=0x2aa370eb260, mis=mis@entry=0x2aa37003800) at ../migration/savevm.c:2724
> #12 0x000002aa348acb04 in qemu_loadvm_state (f=0x2aa370eb260) at ../migration/savevm.c:2790
> #13 0x000002aa34899b54 in process_incoming_migration_co (opaque=<optimized out>) at ../migration/migration.c:606
> #14 0x000002aa34c58f16 in coroutine_trampoline (i0=<optimized out>, i1=<optimized out>) at ../util/coroutine-ucontext.c:177
> #15 0x000003ffa34d69c2 in __makecontext_ret () at ../sysdeps/unix/sysv/linux/s390/s390-64/__makecontext_ret.S:23
> [Inferior 1 (process 1841387) detached]
> 

> Process tree:
> migration-test(1840499)-+-qemu-system-i38(1841012)
>                         `-qemu-system-i38(1841019)
> ===========================================================
> PROCESS: 1840499
> gitlab-+ 1840499 1838397  0 Mar13 ?        00:00:02 /home/gitlab-runner/builds/FLaZkdt1/0/qemu-project/qemu/build/tests/qtest/migration-test --tap -k
> [New LWP 1840501]
> [Thread debugging using libthread_db enabled]
> Using host libthread_db library "/lib/s390x-linux-gnu/libthread_db.so.1".
> __libc_recv (fd=fd@entry=5, buf=buf@entry=0x3fff23798b7, len=len@entry=1, flags=flags@entry=0) at ../sysdeps/unix/sysv/linux/recv.c:30
> 30	../sysdeps/unix/sysv/linux/recv.c: No such file or directory.
> 
> Thread 2 (Thread 0x3ffbe3ff900 (LWP 1840501)):
> #0  syscall () at ../sysdeps/unix/sysv/linux/s390/s390-64/syscall.S:37
> #1  0x000002aa029dae34 in qemu_futex_wait (val=<optimized out>, f=<optimized out>) at /home/gitlab-runner/builds/FLaZkdt1/0/qemu-project/qemu/include/qemu/futex.h:29
> #2  qemu_event_wait (ev=ev@entry=0x2aa02b596b8 <rcu_call_ready_event>) at ../util/qemu-thread-posix.c:464
> #3  0x000002aa02a079ea in call_rcu_thread (opaque=opaque@entry=0x0) at ../util/rcu.c:261
> #4  0x000002aa029d9e9a in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:541
> #5  0x000003ffbed87e66 in start_thread (arg=0x3ffbe3ff900) at pthread_create.c:477
> #6  0x000003ffbec7cbe6 in thread_start () at ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 1 (Thread 0x3ffbf46d990 (LWP 1840499)):
> #0  __libc_recv (fd=fd@entry=5, buf=buf@entry=0x3fff23798b7, len=len@entry=1, flags=flags@entry=0) at ../sysdeps/unix/sysv/linux/recv.c:30
> #1  0x000002aa029aba22 in recv (__flags=0, __n=1, __buf=0x3fff23798b7, __fd=5) at /usr/include/s390x-linux-gnu/bits/socket2.h:44
> #2  qmp_fd_receive (fd=<optimized out>) at ../tests/qtest/libqmp.c:73
> #3  0x000002aa029a9b8e in qtest_qmp_receive_dict (s=0x2aa0327d120) at ../tests/qtest/libqtest.c:837
> #4  qtest_qmp_eventwait_ref (event=<optimized out>, s=<optimized out>) at ../tests/qtest/libqtest.c:837
> #5  qtest_qmp_eventwait_ref (s=0x2aa0327d120, event=<optimized out>) at ../tests/qtest/libqtest.c:828
> #6  0x000002aa029a9c1a in qtest_qmp_eventwait (s=<optimized out>, event=<optimized out>) at ../tests/qtest/libqtest.c:850
> #7  0x000002aa0299ec56 in test_postcopy_common (args=0x3fff2379bb8) at ../tests/qtest/migration-test.c:1161
> #8  0x000002aa0299edb4 in test_postcopy_preempt () at ../tests/qtest/migration-test.c:1178
> #9  0x000003ffbef7e608 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
> #10 0x000003ffbef7e392 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
> #11 0x000003ffbef7e392 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
> #12 0x000003ffbef7e392 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
> #13 0x000003ffbef7e392 in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
> #14 0x000003ffbef7eada in g_test_run_suite () from /lib/s390x-linux-gnu/libglib-2.0.so.0
> #15 0x000003ffbef7eb10 in g_test_run () from /lib/s390x-linux-gnu/libglib-2.0.so.0
> #16 0x000002aa0299ab14 in main (argc=<optimized out>, argv=<optimized out>) at ../tests/qtest/migration-test.c:2615
> [Inferior 1 (process 1840499) detached]
> 
> ===========================================================
> PROCESS: 1841012
> gitlab-+ 1841012 1840499  0 Mar13 ?        00:00:06 ./qemu-system-i386 -qtest unix:/tmp/qtest-1840499.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-1840499.qmp,id=char0 -mon chardev=char0,mode=control -display none -accel kvm -accel tcg -name source,debug-threads=on -m 150M -serial file:/tmp/migration-test-8IQB11/src_serial -drive file=/tmp/migration-test-8IQB11/bootsect,format=raw -accel qtest
> [New LWP 1841014]
> [New LWP 1841015]
> [New LWP 1841016]
> [New LWP 1841062]
> [New LWP 1841063]
> [Thread debugging using libthread_db enabled]
> Using host libthread_db library "/lib/s390x-linux-gnu/libthread_db.so.1".
> 0x000003ff9a771c8c in __ppoll (fds=0x2aa396d66e0, nfds=5, timeout=<optimized out>, timeout@entry=0x3ffd40fa048, sigmask=sigmask@entry=0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
> 44	../sysdeps/unix/sysv/linux/ppoll.c: No such file or directory.
> 
> Thread 6 (Thread 0x3ff2bfff900 (LWP 1841063)):
> #0  __libc_sendmsg (fd=<optimized out>, msg=msg@entry=0x3ff2bffa810, flags=flags@entry=0) at ../sysdeps/unix/sysv/linux/sendmsg.c:30
> #1  0x000002aa38343b7a in qio_channel_socket_writev (ioc=<optimized out>, iov=<optimized out>, niov=<optimized out>, fds=<optimized out>, nfds=<optimized out>, flags=0, errp=0x3ff2bffab80) at ../io/channel-socket.c:605
> #2  0x000002aa383491d8 in qio_channel_writev_full (ioc=ioc@entry=0x2aa3a52fa80, iov=0x2aa3a53b300, niov=64, fds=fds@entry=0x0, nfds=nfds@entry=0, flags=0, errp=0x3ff2bffab80) at ../io/channel.c:108
> #3  0x000002aa3834a050 in qio_channel_writev_full_all (ioc=0x2aa3a52fa80, iov=iov@entry=0x2aa396b26b0, niov=<optimized out>, fds=fds@entry=0x0, nfds=nfds@entry=0, flags=0, errp=0x3ff2bffab80) at ../io/channel.c:263
> #4  0x000002aa3834a0fe in qio_channel_writev_all (ioc=<optimized out>, iov=iov@entry=0x2aa396b26b0, niov=<optimized out>, errp=errp@entry=0x3ff2bffab80) at ../io/channel.c:242
> #5  0x000002aa3810d404 in qemu_fflush (f=f@entry=0x2aa396aa670) at ../migration/qemu-file.c:302
> #6  0x000002aa3810d692 in qemu_fflush (f=0x2aa396aa670) at ../migration/qemu-file.c:297
> #7  add_to_iovec (f=f@entry=0x2aa396aa670, buf=<optimized out>, size=size@entry=4096, may_free=<optimized out>) at ../migration/qemu-file.c:510
> #8  0x000002aa3810db76 in qemu_put_buffer_async (f=f@entry=0x2aa396aa670, buf=<error reading variable: value has been optimized out>, size=size@entry=4096, may_free=<optimized out>) at ../migration/qemu-file.c:535
> #9  0x000002aa382b4d00 in save_normal_page (async=<optimized out>, buf=<optimized out>, offset=1175552, block=0x2aa395dabb0, pss=0x3ff24002800) at ../migration/ram.c:1400
> #10 ram_save_page (pss=0x3ff24002800, rs=0x3ff24002800) at ../migration/ram.c:1449
> #11 ram_save_target_page_legacy (rs=0x3ff24002800, pss=0x3ff24002800) at ../migration/ram.c:2381
> #12 0x000002aa382b1c98 in ram_save_host_page (pss=0x3ff24002800, rs=0x3ff24002800) at ../migration/ram.c:2539
> #13 ram_find_and_save_block (rs=rs@entry=0x3ff24002800) at ../migration/ram.c:2620
> #14 0x000002aa382b234c in ram_save_iterate (f=0x2aa396aa670, opaque=<optimized out>) at ../migration/ram.c:3361
> #15 0x000002aa38129a94 in qemu_savevm_state_iterate (f=0x2aa396aa670, postcopy=<optimized out>) at ../migration/savevm.c:1345
> #16 0x000002aa3811cf84 in migration_iteration_run (s=0x2aa39375710) at ../migration/migration.c:3896
> #17 migration_thread (opaque=opaque@entry=0x2aa39375710) at ../migration/migration.c:4124
> #18 0x000002aa384bb91a in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:541
> #19 0x000003ff9a887e66 in start_thread (arg=0x3ff2bfff900) at pthread_create.c:477
> #20 0x000003ff9a77cbe6 in thread_start () at ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 5 (Thread 0x3ff30ff9900 (LWP 1841062)):
> #0  __libc_recvmsg (fd=<optimized out>, msg=msg@entry=0x3ff30ff49f0, flags=flags@entry=0) at ../sysdeps/unix/sysv/linux/recvmsg.c:30
> #1  0x000002aa38343e34 in qio_channel_socket_readv (ioc=<optimized out>, iov=<optimized out>, niov=<optimized out>, fds=0x0, nfds=0x0, flags=0, errp=0x3ff30ff4ca8) at ../io/channel-socket.c:532
> #2  0x000002aa383490c0 in qio_channel_readv_full (ioc=0x2aa3a52fa80, iov=iov@entry=0x3ff30ff4bf0, niov=niov@entry=1, fds=fds@entry=0x0, nfds=nfds@entry=0x0, flags=0, errp=0x3ff30ff4ca8) at ../io/channel.c:74
> #3  0x000002aa38349346 in qio_channel_read (ioc=<optimized out>, buf=buf@entry=0x2aa395b9548 "", buflen=buflen@entry=32768, errp=errp@entry=0x3ff30ff4ca8) at ../io/channel.c:314
> #4  0x000002aa3810d29e in qemu_fill_buffer (f=0x2aa395b9510) at ../migration/qemu-file.c:415
> #5  0x000002aa3810de78 in qemu_peek_byte (f=0x2aa395b9510, offset=<optimized out>) at ../migration/qemu-file.c:707
> #6  0x000002aa3810e11a in qemu_get_byte (f=0x2aa395b9510) at ../migration/qemu-file.c:720
> #7  qemu_get_be16 (f=f@entry=0x2aa395b9510) at ../migration/qemu-file.c:800
> #8  0x000002aa38119948 in source_return_path_thread (opaque=opaque@entry=0x2aa39375710) at ../migration/migration.c:2995
> #9  0x000002aa384bb91a in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:541
> #10 0x000003ff9a887e66 in start_thread (arg=0x3ff30ff9900) at pthread_create.c:477
> #11 0x000003ff9a77cbe6 in thread_start () at ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 4 (Thread 0x3ff8a42b900 (LWP 1841016)):
> #0  futex_wait_cancelable (private=0, expected=0, futex_word=0x2aa396d5718) at ../sysdeps/nptl/futex-internal.h:183
> #1  __pthread_cond_wait_common (abstime=0x0, clockid=0, mutex=0x2aa38d8fcf0 <qemu_global_mutex>, cond=0x2aa396d56f0) at pthread_cond_wait.c:508
> #2  __pthread_cond_wait (cond=cond@entry=0x2aa396d56f0, mutex=mutex@entry=0x2aa38d8fcf0 <qemu_global_mutex>) at pthread_cond_wait.c:647
> #3  0x000002aa384bc2fe in qemu_cond_wait_impl (cond=0x2aa396d56f0, mutex=0x2aa38d8fcf0 <qemu_global_mutex>, file=0x2aa38602664 "../softmmu/cpus.c", line=<optimized out>) at ../util/qemu-thread-posix.c:225
> #4  0x000002aa380ed06e in qemu_wait_io_event (cpu=cpu@entry=0x2aa396a5980) at ../softmmu/cpus.c:424
> #5  0x000002aa38328c1a in mttcg_cpu_thread_fn (arg=arg@entry=0x2aa396a5980) at ../accel/tcg/tcg-accel-ops-mttcg.c:123
> #6  0x000002aa384bb91a in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:541
> #7  0x000003ff9a887e66 in start_thread (arg=0x3ff8a42b900) at pthread_create.c:477
> #8  0x000003ff9a77cbe6 in thread_start () at ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 3 (Thread 0x3ff8ad1d900 (LWP 1841015)):
> #0  0x000003ff9a771b32 in __GI___poll (fds=0x3ff3c003280, nfds=3, timeout=<optimized out>) at ../sysdeps/unix/sysv/linux/poll.c:29
> #1  0x000003ff9cf54386 in  () at /lib/s390x-linux-gnu/libglib-2.0.so.0
> #2  0x000003ff9cf54790 in g_main_loop_run () at /lib/s390x-linux-gnu/libglib-2.0.so.0
> #3  0x000002aa3836be5e in iothread_run (opaque=opaque@entry=0x2aa39477800) at ../iothread.c:70
> #4  0x000002aa384bb91a in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:541
> #5  0x000003ff9a887e66 in start_thread (arg=0x3ff8ad1d900) at pthread_create.c:477
> #6  0x000003ff9a77cbe6 in thread_start () at ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 2 (Thread 0x3ff8b9a3900 (LWP 1841014)):
> #0  syscall () at ../sysdeps/unix/sysv/linux/s390/s390-64/syscall.S:37
> #1  0x000002aa384bc8b4 in qemu_futex_wait (val=<optimized out>, f=<optimized out>) at /home/gitlab-runner/builds/FLaZkdt1/0/qemu-project/qemu/include/qemu/futex.h:29
> #2  qemu_event_wait (ev=ev@entry=0x2aa38dbffc8 <rcu_call_ready_event>) at ../util/qemu-thread-posix.c:464
> #3  0x000002aa384c548a in call_rcu_thread (opaque=opaque@entry=0x0) at ../util/rcu.c:261
> #4  0x000002aa384bb91a in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:541
> #5  0x000003ff9a887e66 in start_thread (arg=0x3ff8b9a3900) at pthread_create.c:477
> #6  0x000003ff9a77cbe6 in thread_start () at ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 1 (Thread 0x3ff9e0fe4a0 (LWP 1841012)):
> #0  0x000003ff9a771c8c in __ppoll (fds=0x2aa396d66e0, nfds=5, timeout=<optimized out>, timeout@entry=0x3ffd40fa048, sigmask=sigmask@entry=0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
> #1  0x000002aa384d16ca in ppoll (__ss=0x0, __timeout=0x3ffd40fa048, __nfds=<optimized out>, __fds=<optimized out>) at /usr/include/s390x-linux-gnu/bits/poll2.h:77
> #2  qemu_poll_ns (fds=<optimized out>, nfds=<optimized out>, timeout=timeout@entry=1000000000) at ../util/qemu-timer.c:351
> #3  0x000002aa384ce6e0 in os_host_main_loop_wait (timeout=1000000000) at ../util/main-loop.c:312
> #4  main_loop_wait (nonblocking=nonblocking@entry=0) at ../util/main-loop.c:603
> #5  0x000002aa380f3c44 in qemu_main_loop () at ../softmmu/runstate.c:731
> #6  0x000002aa37f0d882 in qemu_default_main () at ../softmmu/main.c:37
> #7  0x000003ff9a6a440a in __libc_start_main (main=0x2aa37f0ae48 <main>, argc=<optimized out>, argv=0x3ffd40fa498, init=<optimized out>, fini=<optimized out>, rtld_fini=0x3ff9e110e50 <_dl_fini>, stack_end=0x3ffd40fa3e0) at libc-start.c:308
> #8  0x000002aa37f0d7ac in _start () at ../softmmu/main.c:48
> [Inferior 1 (process 1841012) detached]
> 
> ===========================================================
> PROCESS: 1841019
> gitlab-+ 1841019 1840499  0 Mar13 ?        00:00:00 ./qemu-system-i386 -qtest unix:/tmp/qtest-1840499.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-1840499.qmp,id=char0 -mon chardev=char0,mode=control -display none -accel kvm -accel tcg -name target,debug-threads=on -m 150M -serial file:/tmp/migration-test-8IQB11/dest_serial -incoming unix:/tmp/migration-test-8IQB11/migsocket -drive file=/tmp/migration-test-8IQB11/bootsect,format=raw -accel qtest
> [New LWP 1841021]
> [New LWP 1841022]
> [New LWP 1841023]
> [New LWP 1841067]
> [Thread debugging using libthread_db enabled]
> Using host libthread_db library "/lib/s390x-linux-gnu/libthread_db.so.1".
> futex_wait_cancelable (private=0, expected=0, futex_word=0x2aa3a92e1c0) at ../sysdeps/nptl/futex-internal.h:183
> 183	../sysdeps/nptl/futex-internal.h: No such file or directory.
> 
> Thread 5 (Thread 0x3ff4a8ff900 (LWP 1841067)):
> #0  0x000003ffb0071b32 in __GI___poll (fds=fds@entry=0x3ff40000b60, nfds=2, nfds@entry=<error reading variable: value has been optimized out>, timeout=timeout@entry=-1) at ../sysdeps/unix/sysv/linux/poll.c:29
> #1  0x000002aa382a436e in poll (__timeout=-1, __nfds=<optimized out>, __fds=0x3ff40000b60) at /usr/include/s390x-linux-gnu/bits/poll2.h:46
> #2  postcopy_ram_fault_thread (opaque=opaque@entry=0x2aa3a92e000) at ../migration/postcopy-ram.c:952
> #3  0x000002aa3863b91a in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:541
> #4  0x000003ffb0187e66 in start_thread (arg=0x3ff4a8ff900) at pthread_create.c:477
> #5  0x000003ffb007cbe6 in thread_start () at ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 4 (Thread 0x3ff5b7fe900 (LWP 1841023)):
> #0  futex_wait_cancelable (private=0, expected=0, futex_word=0x2aa3aa3e69c) at ../sysdeps/nptl/futex-internal.h:183
> #1  __pthread_cond_wait_common (abstime=0x0, clockid=0, mutex=0x2aa38f0fcf0 <qemu_global_mutex>, cond=0x2aa3aa3e670) at pthread_cond_wait.c:508
> #2  __pthread_cond_wait (cond=cond@entry=0x2aa3aa3e670, mutex=mutex@entry=0x2aa38f0fcf0 <qemu_global_mutex>) at pthread_cond_wait.c:647
> #3  0x000002aa3863c2fe in qemu_cond_wait_impl (cond=0x2aa3aa3e670, mutex=0x2aa38f0fcf0 <qemu_global_mutex>, file=0x2aa38782664 "../softmmu/cpus.c", line=<optimized out>) at ../util/qemu-thread-posix.c:225
> #4  0x000002aa3826d06e in qemu_wait_io_event (cpu=cpu@entry=0x2aa3aa0e980) at ../softmmu/cpus.c:424
> #5  0x000002aa384a8c1a in mttcg_cpu_thread_fn (arg=arg@entry=0x2aa3aa0e980) at ../accel/tcg/tcg-accel-ops-mttcg.c:123
> #6  0x000002aa3863b91a in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:541
> #7  0x000003ffb0187e66 in start_thread (arg=0x3ff5b7fe900) at pthread_create.c:477
> #8  0x000003ffb007cbe6 in thread_start () at ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 3 (Thread 0x3ff5bfff900 (LWP 1841022)):
> #0  0x000003ffb0071b32 in __GI___poll (fds=0x3ff54003280, nfds=3, timeout=<optimized out>) at ../sysdeps/unix/sysv/linux/poll.c:29
> #1  0x000003ffb2854386 in  () at /lib/s390x-linux-gnu/libglib-2.0.so.0
> #2  0x000003ffb2854790 in g_main_loop_run () at /lib/s390x-linux-gnu/libglib-2.0.so.0
> #3  0x000002aa384ebe5e in iothread_run (opaque=opaque@entry=0x2aa3a7e0800) at ../iothread.c:70
> #4  0x000002aa3863b91a in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:541
> #5  0x000003ffb0187e66 in start_thread (arg=0x3ff5bfff900) at pthread_create.c:477
> #6  0x000003ffb007cbe6 in thread_start () at ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 2 (Thread 0x3ffa12a3900 (LWP 1841021)):
> #0  syscall () at ../sysdeps/unix/sysv/linux/s390/s390-64/syscall.S:37
> #1  0x000002aa3863c8b4 in qemu_futex_wait (val=<optimized out>, f=<optimized out>) at /home/gitlab-runner/builds/FLaZkdt1/0/qemu-project/qemu/include/qemu/futex.h:29
> #2  qemu_event_wait (ev=ev@entry=0x2aa38f3ffc8 <rcu_call_ready_event>) at ../util/qemu-thread-posix.c:464
> #3  0x000002aa3864548a in call_rcu_thread (opaque=opaque@entry=0x0) at ../util/rcu.c:261
> #4  0x000002aa3863b91a in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:541
> #5  0x000003ffb0187e66 in start_thread (arg=0x3ffa12a3900) at pthread_create.c:477
> #6  0x000003ffb007cbe6 in thread_start () at ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 1 (Thread 0x3ffb39fe4a0 (LWP 1841019)):
> #0  futex_wait_cancelable (private=0, expected=0, futex_word=0x2aa3a92e1c0) at ../sysdeps/nptl/futex-internal.h:183
> #1  __pthread_cond_wait_common (abstime=0x0, clockid=0, mutex=0x2aa3a92e168, cond=0x2aa3a92e198) at pthread_cond_wait.c:508
> #2  __pthread_cond_wait (cond=cond@entry=0x2aa3a92e198, mutex=mutex@entry=0x2aa3a92e168) at pthread_cond_wait.c:647
> #3  0x000002aa3863c2fe in qemu_cond_wait_impl (cond=0x2aa3a92e198, mutex=0x2aa3a92e168, file=0x2aa3885b73e "../util/qemu-thread-posix.c", line=<optimized out>) at ../util/qemu-thread-posix.c:225
> #4  0x000002aa3863c71e in qemu_sem_wait (sem=0x2aa3a92e168) at ../util/qemu-thread-posix.c:314
> #5  0x000002aa382a39ba in postcopy_ram_incoming_setup (mis=0x2aa3a92e000, mis@entry=<error reading variable: value has been optimized out>) at ../migration/postcopy-ram.c:1204
> #6  0x000002aa382ab0d0 in loadvm_postcopy_handle_listen (mis=<optimized out>) at ../migration/savevm.c:2016
> #7  loadvm_process_command (f=0x2aa3aa5c7d0) at ../migration/savevm.c:2379
> #8  qemu_loadvm_state_main (f=f@entry=0x2aa3aa5c7d0, mis=0x2aa3a92e000) at ../migration/savevm.c:2724
> #9  0x000002aa382ab45e in loadvm_handle_cmd_packaged (mis=<optimized out>) at ../migration/savevm.c:2248
> #10 loadvm_process_command (f=0x2aa3aa135f0) at ../migration/savevm.c:2373
> #11 qemu_loadvm_state_main (f=f@entry=0x2aa3aa135f0, mis=mis@entry=0x2aa3a92e000) at ../migration/savevm.c:2724
> #12 0x000002aa382ac074 in qemu_loadvm_state (f=0x2aa3aa135f0) at ../migration/savevm.c:2790
> #13 0x000002aa382990c4 in process_incoming_migration_co (opaque=<optimized out>) at ../migration/migration.c:606
> #14 0x000002aa38650566 in coroutine_trampoline (i0=<optimized out>, i1=<optimized out>) at ../util/coroutine-ucontext.c:177
> #15 0x000003ffaffd69c2 in __makecontext_ret () at ../sysdeps/unix/sysv/linux/s390/s390-64/__makecontext_ret.S:23
> [Inferior 1 (process 1841019) detached]
> 

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


