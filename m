Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA8F42CCC0
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 23:24:03 +0200 (CEST)
Received: from localhost ([::1]:40324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maljG-0005Af-1m
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 17:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1malh4-0002eq-Dh
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 17:21:46 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:48394
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1malh2-0006gA-PI
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 17:21:46 -0400
Received: from [2a00:23c4:8b9d:d300:c17b:cf83:be43:9708] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1malgi-0000Dh-8T; Wed, 13 Oct 2021 22:21:28 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Wed, 13 Oct 2021 22:21:24 +0100
Message-Id: <20211013212132.31519-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:d300:c17b:cf83:be43:9708
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 0/8] q800: GLUE updates for A/UX mode
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
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

This patchset contains a set of GLUE updates to enable switching between
so-called A/UX mode and classic mode which is required to allow the q800
machine to boot both Linux/NetBSD and MacOS.

Patch 1 updates the comment for the VIA1B_vMystery bit indicating that
VIA1 port B bit 6 is used to switch between A/UX and classic mode.

Patch 2 moves the VIA1 IRQ from level 1 to level 6: this is because in
its current configuration the q800 machine is statically wired in A/UX mode
except for VIA1 which is currently still wired according to classic mode.

Patch 3 starts the process of abstracting the CPU IRQ levels from the GPIO
pins by using a set of numbered GPIO defines and using these to map to the
corresponding CPU IRQs accordingly.

Patches 4 and 5 add a GPIO to VIA1 so that updates to the VIA1B_vMystery bit
will set the auxmode variable in the GLUE device to facilitate dynamic CPU
IRQ routing.

Patches 6 and 7 adjust the CPU IRQ routing in GLUE_set_irq() so that the
incoming IRQs are mapped to the appropriate CPU IRQ levels dynamically based
upon the auxmode variable.

Finally patch 8 adds an NMI handler which can be used to invoke the Quadra's
programmer switch from the monitor for debugging.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


Mark Cave-Ayland (8):
  mac_via: update comment for VIA1B_vMystery bit
  q800: move VIA1 IRQ from level 1 to level 6
  q800: use GLUE IRQ numbers instead of IRQ level for GLUE IRQs
  mac_via: add GPIO for A/UX mode
  q800: wire up auxmode GPIO to GLUE
  q800: route SONIC on-board Ethernet IRQ via nubus IRQ 9 in classic
    mode
  q800: wire up remaining IRQs in classic mode
  q800: add NMI handler

 hw/m68k/q800.c            | 174 +++++++++++++++++++++++++++++++++++++-
 hw/misc/mac_via.c         |  22 +++++
 hw/misc/trace-events      |   1 +
 include/hw/misc/mac_via.h |   1 +
 4 files changed, 194 insertions(+), 4 deletions(-)

-- 
2.20.1


