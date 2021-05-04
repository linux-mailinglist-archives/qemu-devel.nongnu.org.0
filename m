Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0BC3725F7
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 08:51:54 +0200 (CEST)
Received: from localhost ([::1]:52498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldouP-0007kc-Gz
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 02:51:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo1N-00077A-Ld; Tue, 04 May 2021 01:55:01 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:55873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo1L-0005OK-OX; Tue, 04 May 2021 01:55:01 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ8CQ4zFlz9t1s; Tue,  4 May 2021 15:53:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620107602;
 bh=y9uyQJXG5pCTAYMMEsFQPkAKFM4i1KQ0n02I0GZk4yE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hq6T6klWkS8oHc0yWEps/9mxyicptvOKUyB3lTR75OYa69RMOoQdoO5vp2tzDApCI
 /jeiPcICKOtZFTi9K2EjllwX9OrdKPI0uW+7plkTtDY9C7UPw7e02UI2FC1BM6ABEb
 xQSBrr9DAWkS3M3MATWbSUabQHmCIZ8yCxQZ3hKo=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 46/46] hw/ppc/pnv_psi: Use device_cold_reset() instead of
 device_legacy_reset()
Date: Tue,  4 May 2021 15:53:12 +1000
Message-Id: <20210504055312.306823-47-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504055312.306823-1-david@gibson.dropbear.id.au>
References: <20210504055312.306823-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

The pnv_psi.c code uses device_legacy_reset() for two purposes:
 * to reset itself from its qemu_register_reset() handler
 * to reset a XiveSource object it has

Neither it nor the XiveSource have any qbuses, so the new
device_cold_reset() function (which resets both the device and its
child buses) is equivalent here to device_legacy_reset() and we can
just switch to the new API.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210503151849.8766-4-peter.maydell@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/pnv_psi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/pnv_psi.c b/hw/ppc/pnv_psi.c
index 3e868c8c8d..292b373f93 100644
--- a/hw/ppc/pnv_psi.c
+++ b/hw/ppc/pnv_psi.c
@@ -466,7 +466,7 @@ static void pnv_psi_reset(DeviceState *dev)
 
 static void pnv_psi_reset_handler(void *dev)
 {
-    device_legacy_reset(DEVICE(dev));
+    device_cold_reset(DEVICE(dev));
 }
 
 static void pnv_psi_realize(DeviceState *dev, Error **errp)
@@ -710,7 +710,7 @@ static void pnv_psi_p9_mmio_write(void *opaque, hwaddr addr,
         break;
     case PSIHB9_INTERRUPT_CONTROL:
         if (val & PSIHB9_IRQ_RESET) {
-            device_legacy_reset(DEVICE(&psi9->source));
+            device_cold_reset(DEVICE(&psi9->source));
         }
         psi->regs[reg] = val;
         break;
-- 
2.31.1


