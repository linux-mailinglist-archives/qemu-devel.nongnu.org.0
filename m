Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7675728F0
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 00:04:26 +0200 (CEST)
Received: from localhost ([::1]:51520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBNzV-0000nq-DY
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 18:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNou-0008SW-4g; Tue, 12 Jul 2022 17:53:29 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNos-0007oS-Ld; Tue, 12 Jul 2022 17:53:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HHaw+iLNWt2de+Ka2GYphTR/zspAPxaWo2m+c1mXLJM=; b=JIAlraVNkbsFncObjeYWc9RDS3
 YPKdAycEOBGidW0oPNj4/QdcVdcDpjJnyKq83azvXM1uZI4nvxnI2d85rWo83OzrLY8TRbuu/hM8X
 pSbUYEQeCxQVDO88OATvr5LGMJGbV9Irn9MoCxgQNux7eBP4QG916QVf4bu+Pn+OY/5aZqTXteRf+
 fTmR3QeoH/C+eMu2IBhGVea6/podhyMzjggzxT0RTap2vGN9VU1hqgiFqR6+I3675vzaHrj3a7xlX
 V3SgUCNI6kmkMIK0S1krUMCDdHcVJNkDVdlzDhH59zQ4PaoPRWddpH4vsDDwHCtwG0Zk3rc25ypBt
 Y0Jx27qPLLJxKXY6w1Yt8OW2FmvyYckGnLqxvnKbG56SOrrHu9D7cuJhpy5MY7HSVgf8vXJ8VJjf1
 FERf/R6RTPP2sO7qAV+HHyxarFQ2rM2BKf8HU5PkrvoCIIZi4q2PT99wF+q4m79/mZn1blaEG7a0E
 ewbe9QIjeCCMPtNeMyeI0of/H9INgUDdEn87DzCgavJawhfGnBL6P2tLEJ7AO0EJRxMBsTwzLDhcr
 GNNtzSfc7xsEGzi69dzyABQMYTvl0ZHTsXejYLglKIZ2QzoiaFCGyAPi1/XiEFKu3bXhqirvZx7Rr
 ef4VcyIO5eXkw4FAvv8d3Kuigbq0o5KsJflP+Vymo=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNnU-000Bqt-PL; Tue, 12 Jul 2022 22:52:04 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Tue, 12 Jul 2022 22:52:18 +0100
Message-Id: <20220712215251.7944-8-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 07/40] pl050: introduce PL050DeviceClass for the PL050
 device
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
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


