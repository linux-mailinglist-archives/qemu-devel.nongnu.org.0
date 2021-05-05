Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 345B13735A8
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 09:37:33 +0200 (CEST)
Received: from localhost ([::1]:35278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leC68-0000gf-5R
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 03:37:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1leC4U-0007X8-Bb
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:35:50 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57678
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1leC4Q-00022d-83
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:35:50 -0400
Received: from host81-154-26-71.range81-154.btcentralplus.com ([81.154.26.71]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1leC4N-0000OI-Se; Wed, 05 May 2021 08:35:44 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Wed,  5 May 2021 08:35:29 +0100
Message-Id: <20210505073538.11438-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210505073538.11438-1-mark.cave-ayland@ilande.co.uk>
References: <20210505073538.11438-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.154.26.71
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 01/10] hw/sparc/sun4m: Have sun4m machines inherit new
 TYPE_SUN4M_MACHINE
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Introduce the TYPE_SUN4M_MACHINE and have all sun4m
machines inherit it.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20210503171303.822501-2-f4bug@amsat.org>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/sparc/sun4m.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 1a00816d9a..9d07fa43d6 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -107,6 +107,8 @@ struct sun4m_hwdef {
     uint8_t nvram_machine_id;
 };
 
+#define TYPE_SUN4M_MACHINE MACHINE_TYPE_NAME("sun4m-common")
+
 const char *fw_cfg_arch_key_name(uint16_t key)
 {
     static const struct {
@@ -1433,7 +1435,7 @@ static void ss5_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ss5_type = {
     .name = MACHINE_TYPE_NAME("SS-5"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_SUN4M_MACHINE,
     .class_init = ss5_class_init,
 };
 
@@ -1453,7 +1455,7 @@ static void ss10_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ss10_type = {
     .name = MACHINE_TYPE_NAME("SS-10"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_SUN4M_MACHINE,
     .class_init = ss10_class_init,
 };
 
@@ -1473,7 +1475,7 @@ static void ss600mp_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ss600mp_type = {
     .name = MACHINE_TYPE_NAME("SS-600MP"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_SUN4M_MACHINE,
     .class_init = ss600mp_class_init,
 };
 
@@ -1493,7 +1495,7 @@ static void ss20_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ss20_type = {
     .name = MACHINE_TYPE_NAME("SS-20"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_SUN4M_MACHINE,
     .class_init = ss20_class_init,
 };
 
@@ -1512,7 +1514,7 @@ static void voyager_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo voyager_type = {
     .name = MACHINE_TYPE_NAME("Voyager"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_SUN4M_MACHINE,
     .class_init = voyager_class_init,
 };
 
@@ -1531,7 +1533,7 @@ static void ss_lx_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ss_lx_type = {
     .name = MACHINE_TYPE_NAME("LX"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_SUN4M_MACHINE,
     .class_init = ss_lx_class_init,
 };
 
@@ -1550,7 +1552,7 @@ static void ss4_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ss4_type = {
     .name = MACHINE_TYPE_NAME("SS-4"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_SUN4M_MACHINE,
     .class_init = ss4_class_init,
 };
 
@@ -1569,7 +1571,7 @@ static void scls_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo scls_type = {
     .name = MACHINE_TYPE_NAME("SPARCClassic"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_SUN4M_MACHINE,
     .class_init = scls_class_init,
 };
 
@@ -1588,10 +1590,20 @@ static void sbook_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo sbook_type = {
     .name = MACHINE_TYPE_NAME("SPARCbook"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_SUN4M_MACHINE,
     .class_init = sbook_class_init,
 };
 
+static const TypeInfo sun4m_machine_types[] = {
+    {
+        .name           = TYPE_SUN4M_MACHINE,
+        .parent         = TYPE_MACHINE,
+        .abstract       = true,
+    }
+};
+
+DEFINE_TYPES(sun4m_machine_types)
+
 static void sun4m_register_types(void)
 {
     type_register_static(&idreg_info);
-- 
2.20.1


