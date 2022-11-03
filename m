Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 490CE618AFB
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 23:01:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqiFa-00085W-Au; Thu, 03 Nov 2022 17:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqiFX-000854-6U
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 17:59:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqiFU-0002s6-UX
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 17:59:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667512784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hYukSrmFJKZ8/0iliA96o0czGm6EYOCv9f4DD4yfzRE=;
 b=dxOtXEWioiH+wX5OicKyKQ7YegL/XSMjh5Y1eM397P3I4Jr0mU0xwdYx/ihfixjO89BSqf
 Zq+Xp9iLfaRhvc8+zo+zz8tiEFqA+VrV7g+vLuZO5TByX1edzyuPrV8aoXHBJ2NXFeGefU
 ew0ir4mFvCnGH82+JYzGSOE5PlS2fWg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-584-j3JhNRIMPU6oB63khUAHfA-1; Thu, 03 Nov 2022 17:59:42 -0400
X-MC-Unique: j3JhNRIMPU6oB63khUAHfA-1
Received: by mail-wm1-f69.google.com with SMTP id
 v188-20020a1cacc5000000b003cf76c4ae66so3245619wme.7
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 14:59:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hYukSrmFJKZ8/0iliA96o0czGm6EYOCv9f4DD4yfzRE=;
 b=YVgF871vWxn4vL9wzsk4g4NaukDkTLWNMYO9ROwjkId6I22QZGqHhSK/9pKn871pQP
 6xmTG+6sWic4p0IpjSaMVA56YL4M/pqt8U2sstv4gUQSfPnLQGFopCepV6sD7yZCbIGT
 /mxW+nX9s/+Klzi0RJ5i1a3zcV9hkNXDleaABt5KQ1X4lTuZ0nFBR5I284cX2a0CHFrA
 QaaBP56D4PiRuWrm1GbIvkcTORMfjoUoi96xXnMgzCp9Gvh6wD3zoOTBW/l/epf6bM5y
 JeJrNpfTSyxrRSA0rkQ7cG9b16QYH35rEAlef7BQLFhZEtGbxO+iXF8d+KQY+phM0jFN
 a9Fg==
X-Gm-Message-State: ACrzQf0uJEFkU0QO2KQoiJC9Jw3wAqF8td6lta4khNxnqFbCsXxq+ilX
 QUx6HfeL9Hgy9+3/DdlY8c58RlswdhtfnpVQTT4BR1Zh13jwZhvX97r42ogxP3jDZvPfE9KGU/9
 waepgMnBCskWWwlo=
X-Received: by 2002:a5d:424a:0:b0:23a:4ac:397e with SMTP id
 s10-20020a5d424a000000b0023a04ac397emr1033873wrr.716.1667512780718; 
 Thu, 03 Nov 2022 14:59:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6+CiMJZn7pnyDGLBEQuprk4ZDRga+Pf8+qDJ4c5ocP26g7+8xNukwXtFrnDNRGjoraHDnM/g==
X-Received: by 2002:a5d:424a:0:b0:23a:4ac:397e with SMTP id
 s10-20020a5d424a000000b0023a04ac397emr1033861wrr.716.1667512780394; 
 Thu, 03 Nov 2022 14:59:40 -0700 (PDT)
Received: from redhat.com ([2.52.149.81]) by smtp.gmail.com with ESMTPSA id
 v4-20020a5d6784000000b00235da296623sm1808083wru.31.2022.11.03.14.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 14:59:39 -0700 (PDT)
Date: Thu, 3 Nov 2022 17:59:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL v2 00/82] pci,pc,virtio: features, tests, fixes, cleanups
Message-ID: <20221103175638-mutt-send-email-mst@kernel.org>
References: <20221102160336.616599-1-mst@redhat.com> <Y2LJX2HHiHpiKzKd@fedora>
 <20221103081148-mutt-send-email-mst@kernel.org>
 <CAJSP0QXvJwvO311ELJZBQZx-M3aKvRgEfk6PX7So8n9n0X3HhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJSP0QXvJwvO311ELJZBQZx-M3aKvRgEfk6PX7So8n9n0X3HhQ@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Nov 03, 2022 at 09:29:56AM -0400, Stefan Hajnoczi wrote:
