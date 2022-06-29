Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5409456012D
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 15:22:22 +0200 (CEST)
Received: from localhost ([::1]:36684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Xe8-0002g4-Is
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 09:22:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X0m-0008MP-Cm; Wed, 29 Jun 2022 08:41:40 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X0j-0004i8-NC; Wed, 29 Jun 2022 08:41:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oVPfguTLJfmrthQIahrPikO0rmnSU5aHhqAHxxh2LYk=; b=iDl8nyxFkiGkXpzj5LbsRcSR9Y
 cXVOLKHpLomyw2F0rcET0Zx8oQzUW/o0Xr/h2h6PO1Iz90yzfdWsmF1qEQ98uxoT0mICMrujmRPSX
 x6faFYu3hv1qHlqqWh9XjUC6WG5Ho42/Z/8G7plquzj6l57lUkzFbK7hHKpGrcnX5Bwf81yrVbNfm
 IhLefyuwR+sKFnhmiEO6k/RtsCTXvTQD8Gk3+MYmynnp0T0mZ48dh9/RLUUGN7l+la48X6LcLQ27J
 ZldoWs1oC3f30lsMkjtUnD+L+H5cLdd3xg6VUvpyuvhTO3yJpWkY/9w0dKq5aA3pCj5kpQ50QNkIi
 dcwA/UsW/+B6qlUoPIlhuFvm0ADJpCxbKF3Cg9H4CI9L8djTVgciC/662c9wVIk2tTCuBlTHzY/Rp
 zORNQlEtusWh3WN5tXokzb+8qWGV6Vt4UtZPj6wtigkFV5dWbotIvAtRv4p79XKqBYzqc47qE+GVI
 ijaUop1K3olzwybESrXL+UPIrqdXwPYHurReMJs29wC4oZREXD3/+lPhj+pu7ELcokRdL6RYXpBP/
 wlCTsWoW8Yr3DuZLk+75TBsq0dR9pPRZv7g3DZ2II4FPNL3vNjJPRzrP4hWMFNyF01MtodeIfeFnT
 sKrtJI8qrl983B3mAyXO9YDrp/mIUOHOm9u6HZC/A=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6Wz5-0002tZ-1o; Wed, 29 Jun 2022 13:39:59 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 29 Jun 2022 13:40:02 +0100
Message-Id: <20220629124026.1077021-17-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 16/40] lasips2: QOMify LASIPS2Port
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


