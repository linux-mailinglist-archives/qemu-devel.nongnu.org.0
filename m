Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AF53FB3D6
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 12:28:17 +0200 (CEST)
Received: from localhost ([::1]:52070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKeWV-00005J-U2
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 06:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKeTO-0005eS-8Q
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 06:25:02 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:53278
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKeTM-0006m3-03
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 06:25:01 -0400
Received: from host86-179-186-93.range86-179.btcentralplus.com
 ([86.179.186.93] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKeSs-0003D2-Bj; Mon, 30 Aug 2021 11:24:35 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Mon, 30 Aug 2021 11:24:35 +0100
Message-Id: <20210830102447.10806-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.186.93
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 00/12] mac_via: remove MAC_VIA device and prepare for Nubus
 IRQs
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

This is the VIA part of the next set of patches to enable QEMU's q800 machine to
boot MacOS.

Currently there are 2 separate VIA devices which are contained within a pseudo
MAC_VIA device and the main aim of this patchset is to remove it so that the
separate VIA1 and VIA2 devices are accessed directly. The motivation for this is
two-fold: firstly there is confusing mix of MacVIAState, MOS6522Q800VIA1State
and MOS6522Q800VIA2State being passed around in mac_via.c with excessive
conversions between them, and secondly there is a mixture of GPIOs and aliasing
that only exist because of the pseudo MAC_VIA device.

Since upcoming Nubus changes will require more wiring between VIA1/VIA2 and Nubus,
managing these as separate devices helps reduce the complexity accordingly.

This is obviously another migration break for the q800 machine but for now we
don't care since there are more breaking changes in the pipeline.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


Mark Cave-Ayland (12):
  mac_via: introduce new VMStateDescription for q800 VIA1 and VIA2
  mac_via: move last_b variable into q800 VIA1 VMStateDescription
  mac_via: move PRAM contents and block backend to MOS6522Q800VIA1State
  mac_via: move PRAM/RTC variables to MOS6522Q800VIA1State
  mac_via: move ADB variables to MOS6522Q800VIA1State
  mac_via: move q800 VIA1 timer variables to q800 VIA1
    VMStateDescription
  mac_via: move VIA1 reset logic from mac_via_reset() to
    mos6522_q800_via1_reset()
  mac_via: move VIA1 realize logic from mac_via_realize() to
    mos6522_q800_via1_realize()
  mac_via: remove mac_via device
  mac_via: remove explicit viaN prefix from VIA IRQ gpios
  mac_via: rename VIA2_IRQ_SLOT_BIT to VIA2_IRQ_NUBUS_BIT
  mac_via: add qdev gpios for nubus slot interrupts to VIA2

 hw/m68k/q800.c            |  38 +--
 hw/misc/mac_via.c         | 547 ++++++++++++++++++--------------------
 include/hw/misc/mac_via.h | 101 ++++---
 3 files changed, 328 insertions(+), 358 deletions(-)

-- 
2.20.1


