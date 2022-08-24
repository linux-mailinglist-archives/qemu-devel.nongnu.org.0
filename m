Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 128D55A0113
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 20:07:03 +0200 (CEST)
Received: from localhost ([::1]:37556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQumL-00028N-W4
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 14:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oQuFW-0002MY-Dn
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:33:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oQuFU-0003tz-6N
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:33:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661362383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zEqGdtMFivfNjk8JxqyFaSqokqP8GVG0zK8mv628Nsk=;
 b=XkuRrUWh9xfZQWuoyhSo0NPuZrqYZ6AYzFqSbUYzzgvJjK9xX6xkp8w6TUbqq9soQ7nvdc
 0hTXbUZKJBFbZhbbplJQUxozgoW1O7RB2wVHHqh/p68IHQmQd40Sd5OUrPr6COiuQdIWiF
 oZv/oEl+RhG1/M4U8n9PlWMDdgBWlY0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-442-5aCBhhi-Nlar8UmjgdHlsA-1; Wed, 24 Aug 2022 13:33:02 -0400
X-MC-Unique: 5aCBhhi-Nlar8UmjgdHlsA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA6ED18A6524;
 Wed, 24 Aug 2022 17:33:01 +0000 (UTC)
Received: from avogadro.redhat.com (unknown [10.39.192.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 01794492C3B;
 Wed, 24 Aug 2022 17:33:00 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH 16/17] target/i386: add 88-8f, 98-9f opcodes
Date: Wed, 24 Aug 2022 19:32:49 +0200
Message-Id: <20220824173250.232491-10-pbonzini@redhat.com>
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
 target/i386/tcg/decode-new.c.inc |  41 ++++++++
 target/i386/tcg/decode-old.c.inc |  19 +---
 target/i386/tcg/emit.c.inc       | 166 ++++++++++++++++++++++++++++++-
 target/i386/tcg/translate.c      |  17 ++++
 4 files changed, 227 insertions(+), 16 deletions(-)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 3d96ac3adb..1e607b68fa 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -97,6 +97,9 @@ typedef enum X86OpSpecial {
     /* Writeback not needed or done manually in the callback */
     X86_SPECIAL_NoWriteback,
 
+    /* Do not apply segment base to effective address */
+    X86_SPECIAL_NoSeg,
+
     /* Illegal or exclusive to 64-bit mode */
     X86_SPECIAL_i64,
     X86_SPECIAL_o64,
@@ -194,8 +197,12 @@ struct X86DecodedInsn {
 #define i64 .special = X86_SPECIAL_i64,
 #define o64 .special = X86_SPECIAL_o64,
 #define nowb .special = X86_SPECIAL_NoWriteback,
+#define noseg .special = X86_SPECIAL_NoSeg,
 #define xchg .special = X86_SPECIAL_Locked,
 
+static X86OpEntry illegal_opcode =
+    X86_OP_ENTRY0(illegal);
+
 static uint8_t get_modrm(DisasContext *s, CPUX86State *env)
 {
     if (!s->has_modrm) {
@@ -490,6 +497,18 @@ static void decode_group_1(DisasContext *s, CPUX86State *env, X86OpEntry *entry,
     }
 }
 
+static void decode_group_1A(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    int op = (get_modrm(s, env) >> 3) & 7;
+    if (op != 0) {
+        *entry = illegal_opcode;
+    } else {
+        entry->gen = gen_POP;
+        /* The address must use the value of ESP after the pop.  */
+        s->popl_esp_hack = 1 << mo_pushpop(s, s->dflag);
+    }
+}
+
 static X86OpEntry A2_00_F7[16][8] = {
     {
         X86_OP_ENTRY2(ADD, E,b, G,b),
@@ -703,8 +722,24 @@ static X86OpEntry A2_08_FF[16][8] = {
         X86_OP_ENTRYr(Jcc, J,b),
     },
     {
+        X86_OP_ENTRY3(MOV, E,b, G,b, None, None),
+        X86_OP_ENTRY3(MOV, E,v, G,v, None, None),
+        X86_OP_ENTRY3(MOV, G,b, E,b, None, None),
+        X86_OP_ENTRY3(MOV, G,v, E,v, None, None),
+        X86_OP_ENTRY3(MOV, E,v, S,w, None, None),
+        X86_OP_ENTRY3(LEA, G,v, M,v, None, None, noseg),
+        X86_OP_ENTRY3(MOV, S,w, E,v, None, None),
+        X86_OP_GROUPw(1A, E,v)
     },
     {
+        X86_OP_ENTRY1(CBW, 0,v), /* rAX */
+        X86_OP_ENTRY3(CWD, 2,v, 0,v, None, None), /* rDX, rAX */
+        X86_OP_ENTRYr(CALLF, A,p, i64),
+        X86_OP_ENTRY0(WAIT),
+        X86_OP_ENTRY0(PUSHF),
+        X86_OP_ENTRY0(POPF),
+        X86_OP_ENTRY0(SAHF),
+        X86_OP_ENTRY0(LAHF),
     },
     {
     },
@@ -982,6 +1017,7 @@ static target_ulong disas_insn_new(DisasContext *s, CPUState *cpu, int b)
 #if 0
     s->pc_start = s->pc = s->base.pc_next;
     s->override = -1;
+    s->popl_esp_hack = 0;
 #ifdef TARGET_X86_64
     s->rex_w = false;
     s->rex_r = 0;
@@ -1170,6 +1206,11 @@ static target_ulong disas_insn_new(DisasContext *s, CPUState *cpu, int b)
     case X86_SPECIAL_NoWriteback:
         decode.op[0].alu_op_type = X86_ALU_SKIP;
         break;
+
+    case X86_SPECIAL_NoSeg:
+        decode.mem.def_seg = -1;
+        s->override = -1;
+        break;
     }
 
     if (decode.op[0].has_ea || decode.op[1].has_ea || decode.op[2].has_ea) {
diff --git a/target/i386/tcg/decode-old.c.inc b/target/i386/tcg/decode-old.c.inc
index 7763bef11d..69ce70d141 100644
--- a/target/i386/tcg/decode-old.c.inc
+++ b/target/i386/tcg/decode-old.c.inc
@@ -1792,6 +1792,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 
     s->pc_start = s->pc = pc_start;
     s->override = -1;
+    s->popl_esp_hack = 0;
 #ifdef TARGET_X86_64
     s->rex_w = false;
     s->rex_r = 0;
@@ -2380,20 +2381,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             gen_op_ld_v(s, ot, s->T1, s->A0);
             gen_add_A0_im(s, 1 << ot);
             gen_op_ld_v(s, MO_16, s->T0, s->A0);
-        do_lcall:
-            if (PE(s) && !VM86(s)) {
-                tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
-                gen_helper_lcall_protected(cpu_env, s->tmp2_i32, s->T1,
-                                           tcg_const_i32(dflag - 1),
-                                           tcg_const_tl(s->pc - s->cs_base));
-            } else {
-                tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
-                gen_helper_lcall_real(cpu_env, s->tmp2_i32, s->T1,
-                                      tcg_const_i32(dflag - 1),
-                                      tcg_const_i32(s->pc - s->cs_base));
-            }
-            tcg_gen_ld_tl(s->tmp4, cpu_env, offsetof(CPUX86State, eip));
-            gen_jr(s, s->tmp4);
+            gen_far_call(s);
             break;
         case 4: /* jmp Ev */
             if (dflag == MO_16) {
@@ -3964,7 +3952,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             tcg_gen_movi_tl(s->T0, selector);
             tcg_gen_movi_tl(s->T1, offset);
         }
-        goto do_lcall;
+        gen_far_call(s);
+        break;
     case 0xe9: /* jmp im */
         if (dflag != MO_16) {
             tval = (int32_t)insn_get(env, s, MO_32);
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 9395474302..22f2fbde79 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -227,6 +227,42 @@ static void gen_BOUND(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     }
 }
 
+static void gen_CALLF(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    MemOp ot = decode->op[1].ot;
+    unsigned int selector, offset;
+
+    if (CODE64(s)) {
+        gen_illegal_opcode(s);
+        return;
+    }
+
+    offset = insn_get(env, s, ot);
+    selector = insn_get(env, s, MO_16);
+    tcg_gen_movi_tl(s->T0, selector);
+    tcg_gen_movi_tl(s->T1, offset);
+    return gen_far_call(s);
+}
+
+static void gen_CBW(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    switch(decode->op[0].ot) {
+#ifdef TARGET_X86_64
+        case MO_64:
+            tcg_gen_ext32s_tl(s->T0, s->T0);
+            break;
+#endif
+        case MO_32:
+            tcg_gen_ext16s_tl(s->T0, s->T0);
+            break;
+        case MO_16:
+            tcg_gen_ext8s_tl(s->T0, s->T0);
+            break;
+        default:
+            tcg_abort();
+    }
+}
+
 static void gen_CMPS(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     MemOp ot = decode->op[0].ot;
@@ -239,6 +275,24 @@ static void gen_CMPS(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     }
 }
 
+static void gen_CWD(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int shift = 8 << decode->op[0].ot;
+    switch (shift) {
+    case 64:
+        break;
+    case 32:
+        tcg_gen_ext32s_tl(s->T0, s->T0);
+        break;
+    case 16:
+        tcg_gen_ext16s_tl(s->T0, s->T0);
+        break;
+    default:
+        tcg_abort();
+    }
+    tcg_gen_sari_tl(s->T0, s->T0, shift - 1);
+}
+
 static void gen_DAA(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     gen_update_cc_op(s);
@@ -333,6 +387,22 @@ static void gen_Jcc(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     gen_jcc(s, decode->b & 0xf, decode->immediate, next_eip);
 }
 
+static void gen_LAHF(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    if (CODE64(s) && !(s->cpuid_ext3_features & CPUID_EXT3_LAHF_LM)) {
+        return gen_illegal_opcode(s);
+    }
+    gen_compute_eflags(s);
+    /* Note: gen_compute_eflags() only gives the condition codes */
+    tcg_gen_ori_tl(s->T0, cpu_cc_src, 0x02);
+    gen_op_mov_reg_v(s, MO_8, R_AH, s->T0);
+}
+
+static void gen_LEA(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    tcg_gen_mov_tl(s->T0, s->A0);
+}
+
 static void gen_MOV(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     /* nothing to do! */
@@ -392,10 +462,25 @@ static void gen_PUSHA(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
    gen_pusha(s);
 }
 
+static void gen_PUSHF(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_svm_check_intercept(s, SVM_EXIT_PUSHF);
+    if (check_vm86_iopl(s)) {
+        gen_update_cc_op(s);
+        gen_helper_read_eflags(s->T0, cpu_env);
+        gen_push_v(s, s->T0);
+    }
+}
+
 static void gen_POP(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     MemOp ot = gen_pop_T0(s);
-    /* NOTE: order is important for pop %sp */
+    if (decode->op[0].alu_op_type == X86_ALU_MEM) {
+        /* NOTE: order is important for MMU exceptions */
+        gen_op_st_v(s, ot, s->T0, s->A0);
+        decode->op[0].alu_op_type = X86_ALU_SKIP;
+    }
+    /* NOTE: writing back registers after update is important for pop %sp */
     gen_pop_update(s, ot);
 }
 
@@ -404,6 +489,76 @@ static void gen_POPA(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
    gen_popa(s);
 }
 
+static void gen_POPF(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_svm_check_intercept(s, SVM_EXIT_POPF);
+    if (check_vm86_iopl(s)) {
+        MemOp ot = gen_pop_T0(s);
+        if (CPL(s) == 0) {
+            if (s->dflag != MO_16) {
+                gen_helper_write_eflags(cpu_env, s->T0,
+                                        tcg_const_i32((TF_MASK | AC_MASK |
+                                                       ID_MASK | NT_MASK |
+                                                       IF_MASK |
+                                                       IOPL_MASK)));
+            } else {
+                gen_helper_write_eflags(cpu_env, s->T0,
+                                        tcg_const_i32((TF_MASK | AC_MASK |
+                                                       ID_MASK | NT_MASK |
+                                                       IF_MASK | IOPL_MASK)
+                                                      & 0xffff));
+            }
+        } else {
+            if (CPL(s) <= IOPL(s)) {
+                if (s->dflag != MO_16) {
+                    gen_helper_write_eflags(cpu_env, s->T0,
+                                            tcg_const_i32((TF_MASK |
+                                                           AC_MASK |
+                                                           ID_MASK |
+                                                           NT_MASK |
+                                                           IF_MASK)));
+                } else {
+                    gen_helper_write_eflags(cpu_env, s->T0,
+                                            tcg_const_i32((TF_MASK |
+                                                           AC_MASK |
+                                                           ID_MASK |
+                                                           NT_MASK |
+                                                           IF_MASK)
+                                                          & 0xffff));
+                }
+            } else {
+                if (s->dflag != MO_16) {
+                    gen_helper_write_eflags(cpu_env, s->T0,
+                                       tcg_const_i32((TF_MASK | AC_MASK |
+                                                      ID_MASK | NT_MASK)));
+                } else {
+                    gen_helper_write_eflags(cpu_env, s->T0,
+                                       tcg_const_i32((TF_MASK | AC_MASK |
+                                                      ID_MASK | NT_MASK)
+                                                     & 0xffff));
+                }
+            }
+        }
+        gen_pop_update(s, ot);
+        set_cc_op(s, CC_OP_EFLAGS);
+        /* abort translation because TF/AC flag may change */
+        gen_jmp_im(s, s->pc - s->cs_base);
+        gen_eob(s);
+    }
+}
+
+static void gen_SAHF(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    if (CODE64(s) && !(s->cpuid_ext3_features & CPUID_EXT3_LAHF_LM)) {
+        return gen_illegal_opcode(s);
+    }
+    gen_op_mov_v_reg(s, MO_8, s->T0, R_AH);
+    gen_compute_eflags(s);
+    tcg_gen_andi_tl(cpu_cc_src, cpu_cc_src, CC_O);
+    tcg_gen_andi_tl(s->T0, s->T0, CC_S | CC_Z | CC_A | CC_P | CC_C);
+    tcg_gen_or_tl(cpu_cc_src, cpu_cc_src, s->T0);
+}
+
 static void gen_SBB(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     gen_alu_op(s, OP_SBBL, decode->op[0].ot);
@@ -414,6 +569,15 @@ static void gen_SUB(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     gen_alu_op(s, OP_SUBL, decode->op[0].ot);
 }
 
+static void gen_WAIT(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    if ((s->flags & (HF_MP_MASK | HF_TS_MASK)) == (HF_MP_MASK | HF_TS_MASK)) {
+        gen_exception(s, EXCP07_PREX, s->pc_start - s->cs_base);
+    } else {
+        gen_helper_fwait(cpu_env);
+    }
+}
+
 static void gen_XCHG(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     if (decode->b == 0x90 && !REX_B(s)) {
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 5c3742a9c7..b742e456b0 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2471,6 +2471,23 @@ static void gen_movl_seg_T0(DisasContext *s, X86Seg seg_reg)
     }
 }
 
+static void gen_far_call(DisasContext *s)
+{
+    if (PE(s) && !VM86(s)) {
+        tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
+        gen_helper_lcall_protected(cpu_env, s->tmp2_i32, s->T1,
+                                   tcg_const_i32(s->dflag - 1),
+                                   tcg_const_tl(s->pc - s->cs_base));
+    } else {
+        tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
+        gen_helper_lcall_real(cpu_env, s->tmp2_i32, s->T1,
+                              tcg_const_i32(s->dflag - 1),
+                              tcg_const_i32(s->pc - s->cs_base));
+    }
+    tcg_gen_ld_tl(s->tmp4, cpu_env, offsetof(CPUX86State, eip));
+    gen_jr(s, s->tmp4);
+}
+
 static void gen_svm_check_intercept(DisasContext *s, uint32_t type)
 {
     /* no SVM activated; fast case */
-- 
2.37.1



