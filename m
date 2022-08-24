Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 679D75A011B
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 20:09:49 +0200 (CEST)
Received: from localhost ([::1]:60990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQup2-0006WI-Fz
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 14:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oQuFU-0002MR-59
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:33:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oQuFS-0003tF-E4
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:33:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661362381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9uWITMOtiY6eNGn2/dnUIhYVDhgI4ldRYfEla/S1e6M=;
 b=dfmRkENHtM9v1Np1O+h1NEIZgd1xZA0yLsHwazko3/5BtUgOUgAwfuZLlUfZwX+srCQR3q
 9X42v41GnjmKZbV7zy2IEawBokQ/rc/HbZPehHV8G14899NafUP+lfIK4ZqRLRW4GwAzGd
 MwdlHK3VNJamKswhj/4XrPP2LgNd/Hc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-IYWQ5qOONC6y2MtoxRc_eg-1; Wed, 24 Aug 2022 13:32:58 -0400
X-MC-Unique: IYWQ5qOONC6y2MtoxRc_eg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4E2E8039CF;
 Wed, 24 Aug 2022 17:32:57 +0000 (UTC)
Received: from avogadro.redhat.com (unknown [10.39.192.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4A28492C3B;
 Wed, 24 Aug 2022 17:32:56 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH 12/17] target/i386: add 68-6f, 78-7f opcodes
Date: Wed, 24 Aug 2022 19:32:45 +0200
Message-Id: <20220824173250.232491-6-pbonzini@redhat.com>
In-Reply-To: <20220824173123.232018-1-pbonzini@redhat.com>
References: <20220824173123.232018-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 target/i386/tcg/decode-new.c.inc | 16 ++++++
 target/i386/tcg/decode-old.c.inc |  2 +-
 target/i386/tcg/emit.c.inc       | 86 ++++++++++++++++++++++++++++++++
 3 files changed, 103 insertions(+), 1 deletion(-)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 161a3b1554..6892000aaf 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -637,8 +637,24 @@ static X86OpEntry A2_08_FF[16][8] = {
         X86_OP_ENTRYw(POP, LoBits,d64),
     },
     {
+        X86_OP_ENTRYr(PUSH, I,z),
+        X86_OP_ENTRY3(IMUL, G,v, E,v, I,z, nowb),
+        X86_OP_ENTRYr(PUSH, I,b),
+        X86_OP_ENTRY3(IMUL, G,v, E,v, I,b, nowb),
+        X86_OP_ENTRY2(INS, Y,b, 2,w, nowb), /* DX */
+        X86_OP_ENTRY2(INS, Y,z, 2,w, nowb), /* DX */
+        X86_OP_ENTRY2(OUTS, 2,w, X,b, nowb), /* DX */
+        X86_OP_ENTRY2(OUTS, 2,w, X,b, nowb), /* DX */
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
diff --git a/target/i386/tcg/decode-old.c.inc b/target/i386/tcg/decode-old.c.inc
index a297d126a4..7763bef11d 100644
--- a/target/i386/tcg/decode-old.c.inc
+++ b/target/i386/tcg/decode-old.c.inc
@@ -1821,7 +1821,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 #else
         use_new &= b <= limit;
 #endif
-        if (use_new && b <= 0x5f) {
+        if (use_new && b <= 0x7f) {
             return disas_insn_new(s, cpu, b);
         }
     case 0x0f:
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index cf606e74c7..ae82ebd8c9 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -246,11 +246,74 @@ static void gen_DEC(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     gen_alu_op(s, OP_DECL, decode->op[0].ot);
 }
 
+static void gen_IMUL(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int reg = decode->op[0].n;
+    MemOp ot = decode->op[0].ot;
+
+    switch (ot) {
+#ifdef TARGET_X86_64
+    case MO_64:
+        tcg_gen_muls2_i64(cpu_regs[reg], s->T1, s->T0, s->T1);
+        tcg_gen_mov_tl(cpu_cc_dst, cpu_regs[reg]);
+        tcg_gen_sari_tl(cpu_cc_src, cpu_cc_dst, 63);
+        tcg_gen_sub_tl(cpu_cc_src, cpu_cc_src, s->T1);
+        break;
+#endif
+    case MO_32:
+        tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
+        tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
+        tcg_gen_muls2_i32(s->tmp2_i32, s->tmp3_i32,
+                          s->tmp2_i32, s->tmp3_i32);
+        tcg_gen_extu_i32_tl(cpu_regs[reg], s->tmp2_i32);
+        tcg_gen_sari_i32(s->tmp2_i32, s->tmp2_i32, 31);
+        tcg_gen_mov_tl(cpu_cc_dst, cpu_regs[reg]);
+        tcg_gen_sub_i32(s->tmp2_i32, s->tmp2_i32, s->tmp3_i32);
+        tcg_gen_extu_i32_tl(cpu_cc_src, s->tmp2_i32);
+        break;
+    default:
+        tcg_gen_ext16s_tl(s->T0, s->T0);
+        tcg_gen_ext16s_tl(s->T1, s->T1);
+        /* XXX: use 32 bit mul which could be faster */
+        tcg_gen_mul_tl(s->T0, s->T0, s->T1);
+        tcg_gen_mov_tl(cpu_cc_dst, s->T0);
+        tcg_gen_ext16s_tl(s->tmp0, s->T0);
+        tcg_gen_sub_tl(cpu_cc_src, s->T0, s->tmp0);
+        gen_op_mov_reg_v(s, ot, reg, s->T0);
+        break;
+    }
+    set_cc_op(s, CC_OP_MULB + ot);
+}
+
 static void gen_INC(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     gen_alu_op(s, OP_INCL, decode->op[0].ot);
 }
 
+static void gen_INS(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    MemOp ot = decode->op[0].ot;
+
+    tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T1);
+    if (!gen_check_io(s, ot, s->tmp2_i32,
+                      SVM_IOIO_TYPE_MASK | SVM_IOIO_STR_MASK)) {
+        return;
+    }
+
+   if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+       gen_io_start();
+   }
+   if (s->prefix & (PREFIX_REPZ | PREFIX_REPNZ)) {
+        gen_repz_ins(s, ot, s->pc_start - s->cs_base, s->pc - s->cs_base);
+        /* jump generated by gen_repz_ins */
+    } else {
+        gen_ins(s, ot);
+        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+            gen_jmp(s, s->pc - s->cs_base);
+        }
+    }
+}
+
 static void gen_Jcc(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     target_ulong next_eip = s->pc - s->cs_base;
@@ -273,6 +336,29 @@ static void gen_OR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     gen_alu_op(s, OP_ORL, decode->op[0].ot);
 }
 
+static void gen_OUTS(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    MemOp ot = decode->op[1].ot;
+
+    tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
+    if (!gen_check_io(s, ot, s->tmp2_i32, SVM_IOIO_STR_MASK)) {
+        return;
+    }
+
+   if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+       gen_io_start();
+   }
+   if (s->prefix & (PREFIX_REPZ | PREFIX_REPNZ)) {
+        gen_repz_outs(s, ot, s->pc_start - s->cs_base, s->pc - s->cs_base);
+        /* jump generated by gen_repz_ins */
+    } else {
+        gen_outs(s, ot);
+        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+            gen_jmp(s, s->pc - s->cs_base);
+        }
+    }
+}
+
 static void gen_PUSH(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     gen_push_v(s, decode->op[2].v);
-- 
2.37.1



