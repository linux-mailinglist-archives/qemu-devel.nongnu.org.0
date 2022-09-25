Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C585E9337
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 14:51:48 +0200 (CEST)
Received: from localhost ([::1]:48206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocR6n-0006Af-NQ
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 08:51:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ocQti-000618-P4; Sun, 25 Sep 2022 08:38:14 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:61341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ocQtg-0007I0-3Q; Sun, 25 Sep 2022 08:38:14 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 25C1674633D;
 Sun, 25 Sep 2022 14:38:07 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E8001746335; Sun, 25 Sep 2022 14:38:06 +0200 (CEST)
Message-Id: <cover.1664108862.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 00/13] Misc ppc/mac machines clean up
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Sun, 25 Sep 2022 14:38:06 +0200 (CEST)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series includes some clean ups to mac_newworld and mac_oldworld
to make them a bit simpler and more readable, It also removes the
shared mac.h file that turns out was more of a random collection of
unrelated things. Getting rid of this mac.h improves the locality of
device models and reduces unnecessary interdependency.

v2: Split some patches and add a few more I've noticed now and address
review comments

BALATON Zoltan (13):
  mac_newworld: Drop some variables
  mac_oldworld: Drop some more variables
  mac_{old|new}world: Set tbfreq at declaration
  mac_{old|new}world: Avoid else branch by setting default value
  mac_oldworld: Do not open code sysbus_mmio_map()
  mac_newworld: Simplify creation of Uninorth devices
  mac_{old|new}world: Reduce number of QOM casts
  hw/ppc/mac.h: Move newworld specific parts out from shared header
  hw/ppc/mac.h: Move macio specific parts out from shared header
  hw/ppc/mac.h: Move grackle-pcihost declaration out from shared header
  hw/ppc/mac.h: Move PROM and KERNEL defines to board code
  hw/ppc/mac.h: Rename to include/hw/nvram/mac_nvram.h
  mac_nvram: Use NVRAM_SIZE constant

 MAINTAINERS                   |   1 +
 hw/ide/macio.c                |   1 -
 hw/intc/heathrow_pic.c        |   1 -
 hw/intc/openpic.c             |   1 -
 hw/misc/macio/cuda.c          |   1 -
 hw/misc/macio/gpio.c          |   1 -
 hw/misc/macio/macio.c         |   8 +-
 hw/misc/macio/pmu.c           |   1 -
 hw/nvram/mac_nvram.c          |   2 +-
 hw/pci-host/grackle.c         |   2 +-
 hw/pci-host/uninorth.c        |   1 -
 hw/ppc/mac.h                  | 105 ----------------
 hw/ppc/mac_newworld.c         | 223 ++++++++++++++++------------------
 hw/ppc/mac_oldworld.c         | 113 +++++++----------
 include/hw/misc/macio/macio.h |  23 +++-
 include/hw/nvram/mac_nvram.h  |  51 ++++++++
 16 files changed, 230 insertions(+), 305 deletions(-)
 delete mode 100644 hw/ppc/mac.h
 create mode 100644 include/hw/nvram/mac_nvram.h

-- 
2.30.4


