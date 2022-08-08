Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A6A58C696
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 12:39:04 +0200 (CEST)
Received: from localhost ([::1]:49044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL0A3-0008Fo-Ru
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 06:39:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=c6th=YM=kaod.org=clg@ozlabs.org>)
 id 1oKzzI-0004tf-Es; Mon, 08 Aug 2022 06:27:56 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:45511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=c6th=YM=kaod.org=clg@ozlabs.org>)
 id 1oKzzF-0001Pr-Fx; Mon, 08 Aug 2022 06:27:56 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4M1XTC1rybz4xTp;
 Mon,  8 Aug 2022 20:27:43 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4M1XT82Skgz4x1K;
 Mon,  8 Aug 2022 20:27:39 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v3 00/22] ppc: QOM'ify 405 board
Date: Mon,  8 Aug 2022 12:27:12 +0200
Message-Id: <20220808102734.133084-1-clg@kaod.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=c6th=YM=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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


Hello,

Here is large series QOM'ifying the PPC405 board. It introduces a new
generic machine and SoC models, converts the current device models to
QOM and populates the SoC. The process is quite mechanical without too
much issues to handle. The noisy part is the initial patch introducing
the SoC realize routine.

What's left ?

* the SDRAM mappings are very baroque and certainly could be simplified.
  I think we should QOMify the ppc440 machines before addressing this
  part.

Thanks,

C.

Changes in v3 :

 - New device model Ppc4xxDcrDeviceState
 - Removal of ppc4xx_mal_init(), ppc4xx_plb_init() and ppc405_ebc_init()
 - Fixes for some reset issues
 - Kept 2 RAM banks at the Soc level but only one is initialized.
 - Moved SRAM under the machine. It's not part of the SoC according
   to the 405 specs

Changes in v2 :

 - docs/about/removed-features.rst update
 - Fix compile breakage (uic)
 - Fix CPU reset, which breaking u-boot boot
 - Changed prefix of memory regions to "ppc405"
 - Reduced the number of RAM banks to 1. Second was a dummy one to
   please ppc405ep_init()

Cédric Le Goater (22):
  ppc/ppc405: Remove taihu machine
  ppc/ppc405: Introduce a PPC405 generic machine
  ppc/ppc405: Move devices under the ref405ep machine
  ppc/ppc405: Move SRAM under the ref405ep machine
  ppc/ppc405: Introduce a PPC405 SoC
  ppc/ppc405: Start QOMification of the SoC
  ppc/ppc405: QOM'ify CPU
  ppc/ppc4xx: Introduce a DCR device model
  ppc/ppc405: QOM'ify CPC
  ppc/ppc405: QOM'ify GPT
  ppc/ppc405: QOM'ify OCM
  ppc/ppc405: QOM'ify GPIO
  ppc/ppc405: QOM'ify DMA
  ppc/ppc405: QOM'ify EBC
  ppc/ppc405: QOM'ify OPBA
  ppc/ppc405: QOM'ify POB
  ppc/ppc405: QOM'ify PLB
  ppc/ppc405: QOM'ify MAL
  ppc/ppc405: QOM'ify FPGA
  ppc/ppc405: Use an explicit PPCUIC object
  ppc/ppc405: Use an explicit I2C object
  ppc/ppc4xx: Fix sdram trace events

 docs/about/deprecated.rst       |   9 -
 docs/about/removed-features.rst |   6 +
 docs/system/ppc/embedded.rst    |   1 -
 hw/ppc/ppc405.h                 | 198 +++++++-
 include/hw/ppc/ppc4xx.h         |  48 +-
 hw/ppc/ppc405_boards.c          | 375 ++++-----------
 hw/ppc/ppc405_uc.c              | 828 +++++++++++++++++---------------
 hw/ppc/ppc4xx_devs.c            | 184 ++++---
 hw/ppc/sam460ex.c               |  24 +-
 MAINTAINERS                     |   2 +-
 10 files changed, 903 insertions(+), 772 deletions(-)

-- 
2.37.1


