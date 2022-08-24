Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1354E5A00D4
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 19:56:40 +0200 (CEST)
Received: from localhost ([::1]:45232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQucJ-0006eR-4J
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 13:56:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oQuFW-0002MZ-Di
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:33:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oQuFU-0003tt-9Y
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:33:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661362383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BKEZ0xmV30LNOg8IqGUlYuGtCnK4wDtvZFoarMt2Rd0=;
 b=d68/BiBQo/1sO8vS7Ddcct6vxcabVKAOIKzhQtmP9Pv0C8ZYIQyVZorxqMEt/Iyrz8sB14
 88xwFt8unlIXq2B4JjKnWM70I5QO+fFMU6H+Yy24QplANbtBYYWB/7VW/29BHwr/hhKcmg
 5MY/FfoHiMTcYT0Qfb7aGsh6z1Mp6AU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-lwqfwKcSOdiGyESivDjyDw-1; Wed, 24 Aug 2022 13:33:02 -0400
X-MC-Unique: lwqfwKcSOdiGyESivDjyDw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1ACC811E76;
 Wed, 24 Aug 2022 17:33:00 +0000 (UTC)
Received: from avogadro.redhat.com (unknown [10.39.192.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0081B492C3B;
 Wed, 24 Aug 2022 17:32:59 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH 15/17] target/i386: do not clobber A0 in POP translation
Date: Wed, 24 Aug 2022 19:32:48 +0200
Message-Id: <20220824173250.232491-9-pbonzini@redhat.com>
In-Reply-To: <20220824173123.232018-1-pbonzini@redhat.com>
References: <20220824173123.232018-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The new decoder likes to compute the address in A0 very early, so the
gen_lea_v_seg in gen_pop_T0 would clobber the address of the memory
operand.  Instead use T0 since it is already available and will be
overwritten immediately after.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 34 ++++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index d0a8c0becb..5c3742a9c7 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -508,17 +508,17 @@ static inline void gen_jmp_im(DisasContext *s, target_ulong pc)
     gen_op_jmp_v(s->tmp0);
 }
 
-/* Compute SEG:REG into A0.  SEG is selected from the override segment
+/* Compute SEG:REG into DEST.  SEG is selected from the override segment
    (OVR_SEG) and the default segment (DEF_SEG).  OVR_SEG may be -1 to
    indicate no override.  */
-static void gen_lea_v_seg(DisasContext *s, MemOp aflag, TCGv a0,
-                          int def_seg, int ovr_seg)
+static void gen_lea_v_seg_dest(DisasContext *s, MemOp aflag, TCGv dest, TCGv a0,
+                               int def_seg, int ovr_seg)
 {
     switch (aflag) {
 #ifdef TARGET_X86_64
     case MO_64:
         if (ovr_seg < 0) {
-            tcg_gen_mov_tl(s->A0, a0);
+            tcg_gen_mov_tl(dest, a0);
             return;
         }
         break;
@@ -529,14 +529,14 @@ static void gen_lea_v_seg(DisasContext *s, MemOp aflag, TCGv a0,
             ovr_seg = def_seg;
         }
         if (ovr_seg < 0) {
-            tcg_gen_ext32u_tl(s->A0, a0);
+            tcg_gen_ext32u_tl(dest, a0);
             return;
         }
         break;
     case MO_16:
         /* 16 bit address */
-        tcg_gen_ext16u_tl(s->A0, a0);
-        a0 = s->A0;
+        tcg_gen_ext16u_tl(dest, a0);
+        a0 = dest;
         if (ovr_seg < 0) {
             if (ADDSEG(s)) {
                 ovr_seg = def_seg;
@@ -553,17 +553,23 @@ static void gen_lea_v_seg(DisasContext *s, MemOp aflag, TCGv a0,
         TCGv seg = cpu_seg_base[ovr_seg];
 
         if (aflag == MO_64) {
-            tcg_gen_add_tl(s->A0, a0, seg);
+            tcg_gen_add_tl(dest, a0, seg);
         } else if (CODE64(s)) {
-            tcg_gen_ext32u_tl(s->A0, a0);
-            tcg_gen_add_tl(s->A0, s->A0, seg);
+            tcg_gen_ext32u_tl(dest, a0);
+            tcg_gen_add_tl(dest, dest, seg);
         } else {
-            tcg_gen_add_tl(s->A0, a0, seg);
-            tcg_gen_ext32u_tl(s->A0, s->A0);
+            tcg_gen_add_tl(dest, a0, seg);
+            tcg_gen_ext32u_tl(dest, dest);
         }
     }
 }
 
+static void gen_lea_v_seg(DisasContext *s, MemOp aflag, TCGv a0,
+                          int def_seg, int ovr_seg)
+{
+    gen_lea_v_seg_dest(s, aflag, s->A0, a0, def_seg, ovr_seg);
+}
+
 static inline void gen_string_movl_A0_ESI(DisasContext *s)
 {
     gen_lea_v_seg(s, s->aflag, cpu_regs[R_ESI], R_DS, s->override);
@@ -2506,8 +2512,8 @@ static MemOp gen_pop_T0(DisasContext *s)
 {
     MemOp d_ot = mo_pushpop(s, s->dflag);
 
-    gen_lea_v_seg(s, mo_stacksize(s), cpu_regs[R_ESP], R_SS, -1);
-    gen_op_ld_v(s, d_ot, s->T0, s->A0);
+    gen_lea_v_seg_dest(s, mo_stacksize(s), s->T0, cpu_regs[R_ESP], R_SS, -1);
+    gen_op_ld_v(s, d_ot, s->T0, s->T0);
 
     return d_ot;
 }
-- 
2.37.1



