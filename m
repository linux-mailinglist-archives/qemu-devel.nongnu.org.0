Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0716372D7
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 08:26:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oy6bU-0007Oc-RS; Thu, 24 Nov 2022 02:25:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oy6bQ-0007O8-Bq
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 02:24:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oy6bO-00007U-04
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 02:24:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669274693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=74Vg1S6HmTpKUaid+2bq3Ht6ntJwjmKZ1ju4t+WVUPk=;
 b=Hbr1b1wLS8rVW9tIeAEW4q2iEIIiLbNLv5eFPm0ztu18uY+Jc8GWcMZejUCKUmorGCD8zZ
 iPZYhIH757AFqkx4pEm7AY8G4TUf4eQJkhkZtfUxdTtdDsHcGTYKSObhmOzEMDFZ7IRtCX
 eJI80WQa/gyhb4OpUisnjn6o92Tk7oc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-EherqCAbOYCaxa2z3LAzkA-1; Thu, 24 Nov 2022 02:24:51 -0500
X-MC-Unique: EherqCAbOYCaxa2z3LAzkA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5FD6885A588;
 Thu, 24 Nov 2022 07:24:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.212])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 21AE21415114;
 Thu, 24 Nov 2022 07:24:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3F8041800606; Thu, 24 Nov 2022 08:16:02 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 0/4] Fixes 20221124 patches
Date: Thu, 24 Nov 2022 08:15:58 +0100
Message-Id: <20221124071602.1109150-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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

The following changes since commit 7c09a7f6ae1770d15535980d15dffdb23f4d9786:

  Update VERSION for v7.2.0-rc2 (2022-11-22 18:59:56 -0500)

are available in the Git repository at:

  https://gitlab.com/kraxel/qemu.git tags/fixes-20221124-pull-request

for you to fetch changes up to 64f1359bd08060ffe7a5689fdcbaeec6d8a59980:

  ui/gtk: prevent ui lock up when dpy_gl_update called again before current draw event occurs (2022-11-23 12:27:55 +0100)

----------------------------------------------------------------
usb+ui: fixes for 7.2

----------------------------------------------------------------

Claudio Fontana (1):
  gtk: disable GTK Clipboard with a new meson option

Dongwon Kim (1):
  ui/gtk: prevent ui lock up when dpy_gl_update called again before
    current draw event occurs

Joelle van Dyne (1):
  Revert "usbredir: avoid queuing hello packet on snapshot restore"

Michael Tokarev (1):
  hw/usb/hcd-xhci.c: spelling: tranfer

 meson_options.txt             | 7 +++++++
 hw/usb/hcd-xhci.c             | 2 +-
 hw/usb/redirect.c             | 3 +--
 ui/gtk-egl.c                  | 2 +-
 ui/gtk-gl-area.c              | 2 +-
 ui/gtk.c                      | 2 ++
 meson.build                   | 5 +++++
 scripts/meson-buildoptions.sh | 3 +++
 ui/meson.build                | 5 ++++-
 9 files changed, 25 insertions(+), 6 deletions(-)

-- 
2.38.1


