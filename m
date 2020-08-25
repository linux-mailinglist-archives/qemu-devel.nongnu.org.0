Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F40D252352
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 00:06:48 +0200 (CEST)
Received: from localhost ([::1]:44650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAh5b-0001nh-8B
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 18:06:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kAh4s-0001NG-N4
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 18:06:02 -0400
Received: from indium.canonical.com ([91.189.90.7]:39576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kAh4q-0001dV-6f
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 18:06:02 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kAh4o-0005i6-E9
 for <qemu-devel@nongnu.org>; Tue, 25 Aug 2020 22:05:58 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 66AED2E80EA
 for <qemu-devel@nongnu.org>; Tue, 25 Aug 2020 22:05:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2020 21:56:46 -0000
From: Diego Viola <1882851@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: diego-viola kraxel-redhat
X-Launchpad-Bug-Reporter: Diego Viola (diego-viola)
X-Launchpad-Bug-Modifier: Diego Viola (diego-viola)
References: <159174217343.32241.17743917589333297614.malonedeb@gac.canonical.com>
Message-Id: <20200825215646.66853-1-diego.viola@gmail.com>
Subject: [Bug 1882851] [PATCH] drm/virtio: fix unblank
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="99c2d833c8d727fd05148486920aca032e908071"; Instance="production"
X-Launchpad-Hash: df90cc23592ec1f9b0510edfbec90834af0419e4
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 18:05:58
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1882851 <1882851@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

When going through a disable/enable cycle without changing the
framebuffer the optimization added by commit 3954ff10e06e ("drm/virtio:
skip set_scanout if framebuffer didn't change") causes the screen stay
blank.  Add a bool to force an update to fix that.

v2: use drm_atomic_crtc_needs_modeset() (Daniel).

Cc: 1882851@bugs.launchpad.net
Fixes: 3954ff10e06e ("drm/virtio: skip set_scanout if framebuffer didn't ch=
ange")
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Tested-by: Jiri Slaby <jirislaby@kernel.org>
Tested-by: Diego Viola <diego.viola@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_display.c | 11 +++++++++++
 drivers/gpu/drm/virtio/virtgpu_drv.h     |  1 +
 drivers/gpu/drm/virtio/virtgpu_plane.c   |  4 +++-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/vir=
tio/virtgpu_display.c
index af55b334be2f..35b5c80f5d85 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -123,6 +123,17 @@ static int virtio_gpu_crtc_atomic_check(struct drm_crt=
c *crtc,
 static void virtio_gpu_crtc_atomic_flush(struct drm_crtc *crtc,
 					 struct drm_crtc_state *old_state)
 {
+	struct virtio_gpu_output *output =3D drm_crtc_to_virtio_gpu_output(crtc);
+
+	/*
+	 * virtio-gpu can't do modeset and plane update operations
+	 * independant from each other.  So the actual modeset happens
+	 * in the plane update callback, and here we just check
+	 * whenever we must force the modeset.
+	 */
+	if (drm_atomic_crtc_needs_modeset(crtc->state)) {
+		output->needs_modeset =3D true;
+	}
 }
 =

 static const struct drm_crtc_helper_funcs virtio_gpu_crtc_helper_funcs =3D=
 {
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/=
virtgpu_drv.h
index 9ff9f4ac0522..4ab1b0ba2925 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -138,6 +138,7 @@ struct virtio_gpu_output {
 	int cur_x;
 	int cur_y;
 	bool enabled;
+	bool needs_modeset;
 };
 #define drm_crtc_to_virtio_gpu_output(x) \
 	container_of(x, struct virtio_gpu_output, crtc)
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virti=
o/virtgpu_plane.c
index 52d24179bcec..65757409d9ed 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -163,7 +163,9 @@ static void virtio_gpu_primary_plane_update(struct drm_=
plane *plane,
 	    plane->state->src_w !=3D old_state->src_w ||
 	    plane->state->src_h !=3D old_state->src_h ||
 	    plane->state->src_x !=3D old_state->src_x ||
-	    plane->state->src_y !=3D old_state->src_y) {
+	    plane->state->src_y !=3D old_state->src_y ||
+	    output->needs_modeset) {
+		output->needs_modeset =3D false;
 		DRM_DEBUG("handle 0x%x, crtc %dx%d+%d+%d, src %dx%d+%d+%d\n",
 			  bo->hw_res_handle,
 			  plane->state->crtc_w, plane->state->crtc_h,
-- =

2.28.0

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1882851

Title:
  QEMU video freezes with "Guest disabled display" (virtio driver)

Status in QEMU:
  New

Bug description:
  I am using Arch Linux as my Guest and Host OS, after starting qemu
  with the following command:

    $ qemu-system-x86_64 -enable-kvm -hda arch-zoom.qcow2 -m 4G -vga
  virtio

  and waiting for a screen blank, I get this message:

    Guest disabled display

  And nothing happens after that, I can move the mouse or hit any key,
  and the message is still there.

  I can still reboot the VM but that's not optimal.

  I can reproduce this with the latest QEMU release (5.0.0) or git master, =

  I also tried this with older releases (4.0.0, 3.0.0) and the issue is sti=
ll there.

  I can't reproduce this with other video drivers (std, qxl).

  With std/qxl the screen will blank a bit and then continue as normal.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1882851/+subscriptions

