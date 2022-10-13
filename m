Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A1B5FDE45
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 18:30:50 +0200 (CEST)
Received: from localhost ([::1]:43344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj16f-00056c-8b
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 12:30:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=HNeY=2O=kaod.org=clg@ozlabs.org>)
 id 1oj0pT-0000iH-Sd; Thu, 13 Oct 2022 12:13:04 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:53277
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=HNeY=2O=kaod.org=clg@ozlabs.org>)
 id 1oj0pR-0002dN-Qv; Thu, 13 Oct 2022 12:13:03 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4MpF0z2ngkz4xGw;
 Fri, 14 Oct 2022 03:12:51 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MpF0v2GV1z4xDn;
 Fri, 14 Oct 2022 03:12:47 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Iris Chen <irischenlj@fb.com>, Michael Walle <michael@walle.cc>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v4 00/10] m25p80: Add SFDP support
Date: Thu, 13 Oct 2022 18:12:31 +0200
Message-Id: <20221013161241.2805140-1-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=HNeY=2O=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This patchset adds support for JEDEC STANDARD JESD216 Serial Flash
Discovery Parameters (SFDP). SFDP describes the features of a serial
flash device using a set of internal parameter tables. Support in
Linux has been added some time ago and the spi-nor driver is using it
more often to detect the flash settings and even flash models.

Thanks,

C.

Changes in v4:

 - fixed definition of mx25l25635e
 - removed extern
 - new patches from Patrick

Changes in v3:

 - refresh after 2 years 

Cédric Le Goater (9):
  m25p80: Add basic support for the SFDP command
  m25p80: Add the n25q256a SFDP table
  m25p80: Add erase size for mx25l25635e
  m25p80: Add the mx25l25635e SFPD table
  m25p80: Add the mx25l25635f SFPD table
  m25p80: Add the mx66l1g45g SFDP table
  m25p80: Add the w25q256 SFPD table
  m25p80: Add the w25q512jv SFPD table
  arm/aspeed: Replace mx25l25635e chip model

Patrick Williams (1):
  m25p80: Add the w25q01jvq SFPD table

 hw/block/m25p80_sfdp.h |  29 ++++
 hw/arm/aspeed.c        |   6 +-
 hw/block/m25p80.c      |  52 ++++++-
 hw/block/m25p80_sfdp.c | 332 +++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS            |   2 +-
 hw/block/meson.build   |   1 +
 hw/block/trace-events  |   1 +
 7 files changed, 411 insertions(+), 12 deletions(-)
 create mode 100644 hw/block/m25p80_sfdp.h
 create mode 100644 hw/block/m25p80_sfdp.c

-- 
2.37.3


