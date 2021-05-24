Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DF038F5C3
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 00:45:18 +0200 (CEST)
Received: from localhost ([::1]:58634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llJK1-0000Mt-Aj
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 18:45:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1llJIF-0006lZ-I7
 for qemu-devel@nongnu.org; Mon, 24 May 2021 18:43:27 -0400
Received: from mga05.intel.com ([192.55.52.43]:11755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1llJIC-0006he-JE
 for qemu-devel@nongnu.org; Mon, 24 May 2021 18:43:27 -0400
IronPort-SDR: Kc/e1fX1KN4PChr8kZ7kX+H4yyYVO+Fl7Sm/vm8PUeuAXuMLRR7WEKZ/lVdG2LWR5b4s1086SE
 HvhUm3Glm/Ig==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="287620897"
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="287620897"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 15:43:17 -0700
IronPort-SDR: E6dww9YpF6QjCm8BczLFpf0rcIK7AxLv4pUyRyNdGRV8bNeYEbCguWxQdm1F7Uy/f+SBaunGsz
 Ezg8EbRms8ug==
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="546246738"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 15:43:17 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 00/13] virtio-gpu: Add support for Blob resources feature
Date: Mon, 24 May 2021 15:30:50 -0700
Message-Id: <20210524223103.922910-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43;
 envelope-from=vivek.kasireddy@intel.com; helo=mga05.intel.com
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
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
  version into two (Gerd)
- Added explicit flush feature (last 7 patches)

v4 (Gerd):
- Dropped explicit flush feature patches from the series
- Slightly refactored udmabuf helpers patch (#3) to introduce
  and use blob and blob_size fields
- Fixed indentation issues and made other small changes in
  set_scanout_blob patch (#12)

v5:
- Rebase (only #6 - Refactor virtio_gpu_create_mapping_iov)

v6:
- Fixed compilation error seen in patch #5 with !linux config
- Fixed uninitialized variable usage warning in patch #10

Cc: Gerd Hoffmann <kraxel@redhat.com>

Vivek Kasireddy (13):
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

 hw/display/meson.build                   |   2 +-
 hw/display/trace-events                  |   2 +
 hw/display/virtio-gpu-base.c             |   3 +
 hw/display/virtio-gpu-udmabuf.c          | 254 +++++++++++++
 hw/display/virtio-gpu-virgl.c            |   3 +-
 hw/display/virtio-gpu.c                  | 431 ++++++++++++++++++-----
 include/hw/virtio/virtio-gpu-bswap.h     |  16 +
 include/hw/virtio/virtio-gpu.h           |  39 +-
 include/standard-headers/linux/udmabuf.h |  32 ++
 include/ui/console.h                     |   3 +
 include/ui/qemu-pixman.h                 |   1 +
 scripts/update-linux-headers.sh          |   3 +
 ui/meson.build                           |   1 +
 ui/qemu-pixman.c                         |  35 +-
 ui/udmabuf.c                             |  40 +++
 15 files changed, 755 insertions(+), 110 deletions(-)
 create mode 100644 hw/display/virtio-gpu-udmabuf.c
 create mode 100644 include/standard-headers/linux/udmabuf.h
 create mode 100644 ui/udmabuf.c

-- 
2.30.2


