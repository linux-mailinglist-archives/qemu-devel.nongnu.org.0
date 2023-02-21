Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFB469E7D1
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 19:45:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUXcc-0007Ox-NP; Tue, 21 Feb 2023 13:44:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pUXca-0007Oh-SU; Tue, 21 Feb 2023 13:44:12 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pUXcY-0006hQ-9x; Tue, 21 Feb 2023 13:44:12 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 804147457E7;
 Tue, 21 Feb 2023 19:44:01 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 4CEF0745720; Tue, 21 Feb 2023 19:44:01 +0100 (CET)
Message-Id: <cover.1677004414.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 0/5] Pegasos2 fixes and audio output support
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>, philmd@redhat.com
Date: Tue, 21 Feb 2023 19:44:01 +0100 (CET)
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

This series fixes PCI interrupts on the ppc/pegasos2 machine and adds
partial implementation of the via-ac97 sound part enough to get audio
output. I'd like this to be merged for QEMU 8.0.

Regards,
BALATON Zoltan

BALATON Zoltan (5):
  hw/isa/vt82c686: Implement interrupt routing in via_isa_set_irq
  hw/isa/vt82c686: Implement PIRQ pins
  hw/ppc/pegasos2: Fix PCI interrupt routing
  hw/audio/ac97: Split off some definitions to a header
  hw/audio/via-ac97: Basic implementation of audio playback

 hw/audio/ac97.c            |  43 +---
 hw/audio/ac97.h            |  65 ++++++
 hw/audio/trace-events      |   6 +
 hw/audio/via-ac97.c        | 436 ++++++++++++++++++++++++++++++++++++-
 hw/ide/via.c               |   2 +-
 hw/isa/vt82c686.c          |  61 +++++-
 hw/pci-host/mv64361.c      |   4 -
 hw/ppc/pegasos2.c          |  26 ++-
 hw/usb/vt82c686-uhci-pci.c |   5 +-
 include/hw/isa/vt82c686.h  |  39 +++-
 10 files changed, 626 insertions(+), 61 deletions(-)
 create mode 100644 hw/audio/ac97.h

-- 
2.30.7


