Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C6C5A00C6
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 19:54:45 +0200 (CEST)
Received: from localhost ([::1]:52824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQuaS-0003r8-Sv
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 13:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oQuFW-0002MX-DO
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:33:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oQuFS-0003tM-Fv
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:33:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661362381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5apes9ls557TerR9QLvaPcikDx0UWLOUdclITOc3I1c=;
 b=e8TPXeuT07V3vEVUkcwYtNoMmP1bvTZL3RbLjqAWxmxj15E0oZBJYswMhR4sOZgh6a75XY
 swnc5TmlNxac1wffvsSBf9x6Hlzv+n1npCh8aqThLyTTG/Uw6T3G4+FGMMGyuQuHM61d/j
 Y6Khsp5c1Vw78YGPGCYIxGUWaO69iFU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-FjDOq8r5NPWct65s007DmQ-1; Wed, 24 Aug 2022 13:32:56 -0400
X-MC-Unique: FjDOq8r5NPWct65s007DmQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E390280EA24;
 Wed, 24 Aug 2022 17:32:55 +0000 (UTC)
Received: from avogadro.redhat.com (unknown [10.39.192.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD3E7492CA5;
 Wed, 24 Aug 2022 17:32:54 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH 10/17] target/i386: add 48-4f, 58-5f opcodes
Date: Wed, 24 Aug 2022 19:32:43 +0200
Message-Id: <20220824173250.232491-4-pbonzini@redhat.com>
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
 target/i386/tcg/emit.c.inc       |  5 +++++
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index bbd6ef07a1..586894e4ee 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -587,8 +587,24 @@ static X86OpEntry A2_08_FF[16][8] = {
         X86_OP_ENTRY0(AAS, i64),
     },
     {
+        X86_OP_ENTRY1(DEC, 0,v, i64),
+        X86_OP_ENTRY1(DEC, 1,v, i64),
+        X86_OP_ENTRY1(DEC, 2,v, i64),
+        X86_OP_ENTRY1(DEC, 3,v, i64),
+        X86_OP_ENTRY1(DEC, 4,v, i64),
+        X86_OP_ENTRY1(DEC, 5,v, i64),
+        X86_OP_ENTRY1(DEC, 6,v, i64),
+        X86_OP_ENTRY1(DEC, 7,v, i64),
     },
     {
+        X86_OP_ENTRYw(POP, LoBits,d64),
+        X86_OP_ENTRYw(POP, LoBits,d64),
+        X86_OP_ENTRYw(POP, LoBits,d64),
+        X86_OP_ENTRYw(POP, LoBits,d64),
+        X86_OP_ENTRYw(POP, LoBits,d64),
+        X86_OP_ENTRYw(POP, LoBits,d64),
+        X86_OP_ENTRYw(POP, LoBits,d64),
+        X86_OP_ENTRYw(POP, LoBits,d64),
     },
     {
     },
diff --git a/target/i386/tcg/decode-old.c.inc b/target/i386/tcg/decode-old.c.inc
index 28edb62b5b..a297d126a4 100644
--- a/target/i386/tcg/decode-old.c.inc
+++ b/target/i386/tcg/decode-old.c.inc
@@ -1821,7 +1821,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 #else
         use_new &= b <= limit;
 #endif
-        if (use_new && b <= 0x3f) {
+        if (use_new && b <= 0x5f) {
             return disas_insn_new(s, cpu, b);
         }
     case 0x0f:
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index d3d0f893fb..a76d6820e1 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -191,6 +191,11 @@ static void gen_DAS(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     set_cc_op(s, CC_OP_EFLAGS);
 }
 
+static void gen_DEC(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_alu_op(s, OP_DECL, decode->op[0].ot);
+}
+
 static void gen_INC(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     gen_alu_op(s, OP_INCL, decode->op[0].ot);
-- 
2.37.1



