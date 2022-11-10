Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B64623CE7
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 08:45:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot2Ep-0002V5-K8; Thu, 10 Nov 2022 02:44:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1ot2Ej-0002Uo-7d
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 02:44:34 -0500
Received: from out30-42.freemail.mail.aliyun.com ([115.124.30.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1ot2Eg-00060Q-HQ
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 02:44:32 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=3; SR=0;
 TI=SMTPD_---0VUS5f-P_1668066259; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VUS5f-P_1668066259) by smtp.aliyun-inc.com;
 Thu, 10 Nov 2022 15:44:20 +0800
Message-ID: <1668066118.6515784-2-xuanzhuo@linux.alibaba.com>
Subject: Re: QEMU | Heap-overflow in virtio_net_queue_enable (#1309)
Date: Thu, 10 Nov 2022 15:41:58 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20221110000943-mutt-send-email-mst@kernel.org>
 <CACGkMEte5t6iRJm7V0rPGSZeXbmdK88FBM9BU75XwUJdXkQuLQ@mail.gmail.com>
In-Reply-To: <CACGkMEte5t6iRJm7V0rPGSZeXbmdK88FBM9BU75XwUJdXkQuLQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=115.124.30.42;
 envelope-from=xuanzhuo@linux.alibaba.com;
 helo=out30-42.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

On Thu, 10 Nov 2022 13:18:54 +0800, Jason Wang <jasowang@redhat.com> wrote:
> On Thu, Nov 10, 2022 at 1:12 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > Xuan Zhuo pls take a look ASAP.
> >
> > On Thu, Nov 10, 2022 at 03:04:41AM +0000, Alexander Bulekov (@a1xndr) w=
rote:
> > Alexander Bulekov created an issue: #1309
> >
> > Hello,
> >
> > I bisected this to 7f863302 ("virtio-net: support queue_enable"). CC:
> > @mstredhat @jasowang (could not find Kangjie Xu or Xuan Zhuo gitlab acc=
ounts).
>
> Looks like we need to validate queue_index or queue_sel before calling
> device specific queue enable here.

The queue_index here should be index of the cvq.

We cannot check on the upper level, because there is no actual queue num in=
 the
upper layer VirtIODevice.

Thanks.


>
> Thanks
>
> >
> >  Reproducer
> >
> > cat << EOF | ./qemu-system-i386 -display none -machine accel=3Dqtest, -=
m \
> > 512M -M q35 -nodefaults -device virtio-net,netdev=3Dnet0 -netdev \
> > user,id=3Dnet0 -qtest stdio
> > outl 0xcf8 0x80000810
> > outl 0xcfc 0xc000
> > outl 0xcf8 0x80000804
> > outl 0xcfc 0x01
> > outl 0xc00d 0x0200
> > outl 0xcf8 0x80000890
> > outb 0xcfc 0x4
> > outl 0xcf8 0x80000889
> > outl 0xcfc 0x1c000000
> > outl 0xcf8 0x80000893
> > outw 0xcfc 0x100
> > EOF
> >
> >  Stack-Trace
> >
> > =3D=3D3742222=3D=3DERROR: AddressSanitizer: heap-buffer-overflow on add=
ress 0x61400001a9f8 at pc 0x55db851032b1 bp 0x7ffe639914c0 sp 0x7ffe639914b8
> > READ of size 8 at 0x61400001a9f8 thread T0
> >     #0 0x55db851032b0 in virtio_net_queue_enable /home/alxndr/Developme=
nt/qemu-demo/qemu/build-asan/../hw/net/virtio-net.c:572:14
> >     #1 0x55db85361748 in memory_region_write_accessor /home/alxndr/Deve=
lopment/qemu-demo/qemu/build-asan/../softmmu/memory.c:493:5
> >     #2 0x55db8536129a in access_with_adjusted_size /home/alxndr/Develop=
ment/qemu-demo/qemu/build-asan/../softmmu/memory.c:555:18
> >     #3 0x55db85360c03 in memory_region_dispatch_write /home/alxndr/Deve=
lopment/qemu-demo/qemu/build-asan/../softmmu/memory.c
> >     #4 0x55db8485e11f in virtio_address_space_write /home/alxndr/Develo=
pment/qemu-demo/qemu/build-asan/../hw/virtio/virtio-pci.c:592:5
> >     #5 0x55db8485e11f in virtio_write_config /home/alxndr/Development/q=
emu-demo/qemu/build-asan/../hw/virtio/virtio-pci.c:670:13
> >     #6 0x55db844de82a in pci_host_config_write_common /home/alxndr/Deve=
lopment/qemu-demo/qemu/build-asan/../hw/pci/pci_host.c:85:5
> >     #7 0x55db85361748 in memory_region_write_accessor /home/alxndr/Deve=
lopment/qemu-demo/qemu/build-asan/../softmmu/memory.c:493:5
> >     #8 0x55db8536129a in access_with_adjusted_size /home/alxndr/Develop=
ment/qemu-demo/qemu/build-asan/../softmmu/memory.c:555:18
> >     #9 0x55db85360c03 in memory_region_dispatch_write /home/alxndr/Deve=
lopment/qemu-demo/qemu/build-asan/../softmmu/memory.c
> >     #10 0x55db853ad390 in flatview_write_continue /home/alxndr/Developm=
ent/qemu-demo/qemu/build-asan/../softmmu/physmem.c:2825:23
> >     #11 0x55db853a4833 in flatview_write /home/alxndr/Development/qemu-=
demo/qemu/build-asan/../softmmu/physmem.c:2867:12
> >     #12 0x55db853a4543 in address_space_write /home/alxndr/Development/=
qemu-demo/qemu/build-asan/../softmmu/physmem.c:2963:18
> >     #13 0x55db85354567 in cpu_outw /home/alxndr/Development/qemu-demo/q=
emu/build-asan/../softmmu/ioport.c:70:5
> >     #14 0x55db853b8129 in qtest_process_command /home/alxndr/Developmen=
t/qemu-demo/qemu/build-asan/../softmmu/qtest.c:480:13
> >     #15 0x55db853b6cb8 in qtest_process_inbuf /home/alxndr/Development/=
qemu-demo/qemu/build-asan/../softmmu/qtest.c:802:9
> >     #16 0x55db85a3e284 in fd_chr_read /home/alxndr/Development/qemu-dem=
o/qemu/build-asan/../chardev/char-fd.c:72:9
> >     #17 0x7f7f528c8a9e in g_main_context_dispatch (/usr/lib/x86_64-linu=
x-gnu/libglib-2.0.so.0+0x53a9e) (BuildId: 1697a734f1bc7448cd8772689a1c43934=
3f062f7)
> >     #18 0x55db85cc1f33 in glib_pollfds_poll /home/alxndr/Development/qe=
mu-demo/qemu/build-asan/../util/main-loop.c:297:9
> >     #19 0x55db85cc1f33 in os_host_main_loop_wait /home/alxndr/Developme=
nt/qemu-demo/qemu/build-asan/../util/main-loop.c:320:5
> >     #20 0x55db85cc1f33 in main_loop_wait /home/alxndr/Development/qemu-=
demo/qemu/build-asan/../util/main-loop.c:606:11
> >     #21 0x55db849163a6 in qemu_main_loop /home/alxndr/Development/qemu-=
demo/qemu/build-asan/../softmmu/runstate.c:739:9
> >     #22 0x55db83d54105 in qemu_default_main /home/alxndr/Development/qe=
mu-demo/qemu/build-asan/../softmmu/main.c:37:14
> >     #23 0x7f7f520c6209 in __libc_start_call_main csu/../sysdeps/nptl/li=
bc_start_call_main.h:58:16
> >     #24 0x7f7f520c62bb in __libc_start_main csu/../csu/libc-start.c:389=
:3
> >     #25 0x55db83c93ef0 in _start (/home/alxndr/Development/qemu-demo/qe=
mu/build-asan/qemu-system-i386+0x1f9cef0) (BuildId: 574fb9ebea37c72f33a18ee=
7cda64eaf34590574)
> >
> > 0x61400001a9f8 is located 32 bytes to the right of 408-byte region [0x6=
1400001a840,0x61400001a9d8)
> > allocated by thread T0 here:
> >     #0 0x55db83d16f28 in __interceptor_calloc (/home/alxndr/Development=
/qemu-demo/qemu/build-asan/qemu-system-i386+0x201ff28) (BuildId: 574fb9ebea=
37c72f33a18ee7cda64eaf34590574)
> >     #1 0x7f7f528ceb30 in g_malloc0 (/usr/lib/x86_64-linux-gnu/libglib-2=
.0.so.0+0x59b30) (BuildId: 1697a734f1bc7448cd8772689a1c439343f062f7)
> >     #2 0x55db850f8d11 in virtio_net_device_realize /home/alxndr/Develop=
ment/qemu-demo/qemu/build-asan/../hw/net/virtio-net.c:3621:18
> >     #3 0x55db85250321 in virtio_device_realize /home/alxndr/Development=
/qemu-demo/qemu/build-asan/../hw/virtio/virtio.c:4168:9
> >     #4 0x55db85658931 in device_set_realized /home/alxndr/Development/q=
emu-demo/qemu/build-asan/../hw/core/qdev.c:566:13
> >     #5 0x55db85679238 in property_set_bool /home/alxndr/Development/qem=
u-demo/qemu/build-asan/../qom/object.c:2285:5
> >     #6 0x55db8567442c in object_property_set /home/alxndr/Development/q=
emu-demo/qemu/build-asan/../qom/object.c:1420:5
> >     #7 0x55db8568012c in object_property_set_qobject /home/alxndr/Devel=
opment/qemu-demo/qemu/build-asan/../qom/qom-qobject.c:28:10
> >     #8 0x55db844cef9a in pci_qdev_realize /home/alxndr/Development/qemu=
-demo/qemu/build-asan/../hw/pci/pci.c:2218:9
> >     #9 0x55db85658931 in device_set_realized /home/alxndr/Development/q=
emu-demo/qemu/build-asan/../hw/core/qdev.c:566:13
> >     #10 0x55db85679238 in property_set_bool /home/alxndr/Development/qe=
mu-demo/qemu/build-asan/../qom/object.c:2285:5
> >     #11 0x55db8567442c in object_property_set /home/alxndr/Development/=
qemu-demo/qemu/build-asan/../qom/object.c:1420:5
> >     #12 0x55db8568012c in object_property_set_qobject /home/alxndr/Deve=
lopment/qemu-demo/qemu/build-asan/../qom/qom-qobject.c:28:10
> >     #13 0x55db8490f344 in qdev_device_add /home/alxndr/Development/qemu=
-demo/qemu/build-asan/../softmmu/qdev-monitor.c:733:11
> >     #14 0x55db849172b2 in qemu_create_cli_devices /home/alxndr/Developm=
ent/qemu-demo/qemu/build-asan/../softmmu/vl.c:2536:5
> >     #15 0x55db849172b2 in qmp_x_exit_preconfig /home/alxndr/Development=
/qemu-demo/qemu/build-asan/../softmmu/vl.c:2604:5
> >     #16 0x55db8491db5f in qemu_init /home/alxndr/Development/qemu-demo/=
qemu/build-asan/../softmmu/vl.c:3601:9
> >     #17 0x55db83d54125 in main /home/alxndr/Development/qemu-demo/qemu/=
build-asan/../softmmu/main.c:47:5
> >
> > OSS-Fuzz Report: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=
=3D53186
> >
> > libqtest Reproducer: repro.c
> >
> > Thank you
> >
> > =E2=80=94
> > Reply to this email directly or view it on GitLab.
> > You're receiving this email because you have been mentioned on gitlab.c=
om.
> > Unsubscribe from this thread =C2=B7 Manage all notifications =C2=B7 Help
> >
> >
>

