Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B66623C46
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 08:02:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot1YW-0001oA-Ga; Thu, 10 Nov 2022 02:00:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1ot1YI-0001ni-Nu
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 02:00:43 -0500
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1ot1YF-0003KV-V8
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 02:00:42 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=2; SR=0;
 TI=SMTPD_---0VURs4Ci_1668063319; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VURs4Ci_1668063319) by smtp.aliyun-inc.com;
 Thu, 10 Nov 2022 14:55:20 +0800
Message-ID: <1668063187.9843538-1-xuanzhuo@linux.alibaba.com>
Subject: Re: QEMU | Heap-overflow in virtio_net_queue_enable (#1309)
Date: Thu, 10 Nov 2022 14:53:07 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20221110000943-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221110000943-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=115.124.30.44;
 envelope-from=xuanzhuo@linux.alibaba.com;
 helo=out30-44.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001,
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

On Thu, 10 Nov 2022 00:11:00 -0500, "Michael S. Tsirkin" <mst@redhat.com> w=
rote:
> Xuan Zhuo pls take a look ASAP.
>
> On Thu, Nov 10, 2022 at 03:04:41AM +0000, Alexander Bulekov (@a1xndr) wro=
te:
> Alexander Bulekov created an issue: #1309
>
> Hello,
>
> I bisected this to 7f863302 ("virtio-net: support queue_enable"). CC:
> @mstredhat @jasowang (could not find Kangjie Xu or Xuan Zhuo gitlab accou=
nts).
>
>  Reproducer
>
> cat << EOF | ./qemu-system-i386 -display none -machine accel=3Dqtest, -m \
> 512M -M q35 -nodefaults -device virtio-net,netdev=3Dnet0 -netdev \
> user,id=3Dnet0 -qtest stdio
> outl 0xcf8 0x80000810
> outl 0xcfc 0xc000
> outl 0xcf8 0x80000804
> outl 0xcfc 0x01
> outl 0xc00d 0x0200
> outl 0xcf8 0x80000890
> outb 0xcfc 0x4
> outl 0xcf8 0x80000889
> outl 0xcfc 0x1c000000
> outl 0xcf8 0x80000893
> outw 0xcfc 0x100
> EOF


Hi, I don't reproduce this problem, need valgrind?


Thanks.


	sudo sh test.sh
	[I 0.000000] OPENED
	[R +0.014069] outl 0xcf8 0x80000810
	[S +0.014089] OK
	OK
	[R +0.014100] outl 0xcfc 0xc000
	[S +0.014113] OK
	OK
	[R +0.014117] outl 0xcf8 0x80000804
	[S +0.014125] OK
	OK
	[R +0.014133] outl 0xcfc 0x01
	[S +0.014210] OK
	OK
	[R +0.014215] outl 0xc00d 0x0200
	[S +0.014222] OK
	OK
	[R +0.014226] outl 0xcf8 0x80000890
	[S +0.014233] OK
	OK
	[R +0.014240] outb 0xcfc 0x4
	[S +0.014247] OK
	OK
	[R +0.014252] outl 0xcf8 0x80000889
	[S +0.014259] OK
	OK
	[R +0.014266] outl 0xcfc 0x1c000000
	[S +0.014275] OK
	OK
	[R +0.014279] outl 0xcf8 0x80000893
	[S +0.014288] OK
	OK
	[R +0.014292] outw 0xcfc 0x100
	[S +0.014304] OK
	OK
	[I +0.014319] CLOSED





	^Cqemu-system-i386: GLib: g_timer_elapsed: assertion 'timer !=3D NULL' fai=
led
	[I +0.000000] CLOSED


>
>  Stack-Trace
>
> =3D=3D3742222=3D=3DERROR: AddressSanitizer: heap-buffer-overflow on addre=
ss 0x61400001a9f8 at pc 0x55db851032b1 bp 0x7ffe639914c0 sp 0x7ffe639914b8
> READ of size 8 at 0x61400001a9f8 thread T0
>     #0 0x55db851032b0 in virtio_net_queue_enable /home/alxndr/Development=
/qemu-demo/qemu/build-asan/../hw/net/virtio-net.c:572:14
>     #1 0x55db85361748 in memory_region_write_accessor /home/alxndr/Develo=
pment/qemu-demo/qemu/build-asan/../softmmu/memory.c:493:5
>     #2 0x55db8536129a in access_with_adjusted_size /home/alxndr/Developme=
nt/qemu-demo/qemu/build-asan/../softmmu/memory.c:555:18
>     #3 0x55db85360c03 in memory_region_dispatch_write /home/alxndr/Develo=
pment/qemu-demo/qemu/build-asan/../softmmu/memory.c
>     #4 0x55db8485e11f in virtio_address_space_write /home/alxndr/Developm=
ent/qemu-demo/qemu/build-asan/../hw/virtio/virtio-pci.c:592:5
>     #5 0x55db8485e11f in virtio_write_config /home/alxndr/Development/qem=
u-demo/qemu/build-asan/../hw/virtio/virtio-pci.c:670:13
>     #6 0x55db844de82a in pci_host_config_write_common /home/alxndr/Develo=
pment/qemu-demo/qemu/build-asan/../hw/pci/pci_host.c:85:5
>     #7 0x55db85361748 in memory_region_write_accessor /home/alxndr/Develo=
pment/qemu-demo/qemu/build-asan/../softmmu/memory.c:493:5
>     #8 0x55db8536129a in access_with_adjusted_size /home/alxndr/Developme=
nt/qemu-demo/qemu/build-asan/../softmmu/memory.c:555:18
>     #9 0x55db85360c03 in memory_region_dispatch_write /home/alxndr/Develo=
pment/qemu-demo/qemu/build-asan/../softmmu/memory.c
>     #10 0x55db853ad390 in flatview_write_continue /home/alxndr/Developmen=
t/qemu-demo/qemu/build-asan/../softmmu/physmem.c:2825:23
>     #11 0x55db853a4833 in flatview_write /home/alxndr/Development/qemu-de=
mo/qemu/build-asan/../softmmu/physmem.c:2867:12
>     #12 0x55db853a4543 in address_space_write /home/alxndr/Development/qe=
mu-demo/qemu/build-asan/../softmmu/physmem.c:2963:18
>     #13 0x55db85354567 in cpu_outw /home/alxndr/Development/qemu-demo/qem=
u/build-asan/../softmmu/ioport.c:70:5
>     #14 0x55db853b8129 in qtest_process_command /home/alxndr/Development/=
qemu-demo/qemu/build-asan/../softmmu/qtest.c:480:13
>     #15 0x55db853b6cb8 in qtest_process_inbuf /home/alxndr/Development/qe=
mu-demo/qemu/build-asan/../softmmu/qtest.c:802:9
>     #16 0x55db85a3e284 in fd_chr_read /home/alxndr/Development/qemu-demo/=
qemu/build-asan/../chardev/char-fd.c:72:9
>     #17 0x7f7f528c8a9e in g_main_context_dispatch (/usr/lib/x86_64-linux-=
gnu/libglib-2.0.so.0+0x53a9e) (BuildId: 1697a734f1bc7448cd8772689a1c439343f=
062f7)
>     #18 0x55db85cc1f33 in glib_pollfds_poll /home/alxndr/Development/qemu=
-demo/qemu/build-asan/../util/main-loop.c:297:9
>     #19 0x55db85cc1f33 in os_host_main_loop_wait /home/alxndr/Development=
/qemu-demo/qemu/build-asan/../util/main-loop.c:320:5
>     #20 0x55db85cc1f33 in main_loop_wait /home/alxndr/Development/qemu-de=
mo/qemu/build-asan/../util/main-loop.c:606:11
>     #21 0x55db849163a6 in qemu_main_loop /home/alxndr/Development/qemu-de=
mo/qemu/build-asan/../softmmu/runstate.c:739:9
>     #22 0x55db83d54105 in qemu_default_main /home/alxndr/Development/qemu=
-demo/qemu/build-asan/../softmmu/main.c:37:14
>     #23 0x7f7f520c6209 in __libc_start_call_main csu/../sysdeps/nptl/libc=
_start_call_main.h:58:16
>     #24 0x7f7f520c62bb in __libc_start_main csu/../csu/libc-start.c:389:3
>     #25 0x55db83c93ef0 in _start (/home/alxndr/Development/qemu-demo/qemu=
/build-asan/qemu-system-i386+0x1f9cef0) (BuildId: 574fb9ebea37c72f33a18ee7c=
da64eaf34590574)
>
> 0x61400001a9f8 is located 32 bytes to the right of 408-byte region [0x614=
00001a840,0x61400001a9d8)
> allocated by thread T0 here:
>     #0 0x55db83d16f28 in __interceptor_calloc (/home/alxndr/Development/q=
emu-demo/qemu/build-asan/qemu-system-i386+0x201ff28) (BuildId: 574fb9ebea37=
c72f33a18ee7cda64eaf34590574)
>     #1 0x7f7f528ceb30 in g_malloc0 (/usr/lib/x86_64-linux-gnu/libglib-2.0=
.so.0+0x59b30) (BuildId: 1697a734f1bc7448cd8772689a1c439343f062f7)
>     #2 0x55db850f8d11 in virtio_net_device_realize /home/alxndr/Developme=
nt/qemu-demo/qemu/build-asan/../hw/net/virtio-net.c:3621:18
>     #3 0x55db85250321 in virtio_device_realize /home/alxndr/Development/q=
emu-demo/qemu/build-asan/../hw/virtio/virtio.c:4168:9
>     #4 0x55db85658931 in device_set_realized /home/alxndr/Development/qem=
u-demo/qemu/build-asan/../hw/core/qdev.c:566:13
>     #5 0x55db85679238 in property_set_bool /home/alxndr/Development/qemu-=
demo/qemu/build-asan/../qom/object.c:2285:5
>     #6 0x55db8567442c in object_property_set /home/alxndr/Development/qem=
u-demo/qemu/build-asan/../qom/object.c:1420:5
>     #7 0x55db8568012c in object_property_set_qobject /home/alxndr/Develop=
ment/qemu-demo/qemu/build-asan/../qom/qom-qobject.c:28:10
>     #8 0x55db844cef9a in pci_qdev_realize /home/alxndr/Development/qemu-d=
emo/qemu/build-asan/../hw/pci/pci.c:2218:9
>     #9 0x55db85658931 in device_set_realized /home/alxndr/Development/qem=
u-demo/qemu/build-asan/../hw/core/qdev.c:566:13
>     #10 0x55db85679238 in property_set_bool /home/alxndr/Development/qemu=
-demo/qemu/build-asan/../qom/object.c:2285:5
>     #11 0x55db8567442c in object_property_set /home/alxndr/Development/qe=
mu-demo/qemu/build-asan/../qom/object.c:1420:5
>     #12 0x55db8568012c in object_property_set_qobject /home/alxndr/Develo=
pment/qemu-demo/qemu/build-asan/../qom/qom-qobject.c:28:10
>     #13 0x55db8490f344 in qdev_device_add /home/alxndr/Development/qemu-d=
emo/qemu/build-asan/../softmmu/qdev-monitor.c:733:11
>     #14 0x55db849172b2 in qemu_create_cli_devices /home/alxndr/Developmen=
t/qemu-demo/qemu/build-asan/../softmmu/vl.c:2536:5
>     #15 0x55db849172b2 in qmp_x_exit_preconfig /home/alxndr/Development/q=
emu-demo/qemu/build-asan/../softmmu/vl.c:2604:5
>     #16 0x55db8491db5f in qemu_init /home/alxndr/Development/qemu-demo/qe=
mu/build-asan/../softmmu/vl.c:3601:9
>     #17 0x55db83d54125 in main /home/alxndr/Development/qemu-demo/qemu/bu=
ild-asan/../softmmu/main.c:47:5
>
> OSS-Fuzz Report: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=3D=
53186
>
> libqtest Reproducer: repro.c
>
> Thank you
>
> =E2=80=94
> Reply to this email directly or view it on GitLab.
> You're receiving this email because you have been mentioned on gitlab.com.
> Unsubscribe from this thread =C2=B7 Manage all notifications =C2=B7 Help
>

