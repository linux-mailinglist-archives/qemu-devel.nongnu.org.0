Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F5A3FE4E3
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 23:26:00 +0200 (CEST)
Received: from localhost ([::1]:56680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLXk7-0006iW-GJ
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 17:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1mLXhl-0004n1-Ca
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 17:23:33 -0400
Received: from mga12.intel.com ([192.55.52.136]:37649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1mLXhi-0004Fl-Ir
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 17:23:32 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10094"; a="198425764"
X-IronPort-AV: E=Sophos;i="5.84,370,1620716400"; d="scan'208";a="198425764"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 14:23:23 -0700
X-IronPort-AV: E=Sophos;i="5.84,370,1620716400"; d="scan'208";a="467077094"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 14:23:23 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/5] virtio-gpu: Add a default synchronization mechanism
 for blobs
Date: Wed,  1 Sep 2021 14:10:09 -0700
Message-Id: <20210901211014.2800391-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136;
 envelope-from=vivek.kasireddy@intel.com; helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Guests that are using frontbuffer rendering such as some X compositors,
Windows compositors, etc.

The way it works is the Guest submits the resource_flush command and
waits -- for example over a dma fence -- until virtio-gpu sends an ack.
And, the UI will queue a new repaint request and waits until the sync
object associated with the Blit is signaled. Once this is done, the UI
will trigger virtio-gpu to send an ack for the resource_flush cmd.

v2:
- Added more description in the cover letter
- Removed the wait from resource_flush and included it in
  a gl_flushed() callback

v3:
- Instead of explicitly waiting on the sync object and stalling the
  thread, add the relevant fence fd to Qemu's main loop and wait
  for it to be signalled. (suggested by Gerd Hoffmann)

v4:
- Replace the field 'blob' with 'allow_fences' in QemuDmabuf struct.
  (Gerd)

v5: rebase

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Tina Zhang <tina.zhang@intel.com>

Vivek Kasireddy (5):
  ui/gtk: Create a common release_dmabuf helper
  ui/egl: Add egl helpers to help with synchronization
  ui: Create sync objects and fences only for blobs
  ui/gtk-egl: Wait for the draw signal for dmabuf blobs
  virtio-gpu: Add gl_flushed callback

 hw/display/virtio-gpu-udmabuf.c |  1 +
 hw/display/virtio-gpu.c         | 32 ++++++++++++++++++++++--
 include/ui/console.h            |  3 +++
 include/ui/egl-helpers.h        |  3 +++
 include/ui/gtk.h                |  5 ++--
 ui/egl-helpers.c                | 26 ++++++++++++++++++++
 ui/gtk-egl.c                    | 43 +++++++++++++++++++++++++++------
 ui/gtk-gl-area.c                | 20 +++++++++++++++
 ui/gtk.c                        | 26 ++++++++++++++++++--
 9 files changed, 145 insertions(+), 14 deletions(-)

-- 
2.30.2


