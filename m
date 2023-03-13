Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FDB6B737A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 11:12:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbfAC-0002LD-8w; Mon, 13 Mar 2023 06:12:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbfA9-0002L1-St
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 06:12:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbfA7-0004AY-Fi
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 06:12:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678702333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/fdTV6bNZCtf8tIEAZ0QoLDCVNXsbI00RGKT1Qe2F/0=;
 b=dPCDK6jvAUoMs3UtGdb8aTmdYRlfAkHhpJ/EjY4kqrboymToVeoIDwCAvY74QtTVkvC4wl
 GlNn+PqyXuxhq3YVoZ7cfvBz2rkV//enzrdllE5QvkdQbbph3RqGoiMslY84eWhNrAjODt
 5GDuYJNT1c+POtopl8vVLMT6TCKMgEQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-xkR1bZEaMAOQ4lTOsvaCXQ-1; Mon, 13 Mar 2023 06:12:11 -0400
X-MC-Unique: xkR1bZEaMAOQ4lTOsvaCXQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82A7A85D060;
 Mon, 13 Mar 2023 10:12:11 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6AB212166B29;
 Mon, 13 Mar 2023 10:12:10 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 00/18] ui: dbus & misc fixes
Date: Mon, 13 Mar 2023 14:11:49 +0400
Message-Id: <20230313101207.375125-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Hi,

This is a respin of a series I sent end of January that didn't get reviews, here
is your chance! :) A collection of fixes for UI related-stuff, and paving the
way for accelerated/egl dbus display support on win32 (for 8.1 hopefully).

I think they are worth to include in 8.0, as little fixes and improvements. It
would be nice to have included as early as rc0.

v3:
- call SDL_GL_DeleteContext, matchin SDL_GL_CreateContext change
- use SDL hint (environment) instead of compile-time conditional for debugging
- fix potential unreachable code warning in egl_init()
- do not enable -display dbus on windows yet
- add r-b tags

v2:
- add "ui/dbus: initialize cursor_fb"
- add "ui/shader: fix #version directive must occur on first line"
- add "ui/egl: print EGL error, helping debugging"
- add "ui/sdl: add optional logging when _SDL_DEBUG is set"
- add "ui/sdl: try to instantiate the matching opengl renderer"
- add "ui: introduce egl_init()"
- add "ui/dbus: do not require opengl & gbm"
- add "ui/dbus: restrict opengl to gbm-enabled config"
- drop "ui/dbus: update the display when switching surface", as I
  am not yet confident enough about it
- rebased

Marc-André Lureau (18):
  ui/dbus: initialize cursor_fb
  ui/dbus: unregister clipboard on connection close
  audio/dbus: there are no sender for p2p mode
  ui/dbus: set mouse is-absolute during console creation
  meson: ensure dbus-display generated code is built before other units
  ui: rename cursor_{put->unref}
  ui: rename cursor_{get->ref}, return it
  ui: keep current cursor with QemuConsole
  ui: set cursor upon listener registration
  ui: set cursor position upon listener registration
  ui/sdl: get the GL context from the window
  ui/shader: fix #version directive must occur on first line
  ui/egl: print EGL error, helping debugging
  ui/sdl: add QEMU_ENABLE_SDL_LOGGING setting/environment
  ui/sdl: try to instantiate the matching opengl renderer
  ui: introduce egl_init()
  ui/dbus: do not require opengl & gbm
  ui/dbus: restrict opengl to gbm-enabled config

 meson.build                      |  4 +-
 audio/audio_int.h                |  2 +-
 include/ui/console.h             |  5 +-
 include/ui/egl-helpers.h         |  4 ++
 ui/vnc.h                         |  1 -
 audio/dbusaudio.c                |  7 ++-
 hw/display/qxl-render.c          |  4 +-
 hw/display/qxl.c                 |  2 +-
 hw/display/vmware_vga.c          |  4 +-
 ui/console.c                     | 18 ++++++++
 ui/cursor.c                      |  5 +-
 ui/dbus-clipboard.c              | 18 +++-----
 ui/dbus-console.c                | 13 ++++--
 ui/dbus-listener.c               | 22 ++++++---
 ui/dbus.c                        | 29 ++++++++----
 ui/egl-headless.c                | 16 +++----
 ui/egl-helpers.c                 | 78 +++++++++++++++++++++++++++++---
 ui/sdl2.c                        | 24 +++++++++-
 ui/spice-core.c                  |  7 +--
 ui/spice-display.c               |  8 ++--
 ui/vnc.c                         |  8 +---
 tests/qtest/meson.build          |  2 +-
 ui/meson.build                   |  6 ++-
 ui/shader/texture-blit-flip.vert |  1 -
 ui/shader/texture-blit.frag      |  1 -
 ui/shader/texture-blit.vert      |  1 -
 26 files changed, 210 insertions(+), 80 deletions(-)

-- 
2.39.2


