Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AA63E0238
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 15:44:43 +0200 (CEST)
Received: from localhost ([::1]:35602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBHCM-0001Eg-2s
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 09:44:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mBHBM-0000Qi-Bp
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 09:43:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mBHBI-0005tx-ES
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 09:43:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628084614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1GeDbhv5TTf52BMGvTY1SFfdJhD8Q6IxOZm2fHO7K2w=;
 b=ByCMZKsDhfX1AL0s0zy5a8YXizbF+otjq86LmC+PNQs7/H6J0as6xaEUrkg30Q8KRrdc1i
 PBmi9HHzRuRda414AMkuyMOTjXfFj9b1Gu3k/AADbiqfwBXqXRH0BGZ337v1EDzgBvT3sK
 x3yLqersDPkISyKNHM6csUoBdoBCSYc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-0rYiX5vtOjyaID705OEaug-1; Wed, 04 Aug 2021 09:43:33 -0400
X-MC-Unique: 0rYiX5vtOjyaID705OEaug-1
Received: by mail-ej1-f69.google.com with SMTP id
 z20-20020a1709069454b0290595651dca8eso826962ejx.23
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 06:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1GeDbhv5TTf52BMGvTY1SFfdJhD8Q6IxOZm2fHO7K2w=;
 b=k/Y8WLKHILeO4u+QGxhSnZDmzwjUU6QrtksBVe+05kbinnOKvPlkRZeAGdVThpTlAT
 a/fiftLnkfRPVF8DNz05IOHe5kP8dJDNEbEge0CaBV2+lckncQCdkfzLxKaN3E8cnagH
 zTzd2q5Ads2kVq0VUXsNg1Q6gItogiTC7iRhTwf3GMpvEtZ6QUCgE1gCxojiiXdTb0XP
 NMqnO3m87owFzXZ+OdwNdYByNP5nM/L2V04sj2H9L7WP1dmcqo8tS3sPG2X5HhVAEKjI
 mBbO4giXsEadCEynZ4FUmxDfUS/5cTsuBCHOoGG7wmhN5tOSjiqmRzVEaSl7BVpajM9Y
 FDSQ==
X-Gm-Message-State: AOAM532qRgM7UYz3X4Z40N9zh1wV7XOCsUYX+rh7YJ4lHoS2gQ346pdH
 W78fEzqidrxXJahAh7iUkoAgK8U7GG46hI4pp0kQiES8nL3HNdPsyQVB9nxktKmz8Ozg4Jl4FK2
 EQwP7fmeB0d3w0sA=
X-Received: by 2002:a05:6402:4312:: with SMTP id
 m18mr29219445edc.211.1628084610944; 
 Wed, 04 Aug 2021 06:43:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJya3J2liT3sp60NSu+mvr7j3YEVztjjZ8QOA4y6tJVC8B7YE8leh0WEowaEjEyI/O2372XzXw==
X-Received: by 2002:a05:6402:4312:: with SMTP id
 m18mr29219395edc.211.1628084610641; 
 Wed, 04 Aug 2021 06:43:30 -0700 (PDT)
Received: from redhat.com ([2.55.141.248])
 by smtp.gmail.com with ESMTPSA id o16sm977156edv.91.2021.08.04.06.43.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 06:43:29 -0700 (PDT)
Date: Wed, 4 Aug 2021 09:43:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: intermittent failure, s390 host, x86-64 guest, vhost-user-blk test
Message-ID: <20210804094231-mutt-send-email-mst@kernel.org>
References: <CAFEAcA-QcwjGtgzqkLshyU4NCq2ZhhdvJN3V_7rTCA4nUavhaQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-QcwjGtgzqkLshyU4NCq2ZhhdvJN3V_7rTCA4nUavhaQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 04, 2021 at 01:40:37PM +0100, Peter Maydell wrote:
> Saw this intermittent as part of my ad-hoc CI test setup.
> The backtrace says that the QEMU process has somehow hung
> during 'realize' of the vhost-user device...

Hmm seems to have to do with the daemon not responding ...
Cc a bunch more people ...

> Process tree:
> 
> ubuntu   59552  0.0  0.0   5460  3120 ?        S    06:51   0:00
>            \_ bash -o pipefail -c echo
> 'MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> QTEST_QEMU_IMG=./qemu-img
> G_TEST_DBUS_DAEMON=/home/ubuntu/qemu/tests/dbus-vmstate-daemon.sh
> QTEST_QEMU_BINARY=./qemu-system-x86_64
> QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon
> tests/qtest/qos-test --tap -k' &&
> MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> QTEST_QEMU_IMG=./qemu-img
> G_TEST_DBUS_DAEMON=/home/ubuntu/qemu/tests/dbus-vmstate-daemon.sh
> QTEST_QEMU_BINARY=./qemu-system-x86_64
> QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon
> tests/qtest/qos-test --tap -k -m quick < /dev/null |
> ./scripts/tap-driver.pl --test-name="qtest-x86_64/qos-test"
> ubuntu   59553  0.0  0.2  88008  8332 ?        Sl   06:51   0:00
>                \_ tests/qtest/qos-test --tap -k -m quick
> ubuntu   60122  0.0  0.5 254432 21516 ?        Sl   06:51   0:00
>                |   \_ ./storage-daemon/qemu-storage-daemon --blockdev
> driver=file,node-name=disk0,filename=qtest.trJnuR --export
> type=vhost-user-blk,id=disk0,addr.type=unix,addr.path=/tmp/qtest-59553-sock.iRt6WL,node-name=disk0,writable=on,num-queues=1
> ubuntu   60123  0.0  1.6 747952 62732 ?        Sl   06:51   0:00
>                |   \_ ./qemu-system-x86_64 -qtest
> unix:/tmp/qtest-59553.sock -qtest-log /dev/null -chardev
> socket,path=/tmp/qtest-59553.qmp,id=char0 -mon
> chardev=char0,mode=control -display none -M pc -device
> vhost-user-blk-pci,id=drv0,chardev=char1,addr=4.0 -object
> memory-backend-memfd,id=mem,size=256M,share=on -M memory-backend=mem
> -m 256M -chardev socket,id=char1,path=/tmp/qtest-59553-sock.iRt6WL
> -accel qtest
> ubuntu   59554  0.0  0.2  14116 11204 ?        S    06:51   0:00
>                \_ perl ./scripts/tap-driver.pl
> --test-name=qtest-x86_64/qos-test
> 
> Backtrace, qemu process:
> 
> Thread 4 (Thread 0x3ff5be1d910 (LWP 60131)):
> #0  0x000003ff7e2bed6a in __GI___sigtimedwait (set=<optimized out>,
>     set@entry=0x3ff5be1a098, info=info@entry=0x3ff5be19f68,
> timeout=timeout@entry=0x0)
>     at ../sysdeps/unix/sysv/linux/sigtimedwait.c:42
> #1  0x000003ff7e492ca8 in __sigwait (set=set@entry=0x3ff5be1a098,
> sig=sig@entry=0x3ff5be1a094)
>     at ../sysdeps/unix/sysv/linux/sigwait.c:28
> #2  0x000002aa16891ab2 in dummy_cpu_thread_fn
> (arg=arg@entry=0x2aa182103e0) at ../../accel/dummy-cpus.c:46
> #3  0x000002aa16b22f5a in qemu_thread_start (args=<optimized out>) at
> ../../util/qemu-thread-posix.c:541
> #4  0x000003ff7e487aa8 in start_thread (arg=0x3ff5be1d910) at
> pthread_create.c:463
> #5  0x000003ff7e37a11e in thread_start () at
> ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 3 (Thread 0x3ff608b4910 (LWP 60130)):
> #0  0x000003ff7e36f1b0 in __GI___poll (fds=0x3ff540031f0, nfds=3,
> timeout=<optimized out>) at ../sysdeps/unix/sysv/linux/poll.c:29
> #1  0x000003ff7f9d2624 in  () at /usr/lib/s390x-linux-gnu/libglib-2.0.so.0
> #2  0x000003ff7f9d2aa8 in g_main_loop_run () at
> /usr/lib/s390x-linux-gnu/libglib-2.0.so.0
> #3  0x000002aa1695ad26 in iothread_run
> (opaque=opaque@entry=0x2aa17ea2b80) at ../../iothread.c:73
> #4  0x000002aa16b22f5a in qemu_thread_start (args=<optimized out>) at
> ../../util/qemu-thread-posix.c:541
> #5  0x000003ff7e487aa8 in start_thread (arg=0x3ff608b4910) at
> pthread_create.c:463
> #6  0x000003ff7e37a11e in thread_start () at
> ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 2 (Thread 0x3ff711b7910 (LWP 60129)):
> #0  0x000003ff7e4911f6 in __lll_lock_wait
> (futex=futex@entry=0x2aa17466bb8 <qemu_global_mutex>,
> private=<optimized out>)
>     at lowlevellock.c:46
> #1  0x000003ff7e48a204 in __GI___pthread_mutex_lock
> (mutex=mutex@entry=0x2aa17466bb8 <qemu_global_mutex>)
>     at ../nptl/pthread_mutex_lock.c:80
> #2  0x000002aa16b23116 in qemu_mutex_lock_impl (mutex=0x2aa17466bb8
> <qemu_global_mutex>, file=0x2aa170a07d8 "../../util/rcu.c",
> line=<optimized out>) at ../../util/qemu-thread-posix.c:79
> #3  0x000002aa168221c0 in qemu_mutex_lock_iothread_impl
> (file=file@entry=0x2aa170a07d8 "../../util/rcu.c",
> line=line@entry=266)
>     at ../../softmmu/cpus.c:493
> #4  0x000002aa16b4c8aa in call_rcu_thread (opaque=opaque@entry=0x0) at
> ../../util/rcu.c:266
> #5  0x000002aa16b22f5a in qemu_thread_start (args=<optimized out>) at
> ../../util/qemu-thread-posix.c:541
> #6  0x000003ff7e487aa8 in start_thread (arg=0x3ff711b7910) at
> pthread_create.c:463
> #7  0x000003ff7e37a11e in thread_start () at
> ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 1 (Thread 0x3ff81035470 (LWP 60123)):
> #0  0x000003ff7e36f1b0 in __GI___poll (fds=0x2aa18147da0, nfds=2,
> timeout=<optimized out>) at ../sysdeps/unix/sysv/linux/poll.c:29
> #1  0x000003ff7f9d2624 in  () at /usr/lib/s390x-linux-gnu/libglib-2.0.so.0
> #2  0x000003ff7f9d2aa8 in g_main_loop_run () at
> /usr/lib/s390x-linux-gnu/libglib-2.0.so.0
> #3  0x000002aa169104de in vhost_user_read
> (dev=dev@entry=0x2aa18f7afc8, msg=msg@entry=0x3ffc167ddfc)
>     at ../../hw/virtio/vhost-user.c:402
> #4  0x000002aa1691186e in vhost_user_get_u64
> (dev=dev@entry=0x2aa18f7afc8, request=request@entry=1,
> u64=u64@entry=0x3ffc167e138)
>     at ../../hw/virtio/vhost-user.c:1334
> #5  0x000002aa16913388 in vhost_user_get_features
> (features=0x3ffc167e138, dev=0x2aa18f7afc8) at
> ../../hw/virtio/vhost-user.c:1356
> #6  0x000002aa16913388 in vhost_user_backend_init (dev=0x2aa18f7afc8,
> opaque=0x2aa18f7b240, errp=0x3ffc167e470)
>     at ../../hw/virtio/vhost-user.c:1877
> #7  0x000002aa1684030c in vhost_dev_init
> (hdev=hdev@entry=0x2aa18f7afc8, opaque=opaque@entry=0x2aa18f7b240,
> backend_type=backend_type@entry=VHOST_BACKEND_TYPE_USER,
> busyloop_timeout=busyloop_timeout@entry=0,
> errp=errp@entry=0x3ffc167e470)
>     at ../../hw/virtio/vhost.c:1302
> #8  0x000002aa168be742 in vhost_user_blk_connect
> (dev=dev@entry=0x2aa18f7ad78, errp=errp@entry=0x3ffc167e470)
>     at ../../hw/block/vhost-user-blk.c:339
> #9  0x000002aa168bec44 in vhost_user_blk_realize_connect
> (errp=0x3ffc167e470, s=0x2aa18f7ad78) at
> ../../hw/block/vhost-user-blk.c:440
> #10 0x000002aa168bec44 in vhost_user_blk_device_realize
> (dev=0x2aa18f7ad78, errp=0x3ffc167e470)
>     at ../../hw/block/vhost-user-blk.c:513
> #11 0x000002aa16819e78 in virtio_device_realize (dev=0x2aa18f7ad78,
> errp=0x3ffc167e530) at ../../hw/virtio/virtio.c:3659
> #12 0x000002aa169fcc50 in device_set_realized (obj=<optimized out>,
> value=<optimized out>, errp=0x3ffc167e690)
>     at ../../hw/core/qdev.c:761
> #13 0x000002aa169229ba in property_set_bool
> (obj=obj@entry=0x2aa18f7ad78, v=v@entry=
>     0x2aa18fc41e0, name=name@entry=0x2aa16ccfd74 "realized",
> opaque=0x2aa17f2a7a0, errp=errp@entry=0x3ffc167e690)
>     at ../../qom/object.c:2258
> #14 0x000002aa16925534 in object_property_set
> (obj=obj@entry=0x2aa18f7ad78, name=name@entry=0x2aa16ccfd74
> "realized", v=v@entry=
>     0x2aa18fc41e0, errp=errp@entry=0x3ffc167e980) at ../../qom/object.c:1403
> #15 0x000002aa1692229c in object_property_set_qobject
> (obj=obj@entry=0x2aa18f7ad78, name=name@entry=0x2aa16ccfd74
> "realized", value=value@entry=0x2aa18fc4120,
> errp=errp@entry=0x3ffc167e980) at ../../qom/qom-qobject.c:28
> #16 0x000002aa169257e2 in object_property_set_bool (obj=0x2aa18f7ad78,
> name=0x2aa16ccfd74 "realized", value=<optimized out>,
> errp=0x3ffc167e980) at ../../qom/object.c:1473
> #17 0x000002aa1677e9c2 in virtio_pci_realize (pci_dev=0x2aa18f72b80,
> errp=0x3ffc167e980) at ../../hw/virtio/virtio-pci.c:1907
> #18 0x000002aa165dfc48 in pci_qdev_realize (qdev=0x2aa18f72b80,
> errp=<optimized out>) at ../../hw/pci/pci.c:2148
> #19 0x000002aa169fcc50 in device_set_realized (obj=<optimized out>,
> value=<optimized out>, errp=0x3ffc167ebe8)
>     at ../../hw/core/qdev.c:761
> #20 0x000002aa169229ba in property_set_bool
> (obj=obj@entry=0x2aa18f72b80, v=v@entry=
>     0x2aa18fbe450, name=name@entry=0x2aa16ccfd74 "realized",
> opaque=0x2aa17f2a7a0, errp=errp@entry=0x3ffc167ebe8)
>     at ../../qom/object.c:2258
> #21 0x000002aa16925534 in object_property_set
> (obj=obj@entry=0x2aa18f72b80, name=name@entry=0x2aa16ccfd74
> "realized", v=v@entry=
>     0x2aa18fbe450, errp=errp@entry=0x2aa17484fe0 <error_fatal>) at
> ../../qom/object.c:1403
> #22 0x000002aa1692229c in object_property_set_qobject
> (obj=obj@entry=0x2aa18f72b80, name=name@entry=0x2aa16ccfd74
> "realized", value=value@entry=0x2aa18fbe580,
> errp=errp@entry=0x2aa17484fe0 <error_fatal>) at
> ../../qom/qom-qobject.c:28
> #23 0x000002aa169257e2 in object_property_set_bool (obj=0x2aa18f72b80,
> name=name@entry=0x2aa16ccfd74 "realized", value=value@entry=true,
> errp=0x2aa17484fe0 <error_fatal>, errp@entry=<error reading variable:
> value has been optimized out>) at ../../qom/object.c:1473
> #24 0x000002aa169fb87e in qdev_realize (dev=<optimized out>,
> bus=bus@entry=0x2aa18384200, errp=<error reading variable: value has
> been optimized out>) at ../../hw/core/qdev.c:389
> #25 0x000002aa165f1c6c in qdev_device_add (opts=<optimized out>,
> errp=<optimized out>, errp@entry=0x2aa17484fe0 <error_fatal>)
>     at ../../softmmu/qdev-monitor.c:673
> #26 0x000002aa168b2086 in device_init_func (opaque=<optimized out>,
> opts=<optimized out>, errp=0x2aa17484fe0 <error_fatal>)
>     at ../../softmmu/vl.c:1187
> #27 0x000002aa16b2b906 in qemu_opts_foreach (list=<optimized out>,
> func=func@entry=0x2aa168b2068 <device_init_func>,
> opaque=opaque@entry=0x0, errp=0x2aa17484fe0 <error_fatal>) at
> ../../util/qemu-option.c:1135
> #28 0x000002aa168b5046 in qemu_create_cli_devices () at ../../softmmu/vl.c:2645
> #29 0x000002aa168b5046 in qmp_x_exit_preconfig (errp=<optimized out>)
> at ../../softmmu/vl.c:2693
> #30 0x000002aa168b83ce in qemu_init (argc=<optimized out>,
> argv=<optimized out>, envp=<optimized out>) at ../../softmmu/vl.c:3713
> #31 0x000002aa1654f6da in main (argc=<optimized out>, argv=<optimized
> out>, envp=<optimized out>) at ../../softmmu/main.c:49
> 
> 
> Backtrace, qos-test:
> 
> Thread 2 (Thread 0x3ff9de7f910 (LWP 59555)):
> #0  syscall () at ../sysdeps/unix/sysv/linux/s390/s390-64/syscall.S:53
> #1  0x000002aa20c36a54 in qemu_futex_wait (val=<optimized out>,
> f=<optimized out>) at /home/ubuntu/qemu/include/qemu/futex.h:29
> #2  qemu_event_wait (ev=ev@entry=0x2aa20cdc3a0 <rcu_call_ready_event>)
> at ../../util/qemu-thread-posix.c:480
> #3  0x000002aa20c4efa4 in call_rcu_thread (opaque=opaque@entry=0x0) at
> ../../util/rcu.c:258
> #4  0x000002aa20c35a6a in qemu_thread_start (args=<optimized out>) at
> ../../util/qemu-thread-posix.c:541
> #5  0x000003ff9e887aa8 in start_thread (arg=0x3ff9de7f910) at
> pthread_create.c:463
> #6  0x000003ff9e77a11e in thread_start () at
> ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 1 (Thread 0x3ff9eef0940 (LWP 59553)):
> #0  0x000003ff9e89165a in __libc_read (fd=<optimized out>,
> buf=buf@entry=0x3ffc10fd3e0, nbytes=nbytes@entry=1024)
>     at ../sysdeps/unix/sysv/linux/read.c:27
> #1  0x000002aa20bdee7a in read (__nbytes=1024, __buf=0x3ffc10fd3e0,
> __fd=<optimized out>)
>     at /usr/include/s390x-linux-gnu/bits/unistd.h:44
> #2  qtest_client_socket_recv_line (s=0x2aa22379fc0) at
> ../../tests/qtest/libqtest.c:494
> #3  0x000002aa20bdf032 in qtest_rsp_args (s=s@entry=0x2aa22379fc0,
> expected_args=expected_args@entry=1)
>     at ../../tests/qtest/libqtest.c:521
> #4  0x000002aa20bdf6f2 in qtest_query_target_endianness
> (s=0x2aa22379fc0) at ../../tests/qtest/libqtest.c:570
> #5  0x000002aa20be0312 in qtest_init_without_qmp_handshake
> (extra_args=<optimized out>) at ../../tests/qtest/libqtest.c:332
> #6  0x000002aa20be09e2 in qtest_init (extra_args=<optimized out>) at
> ../../tests/qtest/libqtest.c:339
> #7  0x000002aa20bc7b76 in qtest_start (
>     args=0x2aa22389ef0 "-M pc  -device
> vhost-user-blk-pci,id=drv0,chardev=char1,addr=4.0 -object
> memory-backend-memfd,id=mem,size=256M,share=on  -M memory-backend=mem
> -m 256M -chardev socket,id=char1,path=/tmp/qtest-59553-so"...)
>     at ../../tests/qtest/libqtest-single.h:29
> #8  restart_qemu_or_continue (
>     path=0x2aa22389ef0 "-M pc  -device
> vhost-user-blk-pci,id=drv0,chardev=char1,addr=4.0 -object
> memory-backend-memfd,id=mem,size=256M,share=on  -M memory-backend=mem
> -m 256M -chardev socket,id=char1,path=/tmp/qtest-59553-so"...) at
> ../../tests/qtest/qos-test.c:105
> #9  run_one_test (arg=<optimized out>) at ../../tests/qtest/qos-test.c:178
> #10 0x000003ff9eb7c70c in ?? () from /usr/lib/s390x-linux-gnu/libglib-2.0.so.0
> #11 0x000003ff9eb7c648 in ?? () from /usr/lib/s390x-linux-gnu/libglib-2.0.so.0
> #12 0x000003ff9eb7c648 in ?? () from /usr/lib/s390x-linux-gnu/libglib-2.0.so.0
> #13 0x000003ff9eb7c648 in ?? () from /usr/lib/s390x-linux-gnu/libglib-2.0.so.0
> #14 0x000003ff9eb7c648 in ?? () from /usr/lib/s390x-linux-gnu/libglib-2.0.so.0
> #15 0x000003ff9eb7c648 in ?? () from /usr/lib/s390x-linux-gnu/libglib-2.0.so.0
> #16 0x000003ff9eb7c648 in ?? () from /usr/lib/s390x-linux-gnu/libglib-2.0.so.0
> #17 0x000003ff9eb7c648 in ?? () from /usr/lib/s390x-linux-gnu/libglib-2.0.so.0
> #18 0x000003ff9eb7c648 in ?? () from /usr/lib/s390x-linux-gnu/libglib-2.0.so.0
> #19 0x000003ff9eb7c8ee in g_test_run_suite () from
> /usr/lib/s390x-linux-gnu/libglib-2.0.so.0
> #20 0x000003ff9eb7c928 in g_test_run () from
> /usr/lib/s390x-linux-gnu/libglib-2.0.so.0
> #21 0x000002aa20bc6c9a in main (argc=<optimized out>, argv=<optimized
> out>, envp=<optimized out>) at ../../tests/qtest/qos-test.c:338
> 
> Backtrace, qemu-storage-daemon:
> 
> Thread 2 (Thread 0x3ff951b7910 (LWP 60132)):
> #0  syscall () at ../sysdeps/unix/sysv/linux/s390/s390-64/syscall.S:53
> #1  0x000002aa0184fa6c in qemu_futex_wait (val=<optimized out>,
> f=<optimized out>) at /home/ubuntu/qemu/include/qemu/futex.h:29
> #2  qemu_event_wait (ev=ev@entry=0x2aa01971158 <rcu_call_ready_event>)
> at ../../util/qemu-thread-posix.c:480
> #3  0x000002aa0187498c in call_rcu_thread (opaque=opaque@entry=0x0) at
> ../../util/rcu.c:258
> #4  0x000002aa0184ea82 in qemu_thread_start (args=<optimized out>) at
> ../../util/qemu-thread-posix.c:541
> #5  0x000003ffa0507aa8 in start_thread (arg=0x3ff951b7910) at
> pthread_create.c:463
> #6  0x000003ffa03fa11e in thread_start () at
> ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65
> 
> Thread 1 (Thread 0x3ffa14590e0 (LWP 60122)):
> #0  0x000003ffa03ef302 in __GI_ppoll (fds=0x2aa0332b3d0, nfds=5,
> timeout=<optimized out>, timeout@entry=0x0,
>     sigmask=sigmask@entry=0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:39
> #1  0x000002aa0185b054 in ppoll (__ss=0x0, __timeout=0x0,
> __nfds=<optimized out>, __fds=<optimized out>)
>     at /usr/include/s390x-linux-gnu/bits/poll2.h:77
> #2  qemu_poll_ns (fds=<optimized out>, nfds=<optimized out>,
> timeout=timeout@entry=-1) at ../../util/qemu-timer.c:336
> #3  0x000002aa01851e48 in os_host_main_loop_wait (timeout=-1) at
> ../../util/main-loop.c:250
> #4  main_loop_wait (nonblocking=<optimized out>) at ../../util/main-loop.c:531
> #5  0x000002aa01738dda in main (argc=<optimized out>,
> argv=0x3ffd28feba8) at ../../storage-daemon/qemu-storage-daemon.c:345
> 
> 
> thanks
> -- PMM


