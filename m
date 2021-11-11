Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD86D44D9FC
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 17:13:12 +0100 (CET)
Received: from localhost ([::1]:49580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlChL-0002U0-KW
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 11:13:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mlCUu-0004EB-Hx; Thu, 11 Nov 2021 11:00:20 -0500
Received: from mail142-38.mail.alibaba.com ([198.11.142.38]:63386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mlCUs-0000Zf-Gr; Thu, 11 Nov 2021 11:00:20 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.2471095|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_system_inform|0.0184311-7.11308e-05-0.981498;
 FP=3383185028153941434|2|2|6|0|-1|-1|-1; HT=ay29a033018047198;
 MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=7; RT=7; SR=0;
 TI=SMTPD_---.LrJTc4T_1636646409; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LrJTc4T_1636646409)
 by smtp.aliyun-inc.com(10.147.42.253);
 Fri, 12 Nov 2021 00:00:09 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v4 16/20] target/riscv: Ajdust vector atomic check with XLEN
Date: Thu, 11 Nov 2021 23:51:45 +0800
Message-Id: <20211111155149.58172-17-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
References: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=198.11.142.38; envelope-from=zhiwei_liu@c-sky.com;
 helo=mail142-38.mail.alibaba.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: palmer@dabbelt.com, richard.henderson@linaro.org, bin.meng@windriver.com,
 Alistair.Francis@wdc.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 6fa673f4b2..6cc83356d9 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -739,7 +739,8 @@ static bool amo_check(DisasContext *s, arg_rwdvm* a)
             (!a->wd || vext_check_overlap_mask(s, a->rd, a->vm, false)) &&
             vext_check_reg(s, a->rd, false) &&
             vext_check_reg(s, a->rs2, false) &&
-            ((1 << s->sew) <= sizeof(target_ulong)) &&
+            /* TODO: RV128 could allow 128-bit atomics */
+            ((1 << s->sew) <=  (get_xl(s) == MXL_RV32 ? 4 : 8)) &&
             ((1 << s->sew) >= 4));
 }
 
-- 
2.25.1


