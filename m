Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC6A617C42
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 13:13:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqZ6C-0000if-LC; Thu, 03 Nov 2022 08:13:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqZ5q-0000dc-Kv
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 08:13:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqZ5o-000445-4o
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 08:13:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667477586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qeM67DwI3GKxBfWvDZc8wYzApDP0RUGaYJ394POK8cU=;
 b=PAg5dzspG6iGyDEUQkymBu0GeZHK/1QrWMGoITQwzT4SwWhCgclJQvgsXXKI936oNqgjKt
 jZCG4DyHgSvvdThUnW+mTqyDWZaEzcpt3nzTZWT55xZkBG2LJAnmsH9nqGp9qGI3pseiHl
 9HC3MY7b+YqjTbb3rbFYzcJa9BcsW/M=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-518-46W90zz_OIeZQGe_REdfAQ-1; Thu, 03 Nov 2022 08:13:05 -0400
X-MC-Unique: 46W90zz_OIeZQGe_REdfAQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 o13-20020adfa10d000000b00232c00377a0so426937wro.13
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 05:13:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qeM67DwI3GKxBfWvDZc8wYzApDP0RUGaYJ394POK8cU=;
 b=CPDDClhNJarwbUkIixT5j0rLZaau5vT4CzGhN3RjpFrtPh2bORm3SJH6R6RUKDCmUe
 CWUJUXrA14bgLOTWLbZaqrDW9HqShmSpdKkoIuE1AaIFYRxmZthCI0rYyJKRx1H2KNRm
 ekPId1RMRJs/wh9qDJO5MExRc0yDBi+i44eVkro3jxVZg1YMGlNyS61gHGiw8nDKTjsf
 32EY/WNNOVNc5F9vxKV8d31VfIEao466x+z1jSiYqCcGKRxA77KZ4o24YMZeKDVjqbnY
 oE+E0t318tYGiM+v4uJt+Ca3B2CtA/ONAbqLAmVqcdf0UteGP0PUvFWG20LdXEYFslF3
 Vb3w==
X-Gm-Message-State: ACrzQf0H2XuFA2maZ4Xh5MfEG1Jg2IdX+ikt4NdSGuzsOFYrOo+HsEqB
 BXx3gzHlP6dR2+414+zMEQaaiEPU0o+HNflk92nExFI21n9oQkDj7pXqfUJOkuHEutRBJhqxP0v
 ZDH3bPMVkkc04nIc=
X-Received: by 2002:a05:600c:3487:b0:3cf:82bc:ec2b with SMTP id
 a7-20020a05600c348700b003cf82bcec2bmr7923892wmq.83.1667477583984; 
 Thu, 03 Nov 2022 05:13:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5gTmgPfeUyGxpts/y3D9rXaodtyYHpt36VxlCSlJwYU1fRZA50rMi/Lplg2G1rzjljQznPEw==
X-Received: by 2002:a05:600c:3487:b0:3cf:82bc:ec2b with SMTP id
 a7-20020a05600c348700b003cf82bcec2bmr7923873wmq.83.1667477583592; 
 Thu, 03 Nov 2022 05:13:03 -0700 (PDT)
Received: from redhat.com ([2.55.58.252]) by smtp.gmail.com with ESMTPSA id
 h1-20020a05600c350100b003c6c182bef9sm5869688wmq.36.2022.11.03.05.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 05:13:03 -0700 (PDT)
Date: Thu, 3 Nov 2022 08:13:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL v2 00/82] pci,pc,virtio: features, tests, fixes, cleanups
Message-ID: <20221103081148-mutt-send-email-mst@kernel.org>
References: <20221102160336.616599-1-mst@redhat.com> <Y2LJX2HHiHpiKzKd@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y2LJX2HHiHpiKzKd@fedora>
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

