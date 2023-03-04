Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C3A6AAA8F
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 15:50:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYTBZ-0004Ut-Cd; Sat, 04 Mar 2023 09:48:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pYTBW-0004S9-Cc; Sat, 04 Mar 2023 09:48:30 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pYTBU-00024k-LB; Sat, 04 Mar 2023 09:48:30 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4F08E746346;
 Sat,  4 Mar 2023 15:48:18 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C5A437462DB; Sat,  4 Mar 2023 15:48:17 +0100 (CET)
Message-Id: <cover.1677940224.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v6 0/7] Pegasos2 fixes and audio output support
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 vr_qemu@t-online.de, ReneEngel80@emailn.de,
 David Woodhouse <dwmw2@infradead.org>
Date: Sat,  4 Mar 2023 15:48:17 +0100 (CET)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

Latest version of series with the following changes since v5:

v6:
- Replaced work around for level sensitive interrupt needed by MorphOS
with patch from David Woodhouse that implements it in i8259 model
- Added R-b, T-b tags
- Moved revert patch to the end so it's easier to drop it to help
merging with alternative fixes

Regards,
BALATON Zoltan

BALATON Zoltan (5):
  hw/display/sm501: Add debug property to control pixman usage
  hw/isa/vt82c686: Implement PCI IRQ routing
  hw/ppc/pegasos2: Fix PCI interrupt routing
  hw/audio/via-ac97: Basic implementation of audio playback
  Revert "hw/isa/vt82c686: Remove intermediate IRQ forwarder"

Bernhard Beschow (1):
  hw/usb/vt82c686-uhci-pci: Use PCI IRQ routing

David Woodhouse (1):
  hw/intc/i8259: Implement legacy LTIM Edge/Level Bank Select

 hw/audio/trace-events           |   6 +
 hw/audio/via-ac97.c             | 455 +++++++++++++++++++++++++++++++-
 hw/display/sm501.c              |  18 +-
 hw/intc/i8259.c                 |  10 +-
 hw/intc/i8259_common.c          |  24 +-
 hw/isa/trace-events             |   1 +
 hw/isa/vt82c686.c               |  50 +++-
 hw/pci-host/mv64361.c           |   4 -
 hw/ppc/pegasos2.c               |  26 +-
 hw/usb/vt82c686-uhci-pci.c      |  12 -
 include/hw/isa/i8259_internal.h |   1 +
 include/hw/isa/vt82c686.h       |  25 ++
 12 files changed, 597 insertions(+), 35 deletions(-)

-- 
2.30.8


