Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8205B79B9
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 20:37:49 +0200 (CEST)
Received: from localhost ([::1]:51124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYAn6-0005Ih-1a
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 14:37:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oYAYy-0006Ip-FF; Tue, 13 Sep 2022 14:23:12 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:15165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oYAYv-0007bs-13; Tue, 13 Sep 2022 14:23:12 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7621C746324;
 Tue, 13 Sep 2022 20:23:01 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 9114E746307; Tue, 13 Sep 2022 20:23:00 +0200 (CEST)
Message-Id: <cover.1663092335.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 00/18] ppc4xx_sdram QOMify and clean ups
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Sep 2022 20:23:00 +0200 (CEST)
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

This is the end of the QOMify series started by Cédric. This series
handles the SDRAM controller models to clean them up, QOMify and unify
them and at least partially clean up the mess that has accumulated
around these in the past. This includes the not yet merged patches
from the last series and new ones that change the DDR2 version used by
sam460ex.

v2: address some review comments and try to avoid compile problem with
gcc 12.2 (untested)

Regards,
BALATON Zoltan

BALATON Zoltan (18):
  ppc440_bamboo: Remove unnecessary memsets
  ppc4xx: Introduce Ppc4xxSdramBank struct
  ppc4xx_sdram: Get rid of the init RAM hack
  ppc4xx: Use Ppc4xxSdramBank in ppc4xx_sdram_banks()
  ppc440_bamboo: Add missing 4 MiB valid memory size
  ppc4xx_sdram: Move size check to ppc4xx_sdram_init()
  ppc4xx_sdram: QOM'ify
  ppc4xx_sdram: Drop extra zeros for readability
  ppc440_sdram: Split off map/unmap of sdram banks for later reuse
  ppc440_sdram: Implement enable bit in the DDR2 SDRAM controller
  ppc440_sdram: Rename local variable for readibility
  ppc440_sdram: Move RAM size check to ppc440_sdram_init
  ppc440_sdram: QOM'ify
  ppc4xx_sdram: Move ppc4xx DDR and DDR2 SDRAM controller models
    together
  ppc4xx_sdram: Use hwaddr for memory bank size
  ppc4xx_sdram: Rename local state variable for brevity
  ppc4xx_sdram: Generalise bank setup
  ppc4xx_sdram: Convert DDR SDRAM controller to new bank handling

 hw/ppc/meson.build      |   3 +-
 hw/ppc/ppc405.h         |   8 +-
 hw/ppc/ppc405_boards.c  |  22 +-
 hw/ppc/ppc405_uc.c      |  33 +-
 hw/ppc/ppc440.h         |   4 -
 hw/ppc/ppc440_bamboo.c  |  29 +-
 hw/ppc/ppc440_uc.c      | 267 +--------------
 hw/ppc/ppc4xx_devs.c    | 413 -----------------------
 hw/ppc/ppc4xx_sdram.c   | 723 ++++++++++++++++++++++++++++++++++++++++
 hw/ppc/sam460ex.c       |  48 +--
 hw/ppc/trace-events     |   1 +
 include/hw/ppc/ppc4xx.h |  66 +++-
 12 files changed, 847 insertions(+), 770 deletions(-)
 create mode 100644 hw/ppc/ppc4xx_sdram.c

-- 
2.30.4


