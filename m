Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC11C392338
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 01:29:17 +0200 (CEST)
Received: from localhost ([::1]:48266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm2xh-0006QS-0a
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 19:29:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lm2vv-0003fN-1u
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:27:27 -0400
Received: from mga01.intel.com ([192.55.52.88]:11252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lm2vs-0001wp-T2
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:27:26 -0400
IronPort-SDR: 7ncOdIsDFdMelrbmPxs2yaqetLj9Zwyv3kmB1dXwOTGAVOb1Z5KEuBtqBnaGie1IFDVz1pTM/R
 2d8+DTNMaTSw==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="223801536"
X-IronPort-AV: E=Sophos;i="5.82,333,1613462400"; d="scan'208";a="223801536"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 16:26:56 -0700
IronPort-SDR: aBh9TTEXPTmEw1ZwRz7vx0MobuNpSUTmmOT9K36hnXfvvywORv6pn2vVgX4NJJS+1tuNwLwhI8
 3TUc1H4fDFQg==
X-IronPort-AV: E=Sophos;i="5.82,333,1613462400"; d="scan'208";a="477188124"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 16:26:55 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 00/14] virtio-gpu: Add support for Blob resources feature
Date: Wed, 26 May 2021 16:14:15 -0700
Message-Id: <20210526231429.1045476-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.88;
 envelope-from=vivek.kasireddy@intel.com; helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

v7:
- Added a file in stubs for udmabuf helpers
- Included the header qemu/memfd.h so that F_GET_SEALS gets
  a definition if it is not defined in standard headers

Cc: Gerd Hoffmann <kraxel@redhat.com>

Vivek Kasireddy (14):
  ui: Get the fd associated with udmabuf driver
  headers: Add udmabuf.h
  virtio-gpu: Add udmabuf helpers
  stubs: Add stubs for udmabuf helpers
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

 hw/display/meson.build                   |   1 +
 hw/display/trace-events                  |   2 +
 hw/display/virtio-gpu-base.c             |   3 +
 hw/display/virtio-gpu-udmabuf.c          | 223 ++++++++++++
 hw/display/virtio-gpu-virgl.c            |   3 +-
 hw/display/virtio-gpu.c                  | 431 ++++++++++++++++++-----
 include/hw/virtio/virtio-gpu-bswap.h     |  16 +
 include/hw/virtio/virtio-gpu.h           |  39 +-
 include/standard-headers/linux/udmabuf.h |  32 ++
 include/ui/console.h                     |   3 +
 include/ui/qemu-pixman.h                 |   1 +
 meson.build                              |   2 +-
 scripts/update-linux-headers.sh          |   3 +
 stubs/meson.build                        |   1 +
 stubs/virtio-gpu-udmabuf.c               |  27 ++
 ui/meson.build                           |   1 +
 ui/qemu-pixman.c                         |  35 +-
 ui/udmabuf.c                             |  40 +++
 18 files changed, 753 insertions(+), 110 deletions(-)
 create mode 100644 hw/display/virtio-gpu-udmabuf.c
 create mode 100644 include/standard-headers/linux/udmabuf.h
 create mode 100644 stubs/virtio-gpu-udmabuf.c
 create mode 100644 ui/udmabuf.c

-- 
2.30.2


