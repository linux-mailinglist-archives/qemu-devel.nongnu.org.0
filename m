Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D60D0623B26
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 06:12:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oszqQ-0004V8-6a; Thu, 10 Nov 2022 00:11:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oszqJ-0004Sp-FC
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 00:11:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oszqG-0000Mm-GR
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 00:11:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668057067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FhQFpCst6hNa4G8IkaEwjvjqtfATUT+L6mblby9ZuGk=;
 b=BDeFsuJzsvIJFpNk1PspjU7YfF+2yAOLzjU+DGhHC8h8wp4oFu3uLgz4xTbWy4SKifI8zz
 yyVRkAEbtZSsZlSJ+2ieMWrvRkZiHHtjctuP71e0AV8Tgn7WeurMlYIlKWkGGJV/QUblED
 Pb0pVtPdgjIxwAdobD+e743ZuvwFqqA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-232-VpCBga0ENE2ZqN7REq4cjQ-1; Thu, 10 Nov 2022 00:11:05 -0500
X-MC-Unique: VpCBga0ENE2ZqN7REq4cjQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 m34-20020a05600c3b2200b003cf549cb32bso2088447wms.1
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 21:11:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FhQFpCst6hNa4G8IkaEwjvjqtfATUT+L6mblby9ZuGk=;
 b=ZLCVW34kcS7feMSyXFRZTiRsCUs9PBYZYLWAuALDTiPgZtHbf/0ddJLYvOQs5dxQF4
 LoLLZv5U4G4bwTqUZ1qgZPZAlLBVzEQQmNvs6A8XMbkeVe5vZ3iD48NduG8ZxCd+h0OX
 vecFaoeFbiS4cNpnxnH/eXbEAJeYkZJ6oNj6wcvO0i6GshxCsfM7ECBrBzlACHphTKfa
 kiAVLqk7PuLobi160mralrEQY/i+ct3lJQW3ZG+0Q9zi4z1lhuaHs/umogBlFDu60ILg
 3DHzCVyBGeO0MNdWYBdUV4hA+AYh4uSfalNKvbkDvGaRJHlvpQ9WE8uAMGqBcCkfd189
 Xs5w==
X-Gm-Message-State: ACrzQf1GYLaJxUXAKvglZPyzLOBWdrxtdbvzZ7IrMOf6LcVQb24w5bIE
 E2gsOFJbTon6BYMuz5NWUZkzqnHNGZa5+WozHdhOk4uz1k3aJadPgDOiBEfOEXshIXH78eVwc+z
 X9x04LXXfk+/MbnI=
X-Received: by 2002:adf:dc8a:0:b0:236:6372:551e with SMTP id
 r10-20020adfdc8a000000b002366372551emr39887533wrj.41.1668057064045; 
 Wed, 09 Nov 2022 21:11:04 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5FD3wUePOvBn3Cw9S2SEDwECIZoPdH69cghWidEyrtOEm8X4YVnz1ZAw15MVfTKa/HPtT5og==
X-Received: by 2002:adf:dc8a:0:b0:236:6372:551e with SMTP id
 r10-20020adfdc8a000000b002366372551emr39887523wrj.41.1668057063721; 
 Wed, 09 Nov 2022 21:11:03 -0800 (PST)
Received: from redhat.com ([2.52.23.68]) by smtp.gmail.com with ESMTPSA id
 m20-20020a7bcb94000000b003cf4eac8e80sm4295362wmi.23.2022.11.09.21.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 21:11:03 -0800 (PST)
