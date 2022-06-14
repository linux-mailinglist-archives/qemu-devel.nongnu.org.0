Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C2E54B068
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 14:21:13 +0200 (CEST)
Received: from localhost ([::1]:50496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o15Xk-0002bM-GX
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 08:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o15T8-0006Uk-EL
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 08:16:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o15T0-0007kY-Ob
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 08:16:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655208978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6LLN3PRRdurbe5WDvmvbhPsA1qOqsjYEdVF0UsvlhBQ=;
 b=RxEvGxyPvOJ0oCf0A2R5yexbt0KkpuH69vXAMSZn+mit22DBSgNCUDU7giU715JXBzTiPc
 WObkrEeQEA8+2wQbsI0pKzCaTip5rZ6FY4FZvI5u84E5d3XRdlXMxr9SkWC06IOF2x5Lec
 AWOcenMbwYYgxCvFX/DyukROnd01D3Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-L15e5m9TNUyMxihfL8XLtA-1; Tue, 14 Jun 2022 08:16:13 -0400
X-MC-Unique: L15e5m9TNUyMxihfL8XLtA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80F2D1C0514D;
 Tue, 14 Jun 2022 12:16:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 44AB1492C3B;
 Tue, 14 Jun 2022 12:16:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E1A291800084; Tue, 14 Jun 2022 14:16:10 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Hongren (Zenithal) Zheng" <i@zenithal.me>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Canokeys.org" <contact@canokeys.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PULL 00/15] Kraxel 20220614 patches
Date: Tue, 14 Jun 2022 14:15:55 +0200
Message-Id: <20220614121610.508356-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit debd0753663bc89c86f5462a53268f2e3f680f60:

  Merge tag 'pull-testing-next-140622-1' of https://github.com/stsquad/qemu into staging (2022-06-13 21:10:57 -0700)

are available in the Git repository at:

  git://git.kraxel.org/qemu tags/kraxel-20220614-pull-request

for you to fetch changes up to b95b56311a0890da0c9f7fc624529c3d7f8dbce0:

  virtio-gpu: Respect UI refresh rate for EDID (2022-06-14 10:34:37 +0200)

----------------------------------------------------------------
usb: add CanoKey device, fixes for ehci + redir
ui: fixes for gtk and cocoa, rework refresh rate
virtio-gpu: scanout flush fix

----------------------------------------------------------------

Akihiko Odaki (4):
  ui/cocoa: Fix poweroff request code
  ui/console: Do not return a value with ui_info
  ui: Deliver refresh rate via QemuUIInfo
  virtio-gpu: Respect UI refresh rate for EDID

Arnout Engelen (1):
  hw/usb/hcd-ehci: fix writeback order

Dongwon Kim (1):
  virtio-gpu: update done only on the scanout associated with rect

Hongren (Zenithal) Zheng (6):
  hw/usb: Add CanoKey Implementation
  hw/usb/canokey: Add trace events
  meson: Add CanoKey
  docs: Add CanoKey documentation
  docs/system/devices/usb: Add CanoKey to USB devices examples
  MAINTAINERS: add myself as CanoKey maintainer

Joelle van Dyne (1):
  usbredir: avoid queuing hello packet on snapshot restore

Volker Rümelin (2):
  ui/gtk-gl-area: implement GL context destruction
  ui/gtk-gl-area: create the requested GL context version

 meson_options.txt                |   2 +
 hw/usb/canokey.h                 |  69 +++++++
 include/hw/virtio/virtio-gpu.h   |   1 +
 include/ui/console.h             |   4 +-
 include/ui/gtk.h                 |   2 +-
 hw/display/virtio-gpu-base.c     |   7 +-
 hw/display/virtio-gpu.c          |   4 +
 hw/display/virtio-vga.c          |   5 +-
 hw/display/xenfb.c               |  14 +-
 hw/usb/canokey.c                 | 313 +++++++++++++++++++++++++++++++
 hw/usb/hcd-ehci.c                |   5 +-
 hw/usb/redirect.c                |   3 +-
 hw/vfio/display.c                |   8 +-
 ui/console.c                     |   6 -
 ui/gtk-egl.c                     |   4 +-
 ui/gtk-gl-area.c                 |  42 ++++-
 ui/gtk.c                         |  45 +++--
 MAINTAINERS                      |   8 +
 docs/system/device-emulation.rst |   1 +
 docs/system/devices/canokey.rst  | 168 +++++++++++++++++
 docs/system/devices/usb.rst      |   4 +
 hw/usb/Kconfig                   |   5 +
 hw/usb/meson.build               |   5 +
 hw/usb/trace-events              |  16 ++
 meson.build                      |   6 +
 scripts/meson-buildoptions.sh    |   3 +
 ui/cocoa.m                       |   6 +-
 ui/trace-events                  |   2 +
 28 files changed, 707 insertions(+), 51 deletions(-)
 create mode 100644 hw/usb/canokey.h
 create mode 100644 hw/usb/canokey.c
 create mode 100644 docs/system/devices/canokey.rst

-- 
2.36.1


