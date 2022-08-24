Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CE45A00F0
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 20:01:21 +0200 (CEST)
Received: from localhost ([::1]:36040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQugq-00053z-U5
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 14:01:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oQuFT-0002MO-OF
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:33:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oQuFQ-0003t0-Gl
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:33:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661362379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PfHaoeYWXQaNbEs0kkSmT2yUAiN+SwsqZo3imONtK4g=;
 b=LiukM918o54ep8Z2YvPTDwPVF6NkIIyrgU10cWxXYRlMf26VYdf7P3DcYnFO/IrmNHKUhq
 SmraOObys4kAihjQotX2PKtBCBRdb7iEDcmjKVUav2JZxXIysQDi9TDbMY8lEh//ElI5En
 Cd5hWVhXYXF8FICVxBiG41Zp7jfXnAo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-5UBQPDNQP6OmWIVUAYbWSQ-1; Wed, 24 Aug 2022 13:32:56 -0400
X-MC-Unique: 5UBQPDNQP6OmWIVUAYbWSQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 793BD856D4A;
 Wed, 24 Aug 2022 17:32:53 +0000 (UTC)
Received: from avogadro.redhat.com (unknown [10.39.192.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B677F492CA6;
 Wed, 24 Aug 2022 17:32:52 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH 08/17] target/i386: add 28-2f, 38-3f opcodes
Date: Wed, 24 Aug 2022 19:32:41 +0200
Message-Id: <20220824173250.232491-2-pbonzini@redhat.com>
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
 target/i386/tcg/decode-old.c.inc |  2 +-
 target/i386/tcg/emit.c.inc       | 22 ++++++++++++++++++++--
 3 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index de0364ac87..c94cd7ac61 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -551,8 +551,24 @@ static X86OpEntry A2_08_FF[16][8] = {
         X86_OP_ENTRYw(POP, DS, w, i64)
     },
     {
+        X86_OP_ENTRY2(SUB, E,b, G,b),
+        X86_OP_ENTRY2(SUB, E,v, G,v),
+        X86_OP_ENTRY2(SUB, G,b, E,b),
+        X86_OP_ENTRY2(SUB, G,v, E,v),
+        X86_OP_ENTRY2(SUB, 0,b, I,b),   /* AL, Ib */
+        X86_OP_ENTRY2(SUB, 0,v, I,z),   /* rAX, Iz */
+        {},
+        X86_OP_ENTRY0(DAS, i64),
     },
     {
+        X86_OP_ENTRY2(SUB, E,b, G,b, nowb),
+        X86_OP_ENTRY2(SUB, E,v, G,v, nowb),
+        X86_OP_ENTRY2(SUB, G,b, E,b, nowb),
+        X86_OP_ENTRY2(SUB, G,v, E,v, nowb),
+        X86_OP_ENTRY2(SUB, 0,b, I,b, nowb),   /* AL, Ib */
+        X86_OP_ENTRY2(SUB, 0,v, I,z, nowb),   /* rAX, Iz */
+        {},
+        X86_OP_ENTRY0(AAS, i64),
     },
     {
     },
diff --git a/target/i386/tcg/decode-old.c.inc b/target/i386/tcg/decode-old.c.inc
index 937975f69a..28edb62b5b 100644
--- a/target/i386/tcg/decode-old.c.inc
+++ b/target/i386/tcg/decode-old.c.inc
@@ -1821,7 +1821,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 #else
         use_new &= b <= limit;
 #endif
-        if (use_new && b <= 0x1f) {
+        if (use_new && b <= 0x3f) {
             return disas_insn_new(s, cpu, b);
         }
     case 0x0f:
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 33469098c2..e247b542ed 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -132,6 +132,13 @@ static void gen_AAA(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     set_cc_op(s, CC_OP_EFLAGS);
 }
 
+static void gen_AAS(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_update_cc_op(s);
+    gen_helper_aas(cpu_env);
+    set_cc_op(s, CC_OP_EFLAGS);
+}
+
 static void gen_ADC(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     gen_alu_op(s, OP_ADCL, decode->op[0].ot);
@@ -154,6 +161,13 @@ static void gen_DAA(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     set_cc_op(s, CC_OP_EFLAGS);
 }
 
+static void gen_DAS(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_update_cc_op(s);
+    gen_helper_das(cpu_env);
+    set_cc_op(s, CC_OP_EFLAGS);
+}
+
 static void gen_OR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     gen_alu_op(s, OP_ORL, decode->op[0].ot);
@@ -176,6 +190,11 @@ static void gen_SBB(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     gen_alu_op(s, OP_SBBL, decode->op[0].ot);
 }
 
+static void gen_SUB(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_alu_op(s, OP_SUBL, decode->op[0].ot);
+}
+
 static void gen_XOR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     /* special case XOR reg, reg */
@@ -183,8 +202,7 @@ static void gen_XOR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
         decode->op[2].alu_op_type == X86_ALU_GPR &&
         decode->op[1].n == decode->op[2].n) {
         tcg_gen_movi_tl(s->T0, 0);
-        gen_op_update1_cc(s);
-        set_cc_op(s, CC_OP_LOGICB + decode->op[0].ot);
+        set_cc_op(s, CC_OP_CLR);
     } else {
         gen_alu_op(s, OP_XORL, decode->op[0].ot);
     }
-- 
2.37.1



