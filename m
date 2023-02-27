Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 432AD6A40C4
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:38:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWbpK-0006aC-Qd; Mon, 27 Feb 2023 06:37:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWboN-0005om-By
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:36:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWboK-0005hP-1p
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:36:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677497811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SQOCt1RfrkF8ZuQwBidv5O8bg+nY9l69L3zjdrRmg5Q=;
 b=iw4c462J4Whf5UevtRx3rRaNAJnqIhhB49YrKWo1ijeoJZZpAsr0MzVSzDiBVrwYoyhraV
 LtUrDhcF7iWPFtQM/edmtMLtsFPRaVCpFN6lqaZUHiI4ic4SWLfbfpacRd7ySo9vT6SsT4
 sdZwI4g179oh7O4W9oMwhk1DV38htqg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-84-wKbpgTr7PNWouSFLnYZeyw-1; Mon, 27 Feb 2023 06:36:46 -0500
X-MC-Unique: wKbpgTr7PNWouSFLnYZeyw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88FF485CBE0;
 Mon, 27 Feb 2023 11:36:46 +0000 (UTC)
Received: from thuth.com (unknown [10.45.227.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 852021121314;
 Mon, 27 Feb 2023 11:36:45 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 19/33] target/s390x: Use tcg_constant_* for DisasCompare
Date: Mon, 27 Feb 2023 12:36:07 +0100
Message-Id: <20230227113621.58468-20-thuth@redhat.com>
In-Reply-To: <20230227113621.58468-1-thuth@redhat.com>
References: <20230227113621.58468-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

The a and b fields are not modified by the consumer,
and while we need not free a constant, tcg will quietly
ignore such frees, so free_compare need not be changed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20230220184052.163465-3-richard.henderson@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/tcg/translate.c | 44 ++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 35e844ef3c..a534419073 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -845,7 +845,7 @@ static void disas_jcc(DisasContext *s, DisasCompare *c, uint32_t mask)
         c->is_64 = false;
         c->u.s32.a = tcg_temp_new_i32();
         tcg_gen_extrl_i64_i32(c->u.s32.a, cc_dst);
-        c->u.s32.b = tcg_const_i32(0);
+        c->u.s32.b = tcg_constant_i32(0);
         break;
     case CC_OP_LTGT_32:
     case CC_OP_LTUGTU_32:
@@ -860,7 +860,7 @@ static void disas_jcc(DisasContext *s, DisasCompare *c, uint32_t mask)
     case CC_OP_NZ:
     case CC_OP_FLOGR:
         c->u.s64.a = cc_dst;
-        c->u.s64.b = tcg_const_i64(0);
+        c->u.s64.b = tcg_constant_i64(0);
         c->g1 = true;
         break;
     case CC_OP_LTGT_64:
@@ -874,14 +874,14 @@ static void disas_jcc(DisasContext *s, DisasCompare *c, uint32_t mask)
     case CC_OP_TM_64:
     case CC_OP_ICM:
         c->u.s64.a = tcg_temp_new_i64();
-        c->u.s64.b = tcg_const_i64(0);
+        c->u.s64.b = tcg_constant_i64(0);
         tcg_gen_and_i64(c->u.s64.a, cc_src, cc_dst);
         break;
 
     case CC_OP_ADDU:
     case CC_OP_SUBU:
         c->is_64 = true;
-        c->u.s64.b = tcg_const_i64(0);
+        c->u.s64.b = tcg_constant_i64(0);
         c->g1 = true;
         switch (mask) {
         case 8 | 2:
@@ -904,65 +904,65 @@ static void disas_jcc(DisasContext *s, DisasCompare *c, uint32_t mask)
         switch (mask) {
         case 0x8 | 0x4 | 0x2: /* cc != 3 */
             cond = TCG_COND_NE;
-            c->u.s32.b = tcg_const_i32(3);
+            c->u.s32.b = tcg_constant_i32(3);
             break;
         case 0x8 | 0x4 | 0x1: /* cc != 2 */
             cond = TCG_COND_NE;
-            c->u.s32.b = tcg_const_i32(2);
+            c->u.s32.b = tcg_constant_i32(2);
             break;
         case 0x8 | 0x2 | 0x1: /* cc != 1 */
             cond = TCG_COND_NE;
-            c->u.s32.b = tcg_const_i32(1);
+            c->u.s32.b = tcg_constant_i32(1);
             break;
         case 0x8 | 0x2: /* cc == 0 || cc == 2 => (cc & 1) == 0 */
             cond = TCG_COND_EQ;
             c->g1 = false;
             c->u.s32.a = tcg_temp_new_i32();
-            c->u.s32.b = tcg_const_i32(0);
+            c->u.s32.b = tcg_constant_i32(0);
             tcg_gen_andi_i32(c->u.s32.a, cc_op, 1);
             break;
         case 0x8 | 0x4: /* cc < 2 */
             cond = TCG_COND_LTU;
-            c->u.s32.b = tcg_const_i32(2);
+            c->u.s32.b = tcg_constant_i32(2);
             break;
         case 0x8: /* cc == 0 */
             cond = TCG_COND_EQ;
-            c->u.s32.b = tcg_const_i32(0);
+            c->u.s32.b = tcg_constant_i32(0);
             break;
         case 0x4 | 0x2 | 0x1: /* cc != 0 */
             cond = TCG_COND_NE;
-            c->u.s32.b = tcg_const_i32(0);
+            c->u.s32.b = tcg_constant_i32(0);
             break;
         case 0x4 | 0x1: /* cc == 1 || cc == 3 => (cc & 1) != 0 */
             cond = TCG_COND_NE;
             c->g1 = false;
             c->u.s32.a = tcg_temp_new_i32();
-            c->u.s32.b = tcg_const_i32(0);
+            c->u.s32.b = tcg_constant_i32(0);
             tcg_gen_andi_i32(c->u.s32.a, cc_op, 1);
             break;
         case 0x4: /* cc == 1 */
             cond = TCG_COND_EQ;
-            c->u.s32.b = tcg_const_i32(1);
+            c->u.s32.b = tcg_constant_i32(1);
             break;
         case 0x2 | 0x1: /* cc > 1 */
             cond = TCG_COND_GTU;
-            c->u.s32.b = tcg_const_i32(1);
+            c->u.s32.b = tcg_constant_i32(1);
             break;
         case 0x2: /* cc == 2 */
             cond = TCG_COND_EQ;
-            c->u.s32.b = tcg_const_i32(2);
+            c->u.s32.b = tcg_constant_i32(2);
             break;
         case 0x1: /* cc == 3 */
             cond = TCG_COND_EQ;
-            c->u.s32.b = tcg_const_i32(3);
+            c->u.s32.b = tcg_constant_i32(3);
             break;
         default:
             /* CC is masked by something else: (8 >> cc) & mask.  */
             cond = TCG_COND_NE;
             c->g1 = false;
-            c->u.s32.a = tcg_const_i32(8);
-            c->u.s32.b = tcg_const_i32(0);
-            tcg_gen_shr_i32(c->u.s32.a, c->u.s32.a, cc_op);
+            c->u.s32.a = tcg_temp_new_i32();
+            c->u.s32.b = tcg_constant_i32(0);
+            tcg_gen_shr_i32(c->u.s32.a, tcg_constant_i32(8), cc_op);
             tcg_gen_andi_i32(c->u.s32.a, c->u.s32.a, mask);
             break;
         }
@@ -1619,7 +1619,7 @@ static DisasJumpType op_bct32(DisasContext *s, DisasOps *o)
     tcg_gen_subi_i64(t, regs[r1], 1);
     store_reg32_i64(r1, t);
     c.u.s32.a = tcg_temp_new_i32();
-    c.u.s32.b = tcg_const_i32(0);
+    c.u.s32.b = tcg_constant_i32(0);
     tcg_gen_extrl_i64_i32(c.u.s32.a, t);
     tcg_temp_free_i64(t);
 
@@ -1643,7 +1643,7 @@ static DisasJumpType op_bcth(DisasContext *s, DisasOps *o)
     tcg_gen_subi_i64(t, t, 1);
     store_reg32h_i64(r1, t);
     c.u.s32.a = tcg_temp_new_i32();
-    c.u.s32.b = tcg_const_i32(0);
+    c.u.s32.b = tcg_constant_i32(0);
     tcg_gen_extrl_i64_i32(c.u.s32.a, t);
     tcg_temp_free_i64(t);
 
@@ -1664,7 +1664,7 @@ static DisasJumpType op_bct64(DisasContext *s, DisasOps *o)
 
     tcg_gen_subi_i64(regs[r1], regs[r1], 1);
     c.u.s64.a = regs[r1];
-    c.u.s64.b = tcg_const_i64(0);
+    c.u.s64.b = tcg_constant_i64(0);
 
     return help_branch(s, &c, is_imm, imm, o->in2);
 }
-- 
2.31.1


