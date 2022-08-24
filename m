Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 401725A00BC
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 19:52:05 +0200 (CEST)
Received: from localhost ([::1]:34012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQuXr-0006NK-TG
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 13:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oQuFW-0002MU-CV
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:33:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oQuFT-0003tY-2b
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:33:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661362382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=91lBhp/q/NfB1o23r3E3RNd8+YHhtHfO7+KWzUVSZR0=;
 b=Dysc4ychuRSEsZP5G1SSdlG9Pz63syCvdt95WEcDcE/mkDQ+J2moYVnvs2BNAzjmgJkQ+1
 q2kf1SCztsShvuf03Zd/MUD0fpTzYum/FP7pG6ChWrvHlMiTEF0e+64/NFIJYhXh5nj8dv
 Pd6sWgx2ruJoKiDP+i9RkxSKXSk7maI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-KP-rFg4cOqGe8Cx5VIRnNA-1; Wed, 24 Aug 2022 13:32:59 -0400
X-MC-Unique: KP-rFg4cOqGe8Cx5VIRnNA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABEE91C19789;
 Wed, 24 Aug 2022 17:32:58 +0000 (UTC)
Received: from avogadro.redhat.com (unknown [10.39.192.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA5D5492C3B;
 Wed, 24 Aug 2022 17:32:57 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH 13/17] target/i386: add 80-87, 90-97 opcodes
Date: Wed, 24 Aug 2022 19:32:46 +0200
Message-Id: <20220824173250.232491-7-pbonzini@redhat.com>
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
 target/i386/tcg/decode-new.c.inc | 30 ++++++++++++++++++++++++++++++
 target/i386/tcg/emit.c.inc       | 27 +++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 6892000aaf..07a2aea540 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -476,6 +476,20 @@ static void decode_group_0x63(DisasContext *s, CPUX86State *env, X86OpEntry *ent
     }
 }
 
+static void decode_group_1(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    static X86GenFunc group1_gen[8] = {
+        gen_ADD, gen_OR, gen_ADC, gen_SBB, gen_AND, gen_SUB, gen_XOR, gen_SUB,
+    };
+    int op = (get_modrm(s, env) >> 3) & 7;
+    entry->gen = group1_gen[op];
+
+    if (op == 7) {
+        /* CMP */
+        entry->special = X86_SPECIAL_NoWriteback;
+    }
+}
+
 static X86OpEntry A2_00_F7[16][8] = {
     {
         X86_OP_ENTRY2(ADD, E,b, G,b),
@@ -558,8 +572,24 @@ static X86OpEntry A2_00_F7[16][8] = {
         X86_OP_ENTRYr(Jcc, J,b),
     },
     {
+        X86_OP_GROUP2(1, E,b, I,b),
+        X86_OP_GROUP2(1, E,v, I,z),
+        X86_OP_GROUP2(1, E,b, I,b, i64),
+        X86_OP_GROUP2(1, E,v, I,b),
+        X86_OP_ENTRY2(AND, E,b, G,b, nowb),
+        X86_OP_ENTRY2(AND, E,v, G,v, nowb),
+        X86_OP_ENTRY2(XCHG, E,b, G,b, xchg),
+        X86_OP_ENTRY2(XCHG, E,v, G,v, xchg),
     },
     {
+        X86_OP_ENTRY2(XCHG, 0,v, LoBits,v),
+        X86_OP_ENTRY2(XCHG, 0,v, LoBits,v),
+        X86_OP_ENTRY2(XCHG, 0,v, LoBits,v),
+        X86_OP_ENTRY2(XCHG, 0,v, LoBits,v),
+        X86_OP_ENTRY2(XCHG, 0,v, LoBits,v),
+        X86_OP_ENTRY2(XCHG, 0,v, LoBits,v),
+        X86_OP_ENTRY2(XCHG, 0,v, LoBits,v),
+        X86_OP_ENTRY2(XCHG, 0,v, LoBits,v),
     },
     {
     },
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index ae82ebd8c9..80f6541464 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -325,6 +325,7 @@ static void gen_MOV(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     /* nothing to do! */
 }
+#define gen_NOP gen_MOV
 
 static void gen_MOVSXD(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
@@ -391,6 +392,32 @@ static void gen_SUB(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     gen_alu_op(s, OP_SUBL, decode->op[0].ot);
 }
 
+static void gen_XCHG(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    if (decode->b == 0x90 && !REX_B(s)) {
+        if (s->prefix & PREFIX_REPZ) {
+            gen_update_cc_op(s);
+            gen_jmp_im(s, s->pc_start - s->cs_base);
+            gen_helper_pause(cpu_env, tcg_const_i32(s->pc - s->pc_start));
+            s->base.is_jmp = DISAS_NORETURN;
+        }
+        /* No writeback.  */
+        decode->op[0].alu_op_type = X86_ALU_SKIP;
+        return;
+    }
+
+    if (s->prefix & PREFIX_LOCK) {
+        tcg_gen_atomic_xchg_tl(s->T0, s->A0, s->T1,
+                               s->mem_index, decode->op[0].ot | MO_LE);
+        /* now store old value into register operand */
+        gen_op_mov_reg_v(s, decode->op[2].ot, decode->op[2].n, s->T0);
+    } else {
+        /* move destination value into source operand, source preserved in T1 */
+        gen_op_mov_reg_v(s, decode->op[2].ot, decode->op[2].n, s->T0);
+        tcg_gen_mov_tl(s->T0, s->T1);
+    }
+}
+
 static void gen_XOR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     /* special case XOR reg, reg */
-- 
2.37.1



