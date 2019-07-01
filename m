Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B577A2A51C
	for <lists+qemu-devel@lfdr.de>; Sat, 25 May 2019 17:33:41 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43448 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hUYg0-0000UG-Aj
	for lists+qemu-devel@lfdr.de; Sat, 25 May 2019 11:33:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35912)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hUYdl-0007i4-5l
	for qemu-devel@nongnu.org; Sat, 25 May 2019 11:31:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hUYOA-0003OA-Q1
	for qemu-devel@nongnu.org; Sat, 25 May 2019 11:15:17 -0400
Received: from 11.mo5.mail-out.ovh.net ([46.105.47.167]:47700)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hUYO1-0003Fh-3I
	for qemu-devel@nongnu.org; Sat, 25 May 2019 11:15:07 -0400
Received: from player698.ha.ovh.net (unknown [10.109.159.136])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id BE34A237B58
	for <qemu-devel@nongnu.org>; Sat, 25 May 2019 17:15:02 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
	(Authenticated sender: clg@kaod.org)
	by player698.ha.ovh.net (Postfix) with ESMTPSA id 73E0E625A8F3;
	Sat, 25 May 2019 15:14:55 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 25 May 2019 17:12:41 +0200
Message-Id: <20190525151241.5017-20-clg@kaod.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190525151241.5017-1-clg@kaod.org>
References: <20190525151241.5017-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6626483901737306897
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddruddukedgkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.47.167
Subject: [Qemu-devel] [PATCH 19/19] aspeed/smc: Calculate checksum on normal
 DMA
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Christian Svensson <bluecmd@google.com>, Andrew Jeffery <andrew@aj.id.au>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Christian Svensson <bluecmd@google.com>

This patch adds the missing checksum calculation on normal DMA transfer.
According to the datasheet this is how the SMC should behave.

Verified on AST1250 that the hardware matches the behaviour.

Signed-off-by: Christian Svensson <bluecmd@google.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 4c162912cf62..9afd0e920dfb 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -986,6 +986,7 @@ static void aspeed_smc_dma_rw(AspeedSMCState *s)
         s->regs[R_DMA_FLASH_ADDR] +=3D 4;
         s->regs[R_DMA_DRAM_ADDR] +=3D 4;
         s->regs[R_DMA_LEN] -=3D 4;
+        s->regs[R_DMA_CHECKSUM] +=3D data;
     }
 }
=20
--=20
2.20.1


