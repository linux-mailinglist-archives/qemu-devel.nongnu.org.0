Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE86252CAD
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 13:45:05 +0200 (CEST)
Received: from localhost ([::1]:58934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAtrU-00088H-2J
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 07:45:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <srs0=n7r+=ce=lse.epita.fr=cesar.belley@cri.epita.fr>)
 id 1kAtp9-0004Zx-Cq
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 07:42:39 -0400
Received: from gate-2.cri.epita.net ([163.5.55.20]:47864
 helo=mail-2.srv.cri.epita.fr)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <srs0=n7r+=ce=lse.epita.fr=cesar.belley@cri.epita.fr>)
 id 1kAtp6-00084f-E9
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 07:42:38 -0400
Received: from MattGorko-Laptop.home
 (lfbn-idf1-1-1395-83.w90-79.abo.wanadoo.fr [90.79.87.83])
 (Authenticated sender: cesar.belley)
 by mail-2.srv.cri.epita.fr (Postfix) with ESMTPSA id F02253FAC6;
 Wed, 26 Aug 2020 13:42:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lse.epita.fr; s=cri;
 t=1598442151; bh=JaIrakQXRvTkIGTF3eoK9BXnZfzz+BeOlV61S3pyDtQ=;
 h=From:To:Cc:Subject:Date:From;
 b=WNdMBLY+vZ7fc+0cylWbs75+vzwoa1N/nK+dsEBGFlcpw2pCvQyImWWkfu0/aBVL6
 G5cnDouFWdxdraT16yAGqxTrdunr4M2aFPS5t+Iq+UpLIIJmCfCm2Jem5DfM+qfURI
 bALb3XyFFKwrp9lgwa4dFJXqOctVW/mwdpeIrKPI=
From: =?UTF-8?q?C=C3=A9sar=20Belley?= <cesar.belley@lse.epita.fr>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/12] Introduce USB U2F key device
Date: Wed, 26 Aug 2020 13:41:57 +0200
Message-Id: <20200826114209.28821-1-cesar.belley@lse.epita.fr>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=163.5.55.20;
 envelope-from=srs0=n7r+=ce=lse.epita.fr=cesar.belley@cri.epita.fr;
 helo=mail-2.srv.cri.epita.fr
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 07:42:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?C=C3=A9sar=20Belley?= <cesar.belley@lse.epita.fr>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series adds the U2F dedicated support to Qemu through a USB
U2F key device that can operate in two modes: pass-through and emulated.

This work is also part of the GSoC program of this year and follows the
proposal I made for the 'Virtual FIDO2/U2F security key' subject,
suggested and mentored by Gerd Hoffmann.

U2F is an open authentication standard. It enables relying parties
exposed to the internet to offer a strong second factor option for end
user authentication.

The standard brings many advantages to both parties, client and server,
allowing to reduce over-reliance on passwords, it increases
authentication security and simplifies passwords.

The second factor is materialized by a device implementing the U2F
protocol. In case of a USB U2F security key, it is a USB HID device
that implements the U2F protocol.

The USB U2F key device given in this patch series allows to add guest
U2F security keys via two possible modes: pass-through and emulated.

The pass-through mode consists of passing all requests made from the
guest to the physical security key connected to the host machine and
vice versa. In addition, the dedicated pass-through allows to have a
U2F security key shared on several guests which is not possible with
a simple host device assignment pass-through.

The emulated mode consists of completely emulating the behavior of an
U2F device through software part. Libu2f-emu is used for that.

Regards,
César Belley

History:

v1 -> v2:
- change build recipes to integrate meson build system

v2 -> v3:
- use meson to check libu2f-emu dependency
- squash the two patchs that add u2f key to the build system

César Belley (12):
  hw/usb: Regroup USB HID protocol values
  docs: Add USB U2F key device documentation
  hw/usb: Add U2F key base class
  hw/usb: Add U2F key base class implementation
  hw/usb: Add U2F key passthru mode
  hw/usb: Add U2F key emulated mode
  meson: Add U2F key to meson
  docs/system: Add U2F key to the USB devices examples
  docs/qdev-device-use.txt: Add USB U2F key to the QDEV devices examples
  scripts: Add u2f-setup-gen script
  hw/usb: Add U2F device check to passthru mode
  hw/usb: Add U2F device autoscan to passthru mode

 configure                |   8 +-
 docs/qdev-device-use.txt |   1 +
 docs/system/usb.rst      |   3 +
 docs/u2f.txt             | 110 ++++++++
 hw/usb/Kconfig           |   5 +
 hw/usb/dev-hid.c         |  26 +-
 hw/usb/dev-wacom.c       |  12 +-
 hw/usb/meson.build       |   7 +
 hw/usb/u2f-emulated.c    | 405 ++++++++++++++++++++++++++++
 hw/usb/u2f-passthru.c    | 551 +++++++++++++++++++++++++++++++++++++++
 hw/usb/u2f.c             | 352 +++++++++++++++++++++++++
 hw/usb/u2f.h             |  92 +++++++
 include/hw/usb/hid.h     |  17 ++
 meson.build              |   7 +
 meson_options.txt        |   1 +
 scripts/u2f-setup-gen.py | 170 ++++++++++++
 16 files changed, 1738 insertions(+), 29 deletions(-)
 create mode 100644 docs/u2f.txt
 create mode 100644 hw/usb/u2f-emulated.c
 create mode 100644 hw/usb/u2f-passthru.c
 create mode 100644 hw/usb/u2f.c
 create mode 100644 hw/usb/u2f.h
 create mode 100644 include/hw/usb/hid.h
 create mode 100755 scripts/u2f-setup-gen.py

-- 
2.28.0


