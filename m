Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9933389A1
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:07:02 +0100 (CET)
Received: from localhost ([::1]:33030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKehB-0004G6-Ot
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:07:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKebh-0006g5-2o
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:01:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKebe-00026O-H3
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:01:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615543276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=g7GC7xTANrk8qUdoz0xzRx9F9lUA/F1fg1X7rVLrWBY=;
 b=Ux7VaJjQFX47yHDzSBs6OwdVMCod/rjUe1JaxaWOcRIivDVTIA1e8lY3UiAPQlKslmdZgs
 X33pZktowR+JLnKSOu0o9j8gcJrB7fFEaw4kSafY4F8dlwCw+vkKIDjfZyYInOTIuE0s7K
 4WfxTezZTJVJST9tX6Sl/JowNmghr24=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-lswlFmMWPQajsCA8HJ0_kw-1; Fri, 12 Mar 2021 05:01:14 -0500
X-MC-Unique: lswlFmMWPQajsCA8HJ0_kw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69726814270
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 10:01:13 +0000 (UTC)
Received: from localhost (unknown [10.36.110.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0DBFF610AE;
 Fri, 12 Mar 2021 10:01:11 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 00/27] Add D-Bus display backend
Date: Fri, 12 Mar 2021 14:00:41 +0400
Message-Id: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

Hi,=0D
=0D
Both Spice and VNC are relatively complex and inefficient for local-only=0D
display/console export. The goal of this display backend is to export over =
D-Bus=0D
an interface close to the QEMU internal console API. Any -display or -audio=
=0D
backend should be possible to implement externally that way. D-Bus is the=
=0D
protocol of choice for the desktop, it has many convenient bindings for var=
ious=0D
languages, or tools (d-feet, busctl etc). Data blob transfer is more effici=
ent=0D
than QMP too.=0D
=0D
This implementation makes use of p2p connections for data streaming, and a =
bus=0D
for basic introspection & interactions. It is currently Unix-only, but it s=
hould=0D
be possible to port to other systems relatively easily (minus fd-passing, w=
hich=0D
will have to use fallback or different methods).=0D
=0D
This will allow to lift some task from the QEMU process (Spice or VNC aren'=
t=0D
trivial!). Backends can come and go. You can have several display opened (s=
ay=0D
Boxes & virt-manager), while exporting the display over VNC for example.=0D
=0D
An IPC interface is an easy starting point for writing backends in differen=
t=0D
languages. I started a Gtk4 & VNC backends in Rust. Rather than rewrite exi=
sting=0D
backends, it would be more interesting to develop new ones imho, such as a =
RDP=0D
backend (based on IronRDP & freerdp). An option is also to build the QEMU=
=0D
backends as D-Bus backends (maybe not too difficult).=0D
=0D
Given the current goals, the D-Bus interface is not meant to be stable.=0D
Clients/backends should be shipped together with QEMU. QEMU could ship its =
own=0D
Gtk4 widget/library (ideally written in Rust, with an exposed C/GIR API).=
=0D
=0D
The last part of the series modify vhost-user-gpu to notify directly the cl=
ient=0D
of display changes, bypassing QEMU (VGA-time will be blank, atm)=0D
=0D
Basic testing:=0D
$ qemu-system- ... -display dbus=0D
=0D
And after git clone https://gitlab.com/marcandre.lureau/qemu-display.git=0D
$ cargo run --bin qemu-gtk4=0D
=0D
Better to use with gl=3Don and virgl. You may also export audio with "-audi=
odev=0D
dbus" (see related patch).=0D
=0D
Marc-Andr=C3=A9 Lureau (27):=0D
  ui: fold qemu_alloc_display in only caller=0D
  vhost-user-gpu: glFlush before notifying clients=0D
  vhost-user-gpu: fix vugbm_device_init fallback=0D
  vhost-user-gpu: fix cursor move/update=0D
  ui: factor out qemu_console_set_display_gl_ctx()=0D
  ui: associate GL context outside of display listener registration=0D
  ui: make gl_block use a counter=0D
  ui: add a gl-unblock warning timer=0D
  ui: simplify gl unblock & flush=0D
  ui: dispatch GL events to all listeners=0D
  ui: split the GL context in a different object=0D
  ui: move qemu_spice_fill_device_address to ui/util.c=0D
  console: save current scanout details=0D
  ui: add a D-Bus display backend=0D
  audio: add dbusaudio backend=0D
  vhost-user-gpu: add vg_send_disable_scanout()=0D
  vhost-user-gpu: add vg_send_scanout_dmabuf()=0D
  vhost-user-gpu: add vg_send_dmabuf_update()=0D
  vhost-user-gpu: add vg_send_scanout()=0D
  vhost-user-gpu: add vg_send_cursor_update()=0D
  vhost-user-gpu: add vg_send_cursor_pos()=0D
  vhost-user-gpu: add vg_send_update()=0D
  vhost-user: add VHOST_USER_GPU_QEMU_DBUS_LISTENER=0D
  ui: add GraphicHwOps.register_dbus_listener()=0D
  vhost-user-gpu: implement register_dbus_listener()=0D
  vhost-user-gpu: check the PIXMAN format is supported=0D
  vhost-user-gpu: implement GPU_QEMU_DBUS_LISTENER=0D
=0D
 docs/interop/vhost-user.rst               |  10 +=0D
 meson.build                               |   5 +=0D
 qapi/audio.json                           |   3 +-=0D
 qapi/ui.json                              |  27 +-=0D
 audio/audio_int.h                         |   7 +=0D
 audio/audio_template.h                    |   2 +=0D
 contrib/vhost-user-gpu/vugbm.h            |   2 +-=0D
 contrib/vhost-user-gpu/vugpu.h            |  37 +-=0D
 include/hw/virtio/vhost-backend.h         |   2 +=0D
 include/hw/virtio/virtio-gpu.h            |   1 +=0D
 include/qemu/dbus.h                       |  20 +=0D
 include/ui/console.h                      |  68 ++-=0D
 include/ui/egl-context.h                  |   6 +-=0D
 include/ui/gtk.h                          |  11 +-=0D
 include/ui/sdl2.h                         |   7 +-=0D
 include/ui/spice-display.h                |   5 +-=0D
 subprojects/libvhost-user/libvhost-user.h |   5 +=0D
 ui/dbus.h                                 |  69 +++=0D
 audio/audio.c                             |   1 +=0D
 audio/dbusaudio.c                         | 649 ++++++++++++++++++++++=0D
 contrib/vhost-user-gpu/vhost-user-gpu.c   | 580 +++++++++++++++----=0D
 contrib/vhost-user-gpu/virgl.c            |  45 +-=0D
 contrib/vhost-user-gpu/vugbm.c            |  44 +-=0D
 hw/display/qxl.c                          |   5 +-=0D
 hw/display/vhost-user-gpu.c               |  35 +-=0D
 hw/display/virtio-gpu-base.c              |  19 +-=0D
 hw/display/virtio-vga.c                   |  13 +-=0D
 hw/virtio/vhost-user.c                    |  23 +=0D
 ui/console.c                              | 312 +++++++----=0D
 ui/dbus-console.c                         | 460 +++++++++++++++=0D
 ui/dbus-error.c                           |  45 ++=0D
 ui/dbus-listener.c                        | 480 ++++++++++++++++=0D
 ui/dbus.c                                 | 290 ++++++++++=0D
 ui/egl-context.c                          |   6 +-=0D
 ui/egl-headless.c                         |  20 +-=0D
 ui/gtk-egl.c                              |  11 +-=0D
 ui/gtk-gl-area.c                          |   9 +-=0D
 ui/gtk.c                                  |  25 +-=0D
 ui/sdl2-gl.c                              |  12 +-=0D
 ui/sdl2.c                                 |  14 +-=0D
 ui/spice-core.c                           |  50 --=0D
 ui/spice-display.c                        |  25 +-=0D
 ui/util.c                                 |  75 +++=0D
 util/module.c                             |   3 +=0D
 audio/meson.build                         |   3 +-=0D
 audio/trace-events                        |   5 +=0D
 contrib/vhost-user-gpu/meson.build        |   6 +-=0D
 qemu-options.hx                           |  11 +=0D
 ui/dbus-display1.xml                      | 205 +++++++=0D
 ui/meson.build                            |  18 +=0D
 ui/trace-events                           |  11 +=0D
 51 files changed, 3386 insertions(+), 411 deletions(-)=0D
 create mode 100644 ui/dbus.h=0D
 create mode 100644 audio/dbusaudio.c=0D
 create mode 100644 ui/dbus-console.c=0D
 create mode 100644 ui/dbus-error.c=0D
 create mode 100644 ui/dbus-listener.c=0D
 create mode 100644 ui/dbus.c=0D
 create mode 100644 ui/util.c=0D
 create mode 100644 ui/dbus-display1.xml=0D
=0D
--=20=0D
2.29.0=0D
=0D


