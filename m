Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A386CB644
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 07:49:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph2B3-0000s9-5P; Tue, 28 Mar 2023 01:47:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qianfanguijin@163.com>)
 id 1ph2Az-0000q1-HR; Tue, 28 Mar 2023 01:47:21 -0400
Received: from m12.mail.163.com ([220.181.12.215])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qianfanguijin@163.com>)
 id 1ph2Au-0005EJ-Mu; Tue, 28 Mar 2023 01:47:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=RZqrS
 0MySb7hfDNDfluEf8stiDvM6NAYwG3ktCor9jY=; b=e83d3PEozxQE22t7Oxm7m
 7HH7JunVrA07EWFpdRIEgW56Mwu87iGgtM4gwkRscYDpCYDusq4AdDFx1S5uImoa
 /LBdkKm/c0WWBqz+jYQjGh8GMASAvO5uy7q25cVFbLm72XondS3jDn8eU4jy5Cn7
 gfFfDmuUpodhXQD1bZ84iw=
Received: from DESKTOP-B1R4FVG.localdomain (unknown [112.224.194.92])
 by zwqz-smtp-mta-g4-4 (Coremail) with SMTP id
 _____wBHtBBOfyJkWfxRAg--.23168S10; 
 Tue, 28 Mar 2023 13:47:05 +0800 (CST)
From: qianfanguijin@163.com
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 qianfan Zhao <qianfanguijin@163.com>
Subject: [PATCH v2 08/12] hw: arm: allwinner-r40: Fix the mmc controller's type
Date: Tue, 28 Mar 2023 13:46:48 +0800
Message-Id: <20230328054654.18620-9-qianfanguijin@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230328054654.18620-1-qianfanguijin@163.com>
References: <20230328054654.18620-1-qianfanguijin@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBHtBBOfyJkWfxRAg--.23168S10
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF4rCFW8JF45CF1rWF45Wrg_yoW3Awc_ua
 1IqFy8Z34F9Fy7Aw1kAa1aqr48Zw1rGrn2k397ZF1UJr40k398Gr1DCr97ur18Gr12krW3
 K398Crs8A34UujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRES_MPUUUUU==
X-Originating-IP: [112.224.194.92]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/xtbBzhtA7WI0Xxx2twAAss
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
 hw/arm/allwinner-r40.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/allwinner-r40.c b/hw/arm/allwinner-r40.c
index 0e4542d35f..b148c56449 100644
--- a/hw/arm/allwinner-r40.c
+++ b/hw/arm/allwinner-r40.c
@@ -271,7 +271,7 @@ static void allwinner_r40_init(Object *obj)
 
     for (int i = 0; i < AW_R40_NUM_MMCS; i++) {
         object_initialize_child(obj, mmc_names[i], &s->mmc[i],
-                                TYPE_AW_SDHOST_SUN5I);
+                                TYPE_AW_SDHOST_SUN50I_A64);
     }
 
     object_initialize_child(obj, "twi0", &s->i2c0, TYPE_AW_I2C_SUN6I);
-- 
2.25.1


