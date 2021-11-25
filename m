Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A99B345D5EF
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 09:05:45 +0100 (CET)
Received: from localhost ([::1]:59736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mq9lI-0006BV-Lv
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 03:05:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mq9Qg-0003iD-5V; Thu, 25 Nov 2021 02:44:30 -0500
Received: from out28-221.mail.aliyun.com ([115.124.28.221]:56231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mq9Qd-00023Z-5a; Thu, 25 Nov 2021 02:44:25 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.2472512|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0241832-0.00194606-0.973871;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047198; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=8; RT=7; SR=0; TI=SMTPD_---.LyzDZ7O_1637826251; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LyzDZ7O_1637826251)
 by smtp.aliyun-inc.com(10.147.41.158);
 Thu, 25 Nov 2021 15:44:12 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v5 08/22] target/riscv: Relax debug check for pm write
Date: Thu, 25 Nov 2021 15:39:37 +0800
Message-Id: <20211125073951.57678-9-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125073951.57678-1-zhiwei_liu@c-sky.com>
References: <20211125073951.57678-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.221; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-221.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>, bin.meng@windriver.com,
 richard.henderson@linaro.org, palmer@dabbelt.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d4ee897be2..bfafd3bd96 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1465,6 +1465,9 @@ static bool check_pm_current_disabled(CPURISCVState *env, int csrno)
     int csr_priv = get_field(csrno, 0x300);
     int pm_current;
 
+    if (env->debugger) {
+        return false;
+    }
     /*
      * If priv lvls differ that means we're accessing csr from higher priv lvl,
      * so allow the access
-- 
2.25.1


