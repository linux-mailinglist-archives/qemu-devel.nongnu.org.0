Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAC830DCBD
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:29:09 +0100 (CET)
Received: from localhost ([::1]:58136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7J9Y-0001SX-R8
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:29:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l7J5Z-0005Do-9e; Wed, 03 Feb 2021 09:25:01 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:35175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l7J5W-000098-Vs; Wed, 03 Feb 2021 09:25:00 -0500
Received: by mail-ej1-x635.google.com with SMTP id a9so17676365ejr.2;
 Wed, 03 Feb 2021 06:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=shmuImXb78Qso4rl4jfZzpUvLVqAKTSdKCsX9HuBPTQ=;
 b=eg3w4UXdc5UjjQquH8ghBwf7hETyi5sFt80rI20LESMoNVejBzJ+bJDdJNmt4gdyl4
 AfFU/y2tz5n/JNljPYT3NO/zc4lsLpEdRnbTdv6aicTdRjeo1aqVUqddLWoPa+u5rUYX
 QIapcNVBWWJGlMltShD7mKyVkuyG5EEubY2K2/i5KiIZmN+QVU/8RPEyIGCN3VcXrNSv
 hT2rrZmNO7Djc3ISMJxWQguTxfvcN/KTQBf3OreEjz//vhTT4uLc+/wHgpj6dd06lvqM
 ObrTtM9ZRh25oGAhp8mkTk9/RUh5KLrjjERAal+DCh/2qaTL0Tvoklxt6XNqMbbX/eys
 W9EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=shmuImXb78Qso4rl4jfZzpUvLVqAKTSdKCsX9HuBPTQ=;
 b=aLQzAyScadCaXL0FqY+Ynz2NEXZOh4aUk1uNimVsCU3jDRLRh7qfCTA5aFcUKGUYy9
 tL7oRwTDUrp0jYel39la4z5RFo45NUYTAorQUqITdvwr13PxMuxtWTGh5ufL8I7w8O5s
 7oii3oti2eFz2Hhc+5dlsIdj6K1zQB5blcMydvVdQkb0oAvV172K1IsVX4u4AM1I2IJJ
 RX0anqz4ZJ7U5Zoe+QePW+ZFFBK+WPjDO0JtpNw3iWP8deunxg2A9p8Tuzyb0ejzMk2f
 JXx1Z8WS7bnLhxsnhf3ekpBLeyiHxXF0/D9CRUjwjZOu2xcx6Z7SRHMvQQK37SzyHhCb
 v8QA==
X-Gm-Message-State: AOAM533AbMOji5SGTGLhofewFWUT3zFTBpMW07QfnPPZOFkDujf7+KkD
 DKcdjAIyDwkn84KGo0baz6bU9wKN86M=
X-Google-Smtp-Source: ABdhPJzPp0lK3Ay5Bfg+aXmEfh7PQfy/XEKXnY6aj9i5/UIuANHfDuBnBcelVWuim7jhbfW3d/NHuQ==
X-Received: by 2002:a17:906:17d7:: with SMTP id
 u23mr748980eje.390.1612362297125; 
 Wed, 03 Feb 2021 06:24:57 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id p12sm982638edr.82.2021.02.03.06.24.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Feb 2021 06:24:56 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 1/2] hw/ppc: e500: Use a macro for the platform clock
 frequency
Date: Wed,  3 Feb 2021 22:24:47 +0800
Message-Id: <1612362288-22216-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

At present the platform clock frequency is using a magic number.
Convert it to a macro and use it everywhere.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

---

Changes in v2:
- Rename the macro per Philippe's comments

 hw/ppc/e500.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index c64b5d0..c795276 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -74,6 +74,8 @@
 #define MPC8544_I2C_IRQ            43
 #define RTC_REGS_OFFSET            0x68
 
+#define PLATFORM_CLK_FREQ_HZ       (400 * 1000 * 1000)
+
 struct boot_info
 {
     uint32_t dt_base;
@@ -320,8 +322,8 @@ static int ppce500_load_device_tree(PPCE500MachineState *pms,
     int fdt_size;
     void *fdt;
     uint8_t hypercall[16];
-    uint32_t clock_freq = 400000000;
-    uint32_t tb_freq = 400000000;
+    uint32_t clock_freq = PLATFORM_CLK_FREQ_HZ;
+    uint32_t tb_freq = PLATFORM_CLK_FREQ_HZ;
     int i;
     char compatible_sb[] = "fsl,mpc8544-immr\0simple-bus";
     char *soc;
@@ -890,7 +892,7 @@ void ppce500_init(MachineState *machine)
         env->spr_cb[SPR_BOOKE_PIR].default_value = cs->cpu_index = i;
         env->mpic_iack = pmc->ccsrbar_base + MPC8544_MPIC_REGS_OFFSET + 0xa0;
 
-        ppc_booke_timers_init(cpu, 400000000, PPC_TIMER_E500);
+        ppc_booke_timers_init(cpu, PLATFORM_CLK_FREQ_HZ, PPC_TIMER_E500);
 
         /* Register reset handler */
         if (!i) {
-- 
2.7.4


