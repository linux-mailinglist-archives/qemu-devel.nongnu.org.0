Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBE0315F74
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 07:27:43 +0100 (CET)
Received: from localhost ([::1]:33582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9iyU-0003kQ-78
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 01:27:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ipA-0001l3-AX; Wed, 10 Feb 2021 01:18:04 -0500
Received: from ozlabs.org ([203.11.71.1]:52825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ip8-0000Qs-H6; Wed, 10 Feb 2021 01:18:04 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Db8gp3Pcgz9sWP; Wed, 10 Feb 2021 17:17:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612937862;
 bh=YfNqpoUnUSQa9/sDt7KSWQ3U9HQOK7taymc4K1iA2qw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=blLTf1DqiQoGRGiYBdB0g0RWnK16qtm1AfGDyQo6dU7Y3KeBCTlrfZTFjSpRk9OmZ
 dVcAcSrPsyZQyelfknT711TGU02geaGeQ5jgHAVC0vvBgC6IfKd0+dAx5mroPH/8cH
 7lCfiHmcQWexBFiVeKffH2Qiavwv+fP4S0f64AIU=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 16/19] hw/ppc: e500: Use a macro for the platform clock
 frequency
Date: Wed, 10 Feb 2021 17:17:32 +1100
Message-Id: <20210210061735.304384-17-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210061735.304384-1-david@gibson.dropbear.id.au>
References: <20210210061735.304384-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

At present the platform clock frequency is using a magic number.
Convert it to a macro and use it everywhere.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Message-Id: <1612362288-22216-1-git-send-email-bmeng.cn@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/e500.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index c64b5d08bd..c795276668 100644
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
2.29.2


