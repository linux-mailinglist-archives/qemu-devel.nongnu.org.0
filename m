Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C7112F392
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jan 2020 04:36:31 +0100 (CET)
Received: from localhost ([::1]:48302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1inDlG-0007NP-2C
	for lists+qemu-devel@lfdr.de; Thu, 02 Jan 2020 22:36:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43618)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1inDiz-0004zS-Jt
 for qemu-devel@nongnu.org; Thu, 02 Jan 2020 22:34:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1inDiy-00035r-D3
 for qemu-devel@nongnu.org; Thu, 02 Jan 2020 22:34:09 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:53544)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1inDiy-0002uB-3L
 for qemu-devel@nongnu.org; Thu, 02 Jan 2020 22:34:08 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1174554|-1; CH=green;
 DM=CONTINUE|CONTINUE|true|0.214826-0.02182-0.763354; DS=||;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01a16367; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=9; RT=9; SR=0; TI=SMTPD_---.GV9YvOJ_1578022440; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.GV9YvOJ_1578022440)
 by smtp.aliyun-inc.com(10.147.42.16); Fri, 03 Jan 2020 11:34:01 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: alistair23@gmail.com, richard.henderson@linaro.org,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Subject: [PATCH v3 1/4] RISC-V: add vector extension field in CPURISCVState
Date: Fri,  3 Jan 2020 11:33:44 +0800
Message-Id: <20200103033347.20909-2-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200103033347.20909-1-zhiwei_liu@c-sky.com>
References: <20200103033347.20909-1-zhiwei_liu@c-sky.com>
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
 target/riscv/cpu.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0adb307f32..af66674461 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -93,9 +93,23 @@ typedef struct CPURISCVState CPURISCVState;
 
 #include "pmp.h"
 
+#define RV_VLEN_MAX 4096
+
 struct CPURISCVState {
     target_ulong gpr[32];
     uint64_t fpr[32]; /* assume both F and D extensions */
+
+    /* vector coprocessor state.  */
+    struct {
+         uint64_t vreg[32 * RV_VLEN_MAX / 64];
+         target_ulong vxrm;
+         target_ulong vxsat;
+         target_ulong vl;
+         target_ulong vstart;
+         target_ulong vtype;
+    } vext;
+
+    bool         foflag;
     target_ulong pc;
     target_ulong load_res;
     target_ulong load_val;
-- 
2.23.0


