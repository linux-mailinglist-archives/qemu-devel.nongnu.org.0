Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D63E41D2EC
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 07:56:07 +0200 (CEST)
Received: from localhost ([::1]:39952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVp36-0007ed-NY
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 01:56:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVos7-0000zj-Aq; Thu, 30 Sep 2021 01:44:43 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:37145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVos5-0003Rl-GO; Thu, 30 Sep 2021 01:44:43 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HKhyR1CkNz4xbf; Thu, 30 Sep 2021 15:44:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632980671;
 bh=d5hTqDv76pOuEEm9B52MnPOikO5an0DGGKmN2kanGpA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o/DbcycOk41U6jthr2gYNEHSUuvyFPkuCI0AWdbkza/dXW9jqYi1Ec8aawQH90hmZ
 wrLlrt2o64duhYkoPb7qmRgSjBE6Oq5btSb0xatr46nV6t8w4CgzlC8tw06up4XUo+
 /0PYrkLS2Gbps9L6JnqWfJ4m1C/u/tqE1ASy6WHA=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 12/44] ppc/pnv: Add an assert when calculating the RAM
 distribution on chips
Date: Thu, 30 Sep 2021 15:43:54 +1000
Message-Id: <20210930054426.357344-13-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930054426.357344-1-david@gibson.dropbear.id.au>
References: <20210930054426.357344-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, groug@kaod.org,
 hpoussin@reactos.org, clg@kaod.org, qemu-ppc@nongnu.org, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20210902130928.528803-3-clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/pnv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 03c86508d2..71e45515f1 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -723,6 +723,8 @@ static uint64_t pnv_chip_get_ram_size(PnvMachineState *pnv, int chip_id)
         return QEMU_ALIGN_DOWN(ram_per_chip, 1 * MiB);
     }
 
+    assert(pnv->num_chips > 1);
+
     ram_per_chip = (machine->ram_size - 1 * GiB) / (pnv->num_chips - 1);
     return chip_id == 0 ? 1 * GiB : QEMU_ALIGN_DOWN(ram_per_chip, 1 * MiB);
 }
-- 
2.31.1


