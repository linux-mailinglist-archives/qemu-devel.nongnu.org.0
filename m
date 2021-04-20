Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE183652E4
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 09:09:25 +0200 (CEST)
Received: from localhost ([::1]:40426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYkVg-0000LS-Fs
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 03:09:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lYkSE-000384-92
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 03:05:50 -0400
Received: from mga17.intel.com ([192.55.52.151]:17751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lYkSA-0002hb-2X
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 03:05:50 -0400
IronPort-SDR: pbEQ9PoPhsCCoua1syBcQNzrgTociO6vN3cVJAYQAfp4LrLOk1P8dvfccK9VPhmrS1374ALi/V
 5VIy6396l+zA==
X-IronPort-AV: E=McAfee;i="6200,9189,9959"; a="175563721"
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; d="scan'208";a="175563721"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 00:05:36 -0700
IronPort-SDR: T9NmU/UcyXj3Cat6jNRfuZqtyHGONcEpyfKUfu5B4CCRypuzGlXkrQ2M+zPQqgFb6icAUd2WY8
 o1TtOtp4gSuQ==
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; d="scan'208";a="420293111"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 00:05:36 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/12] virtio-gpu: Add support for Blob resources feature
Date: Mon, 19 Apr 2021 23:53:35 -0700
Message-Id: <20210420065347.2685768-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.26.2
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

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Tina Zhang <tina.zhang@intel.com>

Vivek Kasireddy (12):
  ui: Get the fd associated with udmabuf driver
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

 hw/display/meson.build                   |   2 +-
 hw/display/trace-events                  |   2 +
 hw/display/virtio-gpu-3d.c               |   3 +-
 hw/display/virtio-gpu-base.c             |   3 +
 hw/display/virtio-gpu-udmabuf.c          | 275 ++++++++++++++
 hw/display/virtio-gpu.c                  | 436 ++++++++++++++++++-----
 include/hw/virtio/virtio-gpu-bswap.h     |  16 +
 include/hw/virtio/virtio-gpu.h           |  40 ++-
 include/standard-headers/linux/udmabuf.h |  32 ++
 include/ui/console.h                     |   3 +
 include/ui/qemu-pixman.h                 |   1 +
 scripts/update-linux-headers.sh          |   3 +
 ui/meson.build                           |   1 +
 ui/qemu-pixman.c                         |  35 +-
 ui/udmabuf.c                             |  40 +++
 15 files changed, 781 insertions(+), 111 deletions(-)
 create mode 100644 hw/display/virtio-gpu-udmabuf.c
 create mode 100644 include/standard-headers/linux/udmabuf.h
 create mode 100644 ui/udmabuf.c

-- 
2.26.2


