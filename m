Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 449F15A00BF
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 19:52:16 +0200 (CEST)
Received: from localhost ([::1]:35364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQuY3-0006cK-BQ
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 13:52:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oQuFU-0002MQ-3Q
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:33:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oQuFS-0003tC-4a
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:33:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661362381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O01Ev6yrVLoTfgoKbRtpaLHDGtEd7GHlvPRBgqxlJ/A=;
 b=WmlhQlWfgMpPBZby25+agAEX26GAV16MJm+Eemz4wZuzSVCR5iCzxZ58WrlnPkAdJ23EW5
 siuVUybWgnYBo/mXmJ5CnpeXJ6mka/gVwz5c6Se5985BhFdNueYb0EQTpFY5DSoNfxpIYV
 4UyyujxyoSqHLxKqGYtm3sEqvg33QNo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-gHygem8kPNqzneqUQeWbkw-1; Wed, 24 Aug 2022 13:33:00 -0400
X-MC-Unique: gHygem8kPNqzneqUQeWbkw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B079785A58A;
 Wed, 24 Aug 2022 17:32:59 +0000 (UTC)
Received: from avogadro.redhat.com (unknown [10.39.192.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F0A9C492C3B;
 Wed, 24 Aug 2022 17:32:58 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH 14/17] target/i386: add a0-a7, b0-b7 opcodes
Date: Wed, 24 Aug 2022 19:32:47 +0200
Message-Id: <20220824173250.232491-8-pbonzini@redhat.com>
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
 target/i386/tcg/emit.c.inc       | 22 ++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 07a2aea540..3d96ac3adb 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -592,8 +592,24 @@ static X86OpEntry A2_00_F7[16][8] = {
         X86_OP_ENTRY2(XCHG, 0,v, LoBits,v),
     },
     {
+        X86_OP_ENTRY3(MOV, 0,b, O,b, None, None), /* AL, Ob */
+        X86_OP_ENTRY3(MOV, 0,v, O,v, None, None), /* rAX, Ov */
+        X86_OP_ENTRY3(MOV, O,b, 0,b, None, None), /* Ob, AL */
+        X86_OP_ENTRY3(MOV, O,v, 0,v, None, None), /* Ov, rAX */
+        X86_OP_ENTRY2(MOVS, Y,b, X,b),
+        X86_OP_ENTRY2(MOVS, Y,v, X,v),
+        X86_OP_ENTRY2(CMPS, Y,b, X,b),
+        X86_OP_ENTRY2(CMPS, Y,v, X,v),
     },
     {
+        X86_OP_ENTRY3(MOV, LoBits,b, I,b, None, None),
+        X86_OP_ENTRY3(MOV, LoBits,b, I,b, None, None),
+        X86_OP_ENTRY3(MOV, LoBits,b, I,b, None, None),
+        X86_OP_ENTRY3(MOV, LoBits,b, I,b, None, None),
+        X86_OP_ENTRY3(MOV, LoBits,b, I,b, None, None),
+        X86_OP_ENTRY3(MOV, LoBits,b, I,b, None, None),
+        X86_OP_ENTRY3(MOV, LoBits,b, I,b, None, None),
+        X86_OP_ENTRY3(MOV, LoBits,b, I,b, None, None),
     },
     {
     },
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 80f6541464..9395474302 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -227,6 +227,18 @@ static void gen_BOUND(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     }
 }
 
+static void gen_CMPS(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    MemOp ot = decode->op[0].ot;
+    if (s->prefix & PREFIX_REPNZ) {
+        gen_repz_cmps(s, ot, s->pc_start - s->cs_base, s->pc - s->cs_base, 1);
+    } else if (s->prefix & PREFIX_REPZ) {
+        gen_repz_cmps(s, ot, s->pc_start - s->cs_base, s->pc - s->cs_base, 0);
+    } else {
+        gen_cmps(s, ot);
+    }
+}
+
 static void gen_DAA(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     gen_update_cc_op(s);
@@ -327,6 +339,16 @@ static void gen_MOV(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 }
 #define gen_NOP gen_MOV
 
+static void gen_MOVS(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    MemOp ot = decode->op[0].ot;
+    if (s->prefix & (PREFIX_REPZ | PREFIX_REPNZ)) {
+        gen_repz_movs(s, ot, s->pc_start - s->cs_base, s->pc - s->cs_base);
+    } else {
+        gen_movs(s, ot);
+    }
+}
+
 static void gen_MOVSXD(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     tcg_gen_ext32s_tl(s->T0, s->T0);
-- 
2.37.1



