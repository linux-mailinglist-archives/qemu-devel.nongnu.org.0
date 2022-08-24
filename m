Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DED55A00AC
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 19:47:00 +0200 (CEST)
Received: from localhost ([::1]:51932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQuSx-0000rA-0A
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 13:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oQuFY-0002Md-Ln
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:33:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oQuFX-0003uf-0E
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:33:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661362386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ujtgSY45ospJjakzud3ukSnLoFm01n4BLS2olICm0ug=;
 b=achZNCTXM0k/YXCOw4KNhoEhIHpwE55oAlPvN7tSrTfaxPa0ArZy3S0jAnQQ7foVwIrxOG
 h6EA16w8tCFoU+vrbKf/XJxEFCqdNU7JYWVeWoPRIjBc8nRLEZoKDmJT2b8t+KsmbYVJpV
 5pNzvqXV0oTrRt8iVWqTCrqGVNFwjOM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-vjBg0UPTM4uG4hiOolIwSA-1; Wed, 24 Aug 2022 13:33:03 -0400
X-MC-Unique: vjBg0UPTM4uG4hiOolIwSA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD6A41C05146;
 Wed, 24 Aug 2022 17:33:02 +0000 (UTC)
Received: from avogadro.redhat.com (unknown [10.39.192.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09F85492C3B;
 Wed, 24 Aug 2022 17:33:01 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH 17/17] target/i386: add a8-af, b8-bf opcodes
Date: Wed, 24 Aug 2022 19:32:50 +0200
Message-Id: <20220824173250.232491-11-pbonzini@redhat.com>
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
 target/i386/tcg/decode-new.c.inc | 16 +++++++++++++++
 target/i386/tcg/decode-old.c.inc |  2 +-
 target/i386/tcg/emit.c.inc       | 35 +++++++++++++++++++++++++++++++-
 3 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 1e607b68fa..832a8d8d25 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -742,8 +742,24 @@ static X86OpEntry A2_08_FF[16][8] = {
         X86_OP_ENTRY0(LAHF),
     },
     {
+        X86_OP_ENTRY2(AND, 0,b, I,b, nowb),   /* AL, Ib */
+        X86_OP_ENTRY2(AND, 0,v, I,z, nowb),   /* rAX, Iz */
+        X86_OP_ENTRY2(STOS, Y,b, 0,b),
+        X86_OP_ENTRY2(STOS, Y,v, 0,v),
+        X86_OP_ENTRY2(LODS, 0,b, X,b, nowb),
+        X86_OP_ENTRY2(LODS, 0,v, X,v, nowb),
+        X86_OP_ENTRY2(SCAS, 0,b, Y,b, nowb),
+        X86_OP_ENTRY2(SCAS, 0,v, Y,v, nowb),
     },
     {
+        X86_OP_ENTRY3(MOV, LoBits,v, I,v, None, None),
+        X86_OP_ENTRY3(MOV, LoBits,v, I,v, None, None),
+        X86_OP_ENTRY3(MOV, LoBits,v, I,v, None, None),
+        X86_OP_ENTRY3(MOV, LoBits,v, I,v, None, None),
+        X86_OP_ENTRY3(MOV, LoBits,v, I,v, None, None),
+        X86_OP_ENTRY3(MOV, LoBits,v, I,v, None, None),
+        X86_OP_ENTRY3(MOV, LoBits,v, I,v, None, None),
+        X86_OP_ENTRY3(MOV, LoBits,v, I,v, None, None),
     },
     {
     },
diff --git a/target/i386/tcg/decode-old.c.inc b/target/i386/tcg/decode-old.c.inc
index 69ce70d141..d17671b8eb 100644
--- a/target/i386/tcg/decode-old.c.inc
+++ b/target/i386/tcg/decode-old.c.inc
@@ -1822,7 +1822,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 #else
         use_new &= b <= limit;
 #endif
-        if (use_new && b <= 0x7f) {
+        if (use_new && b <= 0xbf) {
             return disas_insn_new(s, cpu, b);
         }
     case 0x0f:
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 22f2fbde79..1d4f63322e 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -229,7 +229,7 @@ static void gen_BOUND(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 
 static void gen_CALLF(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
-    MemOp ot = decode->op[1].ot;
+    MemOp ot = decode->op[2].ot;
     unsigned int selector, offset;
 
     if (CODE64(s)) {
@@ -237,6 +237,7 @@ static void gen_CALLF(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
         return;
     }
 
+    assert(ot >= MO_16);
     offset = insn_get(env, s, ot);
     selector = insn_get(env, s, MO_16);
     tcg_gen_movi_tl(s->T0, selector);
@@ -403,6 +404,16 @@ static void gen_LEA(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     tcg_gen_mov_tl(s->T0, s->A0);
 }
 
+static void gen_LODS(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    MemOp ot = decode->op[0].ot;
+    if (s->prefix & (PREFIX_REPZ | PREFIX_REPNZ)) {
+        gen_repz_lods(s, ot, s->pc_start - s->cs_base, s->pc - s->cs_base);
+    } else {
+        gen_lods(s, ot);
+    }
+}
+
 static void gen_MOV(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     /* nothing to do! */
@@ -564,6 +575,28 @@ static void gen_SBB(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     gen_alu_op(s, OP_SBBL, decode->op[0].ot);
 }
 
+static void gen_SCAS(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    MemOp ot = decode->op[0].ot;
+    if (s->prefix & PREFIX_REPNZ) {
+        gen_repz_scas(s, ot, s->pc_start - s->cs_base, s->pc - s->cs_base, 1);
+    } else if (s->prefix & PREFIX_REPZ) {
+        gen_repz_scas(s, ot, s->pc_start - s->cs_base, s->pc - s->cs_base, 0);
+    } else {
+        gen_scas(s, ot);
+    }
+}
+
+static void gen_STOS(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    MemOp ot = decode->op[0].ot;
+    if (s->prefix & (PREFIX_REPZ | PREFIX_REPNZ)) {
+        gen_repz_stos(s, ot, s->pc_start - s->cs_base, s->pc - s->cs_base);
+    } else {
+        gen_stos(s, ot);
+    }
+}
+
 static void gen_SUB(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     gen_alu_op(s, OP_SUBL, decode->op[0].ot);
-- 
2.37.1


