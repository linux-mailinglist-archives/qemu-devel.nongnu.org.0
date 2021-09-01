Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 005543FD9DA
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 14:53:36 +0200 (CEST)
Received: from localhost ([::1]:54508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLPkG-0008QG-1C
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 08:53:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mLPcr-0004Ai-8h; Wed, 01 Sep 2021 08:45:57 -0400
Received: from out28-122.mail.aliyun.com ([115.124.28.122]:44809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mLPco-0003gb-8d; Wed, 01 Sep 2021 08:45:56 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1790514|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.00791373-0.000113233-0.991973;
 FP=3163042928241708099|1|1|1|0|-1|-1|-1; HT=ay29a033018047208;
 MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=7; RT=7; SR=0;
 TI=SMTPD_---.LE5U2Ui_1630500343; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LE5U2Ui_1630500343)
 by smtp.aliyun-inc.com(10.147.41.121);
 Wed, 01 Sep 2021 20:45:43 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH] target/riscv: Fix satp write
Date: Wed,  1 Sep 2021 20:45:39 +0800
Message-Id: <20210901124539.222868-1-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.122; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-122.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: palmer@dabbelt.com, richard.henderson@linaro.org, bin.meng@windriver.com,
 Alistair.Francis@wdc.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These variables should be target_ulong. If truncated to int,
the bool conditions they indicate will be wrong.

As satp is very important for Linux, this bug almost fails every boot.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 50a2c3a3b4..ba9818f6a5 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -986,7 +986,7 @@ static RISCVException read_satp(CPURISCVState *env, int csrno,
 static RISCVException write_satp(CPURISCVState *env, int csrno,
                                  target_ulong val)
 {
-    int vm, mask, asid;
+    target_ulong vm, mask, asid;
 
     if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
         return RISCV_EXCP_NONE;
-- 
2.25.1


