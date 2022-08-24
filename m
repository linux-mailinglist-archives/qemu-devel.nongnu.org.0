Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D38525A00DD
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 19:58:49 +0200 (CEST)
Received: from localhost ([::1]:52144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQueO-0002qL-VB
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 13:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oQuFU-0002MP-1k
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:33:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oQuFS-0003tH-FD
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:33:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661362381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZR3KtubM+ygoifWMUZlCu4WaYwuD+MLGcsh3q5pZDdU=;
 b=bkcPECW1KAlS/M1SLpvbOsnOWg6fUyXHo8Zx6PZi+6L2stRhP3OLpz9P6lFkQGIaeTT6+5
 2aR2dfFcL/MXA4mYY3jh71AzUBWPsJ/o4HNsPeNaHbTqWApHNX6Z+BtqS0SDwipUXFp8tz
 iEsIEAVv2rYHWvboXFhkSpUsEFc8GDw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-XvQ3bi32ME6xRD7-6e3p9A-1; Wed, 24 Aug 2022 13:32:58 -0400
X-MC-Unique: XvQ3bi32ME6xRD7-6e3p9A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 72CA11C14D3D;
 Wed, 24 Aug 2022 17:32:52 +0000 (UTC)
Received: from avogadro.redhat.com (unknown [10.39.192.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F1C2492C3B;
 Wed, 24 Aug 2022 17:32:51 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH 07/17] target/i386: add 20-27, 30-37 opcodes
Date: Wed, 24 Aug 2022 19:32:40 +0200
Message-Id: <20220824173250.232491-1-pbonzini@redhat.com>
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
 target/i386/tcg/decode-new.c.inc | 16 ++++++++++++++++
 target/i386/tcg/emit.c.inc       | 33 ++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index b1e849b332..de0364ac87 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -484,8 +484,24 @@ static X86OpEntry A2_00_F7[16][8] = {
         X86_OP_ENTRYw(POP, SS, w, i64)
     },
     {
+        X86_OP_ENTRY2(AND, E,b, G,b),
+        X86_OP_ENTRY2(AND, E,v, G,v),
+        X86_OP_ENTRY2(AND, G,b, E,b),
+        X86_OP_ENTRY2(AND, G,v, E,v),
+        X86_OP_ENTRY2(AND, 0,b, I,b),   /* AL, Ib */
+        X86_OP_ENTRY2(AND, 0,v, I,z),   /* rAX, Iz */
+        {},
+        X86_OP_ENTRY0(DAA, i64),
     },
     {
+        X86_OP_ENTRY2(XOR, E,b, G,b),
+        X86_OP_ENTRY2(XOR, E,v, G,v),
+        X86_OP_ENTRY2(XOR, G,b, E,b),
+        X86_OP_ENTRY2(XOR, G,v, E,v),
+        X86_OP_ENTRY2(XOR, 0,b, I,b),   /* AL, Ib */
+        X86_OP_ENTRY2(XOR, 0,v, I,z),   /* rAX, Iz */
+        {},
+        X86_OP_ENTRY0(AAA, i64),
     },
     {
     },
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 1f799d1f18..33469098c2 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -125,6 +125,13 @@ static void gen_alu_op(DisasContext *s1, int op, MemOp ot)
     }
 }
 
+static void gen_AAA(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_update_cc_op(s);
+    gen_helper_aaa(cpu_env);
+    set_cc_op(s, CC_OP_EFLAGS);
+}
+
 static void gen_ADC(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     gen_alu_op(s, OP_ADCL, decode->op[0].ot);
@@ -135,6 +142,18 @@ static void gen_ADD(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     gen_alu_op(s, OP_ADDL, decode->op[0].ot);
 }
 
+static void gen_AND(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_alu_op(s, OP_ANDL, decode->op[0].ot);
+}
+
+static void gen_DAA(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_update_cc_op(s);
+    gen_helper_daa(cpu_env);
+    set_cc_op(s, CC_OP_EFLAGS);
+}
+
 static void gen_OR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     gen_alu_op(s, OP_ORL, decode->op[0].ot);
@@ -157,6 +176,20 @@ static void gen_SBB(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     gen_alu_op(s, OP_SBBL, decode->op[0].ot);
 }
 
+static void gen_XOR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    /* special case XOR reg, reg */
+    if (decode->op[1].alu_op_type == X86_ALU_GPR &&
+        decode->op[2].alu_op_type == X86_ALU_GPR &&
+        decode->op[1].n == decode->op[2].n) {
+        tcg_gen_movi_tl(s->T0, 0);
+        gen_op_update1_cc(s);
+        set_cc_op(s, CC_OP_LOGICB + decode->op[0].ot);
+    } else {
+        gen_alu_op(s, OP_XORL, decode->op[0].ot);
+    }
+}
+
 static void gen_writeback(DisasContext *s, X86DecodedOp *op)
 {
     switch (op->alu_op_type) {
-- 
2.37.1



