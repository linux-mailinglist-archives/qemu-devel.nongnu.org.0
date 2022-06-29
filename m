Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B19F5600A1
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 15:06:42 +0200 (CEST)
Received: from localhost ([::1]:37648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6XOy-0000bW-Oh
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 09:06:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X09-0007ca-UY; Wed, 29 Jun 2022 08:41:06 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X08-0004eM-G6; Wed, 29 Jun 2022 08:41:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U6eelMB55dLrnnotyACrYFBOUe+D4MNgeHqjT3Oicw4=; b=IqmxfgsmDp+jBaVAbFVguICodX
 5w99smSWLwoWho1kv71LTYAS/twI5o9KV3ZxzaNByZF6G14WH6KTZj+bgrsIFYcMQUQCQAedw5izE
 x5iTl85Dfxjm4bzRJ03PlVWtIkIZHpgp3lt9lNvgZaws2sK4Muh6hZfs3oh3SPMoHacxy4oxhHKrW
 D7IAtu4F40NVZgXiClDwNrskRn9bvnSm1JsgIwyMOOId15dyNjhOVD06wbjtZb05aBiAG8PV/Nu9R
 wKGrVbHIjzX0rs9dV/gxIt/NE0u4v4id5AnJtsQAYPy9ejv41p+OUDmUrz/wFfTZgRTg/xweQoqcl
 kASGa8SaTxDT2I2PvxRMPquyQ2UuKd1jnyjUQzYehVpesnRG5fDqMuqgTmYK4bZ0wGes50nKJ34mE
 kuAqnXIGIWklQFomv43YW21q5qNVrDU5qfej9QjLqY4zT7nxw3Tnxe9rbEFC+gsDV5doCNyh02f3U
 nFB3ZQLz2Xv1k8fWvXm4bvojn8zbBMyiM6Ue6uiQ82JKYCn/1CfBJXYNIEYhlnWv1eF5WaRBrtyhn
 ZjYD4Hc67J1kycIXj4zl/UQm1xGXMYAJCtF9qS0wBv/k6NmNYTkGg2JcVehguzLVTQklquScWuGgL
 SAK3xyzKEfYV4KofBkhSvQ7s06306p+UspTeToz4M=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6Wyo-0002tZ-Gz; Wed, 29 Jun 2022 13:39:42 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 29 Jun 2022 13:39:53 +0100
Message-Id: <20220629124026.1077021-8-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 07/40] pl050: introduce PL050DeviceClass for the PL050 device
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

This will soon be used to store the reference to the PL050 parent device
for PL050_KBD_DEVICE and PL050_MOUSE_DEVICE.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/pl050.c         | 2 ++
 include/hw/input/pl050.h | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index e32d86005a..d7796b73a1 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -216,6 +216,8 @@ static const TypeInfo pl050_type_info = {
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_init = pl050_init,
     .instance_size = sizeof(PL050State),
+    .class_init    = pl050_class_init,
+    .class_size    = sizeof(PL050DeviceClass),
     .abstract      = true,
     .class_init    = pl050_class_init,
 };
diff --git a/include/hw/input/pl050.h b/include/hw/input/pl050.h
index bb0e87ff45..203f03a194 100644
--- a/include/hw/input/pl050.h
+++ b/include/hw/input/pl050.h
@@ -16,8 +16,14 @@
 #include "hw/input/ps2.h"
 #include "hw/irq.h"
 
+struct PL050DeviceClass {
+    SysBusDeviceClass parent_class;
+
+    DeviceRealize parent_realize;
+};
+
 #define TYPE_PL050 "pl050"
-OBJECT_DECLARE_SIMPLE_TYPE(PL050State, PL050)
+OBJECT_DECLARE_TYPE(PL050State, PL050DeviceClass, PL050)
 
 struct PL050State {
     SysBusDevice parent_obj;
-- 
2.30.2


