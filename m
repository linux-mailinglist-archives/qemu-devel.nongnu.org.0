Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A07C4FD4A
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Jun 2019 19:20:53 +0200 (CEST)
Received: from localhost ([::1]:45872 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hf6Ae-0003bc-AO
	for lists+qemu-devel@lfdr.de; Sun, 23 Jun 2019 13:20:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34336)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hf5wk-0001o9-QW
 for qemu-devel@nongnu.org; Sun, 23 Jun 2019 13:06:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hf5wg-0004rI-N1
 for qemu-devel@nongnu.org; Sun, 23 Jun 2019 13:06:28 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:41134 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hf5wa-0004Jr-3e
 for qemu-devel@nongnu.org; Sun, 23 Jun 2019 13:06:22 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id C125A1A1D85;
 Sun, 23 Jun 2019 19:05:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 923B11A1DDD;
 Sun, 23 Jun 2019 19:05:45 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Sun, 23 Jun 2019 19:04:46 +0200
Message-Id: <1561309489-16146-14-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561309489-16146-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1561309489-16146-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v5 13/16] tcg/ppc: Support vector dup2
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
Cc: richard.henderson@linaro.org,
 "David Gibson --cc=amarkovic @ wavecomp . com"
 <david@gibson.dropbear.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, hsp.cat7@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

This is only used for 32-bit hosts.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 tcg/ppc/tcg-target.inc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tcg/ppc/tcg-target.inc.c b/tcg/ppc/tcg-target.inc.c
index 3005c51..61732c1 100644
--- a/tcg/ppc/tcg-target.inc.c
+++ b/tcg/ppc/tcg-target.inc.c
@@ -3104,6 +3104,14 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
+    case INDEX_op_dup2_vec:
+        assert(TCG_TARGET_REG_BITS == 32);
+        /* With inputs a1 = xLxx, a2 = xHxx  */
+        tcg_out32(s, VMRGHW | VRT(a0) | VRA(a2) | VRB(a1));  /* a0  = xxHL */
+        tcg_out_vsldoi(s, TCG_VEC_TMP1, a0, a0, 8);          /* tmp = HLxx */
+        tcg_out_vsldoi(s, a0, a0, TCG_VEC_TMP1, 8);          /* a0  = HLHL */
+        return;
+
     case INDEX_op_ppc_mrgh_vec:
         insn = mrgh_op[vece];
         break;
@@ -3482,6 +3490,7 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_ppc_mulou_vec:
     case INDEX_op_ppc_pkum_vec:
     case INDEX_op_ppc_rotl_vec:
+    case INDEX_op_dup2_vec:
         return &v_v_v;
     case INDEX_op_not_vec:
     case INDEX_op_dup_vec:
-- 
2.7.4


