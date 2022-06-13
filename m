Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF32548500
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 13:52:37 +0200 (CEST)
Received: from localhost ([::1]:33100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0icV-0004yL-NC
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 07:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o0iNW-0001Tg-N1
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 07:37:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o0iNT-0002Kf-M1
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 07:37:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655120222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=duvBwvox7nwiHgrFheu6u9TsgJfSo6ljmtps4Jfms7E=;
 b=WMEy6dN3zN2T0aeIPWSQeO6016dN+N3igYiKGACl5uQp54ZG9Mwkv0tmAMaXh0LmJQWX/2
 R9JI6tkSSrfCzSKusw6f/YFUkxHeNL6YJ+04aLSta6jGQLv1H1K/YmQRakrUZLi9Z+JVSI
 eH02yfCz7L6ZaT41ekdHbO1VkRi5XAg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-ot4G2UMAMfGhoPZBJ64vxA-1; Mon, 13 Jun 2022 07:36:59 -0400
X-MC-Unique: ot4G2UMAMfGhoPZBJ64vxA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA9AA802804;
 Mon, 13 Jun 2022 11:36:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 703A92166B26;
 Mon, 13 Jun 2022 11:36:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CFF951800626; Mon, 13 Jun 2022 13:36:55 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 "Hongren (Zenithal) Zheng" <i@zenithal.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Canokeys.org" <contact@canokeys.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PULL 00/16] Kraxel 20220613 patches
Date: Mon, 13 Jun 2022 13:36:39 +0200
Message-Id: <20220613113655.3693872-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The following changes since commit dcb40541ebca7ec98a14d461593b3cd7282b4fac:

  Merge tag 'mips-20220611' of https://github.com/philmd/qemu into staging (2022-06-11 21:13:27 -0700)

are available in the Git repository at:

  git://git.kraxel.org/qemu tags/kraxel-20220613-pull-request

for you to fetch changes up to 23b87f7a3a13e93e248eef8a4b7257548855a620:

  ui: move 'pc-bios/keymaps' to 'ui/keymaps' (2022-06-13 10:59:25 +0200)

----------------------------------------------------------------
usb: add CanoKey device, fixes for ehci + redir
ui: fixes for gtk and cocoa, move keymaps (v2), rework refresh rate
virtio-gpu: scanout flush fix

----------------------------------------------------------------

Akihiko Odaki (4):
  ui/cocoa: Fix poweroff request code
  ui/console: Do not return a value with ui_info
  ui: Deliver refresh rate via QemuUIInfo
  virtio-gpu: Respect UI refresh rate for EDID

Arnout Engelen (1):
  hw/usb/hcd-ehci: fix writeback order

Daniel P. Berrangé (1):
  ui: move 'pc-bios/keymaps' to 'ui/keymaps'

Dongwon Kim (1):
  virtio-gpu: update done only on the scanout associated with rect

Hongren (Zenithal) Zheng (6):
  hw/usb: Add CanoKey Implementation
  hw/usb/canokey: Add trace events
  meson: Add CanoKey
  docs: Add CanoKey documentation
  docs/system/devices/usb: Add CanoKey to USB devices examples
  MAINTAINERS: add myself as CanoKey maintainer

Joelle van Dyne (1):
  usbredir: avoid queuing hello packet on snapshot restore

Volker Rümelin (2):
  ui/gtk-gl-area: implement GL context destruction
  ui/gtk-gl-area: create the requested GL context version

 configure                           |   4 +
 meson_options.txt                   |   2 +
 hw/usb/canokey.h                    |  69 ++++++
 include/hw/virtio/virtio-gpu.h      |   1 +
 include/ui/console.h                |   4 +-
 include/ui/gtk.h                    |   2 +-
 hw/display/virtio-gpu-base.c        |   7 +-
 hw/display/virtio-gpu.c             |   4 +
 hw/display/virtio-vga.c             |   5 +-
 hw/display/xenfb.c                  |  14 +-
 hw/usb/canokey.c                    | 313 ++++++++++++++++++++++++++++
 hw/usb/hcd-ehci.c                   |   5 +-
 hw/usb/redirect.c                   |   3 +-
 hw/vfio/display.c                   |   8 +-
 ui/console.c                        |   6 -
 ui/gtk-egl.c                        |   4 +-
 ui/gtk-gl-area.c                    |  42 +++-
 ui/gtk.c                            |  45 ++--
 MAINTAINERS                         |   8 +
 docs/system/device-emulation.rst    |   1 +
 docs/system/devices/canokey.rst     | 168 +++++++++++++++
 docs/system/devices/usb.rst         |   4 +
 hw/usb/Kconfig                      |   5 +
 hw/usb/meson.build                  |   5 +
 hw/usb/trace-events                 |  16 ++
 meson.build                         |   6 +
 pc-bios/meson.build                 |   1 -
 scripts/meson-buildoptions.sh       |   3 +
 ui/cocoa.m                          |   6 +-
 {pc-bios => ui}/keymaps/ar          |   0
 {pc-bios => ui}/keymaps/bepo        |   0
 {pc-bios => ui}/keymaps/cz          |   0
 {pc-bios => ui}/keymaps/da          |   0
 {pc-bios => ui}/keymaps/de          |   0
 {pc-bios => ui}/keymaps/de-ch       |   0
 {pc-bios => ui}/keymaps/en-gb       |   0
 {pc-bios => ui}/keymaps/en-us       |   0
 {pc-bios => ui}/keymaps/es          |   0
 {pc-bios => ui}/keymaps/et          |   0
 {pc-bios => ui}/keymaps/fi          |   0
 {pc-bios => ui}/keymaps/fo          |   0
 {pc-bios => ui}/keymaps/fr          |   0
 {pc-bios => ui}/keymaps/fr-be       |   0
 {pc-bios => ui}/keymaps/fr-ca       |   0
 {pc-bios => ui}/keymaps/fr-ch       |   0
 {pc-bios => ui}/keymaps/hr          |   0
 {pc-bios => ui}/keymaps/hu          |   0
 {pc-bios => ui}/keymaps/is          |   0
 {pc-bios => ui}/keymaps/it          |   0
 {pc-bios => ui}/keymaps/ja          |   0
 {pc-bios => ui}/keymaps/lt          |   0
 {pc-bios => ui}/keymaps/lv          |   0
 {pc-bios => ui}/keymaps/meson.build |   0
 {pc-bios => ui}/keymaps/mk          |   0
 {pc-bios => ui}/keymaps/nl          |   0
 {pc-bios => ui}/keymaps/no          |   0
 {pc-bios => ui}/keymaps/pl          |   0
 {pc-bios => ui}/keymaps/pt          |   0
 {pc-bios => ui}/keymaps/pt-br       |   0
 {pc-bios => ui}/keymaps/ru          |   0
 {pc-bios => ui}/keymaps/sl          |   0
 {pc-bios => ui}/keymaps/sv          |   0
 {pc-bios => ui}/keymaps/th          |   0
 {pc-bios => ui}/keymaps/tr          |   0
 ui/meson.build                      |   1 +
 ui/trace-events                     |   2 +
 66 files changed, 712 insertions(+), 52 deletions(-)
 create mode 100644 hw/usb/canokey.h
 create mode 100644 hw/usb/canokey.c
 create mode 100644 docs/system/devices/canokey.rst
 rename {pc-bios => ui}/keymaps/ar (100%)
 rename {pc-bios => ui}/keymaps/bepo (100%)
 rename {pc-bios => ui}/keymaps/cz (100%)
 rename {pc-bios => ui}/keymaps/da (100%)
 rename {pc-bios => ui}/keymaps/de (100%)
 rename {pc-bios => ui}/keymaps/de-ch (100%)
 rename {pc-bios => ui}/keymaps/en-gb (100%)
 rename {pc-bios => ui}/keymaps/en-us (100%)
 rename {pc-bios => ui}/keymaps/es (100%)
 rename {pc-bios => ui}/keymaps/et (100%)
 rename {pc-bios => ui}/keymaps/fi (100%)
 rename {pc-bios => ui}/keymaps/fo (100%)
 rename {pc-bios => ui}/keymaps/fr (100%)
 rename {pc-bios => ui}/keymaps/fr-be (100%)
 rename {pc-bios => ui}/keymaps/fr-ca (100%)
 rename {pc-bios => ui}/keymaps/fr-ch (100%)
 rename {pc-bios => ui}/keymaps/hr (100%)
 rename {pc-bios => ui}/keymaps/hu (100%)
 rename {pc-bios => ui}/keymaps/is (100%)
 rename {pc-bios => ui}/keymaps/it (100%)
 rename {pc-bios => ui}/keymaps/ja (100%)
 rename {pc-bios => ui}/keymaps/lt (100%)
 rename {pc-bios => ui}/keymaps/lv (100%)
 rename {pc-bios => ui}/keymaps/meson.build (100%)
 rename {pc-bios => ui}/keymaps/mk (100%)
 rename {pc-bios => ui}/keymaps/nl (100%)
 rename {pc-bios => ui}/keymaps/no (100%)
 rename {pc-bios => ui}/keymaps/pl (100%)
 rename {pc-bios => ui}/keymaps/pt (100%)
 rename {pc-bios => ui}/keymaps/pt-br (100%)
 rename {pc-bios => ui}/keymaps/ru (100%)
 rename {pc-bios => ui}/keymaps/sl (100%)
 rename {pc-bios => ui}/keymaps/sv (100%)
 rename {pc-bios => ui}/keymaps/th (100%)
 rename {pc-bios => ui}/keymaps/tr (100%)

-- 
2.36.1


