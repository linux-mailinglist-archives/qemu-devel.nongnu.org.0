Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB6C40A00E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 00:35:43 +0200 (CEST)
Received: from localhost ([::1]:52616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPuYA-0007NU-E6
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 18:35:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1mPuWa-0005Lx-QJ
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 18:34:04 -0400
Received: from mga01.intel.com ([192.55.52.88]:34057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1mPuWX-0007zA-4g
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 18:34:04 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="244139497"
X-IronPort-AV: E=Sophos;i="5.85,290,1624345200"; d="scan'208";a="244139497"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 15:33:52 -0700
X-IronPort-AV: E=Sophos;i="5.85,290,1624345200"; d="scan'208";a="432749425"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 15:33:52 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 0/2] ui: Add a Wayland backend for Qemu UI (v2)
Date: Mon, 13 Sep 2021 15:20:34 -0700
Message-Id: <20210913222036.3193732-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Dongwon Kim <dongwon.kim@intel.com>,
 Satyeshwar Singh <satyeshwar.singh@intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Tina Zhang <tina.zhang@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Why does Qemu need a new Wayland UI backend?
The main reason why there needs to be a plain and simple Wayland backend
for Qemu UI is to eliminate the Blit (aka GPU copy) that happens if using
a toolkit like GTK or SDL (because they use EGL). The Blit can be eliminated
by sharing the dmabuf fd -- associated with the Guest scanout buffer --
directly with the Host compositor via the linux-dmabuf (unstable) protocol.
Once properly integrated, it would be potentially possible to have the
scanout buffer created by the Guest compositor be placed directly on a
hardware plane on the Host thereby improving performance. Only Guest 
compositors that use multiple back buffers (at-least 1 front and 1 back)
and virtio-gpu would benefit from this work.

v2:
- Add support for handling/forwarding keyboard and mouse events.
- Augment handling of events to ensure that they are not lost in a
  multi-threaded environment.
- Rebase

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Tina Zhang <tina.zhang@intel.com>
Cc: Satyeshwar Singh <satyeshwar.singh@intel.com>

Vivek Kasireddy (2):
  virtio-gpu: Add support for VIRTIO_GPU_F_RELEASE_FENCE
  ui: Add a plain Wayland backend for Qemu UI

 configure                                   |   8 +-
 hw/display/virtio-gpu-base.c                |   3 +
 hw/display/virtio-gpu-udmabuf.c             |   4 +-
 hw/display/virtio-gpu.c                     |  54 +-
 include/hw/virtio/virtio-gpu.h              |   6 +
 include/standard-headers/linux/virtio_gpu.h |   2 +
 meson.build                                 |  33 +
 meson_options.txt                           |   2 +
 qapi/ui.json                                |   3 +
 ui/meson.build                              |  52 ++
 ui/wayland.c                                | 628 ++++++++++++++++++++
 11 files changed, 791 insertions(+), 4 deletions(-)
 create mode 100644 ui/wayland.c

-- 
2.30.2


