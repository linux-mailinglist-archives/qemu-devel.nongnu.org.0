Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD5F3A378F
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 01:02:54 +0200 (CEST)
Received: from localhost ([::1]:51550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrThN-0001HJ-59
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 19:02:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lrTfy-0007H8-Ke
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 19:01:26 -0400
Received: from mga17.intel.com ([192.55.52.151]:52951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lrTft-0006zL-Pr
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 19:01:26 -0400
IronPort-SDR: FOdWRLYC0MDILhWs5rxo92H7vezPuEPWTIj25tafadkHQE7N5GvPM7Ahw3gAiiShNTvaOLmpUI
 r1CGkNMrlnZw==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="185796179"
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="185796179"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 16:01:08 -0700
IronPort-SDR: KPjHMlEnvPd1ZQLNEZ/5VLz+6GaDcsbpTetBg4YPTuynglOZHkMPXRuHqlrJaseWtqMvHDOpfc
 Jelneh0xabFw==
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="419888349"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 16:01:07 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/8] virtio-gpu: Add a default synchronization mechanism
 for blobs
Date: Thu, 10 Jun 2021 15:48:29 -0700
Message-Id: <20210610224837.670192-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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
Cc: Dongwon Kim <dongwon.kim@intel.com>, Tina Zhang <tina.zhang@intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the Guest and Host are using Blob resources, there is a chance
that they may use the underlying storage associated with a Blob at
the same time leading to glitches such as flickering or tearing.
To prevent these from happening, the Host needs to ensure that it
waits until its Blit is completed by the Host GPU before letting
the Guest reuse the Blob.

This should be the default behavior regardless of the type of Guest
that is using Blob resources but would be particularly useful for 
Guests that are using frontbuffer rendering such as Linux with X
or Windows 10, etc.

The way it works is the Guest includes a fence as part of 
resource_flush and waits for it to be signalled. The Host will
queue a repaint request and signal the fence after it completes
waiting on the sync object associated with the Blit.

v2:
- Added more description in the cover letter
- Removed the wait from resource_flush and included it in
  a gl_flushed() callback

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Tina Zhang <tina.zhang@intel.com>

Vivek Kasireddy (8):
  ui/gtk: Create a common release_dmabuf helper
  ui/egl: Add egl helpers to help with synchronization
  ui: Add a helper to wait on a dmabuf sync object
  ui/gtk: Implement wait_dmabuf function
  ui: Create sync objects only for blobs
  ui/gtk-egl: Wait for the draw signal for dmabuf blobs
  virtio-gpu: Add dmabuf helpers for synchronization
  virtio-gpu: Add gl_flushed callback

 hw/display/virtio-gpu-udmabuf.c | 30 ++++++++++++++++++++++
 hw/display/virtio-gpu.c         | 44 ++++++++++++++++++++++++++++++++-
 include/hw/virtio/virtio-gpu.h  |  2 ++
 include/ui/console.h            |  8 ++++++
 include/ui/egl-helpers.h        |  4 +++
 include/ui/gtk.h                |  4 +--
 stubs/virtio-gpu-udmabuf.c      |  6 +++++
 ui/console.c                    | 10 ++++++++
 ui/egl-helpers.c                | 44 +++++++++++++++++++++++++++++++++
 ui/gtk-egl.c                    | 32 ++++++++++++++++++------
 ui/gtk-gl-area.c                |  8 ++++++
 ui/gtk.c                        | 28 +++++++++++++++++++--
 12 files changed, 207 insertions(+), 13 deletions(-)

-- 
2.30.2


