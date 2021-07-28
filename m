Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 493C23D8F88
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 15:49:22 +0200 (CEST)
Received: from localhost ([::1]:45232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8jw1-0007gt-8v
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 09:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1m8ju2-00050o-T7
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 09:47:18 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1m8jtz-0005Pw-Ng
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 09:47:18 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: fahien) with ESMTPSA id 5D7E71F43842
From: Antonio Caggiano <antonio.caggiano@collabora.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/8] virtio-gpu: Support Venus Vulkan driver
Date: Wed, 28 Jul 2021 15:46:26 +0200
Message-Id: <20210728134634.2142156-1-antonio.caggiano@collabora.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=46.235.227.227;
 envelope-from=antonio.caggiano@collabora.com; helo=bhuna.collabora.co.uk
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series of patches enables support for the Venus VirtIO-GPU Vulkan
driver by adding some features required by the driver:

- CONTEXT_INIT
- HOSTMEM
- RESOURCE_UUID
- BLOB_RESOURCES

In addition to these features, Venus capset support was required
together with the implementation for Virgl blob resource commands.

With this in place, QEMU can take advantage of GPU acceleration to
render a simple program such as vkcube [0] in headless mode [1]. Further
work is needed to enable rendering with other kinds of surfaces.

Tested with Chia-I Wu kernel venus-5 branch [2], Mesa v21.1 [3], and my
WIP virglrenderer res-mapping branch [4].

Relevant QEMU command line parameters:

-m 4G \
-object memory-backend-memfd,id=mem1,size=4G \
-machine memory-backend=mem1 \
-display gtk,gl=on,show-cursor=on \
-vga none \
-device virtio-vga-gl,blob=true,hostmem=1G \

v2: Split shared memory capability commit.

[0] https://github.com/krh/vkcube
[1] https://share.collabora.com/index.php/s/RM5igzZMH2o749W/preview
[2] https://gitlab.freedesktop.org/olv/drm-misc-next/-/tree/venus-5
[3] https://gitlab.freedesktop.org/mesa/mesa/-/tree/21.1
[4] https://gitlab.freedesktop.org/Fahien/virglrenderer/-/tree/res-mapping

Antonio Caggiano (6):
  virtio-gpu: CONTEXT_INIT feature
  virtio-gpu: Shared memory capability
  virtio-gpu: Resource UUID
  virtio-gpu: Support Venus capset
  virtio-gpu: Initialize Venus
  virtio-gpu: Handle resource blob commands

Dr. David Alan Gilbert (1):
  virtio: Add shared memory capability

Gerd Hoffmann (1):
  virtio-gpu: hostmem [wip]

 hw/display/trace-events                     |   1 +
 hw/display/virtio-gpu-base.c                |   8 +
 hw/display/virtio-gpu-pci.c                 |  14 ++
 hw/display/virtio-gpu-virgl.c               | 184 +++++++++++++++++++-
 hw/display/virtio-gpu.c                     |  36 +++-
 hw/display/virtio-vga.c                     |  32 +++-
 hw/virtio/virtio-pci.c                      |  19 ++
 hw/virtio/virtio-pci.h                      |   4 +
 include/hw/virtio/virtio-gpu-bswap.h        |  20 ++-
 include/hw/virtio/virtio-gpu.h              |  10 ++
 include/standard-headers/linux/virtio_gpu.h |  16 +-
 meson.build                                 |   1 +
 12 files changed, 318 insertions(+), 27 deletions(-)

-- 
2.30.2


