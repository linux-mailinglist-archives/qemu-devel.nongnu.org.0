Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9E83B2625
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 06:24:28 +0200 (CEST)
Received: from localhost ([::1]:42886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwGuh-0000zZ-HF
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 00:24:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lwGtr-0000I4-4n
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 00:23:35 -0400
Received: from mga06.intel.com ([134.134.136.31]:55797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lwGto-0003kg-MF
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 00:23:34 -0400
IronPort-SDR: ofg2YJ4VS6Q3944UyLZDqchz+0c1bNsfP6oc4ZXmizDPCRb3a4uTuvjpwIyoxEcwDICkB/+2dZ
 QgsnSUNSK09w==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="268526359"
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="268526359"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 21:23:24 -0700
IronPort-SDR: 4ViqDD8rSAVI4hAT3NUxI73gJlIQvXgIbu/DbylwEUv0JPx0R9Wi/hdEjw1DGZy5YaM+UQCVt0
 dWA5IP/ocJRw==
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="624049663"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 21:23:24 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC v1 0/1] ui: Add a Wayland backend for Qemu UI
Date: Wed, 23 Jun 2021 21:10:39 -0700
Message-Id: <20210624041040.1250631-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Dongwon Kim <dongwon.kim@intel.com>, Tina Zhang <tina.zhang@intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Gerd Hoffmann <kraxel@redhat.com>
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

The patch(es) are still WIP and the only reason why I am sending them now
is to get feedback and see if anyone thinks this work is interesting. And,
even after this work is complete, it is not meant to be merged and can be
used for performance testing purposes. Given Qemu UI's new direction, the
proper way to add new backends is to create a separate UI/display module
that is part of the dbus/pipewire infrastructure that Marc-Andre is
working on:
https://lists.nongnu.org/archive/html/qemu-devel/2021-03/msg04331.html

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Tina Zhang <tina.zhang@intel.com>

Vivek Kasireddy (1):
  ui: Add a plain Wayland backend for Qemu UI

 configure         |  17 ++
 meson.build       |  25 +++
 meson_options.txt |   2 +
 qapi/ui.json      |  19 ++-
 ui/meson.build    |  52 ++++++
 ui/wayland.c      | 402 ++++++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 516 insertions(+), 1 deletion(-)
 create mode 100644 ui/wayland.c

-- 
2.30.2


