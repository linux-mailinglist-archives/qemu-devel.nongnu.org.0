Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 866AC3AF648
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 21:39:30 +0200 (CEST)
Received: from localhost ([::1]:49944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvPlY-00019d-IU
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 15:39:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lvPjf-0006xI-57
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 15:37:31 -0400
Received: from mga02.intel.com ([134.134.136.20]:17368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lvPjd-00081y-3N
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 15:37:30 -0400
IronPort-SDR: 2544dnsvXusKzcvVy+tWVd87cBOQcm2MKHKb7v5Qw4jqW+rgMAdYPjMLqoxODWdSKjUrRbLfAx
 OHor5IfHYhwA==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="194056711"
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="194056711"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 12:37:16 -0700
IronPort-SDR: 61dZK9TEpasX4xs5kWqa2xqfwk1KRUsPJLTgyZHEL+SXF+lMb9kKa5J/2ECn/ZO/G0dh2Qq+fj
 ZEW+7cste1mQ==
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="473524006"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 12:37:15 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/5] virtio-gpu: Add a default synchronization mechanism
 for blobs
Date: Mon, 21 Jun 2021 12:24:20 -0700
Message-Id: <20210621192425.1188442-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.20;
 envelope-from=vivek.kasireddy@intel.com; helo=mga02.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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

v3:
- Instead of explicitly waiting on the sync object and stalling the
  thread, add the relevant fence fd to Qemu's main loop and wait
  for it to be signalled. (suggested by Gerd Hoffmann)

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


