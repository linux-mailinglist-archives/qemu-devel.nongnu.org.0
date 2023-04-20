Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AABC6E8F2D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:07:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRAG-0000eR-9h; Thu, 20 Apr 2023 06:05:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppRAD-0000cO-F9
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:17 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppRA8-0003tr-Bi
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:17 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3003b97fa12so281592f8f.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 03:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681985110; x=1684577110;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IXETFNmGs9QvQq2m1ZAi/6SAVGC9Nw/XwN7n3Zh6D20=;
 b=Hq5RX4Yd7BDCyCKZARmgO8XYfCTT9s9OnXtkE32Op0BVnVvYzHkcGwuZL+VRRgVKnY
 hQ4XHWFbuaL1PUNvNFQhsPVyZnS/i3IKnTzj0CKQU2L/JxB74o9g2EB+fpL3E40EJLWk
 3Tt57h03TjOpD2OnV5XkNEhU8fWS8l/gmTiwU9damo/SUKnUcFKH40l7ZuccZF0XYHZO
 d1yHp8c01wjyskmrljPdB9oY5jFF+2KxIWRqzwRd11PXfLRZPyouyJKwhuhd12kDa7Qw
 6D9uqPEbcp/SMHQarxoPfKSBKnCgXi44HjBRXCsIP+qEfJ6Mj7BxknjSJlzuapUvHou1
 ifGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681985110; x=1684577110;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IXETFNmGs9QvQq2m1ZAi/6SAVGC9Nw/XwN7n3Zh6D20=;
 b=BZtZ2bp5A0QNAU6G80LF3AvOc9bvr1r2EqMJUO49ha+n/+pH2gN7mNl8rG6cI90vTj
 iD7ajC5C3rsU9SimGsSeJ61h2LVu7XtWHJ5L2D2Lt6T6Jws06Mi2fjOFiS2+oubJZpNF
 Xt5IVGuH0u5EkS+G7HF2yP4r60YW+ekKl/PKfWJCXcWtoyPeVNESS6C7ZEDJmsShTn+i
 2T14vNC8E/o20f9HC7CW2BM9rzWululzxiPeW0TJKz6k3CFqhrRAlcZjsJ/TNhetOYQi
 l8BUQyFV1BMFFLnjYm5aSUqL1B/1FJzLkBGxjpRAsmZs0ElpZeyucaitJ5wXrt1yJPdT
 bcKg==
X-Gm-Message-State: AAQBX9cjJtXypwD0toaiNbDI/J7T3/zJzhn6fg+QTtQkSK3R7vlmLRHF
 oqW4ukIN6Cs7Imu9f5RSgA9s6gIo08wjK+pVS0o=
X-Google-Smtp-Source: AKy350Y4ba0jDnMcZtY2VCgQkYmt1Sg6KUEPNP3GWoLGLEMOgTl3/WiB20/1ZjFnjd380v0HAckbgw==
X-Received: by 2002:adf:fd81:0:b0:2fa:ac8:a30c with SMTP id
 d1-20020adffd81000000b002fa0ac8a30cmr931025wrr.48.1681985110213; 
 Thu, 20 Apr 2023 03:05:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002fe522117fdsm1556388wrf.36.2023.04.20.03.05.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 03:05:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/21] arm/mcimx7d-sabre: Set fec2-phy-connected property to
 false
Date: Thu, 20 Apr 2023 11:04:56 +0100
Message-Id: <20230420100456.944969-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420100456.944969-1-peter.maydell@linaro.org>
References: <20230420100456.944969-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Guenter Roeck <linux@roeck-us.net>

On mcimx7d-sabre, the MDIO bus is connected to the first Ethernet
interface. Set fec2-phy-connected to false to reflect this.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Message-id: 20230315145248.1639364-6-linux@roeck-us.net
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mcimx7d-sabre.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/mcimx7d-sabre.c b/hw/arm/mcimx7d-sabre.c
index 6182b15f190..d1778122b64 100644
--- a/hw/arm/mcimx7d-sabre.c
+++ b/hw/arm/mcimx7d-sabre.c
@@ -41,6 +41,8 @@ static void mcimx7d_sabre_init(MachineState *machine)
 
     s = FSL_IMX7(object_new(TYPE_FSL_IMX7));
     object_property_add_child(OBJECT(machine), "soc", OBJECT(s));
+    object_property_set_bool(OBJECT(s), "fec2-phy-connected", false,
+                             &error_fatal);
     qdev_realize(DEVICE(s), NULL, &error_fatal);
 
     memory_region_add_subregion(get_system_memory(), FSL_IMX7_MMDC_ADDR,
-- 
2.34.1