Date: Thu, 10 Nov 2022 00:11:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, qemu-devel@nongnu.org
Subject: Re: QEMU | Heap-overflow in virtio_net_queue_enable (#1309)
Message-ID: <20221110000943-mutt-send-email-mst@kernel.org>
References: <reply-1e4f06160b70f0d5d43fb528773581e4@gitlab.com>
 <issue_118462359@gitlab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <issue_118462359@gitlab.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MISSING_HEADERS=1.021, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Xuan Zhuo pls take a look ASAP.

On Thu, Nov 10, 2022 at 03:04:41AM +0000, Alexander Bulekov (@a1xndr) wrote:
Alexander Bulekov created an issue: #1309

Hello,

I bisected this to 7f863302 ("virtio-net: support queue_enable"). CC:
@mstredhat @jasowang (could not find Kangjie Xu or Xuan Zhuo gitlab accounts).

 Reproducer

cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest, -m \
512M -M q35 -nodefaults -device virtio-net,netdev=net0 -netdev \
user,id=net0 -qtest stdio
outl 0xcf8 0x80000810
outl 0xcfc 0xc000
outl 0xcf8 0x80000804
outl 0xcfc 0x01
outl 0xc00d 0x0200
outl 0xcf8 0x80000890
outb 0xcfc 0x4
outl 0xcf8 0x80000889
outl 0xcfc 0x1c000000
outl 0xcf8 0x80000893
outw 0xcfc 0x100
EOF

 Stack-Trace

==3742222==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x61400001a9f8 at pc 0x55db851032b1 bp 0x7ffe639914c0 sp 0x7ffe639914b8
READ of size 8 at 0x61400001a9f8 thread T0
    #0 0x55db851032b0 in virtio_net_queue_enable /home/alxndr/Development/qemu-demo/qemu/build-asan/../hw/net/virtio-net.c:572:14
    #1 0x55db85361748 in memory_region_write_accessor /home/alxndr/Development/qemu-demo/qemu/build-asan/../softmmu/memory.c:493:5
    #2 0x55db8536129a in access_with_adjusted_size /home/alxndr/Development/qemu-demo/qemu/build-asan/../softmmu/memory.c:555:18
    #3 0x55db85360c03 in memory_region_dispatch_write /home/alxndr/Development/qemu-demo/qemu/build-asan/../softmmu/memory.c
    #4 0x55db8485e11f in virtio_address_space_write /home/alxndr/Development/qemu-demo/qemu/build-asan/../hw/virtio/virtio-pci.c:592:5
    #5 0x55db8485e11f in virtio_write_config /home/alxndr/Development/qemu-demo/qemu/build-asan/../hw/virtio/virtio-pci.c:670:13
    #6 0x55db844de82a in pci_host_config_write_common /home/alxndr/Development/qemu-demo/qemu/build-asan/../hw/pci/pci_host.c:85:5
    #7 0x55db85361748 in memory_region_write_accessor /home/alxndr/Development/qemu-demo/qemu/build-asan/../softmmu/memory.c:493:5
    #8 0x55db8536129a in access_with_adjusted_size /home/alxndr/Development/qemu-demo/qemu/build-asan/../softmmu/memory.c:555:18
    #9 0x55db85360c03 in memory_region_dispatch_write /home/alxndr/Development/qemu-demo/qemu/build-asan/../softmmu/memory.c
    #10 0x55db853ad390 in flatview_write_continue /home/alxndr/Development/qemu-demo/qemu/build-asan/../softmmu/physmem.c:2825:23
    #11 0x55db853a4833 in flatview_write /home/alxndr/Development/qemu-demo/qemu/build-asan/../softmmu/physmem.c:2867:12
    #12 0x55db853a4543 in address_space_write /home/alxndr/Development/qemu-demo/qemu/build-asan/../softmmu/physmem.c:2963:18
    #13 0x55db85354567 in cpu_outw /home/alxndr/Development/qemu-demo/qemu/build-asan/../softmmu/ioport.c:70:5
    #14 0x55db853b8129 in qtest_process_command /home/alxndr/Development/qemu-demo/qemu/build-asan/../softmmu/qtest.c:480:13
    #15 0x55db853b6cb8 in qtest_process_inbuf /home/alxndr/Development/qemu-demo/qemu/build-asan/../softmmu/qtest.c:802:9
    #16 0x55db85a3e284 in fd_chr_read /home/alxndr/Development/qemu-demo/qemu/build-asan/../chardev/char-fd.c:72:9
    #17 0x7f7f528c8a9e in g_main_context_dispatch (/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x53a9e) (BuildId: 1697a734f1bc7448cd8772689a1c439343f062f7)
    #18 0x55db85cc1f33 in glib_pollfds_poll /home/alxndr/Development/qemu-demo/qemu/build-asan/../util/main-loop.c:297:9
    #19 0x55db85cc1f33 in os_host_main_loop_wait /home/alxndr/Development/qemu-demo/qemu/build-asan/../util/main-loop.c:320:5
    #20 0x55db85cc1f33 in main_loop_wait /home/alxndr/Development/qemu-demo/qemu/build-asan/../util/main-loop.c:606:11
    #21 0x55db849163a6 in qemu_main_loop /home/alxndr/Development/qemu-demo/qemu/build-asan/../softmmu/runstate.c:739:9
    #22 0x55db83d54105 in qemu_default_main /home/alxndr/Development/qemu-demo/qemu/build-asan/../softmmu/main.c:37:14
    #23 0x7f7f520c6209 in __libc_start_call_main csu/../sysdeps/nptl/libc_start_call_main.h:58:16
    #24 0x7f7f520c62bb in __libc_start_main csu/../csu/libc-start.c:389:3
    #25 0x55db83c93ef0 in _start (/home/alxndr/Development/qemu-demo/qemu/build-asan/qemu-system-i386+0x1f9cef0) (BuildId: 574fb9ebea37c72f33a18ee7cda64eaf34590574)

0x61400001a9f8 is located 32 bytes to the right of 408-byte region [0x61400001a840,0x61400001a9d8)
allocated by thread T0 here:
    #0 0x55db83d16f28 in __interceptor_calloc (/home/alxndr/Development/qemu-demo/qemu/build-asan/qemu-system-i386+0x201ff28) (BuildId: 574fb9ebea37c72f33a18ee7cda64eaf34590574)
    #1 0x7f7f528ceb30 in g_malloc0 (/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x59b30) (BuildId: 1697a734f1bc7448cd8772689a1c439343f062f7)
    #2 0x55db850f8d11 in virtio_net_device_realize /home/alxndr/Development/qemu-demo/qemu/build-asan/../hw/net/virtio-net.c:3621:18
    #3 0x55db85250321 in virtio_device_realize /home/alxndr/Development/qemu-demo/qemu/build-asan/../hw/virtio/virtio.c:4168:9
    #4 0x55db85658931 in device_set_realized /home/alxndr/Development/qemu-demo/qemu/build-asan/../hw/core/qdev.c:566:13
    #5 0x55db85679238 in property_set_bool /home/alxndr/Development/qemu-demo/qemu/build-asan/../qom/object.c:2285:5
    #6 0x55db8567442c in object_property_set /home/alxndr/Development/qemu-demo/qemu/build-asan/../qom/object.c:1420:5
    #7 0x55db8568012c in object_property_set_qobject /home/alxndr/Development/qemu-demo/qemu/build-asan/../qom/qom-qobject.c:28:10
    #8 0x55db844cef9a in pci_qdev_realize /home/alxndr/Development/qemu-demo/qemu/build-asan/../hw/pci/pci.c:2218:9
    #9 0x55db85658931 in device_set_realized /home/alxndr/Development/qemu-demo/qemu/build-asan/../hw/core/qdev.c:566:13
    #10 0x55db85679238 in property_set_bool /home/alxndr/Development/qemu-demo/qemu/build-asan/../qom/object.c:2285:5
    #11 0x55db8567442c in object_property_set /home/alxndr/Development/qemu-demo/qemu/build-asan/../qom/object.c:1420:5
    #12 0x55db8568012c in object_property_set_qobject /home/alxndr/Development/qemu-demo/qemu/build-asan/../qom/qom-qobject.c:28:10
    #13 0x55db8490f344 in qdev_device_add /home/alxndr/Development/qemu-demo/qemu/build-asan/../softmmu/qdev-monitor.c:733:11
    #14 0x55db849172b2 in qemu_create_cli_devices /home/alxndr/Development/qemu-demo/qemu/build-asan/../softmmu/vl.c:2536:5
    #15 0x55db849172b2 in qmp_x_exit_preconfig /home/alxndr/Development/qemu-demo/qemu/build-asan/../softmmu/vl.c:2604:5
    #16 0x55db8491db5f in qemu_init /home/alxndr/Development/qemu-demo/qemu/build-asan/../softmmu/vl.c:3601:9
    #17 0x55db83d54125 in main /home/alxndr/Development/qemu-demo/qemu/build-asan/../softmmu/main.c:47:5

OSS-Fuzz Report: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=53186

libqtest Reproducer: repro.c

Thank you

—
Reply to this email directly or view it on GitLab.
You're receiving this email because you have been mentioned on gitlab.com.
Unsubscribe from this thread · Manage all notifications · Help


