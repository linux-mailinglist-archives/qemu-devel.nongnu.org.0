Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8467C572912
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 00:12:49 +0200 (CEST)
Received: from localhost ([::1]:45626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBO7c-0007kN-Jj
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 18:12:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNpl-0002Gm-EC; Tue, 12 Jul 2022 17:54:21 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNpj-0007sI-2Z; Tue, 12 Jul 2022 17:54:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vYDoaLGOSh9zh6SxbCzMeBkFO57cLarjy2f54HLBIZU=; b=I2BKH6wz+Wa+/rte4WJq+CoZKx
 HvPSRzNqHajNaUNbGLZfcCTC9nU8gv+OqY5VjTB13tpQQG2hwzmRtBFg8hd/C74Br2+l0cok3oBom
 qIKwXSKZYDDv0ssnpy17DTcpy/I3ovwfmDFszMnTfqHnkTnnCe8qmj9tldb4D9aBEUH/bkru/gecV
 9Xc2tWMQTmG4C+I+3cRAF0UB9qCxStEwtO6kSQKkp2OeG3SSL79XbMWdMC3QsSQn/bJ1K16FFP/xu
 uMu9m0mGWoLggjlrBQjAVkwDG31xBdu7kJDIhOzW4wx44sY90IEc5CPjesyzPA899YemccmvrrLOy
 8/yLb2imTferhFRItuiSPhV8gbv4wDdrJxY3FFEVfv8sZRfhDPGSMRWtb06V+jHAqecphpQA8owxs
 sYAdY6A1w38iopn+ZDzzhWI9DGffGukJLQlHnpn+bBmq8GyQAIAWAXDHbGixGlMABmG3EtflVaF7Z
 d3PymSb+sZ02zazI8xorDQtG0s2PvInX0pAQV9eFEtggL/vKJB7vYELagle3qwHmG0T7+h0MS0pBB
 NeeYNe/gx+v+Mh6pxmsxXzJnpeRCg2e8a+73RczBYwEufQ5u1zXC4qmV3JN0RNyRUs8xncxSN0Rfy
 eyBSmxGRe1UgIthGWgm0UM7gx5yhJ+5HlSR+WrJoo=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNo1-000Bqt-JA; Tue, 12 Jul 2022 22:52:37 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Tue, 12 Jul 2022 22:52:27 +0100
Message-Id: <20220712215251.7944-17-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 16/40] lasips2: QOMify LASIPS2Port
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This becomes an abstract QOM type which will be a parent type for separate
keyboard and mouse port types.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/lasips2.c         |  8 ++++++++
 include/hw/input/lasips2.h | 14 ++++++++++----
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index b539c4de7a..56bfd759af 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -311,9 +311,17 @@ static const TypeInfo lasips2_info = {
     .class_init    = lasips2_class_init,
 };
 
+static const TypeInfo lasips2_port_info = {
+    .name          = TYPE_LASIPS2_PORT,
+    .parent        = TYPE_DEVICE,
+    .instance_size = sizeof(LASIPS2Port),
+    .abstract      = true,
+};
+
 static void lasips2_register_types(void)
 {
     type_register_static(&lasips2_info);
+    type_register_static(&lasips2_port_info);
 }
 
 type_init(lasips2_register_types)
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index 9746b7a132..f4514081fe 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -25,9 +25,15 @@
 #include "hw/sysbus.h"
 #include "hw/input/ps2.h"
 
-struct LASIPS2State;
-typedef struct LASIPS2Port {
-    struct LASIPS2State *parent;
+#define TYPE_LASIPS2_PORT "lasips2-port"
+OBJECT_DECLARE_SIMPLE_TYPE(LASIPS2Port, LASIPS2_PORT)
+
+typedef struct LASIPS2State LASIPS2State;
+
+struct LASIPS2Port {
+    DeviceState parent_obj;
+
+    LASIPS2State *parent;
     MemoryRegion reg;
     PS2State *ps2dev;
     uint8_t id;
@@ -35,7 +41,7 @@ typedef struct LASIPS2Port {
     uint8_t buf;
     bool loopback_rbne;
     bool irq;
-} LASIPS2Port;
+};
 
 struct LASIPS2State {
     SysBusDevice parent_obj;
-- 
2.30.2


