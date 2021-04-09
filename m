Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B73433596E7
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 09:55:36 +0200 (CEST)
Received: from localhost ([::1]:48740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUlzL-0001a8-QX
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 03:55:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lUltf-0002HV-OT; Fri, 09 Apr 2021 03:49:43 -0400
Received: from mail142-4.mail.alibaba.com ([198.11.142.4]:49183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lUlta-0003iv-Tc; Fri, 09 Apr 2021 03:49:43 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1592422|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_alarm|0.0955296-0.0052361-0.899234; FP=0|0|0|0|0|-1|-1|-1;
 HT=ay29a033018047188; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=6; RT=6; SR=0;
 TI=SMTPD_---.JxL3BOG_1617954563; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JxL3BOG_1617954563) by smtp.aliyun-inc.com(10.147.40.7);
 Fri, 09 Apr 2021 15:49:26 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC PATCH 09/11] target/riscv: Update CSR mclicbase in CLIC mode
Date: Fri,  9 Apr 2021 15:48:55 +0800
Message-Id: <20210409074857.166082-10-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=198.11.142.4; envelope-from=zhiwei_liu@c-sky.com;
 helo=mail142-4.mail.alibaba.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>, wxy194768@alibaba-inc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The machine mode mclicbase CSR is an XLEN-bit read-only register providing
the base address of CLIC memory mapped registers.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 hw/intc/riscv_clic.c | 1 +
 target/riscv/cpu.h   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/intc/riscv_clic.c b/hw/intc/riscv_clic.c
index 8ad534c506..e902dd4062 100644
--- a/hw/intc/riscv_clic.c
+++ b/hw/intc/riscv_clic.c
@@ -715,6 +715,7 @@ static void riscv_clic_realize(DeviceState *dev, Error **errp)
                                          &cpu->env, 1);
         qdev_connect_gpio_out(dev, i, irq);
         cpu->env.clic = clic;
+        cpu->env.mclicbase = clic->mclicbase;
     }
 }
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index b5fd796f98..b0b8565649 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -162,6 +162,7 @@ struct CPURISCVState {
     uint32_t miclaim;
     uint32_t mintstatus; /* clic-spec */
     target_ulong mintthresh; /* clic-spec */
+    target_ulong mclicbase; /* clic-spec */
 
     target_ulong mie;
     target_ulong mideleg;
-- 
2.25.1


