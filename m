Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B125671B7
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 17:01:18 +0200 (CEST)
Received: from localhost ([::1]:56016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8k3B-0003bH-De
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 11:01:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=52tn=XK=kaod.org=clg@ozlabs.org>)
 id 1o8k0Y-00018X-0D; Tue, 05 Jul 2022 10:58:34 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:41139
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=52tn=XK=kaod.org=clg@ozlabs.org>)
 id 1o8k0V-0000ze-R8; Tue, 05 Jul 2022 10:58:33 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Lcm5C3hhzz4xhp;
 Wed,  6 Jul 2022 00:58:23 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lcm573RFXz4xTq;
 Wed,  6 Jul 2022 00:58:19 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 0/5] ppc: Remove irq_inputs
Date: Tue,  5 Jul 2022 16:58:09 +0200
Message-Id: <20220705145814.461723-1-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=52tn=XK=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

This replaces the IRQ array 'irq_inputs' with GPIO lines and removes
'irq_inputs' when all CPUs have been converted.

Thanks,

C. 

Cédric Le Goater (5):
  ppc64: Allocate IRQ lines with qdev_init_gpio_in()
  ppc/40x: Allocate IRQ lines with qdev_init_gpio_in()
  ppc/6xx: Allocate IRQ lines with qdev_init_gpio_in()
  ppc/e500: Allocate IRQ lines with qdev_init_gpio_in()
  ppc: Remove unused irq_inputs

 target/ppc/cpu.h       |  1 -
 hw/intc/xics.c         | 10 ++++++----
 hw/intc/xive.c         |  4 ++--
 hw/ppc/e500.c          |  8 ++++----
 hw/ppc/mac_newworld.c  | 16 ++++++++--------
 hw/ppc/mac_oldworld.c  |  2 +-
 hw/ppc/pegasos2.c      |  2 +-
 hw/ppc/ppc.c           | 30 ++++++------------------------
 hw/ppc/ppc405_uc.c     |  4 ++--
 hw/ppc/ppc440_bamboo.c |  4 ++--
 hw/ppc/prep.c          |  2 +-
 hw/ppc/prep_systemio.c |  2 +-
 hw/ppc/sam460ex.c      |  4 ++--
 hw/ppc/virtex_ml507.c  | 10 +++++-----
 target/ppc/cpu_init.c  |  5 -----
 15 files changed, 41 insertions(+), 63 deletions(-)

-- 
2.35.3


