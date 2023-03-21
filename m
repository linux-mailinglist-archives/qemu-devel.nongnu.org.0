Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D401B6C2EC4
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 11:26:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peZBU-0000Ry-76; Tue, 21 Mar 2023 06:25:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qianfanguijin@163.com>)
 id 1peZBP-0000PJ-KQ; Tue, 21 Mar 2023 06:25:35 -0400
Received: from m12.mail.163.com ([220.181.12.217])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qianfanguijin@163.com>)
 id 1peZBK-0008NN-Gy; Tue, 21 Mar 2023 06:25:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=/Gjgv
 B2u38AR4LL+srk2PmM/5h7DpyWr51tDaPP8FT0=; b=Z/Bh/p+UeRsk3T6sc8MZE
 sGjxZ9jWm9JWoRZdWrqZyMtkG+yDeTYOPTe8bZnjCXBJoJbbzzd4fpREukNO18uD
 i1FUEDVVfSu1xLgFAKM8454inLKJ7jTIyBa0rAU0AAGq2W+D5jIj95nTzdhePwAu
 KiRDMjK+6N77G3ahYAEMMk=
Received: from DESKTOP-B1R4FVG.localdomain (unknown [218.201.129.19])
 by zwqz-smtp-mta-g5-1 (Coremail) with SMTP id
 _____wBnznIHhhlk7VIWAA--.11160S10; 
 Tue, 21 Mar 2023 18:25:15 +0800 (CST)
From: qianfanguijin@163.com
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 qianfan Zhao <qianfanguijin@163.com>
Subject: [PATCH v1 08/11] hw: arm: allwinner-r40: Fix the mmc controller's type
Date: Tue, 21 Mar 2023 18:25:07 +0800
Message-Id: <20230321102510.16754-9-qianfanguijin@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230321102510.16754-1-qianfanguijin@163.com>
References: <20230321102510.16754-1-qianfanguijin@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBnznIHhhlk7VIWAA--.11160S10
X-Coremail-Antispam: 1Uf129KBjvJXoW7ur1DJr47CF17JryUtFy7Jrb_yoW8Xr4kp3
 Wxua9xGr9Yg3yfAa1DK3Z7Xry8Gryv9w1UCr1F9343Gw18G3ykXFyYya1UCa4kKr48AF4r
 Z3WSqan5Xan5JaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEOJ5wUUUUU=
X-Originating-IP: [218.201.129.19]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiXA057VXl5--QGQAAsk
Received-SPF: pass client-ip=220.181.12.217;
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
index f1f6803cf7..191ce8b93c 100644
--- a/hw/arm/allwinner-r40.c
+++ b/hw/arm/allwinner-r40.c
@@ -265,10 +265,11 @@ static void allwinner_r40_init(Object *obj)
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


