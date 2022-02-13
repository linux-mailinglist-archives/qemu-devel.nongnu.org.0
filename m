Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 334B94B38F9
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Feb 2022 03:45:13 +0100 (CET)
Received: from localhost ([::1]:58550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJ4sx-0006Jy-RU
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 21:45:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJ4qZ-00041N-B1
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 21:42:43 -0500
Received: from [2607:f8b0:4864:20::636] (port=44724
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJ4qX-0000Oa-2y
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 21:42:42 -0500
Received: by mail-pl1-x636.google.com with SMTP id y18so7803258plb.11
 for <qemu-devel@nongnu.org>; Sat, 12 Feb 2022 18:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ED8cYfHVsfvKubH5FwYTJEvO3Wzzvgl8yYpDha7Oq+E=;
 b=kkumhWFo31tPL/Lo06n4fn3BPsbXzxAKgV9It1ET2HGxSvZjs+4zIgUtY1OLDT1YOe
 436g1ReSs2XFCnuzGbzTwxLX7synVdU7IWLsMA31rHkh41rgVjVzLpgOCyU6mgBekEaa
 qJG7YxTmuRiayafYYt6G039aKakVaZfIg4pLHDHxMojYIRrlBNSKOEMEw+UM82lax9vf
 s2EWgG6rgB7EsxXC0aOoONnQ3vMvlMWT+WuqOUZFW7LcZSZabvINwnn1M4pjPzhowKc2
 jyp1Lp6bv3TItJZ8hOzTXYOK+pFpYJhy1JJbSxiJ8NW0lzM3B3K0GxjkC/RfFIGLfxNd
 azqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ED8cYfHVsfvKubH5FwYTJEvO3Wzzvgl8yYpDha7Oq+E=;
 b=KxaDJlulmj2goqTyGqOiqvcbfSALePVQhU3e8X6Ii38Ls9Hg5+Xi35CxnP/IG12UOG
 j4QRc86+DYWH3RaVSdBSKDOgZzvCmSyym8zTX4w8KgiMX60R8mVz69sAKH+Y8icX8M/i
 nB6JLTCSLNNQa+sZD7XcKFsEWwGTaSakdaoa2jro0REI26bdbv28nYufMu9K3qIrTUWO
 YXG2GykqGtO4TRVB+gYzDXciuoI+IwSZXGfsQFY75EatFO+wn19Magrs7WojTaw9yZHm
 4/1dlGlYNz6mo40Cesw8SjeWm6Pn9PL+RpCSUIXGcBxPDD4qLqakgpQOBgCc+f3p9hnt
 SQgA==
X-Gm-Message-State: AOAM532fwrfNmvgYl1ry2JkKYSE2LtIZLjcGfWFwohx8uyTH14KKJ5B6
 ek7AfVIesSNGFCeNA7W7jfmxJk1FINM=
X-Google-Smtp-Source: ABdhPJznPI1ncz6Vzczd7bwOmJioCqaqKVyIMjxEq7xOHQa1PuIvqpEmmqL7MC2TMmT7DoTSsTQwJg==
X-Received: by 2002:a17:90b:1d84:: with SMTP id
 pf4mr7807706pjb.106.1644720159541; 
 Sat, 12 Feb 2022 18:42:39 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d85b:35dd:dae2:b7a9])
 by smtp.gmail.com with ESMTPSA id l11sm9128954pjm.23.2022.02.12.18.42.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 12 Feb 2022 18:42:39 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH 0/6] ui/dbus: Share one listener for a console
Date: Sun, 13 Feb 2022 11:42:16 +0900
Message-Id: <20220213024222.3548-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ui/dbus required to have multiple DisplayChangeListeners (possibly with OpenGL)
for a console but that caused several problems:
- It broke egl-headless, an unusual display which implements OpenGL rendering
  for non-OpenGL displays. The code to support multiple DisplayChangeListeners
  does not consider the case where non-OpenGL displays listens OpenGL consoles.
- Multiple OpenGL DisplayChangeListeners of dbus shares one DisplaySurface and
  modifies its texture field, causing OpenGL texture leak and use-after-free.
- Introduced extra code to check the compatibility of OpenGL context providers
  and OpenGL texture renderers where those are often inherently tightly coupled
  since they must share the same hardware.
- Needed extra work to broadcast the same change to multiple dbus listeners.

This series solve them by implementing the change broadcast in ui/dbus, which
knows exactly what is needed. Changes for the common code to support multiple
OpenGL DisplayChangeListeners were reverted to fix egl-headless and reduce
the code size.

Akihiko Odaki (6):
  ui/dbus: Share one listener for a console
  Revert "console: save current scanout details"
  Revert "ui: split the GL context in a different object"
  Revert "ui: dispatch GL events to all listeners"
  Revert "ui: associate GL context outside of display listener
    registration"
  Revert "ui: factor out qemu_console_set_display_gl_ctx()"

 include/ui/console.h       |  60 +-----
 include/ui/egl-context.h   |   6 +-
 include/ui/gtk.h           |  11 +-
 include/ui/sdl2.h          |   7 +-
 include/ui/spice-display.h |   1 -
 ui/console.c               | 258 +++++++----------------
 ui/dbus-console.c          | 109 ++--------
 ui/dbus-listener.c         | 417 +++++++++++++++++++++++++++----------
 ui/dbus.c                  |  22 --
 ui/dbus.h                  |  36 +++-
 ui/egl-context.c           |   6 +-
 ui/egl-headless.c          |  20 +-
 ui/gtk-egl.c               |  10 +-
 ui/gtk-gl-area.c           |   8 +-
 ui/gtk.c                   |  25 +--
 ui/sdl2-gl.c               |  10 +-
 ui/sdl2.c                  |  14 +-
 ui/spice-display.c         |  19 +-
 18 files changed, 498 insertions(+), 541 deletions(-)

-- 
2.32.0 (Apple Git-132)


