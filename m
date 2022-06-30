Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E41561990
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 13:49:22 +0200 (CEST)
Received: from localhost ([::1]:54332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6sfh-00033F-B7
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 07:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sHn-0007Lv-CP; Thu, 30 Jun 2022 07:24:39 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:33485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sHl-000215-JW; Thu, 30 Jun 2022 07:24:39 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LYbZq15Qwz4xXD;
 Thu, 30 Jun 2022 21:24:35 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LYbZm5Mwhz4xD5;
 Thu, 30 Jun 2022 21:24:32 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 06/27] aspeed/hace: Accumulative mode supported
Date: Thu, 30 Jun 2022 13:23:50 +0200
Message-Id: <20220630112411.1474431-7-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220630112411.1474431-1-clg@kaod.org>
References: <20220630112411.1474431-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

From: Joel Stanley <joel@jms.id.au>

While the HMAC mode is not modelled, the accumulative mode is.

Accumulative mode is enabled by setting one of the bits in the HMAC
engine command mode part of the register, so fix the unimplemented check
to only look at the upper of the two bits.

Fixes: 5cd7d8564a8b ("aspeed/hace: Support AST2600 HACE")
Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220627100816.125956-1-joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/misc/aspeed_hace.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 731234b78c4c..ac21be306c69 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -338,10 +338,10 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
         int algo;
         data &= ahc->hash_mask;
 
-        if ((data & HASH_HMAC_MASK)) {
+        if ((data & HASH_DIGEST_HMAC)) {
             qemu_log_mask(LOG_UNIMP,
-                          "%s: HMAC engine command mode %"PRIx64" not implemented\n",
-                          __func__, (data & HASH_HMAC_MASK) >> 8);
+                          "%s: HMAC mode not implemented\n",
+                          __func__);
         }
         if (data & BIT(1)) {
             qemu_log_mask(LOG_UNIMP,
-- 
2.35.3


