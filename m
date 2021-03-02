Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E073296D2
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 09:16:47 +0100 (CET)
Received: from localhost ([::1]:49784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH0D0-0004u0-C8
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 03:16:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lH0BB-0003mF-FW
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 03:14:53 -0500
Received: from mga09.intel.com ([134.134.136.24]:10371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lH0B8-00014E-IV
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 03:14:52 -0500
IronPort-SDR: kwC6SJnKU5ZxtQmANGWN7CdDq+U5sb2KOF5tuHSPn8n+X9/+toSJvE1gsTxwO5Q19mX1SKF8TE
 roGZ9wl/gvvw==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="186847479"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="186847479"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 00:14:43 -0800
IronPort-SDR: SN2t8LiOk10OgNo67eqB4sdUwZQnt9jLW5lH1cP0RUJjTNApvpTM4D3WyhSZRKRmNNVyV1PXxH
 TAzMngjTJgvA==
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="398340551"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 00:14:42 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC 0/1] Use dmabufs for display updates instead of pixman
Date: Tue,  2 Mar 2021 00:03:57 -0800
Message-Id: <20210302080358.3095748-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.24;
 envelope-from=vivek.kasireddy@intel.com; helo=mga09.intel.com
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Dongwon Kim <dongwon.kim@intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is still a WIP/RFC patch that attempts to use dmabufs for display
updates with the help of Udmabuf driver instead of pixman. This patch
is posted to the ML to elicit feedback and start a discussion whether
something like this would be useful or not for mainly non-Virgl
rendered BOs and also potentially in other cases.

This patch was tested to work OK with Weston version from here:
https://gitlab.freedesktop.org/Vivek/weston/-/blob/virtgpu_dmabuf/libweston/backend-drm/drm-gbm.c#L282

and Qemu launched with these options:
qemu-system-x86_64 -m 8192m .... -device virtio-gpu-pci,max_outputs=1 -display gtk,gl=on .....
-object memory-backend-memfd,id=mem1,size=8192M -machine memory-backend=mem1

TODO:
- Use Blob resources for getting meta-data such as modifier, format, etc.
- Test with Virgil rendered BOs to see if this can be used in that case..

Considerations/Challenges:
- One of the main concerns with using dmabufs is how to synchronize access
to them and this use-case is no different. If the Guest is running Weston,
then it could use a maximum of 4 color buffers but uses only 2 by default and
flips between them if it is not sharing the FBs with other plugins while
running with the drm backend. In this case, how do we make sure that Weston
and Qemu UI are not using the same buffer at any given time? This is
complicated by the fact that the toolkits (that Qemu UI uses) do not seem to
provide a way to wait for buffer events. For example, GTK does not apparently
provide a way to either wait for "send done" events or register a listener
for wl_buffer release events that native Wayland/Weston clients have access to.

- If we have Xorg running in the Guest, then it gets even more interesting as
Xorg in some cases does frontbuffer rendering (uses DRM_IOCTL_MODE_DIRTYFB).
The same challenge arises in this case as well to determine how to safely
destroy or reuse the buffer in the Guest while it might be used on the Host.

Some of the potential solutions for addressing the above challenges include 
using syncronization primitives such as fences/sync objs in Qemu UI to
determine when a buffer/dmabuf is consumed by the Host display server/compositor
and hold up the vblank/flip done event until that time. But this one comes with
a performance concern as the Guest would not be able to queue up another flip
until the previous one finishes.

Other options include caching 2 or more dmabufs and releasing the others but 
this may not be feasible without having to modify the Guest display server/
compositor to use all color buffers or create a new color buffer each time.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>

Vivek Kasireddy (1):
  virtio-gpu: Use dmabuf for display updates if possible instead of
    pixman

 hw/display/virtio-gpu.c        | 133 +++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-gpu.h |  12 +++
 2 files changed, 145 insertions(+)

-- 
2.26.2


