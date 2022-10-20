Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A89E2605ECC
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 13:25:54 +0200 (CEST)
Received: from localhost ([::1]:56476 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olTgO-0001bG-RL
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 07:25:53 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olTcz-0000HJ-IH
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 07:22:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1olT1W-0001YU-FR; Thu, 20 Oct 2022 06:43:41 -0400
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130]:60600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1olT1U-0003wH-VM; Thu, 20 Oct 2022 06:43:38 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R951e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046060;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VSeuKBT_1666262610; 
Received: from
 roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VSeuKBT_1666262610) by smtp.aliyun-inc.com;
 Thu, 20 Oct 2022 18:43:31 +0800
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, lzw194868@alibaba-inc.com,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [RFC PATCH 3/3] tcg/riscv: Remove a wrong optimization for addsub2
Date: Thu, 20 Oct 2022 18:41:54 +0800
Message-Id: <20221020104154.4276-4-zhiwei_liu@linux.alibaba.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020104154.4276-1-zhiwei_liu@linux.alibaba.com>
References: <20221020104154.4276-1-zhiwei_liu@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.130;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-130.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's not clear what it is doing here. And it's wrong because bl and
al are both register, so we can't add them by an ADDI instruction.

Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 tcg/riscv/tcg-target.c.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index bfdf2bea69..a07fd0864f 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -705,9 +705,6 @@ static void tcg_out_addsub2(TCGContext *s,
                 tcg_out_opc_reg(s, OPC_SLTU, TCG_REG_TMP0,
                                 rl, al);
             }
-        } else if (rl == al && rl == bl) {
-            tcg_out_opc_imm(s, OPC_SLTI, TCG_REG_TMP0, al, 0);
-            tcg_out_opc_reg(s, opc_addi, rl, al, bl);
         } else {
             tcg_out_opc_reg(s, opc_add, rl, al, bl);
             tcg_out_opc_reg(s, OPC_SLTU, TCG_REG_TMP0,
-- 
2.25.1


