Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB37437A2A9
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:53:37 +0200 (CEST)
Received: from localhost ([::1]:36836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgO92-0001lk-OT
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:53:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lgNdW-0007eG-OT
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:21:02 -0400
Received: from mga17.intel.com ([192.55.52.151]:32223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lgNdT-0004ul-OE
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:21:02 -0400
IronPort-SDR: MdKYT2w6ewZMzkFU6zUg/cw7Vuh+NMFlJERehv3uwjngc6AMgBo8SZeMrgN6jinamATL7PS+wz
 N/kuUPHYx7UA==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="179649383"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="179649383"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 01:20:49 -0700
IronPort-SDR: J82U9PnDldih2xhwpSEknLCOjUuOCEuSAlb5+Vbc+ZP120kMsAGCBJIRkSgVAgxT+I0os9ej9g
 9Xzz96Kcxsfw==
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="536892178"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 01:20:48 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/20] virtio-gpu: Add support for Blob resources
Date: Tue, 11 May 2021 01:07:58 -0700
Message-Id: <20210511080818.366985-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=vivek.kasireddy@intel.com; helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Dongwon Kim <dongwon.kim@intel.com>, Tina Zhang <tina.zhang@intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enabling this feature would eliminate data copies from the resource
object in the Guest to the shadow resource in Qemu. This patch series
however adds support only for Blobs of type
VIRTIO_GPU_BLOB_MEM_GUEST with property VIRTIO_GPU_BLOB_FLAG_USE_SHAREABLE.

Most of the patches in this series are a rebased, refactored and bugfixed 
versions of Gerd Hoffmann's patches located here:
https://gitlab.freedesktop.org/virgl/qemu/-/commits/virtio-gpu-next

v2:
- Moved dpy_gl_update from set_scanout to resource_flush
- Dropped the modifier
- Rebase and other minor refactoring

v3:
- Rebased on top of Gerd's virgl device split series
- Split the udmabuf helpers patch from the previous 
  version into two
- Added explicit flush feature (last 7 patches)

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Tina Zhang <tina.zhang@intel.com>

Vivek Kasireddy (20):
  ui: Get the fd associated with udmabuf driver
  headers: Add udmabuf.h
  virtio-gpu: Add udmabuf helpers
  virtio-gpu: Add virtio_gpu_find_check_resource
  virtio-gpu: Refactor virtio_gpu_set_scanout
  virtio-gpu: Refactor virtio_gpu_create_mapping_iov
  virtio-gpu: Add initial definitions for blob resources
  virtio-gpu: Add virtio_gpu_resource_create_blob
  ui/pixman: Add qemu_pixman_to_drm_format()
  virtio-gpu: Add helpers to create and destroy dmabuf objects
  virtio-gpu: Factor out update scanout
  virtio-gpu: Add virtio_gpu_set_scanout_blob
  virtio-gpu: Update cursor data using blob
  virtio-gpu: Add initial definitions for explict flush feature
  virtio-gpu: Add dmabuf helpers for synchronization
  virtio-gpu: Add virtio_gpu_wait_flush API
  ui: Add egl helpers for synchronization
  ui/gtk-egl: Wait for the draw signal for dmabuf blobs
  ui/gtk: Create a common release_dmabuf helper
  virtio-gpu: Add gl_flushed callback

 hw/display/meson.build                      |   2 +-
 hw/display/trace-events                     |   2 +
 hw/display/virtio-gpu-base.c                |   6 +
 hw/display/virtio-gpu-udmabuf.c             | 306 ++++++++++++
 hw/display/virtio-gpu-virgl.c               |   3 +-
 hw/display/virtio-gpu.c                     | 520 ++++++++++++++++----
 include/hw/virtio/virtio-gpu-bswap.h        |  16 +
 include/hw/virtio/virtio-gpu.h              |  47 +-
 include/standard-headers/linux/udmabuf.h    |  32 ++
 include/standard-headers/linux/virtio_gpu.h |  12 +
 include/ui/console.h                        |  11 +
 include/ui/egl-helpers.h                    |   4 +
 include/ui/gtk.h                            |   4 +-
 include/ui/qemu-pixman.h                    |   1 +
 scripts/update-linux-headers.sh             |   3 +
 ui/console.c                                |  10 +
 ui/egl-helpers.c                            |  44 ++
 ui/gtk-egl.c                                |  32 +-
 ui/gtk-gl-area.c                            |   8 +
 ui/gtk.c                                    |  28 +-
 ui/meson.build                              |   1 +
 ui/qemu-pixman.c                            |  35 +-
 ui/udmabuf.c                                |  40 ++
 23 files changed, 1045 insertions(+), 122 deletions(-)
 create mode 100644 hw/display/virtio-gpu-udmabuf.c
 create mode 100644 include/standard-headers/linux/udmabuf.h
 create mode 100644 ui/udmabuf.c

-- 
2.30.2


