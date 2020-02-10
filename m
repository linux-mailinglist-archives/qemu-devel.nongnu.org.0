Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2F21570A6
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Feb 2020 09:15:16 +0100 (CET)
Received: from localhost ([::1]:58146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j14Dr-0006MQ-CA
	for lists+qemu-devel@lfdr.de; Mon, 10 Feb 2020 03:15:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36572)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1j14Bh-0003o5-9m
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 03:13:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1j14Bf-0008FA-VP
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 03:13:00 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:35109)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1j14Bf-0008BZ-GH; Mon, 10 Feb 2020 03:12:59 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1258004|-1; CH=green;
 DM=CONTINUE|CONTINUE|true|0.163513-0.02035-0.816137;
 DS=CONTINUE|ham_system_inform|0.0341501-0.000480858-0.965369;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03306; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=9; RT=9; SR=0; TI=SMTPD_---.GmO5bfp_1581322371; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.GmO5bfp_1581322371)
 by smtp.aliyun-inc.com(10.147.40.44); Mon, 10 Feb 2020 16:12:52 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: richard.henderson@linaro.org, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Subject: [PATCH v4 1/4] target/riscv: add vector extension field in
 CPURISCVState
Date: Mon, 10 Feb 2020 16:12:37 +0800
Message-Id: <20200210081240.11481-2-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200210081240.11481-1-zhiwei_liu@c-sky.com>
References: <20200210081240.11481-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 121.197.200.217
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
Cc: wenmeng_zhang@c-sky.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 wxy194768@alibaba-inc.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 32 vector registers will be viewed as a continuous memory block.
It avoids the convension between element index and (regno,offset).
Thus elements can be directly accessed by offset from the first vector
base address.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/cpu.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index de0a8d893a..07e63016a7 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -93,9 +93,22 @@ typedef struct CPURISCVState CPURISCVState;
 
 #include "pmp.h"
 
+#define RV_VLEN_MAX 512
+
 struct CPURISCVState {
     target_ulong gpr[32];
     uint64_t fpr[32]; /* assume both F and D extensions */
+
+    /* vector coprocessor state. */
+    struct {
+         uint64_t vreg[32 * RV_VLEN_MAX / 64] QEMU_ALIGNED(16);
+         target_ulong vxrm;
+         target_ulong vxsat;
+         target_ulong vl;
+         target_ulong vstart;
+         target_ulong vtype;
+    } vext;
+
     target_ulong pc;
     target_ulong load_res;
     target_ulong load_val;
-- 
2.23.0


