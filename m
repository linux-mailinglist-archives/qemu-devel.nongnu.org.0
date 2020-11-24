Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 057E72C2D51
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 17:54:47 +0100 (CET)
Received: from localhost ([::1]:55692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khbaY-0003zN-1q
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 11:54:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1khbXK-0002IC-JD
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:51:29 -0500
Received: from indium.canonical.com ([91.189.90.7]:39714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1khbXD-0005kB-Tb
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:51:25 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1khbXC-0001Kc-18
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 16:51:18 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 078D12E802A
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 16:51:18 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2020 16:43:16 -0000
From: Thomas Huth <1777786@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: th-huth wqlxx
X-Launchpad-Bug-Reporter: Qiang Wang (wqlxx)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <152947832268.7374.8550233006013647387.malonedeb@wampee.canonical.com>
Message-Id: <160623619679.5408.6949489090285247698.malone@soybean.canonical.com>
Subject: [Bug 1777786] Re: virtio-gpu-3d.c: change virtio_gpu_fence_poll timer
 scale
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3bd564e52ed9790394c5663a77af1e834fc2d372"; Instance="production"
X-Launchpad-Hash: 6819536c37083edf54ad0bd4eea4e41f918ded02
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1777786 <1777786@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Did you ever send your patch to the mailing list for discussion?

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1777786

Title:
  virtio-gpu-3d.c: change virtio_gpu_fence_poll timer scale

Status in QEMU:
  Incomplete

Bug description:
  We use virtio-gpu to accelerate Unigine Heaven Benchmark in VM. But we ge=
t only 5 FPS when we use AMD RX460 in our host.
  We found that guest os spent a lot of time in waiting for the return of g=
lMapBufferRange/glUnmapBuffer commad. We suspected the host GPU was waiting=
 for fence. So we finally change the timer of fence_poll. Afer change timer=
 from
   ms to us=EF=BC=8C Benchmark result raise up to 22 FPS.

  From a4003af5c4fe92d55353f42767d0c45de95bb78f Mon Sep 17 00:00:00 2001
  From: chen wei <chenwei1@ruijie.com.cn>
  Date: Fri, 8 Jun 2018 17:34:45 +0800
  Subject: [PATCH] virtio-gpu:improve 3d performance greatly

    opengl function need fence support.when CPU execute opengl function, it=
 need wait fence for synchronize GPU.
  so qemu must deal with fence timely as possible. but now the expire time =
of the timer to deal with fence is 10 ms.
  I think it is too long for opengl. So i will change it to 20 ns.
    Before change, when i play Unigine_Heaven 3d game with virglrenderer, t=
he fps is 3.  atfer change the fps up to 23.

  Signed-off-by: chen wei   <chenwei1@ruijie.com.cn>
  Signed-off-by: wang qiang <qiang_w@ruijie.com.cn>
  ---
   hw/display/virtio-gpu-3d.c | 4 ++--
   1 file changed, 2 insertions(+), 2 deletions(-)

  diff --git a/hw/display/virtio-gpu-3d.c b/hw/display/virtio-gpu-3d.c
  index 3558f38..c0a5d21 100644
  --- a/hw/display/virtio-gpu-3d.c
  +++ b/hw/display/virtio-gpu-3d.c
  @@ -582,7 +582,7 @@ static void virtio_gpu_fence_poll(void *opaque)
       virgl_renderer_poll();
       virtio_gpu_process_cmdq(g);
       if (!QTAILQ_EMPTY(&g->cmdq) || !QTAILQ_EMPTY(&g->fenceq)) {
  -        timer_mod(g->fence_poll, qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) +=
 10);
  +        timer_mod(g->fence_poll, qemu_clock_get_us(QEMU_CLOCK_VIRTUAL) +=
 20);
       }
   }
   =

  @@ -629,7 +629,7 @@ int virtio_gpu_virgl_init(VirtIOGPU *g)
           return ret;
       }
   =

  -    g->fence_poll =3D timer_new_ms(QEMU_CLOCK_VIRTUAL,
  +    g->fence_poll =3D timer_new_us(QEMU_CLOCK_VIRTUAL,
                                    virtio_gpu_fence_poll, g);
   =

       if (virtio_gpu_stats_enabled(g->conf)) {
  -- =

  2.7.4

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1777786/+subscriptions

