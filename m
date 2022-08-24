Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 847BF5A00D8
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 19:57:58 +0200 (CEST)
Received: from localhost ([::1]:55646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQudZ-0000h4-Ej
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 13:57:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oQuFT-0002ML-1r
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:33:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oQuFQ-0003t2-Gj
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:33:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661362379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TBKFQRSDVcArCnGYM0RCSRwgAWnqmGoCBmZE0lrFzQk=;
 b=iiZgeW7Ei/T4JQ3T7nw+ssnoqzFjPjvnoTlEzQqWLY3HzegXiJU7+f8L8RDy2jVeHE89cE
 Zx+nnkolgl6aIV0NxXJZzrhTyMqD22u9r4Z97mP2kw4WS+oxqg51khnAjAqWk1ebsnberF
 oOWkTQO0jugYmNSTgnuMYBcAY6kAF5c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-IdYyopYkPa-27NmRUceOkQ-1; Wed, 24 Aug 2022 13:32:58 -0400
X-MC-Unique: IdYyopYkPa-27NmRUceOkQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81AC4803C80;
 Wed, 24 Aug 2022 17:32:56 +0000 (UTC)
Received: from avogadro.redhat.com (unknown [10.39.192.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C28F7492C3B;
 Wed, 24 Aug 2022 17:32:55 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH 11/17] target/i386: add 60-67, 70-77 opcodes
Date: Wed, 24 Aug 2022 19:32:44 +0200
Message-Id: <20220824173250.232491-5-pbonzini@redhat.com>
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
 target/i386/tcg/decode-new.c.inc | 30 +++++++++++++
 target/i386/tcg/emit.c.inc       | 77 ++++++++++++++++++++++++++++++++
 2 files changed, 107 insertions(+)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 586894e4ee..161a3b1554 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -462,6 +462,20 @@ static void decode_twobyte(DisasContext *s, CPUX86State *env, X86OpEntry *entry,
     }
 }
 
+static void decode_group_0x63(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    static X86OpEntry arpl = X86_OP_ENTRY2(ARPL, E,w, G,w, .special = X86_SPECIAL_ProtMode);
+    static X86OpEntry mov = X86_OP_ENTRY3(MOV, G,v, E,v, None, None);
+    static X86OpEntry movsxd = X86_OP_ENTRY3(MOVSXD, G,v, E,d, None, None);
+    if (!CODE64(s)) {
+        *entry = arpl;
+    } else if (REX_W(s)) {
+        *entry = movsxd;
+    } else {
+        *entry = mov;
+    }
+}
+
 static X86OpEntry A2_00_F7[16][8] = {
     {
         X86_OP_ENTRY2(ADD, E,b, G,b),
@@ -524,8 +538,24 @@ static X86OpEntry A2_00_F7[16][8] = {
         X86_OP_ENTRYr(PUSH, LoBits,d64),
     },
     {
+        X86_OP_ENTRY0(PUSHA, i64),
+        X86_OP_ENTRY0(POPA, i64),
+        X86_OP_ENTRY2(BOUND, G,v, M,a, i64),
+        X86_OP_GROUP0(0x63),
+        {},
+        {},
+        {},
+        {},
     },
     {
+        X86_OP_ENTRYr(Jcc, J,b),
+        X86_OP_ENTRYr(Jcc, J,b),
+        X86_OP_ENTRYr(Jcc, J,b),
+        X86_OP_ENTRYr(Jcc, J,b),
+        X86_OP_ENTRYr(Jcc, J,b),
+        X86_OP_ENTRYr(Jcc, J,b),
+        X86_OP_ENTRYr(Jcc, J,b),
+        X86_OP_ENTRYr(Jcc, J,b),
     },
     {
     },
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index a76d6820e1..cf606e74c7 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -177,6 +177,56 @@ static void gen_AND(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     gen_alu_op(s, OP_ANDL, decode->op[0].ot);
 }
 
+static void gen_ARPL(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    TCGLabel *label1;
+    TCGv t0 = tcg_temp_local_new();
+    TCGv t1 = tcg_temp_local_new();
+    TCGv a0;
+
+    if (decode->op[0].alu_op_type == X86_ALU_MEM) {
+        a0 = tcg_temp_local_new();
+        tcg_gen_mov_tl(a0, s->A0);
+        decode->op[0].v = a0;
+    } else {
+        a0 = NULL;
+    }
+
+    gen_compute_eflags(s);
+    tcg_gen_andi_tl(cpu_cc_src, cpu_cc_src, ~CC_Z);
+
+    tcg_gen_mov_tl(t0, s->T0);
+    tcg_gen_andi_tl(s->T0, s->T0, 3);
+    tcg_gen_andi_tl(t1, s->T1, 3);
+    label1 = gen_new_label();
+    tcg_gen_brcond_tl(TCG_COND_GE, s->T0, t1, label1);
+    tcg_gen_andi_tl(t0, t0, ~3);
+    tcg_gen_or_tl(t0, t0, t1);
+    tcg_gen_ori_tl(cpu_cc_src, cpu_cc_src, CC_Z);
+    gen_set_label(label1);
+
+    /* Do writeback here due to temp locals.  */
+    decode->op[0].alu_op_type = X86_ALU_SKIP;
+    if (a0) {
+        gen_op_st_v(s, MO_16, t0, a0);
+        tcg_temp_free(a0);
+    } else {
+        gen_op_mov_reg_v(s, MO_16, decode->op[0].n, t0);
+    }
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+}
+
+static void gen_BOUND(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
+    if (decode->op[1].ot == MO_16) {
+        gen_helper_boundw(cpu_env, s->A0, s->tmp2_i32);
+    } else {
+        gen_helper_boundl(cpu_env, s->A0, s->tmp2_i32);
+    }
+}
+
 static void gen_DAA(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     gen_update_cc_op(s);
@@ -201,6 +251,23 @@ static void gen_INC(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     gen_alu_op(s, OP_INCL, decode->op[0].ot);
 }
 
+static void gen_Jcc(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    target_ulong next_eip = s->pc - s->cs_base;
+    gen_bnd_jmp(s);
+    gen_jcc(s, decode->b & 0xf, decode->immediate, next_eip);
+}
+
+static void gen_MOV(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    /* nothing to do! */
+}
+
+static void gen_MOVSXD(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    tcg_gen_ext32s_tl(s->T0, s->T0);
+}
+
 static void gen_OR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     gen_alu_op(s, OP_ORL, decode->op[0].ot);
@@ -211,6 +278,11 @@ static void gen_PUSH(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     gen_push_v(s, decode->op[2].v);
 }
 
+static void gen_PUSHA(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+   gen_pusha(s);
+}
+
 static void gen_POP(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     MemOp ot = gen_pop_T0(s);
@@ -218,6 +290,11 @@ static void gen_POP(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     gen_pop_update(s, ot);
 }
 
+static void gen_POPA(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+   gen_popa(s);
+}
+
 static void gen_SBB(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     gen_alu_op(s, OP_SBBL, decode->op[0].ot);
-- 
2.37.1