> On Thu, 3 Nov 2022 at 08:14, Michael S. Tsirkin <mst@redhat.com> wrote:
> > On Wed, Nov 02, 2022 at 03:47:43PM -0400, Stefan Hajnoczi wrote:
> > > On Wed, Nov 02, 2022 at 12:02:14PM -0400, Michael S. Tsirkin wrote:
> > > > Changes from v1:
> > > >
> > > > Applied and squashed fixes by Igor, Lei He, Hesham Almatary for
> > > > bugs that tripped up the pipeline.
> > > > Updated expected files for core-count test.
> > >
> > > Several "make check" CI failures have occurred. They look like they are
> > > related. Here is one (see the URLs at the bottom of this email for more
> > > details):
> > >
> > > 17/106 ERROR:../tests/qtest/qos-test.c:191:subprocess_run_one_test: child process (/arm/virt/virtio-mmio/virtio-bus/virtio-net-device/virtio-net/virtio-net-tests/vhost-user/flags-mismatch/subprocess [8609]) failed unexpectedly ERROR
> > >  17/106 qemu:qtest+qtest-arm / qtest-arm/qos-test                     ERROR          31.44s   killed by signal 6 SIGABRT
> > > >>> G_TEST_DBUS_DAEMON=/builds/qemu-project/qemu/tests/dbus-vmstate-daemon.sh MALLOC_PERTURB_=49 QTEST_QEMU_IMG=./qemu-img QTEST_QEMU_BINARY=./qemu-system-arm QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon /builds/qemu-project/qemu/build/tests/qtest/qos-test --tap -k
> > > ――――――――――――――――――――――――――――――――――――― ✀  ―――――――――――――――――――――――――――――――――――――
> > > stderr:
> > > qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
> > > qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
> > > qemu-system-arm: Failed to set msg fds.
> > > qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
> > > qemu-system-arm: -chardev socket,id=chr-reconnect,path=/tmp/vhost-test-6PT2U1/reconnect.sock,server=on: info: QEMU waiting for connection on: disconnected:unix:/tmp/vhost-test-6PT2U1/reconnect.sock,server=on
> > > qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
> > > qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
> > > qemu-system-arm: Failed to set msg fds.
> > > qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
> > > qemu-system-arm: -chardev socket,id=chr-connect-fail,path=/tmp/vhost-test-H8G7U1/connect-fail.sock,server=on: info: QEMU waiting for connection on: disconnected:unix:/tmp/vhost-test-H8G7U1/connect-fail.sock,server=on
> > > qemu-system-arm: -netdev vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: Failed to read msg header. Read 0 instead of 12. Original request 1.
> > > qemu-system-arm: -netdev vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: vhost_backend_init failed: Protocol error
> > > qemu-system-arm: -netdev vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: failed to init vhost_net for queue 0
> > > qemu-system-arm: -netdev vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: info: QEMU waiting for connection on: disconnected:unix:/tmp/vhost-test-H8G7U1/connect-fail.sock,server=on
> > > qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
> > > qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
> > > qemu-system-arm: Failed to set msg fds.
> > > qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
> > > qemu-system-arm: -chardev socket,id=chr-flags-mismatch,path=/tmp/vhost-test-94UYU1/flags-mismatch.sock,server=on: info: QEMU waiting for connection on: disconnected:unix:/tmp/vhost-test-94UYU1/flags-mismatch.sock,server=on
> > > qemu-system-arm: Failed to write msg. Wrote -1 instead of 52.
> > > qemu-system-arm: vhost_set_mem_table failed: Invalid argument (22)
> > > qemu-system-arm: Failed to set msg fds.
> > > qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
> > > UndefinedBehaviorSanitizer:DEADLYSIGNAL
> > > ==8618==ERROR: UndefinedBehaviorSanitizer: SEGV on unknown address 0x000000000000 (pc 0x55e34deccab0 bp 0x000000000000 sp 0x7ffc94894710 T8618)
> > > ==8618==The signal is caused by a READ memory access.
> > > ==8618==Hint: address points to the zero page.
> > >     #0 0x55e34deccab0 in ldl_he_p /builds/qemu-project/qemu/include/qemu/bswap.h:301:5
> > >     #1 0x55e34deccab0 in ldn_he_p /builds/qemu-project/qemu/include/qemu/bswap.h:440:1
> > >     #2 0x55e34deccab0 in flatview_write_continue /builds/qemu-project/qemu/build/../softmmu/physmem.c:2824:19
> > >     #3 0x55e34dec9f21 in flatview_write /builds/qemu-project/qemu/build/../softmmu/physmem.c:2867:12
> > >     #4 0x55e34dec9f21 in address_space_write /builds/qemu-project/qemu/build/../softmmu/physmem.c:2963:18
> > >     #5 0x55e34decace7 in address_space_unmap /builds/qemu-project/qemu/build/../softmmu/physmem.c:3306:9
> > >     #6 0x55e34de6d4ec in vhost_memory_unmap /builds/qemu-project/qemu/build/../hw/virtio/vhost.c:342:9
> > >     #7 0x55e34de6d4ec in vhost_virtqueue_stop /builds/qemu-project/qemu/build/../hw/virtio/vhost.c:1242:5
> > >     #8 0x55e34de72904 in vhost_dev_stop /builds/qemu-project/qemu/build/../hw/virtio/vhost.c:1882:9
> > >     #9 0x55e34d890514 in vhost_net_stop_one /builds/qemu-project/qemu/build/../hw/net/vhost_net.c:331:5
> > >     #10 0x55e34d88fef6 in vhost_net_start /builds/qemu-project/qemu/build/../hw/net/vhost_net.c:404:13
> > >     #11 0x55e34de0bec6 in virtio_net_vhost_status /builds/qemu-project/qemu/build/../hw/net/virtio-net.c:307:13
> > >     #12 0x55e34de0bec6 in virtio_net_set_status /builds/qemu-project/qemu/build/../hw/net/virtio-net.c:388:5
> > >     #13 0x55e34de5e409 in virtio_set_status /builds/qemu-project/qemu/build/../hw/virtio/virtio.c:2442:9
> > >     #14 0x55e34da22a50 in virtio_mmio_write /builds/qemu-project/qemu/build/../hw/virtio/virtio-mmio.c:428:9
> > >     #15 0x55e34deb44a6 in memory_region_write_accessor /builds/qemu-project/qemu/build/../softmmu/memory.c:493:5
> > >     #16 0x55e34deb428a in access_with_adjusted_size /builds/qemu-project/qemu/build/../softmmu/memory.c:555:18
> > >     #17 0x55e34deb402d in memory_region_dispatch_write /builds/qemu-project/qemu/build/../softmmu/memory.c
> > >     #18 0x55e34deccaf1 in flatview_write_continue /builds/qemu-project/qemu/build/../softmmu/physmem.c:2825:23
> > >     #19 0x55e34dec9f21 in flatview_write /builds/qemu-project/qemu/build/../softmmu/physmem.c:2867:12
> > >     #20 0x55e34dec9f21 in address_space_write /builds/qemu-project/qemu/build/../softmmu/physmem.c:2963:18
> > >     #21 0x55e34ded0bf6 in qtest_process_command /builds/qemu-project/qemu/build/../softmmu/qtest.c
> > >     #22 0x55e34ded008d in qtest_process_inbuf /builds/qemu-project/qemu/build/../softmmu/qtest.c:796:9
> > >     #23 0x55e34e109b02 in tcp_chr_read /builds/qemu-project/qemu/build/../chardev/char-socket.c:508:13
> > >     #24 0x7fc6c665d0ae in g_main_context_dispatch (/lib64/libglib-2.0.so.0+0x550ae)
> > >     #25 0x55e34e1fc1bc in glib_pollfds_poll /builds/qemu-project/qemu/build/../util/main-loop.c:297:9
> > >     #26 0x55e34e1fc1bc in os_host_main_loop_wait /builds/qemu-project/qemu/build/../util/main-loop.c:320:5
> > >     #27 0x55e34e1fc1bc in main_loop_wait /builds/qemu-project/qemu/build/../util/main-loop.c:596:11
> > >     #28 0x55e34da52de6 in qemu_main_loop /builds/qemu-project/qemu/build/../softmmu/runstate.c:739:9
> > >     #29 0x55e34d60a4f5 in qemu_default_main /builds/qemu-project/qemu/build/../softmmu/main.c:37:14
> > >     #30 0x7fc6c43a5eaf in __libc_start_call_main (/lib64/libc.so.6+0x3feaf)
> > >     #31 0x7fc6c43a5f5f in __libc_start_main@GLIBC_2.2.5 (/lib64/libc.so.6+0x3ff5f)
> > >     #32 0x55e34d5e1094 in _start (/builds/qemu-project/qemu/build/qemu-system-arm+0xc17094)
> > > UndefinedBehaviorSanitizer can not provide additional info.
> > > SUMMARY: UndefinedBehaviorSanitizer: SEGV /builds/qemu-project/qemu/include/qemu/bswap.h:301:5 in ldl_he_p
> > > ==8618==ABORTING
> > > Broken pipe
> > > ../tests/qtest/libqtest.c:179: kill_qemu() tried to terminate QEMU process but encountered exit status 1 (expected 0)
> > > **
> > > ERROR:../tests/qtest/qos-test.c:191:subprocess_run_one_test: child process (/arm/virt/virtio-mmio/virtio-bus/virtio-net-device/virtio-net/virtio-net-tests/vhost-user/flags-mismatch/subprocess [8609]) failed unexpectedly
> > > (test program exited with status code -6)
> > >
> > > https://gitlab.com/qemu-project/qemu/-/jobs/3265209698
> > > https://gitlab.com/qemu-project/qemu/-/pipelines/683909108
> > >
> > > Stefan
> >
> >
> > Ugh. I need to build with ubsan to reproduce yes? didn't trigger for me
> > I am wondering how to bisect on gitlab.
> 
> I searched for "clang-system" (the name of the job) in .gitlab-ci.d to
> get the job commands. The GitLab job output also contains details of
> the commands that were run (unfortunately it doesn't expand
> environment variables so some aspects are not visible from the GitLab
> output).
> 
> That led to the following local command-line:
> 
> $ git checkout 645ec851
> $ ./configure --enable-werror --disable-docs --target-list=arm-softmmu
> --cc=clang --cxx=clang++ --extra-cflags=-fsanitize=undefined
> --extra-cflags=-fno-sanitize-recover=undefined && make check-qtest
> 
> It reproduces locally on my Fedora 36 machine.
> 
> Stefan

Does not reproduce locally for me :(

With some guessing I figured out this is the 1st bad commit:

virtio: re-order vm_running and use_started checks

it's a bugfix not easy to revert ...

-- 
MST


