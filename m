Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76ACD60D0C2
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 17:37:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onLkK-0007oi-VP; Tue, 25 Oct 2022 11:21:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=KVXu=22=kaod.org=clg@ozlabs.org>)
 id 1onLkE-0007e8-3X; Tue, 25 Oct 2022 11:21:34 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=KVXu=22=kaod.org=clg@ozlabs.org>)
 id 1onLk5-0004sp-Ci; Tue, 25 Oct 2022 11:21:33 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4MxbJ20rhCz4xGr;
 Wed, 26 Oct 2022 02:21:22 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MxbHz2Hl9z4xGk;
 Wed, 26 Oct 2022 02:21:19 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Francisco Iglesias <frasse.iglesias@gmail.com>
Subject: [PULL 09/16] m25p80: Add erase size for mx25l25635e
Date: Tue, 25 Oct 2022 17:20:35 +0200
Message-Id: <20221025152042.278287-10-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221025152042.278287-1-clg@kaod.org>
References: <20221025152042.278287-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=KVXu=22=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Message-Id: <20221013161241.2805140-4-clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/block/m25p80.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 13e7b28fd2b0..637c25d76e37 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -232,7 +232,8 @@ static const FlashPartInfo known_devices[] = {
     { INFO("mx25l6405d",  0xc22017,      0,  64 << 10, 128, 0) },
     { INFO("mx25l12805d", 0xc22018,      0,  64 << 10, 256, 0) },
     { INFO("mx25l12855e", 0xc22618,      0,  64 << 10, 256, 0) },
-    { INFO6("mx25l25635e", 0xc22019,     0xc22019,  64 << 10, 512, 0) },
+    { INFO6("mx25l25635e", 0xc22019,     0xc22019,  64 << 10, 512,
+            ER_4K | ER_32K) },
     { INFO("mx25l25655e", 0xc22619,      0,  64 << 10, 512, 0) },
     { INFO("mx66l51235f", 0xc2201a,      0,  64 << 10, 1024, ER_4K | ER_32K) },
     { INFO("mx66u51235f", 0xc2253a,      0,  64 << 10, 1024, ER_4K | ER_32K) },
-- 
2.37.3


