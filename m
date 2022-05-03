Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AC0517E3A
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 09:15:52 +0200 (CEST)
Received: from localhost ([::1]:57614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlmlD-00078O-OD
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 03:15:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=XF6a=VL=kaod.org=clg@ozlabs.org>)
 id 1nlmVi-0003Ub-67; Tue, 03 May 2022 02:59:51 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:47553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=XF6a=VL=kaod.org=clg@ozlabs.org>)
 id 1nlmVg-0007XT-Ex; Tue, 03 May 2022 02:59:49 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KsrRz3Lpzz4xXh;
 Tue,  3 May 2022 16:59:43 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KsrRx4vRMz4yST;
 Tue,  3 May 2022 16:59:41 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 19/19] aspeed/hace: Support AST1030 HACE
Date: Tue,  3 May 2022 08:58:48 +0200
Message-Id: <20220503065848.125215-20-clg@kaod.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503065848.125215-1-clg@kaod.org>
References: <20220503065848.125215-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=XF6a=VL=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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

From: Steven Lee <steven_lee@aspeedtech.com>

Per ast1030_v7.pdf, AST1030 HACE engine is identical to AST2600's HACE
engine.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/misc/aspeed_hace.h |  2 ++
 hw/misc/aspeed_hace.c         | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/include/hw/misc/aspeed_hace.h b/include/hw/misc/aspeed_hace.h
index 40aebf1d6ea7..4f9ce179bf7b 100644
--- a/include/hw/misc/aspeed_hace.h
+++ b/include/hw/misc/aspeed_hace.h
@@ -15,6 +15,8 @@
 #define TYPE_ASPEED_AST2400_HACE TYPE_ASPEED_HACE "-ast2400"
 #define TYPE_ASPEED_AST2500_HACE TYPE_ASPEED_HACE "-ast2500"
 #define TYPE_ASPEED_AST2600_HACE TYPE_ASPEED_HACE "-ast2600"
+#define TYPE_ASPEED_AST1030_HACE TYPE_ASPEED_HACE "-ast1030"
+
 OBJECT_DECLARE_TYPE(AspeedHACEState, AspeedHACEClass, ASPEED_HACE)
 
 #define ASPEED_HACE_NR_REGS (0x64 >> 2)
diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 0f4059e6df8e..4b5997e18fad 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -507,11 +507,31 @@ static const TypeInfo aspeed_ast2600_hace_info = {
     .class_init = aspeed_ast2600_hace_class_init,
 };
 
+static void aspeed_ast1030_hace_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedHACEClass *ahc = ASPEED_HACE_CLASS(klass);
+
+    dc->desc = "AST1030 Hash and Crypto Engine";
+
+    ahc->src_mask = 0x7FFFFFFF;
+    ahc->dest_mask = 0x7FFFFFF8;
+    ahc->key_mask = 0x7FFFFFF8;
+    ahc->hash_mask = 0x00147FFF;
+}
+
+static const TypeInfo aspeed_ast1030_hace_info = {
+    .name = TYPE_ASPEED_AST1030_HACE,
+    .parent = TYPE_ASPEED_HACE,
+    .class_init = aspeed_ast1030_hace_class_init,
+};
+
 static void aspeed_hace_register_types(void)
 {
     type_register_static(&aspeed_ast2400_hace_info);
     type_register_static(&aspeed_ast2500_hace_info);
     type_register_static(&aspeed_ast2600_hace_info);
+    type_register_static(&aspeed_ast1030_hace_info);
     type_register_static(&aspeed_hace_info);
 }
 
-- 
2.35.1


