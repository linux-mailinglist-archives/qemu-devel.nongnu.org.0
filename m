Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF2434F771
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 05:26:01 +0200 (CEST)
Received: from localhost ([::1]:49058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRRUW-0007dL-K5
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 23:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lRRQU-0002Yp-W2
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 23:21:51 -0400
Received: from mga18.intel.com ([134.134.136.126]:53068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lRRQL-000572-Mm
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 23:21:49 -0400
IronPort-SDR: SVsEfLbW3jkmyAJvIe8HSlyJdprf+y71vQDJiL7Kt3Mvq+Qpst4dfJP0YHF85YAMxg4ER284nb
 QAD/pWkUmAIQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="179449758"
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="179449758"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 20:21:33 -0700
IronPort-SDR: tCmxw7Cq/duvfpBVoOO51s8w8pp7tUkCzoGm8M3+Unl/7S7DxqVJbwbFFS8lHEcAI6XHfsU3Sd
 gGoqSgZUgThA==
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="418454102"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 20:21:32 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/11] Add support for Blob resources feature
Date: Tue, 30 Mar 2021 20:09:50 -0700
Message-Id: <20210331031001.1564125-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=vivek.kasireddy@intel.com; helo=mga18.intel.com
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

TODO:
- Enable the combination virgl + blob resources
- Add support for VIRTGPU_BLOB_MEM_HOST3D blobs

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Tina Zhang <tina.zhang@intel.com>

Vivek Kasireddy (11):
  ui: Get the fd associated with udmabuf driver
  ui/pixman: Add qemu_pixman_to_drm_format()
  virtio-gpu: Add udmabuf helpers
  virtio-gpu: Add virtio_gpu_find_check_resource
  virtio-gpu: Refactor virtio_gpu_set_scanout
  virtio-gpu: Refactor virtio_gpu_create_mapping_iov
  virtio-gpu: Add initial definitions for blob resources
  virtio-gpu: Add virtio_gpu_resource_create_blob
  virtio-gpu: Add helpers to create and destroy dmabuf objects
  virtio-gpu: Add virtio_gpu_set_scanout_blob
  virtio-gpu: Update cursor data using blob

 hw/display/meson.build                      |   2 +-
 hw/display/trace-events                     |   2 +
 hw/display/virtio-gpu-3d.c                  |   3 +-
 hw/display/virtio-gpu-base.c                |   3 +
 hw/display/virtio-gpu-udmabuf.c             | 276 +++++++++++++
 hw/display/virtio-gpu.c                     | 423 +++++++++++++++-----
 include/hw/virtio/virtio-gpu-bswap.h        |  16 +
 include/hw/virtio/virtio-gpu.h              |  41 +-
 include/standard-headers/linux/udmabuf.h    |  32 ++
 include/standard-headers/linux/virtio_gpu.h |   1 +
 include/ui/console.h                        |   3 +
 include/ui/qemu-pixman.h                    |   1 +
 scripts/update-linux-headers.sh             |   3 +
 ui/meson.build                              |   1 +
 ui/qemu-pixman.c                            |  35 +-
 ui/udmabuf.c                                |  40 ++
 16 files changed, 772 insertions(+), 110 deletions(-)
 create mode 100644 hw/display/virtio-gpu-udmabuf.c
 create mode 100644 include/standard-headers/linux/udmabuf.h
 create mode 100644 ui/udmabuf.c

-- 
2.26.2


