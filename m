Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8347E68C91A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 23:08:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP9eR-0004a6-NR; Mon, 06 Feb 2023 17:07:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pP9eQ-0004ZS-EP; Mon, 06 Feb 2023 17:07:50 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pP9eO-0007KA-QT; Mon, 06 Feb 2023 17:07:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FMY/MoQ2UK7kcYkRp09mQO4SDz9wI5uBhgAds+0slg8=; b=cN8vMOKhZaKRm7NVIQim+pSEhZ
 85QYHsYG49NxN20EUcmwRjuJ+mjffMjHpemmFoDOyyzUF/YZKqaBd1ZpbJweyi8JzJsEUXZS48uT1
 7gqBIxyHfhJSfC2lgQdYLvgJnxAONIaGiHBEsfZtw+k6Xe1aOUAm0lnZtrX/hZn7Ycoj7nT/gB+P7
 VyqFuoSUI3KPS9XuQFX0cdoAmkKKa1AvCgk4moDFXqZ3fI6GjGZ016iyz8y0e8CogMbESQB52kqdO
 ge4eVtc5mN0G8iH0fn/Bl8tX4Hy4BVYAFfhSJBBYhPV0gD3z22naFkVaH1YtcN1uti9Bhp1u7oSoI
 gY3MLZmfIWmx6L3TmQibKabdTWCKSm1BNpl0aVsg5YMvaUyfi8j7rjWnYAaTnKULkaB4oZJS2/Kgp
 VMLDA0EaZczwIcQxQ7V1q0dypSKnc7ilisMpqbeCZTD8KpWNgL3SY6URLMPOJQxFUL+9caeAaSG1y
 KZY6V52lJoUC8uOjzHhxGjZc2PnTwuTvZBgygqF7ceHa2ANffgEwZFWA9PnbNmQoZIHj/JtHdrfux
 OeFpe6pGLnjcpsW7IBrm6THxDg22/RG/Ik/sbO7+tJ5hYrqce5WYsvJFi5rWMSq66ATUd5+OGy1BF
 cb6jFgrsDGoX9quaPBiRJ5WH4U2o6jFln3ejt1VO0=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pP9dq-00039N-8T; Mon, 06 Feb 2023 22:07:18 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Date: Mon,  6 Feb 2023 22:07:16 +0000
Message-Id: <20230206220722.125814-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230206220722.125814-1-mark.cave-ayland@ilande.co.uk>
References: <20230206220722.125814-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 2/8] mac_{old,
 new}world: Use local variable instead of qdev_get_machine()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: BALATON Zoltan <balaton@eik.bme.hu>

We already have machine in a local variable so no need to use
qdev_get_machine(), also remove now unneeded line break.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <719299533b89aa4516966065eae05c75744f50d3.1672868854.git.balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/ppc/mac_newworld.c | 3 +--
 hw/ppc/mac_oldworld.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 601ea518f8..460c14b5e3 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -466,8 +466,7 @@ static void ppc_core99_init(MachineState *machine)
     fw_cfg = FW_CFG(dev);
     qdev_prop_set_uint32(dev, "data_width", 1);
     qdev_prop_set_bit(dev, "dma_enabled", false);
-    object_property_add_child(OBJECT(qdev_get_machine()), TYPE_FW_CFG,
-                              OBJECT(fw_cfg));
+    object_property_add_child(OBJECT(machine), TYPE_FW_CFG, OBJECT(fw_cfg));
     s = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(s, &error_fatal);
     sysbus_mmio_map(s, 0, CFG_ADDR);
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 558c639202..5a7b25a4a8 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -303,8 +303,7 @@ static void ppc_heathrow_init(MachineState *machine)
     fw_cfg = FW_CFG(dev);
     qdev_prop_set_uint32(dev, "data_width", 1);
     qdev_prop_set_bit(dev, "dma_enabled", false);
-    object_property_add_child(OBJECT(qdev_get_machine()), TYPE_FW_CFG,
-                              OBJECT(fw_cfg));
+    object_property_add_child(OBJECT(machine), TYPE_FW_CFG, OBJECT(fw_cfg));
     s = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(s, &error_fatal);
     sysbus_mmio_map(s, 0, CFG_ADDR);
-- 
2.30.2


