Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A182DEE32
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 11:44:11 +0100 (CET)
Received: from localhost ([::1]:47630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqZib-00054b-Ly
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 05:44:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kqZhE-0003T8-Qe; Sat, 19 Dec 2020 05:42:44 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:39256
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kqZhC-00031M-MD; Sat, 19 Dec 2020 05:42:44 -0500
Received: from host86-191-183-22.range86-191.btcentralplus.com
 ([86.191.183.22] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kqZh2-0004BS-C9; Sat, 19 Dec 2020 10:42:36 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au,
 thuth@redhat.com
Date: Sat, 19 Dec 2020 10:42:22 +0000
Message-Id: <20201219104229.1964-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.191.183.22
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 0/7] macio: remove PIC object property links
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset follows on from the dicussion at https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg02630.html
where the user_creatable flag for the macio devices was set back to false just
before the 5.2 release.

The underlying cause was that the PIC object property links were not being set
before realise. Whilst this cannot happen when launching the g3beige and mac99
machines from qemu-system-ppc, it caused some automated tests to fail.

Here we fix the real problem which is to move the PIC for both machines into the
macio device, which not only matches real hardware but also enables the PIC object
property links to be completely removed.

Patch 6 rewires the macio gpios for the mac99 machine as per Ben's original comment
after the OpenPIC device has been moved into the macio-newworld device, and then
finally patch 7 removes setting the user_creatable flag to false on the macio devices
once again.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


Mark Cave-Ayland (7):
  mac_oldworld: remove duplicate bus check for PPC_INPUT(env)
  mac_oldworld: move initialisation of grackle before heathrow
  macio: move heathrow PIC inside macio-oldworld device
  mac_newworld: delay wiring of PCI IRQs in New World machine
  macio: move OpenPIC inside macio-newworld device
  macio: wire macio GPIOs to OpenPIC using sysbus IRQs
  macio: don't set user_creatable to false

 hw/misc/macio/gpio.c          | 24 +++--------
 hw/misc/macio/macio.c         | 53 ++++++++++++------------
 hw/ppc/mac_newworld.c         | 71 ++++++++++++++++----------------
 hw/ppc/mac_oldworld.c         | 76 ++++++++++++++++-------------------
 include/hw/misc/macio/gpio.h  |  2 -
 include/hw/misc/macio/macio.h |  4 +-
 6 files changed, 104 insertions(+), 126 deletions(-)

-- 
2.20.1


