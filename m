Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BD828CCBF
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Oct 2020 13:52:36 +0200 (CEST)
Received: from localhost ([::1]:52718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSIr5-00075C-Hp
	for lists+qemu-devel@lfdr.de; Tue, 13 Oct 2020 07:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kSIoF-0005RZ-6d; Tue, 13 Oct 2020 07:49:39 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51560
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kSIoA-0004ex-03; Tue, 13 Oct 2020 07:49:37 -0400
Received: from host86-158-109-18.range86-158.btcentralplus.com
 ([86.158.109.18] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kSIo4-0004jn-7K; Tue, 13 Oct 2020 12:49:32 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au,
 f4bug@amsat.org
Date: Tue, 13 Oct 2020 12:49:19 +0100
Message-Id: <20201013114922.2946-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.158.109.18
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 0/3] ppc: Mac machine updates
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

Here are a few Mac machine updates from my pending patch queue. Patch 1 is
split out from the QOM series I posted a few weeks ago (the other patches
are all SPARC-related).

Patches 2 and 3 move the IRQ wiring of the PCI host bridge from the host
bridge device to the Old World and New World machines as discussed with
Philippe yesterday:

David - patch 2 is a replacement for Philippe's original patch at
https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg02988.html whilst
patch 3 makes the same change for uninorth.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


v2:
- Rebase onto master
- Remove PIC header includes from grackle.c and uninorth.h which are no longer required


Mark Cave-Ayland (3):
  macio: don't reference serial_hd() directly within the device
  grackle: use qdev gpios for PCI IRQs
  uninorth: use qdev gpios for PCI IRQs

 hw/misc/macio/macio.c          |  4 ---
 hw/pci-host/grackle.c          | 19 ++------------
 hw/pci-host/uninorth.c         | 45 +++++++---------------------------
 hw/ppc/mac_newworld.c          | 30 +++++++++++++++++------
 hw/ppc/mac_oldworld.c          | 13 ++++++++--
 include/hw/pci-host/uninorth.h |  2 --
 6 files changed, 44 insertions(+), 69 deletions(-)

-- 
2.20.1


