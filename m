Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E016A8171
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 12:44:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXhLW-00018S-2a; Thu, 02 Mar 2023 06:43:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qianfanguijin@163.com>)
 id 1pXhLP-0000p6-KC; Thu, 02 Mar 2023 06:43:32 -0500
Received: from m12.mail.163.com ([220.181.12.215])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qianfanguijin@163.com>)
 id 1pXhLN-0006so-5P; Thu, 02 Mar 2023 06:43:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Lk2p5
 dM/gxzGmZK2D34aNq683yhjuF8HDDgw1YnG14o=; b=WsiZxqIF5S2sCGn52dY06
 vSCaWgJ9k5k4PAiNw3R+q7vAEqbjM9FSbLpjKMJY9mSYbSid9PdnwZ03/dopJVHC
 vipz/XYcjIhiJr8Pt6IvzcEKfPGMTMpml5oUbaqfuB/bqmEljL9kLBOUHCrcIapG
 R4rmJXprjpOlTI0GnAF6VY=
Received: from DESKTOP-B1R4FVG.localdomain (unknown [144.123.156.254])
 by zwqz-smtp-mta-g2-0 (Coremail) with SMTP id _____wAH7JDOiwBkjOIhBw--.32153S2;
 Thu, 02 Mar 2023 19:43:11 +0800 (CST)
From: qianfanguijin@163.com
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 qianfan Zhao <qianfanguijin@163.com>
Subject: [RFC PATCH v1 11/12] hw: arm: allwinner-r40: Fix the mmc controller's
 type
Date: Thu,  2 Mar 2023 19:43:09 +0800
Message-Id: <20230302114310.32340-1-qianfanguijin@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAH7JDOiwBkjOIhBw--.32153S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ur1DJr47CF17JFyfXryDGFg_yoW8Xr4kp3
 Wfua9xGr9Yg3yxAa1DK3Z7Wry8Gryv9w1UCr1F9343Gw18G3ykXFyYya1UCa4kKr48AF4r
 Z3WFqan5Xan5JaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi-J55UUUUU=
X-Originating-IP: [144.123.156.254]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiXBYm7VXl5yt2OgABsw
Received-SPF: pass client-ip=220.181.12.215;
 envelope-from=qianfanguijin@163.com; helo=m12.mail.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: qianfan Zhao <qianfanguijin@163.com>

R40 has SAMP_DL_REG register and mmc2 controller has only 8K dma buffer.
Fix it's compatible string.

Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
---
 hw/arm/allwinner-r40.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/arm/allwinner-r40.c b/hw/arm/allwinner-r40.c
index d217e6c936..53eafb6b5b 100644
--- a/hw/arm/allwinner-r40.c
+++ b/hw/arm/allwinner-r40.c
@@ -264,10 +264,11 @@ static void allwinner_r40_init(Object *obj)
                               "clk1-freq");
 
     object_initialize_child(obj, "ccu", &s->ccu, TYPE_AW_R40_CCU);
-    object_initialize_child(obj, "mmc0", &s->mmc0, TYPE_AW_SDHOST_SUN5I);
-    object_initialize_child(obj, "mmc1", &s->mmc1, TYPE_AW_SDHOST_SUN5I);
-    object_initialize_child(obj, "mmc2", &s->mmc2, TYPE_AW_SDHOST_SUN5I);
-    object_initialize_child(obj, "mmc3", &s->mmc3, TYPE_AW_SDHOST_SUN5I);
+    object_initialize_child(obj, "mmc0", &s->mmc0, TYPE_AW_SDHOST_SUN50I_A64);
+    object_initialize_child(obj, "mmc1", &s->mmc1, TYPE_AW_SDHOST_SUN50I_A64);
+    object_initialize_child(obj, "mmc2", &s->mmc2,
+                            TYPE_AW_SDHOST_SUN50I_A64_EMMC);
+    object_initialize_child(obj, "mmc3", &s->mmc3, TYPE_AW_SDHOST_SUN50I_A64);
 
     object_initialize_child(obj, "twi0", &s->i2c0, TYPE_AW_I2C_SUN6I);
     object_initialize_child(obj, "twi1", &s->i2c1, TYPE_AW_I2C_SUN6I);
-- 
2.25.1


