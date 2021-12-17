Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E263478DFC
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 15:41:31 +0100 (CET)
Received: from localhost ([::1]:55468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myEQM-0007cR-DB
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 09:41:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1myEND-00054U-H6
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:38:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1myEN9-00070X-JF
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:38:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639751885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iU0mdPgsQmtovVHTDcHShLFJ8koT6VlECR4UczSIeiE=;
 b=eZd75KOukyCsmQzyDo1HUi0a+g7KxmsGjEBLDv5h0vGei3S0FkzP1szjZ9kWmM+CZhctc4
 VP0U0Gxa2BtpF++JGkqdRLD2SVIqtAofKCK/YFyIRpP8Fn2En/E6bHPAPTvQ3sUkbkGrIV
 Lrv7HhZq3Dt4pCAX+966U5SvhKfnPaE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-tJifwIn-Pqy9nqJFanx9Yg-1; Fri, 17 Dec 2021 09:38:02 -0500
X-MC-Unique: tJifwIn-Pqy9nqJFanx9Yg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99F1B190A7A8;
 Fri, 17 Dec 2021 14:38:01 +0000 (UTC)
Received: from localhost (unknown [10.39.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B4505ED3F;
 Fri, 17 Dec 2021 14:37:59 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 00/36] ui: D-Bus display backend
Date: Fri, 17 Dec 2021 18:37:20 +0400
Message-Id: <20211217143756.1831099-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org, kraxel@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

The following changes since commit 29eb5c2c86f935b0e9700fad2ecfe8a32b011d57=
:=0D
=0D
  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging =
(2021-12-16 08:39:20 -0800)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/marcandre.lureau/qemu.git tags/dbus-pull-request=0D
=0D
for you to fetch changes up to 8ab5413e336bb199a9648b29a20d049e0e066611:=0D
=0D
  MAINTAINERS: update D-Bus section (2021-12-17 18:21:22 +0400)=0D
=0D
----------------------------------------------------------------=0D
Add D-Bus display backend=0D
=0D
----------------------------------------------------------------=0D
=0D
Marc-Andr=C3=A9 Lureau (36):=0D
  ui/vdagent: add CHECK_SPICE_PROTOCOL_VERSION=0D
  ui/vdagent: replace #if 0 with protocol version check=0D
  ui: generalize clipboard notifier=0D
  ui/vdagent: add serial capability support=0D
  ui/clipboard: add qemu_clipboard_check_serial()=0D
  ui/clipboard: add a clipboard reset serial event=0D
  hw/display: report an error if virgl initialization failed=0D
  virtio-gpu: use VIRTIO_GPU_RESOURCE_FLAG_Y_0_TOP=0D
  ui: do not delay further remote resize=0D
  ui: factor out qemu_console_set_display_gl_ctx()=0D
  ui: associate GL context outside of display listener registration=0D
  ui: make gl_block use a counter=0D
  ui: add a gl-unblock warning timer=0D
  ui: simplify gl unblock & flush=0D
  ui: dispatch GL events to all listeners=0D
  ui: split the GL context in a different object=0D
  ui: move qemu_spice_fill_device_address to ui/util.c=0D
  console: save current scanout details=0D
  scripts: teach modinfo to skip non-C sources=0D
  docs/sphinx: add sphinx modules to include D-Bus documentation=0D
  backends: move dbus-vmstate1.xml to backends/=0D
  docs: move D-Bus VMState documentation to source XML=0D
  docs: add dbus-display documentation=0D
  build-sys: set glib dependency version=0D
  ui: add a D-Bus display backend=0D
  ui/dbus: add p2p=3Don/off option=0D
  tests/qtests: add qtest_qmp_add_client()=0D
  tests: start dbus-display-test=0D
  audio: add "dbus" audio backend=0D
  ui/dbus: add clipboard interface=0D
  chardev: teach socket to accept no addresses=0D
  chardev: make socket derivable=0D
  option: add g_auto for QemuOpts=0D
  ui/dbus: add chardev backend & interface=0D
  ui/dbus: register D-Bus VC handler=0D
  MAINTAINERS: update D-Bus section=0D
=0D
 docs/conf.py                    |   8 +=0D
 docs/interop/dbus-display.rst   |  31 ++=0D
 docs/interop/dbus-vmstate.rst   |  52 +--=0D
 docs/interop/dbus.rst           |   2 +=0D
 docs/interop/index.rst          |   1 +=0D
 docs/sphinx/dbusdoc.py          | 166 +++++++=0D
 docs/sphinx/dbusdomain.py       | 406 +++++++++++++++++=0D
 docs/sphinx/dbusparser.py       | 373 ++++++++++++++++=0D
 docs/sphinx/fakedbusdoc.py      |  25 ++=0D
 configure                       |   1 +=0D
 meson.build                     |  22 +-=0D
 qapi/audio.json                 |   3 +-=0D
 qapi/char.json                  |  27 ++=0D
 qapi/misc.json                  |   4 +-=0D
 qapi/ui.json                    |  34 +-=0D
 audio/audio_int.h               |   7 +=0D
 audio/audio_template.h          |   2 +=0D
 include/chardev/char-socket.h   |  86 ++++=0D
 include/qemu/cutils.h           |   5 +=0D
 include/qemu/dbus.h             |  24 +=0D
 include/qemu/option.h           |   2 +=0D
 include/ui/clipboard.h          |  55 ++-=0D
 include/ui/console.h            |  70 ++-=0D
 include/ui/dbus-display.h       |  17 +=0D
 include/ui/dbus-module.h        |  11 +=0D
 include/ui/egl-context.h        |   6 +-=0D
 include/ui/gtk.h                |  11 +-=0D
 include/ui/sdl2.h               |   7 +-=0D
 include/ui/spice-display.h      |   5 +-=0D
 tests/qtest/libqos/libqtest.h   |  10 +=0D
 ui/dbus.h                       | 144 ++++++=0D
 audio/audio.c                   |   1 +=0D
 audio/dbusaudio.c               | 654 +++++++++++++++++++++++++++=0D
 chardev/char-socket.c           |  72 +--=0D
 hw/display/qxl.c                |   7 +-=0D
 hw/display/vhost-user-gpu.c     |   2 +-=0D
 hw/display/virtio-gpu-base.c    |   5 +-=0D
 hw/display/virtio-gpu-virgl.c   |   3 +-=0D
 hw/display/virtio-vga.c         |  11 -=0D
 monitor/qmp-cmds.c              |  13 +=0D
 tests/qtest/dbus-display-test.c | 257 +++++++++++=0D
 tests/qtest/libqtest.c          |  19 +=0D
 ui/clipboard.c                  |  34 +-=0D
 ui/console.c                    | 305 +++++++++----=0D
 ui/dbus-chardev.c               | 296 +++++++++++++=0D
 ui/dbus-clipboard.c             | 457 +++++++++++++++++++=0D
 ui/dbus-console.c               | 497 +++++++++++++++++++++=0D
 ui/dbus-error.c                 |  48 ++=0D
 ui/dbus-listener.c              | 486 ++++++++++++++++++++=0D
 ui/dbus-module.c                |  35 ++=0D
 ui/dbus.c                       | 482 ++++++++++++++++++++=0D
 ui/egl-context.c                |   6 +-=0D
 ui/egl-headless.c               |  20 +-=0D
 ui/gtk-clipboard.c              |  23 +-=0D
 ui/gtk-egl.c                    |  12 +-=0D
 ui/gtk-gl-area.c                |  10 +-=0D
 ui/gtk.c                        |  28 +-=0D
 ui/sdl2-gl.c                    |  12 +-=0D
 ui/sdl2.c                       |  16 +-=0D
 ui/spice-core.c                 |  50 ---=0D
 ui/spice-display.c              |  27 +-=0D
 ui/util.c                       |  75 ++++=0D
 ui/vdagent.c                    |  94 +++-=0D
 ui/vnc-clipboard.c              |  23 +-=0D
 ui/vnc.c                        |   4 +-=0D
 MAINTAINERS                     |  10 +-=0D
 audio/meson.build               |   6 +=0D
 audio/trace-events              |   5 +=0D
 backends/dbus-vmstate1.xml      |  52 +++=0D
 meson_options.txt               |   2 +=0D
 qemu-options.hx                 |  20 +=0D
 scripts/meson-buildoptions.sh   |   3 +=0D
 scripts/modinfo-collect.py      |   3 +=0D
 tests/qtest/dbus-vmstate1.xml   |  12 -=0D
 tests/qtest/meson.build         |  10 +-=0D
 ui/cocoa.m                      |  20 +-=0D
 ui/dbus-display1.xml            | 761 ++++++++++++++++++++++++++++++++=0D
 ui/meson.build                  |  28 ++=0D
 ui/trace-events                 |  15 +=0D
 79 files changed, 6248 insertions(+), 400 deletions(-)=0D
 create mode 100644 docs/interop/dbus-display.rst=0D
 create mode 100644 docs/sphinx/dbusdoc.py=0D
 create mode 100644 docs/sphinx/dbusdomain.py=0D
 create mode 100644 docs/sphinx/dbusparser.py=0D
 create mode 100644 docs/sphinx/fakedbusdoc.py=0D
 create mode 100644 include/chardev/char-socket.h=0D
 create mode 100644 include/ui/dbus-display.h=0D
 create mode 100644 include/ui/dbus-module.h=0D
 create mode 100644 ui/dbus.h=0D
 create mode 100644 audio/dbusaudio.c=0D
 create mode 100644 tests/qtest/dbus-display-test.c=0D
 create mode 100644 ui/dbus-chardev.c=0D
 create mode 100644 ui/dbus-clipboard.c=0D
 create mode 100644 ui/dbus-console.c=0D
 create mode 100644 ui/dbus-error.c=0D
 create mode 100644 ui/dbus-listener.c=0D
 create mode 100644 ui/dbus-module.c=0D
 create mode 100644 ui/dbus.c=0D
 create mode 100644 ui/util.c=0D
 create mode 100644 backends/dbus-vmstate1.xml=0D
 delete mode 100644 tests/qtest/dbus-vmstate1.xml=0D
 create mode 100644 ui/dbus-display1.xml=0D
=0D
--=20=0D
2.34.1.8.g35151cf07204=0D
=0D


