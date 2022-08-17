Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D8259728C
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 17:10:43 +0200 (CEST)
Received: from localhost ([::1]:37118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOKgr-0001te-8o
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 11:10:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oOKef-0004Yb-74; Wed, 17 Aug 2022 11:08:25 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:43838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oOKec-0002lo-Jx; Wed, 17 Aug 2022 11:08:24 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 2640274637F;
 Wed, 17 Aug 2022 17:08:18 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id DE006746324; Wed, 17 Aug 2022 17:08:17 +0200 (CEST)
Message-Id: <cover.1660746880.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 00/31] QOMify PPC4xx devices and minor clean ups
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Aug 2022 17:08:17 +0200 (CEST)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

This is based on gitlab.com/danielhb/qemu/tree/ppc-7.2

This series contains the rest of Cédric's OOM'ify patches modified
according my review comments and some other clean ups I've noticed
along the way.

v2 now also includes the sdram changes after some clean up to simplify
it. This should now be the same state as Cédric's series. I shall
continue with the ppc440_sdram DDR2 controller model used by the
sam460ex but that needs a bit more chnages. But it is independent of
this series so this can be merged now and I can follow up later in a
separate series.

Regards,
BALATON Zoltan

BALATON Zoltan (31):
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
  ppc4xx: Move PLB model to ppc4xx_devs.c
  ppc4xx: Rename ppc405-plb to ppc4xx-plb
  ppc4xx: Move EBC model to ppc4xx_devs.c
  ppc4xx: Rename ppc405-ebc to ppc4xx-ebc
  ppc/ppc405: Use an embedded PPCUIC model in SoC state
  hw/intc/ppc-uic: Convert ppc-uic to a PPC4xx DCR device
  ppc/ppc405: Use an explicit I2C object
  ppc/ppc405: QOM'ify FPGA
  ppc405: Move machine specific code to ppc405_boards.c
  hw/ppc/Kconfig: Remove PPC405 dependency from sam460ex
  hw/ppc/Kconfig: Move imply before select
  ppc/ppc4xx: Fix sdram trace events
  ppc4xx: Fix code style problems reported by checkpatch
  ppc440_bamboo: Remove unnecessary memsets
  ppc4xx: Introduce Ppc4xxSdramBank struct
  ppc4xx_sdram: Get rid of the init RAM hack
  ppc4xx: Use Ppc4xxSdramBank in ppc4xx_sdram_banks()
  ppc440_bamboo: Add missing 4 MiB valid memory size
  ppc4xx_sdram: Move size check to ppc4xx_sdram_init()
  ppc4xx_sdram: QOM'ify

 hw/intc/ppc-uic.c         |   26 +-
 hw/ppc/Kconfig            |    3 +-
 hw/ppc/ppc405.h           |  190 +++++--
 hw/ppc/ppc405_boards.c    |  384 ++++++++-----
 hw/ppc/ppc405_uc.c        | 1078 ++++++++++++-------------------------
 hw/ppc/ppc440.h           |    5 +-
 hw/ppc/ppc440_bamboo.c    |   63 ++-
 hw/ppc/ppc440_uc.c        |   57 +-
 hw/ppc/ppc4xx_devs.c      |  670 +++++++++++++++++------
 hw/ppc/ppc4xx_pci.c       |   31 +-
 hw/ppc/sam460ex.c         |   52 +-
 hw/ppc/trace-events       |    3 -
 hw/ppc/virtex_ml507.c     |    7 +-
 include/hw/intc/ppc-uic.h |    6 +-
 include/hw/ppc/ppc4xx.h   |  118 +++-
 15 files changed, 1477 insertions(+), 1216 deletions(-)

-- 
2.30.4


