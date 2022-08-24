Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A85E5A00C1
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 19:53:24 +0200 (CEST)
Received: from localhost ([::1]:52094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQuZ9-0000rD-6c
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 13:53:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oQuFU-0002MN-1P
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:33:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oQuFR-0003t8-Jf
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:33:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661362380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5pDyarpE9L5NOEV/LKgy5wFkf1pfVmE7pKthjoV7Dfw=;
 b=SFvoLd/f7H5zvdmTV2SRNzp2FCSxIvbOt4SADGr8m4+PFbT2PYsfE34Nzwb87nYMtLcL/c
 UL4AJ9EeAIC2BR3STdt10+W4dnBHK0LIM/YOKt7uQnn8LIDd22hu2JX/Dq1BM5x71Enyma
 LAYpeFlpk3GAiH++QZZdoM3UDhRHqjA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-cu9ZvwmIPBGf8efmb0f2Cw-1; Wed, 24 Aug 2022 13:32:58 -0400
X-MC-Unique: cu9ZvwmIPBGf8efmb0f2Cw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79D5C8B5903;
 Wed, 24 Aug 2022 17:32:54 +0000 (UTC)
Received: from avogadro.redhat.com (unknown [10.39.192.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BBEB4492CA5;
 Wed, 24 Aug 2022 17:32:53 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH 09/17] target/i386: add 40-47, 50-57 opcodes
Date: Wed, 24 Aug 2022 19:32:42 +0200
Message-Id: <20220824173250.232491-3-pbonzini@redhat.com>
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc | 16 ++++++++++++++++
 target/i386/tcg/emit.c.inc       | 30 +++++++++++++++++++++++++++++-
 target/i386/tcg/translate.c      |  2 ++
 3 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index c94cd7ac61..bbd6ef07a1 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -504,8 +504,24 @@ static X86OpEntry A2_00_F7[16][8] = {
         X86_OP_ENTRY0(AAA, i64),
     },
     {
+        X86_OP_ENTRY1(INC, 0,v, i64),
+        X86_OP_ENTRY1(INC, 1,v, i64),
+        X86_OP_ENTRY1(INC, 2,v, i64),
+        X86_OP_ENTRY1(INC, 3,v, i64),
+        X86_OP_ENTRY1(INC, 4,v, i64),
+        X86_OP_ENTRY1(INC, 5,v, i64),
+        X86_OP_ENTRY1(INC, 6,v, i64),
+        X86_OP_ENTRY1(INC, 7,v, i64),
     },
     {
+        X86_OP_ENTRYr(PUSH, LoBits,d64),
+        X86_OP_ENTRYr(PUSH, LoBits,d64),
+        X86_OP_ENTRYr(PUSH, LoBits,d64),
+        X86_OP_ENTRYr(PUSH, LoBits,d64),
+        X86_OP_ENTRYr(PUSH, LoBits,d64),
+        X86_OP_ENTRYr(PUSH, LoBits,d64),
+        X86_OP_ENTRYr(PUSH, LoBits,d64),
+        X86_OP_ENTRYr(PUSH, LoBits,d64),
     },
     {
     },
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index e247b542ed..d3d0f893fb 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -91,7 +91,30 @@ static void gen_alu_op(DisasContext *s1, int op, MemOp ot)
         gen_op_update2_cc(s1);
         set_cc_op(s1, CC_OP_SUBB + ot);
         break;
-    default:
+    case OP_DECL:
+        tcg_gen_movi_tl(s1->T1, -1);
+        if (s1->prefix & PREFIX_LOCK) {
+            tcg_gen_atomic_add_fetch_tl(s1->T0, s1->A0, s1->T1,
+                                        s1->mem_index, ot | MO_LE);
+        } else {
+            tcg_gen_add_tl(s1->T0, s1->T0, s1->T1);
+        }
+        gen_compute_eflags_c(s1, cpu_cc_src);
+        tcg_gen_mov_tl(cpu_cc_dst, s1->T0);
+        set_cc_op(s1, CC_OP_DECB + ot);
+        break;
+    case OP_INCL:
+        tcg_gen_movi_tl(s1->T1, 1);
+        if (s1->prefix & PREFIX_LOCK) {
+            tcg_gen_atomic_add_fetch_tl(s1->T0, s1->A0, s1->T1,
+                                        s1->mem_index, ot | MO_LE);
+        } else {
+            tcg_gen_add_tl(s1->T0, s1->T0, s1->T1);
+        }
+        gen_compute_eflags_c(s1, cpu_cc_src);
+        tcg_gen_mov_tl(cpu_cc_dst, s1->T0);
+        set_cc_op(s1, CC_OP_INCB + ot);
+        break;
     case OP_ANDL:
         if (s1->prefix & PREFIX_LOCK) {
             tcg_gen_atomic_and_fetch_tl(s1->T0, s1->A0, s1->T1,
@@ -168,6 +191,11 @@ static void gen_DAS(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     set_cc_op(s, CC_OP_EFLAGS);
 }
 
+static void gen_INC(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_alu_op(s, OP_INCL, decode->op[0].ot);
+}
+
 static void gen_OR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     gen_alu_op(s, OP_ORL, decode->op[0].ot);
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 9b925c7ec8..d0a8c0becb 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -223,6 +223,8 @@ enum {
     OP_SUBL,
     OP_XORL,
     OP_CMPL,
+    OP_INCL,
+    OP_DECL,
 };
 
 /* i386 shift ops */
-- 
2.37.1



