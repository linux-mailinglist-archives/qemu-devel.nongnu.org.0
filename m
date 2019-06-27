Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEFF58167
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jun 2019 13:24:28 +0200 (CEST)
Received: from localhost ([::1]:48796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgSVw-00016Q-3U
	for lists+qemu-devel@lfdr.de; Thu, 27 Jun 2019 07:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55836)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefan.brankovic@rt-rk.com>) id 1hgS5x-0001yn-F8
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 06:58:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefan.brankovic@rt-rk.com>) id 1hgS5v-0001he-L4
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 06:57:37 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:36511 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefan.brankovic@rt-rk.com>)
 id 1hgS5v-0001g5-9f
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 06:57:35 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 5617C1A457F;
 Thu, 27 Jun 2019 12:56:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw870-lin.domain.local (rtrkw870-lin.domain.local
 [10.10.13.132])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 212881A45A7;
 Thu, 27 Jun 2019 12:56:30 +0200 (CEST)
From: Stefan Brankovic <stefan.brankovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu, 27 Jun 2019 12:56:24 +0200
Message-Id: <1561632985-24866-13-git-send-email-stefan.brankovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561632985-24866-1-git-send-email-stefan.brankovic@rt-rk.com>
References: <1561632985-24866-1-git-send-email-stefan.brankovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v4 12/13] tcg/i386: Implement vector vmrgl
 instructions
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
Cc: stefan.brankovic@rt-rk.com, hsp.cat7@gmail.com,
 richard.henderson@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Stefan Brankovic <stefan.brankovic@rt-rk.com>
---
 tcg/i386/tcg-target.h     |  2 +-
 tcg/i386/tcg-target.inc.c | 10 ++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index e825324..d20d08f 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -193,7 +193,7 @@ extern bool have_avx2;
 #define TCG_TARGET_HAS_bitsel_vec       0
 #define TCG_TARGET_HAS_cmpsel_vec       -1
 #define TCG_TARGET_HAS_vmrgh_vec        1
-#define TCG_TARGET_HAS_vmrgl_vec        0
+#define TCG_TARGET_HAS_vmrgl_vec        1
 
 #define TCG_TARGET_deposit_i32_valid(ofs, len) \
     (((ofs) == 0 && (len) == 8) || ((ofs) == 8 && (len) == 8) || \
diff --git a/tcg/i386/tcg-target.inc.c b/tcg/i386/tcg-target.inc.c
index 31e1b2b..dc3cd65 100644
--- a/tcg/i386/tcg-target.inc.c
+++ b/tcg/i386/tcg-target.inc.c
@@ -2826,6 +2826,9 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_vmrgh_vec:
         insn = punpckh_insn[vece];
         goto gen_simd;
+    case INDEX_op_vmrgl_vec:
+        insn = punpckl_insn[vece];
+        goto gen_simd;
     case INDEX_op_shlv_vec:
         insn = shlv_insn[vece];
         goto gen_simd;
@@ -3227,6 +3230,7 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_smax_vec:
     case INDEX_op_umax_vec:
     case INDEX_op_vmrgh_vec:
+    case INDEX_op_vmrgl_vec:
     case INDEX_op_shlv_vec:
     case INDEX_op_shrv_vec:
     case INDEX_op_sarv_vec:
@@ -3327,6 +3331,8 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
         return vece <= MO_32;
     case INDEX_op_vmrgh_vec:
         return vece <= MO_32 ? -1 : 0;
+    case INDEX_op_vmrgl_vec:
+        return vece <= MO_32 ? -1 : 0;
 
     default:
         return 0;
@@ -3671,6 +3677,10 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
         v2 = temp_tcgv_vec(arg_temp(a2));
         expand_vec_vmrg(opc, type, vece, v0, v1, v2);
         break;
+    case INDEX_op_vmrgl_vec:
+        v2 = temp_tcgv_vec(arg_temp(a2));
+        expand_vec_vmrg(opc, type, vece, v0, v1, v2);
+        break;
 
     default:
         break;
-- 
2.7.4