On Wed, Nov 02, 2022 at 03:47:43PM -0400, Stefan Hajnoczi wrote:
> On Wed, Nov 02, 2022 at 12:02:14PM -0400, Michael S. Tsirkin wrote:
> > Changes from v1:
> > 
> > Applied and squashed fixes by Igor, Lei He, Hesham Almatary for
> > bugs that tripped up the pipeline.
> > Updated expected files for core-count test.
> 
> Several "make check" CI failures have occurred. They look like they are
> related. Here is one (see the URLs at the bottom of this email for more
> details):
> 
> 17/106 ERROR:../tests/qtest/qos-test.c:191:subprocess_run_one_test: child process (/arm/virt/virtio-mmio/virtio-bus/virtio-net-device/virtio-net/virtio-net-tests/vhost-user/flags-mismatch/subprocess [8609]) failed unexpectedly ERROR
>  17/106 qemu:qtest+qtest-arm / qtest-arm/qos-test                     ERROR          31.44s   killed by signal 6 SIGABRT
> >>> G_TEST_DBUS_DAEMON=/builds/qemu-project/qemu/tests/dbus-vmstate-daemon.sh MALLOC_PERTURB_=49 QTEST_QEMU_IMG=./qemu-img QTEST_QEMU_BINARY=./qemu-system-arm QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon /builds/qemu-project/qemu/build/tests/qtest/qos-test --tap -k
> ――――――――――――――――――――――――――――――――――――― ✀  ―――――――――――――――――――――――――――――――――――――
> stderr:
> qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
> qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
> qemu-system-arm: Failed to set msg fds.
> qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
> qemu-system-arm: -chardev socket,id=chr-reconnect,path=/tmp/vhost-test-6PT2U1/reconnect.sock,server=on: info: QEMU waiting for connection on: disconnected:unix:/tmp/vhost-test-6PT2U1/reconnect.sock,server=on
> qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
> qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
> qemu-system-arm: Failed to set msg fds.
> qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
> qemu-system-arm: -chardev socket,id=chr-connect-fail,path=/tmp/vhost-test-H8G7U1/connect-fail.sock,server=on: info: QEMU waiting for connection on: disconnected:unix:/tmp/vhost-test-H8G7U1/connect-fail.sock,server=on
> qemu-system-arm: -netdev vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: Failed to read msg header. Read 0 instead of 12. Original request 1.
> qemu-system-arm: -netdev vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: vhost_backend_init failed: Protocol error
> qemu-system-arm: -netdev vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: failed to init vhost_net for queue 0
> qemu-system-arm: -netdev vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: info: QEMU waiting for connection on: disconnected:unix:/tmp/vhost-test-H8G7U1/connect-fail.sock,server=on
> qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
> qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
> qemu-system-arm: Failed to set msg fds.
> qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
> qemu-system-arm: -chardev socket,id=chr-flags-mismatch,path=/tmp/vhost-test-94UYU1/flags-mismatch.sock,server=on: info: QEMU waiting for connection on: disconnected:unix:/tmp/vhost-test-94UYU1/flags-mismatch.sock,server=on
> qemu-system-arm: Failed to write msg. Wrote -1 instead of 52.
> qemu-system-arm: vhost_set_mem_table failed: Invalid argument (22)
> qemu-system-arm: Failed to set msg fds.
> qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
> UndefinedBehaviorSanitizer:DEADLYSIGNAL
> ==8618==ERROR: UndefinedBehaviorSanitizer: SEGV on unknown address 0x000000000000 (pc 0x55e34deccab0 bp 0x000000000000 sp 0x7ffc94894710 T8618)
> ==8618==The signal is caused by a READ memory access.
> ==8618==Hint: address points to the zero page.
>     #0 0x55e34deccab0 in ldl_he_p /builds/qemu-project/qemu/include/qemu/bswap.h:301:5
>     #1 0x55e34deccab0 in ldn_he_p /builds/qemu-project/qemu/include/qemu/bswap.h:440:1
>     #2 0x55e34deccab0 in flatview_write_continue /builds/qemu-project/qemu/build/../softmmu/physmem.c:2824:19
>     #3 0x55e34dec9f21 in flatview_write /builds/qemu-project/qemu/build/../softmmu/physmem.c:2867:12
>     #4 0x55e34dec9f21 in address_space_write /builds/qemu-project/qemu/build/../softmmu/physmem.c:2963:18
>     #5 0x55e34decace7 in address_space_unmap /builds/qemu-project/qemu/build/../softmmu/physmem.c:3306:9
>     #6 0x55e34de6d4ec in vhost_memory_unmap /builds/qemu-project/qemu/build/../hw/virtio/vhost.c:342:9
>     #7 0x55e34de6d4ec in vhost_virtqueue_stop /builds/qemu-project/qemu/build/../hw/virtio/vhost.c:1242:5
>     #8 0x55e34de72904 in vhost_dev_stop /builds/qemu-project/qemu/build/../hw/virtio/vhost.c:1882:9
>     #9 0x55e34d890514 in vhost_net_stop_one /builds/qemu-project/qemu/build/../hw/net/vhost_net.c:331:5
>     #10 0x55e34d88fef6 in vhost_net_start /builds/qemu-project/qemu/build/../hw/net/vhost_net.c:404:13
>     #11 0x55e34de0bec6 in virtio_net_vhost_status /builds/qemu-project/qemu/build/../hw/net/virtio-net.c:307:13
>     #12 0x55e34de0bec6 in virtio_net_set_status /builds/qemu-project/qemu/build/../hw/net/virtio-net.c:388:5
>     #13 0x55e34de5e409 in virtio_set_status /builds/qemu-project/qemu/build/../hw/virtio/virtio.c:2442:9
>     #14 0x55e34da22a50 in virtio_mmio_write /builds/qemu-project/qemu/build/../hw/virtio/virtio-mmio.c:428:9
>     #15 0x55e34deb44a6 in memory_region_write_accessor /builds/qemu-project/qemu/build/../softmmu/memory.c:493:5
>     #16 0x55e34deb428a in access_with_adjusted_size /builds/qemu-project/qemu/build/../softmmu/memory.c:555:18
>     #17 0x55e34deb402d in memory_region_dispatch_write /builds/qemu-project/qemu/build/../softmmu/memory.c
>     #18 0x55e34deccaf1 in flatview_write_continue /builds/qemu-project/qemu/build/../softmmu/physmem.c:2825:23
>     #19 0x55e34dec9f21 in flatview_write /builds/qemu-project/qemu/build/../softmmu/physmem.c:2867:12
>     #20 0x55e34dec9f21 in address_space_write /builds/qemu-project/qemu/build/../softmmu/physmem.c:2963:18
>     #21 0x55e34ded0bf6 in qtest_process_command /builds/qemu-project/qemu/build/../softmmu/qtest.c
>     #22 0x55e34ded008d in qtest_process_inbuf /builds/qemu-project/qemu/build/../softmmu/qtest.c:796:9
>     #23 0x55e34e109b02 in tcp_chr_read /builds/qemu-project/qemu/build/../chardev/char-socket.c:508:13
>     #24 0x7fc6c665d0ae in g_main_context_dispatch (/lib64/libglib-2.0.so.0+0x550ae)
>     #25 0x55e34e1fc1bc in glib_pollfds_poll /builds/qemu-project/qemu/build/../util/main-loop.c:297:9
>     #26 0x55e34e1fc1bc in os_host_main_loop_wait /builds/qemu-project/qemu/build/../util/main-loop.c:320:5
>     #27 0x55e34e1fc1bc in main_loop_wait /builds/qemu-project/qemu/build/../util/main-loop.c:596:11
>     #28 0x55e34da52de6 in qemu_main_loop /builds/qemu-project/qemu/build/../softmmu/runstate.c:739:9
>     #29 0x55e34d60a4f5 in qemu_default_main /builds/qemu-project/qemu/build/../softmmu/main.c:37:14
>     #30 0x7fc6c43a5eaf in __libc_start_call_main (/lib64/libc.so.6+0x3feaf)
>     #31 0x7fc6c43a5f5f in __libc_start_main@GLIBC_2.2.5 (/lib64/libc.so.6+0x3ff5f)
>     #32 0x55e34d5e1094 in _start (/builds/qemu-project/qemu/build/qemu-system-arm+0xc17094)
> UndefinedBehaviorSanitizer can not provide additional info.
> SUMMARY: UndefinedBehaviorSanitizer: SEGV /builds/qemu-project/qemu/include/qemu/bswap.h:301:5 in ldl_he_p
> ==8618==ABORTING
> Broken pipe
> ../tests/qtest/libqtest.c:179: kill_qemu() tried to terminate QEMU process but encountered exit status 1 (expected 0)
> **
> ERROR:../tests/qtest/qos-test.c:191:subprocess_run_one_test: child process (/arm/virt/virtio-mmio/virtio-bus/virtio-net-device/virtio-net/virtio-net-tests/vhost-user/flags-mismatch/subprocess [8609]) failed unexpectedly
> (test program exited with status code -6)
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/3265209698
> https://gitlab.com/qemu-project/qemu/-/pipelines/683909108
> 
> Stefan


Ugh. I need to build with ubsan to reproduce yes? didn't trigger for me
I am wondering how to bisect on gitlab.


-- 
MST


