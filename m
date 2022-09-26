Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CBF5E9EB7
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 12:11:43 +0200 (CEST)
Received: from localhost ([::1]:43420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocl5O-0000u3-0Q
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 06:11:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockpa-0004al-6p
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:55:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockpX-0003UM-6k
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:55:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664186114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kZFSHjrfdbA2GEsB+ImDTND6hHi7QUbce7w0KqsKC/c=;
 b=aEAe7tFr5rMaVc0LgpoLruTC7cbdTB3EgD5dd27IJ991hmIN3pXav0aFctfdwygBMa2pco
 UzB0beWmFg0OGh7aBZIIKkx4z0Uyzo9VD334FYtCTCCuXYugEiELv0D8vT80uJ3BK99mUW
 BXUZq4jBm+OSasrrjkHwRaII0MzbH1g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-412-wgekQieWPn-mP0-YlAHetw-1; Mon, 26 Sep 2022 05:55:12 -0400
X-MC-Unique: wgekQieWPn-mP0-YlAHetw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41196185A7A3;
 Mon, 26 Sep 2022 09:55:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 856A71121314;
 Mon, 26 Sep 2022 09:55:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D978C180079E; Mon, 26 Sep 2022 11:55:09 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Bandan Das <bsd@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Laurent Vivier <lvivier@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Alexandre Ratchov <alex@caoua.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PULL 00/25] Kraxel 20220926 patches
Date: Mon, 26 Sep 2022 11:54:44 +0200
Message-Id: <20220926095509.3759409-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The following changes since commit 6160d8ff81fb9fba70f5dad88d43ffd0fa44984c:

  Merge tag 'edgar/xilinx-next-2022-09-21.for-upstream' of https://github.com/edgarigl/qemu into staging (2022-09-22 13:24:28 -0400)

are available in the Git repository at:

  https://gitlab.com/kraxel/qemu.git tags/kraxel-20220926-pull-request

for you to fetch changes up to f76582f0a282ec95d6dc9c7cd1903c997fd060a6:

  virtio-gpu: update scanout if there is any area covered by the rect (2022-09-23 14:38:28 +0200)

----------------------------------------------------------------
usb: make usbnet work with xhci.
audio: add sndio backend.
misc bugfixes for console, xhci, ohci, audio, ati-vga and virtio-gpu.

----------------------------------------------------------------

Akihiko Odaki (3):
  ui/cocoa: Run qemu_init in the main thread
  Revert "main-loop: Disable block backend global state assertion on
    Cocoa"
  meson: Allow to enable gtk and sdl while cocoa is enabled

Alexandre Ratchov (1):
  audio: Add sndio backend

Cal Peake (1):
  ui/console: Get tab completion working again in the SDL monitor vc

Dongwon Kim (1):
  virtio-gpu: update scanout if there is any area covered by the rect

Gerd Hoffmann (2):
  usb/msd: move usb_msd_packet_complete()
  usb/msd: add usb_msd_fatal_error() and fix guest-triggerable assert

Marc-André Lureau (5):
  ui: add some vdagent related traces
  ui/clipboard: fix serial priority
  ui/vdagent: always reset the clipboard serial on caps
  ui/clipboard: reset the serial state on reset
  ui/vdagent: fix serial reset of guest agent

Michael Brown (4):
  usbnet: Add missing usb_wakeup() call in usbnet_receive()
  usbnet: Accept mandatory USB_CDC_SET_ETHERNET_PACKET_FILTER request
  usbnet: Detect short packets as sent by the xHCI controller
  usbnet: Report link-up via interrupt endpoint in CDC-ECM mode

Philippe Mathieu-Daudé (1):
  hw/display/ati_2d: Fix buffer overflow in ati_2d_blt (CVE-2021-3638)

Qiang Liu (3):
  hcd-ohci: Drop ohci_service_iso_td() if ed->head & OHCI_DPTR_MASK is
    zero
  hcd-ohci: Fix inconsistency when resetting ohci root hubs
  hcd-xhci: drop operation with secondary stream arrays enabled

Thomas Huth (1):
  hw/usb/hcd-xhci: Check whether DMA accesses fail

Volker Rümelin (3):
  ui/console: fix three double frees in png_save()
  Revert "audio: Log context for audio bug"
  audio: remove abort() in audio_bug()

 meson_options.txt             |   4 +-
 audio/audio_template.h        |  29 +-
 include/hw/usb/msd.h          |   1 +
 include/qemu-main.h           |   3 +-
 include/qemu/main-loop.h      |  13 -
 include/sysemu/sysemu.h       |   2 +-
 include/ui/console.h          |   1 +
 audio/audio.c                 |  25 +-
 audio/sndioaudio.c            | 565 ++++++++++++++++++++++++++++++++++
 hw/display/ati_2d.c           |   6 +-
 hw/display/virtio-gpu.c       |   7 +-
 hw/usb/dev-network.c          |  38 ++-
 hw/usb/dev-storage.c          |  56 +++-
 hw/usb/hcd-ohci.c             |  12 +-
 hw/usb/hcd-xhci.c             |  68 +++-
 softmmu/main.c                |  10 +-
 softmmu/vl.c                  |   2 +-
 tests/qtest/fuzz/fuzz.c       |   2 +-
 ui/clipboard.c                |  18 +-
 ui/console.c                  |   6 +-
 ui/vdagent.c                  |  13 +-
 MAINTAINERS                   |   7 +
 audio/meson.build             |   1 +
 docs/devel/fuzzing.rst        |   4 +-
 hw/usb/trace-events           |   1 +
 meson.build                   |  19 +-
 qapi/audio.json               |  25 +-
 qemu-options.hx               |  16 +
 scripts/meson-buildoptions.sh |   7 +-
 ui/cocoa.m                    | 144 +++------
 ui/trace-events               |   5 +
 31 files changed, 904 insertions(+), 206 deletions(-)
 create mode 100644 audio/sndioaudio.c

-- 
2.37.3


