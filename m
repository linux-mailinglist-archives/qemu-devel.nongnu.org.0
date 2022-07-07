Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D40D569D25
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 10:17:08 +0200 (CEST)
Received: from localhost ([::1]:51164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Mh8-0000hw-W4
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 04:17:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o9MM0-0003Zn-JN
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 03:55:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o9MLy-0007kr-BX
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 03:55:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657180512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HPhhUw3G9VdD1hQpSr4Rthp2MHmD0SVEjQNXW/ak51k=;
 b=XBWUyWBCZuym2eHi0sTziV2TAbL4c1466XybXMaOzlOT7TUhRr7BYhySAH67juC3jg5BPP
 oYNtMHD7nTxzn5u29xZ1Y6cNB0K2V32z+PYxS4hrxpE/NlUKAJTYvI0v8oKOmCcyQJO/L3
 djit9z4Zz2iPViFsATG3xvOlv+Jppp0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-f_3ROYwJN_i95Psm4KTUcg-1; Thu, 07 Jul 2022 03:54:57 -0400
X-MC-Unique: f_3ROYwJN_i95Psm4KTUcg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 31EC08339C4;
 Thu,  7 Jul 2022 07:54:57 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62BC6404754C;
 Thu,  7 Jul 2022 07:54:56 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-s390x@nongnu.org
Subject: [PULL 17/18] target/s390x: Remove DISAS_PC_STALE_NOCHAIN
Date: Thu,  7 Jul 2022 09:54:25 +0200
Message-Id: <20220707075426.1163210-18-thuth@redhat.com>
In-Reply-To: <20220707075426.1163210-1-thuth@redhat.com>
References: <20220707075426.1163210-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

Replace this with a flag: exit_to_mainloop.
We can now control the exit for each of DISAS_TOO_MANY,
DISAS_PC_UPDATED, and DISAS_PC_CC_UPDATED, and fold in
the check for PER.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220702060228.420454-4-richard.henderson@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/tcg/translate.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index a3422c0eb0..eac59c3dd1 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -149,6 +149,7 @@ struct DisasContext {
     uint64_t pc_tmp;
     uint32_t ilen;
     enum cc_op cc_op;
+    bool exit_to_mainloop;
 };
 
 /* Information carried about a condition to be evaluated.  */
@@ -1126,9 +1127,6 @@ typedef struct {
 /* We have updated the PC and CC values.  */
 #define DISAS_PC_CC_UPDATED     DISAS_TARGET_2
 
-/* We are exiting the TB to the main loop.  */
-#define DISAS_PC_STALE_NOCHAIN  DISAS_TARGET_4
-
 
 /* Instruction flags */
 #define IF_AFP1     0x0001      /* r1 is a fp reg for HFP/FPS instructions */
@@ -3022,7 +3020,8 @@ static DisasJumpType op_lctl(DisasContext *s, DisasOps *o)
     tcg_temp_free_i32(r1);
     tcg_temp_free_i32(r3);
     /* Exit to main loop to reevaluate s390_cpu_exec_interrupt.  */
-    return DISAS_PC_STALE_NOCHAIN;
+    s->exit_to_mainloop = true;
+    return DISAS_TOO_MANY;
 }
 
 static DisasJumpType op_lctlg(DisasContext *s, DisasOps *o)
@@ -3033,7 +3032,8 @@ static DisasJumpType op_lctlg(DisasContext *s, DisasOps *o)
     tcg_temp_free_i32(r1);
     tcg_temp_free_i32(r3);
     /* Exit to main loop to reevaluate s390_cpu_exec_interrupt.  */
-    return DISAS_PC_STALE_NOCHAIN;
+    s->exit_to_mainloop = true;
+    return DISAS_TOO_MANY;
 }
 
 static DisasJumpType op_lra(DisasContext *s, DisasOps *o)
@@ -4283,7 +4283,8 @@ static DisasJumpType op_ssm(DisasContext *s, DisasOps *o)
 {
     tcg_gen_deposit_i64(psw_mask, psw_mask, o->in2, 56, 8);
     /* Exit to main loop to reevaluate s390_cpu_exec_interrupt.  */
-    return DISAS_PC_STALE_NOCHAIN;
+    s->exit_to_mainloop = true;
+    return DISAS_TOO_MANY;
 }
 
 static DisasJumpType op_stap(DisasContext *s, DisasOps *o)
@@ -4548,7 +4549,8 @@ static DisasJumpType op_stnosm(DisasContext *s, DisasOps *o)
     }
 
     /* Exit to main loop to reevaluate s390_cpu_exec_interrupt.  */
-    return DISAS_PC_STALE_NOCHAIN;
+    s->exit_to_mainloop = true;
+    return DISAS_TOO_MANY;
 }
 
 static DisasJumpType op_stura(DisasContext *s, DisasOps *o)
@@ -6591,6 +6593,7 @@ static void s390x_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 
     dc->cc_op = CC_OP_DYNAMIC;
     dc->ex_value = dc->base.tb->cs_base;
+    dc->exit_to_mainloop = (dc->base.tb->flags & FLAG_MASK_PER);
 }
 
 static void s390x_tr_tb_start(DisasContextBase *db, CPUState *cs)
@@ -6630,7 +6633,6 @@ static void s390x_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     case DISAS_NORETURN:
         break;
     case DISAS_TOO_MANY:
-    case DISAS_PC_STALE_NOCHAIN:
         update_psw_addr(dc);
         /* FALLTHRU */
     case DISAS_PC_UPDATED:
@@ -6640,8 +6642,7 @@ static void s390x_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
         /* FALLTHRU */
     case DISAS_PC_CC_UPDATED:
         /* Exit the TB, either by raising a debug exception or by return.  */
-        if ((dc->base.tb->flags & FLAG_MASK_PER) ||
-             dc->base.is_jmp == DISAS_PC_STALE_NOCHAIN) {
+        if (dc->exit_to_mainloop) {
             tcg_gen_exit_tb(NULL, 0);
         } else {
             tcg_gen_lookup_and_goto_ptr();
-- 
2.31.1


