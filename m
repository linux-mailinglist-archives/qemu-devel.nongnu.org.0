Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F525EBD33
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 10:26:50 +0200 (CEST)
Received: from localhost ([::1]:60618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od5vV-000151-5q
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 04:26:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1od5oL-00057k-A8
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 04:19:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1od5oI-0000Ha-I4
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 04:19:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664266759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZrsRPawWkunlvhVNVnflPd4WDQw69927DCF0BTYV6rs=;
 b=OgX2vYDpil6go9pj6o6UuMF9iBwcOx1dNUdrL7THNdaZOJsulul7JnpHendnQbOgFRPbJG
 gk/ysIo0ASRtg7ydXupozDi9t7+NqhYgH4cN2Tvjjpprzu11OFFl8Bgb87ddWdlIOXHha+
 3DiMostmFRTKGiBYC6gwfUnvxp80Ln8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-Vws03tuOPKO7Y_mK6dF61Q-1; Tue, 27 Sep 2022 04:19:15 -0400
X-MC-Unique: Vws03tuOPKO7Y_mK6dF61Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8DCD1E68196;
 Tue, 27 Sep 2022 08:19:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 50085111DCE0;
 Tue, 27 Sep 2022 08:19:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CB5A91800622; Tue, 27 Sep 2022 10:19:12 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Qiuhao Li <Qiuhao.Li@outlook.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Alexandre Ratchov <alex@caoua.org>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/24] Kraxel 20220927 patches
Date: Tue, 27 Sep 2022 10:18:48 +0200
Message-Id: <20220927081912.180983-1-kraxel@redhat.com>
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

  https://gitlab.com/kraxel/qemu.git tags/kraxel-20220927-pull-request

for you to fetch changes up to 49a99ecb2290571b2e3f464c13e9c73b87ca91c4:

  virtio-gpu: update scanout if there is any area covered by the rect (2022-09-27 07:32:31 +0200)

----------------------------------------------------------------
usb: make usbnet work with xhci.
audio: add sndio backend.
misc bugfixes for console, xhci, audio, ati-vga and virtio-gpu.

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

Qiang Liu (2):
  hcd-ohci: Drop ohci_service_iso_td() if ed->head & OHCI_DPTR_MASK is
    zero
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
 hw/usb/hcd-ohci.c             |  10 +
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
 31 files changed, 903 insertions(+), 205 deletions(-)
 create mode 100644 audio/sndioaudio.c

-- 
2.37.3


