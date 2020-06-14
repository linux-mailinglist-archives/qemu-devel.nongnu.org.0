Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA0D1F8A16
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Jun 2020 20:30:22 +0200 (CEST)
Received: from localhost ([::1]:54734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkXOg-0000VT-0o
	for lists+qemu-devel@lfdr.de; Sun, 14 Jun 2020 14:30:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jkXLL-000436-Qm; Sun, 14 Jun 2020 14:26:55 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:52044)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jkXLI-0007dA-KK; Sun, 14 Jun 2020 14:26:55 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id BB63C748DDC;
 Sun, 14 Jun 2020 20:26:43 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 9D963745702; Sun, 14 Jun 2020 20:26:43 +0200 (CEST)
Message-Id: <cover.1592158400.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v4 0/9] Mac Old World ROM experiment
Date: Sun, 14 Jun 2020 20:13:19 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/14 14:26:44
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Howard Spoelstra <hsp.cat7@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Last version with some changes according to review and adding more
patches. The patch adding i2c support to CUDA is not yet working, only
included here as RFC and show direction but any help fixing it is
welcome as I've run out of free time for this. I think with i2c
support fixed (and maybe adding real screamer implementation) could
get us somewhere with the firmware ROM. Once it starts poking a video
card I'm willing to look at what ati-vga may need to work with this
but help is welcome getting to that point.

Regards,
BALATON Zoltan

BALATON Zoltan (9):
  mac_oldworld: Allow loading binary ROM image
  mac_newworld: Allow loading binary ROM image
  grackle: Set revision in PCI config to match hardware
  mac_oldworld: Rename ppc_heathrow_reset to ppc_heathrow_cpu_reset
  mac_oldworld: Map macio to expected address at reset
  mac_oldworld: Add machine ID register
  macio: Add dummy screamer register area
  WIP macio/cuda: Attempt to add i2c support
  mac_oldworld: Add SPD data to cover RAM

 hw/misc/macio/cuda.c         | 65 ++++++++++++++++++++++++-
 hw/misc/macio/macio.c        | 34 +++++++++++++
 hw/pci-host/grackle.c        |  2 +-
 hw/ppc/mac.h                 | 15 +++++-
 hw/ppc/mac_newworld.c        | 22 +++++----
 hw/ppc/mac_oldworld.c        | 93 ++++++++++++++++++++++++++++++------
 include/hw/misc/macio/cuda.h |  1 +
 7 files changed, 206 insertions(+), 26 deletions(-)

-- 
2.21.3


