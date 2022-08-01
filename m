Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFAC586BA1
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 15:14:13 +0200 (CEST)
Received: from localhost ([::1]:36206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIVFM-000160-Lo
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 09:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=LBbo=YF=kaod.org=clg@ozlabs.org>)
 id 1oIVCQ-0003vR-2K; Mon, 01 Aug 2022 09:11:10 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:49265
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=LBbo=YF=kaod.org=clg@ozlabs.org>)
 id 1oIVCN-0007EV-KI; Mon, 01 Aug 2022 09:11:09 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LxJQn62MCz4x1N;
 Mon,  1 Aug 2022 23:10:57 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LxJQk3ZCHz4x1L;
 Mon,  1 Aug 2022 23:10:53 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 00/19] ppc: QOM'ify 405 board
Date: Mon,  1 Aug 2022 15:10:20 +0200
Message-Id: <20220801131039.1693913-1-clg@kaod.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=LBbo=YF=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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

What's left ?

* The DCR read/writre handler are attached in table to the CPU
  instance. We could probably rework the whole with a specific address
  space and memory regions handling the implemented registers. I don't
  think this is necessary.

* the SDRAM mappings are very baroque and certainly could be simplified.
  I think we should QOMify the ppc440 machines before addressing this
  part.

Thanks,

C.

Cédric Le Goater (19):
  ppc/ppc405: Remove taihu machine
  ppc/ppc405: Introduce a PPC405 generic machine
  ppc/ppc405: Move devices under the ref405ep machine
  ppc/ppc405: Introduce a PPC405 SoC
  ppc/ppc405: Start QOMification of the SoC
  ppc/ppc405: QOM'ify CPU
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
  ppc/ppc405: QOM'ify UIC
  ppc/ppc405: QOM'ify I2C

 docs/about/deprecated.rst    |   9 -
 docs/system/ppc/embedded.rst |   1 -
 hw/ppc/ppc405.h              | 210 ++++++++-
 include/hw/ppc/ppc4xx.h      |  28 ++
 hw/ppc/ppc405_boards.c       | 366 ++++------------
 hw/ppc/ppc405_uc.c           | 802 +++++++++++++++++++++--------------
 hw/ppc/ppc4xx_devs.c         | 120 ++++--
 7 files changed, 887 insertions(+), 649 deletions(-)

-- 
2.37.1


