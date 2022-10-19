Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC28E604D09
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 18:20:27 +0200 (CEST)
Received: from localhost ([::1]:43218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olBnu-0004O4-N9
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 12:20:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1olBX5-0006Lt-De; Wed, 19 Oct 2022 12:03:03 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:60133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1olBX0-0001Ri-5r; Wed, 19 Oct 2022 12:03:02 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 41CC675A172;
 Wed, 19 Oct 2022 18:02:51 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0AA0475A171; Wed, 19 Oct 2022 18:02:51 +0200 (CEST)
Message-Id: <cover.1666194485.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v7 0/8] ppc4xx_sdram QOMify and clean ups
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, philmd@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Date: Wed, 19 Oct 2022 18:02:51 +0200 (CEST)
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

This is the end of the QOMify series originially started by Cédric
rebased on master now only including patches not yet merged. Patches
that still need review are 1-3 (these only move code to
ppc4xx_sdram.c) and 6-7 (unify DDR and DDR2 models to share code where
possible).

Regards,
BALATON Zoltan

v7: Rebase on master after merge of first part of the series
v6: Split patch moving sdram controller models together into smaller steps
v5: Add functions the enable sdram controller and call it from boards
v4: address more review comments
v3: Fix patches that got squashed during rebase
v2: address some review comments and try to avoid compile problem with
gcc 12.2 (untested)


BALATON Zoltan (8):
  ppc440_uc.c: Move DDR2 SDRAM controller model to ppc4xx_sdram.c
  ppc4xx_devs.c: Move DDR SDRAM controller model to ppc4xx_sdram.c
  ppc4xx_sdram: Move ppc4xx_sdram_banks() to ppc4xx_sdram.c
  ppc4xx_sdram: Use hwaddr for memory bank size
  ppc4xx_sdram: Rename local state variable for brevity
  ppc4xx_sdram: Generalise bank setup
  ppc4xx_sdram: Convert DDR SDRAM controller to new bank handling
  ppc4xx_sdram: Add errp parameter to ppc4xx_sdram_banks()

 hw/ppc/meson.build      |   3 +-
 hw/ppc/ppc440_uc.c      | 332 ------------------
 hw/ppc/ppc4xx_devs.c    | 414 ----------------------
 hw/ppc/ppc4xx_sdram.c   | 757 ++++++++++++++++++++++++++++++++++++++++
 hw/ppc/trace-events     |   1 +
 include/hw/ppc/ppc4xx.h |  20 +-
 6 files changed, 768 insertions(+), 759 deletions(-)
 create mode 100644 hw/ppc/ppc4xx_sdram.c

-- 
2.30.4


