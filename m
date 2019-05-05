Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C113113ED4
	for <lists+qemu-devel@lfdr.de>; Sun,  5 May 2019 12:27:19 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39170 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNEMI-0004JP-7M
	for lists+qemu-devel@lfdr.de; Sun, 05 May 2019 06:27:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48299)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hNEL0-0003q2-B9
	for qemu-devel@nongnu.org; Sun, 05 May 2019 06:25:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hNEKy-0007Bh-I1
	for qemu-devel@nongnu.org; Sun, 05 May 2019 06:25:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:50392)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bounces@canonical.com>)
	id 1hNEKy-00079o-8t
	for qemu-devel@nongnu.org; Sun, 05 May 2019 06:25:40 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
	by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
	id 1hNEKs-0006bw-0S
	for <qemu-devel@nongnu.org>; Sun, 05 May 2019 10:25:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
	by loganberry.canonical.com (Postfix) with ESMTP id ED7002E8052
	for <qemu-devel@nongnu.org>; Sun,  5 May 2019 10:25:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 May 2019 10:15:41 -0000
From: Chen Zhang <1827772@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: gvt mdev rfc vfio
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cuser2
X-Launchpad-Bug-Reporter: Chen Zhang (cuser2)
X-Launchpad-Bug-Modifier: Chen Zhang (cuser2)
Message-Id: <155705134117.31768.14250772954769525827.malonedeb@wampee.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18953";
	Instance="launchpad-lazr.conf"
X-Launchpad-Hash: dcfd078c051a659e24d534e902c625d4cd110ec5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1827772] [NEW] [RFC] dma buf: support sprite plane
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1827772 <1827772@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

QEMU does not support sprite/overlay in DMA-buf mode for Intel gvt
vGPUs. Some use cases relies on sprite plane support, e.g. hw
accelerated video playback in Windows 10 guest.

To support this feature, functions in both kernel and QEMU should be
implemented:

- query support for plane info in kernel: =

  in vgpu_get_plane_info() of drm/i915/gvt/dmabuf.c, calls to intel_vgpu_de=
code_sprite_plane() shall be made;

- struct to hold VFIODMABuf object in QEMU:
  in struct VFIODisplay of include/hw/vfio/vfio-common.h;
- copying of data in QEMU:
  in vfio_display_get_dmabuf() of hw/vfio/display.c;
- drawing of sprite plane in QEMU:
  in vfio_display_dmabuf_update() of hw/vfio/display.c;

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: gvt mdev rfc vfio

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1827772

Title:
  [RFC] dma buf: support sprite plane

Status in QEMU:
  New

Bug description:
  QEMU does not support sprite/overlay in DMA-buf mode for Intel gvt
  vGPUs. Some use cases relies on sprite plane support, e.g. hw
  accelerated video playback in Windows 10 guest.

  To support this feature, functions in both kernel and QEMU should be
  implemented:

  - query support for plane info in kernel: =

    in vgpu_get_plane_info() of drm/i915/gvt/dmabuf.c, calls to intel_vgpu_=
decode_sprite_plane() shall be made;

  - struct to hold VFIODMABuf object in QEMU:
    in struct VFIODisplay of include/hw/vfio/vfio-common.h;
  - copying of data in QEMU:
    in vfio_display_get_dmabuf() of hw/vfio/display.c;
  - drawing of sprite plane in QEMU:
    in vfio_display_dmabuf_update() of hw/vfio/display.c;

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1827772/+subscriptions

