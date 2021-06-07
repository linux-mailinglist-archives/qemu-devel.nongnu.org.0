Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B153739EA3E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 01:39:59 +0200 (CEST)
Received: from localhost ([::1]:36962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqOqc-0003Gl-OM
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 19:39:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lqOot-0001VU-5I
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 19:38:11 -0400
Received: from mga06.intel.com ([134.134.136.31]:2273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lqOoq-00071e-Lv
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 19:38:10 -0400
IronPort-SDR: /2lq37VON4ZU9ruqGlyglNtAdmBpJj5mldbEBZRYlI+AJxp0Cw70WW5JqoWxEaeo+RjDT0koNA
 TGuXgL3bbxwA==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="265889544"
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="265889544"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 16:38:02 -0700
IronPort-SDR: /qu5dv6PcLrQDX3HBQhgaXcvthfDwACiVyjbrB6BmbDl9+I6OKBnTQQSu+xL2lujSr3PqRjcoA
 AjQkjEruZ9pA==
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="551403343"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 16:38:02 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/5] virtio-gpu: Add implicit (and default) sync mechanism
 for blobs
Date: Mon,  7 Jun 2021 16:25:25 -0700
Message-Id: <20210607232530.454435-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=vivek.kasireddy@intel.com; helo=mga06.intel.com
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
waits until its Blit is completed by the Host GPU before returning
control back to the Guest from resource_flush().

This should be the default behavior regardless of the type of Guest
that is using Blob resources but would be particularly useful for 
Guests that are using frontbuffer rendering such as Linux with X
or Windows 10, etc.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Tina Zhang <tina.zhang@intel.com>

Vivek Kasireddy (5):
  ui/gtk: Create a common release_dmabuf helper
  ui: Add a helper to wait on a dmabuf sync object
  ui/egl: Add egl helpers to help with synchronization
  ui: Create sync objects only for blobs
  virtio-gpu: Make resource_flush wait on the sync object for blobs

 hw/display/virtio-gpu-udmabuf.c | 30 ++++++++++++++++++++++
 hw/display/virtio-gpu.c         |  1 +
 include/hw/virtio/virtio-gpu.h  |  2 ++
 include/ui/console.h            |  8 ++++++
 include/ui/egl-helpers.h        |  4 +++
 include/ui/gtk.h                |  2 --
 ui/console.c                    | 10 ++++++++
 ui/egl-helpers.c                | 44 +++++++++++++++++++++++++++++++++
 ui/gtk-egl.c                    | 18 ++++++++------
 ui/gtk-gl-area.c                |  8 ++++++
 ui/gtk.c                        | 26 ++++++++++++++++++-
 11 files changed, 142 insertions(+), 11 deletions(-)

-- 
2.30.2


