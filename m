Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 154AA680BE7
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 12:26:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMSHI-0006OK-FS; Mon, 30 Jan 2023 06:24:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pMSHC-0006O5-18
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 06:24:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pMSHA-00080A-E1
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 06:24:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675077879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wnlC63RLhdLbgVNHyzLYaNraoOwQVPLAJ53LNrXSLAc=;
 b=QtA8fUFYAZPlBQ+Uj+3zGdfJn8oZIK6ozETYvy4d7GbGeJscX22+MkzfBjlh8/1HzTYpYI
 jK2kVX9/caVMp9P1f77qzFAdumSoe6T4EpJnrDMNU6TAhJ8KPF0/VlK5j82fJkmausv26f
 r6Y0CRGE1ssRVXsg9pkHmwkdh5YSHrA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-n-TPZJWfPjyvDWK8t0k83Q-1; Mon, 30 Jan 2023 06:24:35 -0500
X-MC-Unique: n-TPZJWfPjyvDWK8t0k83Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03A6A3C025D9
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 11:24:35 +0000 (UTC)
Received: from localhost (unknown [10.39.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4374D2026D4B;
 Mon, 30 Jan 2023 11:24:33 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 00/11] ui: dbus & misc fixes
Date: Mon, 30 Jan 2023 15:24:20 +0400
Message-Id: <20230130112431.69559-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124;
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

Here is a collection of fixes for UI related-stuff. Mostly it's improving/fixing
-display dbus.

Thanks for the reviews!

Marc-André Lureau (11):
  ui/dbus: unregister clipboard on connection close
  audio/dbus: there are no sender for p2p mode
  ui/dbus: set mouse is-absolute during console creation
  ui/dbus: update the display when switching surface
  meson: ensure dbus-display generated code is built before other units
  ui: rename cursor_{put->unref}
  ui: rename cursor_{get->ref}, return it
  ui: keep current cursor with QemuConsole
  ui: set cursor upon listener registration
  ui: set cursor position upon listener registration
  ui/sdl: get the GL context from the window

 audio/audio_int.h       |  2 +-
 include/ui/console.h    |  5 +++--
 ui/vnc.h                |  1 -
 audio/dbusaudio.c       |  6 ++++--
 hw/display/qxl-render.c |  4 ++--
 hw/display/qxl.c        |  2 +-
 hw/display/vmware_vga.c |  4 ++--
 ui/console.c            | 18 ++++++++++++++++++
 ui/cursor.c             |  5 +++--
 ui/dbus-clipboard.c     | 18 +++++++-----------
 ui/dbus-console.c       | 13 ++++++++++---
 ui/dbus-listener.c      |  7 ++++---
 ui/dbus.c               |  2 +-
 ui/sdl2.c               |  2 +-
 ui/spice-display.c      |  8 ++++----
 ui/vnc.c                |  8 ++------
 ui/meson.build          |  6 ++++--
 17 files changed, 67 insertions(+), 44 deletions(-)

-- 
2.39.1


