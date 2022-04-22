Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 284D150AF82
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 07:24:53 +0200 (CEST)
Received: from localhost ([::1]:47014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhlmm-0008IJ-54
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 01:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1nhli9-0002L9-S9; Fri, 22 Apr 2022 01:20:05 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:39732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1nhli7-0002ai-PG; Fri, 22 Apr 2022 01:20:05 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 23M56xe0058496;
 Fri, 22 Apr 2022 13:06:59 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.100) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 22 Apr
 2022 13:19:10 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH v5 1/3] aspeed/hace: Support HMAC Key Buffer register.
Date: Fri, 22 Apr 2022 13:19:07 +0800
Message-ID: <20220422051909.27540-2-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220422051909.27540-1-steven_lee@aspeedtech.com>
References: <20220422051909.27540-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.70.100]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 23M56xe0058496
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=steven_lee@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: jamin_lin@aspeedtech.com, troy_lee@aspeedtech.com,
 steven_lee@aspeedtech.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Support HACE28: Hash HMAC Key Buffer Base Address Register.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 hw/misc/aspeed_hace.c         | 7 +++++++
 include/hw/misc/aspeed_hace.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 10f00e65f4..59fe5bfca2 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -27,6 +27,7 @@
 
 #define R_HASH_SRC      (0x20 / 4)
 #define R_HASH_DEST     (0x24 / 4)
+#define R_HASH_KEY_BUFF (0x28 / 4)
 #define R_HASH_SRC_LEN  (0x2c / 4)
 
 #define R_HASH_CMD      (0x30 / 4)
@@ -210,6 +211,9 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
     case R_HASH_DEST:
         data &= ahc->dest_mask;
         break;
+    case R_HASH_KEY_BUFF:
+        data &= ahc->key_mask;
+        break;
     case R_HASH_SRC_LEN:
         data &= 0x0FFFFFFF;
         break;
@@ -333,6 +337,7 @@ static void aspeed_ast2400_hace_class_init(ObjectClass *klass, void *data)
 
     ahc->src_mask = 0x0FFFFFFF;
     ahc->dest_mask = 0x0FFFFFF8;
+    ahc->key_mask = 0x0FFFFFC0;
     ahc->hash_mask = 0x000003ff; /* No SG or SHA512 modes */
 }
 
@@ -351,6 +356,7 @@ static void aspeed_ast2500_hace_class_init(ObjectClass *klass, void *data)
 
     ahc->src_mask = 0x3fffffff;
     ahc->dest_mask = 0x3ffffff8;
+    ahc->key_mask = 0x3FFFFFC0;
     ahc->hash_mask = 0x000003ff; /* No SG or SHA512 modes */
 }
 
@@ -369,6 +375,7 @@ static void aspeed_ast2600_hace_class_init(ObjectClass *klass, void *data)
 
     ahc->src_mask = 0x7FFFFFFF;
     ahc->dest_mask = 0x7FFFFFF8;
+    ahc->key_mask = 0x7FFFFFF8;
     ahc->hash_mask = 0x00147FFF;
 }
 
diff --git a/include/hw/misc/aspeed_hace.h b/include/hw/misc/aspeed_hace.h
index 94d5ada95f..2242945eb4 100644
--- a/include/hw/misc/aspeed_hace.h
+++ b/include/hw/misc/aspeed_hace.h
@@ -37,6 +37,7 @@ struct AspeedHACEClass {
 
     uint32_t src_mask;
     uint32_t dest_mask;
+    uint32_t key_mask;
     uint32_t hash_mask;
 };
 
-- 
2.17.1


