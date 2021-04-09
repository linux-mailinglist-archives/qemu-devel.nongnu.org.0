Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C45753596C0
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 09:51:42 +0200 (CEST)
Received: from localhost ([::1]:34340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUlvU-00047C-2O
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 03:51:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lUltg-0002I8-1l; Fri, 09 Apr 2021 03:49:44 -0400
Received: from mail142-33.mail.alibaba.com ([198.11.142.33]:4122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lUlta-0003iE-Uq; Fri, 09 Apr 2021 03:49:43 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1349344|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_alarm|0.0245098-0.000202005-0.975288; FP=0|0|0|0|0|-1|-1|-1;
 HT=ay29a033018047192; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=6; RT=6; SR=0;
 TI=SMTPD_---.JxL3BOG_1617954563; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JxL3BOG_1617954563) by smtp.aliyun-inc.com(10.147.40.7);
 Fri, 09 Apr 2021 15:49:25 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC PATCH 06/11] target/riscv: Update CSR xtvec in CLIC mode
Date: Fri,  9 Apr 2021 15:48:52 +0800
Message-Id: <20210409074857.166082-7-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=198.11.142.33; envelope-from=zhiwei_liu@c-sky.com;
 helo=mail142-33.mail.alibaba.com
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

The new CLIC interrupt-handling mode is encoded as a new state in the
existing WARL xtvec register, where the low two bits of are 11.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/csr.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index f6c84b9fe4..39ff72041a 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -637,9 +637,18 @@ static int read_mtvec(CPURISCVState *env, int csrno, target_ulong *val)
 
 static int write_mtvec(CPURISCVState *env, int csrno, target_ulong val)
 {
-    /* bits [1:0] encode mode; 0 = direct, 1 = vectored, 2 >= reserved */
+    /*
+     * bits [1:0] encode mode; 0 = direct, 1 = vectored, 3 = CLIC,
+     * others reserved
+     */
     if ((val & 3) < 2) {
         env->mtvec = val;
+    } else if ((val & 1) && env->clic) {
+        /*
+         * If only CLIC mode is supported, writes to bit 1 are also ignored and
+         * it is always set to one. CLIC mode hardwires xtvec bits 2-5 to zero.
+         */
+        env->mtvec = ((val & ~0x3f) << 6) | (0b000011);
     } else {
         qemu_log_mask(LOG_UNIMP, "CSR_MTVEC: reserved mode not supported\n");
     }
@@ -837,9 +846,18 @@ static int read_stvec(CPURISCVState *env, int csrno, target_ulong *val)
 
 static int write_stvec(CPURISCVState *env, int csrno, target_ulong val)
 {
-    /* bits [1:0] encode mode; 0 = direct, 1 = vectored, 2 >= reserved */
+    /*
+     * bits [1:0] encode mode; 0 = direct, 1 = vectored, 3 = CLIC,
+     * others reserved
+     */
     if ((val & 3) < 2) {
         env->stvec = val;
+    } else if ((val & 1) && env->clic) {
+        /*
+         * If only CLIC mode is supported, writes to bit 1 are also ignored and
+         * it is always set to one. CLIC mode hardwires xtvec bits 2-5 to zero.
+         */
+        env->stvec = ((val & ~0x3f) << 6) | (0b000011);
     } else {
         qemu_log_mask(LOG_UNIMP, "CSR_STVEC: reserved mode not supported\n");
     }
-- 
2.25.1


