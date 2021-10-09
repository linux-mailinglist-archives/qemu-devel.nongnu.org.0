Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 915ED427D83
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 23:10:06 +0200 (CEST)
Received: from localhost ([::1]:38414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZJbY-00066S-OI
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 17:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJaU-0004te-LD
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:08:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJaR-0008Fe-6B
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:08:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633813733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=k14dEvMnbbOQUT5Lb0p60MJVapmniC9z+oRhtt7ZhoE=;
 b=BJ/bn+82rNkCgoy5QQdHClaLuuziwoe2j8HmKOcJQoynxUQ0qBs5ehGvXZ9tJKF/82mEjK
 QF2gFowPtPcDSQHPNjtpwM6MpDQTyM1Qc0/loMOMa8g4Qst/yzykZfOLp84/KimjYZS1PU
 j52uXYBMRJJ8JhR/FPX89+8x01pnamA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-nXLYozZCPYCNzCpQwz3Y2A-1; Sat, 09 Oct 2021 17:08:48 -0400
X-MC-Unique: nXLYozZCPYCNzCpQwz3Y2A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC720801A93
 for <qemu-devel@nongnu.org>; Sat,  9 Oct 2021 21:08:47 +0000 (UTC)
Received: from localhost (unknown [10.39.208.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4C5A5D9D3;
 Sat,  9 Oct 2021 21:08:41 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/37] Add D-Bus display backend
Date: Sun, 10 Oct 2021 01:08:01 +0400
Message-Id: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

Hi,=0D
=0D
Both Spice and VNC are relatively complex and inefficient for local-only=0D
display/console export.=0D
=0D
The goal of this display backend is to export over D-Bus an interface close=
 to=0D
the QEMU internal APIs. Any -display or -audio backend should be possible t=
o=0D
implement externally that way. It will allow third-parties to maintain thei=
r own=0D
backends (UI toolkits, servers etc), and eventually reduce the responsabili=
ty on=0D
QEMU.=0D
=0D
D-Bus is the protocol of choice for the desktop, it has many convenient bin=
dings=0D
for various languages and tools. Data blob transfer is more efficient than =
QMP=0D
too. Backends can come and go as needed: you can have several display opene=
d=0D
(say Boxes & virt-manager), while exporting the display over VNC for exampl=
e=0D
from a different process. It works best on Unix, but there is some Windows=
=0D
support too (even Windows has some AF_UNIX nowadays, and the WSL2 situation=
 may=0D
change the future of QEMU on Windows anyway).=0D
=0D
Using it only requires "-display dbus" on any reasonable Linux desktop with=
 a=0D
D-Bus session bus. Then you use can use busctl, d-feet or gdbus, ex:=0D
$ gdbus introspect --session -r -d org.qemu -o /=0D
=0D
See the different patches and documentation for further options. The p2p=3D=
on mode=0D
should also allow users running bus-less (on MacOS for ex). We can also add=
 TCP=0D
socket if needed (although more work would be needed in this case to replac=
e=0D
the FD-passing with some extra TCP listening socket).=0D
=0D
A WIP Rust/Gtk4 client and VNC server is: https://gitlab.com/marcandre.lure=
au/qemu-display/=0D
(check README.md for details, then `cargo run` should connect to QEMU)=0D
=0D
The Sphinx build support works best with "[PATCH 0/6] Some Sphinx improveme=
nts",=0D
where module dependency tracking is improved.=0D
=0D
I can resend the first set of preliminary patches after some feedback.=0D
=0D
Thanks=0D
=0D
v2:=0D
 - rebased=0D
 - drop for the vhost-user-gpu work for now=0D
 - add documentation, including D-Bus Sphinx directive=0D
 - add bus-less option (p2p=3Don)=0D
 - add some basic tests for the Console/Keyboard interfaces=0D
 - add clipboard sharing support=0D
 - add chardev redirection support (allowing USB redirection, monitors,=0D
   serials...)=0D
 - register a VC handler to export default serial/monitors=0D
 - probably a few bug fixes here and there too=0D
=0D
Marc-Andr=C3=A9 Lureau (37):=0D
  build-sys: move Spice configure handling to meson=0D
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
 configure                       |  49 +-=0D
 meson.build                     |  46 +-=0D
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
 tests/qtest/dbus-display-test.c | 281 ++++++++++++=0D
 tests/qtest/libqtest.c          |  19 +=0D
 ui/clipboard.c                  |  34 +-=0D
 ui/console.c                    | 305 +++++++++----=0D
 ui/dbus-chardev.c               | 296 +++++++++++++=0D
 ui/dbus-clipboard.c             | 457 +++++++++++++++++++=0D
 ui/dbus-console.c               | 497 +++++++++++++++++++++=0D
 ui/dbus-error.c                 |  48 ++=0D
 ui/dbus-listener.c              | 486 ++++++++++++++++++++=0D
 ui/dbus-module.c                |  35 ++=0D
 ui/dbus.c                       | 477 ++++++++++++++++++++=0D
 ui/egl-context.c                |   6 +-=0D
 ui/egl-headless.c               |  20 +-=0D
 ui/gtk-clipboard.c              |  23 +-=0D
 ui/gtk-egl.c                    |  11 +-=0D
 ui/gtk-gl-area.c                |   9 +-=0D
 ui/gtk.c                        |  28 +-=0D
 ui/sdl2-gl.c                    |  12 +-=0D
 ui/sdl2.c                       |  16 +-=0D
 ui/spice-core.c                 |  50 ---=0D
 ui/spice-display.c              |  27 +-=0D
 ui/util.c                       |  75 ++++=0D
 ui/vdagent.c                    |  94 +++-=0D
 ui/vnc-clipboard.c              |  21 +-=0D
 ui/vnc.c                        |   4 +-=0D
 MAINTAINERS                     |  10 +-=0D
 audio/meson.build               |   8 +-=0D
 audio/trace-events              |   5 +=0D
 backends/dbus-vmstate1.xml      |  52 +++=0D
 chardev/meson.build             |   2 +-=0D
 meson_options.txt               |   6 +=0D
 qemu-options.hx                 |  20 +=0D
 scripts/modinfo-collect.py      |   3 +=0D
 tests/qtest/dbus-vmstate1.xml   |  12 -=0D
 tests/qtest/meson.build         |  10 +-=0D
 ui/cocoa.m                      |  20 +-=0D
 ui/dbus-display1.xml            | 761 ++++++++++++++++++++++++++++++++=0D
 ui/meson.build                  |  32 +-=0D
 ui/trace-events                 |  15 +=0D
 79 files changed, 6284 insertions(+), 460 deletions(-)=0D
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
2.33.0.721.g106298f7f9=0D
=0D


