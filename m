Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FFB5B100
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jun 2019 19:37:08 +0200 (CEST)
Received: from localhost ([::1]:45806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hhdlE-0001iW-4p
	for lists+qemu-devel@lfdr.de; Sun, 30 Jun 2019 13:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58332)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1hhdjV-0000LY-9v
 for qemu-devel@nongnu.org; Sun, 30 Jun 2019 13:35:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1hhdjU-0000V9-6B
 for qemu-devel@nongnu.org; Sun, 30 Jun 2019 13:35:21 -0400
Received: from mail.ilande.co.uk ([46.43.2.167]:40188
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1hhdjU-0007wj-0I
 for qemu-devel@nongnu.org; Sun, 30 Jun 2019 13:35:20 -0400
Received: from host109-146-132-17.range109-146.btcentralplus.com
 ([109.146.132.17] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1hhdfq-0001xd-PE
 for qemu-devel@nongnu.org; Sun, 30 Jun 2019 18:31:35 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org
Date: Sun, 30 Jun 2019 18:31:58 +0100
Message-Id: <20190630173203.9620-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.11.0
X-SA-Exim-Connect-IP: 109.146.132.17
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.43.2.167
Subject: [Qemu-devel] [PATCH 0/5] sunhme: misc fixes for tap mode
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

This patchset contains a set of fixes found whilst investigating some privately
reported issues when using the sunhme device in tap mode on a busy network.

The first patch simply adds a trace-event for logging the PCI IRQ which was
useful in help diagnose the issues in the subsequent patches.

Patches 2-4 fix errors in enabling and disabling the receiver found during
local testing with NetBSD which toggles the receiver state on startup.

Finally patch 5 fixes a bug whereby on a busy network it is possible to
overflow the descriptor ring and therefore we must report this back correctly
to the OS to allow it to handle the situation accordingly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Mark Cave-Ayland (5):
  sunhme: add trace event for logging PCI IRQ
  sunhme: fix incorrect constant in sunhme_can_receive()
  sunhme: flush any queued packets when HME_MAC_RXCFG_ENABLE bit is
    raised
  sunhme: fix return values from sunhme_receive() during receive packet
    processing
  sunhme: ensure that RX descriptor ring overflow is indicated to client
    driver

 hw/net/sunhme.c     | 29 +++++++++++++++++++++++++----
 hw/net/trace-events |  2 ++
 2 files changed, 27 insertions(+), 4 deletions(-)

-- 
2.11.0


