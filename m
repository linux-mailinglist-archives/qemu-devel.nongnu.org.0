Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 522B86ADE1B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 12:57:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZVw0-000242-PB; Tue, 07 Mar 2023 06:56:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZVvy-00023u-W9
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:56:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZVvx-0002ww-G9
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:56:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678190204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OfLRDGyc/bWKVj7z0m5kSwyZyAXBuKFwU83r8jU12Ho=;
 b=W+Ov6gsyY6n6pIDf+YjvrNfmWE96Xo5XQhbQgBH/oega58T3tDD4HX3ejIwkZgvN62Dn0q
 4DAijYMAq5Yyil210jB4dBJi12OjRbhtkYGao83N02l9XglsMCOGExFDXwIETGxppcaoAy
 uwRg0YfOdcZ9N0W1NW2Eh3esiC8kegI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-96-0eoGATwyO3mwyowuYvAQDQ-1; Tue, 07 Mar 2023 06:56:41 -0500
X-MC-Unique: 0eoGATwyO3mwyowuYvAQDQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C06AB185A7A4;
 Tue,  7 Mar 2023 11:56:40 +0000 (UTC)
Received: from localhost (unknown [10.39.208.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC3A140B40E4;
 Tue,  7 Mar 2023 11:56:39 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v2 00/18] ui: dbus & misc fixes
Date: Tue,  7 Mar 2023 15:56:19 +0400
Message-Id: <20230307115637.2464377-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
  ui/sdl: add optional logging when _SDL_DEBUG is set
  ui/sdl: try to instantiate the matching opengl renderer
  ui: introduce egl_init()
  ui/dbus: do not require opengl & gbm
  ui/dbus: restrict opengl to gbm-enabled config

 meson.build                      |  2 -
 audio/audio_int.h                |  2 +-
 include/ui/console.h             |  5 +-
 include/ui/egl-helpers.h         |  4 ++
 include/ui/sdl2.h                |  2 +
 ui/vnc.h                         |  1 -
 audio/dbusaudio.c                |  6 ++-
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
 ui/egl-helpers.c                 | 79 +++++++++++++++++++++++++++++---
 ui/sdl2.c                        | 17 ++++++-
 ui/spice-core.c                  |  7 +--
 ui/spice-display.c               |  8 ++--
 ui/vnc.c                         |  8 +---
 tests/qtest/meson.build          |  2 +-
 ui/meson.build                   |  6 ++-
 ui/shader/texture-blit-flip.vert |  1 -
 ui/shader/texture-blit.frag      |  1 -
 ui/shader/texture-blit.vert      |  1 -
 27 files changed, 203 insertions(+), 80 deletions(-)

-- 
2.39.2


