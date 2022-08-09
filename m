Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4C758DB58
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 17:49:01 +0200 (CEST)
Received: from localhost ([::1]:38628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLRTY-0002Wj-FZ
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 11:49:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=uImW=YN=kaod.org=clg@ozlabs.org>)
 id 1oLRKK-0003vs-0V; Tue, 09 Aug 2022 11:39:31 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:51709
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=uImW=YN=kaod.org=clg@ozlabs.org>)
 id 1oLRKH-0004LI-V5; Tue, 09 Aug 2022 11:39:27 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4M2HL84s8Xz4wgn;
 Wed, 10 Aug 2022 01:39:12 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4M2HL54QTPz4x1T;
 Wed, 10 Aug 2022 01:39:09 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v4 00/24] ppc: QOM'ify 405 board
Date: Tue,  9 Aug 2022 17:38:40 +0200
Message-Id: <20220809153904.485018-1-clg@kaod.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=uImW=YN=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Thanks,

C.

Changes in v4 :

 - Attempt to QOM'ify SDRAM controller, with 2 initialized banks at
   the SoC level 
 - Report errors to the user for invalid RAM config
 - Moved CPU reset in PPC405 model
 - user_creatable comments
 - Renamed FPGA device model
 - Various small cleanups

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

Cédric Le Goater (24):
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
  ppc/ppc405: Use an embedded PPCUIC model in SoC state
  ppc/ppc405: Use an explicit I2C object
  ppc/ppc4xx: Fix sdram trace events
  ppc/ppc405: QOM'ify SDRAM
  ppc/ppc405: Add check on minimum RAM size

 docs/about/deprecated.rst       |   9 -
 docs/about/removed-features.rst |   6 +
 docs/system/ppc/embedded.rst    |   1 -
 hw/ppc/ppc405.h                 | 196 +++++++-
 include/hw/ppc/ppc4xx.h         |  82 ++-
 hw/ppc/ppc405_boards.c          | 381 ++++----------
 hw/ppc/ppc405_uc.c              | 859 +++++++++++++++++---------------
 hw/ppc/ppc4xx_devs.c            | 326 +++++++-----
 hw/ppc/sam460ex.c               |  24 +-
 MAINTAINERS                     |   2 +-
 hw/ppc/trace-events             |   3 -
 11 files changed, 1042 insertions(+), 847 deletions(-)

-- 
2.37.1


