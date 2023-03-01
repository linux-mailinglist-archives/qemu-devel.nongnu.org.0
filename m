Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7036A641F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 01:18:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXA9o-0008HN-5r; Tue, 28 Feb 2023 19:17:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pXA9k-0008GF-EX; Tue, 28 Feb 2023 19:17:17 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pXA9c-0001fa-Vp; Tue, 28 Feb 2023 19:17:11 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4CC257457E7;
 Wed,  1 Mar 2023 01:17:06 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 154B2745720; Wed,  1 Mar 2023 01:17:06 +0100 (CET)
Message-Id: <cover.1677628524.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v5 0/7] Pegasos2 fixes and audio output support
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 vr_qemu@t-online.de, ReneEngel80@emailn.de
Date: Wed,  1 Mar 2023 01:17:06 +0100 (CET)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hello,

This is marked v5 to avoid confusion with previously posted
alternative versions. This series is now based on master and contains
all patches needed to get AmigaOS and MorphOS work on pegasos2 with
sound and I'd like this to be merged for 8.0.

Patch 1 is independent of the rest so could be merged separately but
further patches are needed to fix interrupts which is needed for the
last patc implementing the via-ac97 sound part of the south bridge
chip used on pegasos2 so those patches depend on each other.

Please review and somebody take care of merging this for 8.0 please. I
try to address review comments but it's likely too late to restart
from scratch so keep it reasonable, it could always be improved later
or fixed during the freeze if some issues are found.

Regards,
BALATON Zoltan

BALATON Zoltan (7):
  hw/display/sm501: Add debug property to control pixman usage
  Revert "hw/isa/vt82c686: Remove intermediate IRQ forwarder"
  hw/isa/vt82c686: Implement PCI IRQ routing
  hw/ppc/pegasos2: Fix PCI interrupt routing
  hw/isa/vt82c686: Work around missing level sensitive irq in i8259
    model
  hw/usb/vt82c686-uhci-pci: Use PCI IRQ routing
  hw/audio/via-ac97: Basic implementation of audio playback

 hw/audio/trace-events      |   6 +
 hw/audio/via-ac97.c        | 455 ++++++++++++++++++++++++++++++++++++-
 hw/display/sm501.c         |  18 +-
 hw/isa/trace-events        |   1 +
 hw/isa/vt82c686.c          |  59 ++++-
 hw/pci-host/mv64361.c      |   4 -
 hw/ppc/pegasos2.c          |  26 ++-
 hw/usb/vt82c686-uhci-pci.c |  12 -
 include/hw/isa/vt82c686.h  |  25 ++
 9 files changed, 577 insertions(+), 29 deletions(-)

-- 
2.30.8


