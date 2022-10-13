Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3594B5FDE74
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 18:49:29 +0200 (CEST)
Received: from localhost ([::1]:55940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj1Oh-0006QI-UR
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 12:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=HNeY=2O=kaod.org=clg@ozlabs.org>)
 id 1oj0pm-0001DN-UD; Thu, 13 Oct 2022 12:13:22 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:41941
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=HNeY=2O=kaod.org=clg@ozlabs.org>)
 id 1oj0pk-0002gf-LE; Thu, 13 Oct 2022 12:13:22 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4MpF1V1YJJz4xGw;
 Fri, 14 Oct 2022 03:13:18 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MpF1Q6XQtz4xDn;
 Fri, 14 Oct 2022 03:13:14 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Iris Chen <irischenlj@fb.com>, Michael Walle <michael@walle.cc>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v4 07/10] m25p80: Add the w25q256 SFPD table
Date: Thu, 13 Oct 2022 18:12:38 +0200
Message-Id: <20221013161241.2805140-8-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013161241.2805140-1-clg@kaod.org>
References: <20221013161241.2805140-1-clg@kaod.org>
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

The SFDP table size is 0x100 bytes long. Only the mandatory table for
basic features is available at byte 0x80.

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Message-Id: <20220722063602.128144-7-clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/block/m25p80_sfdp.h |  2 ++
 hw/block/m25p80.c      |  3 ++-
 hw/block/m25p80_sfdp.c | 40 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/hw/block/m25p80_sfdp.h b/hw/block/m25p80_sfdp.h
index ec829644b047..595be9000daa 100644
--- a/hw/block/m25p80_sfdp.h
+++ b/hw/block/m25p80_sfdp.h
@@ -21,4 +21,6 @@ uint8_t m25p80_sfdp_mx25l25635e(uint32_t addr);
 uint8_t m25p80_sfdp_mx25l25635f(uint32_t addr);
 uint8_t m25p80_sfdp_mx66l1g45g(uint32_t addr);
 
+uint8_t m25p80_sfdp_w25q256(uint32_t addr);
+
 #endif
diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 376be327e575..6119c57c8980 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -345,7 +345,8 @@ static const FlashPartInfo known_devices[] = {
     { INFO("w25q64",      0xef4017,      0,  64 << 10, 128, ER_4K) },
     { INFO("w25q80",      0xef5014,      0,  64 << 10,  16, ER_4K) },
     { INFO("w25q80bl",    0xef4014,      0,  64 << 10,  16, ER_4K) },
-    { INFO("w25q256",     0xef4019,      0,  64 << 10, 512, ER_4K) },
+    { INFO("w25q256",     0xef4019,      0,  64 << 10, 512, ER_4K),
+      .sfdp_read = m25p80_sfdp_w25q256 },
     { INFO("w25q512jv",   0xef4020,      0,  64 << 10, 1024, ER_4K) },
     { INFO("w25q01jvq",   0xef4021,      0,  64 << 10, 2048, ER_4K) },
 };
diff --git a/hw/block/m25p80_sfdp.c b/hw/block/m25p80_sfdp.c
index 38c3ced34d2e..5b011559d43d 100644
--- a/hw/block/m25p80_sfdp.c
+++ b/hw/block/m25p80_sfdp.c
@@ -218,3 +218,43 @@ static const uint8_t sfdp_mx66l1g45g[] = {
     0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
 };
 define_sfdp_read(mx66l1g45g);
+
+/*
+ * Windbond
+ */
+
+static const uint8_t sfdp_w25q256[] = {
+    0x53, 0x46, 0x44, 0x50, 0x00, 0x01, 0x00, 0xff,
+    0x00, 0x00, 0x01, 0x09, 0x80, 0x00, 0x00, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xe5, 0x20, 0xf3, 0xff, 0xff, 0xff, 0xff, 0x0f,
+    0x44, 0xeb, 0x08, 0x6b, 0x08, 0x3b, 0x42, 0xbb,
+    0xfe, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x00,
+    0xff, 0xff, 0x21, 0xeb, 0x0c, 0x20, 0x0f, 0x52,
+    0x10, 0xd8, 0x00, 0x00, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+};
+define_sfdp_read(w25q256);
-- 
2.37.3


