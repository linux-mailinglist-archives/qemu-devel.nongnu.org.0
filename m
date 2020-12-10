Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D012D570C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 10:26:06 +0100 (CET)
Received: from localhost ([::1]:60368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knID7-0007Ol-VD
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 04:26:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1knHz2-0003bf-UZ
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:11:32 -0500
Received: from indium.canonical.com ([91.189.90.7]:34140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1knHz0-00044l-RP
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:11:32 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1knHyz-0006EN-Ag
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 09:11:29 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3D7AE2E8144
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 09:11:29 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Dec 2020 09:02:29 -0000
From: Thomas Huth <1890360@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr stefanha th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159659017753.10948.1930355246009105000.malonedeb@chaenomeles.canonical.com>
Message-Id: <160759094978.15859.17784075664347517370.malone@chaenomeles.canonical.com>
Subject: [Bug 1890360] Re: Assertion failure in address_space_unmap through
 virtio-blk
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4853cb86c14c5a9e513816c8a61121c639b30835"; Instance="production"
X-Launchpad-Hash: b88241ff50619f94d99b64750fe834bc95f3f097
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1890360 <1890360@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Released with QEMU v5.2.0.

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1890360

Title:
  Assertion failure in address_space_unmap through virtio-blk

Status in QEMU:
  Fix Released

Bug description:
  Hello,
  Reproducer:
  cat << EOF | ./i386-softmmu/qemu-system-i386 \
  -drive id=3Dmydrive,file=3Dnull-co://,size=3D2M,format=3Draw,if=3Dnone \
  -device virtio-blk,drive=3Dmydrive \
  -nodefaults -nographic -qtest stdio
  outl 0xcf8 0x80001010
  outl 0xcfc 0xc001
  outl 0xcf8 0x80001014
  outl 0xcf8 0x80001004
  outw 0xcfc 0x7
  outl 0xc006 0x3aff9090
  outl 0xcf8 0x8000100e
  outl 0xcfc 0x41005e1e
  write 0x3b00002 0x1 0x5e
  write 0x3b00004 0x1 0x5e
  write 0x3aff5e6 0x1 0x11
  write 0x3aff5eb 0x1 0xc6
  write 0x3aff5ec 0x1 0xc6
  write 0x7 0x1 0xff
  write 0x8 0x1 0xfb
  write 0xc 0x1 0x11
  write 0xe 0x1 0x5e
  write 0x5e8 0x1 0x11
  write 0x5ec 0x1 0xc6
  outl 0x410e 0x10e
  EOF

  =

  qemu-fuzz-i386: /exec.c:3623: void address_space_unmap(AddressSpace *, vo=
id *, hwaddr, _Bool, hwaddr): Assertion `mr !=3D NULL' failed.
  =3D=3D789=3D=3D ERROR: libFuzzer: deadly signal
      #8  in __assert_fail /build/glibc-GwnBeO/glibc-2.30/assert/assert.c:1=
01:3
      #9  in address_space_unmap /exec.c:3623:9
      #10 in dma_memory_unmap /include/sysemu/dma.h:145:5
      #11 in virtqueue_unmap_sg /hw/virtio/virtio.c:690:9
      #12 in virtqueue_fill /hw/virtio/virtio.c:843:5
      #13 in virtqueue_push /hw/virtio/virtio.c:917:5
      #14 in virtio_blk_req_complete /hw/block/virtio-blk.c:83:5
      #15 in virtio_blk_handle_request /hw/block/virtio-blk.c:671:13
      #16 in virtio_blk_handle_vq /hw/block/virtio-blk.c:780:17
      #17 in virtio_queue_notify_aio_vq /hw/virtio/virtio.c:2324:15
      #18 in virtio_queue_host_notifier_aio_read /hw/virtio/virtio.c:3495:9
      #19 in aio_dispatch_handler /util/aio-posix.c:328:9
      #20 in aio_dispatch_handlers /util/aio-posix.c:371:20
      #21 in aio_dispatch /util/aio-posix.c:381:5
      #22 in aio_ctx_dispatch /util/async.c:306:5
      #23 in g_main_context_dispatch

  =

  With -trace virtio\*

  ...
  [S +0.099667] OK
  [R +0.099681] write 0x5ec 0x1 0xc6
  OK
  [S +0.099690] OK
  [R +0.099700] outl 0x410e 0x10e
  29575@1596590112.074339:virtio_queue_notify vdev 0x62d000030590 n 0 vq 0x=
7f9b93fc9800
  29575@1596590112.074423:virtio_blk_data_plane_start dataplane 0x60600000f=
260
  OK
  [S +0.099833] OK
  29575@1596590112.076459:virtio_queue_notify vdev 0x62d000030590 n 0 vq 0x=
7f9b93fc9800
  29575@1596590112.076642:virtio_blk_handle_read vdev 0x62d000030590 req 0x=
611000043e80 sector 0 nsectors 0
  29575@1596590112.076651:virtio_blk_req_complete vdev 0x62d000030590 req 0=
x611000043e80 status 1
  qemu-system-i386: /home/alxndr/Development/qemu/general-fuzz/exec.c:3623:=
 void address_space_unmap(AddressSpace *, void *, hwaddr, _Bool, hwaddr): A=
ssertion `mr !=3D NULL' failed.

  =

  -Alex

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1890360/+subscriptions

